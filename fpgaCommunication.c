#include "platform.h"
#include "xparameters.h"
#include "xuartps.h"
#include <stdint.h>

#define UART_BASEADDR XPAR_XUARTPS_0_BASEADDR

static XUartPs Uart_Ps;

/*
packet format:
SOF (0xAA 0x55)  TYPE  LEN  PAYLOAD (LEN bytes)  CRC8 (XOR over TYPE+LEN+PAYLOAD)

type 0x01, len 0x08 payload layout:
  r_nm       (int32 little-endian)
  theta_udeg (int32 little-endian)

FPGA replies (same framing):
  type 0x81 len 0x08 = ACK echo of payload
  type 0xF0 len N    = debug string
*/

// CRC8 XOR calculation
static uint8_t crc8_xor(const uint8_t *data, unsigned len) {
    uint8_t c = 0;
    for (unsigned i = 0; i < len; i++) c ^= data[i];
    return c;
}

// unpack 4 bytes (little-endian) into int32
static int32_t unpack_i32_le(const uint8_t b[4]) {
    return (int32_t)(
        ((uint32_t)b[0]) |
        ((uint32_t)b[1] << 8) |
        ((uint32_t)b[2] << 16) |
        ((uint32_t)b[3] << 24)
    );
}

// send buffer fully (XUartPs_Send may send fewer bytes than requested)
static void uart_send_all(XUartPs *Uart, const uint8_t *buf, unsigned len) {
    unsigned sent = 0;
    while (sent < len) {
        sent += (unsigned)XUartPs_Send(Uart, (u8 *)&buf[sent], len - sent);
    }
}

// blocking receive of 1 byte
static int uart_recv_byte(XUartPs *Uart, uint8_t *out) {
    while (XUartPs_Recv(Uart, out, 1) != 1) { }
    return 1;
}

// send a framed packet: SOF + TYPE + LEN + PAYLOAD + CRC
static void send_frame(XUartPs *Uart, uint8_t type, const uint8_t *payload, uint8_t len) {
    uint8_t hdr[4];
    hdr[0] = 0xAA;
    hdr[1] = 0x55;
    hdr[2] = type;
    hdr[3] = len;

    // CRC over [TYPE][LEN][PAYLOAD...]
    uint8_t crc = 0;
    crc ^= type;
    crc ^= len;
    for (uint8_t i = 0; i < len; i++) crc ^= payload[i];

    uart_send_all(Uart, hdr, sizeof(hdr));
    if (len) uart_send_all(Uart, payload, len);
    uart_send_all(Uart, &crc, 1);
}

// send short debug string as framed payload (type 0xF0)
static void send_debug_str(XUartPs *Uart, const char *s) {
    uint8_t payload[200];
    uint8_t len = 0;

    while (s[len] && len < (uint8_t)sizeof(payload)) {
        payload[len] = (uint8_t)s[len];
        len++;
    }

    send_frame(Uart, 0xF0, payload, len);
}

static void receive_points_forever(XUartPs *Uart) {
    uint8_t b;

    for (;;) {
        // SOF 0xAA 0x55
        uart_recv_byte(Uart, &b);
        if (b != 0xAA) continue;

        uart_recv_byte(Uart, &b);
        if (b != 0x55) continue;

        uint8_t type, len;
        uart_recv_byte(Uart, &type);
        uart_recv_byte(Uart, &len);

        // read payload
        uint8_t payload[255];
        for (uint8_t i = 0; i < len; i++) uart_recv_byte(Uart, &payload[i]);

        // read CRC
        uint8_t crc;
        uart_recv_byte(Uart, &crc);

        // validate CRC over [type][len][payload]
        uint8_t chk[2 + 255];
        chk[0] = type;
        chk[1] = len;
        for (uint8_t i = 0; i < len; i++) chk[2 + i] = payload[i];

        uint8_t expect = crc8_xor(chk, (unsigned)(2 + len));
        if (crc != expect) {
            send_debug_str(Uart, "CRC mismatch");
            continue;
        }

        // handle point frames
        if (type == 0x01 && len == 0x08) {
            int32_t r_nm       = unpack_i32_le(&payload[0]);
            int32_t theta_udeg = unpack_i32_le(&payload[4]);

            // send ACK echo back (type 0x81) with same payload
            send_frame(Uart, 0x81, payload, 0x08);

            // send debug as framed text (does NOT corrupt binary stream)
            send_debug_str(Uart, "RX point OK");

            // TODO: use r_nm and theta_udeg for motor control
            (void)r_nm;
            (void)theta_udeg;
        }
        else {
            send_debug_str(Uart, "Unknown frame type/len");
        }
    }
}

int main(void) {
    int Status;
    XUartPs_Config *Config;

    init_platform();

    Config = XUartPs_LookupConfig(UART_BASEADDR);
    if (Config == NULL) {
        // can't safely print to UART here; just hang
        while (1) { }
    }

    Status = XUartPs_CfgInitialize(&Uart_Ps, Config, Config->BaseAddress);
    if (Status != XST_SUCCESS) {
        while (1) { }
    }

    XUartPs_SetBaudRate(&Uart_Ps, 115200);
    XUartPs_SetOperMode(&Uart_Ps, XUARTPS_OPER_MODE_NORMAL);

    // one startup debug message (framed)
    send_debug_str(&Uart_Ps, "UART ready");

    receive_points_forever(&Uart_Ps);

    cleanup_platform();
    return 0;
}