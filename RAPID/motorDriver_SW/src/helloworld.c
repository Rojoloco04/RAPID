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