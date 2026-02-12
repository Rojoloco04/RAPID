#include "platform.h"
#include "xparameters.h"
#include "xuartps.h"
#include "xuartps_hw.h"
#include <stdint.h>

#define UART_BASEADDR XPAR_XUARTPS_0_BASEADDR

static XUartPs Uart_Ps;

/*
Packet format:
  SOF (0xAA 0x55)  TYPE  LEN  PAYLOAD (LEN bytes)  CRC8 (XOR over TYPE+LEN+PAYLOAD)

RX point:
  TYPE 0x01, LEN 0x08
    r_nm       (int32 little-endian)
    theta_udeg (int32 little-endian)

TX ACK:
  TYPE 0x81, LEN 0x08 (echo of payload)
*/

static uint8_t crc8_xor(const uint8_t *data, unsigned len) {
    uint8_t c = 0;
    for (unsigned i = 0; i < len; i++) c ^= data[i];
    return c;
}

static int32_t unpack_i32_le(const uint8_t b[4]) {
    return (int32_t)(
        ((uint32_t)b[0]) |
        ((uint32_t)b[1] << 8) |
        ((uint32_t)b[2] << 16) |
        ((uint32_t)b[3] << 24)
    );
}

// Polled TX: byte-at-a-time (robust without interrupts)
static void uart_send_all_polled(XUartPs *Uart, const uint8_t *buf, unsigned len) {
    const UINTPTR base = Uart->Config.BaseAddress;
    for (unsigned i = 0; i < len; i++) {
        XUartPs_SendByte(base, buf[i]);
    }
}

// Wait until TX FIFO + shifter are empty (keeps back-to-back frames clean)
static void uart_wait_tx_empty(XUartPs *Uart) {
    const UINTPTR base = Uart->Config.BaseAddress;
    while ((XUartPs_ReadReg(base, XUARTPS_SR_OFFSET) & XUARTPS_SR_TXEMPTY) == 0) { }
}

static void uart_recv_byte_blocking(XUartPs *Uart, uint8_t *out) {
    while (XUartPs_Recv(Uart, out, 1) != 1) { }
}

static void send_frame(XUartPs *Uart, uint8_t type, const uint8_t *payload, uint8_t len) {
    uint8_t hdr[4] = { 0xAA, 0x55, type, len };

    uint8_t crc = 0;
    crc ^= type;
    crc ^= len;
    for (uint8_t i = 0; i < len; i++) crc ^= payload[i];

    uart_send_all_polled(Uart, hdr, (unsigned)sizeof(hdr));
    if (len) uart_send_all_polled(Uart, payload, (unsigned)len);
    uart_send_all_polled(Uart, &crc, 1);
    uart_wait_tx_empty(Uart);
}

static void receive_points_forever(XUartPs *Uart) {
    uint8_t b;

    for (;;) {
        // SOF
        uart_recv_byte_blocking(Uart, &b);
        if (b != 0xAA) continue;

        uart_recv_byte_blocking(Uart, &b);
        if (b != 0x55) continue;

        uint8_t type, len;
        uart_recv_byte_blocking(Uart, &type);
        uart_recv_byte_blocking(Uart, &len);

        if (len > 255) {
            continue;
        }

        uint8_t payload[255];
        for (uint8_t i = 0; i < len; i++) uart_recv_byte_blocking(Uart, &payload[i]);

        uint8_t crc;
        uart_recv_byte_blocking(Uart, &crc);

        // CRC check over [type][len][payload...]
        uint8_t chk[2 + 255];
        chk[0] = type;
        chk[1] = len;
        for (uint8_t i = 0; i < len; i++) chk[2 + i] = payload[i];

        if (crc8_xor(chk, (unsigned)(2 + len)) != crc) {
            continue; // drop bad frame
        }

        // Point frame -> ACK echo
        if (type == 0x01 && len == 0x08) {
            // Decode if/when you need it for control logic
            (void)unpack_i32_le(&payload[0]); // r_nm
            (void)unpack_i32_le(&payload[4]); // theta_udeg

            send_frame(Uart, 0x81, payload, 0x08);
        }
    }
}

int main(void) {
    int Status;
    XUartPs_Config *Config;

    init_platform();

    Config = XUartPs_LookupConfig(UART_BASEADDR);
    if (Config == NULL) while (1) { }

    Status = XUartPs_CfgInitialize(&Uart_Ps, Config, Config->BaseAddress);
    if (Status != XST_SUCCESS) while (1) { }

    XUartPs_SetBaudRate(&Uart_Ps, 115200);
    XUartPs_SetOperMode(&Uart_Ps, XUARTPS_OPER_MODE_NORMAL);

    receive_points_forever(&Uart_Ps);

    cleanup_platform();
    return 0;
}