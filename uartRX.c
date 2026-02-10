// UART receive onboard FPGA

#include <stdint.h>
#include "xuartps.h"
#include "xil_printf.h"

// receive bytes from UART bridge
static int uart_recv_byte(XUartPs *Uart, uint8_t *out) {
    while (XUartPs_Recv(Uart, out, 1) != 1) { }
    return 1;
}

// checksum validation
static uint8_t crc8(const uint8_t *data, unsigned len) {
    uint8_t c = 0;
    for (unsigned i = 0; i < len; i++) c ^= data[i];
    return c;
}

// unpack 4 byte integers into i32
static int32_t unpack_i32(const uint8_t b[4]) {
    return (int32_t)(
        ((uint32_t)b[0]) |
        ((uint32_t)b[1] << 8) |
        ((uint32_t)b[2] << 16) |
        ((uint32_t)b[3] << 24)
    );
}

void receive_points_forever(XUartPs *Uart) {
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

        if (type != 0x01 || len != 0x08) {
            // Skip unknown frame payload + CRC
            for (uint8_t i = 0; i < (uint8_t)(len + 1); i++) uart_recv_byte(Uart, &b);
            continue;
        }

        uint8_t payload[8];
        for (int i = 0; i < 8; i++) uart_recv_byte(Uart, &payload[i]);

        uint8_t crc;
        uart_recv_byte(Uart, &crc);

        uint8_t chk_buf[1 + 1 + 8];
        chk_buf[0] = type;
        chk_buf[1] = len;
        for (int i = 0; i < 8; i++) chk_buf[2 + i] = payload[i];

        uint8_t expect = crc8(chk_buf, sizeof(chk_buf));
        if (crc != expect) {
            xil_printf("CRC mismatch\r\n");
            continue;
        }

        int32_t r_nm = unpack_i32(&payload[0]);
        int32_t theta_udeg = unpack_i32(&payload[4]);

        // debug print
        xil_printf("r=%ld nm, theta=%ld udeg\r\n", (long)r_nm, (long)theta_udeg);

        // TODO: process arcs into usable control signals
    }
}
