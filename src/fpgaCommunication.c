/*
 * fpgaCommunication.c – FPGA-side UART receiver for the RAPID system.
 *
 * Runs on the Zynq PS (ARM Cortex-A9).  Listens on the PS UART for
 * framed polar-coordinate point packets sent by the PC (transmission.exe),
 * validates each packet's CRC, and echoes the payload back as an ACK so
 * the sender knows the point was received.
 *
 * Wire format (shared with pcCommunication.c):
 *   SOF (0xAA 0x55) | TYPE (1 B) | LEN (1 B) | PAYLOAD (LEN B) | CRC8
 *
 * Incoming (PC → FPGA):
 *   TYPE 0x01, LEN 0x08 – polar point
 *     r_nm       (int32, little-endian, nanometres)
 *     theta_udeg (int32, little-endian, microdegrees)
 *
 * Outgoing (FPGA → PC):
 *   TYPE 0x81, LEN 0x08 – ACK (echo of the received payload)
 */

#include "platform.h"
#include "xparameters.h"
#include "xuartps.h"
#include "xuartps_hw.h"

#include <stdint.h>

/* ------------------------------------------------------------------ */
/*  Constants                                                         */
/* ------------------------------------------------------------------ */

#define UART_BASEADDR  XPAR_XUARTPS_0_BASEADDR
#define BAUD_RATE      115200

#define SOF_BYTE_1     0xAA
#define SOF_BYTE_2     0x55
#define TYPE_POINT     0x01   /* incoming polar-point payload */
#define TYPE_ACK       0x81   /* outgoing acknowledgement     */
#define POINT_LEN      0x08   /* payload size for a point     */
#define MAX_PAYLOAD    255    /* maximum payload length       */

/* ------------------------------------------------------------------ */
/*  Module-level state                                                */
/* ------------------------------------------------------------------ */

static XUartPs Uart_Ps;

/* ------------------------------------------------------------------ */
/*  CRC / serialisation helpers                                       */
/* ------------------------------------------------------------------ */

/** XOR-based CRC-8 over a byte buffer. */
static uint8_t crc8_xor(const uint8_t *data, unsigned len)
{
    uint8_t c = 0;
    for (unsigned i = 0; i < len; i++)
        c ^= data[i];
    return c;
}

/** Unpack 4 little-endian bytes into a 32-bit signed integer. */
static int32_t unpack_i32_le(const uint8_t b[4])
{
    return (int32_t)(
        ((uint32_t)b[0])       |
        ((uint32_t)b[1] << 8)  |
        ((uint32_t)b[2] << 16) |
        ((uint32_t)b[3] << 24)
    );
}

/* ------------------------------------------------------------------ */
/*  Low-level UART I/O (polled, no interrupts)                        */
/* ------------------------------------------------------------------ */

/** Transmit a buffer byte-by-byte through the PS UART (polled mode). */
static void uart_send(XUartPs *uart, const uint8_t *buf, unsigned len)
{
    UINTPTR base = uart->Config.BaseAddress;
    for (unsigned i = 0; i < len; i++)
        XUartPs_SendByte(base, buf[i]);
}

/** Spin until the TX FIFO and shift register are both empty. */
static void uart_flush_tx(XUartPs *uart)
{
    UINTPTR base = uart->Config.BaseAddress;
    while (!(XUartPs_ReadReg(base, XUARTPS_SR_OFFSET) & XUARTPS_SR_TXEMPTY))
        ;
}

/** Block until exactly one byte is received. */
static uint8_t uart_recv_byte(XUartPs *uart)
{
    uint8_t b;
    while (XUartPs_Recv(uart, &b, 1) != 1)
        ;
    return b;
}

/* ------------------------------------------------------------------ */
/*  Framed packet TX                                                  */
/* ------------------------------------------------------------------ */

/**
 * Build and transmit a framed response packet.
 *
 * Frame layout: SOF(2) | type(1) | len(1) | payload(len) | CRC8(1)
 * CRC is computed over [type, len, payload...].
 */
static void send_frame(XUartPs *uart, uint8_t type,
                        const uint8_t *payload, uint8_t len)
{
    uint8_t hdr[4] = { SOF_BYTE_1, SOF_BYTE_2, type, len };

    /* compute CRC over type + len + payload */
    uint8_t crc = type ^ len;
    for (uint8_t i = 0; i < len; i++)
        crc ^= payload[i];

    uart_send(uart, hdr, sizeof(hdr));
    if (len)
        uart_send(uart, payload, len);
    uart_send(uart, &crc, 1);
    uart_flush_tx(uart);   /* ensure frame is fully on the wire */
}

/* ------------------------------------------------------------------ */
/*  Main receive loop                                                 */
/* ------------------------------------------------------------------ */

/**
 * Continuously receive framed packets from the PC.
 *
 * For each valid point packet (TYPE_POINT) the full payload is echoed
 * back as an ACK (TYPE_ACK) so the PC sender can advance to the next
 * point (stop-and-wait flow control).
 *
 * Invalid CRC frames are silently dropped.
 */
static void receive_loop(XUartPs *uart)
{
    for (;;) {
        /* ---- synchronise on SOF ---- */
        if (uart_recv_byte(uart) != SOF_BYTE_1) continue;
        if (uart_recv_byte(uart) != SOF_BYTE_2) continue;

        /* ---- read header ---- */
        uint8_t type = uart_recv_byte(uart);
        uint8_t len  = uart_recv_byte(uart);

        /* ---- read payload ---- */
        uint8_t payload[MAX_PAYLOAD];
        for (uint8_t i = 0; i < len; i++)
            payload[i] = uart_recv_byte(uart);

        /* ---- read and verify CRC ---- */
        uint8_t rx_crc = uart_recv_byte(uart);

        uint8_t chk[2 + MAX_PAYLOAD];
        chk[0] = type;
        chk[1] = len;
        for (uint8_t i = 0; i < len; i++)
            chk[2 + i] = payload[i];

        if (crc8_xor(chk, 2u + len) != rx_crc)
            continue;   /* CRC mismatch – drop frame */

        /* ---- dispatch valid packet ---- */
        if (type == TYPE_POINT && len == POINT_LEN) {
            /*
             * Decode the polar point (available for future control logic):
             *   int32_t r_nm       = unpack_i32_le(&payload[0]);
             *   int32_t theta_udeg = unpack_i32_le(&payload[4]);
             */

            /* echo the payload back as an ACK */
            send_frame(uart, TYPE_ACK, payload, POINT_LEN);
        }
    }
}

/* ------------------------------------------------------------------ */
/*  Entry point                                                       */
/* ------------------------------------------------------------------ */

int main(void)
{
    init_platform();

    /* ---- initialise PS UART ---- */
    XUartPs_Config *cfg = XUartPs_LookupConfig(UART_BASEADDR);
    if (!cfg)
        for (;;) ;   /* halt – no UART config found */

    if (XUartPs_CfgInitialize(&Uart_Ps, cfg, cfg->BaseAddress) != XST_SUCCESS)
        for (;;) ;   /* halt – UART init failed */

    XUartPs_SetBaudRate(&Uart_Ps, BAUD_RATE);
    XUartPs_SetOperMode(&Uart_Ps, XUARTPS_OPER_MODE_NORMAL);

    /* blocks forever, processing incoming point packets */
    receive_loop(&Uart_Ps);

    cleanup_platform();
    return 0;
}