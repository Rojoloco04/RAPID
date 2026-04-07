/*
 * main.c - Automated polar-coordinate motor/laser controller for RAPID.
 *
 * Runs on the Zynq PS (ARM Cortex-A9).  Single bare-metal app that handles
 * both packet reception and motor/laser control:
 *
 *   Startup:
 *     1. Enable stepper (stepper is pre-zeroed before program runs).
 *     2. Enable spindle; wait 1 s for rotor windup.
 *     3. Enter packet receive loop (runs forever).
 *
 *   Packet handling (all types ACK'd after action):
 *     TYPE_POINT  (0x10): Map r_um -> target step, move stepper, turn laser
 *                         on after first point's move.
 *     TYPE_END    (0x01): Disable laser/spindle/stepper, reset first_point,
 *                         ACK, continue loop (does NOT exit).
 *     TYPE_SPINDLE(0x21): Set/clear spindle enable bit.
 *     TYPE_STEPPER(0x22): Set/clear stepper enable bit.
 *     TYPE_LASER  (0x23): Set/clear laser enable bit.
 *     TYPE_DIR    (0x24): Set/clear stepper direction bit.
 *     TYPE_ZERO   (0x25): Pulse zero_req 100 ms, reset current_step=0.
 *     TYPE_JOG    (0x26): Move N steps (int32 LE) in current direction.
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
 * Wire format: see protocol.h
 *
 * Build: Xilinx Vitis bare-metal project targeting Zynq-7000 PS.
 */

#include "xgpio.h"
#include "xparameters.h"
#include "platform.h"
#include "sleep.h"
#include "xuartps.h"
#include "xuartps_hw.h"
#include "protocol.h"

#include <stdio.h>
#include <stdarg.h>
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
/*  UART constants                                                    */
/* ------------------------------------------------------------------ */

#define UART_BASEADDR   XPAR_XUARTPS_0_BASEADDR
#define BAUD_RATE       115200

/* ------------------------------------------------------------------ */
/*  Motor constants                                                   */
/* ------------------------------------------------------------------ */

/* Full stepper range: inner edge (home / step 0) to outer edge. */
#define MAX_STEPS        250

/* Physical disc radius in micrometres (30 mm).
 * 250 steps spans this full range: steps = round(r_um * MAX_STEPS / DISC_RADIUS_UM). */
#define DISC_RADIUS_UM   30000

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
/*  Debug output via TYPE_DEBUG packet                               */
/* ------------------------------------------------------------------ */

/*
 * debug_printf - send a formatted string to the PC as a TYPE_DEBUG (0xF0)
 * framed packet.  The PC reader thread prints these as "[FPGA] <msg>".
 * Use this instead of xil_printf so debug output stays within the framed
 * protocol and is visible in the PC console / GUI while the port is open.
 */
static void debug_printf(const char *fmt, ...)
{
    char buf[128];
    va_list ap;
    va_start(ap, fmt);
    vsnprintf(buf, sizeof(buf), fmt, ap);
    va_end(ap);

    uint8_t len = 0;
    while (buf[len] && len < 255) len++;
    send_frame(TYPE_DEBUG, (const uint8_t *)buf, len);
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
    if (XGpio_Initialize(&gpio, 0) != XST_SUCCESS)
        return XST_FAILURE;   /* UART not yet up - can't send debug packet */
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

    /* ===== 1. ENABLE STEPPER ======================================== */
    /* Stepper is already zeroed before this program runs. */
    config = (1u << BIT_STEPPER_EN);
    XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);
    debug_printf("Stepper enabled. Disc radius: %u um, max steps: %u. Ready for points.",
                 DISC_RADIUS_UM, MAX_STEPS);

    uint8_t rx_payload[MAX_PAYLOAD];
    uint8_t pkt_type;

    /* ===== 2. ENABLE SPINDLE ======================================= */
    config |= (1u << BIT_SPINDLE_EN);
    XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);
    debug_printf("Spindle enabled. Waiting 1 s for windup...");
    usleep(1000000u);   /* 1 s spindle windup */
    debug_printf("Spindle ready.");

    /* ===== 3. POINT LOOP =========================================== */
    int32_t current_step = 0;
    int     first_point  = 1;

    for (;;) {
        pkt_type = receive_packet(rx_payload);

        if (pkt_type == TYPE_POINT) {

            int32_t r_um = unpack_i32_le(&rx_payload[0]);
            /* theta_deg currently unused; spindle position not yet controlled */

            /* --- map physical radius (µm) to stepper steps ---
             *   steps = round( r_um / DISC_RADIUS_UM * MAX_STEPS )
             * 0 µm = home (inner edge, step 0); DISC_RADIUS_UM = outer edge (MAX_STEPS). */
            int32_t target_step = (int32_t)((double)r_um / DISC_RADIUS_UM * MAX_STEPS + 0.5);
            if (target_step < 0)         target_step = 0;
            if (target_step > MAX_STEPS) target_step = MAX_STEPS;

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
                 *   1200 us    WAKEUP hold (150,000 cycles @ 125 MHz)
                 *   delta*2000 RUNNING at 500 Hz step rate (run_freq=250000 @ 125 MHz)
                 *   10000 us   safety margin
                 * (The 100 ms step_go pulse already elapsed above.)
                 */
                usleep(1200u + (uint32_t)delta * 2000u + 10000u);
            }

            current_step = target_step;

            /* turn laser on after the first point's move completes */
            if (first_point) {
                config |= (1u << BIT_LASER_EN);
                XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);
                first_point = 0;
                debug_printf("Laser ON.");
            }

            /* ACK the point - echo payload back to PC */
            send_frame(TYPE_ACK, rx_payload, POINT_LEN);
        }

        else if (pkt_type == TYPE_END) {
            /* Disable all hardware.  Does NOT exit — loop continues so the
             * user can re-enable hardware or run another pattern. */
            config &= ~(1u << BIT_LASER_EN);
            config &= ~(1u << BIT_SPINDLE_EN);
            config &= ~(1u << BIT_STEPPER_EN);
            XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);
            debug_printf("END received. Laser OFF. Motors stopped. Ready.");
            first_point = 1;   /* next pattern re-arms the laser-on trigger */
            uint8_t empty_end = 0;
            send_frame(TYPE_ACK, &empty_end, 0);
        }

        else if (pkt_type == TYPE_SPINDLE) {
            if (rx_payload[0]) config |=  (1u << BIT_SPINDLE_EN);
            else               config &= ~(1u << BIT_SPINDLE_EN);
            XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);
            debug_printf("Spindle %s.", rx_payload[0] ? "ON" : "OFF");
            send_frame(TYPE_ACK, rx_payload, CTRL_LEN);
        }

        else if (pkt_type == TYPE_STEPPER) {
            if (rx_payload[0]) config |=  (1u << BIT_STEPPER_EN);
            else               config &= ~(1u << BIT_STEPPER_EN);
            XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);
            debug_printf("Stepper %s.", rx_payload[0] ? "ON" : "OFF");
            send_frame(TYPE_ACK, rx_payload, CTRL_LEN);
        }

        else if (pkt_type == TYPE_LASER) {
            if (rx_payload[0]) config |=  (1u << BIT_LASER_EN);
            else               config &= ~(1u << BIT_LASER_EN);
            XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);
            debug_printf("Laser %s.", rx_payload[0] ? "ON" : "OFF");
            send_frame(TYPE_ACK, rx_payload, CTRL_LEN);
        }

        else if (pkt_type == TYPE_DIR) {
            if (rx_payload[0]) config |=  (1u << BIT_STEPPER_DIR);
            else               config &= ~(1u << BIT_STEPPER_DIR);
            XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);
            debug_printf("Stepper direction: %s.", rx_payload[0] ? "outward" : "inward");
            send_frame(TYPE_ACK, rx_payload, CTRL_LEN);
        }

        else if (pkt_type == TYPE_ZERO) {
            config |=  (1u << BIT_ZERO_REQ);
            XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);
            usleep(100000);   /* 100 ms pulse */
            config &= ~(1u << BIT_ZERO_REQ);
            XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);
            current_step = 0;   /* reset step tracking — sled is now at home */
            debug_printf("Zero request pulsed. Step tracking reset.");
            uint8_t empty_zero = 0;
            send_frame(TYPE_ACK, &empty_zero, 0);
        }

        else if (pkt_type == TYPE_JOG) {
            int32_t steps = unpack_i32_le(&rx_payload[0]);
            if (steps < 0) steps = -steps;   /* take absolute value */
            int jog_dir = (int)((config >> BIT_STEPPER_DIR) & 1u);

            /* clamp to avoid overrunning the physical range */
            if (steps > 0) {
                int32_t avail = jog_dir ? (MAX_STEPS - current_step)
                                        : current_step;
                if (steps > avail) steps = avail;
            }

            if (steps > 0) {
                config &= ~((u32)NUM_STEP_MAX << BIT_NUM_STEP);
                config |=  ((u32)(steps & NUM_STEP_MAX) << BIT_NUM_STEP);
                XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);

                /* pulse step_go */
                config |=  (1u << BIT_STEP_GO);
                XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);
                usleep(100000);   /* 100 ms pulse */
                config &= ~(1u << BIT_STEP_GO);
                XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);

                usleep(1200u + (uint32_t)steps * 2000u + 10000u);

                if (jog_dir) current_step += steps;
                else         current_step -= steps;
                if (current_step < 0)         current_step = 0;
                if (current_step > MAX_STEPS) current_step = MAX_STEPS;
            }

            debug_printf("Jog %ld steps %s. Position: %ld",
                         (long)steps,
                         jog_dir ? "outward" : "inward",
                         (long)current_step);
            send_frame(TYPE_ACK, rx_payload, 4);
        }

        /* any other packet type is silently ignored */
    }
}
