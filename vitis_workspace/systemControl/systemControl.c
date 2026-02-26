/*
 * systemControl.c - Automated polar-coordinate motor/laser controller for RAPID.
 *
 * Runs on the Zynq PS (ARM Cortex-A9).  Merges the functions of the former
 * interactive systemControl app and the fpgaCommunication receiver into a
 * single automated pipeline:
 *
 *   1. Enable stepper -> VHDL FSM begins homing (ZEROING state).
 *   2. Receive TYPE_RANGE packet from PC, storing r_min / r_max.
 *   3. Wait ZERO_WAIT_US for homing to complete, then ACK the range packet.
 *   4. Enable spindle.
 *   5. For each TYPE_POINT packet:
 *        a. Map r_nm -> target step count (linear, [r_min,r_max] -> [0,MAX_STEPS]).
 *        b. Compute delta and direction from current position.
 *        c. Update GPIO and pulse step_go; wait for move to complete.
 *        d. Turn on laser after the first point's move.
 *        e. ACK the point.
 *   6. On TYPE_END packet: disable laser/spindle/stepper, ACK, return.
 *
 * GPIO output word layout (27 bits, AXI GPIO channel 1):
 *   Bit  0        spindle_en   Spindle enable         (0=off, 1=on)
 *   Bit  1        stepper_dir  Stepper direction      (0=inward, 1=outward)
 *   Bit  2        stepper_en   Stepper enable         (0=off, 1=on)
 *   Bit  3        zero_req     Zero/home request      (momentary high)
 *   Bits 4-24     num_step     Step count             (0 to 2^21-1)
 *   Bit  25       step_go      Step go pulse          (momentary high)
 *   Bit  26       LaserEn      Laser On/Off           (0=off, 1=on)
 *
 * Wire format (shared with pcCommunication.c):
 *   SOF (0xAA 0x55) | TYPE (1 B) | LEN (1 B) | PAYLOAD (LEN B) | CRC8
 *
 * Incoming packet types:
 *   TYPE 0x02, LEN 0x08 - range: r_min_nm (int32 LE) + r_max_nm (int32 LE)
 *   TYPE 0x01, LEN 0x08 - polar point: r_nm (int32 LE) + theta_udeg (int32 LE)
 *   TYPE 0x03, LEN 0x00 - end of sequence
 *
 * Outgoing:
 *   TYPE 0x81 - ACK, LEN = echo of incoming LEN, PAYLOAD = echo of incoming payload
 *
 * Build: Xilinx Vitis bare-metal project targeting Zynq-7000 PS.
 */

#include "xgpio.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "platform.h"
#include "sleep.h"
#include "xuartps.h"
#include "xuartps_hw.h"

#include <stdio.h>
#include <stdint.h>

/* ------------------------------------------------------------------ */
/*  GPIO constants                                                    */
/* ------------------------------------------------------------------ */

/* Mask to keep only the 27 valid output bits when writing to GPIO. */
#define GPIO_MASK       0x07FFFFFF

#define BIT_SPINDLE_EN  0
#define BIT_STEPPER_DIR 1
#define BIT_STEPPER_EN  2
#define BIT_ZERO_REQ    3
#define BIT_NUM_STEP    4   /* bits 24:4 - 21-bit step count field */
#define BIT_STEP_GO     25
#define BIT_LASER_EN    26

#define NUM_STEP_MAX    ((1 << 21) - 1)   /* 2097151 */

/* ------------------------------------------------------------------ */
/*  UART / protocol constants                                         */
/* ------------------------------------------------------------------ */

#define UART_BASEADDR   XPAR_XUARTPS_0_BASEADDR
#define BAUD_RATE       115200

#define SOF_BYTE_1      0xAA
#define SOF_BYTE_2      0x55
#define TYPE_POINT      0x01
#define TYPE_RANGE      0x02
#define TYPE_END        0x03
#define TYPE_ACK        0x81
#define POINT_LEN       0x08
#define RANGE_LEN       0x08
#define MAX_PAYLOAD     255

/* ------------------------------------------------------------------ */
/*  Motor constants                                                   */
/* ------------------------------------------------------------------ */

/* Full stepper range: inner edge (home / step 0) to outer edge. */
#define MAX_STEPS       8500

/*
 * How long to wait after asserting stepper_en before ACK'ing the range
 * packet.  At the VHDL homing rate of ~50 steps/s, 30 s covers 1500
 * steps from home.  Increase ZERO_WAIT_US if the sled may start further.
 */
#define ZERO_WAIT_US    30000000U   /* 30 seconds */

/* ------------------------------------------------------------------ */
/*  Globals                                                           */
/* ------------------------------------------------------------------ */

static XGpio   gpio;
static XUartPs Uart_Ps;

/* ------------------------------------------------------------------ */
/*  CRC / serialisation helpers                                       */
/* ------------------------------------------------------------------ */

static uint8_t crc8_xor(const uint8_t *data, unsigned len)
{
    uint8_t c = 0;
    for (unsigned i = 0; i < len; i++)
        c ^= data[i];
    return c;
}

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

static void uart_send(const uint8_t *buf, unsigned len)
{
    UINTPTR base = Uart_Ps.Config.BaseAddress;
    for (unsigned i = 0; i < len; i++)
        XUartPs_SendByte(base, buf[i]);
}

static void uart_flush_tx(void)
{
    UINTPTR base = Uart_Ps.Config.BaseAddress;
    while (!(XUartPs_ReadReg(base, XUARTPS_SR_OFFSET) & XUARTPS_SR_TXEMPTY))
        ;
}

static uint8_t uart_recv_byte(void)
{
    uint8_t b;
    while (XUartPs_Recv(&Uart_Ps, &b, 1) != 1)
        ;
    return b;
}

/* ------------------------------------------------------------------ */
/*  Framed packet TX                                                  */
/* ------------------------------------------------------------------ */

/*
 * send_frame - build and transmit a framed response packet.
 *
 * Frame layout: SOF(2) | type(1) | len(1) | payload(len) | CRC8(1)
 * CRC is computed over [type, len, payload...].
 * Pass payload=NULL or len=0 for empty-payload frames.
 */
static void send_frame(uint8_t type, const uint8_t *payload, uint8_t len)
{
    uint8_t hdr[4] = { SOF_BYTE_1, SOF_BYTE_2, type, len };

    uint8_t crc = type ^ len;
    for (uint8_t i = 0; i < len; i++)
        crc ^= payload[i];

    uart_send(hdr, sizeof(hdr));
    if (len && payload)
        uart_send(payload, len);
    uart_send(&crc, 1);
    uart_flush_tx();
}

/* ------------------------------------------------------------------ */
/*  Framed packet RX                                                  */
/* ------------------------------------------------------------------ */

/*
 * receive_packet - block until one valid framed packet is received.
 *
 * Fills out_payload (caller must provide MAX_PAYLOAD bytes) and returns
 * the TYPE byte.  Frames with CRC mismatches are silently discarded.
 */
static uint8_t receive_packet(uint8_t *out_payload)
{
    for (;;) {
        /* synchronise on SOF */
        if (uart_recv_byte() != SOF_BYTE_1) continue;
        if (uart_recv_byte() != SOF_BYTE_2) continue;

        uint8_t type = uart_recv_byte();
        uint8_t len  = uart_recv_byte();

        uint8_t payload[MAX_PAYLOAD];
        for (uint8_t i = 0; i < len; i++)
            payload[i] = uart_recv_byte();

        uint8_t rx_crc = uart_recv_byte();

        /* verify CRC over [TYPE, LEN, PAYLOAD...] */
        uint8_t chk[2 + MAX_PAYLOAD];
        chk[0] = type;
        chk[1] = len;
        for (uint8_t i = 0; i < len; i++)
            chk[2 + i] = payload[i];

        if (crc8_xor(chk, 2u + len) != rx_crc)
            continue;   /* CRC mismatch - drop frame and resync */

        for (uint8_t i = 0; i < len; i++)
            out_payload[i] = payload[i];

        return type;
    }
}

/* ------------------------------------------------------------------ */
/*  Main                                                              */
/* ------------------------------------------------------------------ */

int main(void)
{
    init_platform();

    /* ---- initialise AXI GPIO ---- */
    if (XGpio_Initialize(&gpio, 0) != XST_SUCCESS) {
        xil_printf("GPIO init failed\r\n");
        return XST_FAILURE;
    }
    XGpio_SetDataDirection(&gpio, 1, 0x00000000);  /* ch1: all outputs */
    XGpio_SetDataDirection(&gpio, 2, 0xFFFFFFFF);  /* ch2: all inputs  */

    /* ---- initialise PS UART ---- */
    XUartPs_Config *cfg = XUartPs_LookupConfig(UART_BASEADDR);
    if (!cfg) { for (;;) ; }   /* halt - no UART config found */
    if (XUartPs_CfgInitialize(&Uart_Ps, cfg, cfg->BaseAddress) != XST_SUCCESS)
        { for (;;) ; }         /* halt - UART init failed */
    XUartPs_SetBaudRate(&Uart_Ps, BAUD_RATE);
    XUartPs_SetOperMode(&Uart_Ps, XUARTPS_OPER_MODE_NORMAL);

    u32 config = 0;

    /* ===== 1. HOMING ================================================ */
    /*
     * Assert stepper_en so the VHDL FSM immediately enters ZEROING state
     * and drives the sled towards the inner-edge proximity switch.
     */
    config = (1u << BIT_STEPPER_EN);
    XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);
    xil_printf("\r\nZeroing started. Will wait %u s for sled to home...\r\n",
               ZERO_WAIT_US / 1000000u);

    /* ===== 2. RECEIVE RANGE PACKET ================================= */
    /*
     * The range packet may arrive from the PC while zeroing is still in
     * progress.  Receive and store r_min / r_max now, but withhold the
     * ACK until the homing wait expires so the PC does not start sending
     * point packets before the sled is at the home position.
     */
    uint8_t rx_payload[MAX_PAYLOAD];
    uint8_t range_echo[RANGE_LEN];
    int32_t r_min_nm = 0, r_max_nm = 1;   /* safe defaults */

    uint8_t pkt_type;
    do {
        pkt_type = receive_packet(rx_payload);
    } while (pkt_type != TYPE_RANGE);

    r_min_nm = unpack_i32_le(&rx_payload[0]);
    r_max_nm = unpack_i32_le(&rx_payload[4]);
    for (uint8_t i = 0; i < RANGE_LEN; i++)
        range_echo[i] = rx_payload[i];

    /* ===== 3. FINISH ZEROING WAIT, THEN ACK RANGE ================== */
    usleep(ZERO_WAIT_US);
    send_frame(TYPE_ACK, range_echo, RANGE_LEN);
    xil_printf("Zeroing complete. r_min=%ld nm, r_max=%ld nm\r\n",
               (long)r_min_nm, (long)r_max_nm);

    /* ===== 4. ENABLE SPINDLE ======================================= */
    config |= (1u << BIT_SPINDLE_EN);
    XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);
    xil_printf("Spindle enabled.\r\n");

    /* ===== 5. POINT LOOP =========================================== */
    int32_t current_step = 0;
    int     first_point  = 1;

    for (;;) {
        pkt_type = receive_packet(rx_payload);

        if (pkt_type == TYPE_POINT) {

            int32_t r_nm = unpack_i32_le(&rx_payload[0]);
            /* theta_udeg currently logged only; spindle position not yet controlled */

            /* --- compute normalised target step count --- */
            int32_t target_step;
            if (r_max_nm == r_min_nm) {
                target_step = 0;
            } else {
                double frac = (double)(r_nm - r_min_nm)
                            / (double)(r_max_nm - r_min_nm);
                target_step = (int32_t)(frac * (double)MAX_STEPS + 0.5);
                if (target_step < 0)          target_step = 0;
                if (target_step > MAX_STEPS)  target_step = MAX_STEPS;
            }

            int32_t delta = target_step - current_step;
            if (delta < 0) delta = -delta;
            int dir = (target_step >= current_step) ? 1 : 0;

            /* --- issue move (skip if already at target) --- */
            if (delta > 0) {
                /* update direction and step count in the GPIO word */
                config &= ~(1u << BIT_STEPPER_DIR);
                config |=  ((u32)dir << BIT_STEPPER_DIR);
                config &= ~((u32)NUM_STEP_MAX << BIT_NUM_STEP);
                config |=  ((u32)(delta & NUM_STEP_MAX) << BIT_NUM_STEP);
                XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);

                /* pulse step_go for 100 ms - rising edge triggers VHDL FSM */
                config |=  (1u << BIT_STEP_GO);
                XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);
                usleep(100000);   /* 100 ms pulse */
                config &= ~(1u << BIT_STEP_GO);
                XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);

                /*
                 * Wait for the move to finish:
                 *   1200 us   WAKEUP hold (150,000 cycles @ 125 MHz)
                 *   delta*125 RUNNING at 8 kHz step rate (125 us/step)
                 *   10000 us  safety margin
                 * (The 100 ms step_go pulse already elapsed above.)
                 */
                usleep(1200u + (uint32_t)delta * 125u + 10000u);
            }

            current_step = target_step;

            /* turn laser on after the first point's move completes */
            if (first_point) {
                config |= (1u << BIT_LASER_EN);
                XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);
                first_point = 0;
                xil_printf("Laser ON.\r\n");
            }

            /* ACK the point - echo payload back to PC */
            send_frame(TYPE_ACK, rx_payload, POINT_LEN);
        }

        else if (pkt_type == TYPE_END) {
            /* pattern finished - disable laser, spindle, and stepper */
            config &= ~(1u << BIT_LASER_EN);
            config &= ~(1u << BIT_SPINDLE_EN);
            config &= ~(1u << BIT_STEPPER_EN);
            XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);

            xil_printf("Pattern complete. Laser OFF. Motors stopped.\r\n");

            /* ACK end packet (LEN=0, no payload) */
            {
                uint8_t empty = 0;
                send_frame(TYPE_ACK, &empty, 0);
            }

            cleanup_platform();
            return 0;
        }
        /* any other packet type is silently ignored */
    }
}
