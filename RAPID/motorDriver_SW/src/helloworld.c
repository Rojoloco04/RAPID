#include "xgpio.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "platform.h"
#include "sleep.h"

#include <stdio.h>
#include <stdint.h>

/*
#define GPIO_MASK 0x7F

XGpio gpio;

int input_check(const char* prompt, int min, int max)
{
    char buf[16];
    int idx = 0;
    int value;

    while (1) {
        xil_printf("%s", prompt);
        idx = 0;

        while (1) {
            char c = inbyte();   // blocking UART read

            if (c == '\r' || c == '\n') {
                buf[idx] = '\0';
                xil_printf("\r\n");
                break;
            }

            // handle backspace
            if ((c == 0x08 || c == 0x7F) && idx > 0) {
                idx--;
                xil_printf("\b \b");
                continue;
            }

            if (idx < sizeof(buf) - 1) {
                buf[idx++] = c;
                xil_printf("%c", c); // echo
            }
        }

        if (sscanf(buf, "%d", &value) == 1 && value >= min && value <= max) {
            return value;
        }

        xil_printf("Invalid input. Please enter value between %d and %d.\r\n", min, max);
    }
}


void help_query(){
       xil_printf("\r\nValid commands:\
                \r\nS - adjust spindle speed\
                \r\nD - invert spindle direction\
                \r\nP - toggle spindle power\
                \r\nR - reset stepper\
                \r\nQ - toggle stepper power\
                \r\nH - print help commands\r\n");
}

int main()
{
    init_platform();

    int Status;
    u32 config = 0x00000000;
    char command;


    // initialize GPIO
    Status = XGpio_Initialize(&gpio, 0);
    if (Status != XST_SUCCESS) {
        xil_printf("GPIO Initialization Failed: %d\r\n", Status);
        return XST_FAILURE;
    }

    // Channel 1 as outputs
    XGpio_SetDataDirection(&gpio, 1, 0x00000000);

    int spindleSpeed = input_check("\r\nEnter spindle speed (0-3): ", 0, 3);
    int spindleDir = input_check("\r\nEnter spindle direction (0 = backwards, 1 = forwards): ", 0, 1);
    int spindleEn = input_check("\r\nEnable spindle? (0 = disable, 1 = enable): ", 0, 1);
    int stepperDir = input_check("\r\nEnter stepper direction (0 = backwards, 1 = forwards): ", 0, 1);
    int stepperEn = input_check("\r\nEnable stepper? (0 = disable, 1 = enable): ", 0, 1);

    // Pack into config byte
    config |= (spindleSpeed & 0x03) << 0;  // bits 0–1
    config |= (spindleDir   & 0x01) << 2;  // bit 2
    config |= (spindleEn    & 0x01) << 3;  // bit 3
    config |= (stepperDir   & 0x01) << 4;  // bit 4
    config |= (stepperEn    & 0x01) << 5;  // bit 5

    XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK); // write config to register
    u32 rb = XGpio_DiscreteRead(&gpio, 1); // readback for debug
    xil_printf("\r\nConfiguration entered: wrote %02x, read %02x\r\n", config & GPIO_MASK, rb & GPIO_MASK);

    help_query();
    
    while (1) {
        scanf(" %c", &command);

        // reset stepper
        if (command == 'R' || command ==  'r') {

            config |= (1 << 6);
            xil_printf("Stepper reset triggered!\r\n");
            XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);

            config &= ~(1 << 6);
            XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);
            
            // debug
            // u32 rb_reset = XGpio_DiscreteRead(&gpio, 1);
            // xil_printf("After reset pulse, read %02x\r\n", rb_reset & GPIO_MASK);
        }

        // adjust spindle speed
        else if (command == 'S' || command == 's') {
            int dutycycle_check;
            spindleSpeed = input_check("\r\nEnter new spindle speed (0-3): ", 0, 3);

            config &= ~0x03;
            config |= (spindleSpeed & 0x03);

            switch(spindleSpeed){
                case 0:
                    dutycycle_check = 25;
                    break;
                case 1:
                    dutycycle_check = 50;
                    break;
                case 2:
                    dutycycle_check = 75;
                    break;
                case 3:
                    dutycycle_check = 100;
                    break;
                default:
                    dutycycle_check = 100;

            }

            xil_printf("Spindle speed updated to %d%% duty cycle!\r\n", dutycycle_check);
            XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);

            // debug
            // u32 rb_speed = XGpio_DiscreteRead(&gpio, 1);
            // xil_printf("Speed write readback %02x\r\n", rb_speed & GPIO_MASK);
        }

        // invert spindle direction
        else if (command == 'D' || command == 'd') {
            xil_printf("Inverting spindle direction\r\n");
            
            config &= ~(1 << 3); // disable spindle
            XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);

            config ^= (1 << 2); // flip spindle direction (bit 2)
            XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);

            usleep(50000); // 50ms
            
            config |= (1 << 3); // enable spindle
            XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);
        }

        else if (command == 'P' || command == 'p') {
            xil_printf("Toggling spindle power\r\n");

            config ^= (1 << 3); // toggle spindle
            XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);
        }

        else if (command == 'Q' || command == 'q') {
            xil_printf("Toggling stepper power\r\n");

            config ^= (1 << 5); // toggle stepper
            XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);
        }

        else if (command == 'H' || command == 'h') {
            help_query();
        }

        else { xil_printf("Invalid command\r\n"); }
    }

    cleanup_platform();
    return 0;
}
*/

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