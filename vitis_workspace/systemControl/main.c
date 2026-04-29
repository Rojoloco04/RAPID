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
 *   Packet handling (all types ACK'd after action unless noted):
 *     TYPE_POINT   (0x10): Map r_um -> target step, move stepper, stall until
 *                          disc theta matches point theta, then turn laser on
 *                          after first point's move (stays on until TYPE_END).
 *     TYPE_END     (0x01): Disable laser/spindle/stepper, reset first_point,
 *                          ACK, continue loop (does NOT exit).
 *     TYPE_SPINDLE (0x21): Set/clear spindle enable bit.
 *     TYPE_STEPPER (0x22): Set/clear stepper enable bit.
 *     TYPE_LASER   (0x23): Set/clear laser enable bit.
 *     TYPE_DIR     (0x24): Set/clear stepper direction bit.
 *     TYPE_ZERO    (0x25): Pulse zero_req 100 ms, reset current_step=0.
 *     TYPE_JOG     (0x26): Move N steps (int32 LE) in current direction.
 *     TYPE_RPM_REQ (0x27): Read hall-sensor tick count, reply TYPE_RPM (no ACK).
 *     TYPE_VC1_DC  (0x28): Write 0-100 duty cycle to VC1 voice coil, ACK.
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
#include "xtime_l.h"
#include "protocol.h"

#include <stdio.h>
#include <stdarg.h>
#include <stdint.h>

/* GPIO constants */

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

/* UART constants */

#define UART_BASEADDR   XPAR_XUARTPS_0_BASEADDR
#define BAUD_RATE       115200

/* Motor constants */

/* Full stepper range: inner edge (home / step 0) to outer edge. */
#define MAX_STEPS        250

/* Physical disc radius in micrometres (30 mm).
 * 250 steps spans this full range: steps = round(r_um * MAX_STEPS / DISC_RADIUS_UM). */
#define DISC_RADIUS_UM   30000

/* Spindle RPM constants */

/* Log spindle RPM to the GUI console once per this many TYPE_POINT packets. */
#define RPM_PRINT_EVERY  1

/* Theta tracking constants */

/* Zynq global timer: CPU_FREQ/2 = 325 MHz */
#define GTIMER_HZ           325000000ULL

/* Bail out of wait_for_theta after this many revolutions (at current RPM).
 * At 10 RPM (slowest expected), 3 revs = 18 s. */
#define THETA_TIMEOUT_REVS  3

/* Accept disc theta as "arrived" within this many degrees of target. */
#define THETA_WINDOW_DEG    3.0f

/* Only turn the laser off between arc points if the disc needs longer than this
 * to reach the next target.  Short waits (disc arriving soon) keep the laser on
 * to avoid flicker.  Long waits (wrapping to next revolution) turn it off. */
#define LASER_OFF_GRACE_US  50000u   /* 50 ms */

/* Globals */

static XGpio   gpio;        /* axi_gpio_0: motor/laser outputs (ch1) + step_total input (ch2) */
static XGpio   gpio_rpm;   /* axi_gpio_1: RPM_Out input (ch1) + VC1 duty cycle output (ch2) */
static XUartPs Uart_Ps;

/* CRC / serialisation helpers */

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

static float unpack_f32_le(const uint8_t b[4])
{
    uint32_t u = (uint32_t)b[0]        |
                 ((uint32_t)b[1] << 8)  |
                 ((uint32_t)b[2] << 16) |
                 ((uint32_t)b[3] << 24);
    float f;
    __builtin_memcpy(&f, &u, sizeof f);
    return f;
}

/* Low-level UART I/O (polled, no interrupts) */

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

/* Framed packet TX */

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

/* Debug output via TYPE_DEBUG packet */

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

/* Framed packet RX */

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

/* RPM measurement */

/*
 * read_rpm - read the 1 kHz tick count between consecutive hall sensor pulses
 * from axi_gpio_1 ch1 bits[15:0] and convert to RPM.
 *
 * The spindle disc has 6 hall sensor poles, so 6 pulses per revolution.
 * The VHDL counts 1 kHz ticks between rising edges of RPM_Pulse_In.
 *
 *   tick_rate = 1000 ticks/s
 *   pulse_freq = 1000 / ticks   (Hz)
 *   rev_freq   = pulse_freq / 6 (Hz)
 *   RPM        = rev_freq * 60  = 10000 / ticks
 *
 * Returns 0 if ticks == 0 (spindle not spinning or no pulse yet captured).
 */
static uint16_t read_rpm(void)
{
    u32 raw = XGpio_DiscreteRead(&gpio_rpm, 1);
    uint32_t ticks = raw & 0xFFFFu;
    if (ticks == 0) return 0;
    uint32_t rpm = 10000u / ticks;
    return (uint16_t)(rpm > 0xFFFFu ? 0xFFFFu : rpm);
}

/* Theta tracking */

static XTime    theta_t0;        /* XTime captured when theta_init() was called (theta=0) */
static uint32_t theta_rev_us;   /* microseconds per full revolution at init time */
static int      theta_tracking; /* 1 when tracking is active */

/*
 * theta_init - snapshot RPM and start time so disc angle can be inferred.
 * Call once after the spindle is stable (after windup delay).
 *
 * Disc theta is then:  theta = (elapsed_us / theta_rev_us) * 360  (mod 360)
 *
 * Accuracy note: pure time integration; drifts ~1°/rev at 1% RPM error.
 * Adequate for short patterns at 10-25 RPM. If drift proves too large, a
 * VHDL hall-sector counter can re-sync theta every 60° — see plan notes.
 */
static void theta_init(void)
{
    u32 raw = XGpio_DiscreteRead(&gpio_rpm, 1);
    uint32_t ticks = raw & 0xFFFFu;
    /* rev_period_us = 6 pulses/rev * ticks ms/pulse * 1000 us/ms */
    theta_rev_us   = (ticks > 0) ? (ticks * 6000u) : 2400000u; /* fallback: 25 RPM */
    XTime_GetTime(&theta_t0);
    theta_tracking = 1;
    debug_printf("Theta init: rev_us=%lu RPM~%u",
                 (unsigned long)theta_rev_us,
                 ticks > 0 ? (unsigned)(10000u / ticks) : 25u);
}

/*
 * wait_for_theta - stall until the disc reaches target_deg (±THETA_WINDOW_DEG).
 *
 * Uses elapsed time since theta_init() and the captured revolution period to
 * compute current disc angle, then sleeps the remaining arc. Loops until
 * arrival or THETA_TIMEOUT_REVS have elapsed (returns 0 on timeout, 1 on
 * success). If theta_tracking is not active, returns immediately.
 */
static int wait_for_theta(float target_deg)
{
    if (!theta_tracking) return 1;

    XTime t_call_start;
    XTime_GetTime(&t_call_start);
    uint64_t timeout_us = (uint64_t)theta_rev_us * THETA_TIMEOUT_REVS;

    for (;;) {
        XTime t_now;
        XTime_GetTime(&t_now);

        /* Timeout measured from this call's start, not from theta_t0 */
        uint64_t call_us = (uint64_t)((t_now - t_call_start) * 1000000ULL / GTIMER_HZ);
        if (call_us > timeout_us) {
            debug_printf("wait_for_theta: TIMEOUT target=%.1f", (double)target_deg);
            return 0;
        }

        /* Current disc angle via time integration from theta_t0 phase reference */
        uint64_t elapsed_us = (uint64_t)((t_now - theta_t0) * 1000000ULL / GTIMER_HZ);
        float phase = (float)(elapsed_us % (uint64_t)theta_rev_us) / (float)theta_rev_us;
        float current_theta = phase * 360.0f;

        /* Degrees remaining to target (always ≥0: how far disc must still rotate) */
        float remaining = target_deg - current_theta;
        if (remaining < 0.0f) remaining += 360.0f;

        if (remaining <= THETA_WINDOW_DEG) return 1;

        /* Sleep the remaining fraction of the revolution, waking 1 ms early */
        uint32_t sleep_us = (uint32_t)(remaining / 360.0f * (float)theta_rev_us);
        if (sleep_us > 2000u) sleep_us -= 1000u;
        usleep(sleep_us);
    }
}

/* Main */

int main(void)
{
    init_platform();

    /* Initialise AXI GPIO */
    /* SDT flow: XGpio_Initialize takes BaseAddress, not DeviceId */
    if (XGpio_Initialize(&gpio, XPAR_AXI_GPIO_0_BASEADDR) != XST_SUCCESS)
        return XST_FAILURE;   /* UART not yet up - can't send debug packet */
    XGpio_SetDataDirection(&gpio, 1, 0x00000000);  /* ch1: all outputs */
    XGpio_SetDataDirection(&gpio, 2, 0xFFFFFFFF);  /* ch2: all inputs  */

    /* axi_gpio_1: RPM_Out from Spindle IP (ch1 input) + VC1 duty cycle (ch2 output) */
    if (XGpio_Initialize(&gpio_rpm, XPAR_AXI_GPIO_1_BASEADDR) != XST_SUCCESS)
        return XST_FAILURE;
    XGpio_SetDataDirection(&gpio_rpm, 1, 0xFFFFFFFF);  /* ch1: all inputs  (RPM) */
    XGpio_SetDataDirection(&gpio_rpm, 2, 0x00000000);  /* ch2: all outputs (VC1_DC) */
    XGpio_DiscreteWrite(&gpio_rpm, 2, 60);             /* fixed 60% duty cycle */

    /* Initialise PS UART */
    XUartPs_Config *cfg = XUartPs_LookupConfig(UART_BASEADDR);
    if (!cfg) { for (;;) ; }   /* halt - no UART config found */
    if (XUartPs_CfgInitialize(&Uart_Ps, cfg, cfg->BaseAddress) != XST_SUCCESS)
        { for (;;) ; }         /* halt - UART init failed */
    XUartPs_SetBaudRate(&Uart_Ps, BAUD_RATE);
    XUartPs_SetOperMode(&Uart_Ps, XUARTPS_OPER_MODE_NORMAL);

    u32 config = 0;

    /* 1. Enable stepper — sled is pre-zeroed before this program runs */
    config = (1u << BIT_STEPPER_EN);
    XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);
    debug_printf("Stepper enabled. Disc radius: %u um, max steps: %u. Ready for points.",
                 DISC_RADIUS_UM, MAX_STEPS);

    uint8_t rx_payload[MAX_PAYLOAD];
    uint8_t pkt_type;

    /* 2. Enable spindle */
    config |= (1u << BIT_SPINDLE_EN);
    XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);
    debug_printf("Spindle enabled. Waiting 2 s for windup...");
    usleep(2000000u);   /* 2 s: covers 1.5 s VHDL startup alignment + margin for first valid RPM pulse */
    debug_printf("Spindle ready.");

    /* 3. Packet receive loop */
    int32_t current_step = 0;
    int     first_point  = 1;
    uint32_t point_count = 0;   /* counts TYPE_POINT packets; RPM logged every RPM_PRINT_EVERY */

    for (;;) {
        pkt_type = receive_packet(rx_payload);

        if (pkt_type == TYPE_POINT) {

            int32_t r_um     = unpack_i32_le(&rx_payload[0]);
            float   theta_deg = unpack_f32_le(&rx_payload[4]);

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

            /* stall until disc reaches target angular position.
             * Only turn the laser off if the disc needs longer than LASER_OFF_GRACE_US
             * to arrive — avoids flicker on short consecutive-arc waits, but ensures
             * the laser is off when wrapping to the next revolution. */
            if (!first_point && theta_tracking) {
                XTime t_grace;
                XTime_GetTime(&t_grace);
                uint64_t elapsed_us = (uint64_t)((t_grace - theta_t0) * 1000000ULL / GTIMER_HZ);
                float phase = (float)(elapsed_us % (uint64_t)theta_rev_us) / (float)theta_rev_us;
                float now_theta = phase * 360.0f;
                float remaining_deg = theta_deg - now_theta;
                if (remaining_deg < 0.0f) remaining_deg += 360.0f;
                uint32_t remaining_us = (uint32_t)(remaining_deg / 360.0f * (float)theta_rev_us);
                if (remaining_us > LASER_OFF_GRACE_US) {
                    config &= ~(1u << BIT_LASER_EN);
                    XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);
                }
            }
            wait_for_theta(theta_deg);

            /* turn laser on once disc is at the target angle */
            if (first_point) {
                first_point = 0;
                debug_printf("Laser ON.");
            }
            config |= (1u << BIT_LASER_EN);
            XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);

            /* ACK the point - echo payload back to PC */
            send_frame(TYPE_ACK, rx_payload, POINT_LEN);

            /* Periodically log RPM to the GUI console */
            if (++point_count % RPM_PRINT_EVERY == 0) {
                u32 _raw = XGpio_DiscreteRead(&gpio_rpm, 1);
                uint32_t _ticks = _raw & 0xFFFFu;
                debug_printf("RPM: %u (raw=0x%08X ticks=%u)",
                             (unsigned)read_rpm(), (unsigned)_raw, (unsigned)_ticks);
            }
        }

        else if (pkt_type == TYPE_END) {
            /* Disable all hardware.  Does NOT exit — loop continues so the
             * user can re-enable hardware or run another pattern. */
            config &= ~(1u << BIT_LASER_EN);
            config &= ~(1u << BIT_SPINDLE_EN);
            config &= ~(1u << BIT_STEPPER_EN);
            XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);
            debug_printf("END received. Laser OFF. Motors stopped. Ready.");
            first_point    = 1;   /* next pattern re-arms the laser-on trigger */
            point_count    = 0;   /* reset RPM print counter */
            theta_tracking = 0;   /* re-arm theta_init on next stream start */
            uint8_t empty_end = 0;
            send_frame(TYPE_ACK, &empty_end, 0);
        }

        else if (pkt_type == TYPE_SPINDLE) {
            if (rx_payload[0]) config |=  (1u << BIT_SPINDLE_EN);
            else               config &= ~(1u << BIT_SPINDLE_EN);
            XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);
            debug_printf("Spindle %s.", rx_payload[0] ? "ON" : "OFF");
            if (rx_payload[0]) theta_init();   /* arm theta tracking before the 1 s windup wait */
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
            if (!((config >> BIT_STEPPER_EN) & 1u)) {
                debug_printf("Zero ignored: stepper is disabled.");
                uint8_t empty_zero = 0;
                send_frame(TYPE_ACK, &empty_zero, 0);
                continue;
            }
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
            if (steps > 0 && steps < 4) steps = 4;   /* minimum 4 steps — hardware won't move for fewer */
            int jog_dir = (int)((config >> BIT_STEPPER_DIR) & 1u);

            /* clamp to avoid overrunning the physical range */
            if (steps > 0) {
                int32_t avail = jog_dir ? (MAX_STEPS - current_step)
                                        : current_step;
                if (steps > avail) steps = avail;
            }

            if (!((config >> BIT_STEPPER_EN) & 1u)) {
                debug_printf("Jog ignored: stepper is disabled.");
                send_frame(TYPE_ACK, rx_payload, 4);
                continue;
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

        else if (pkt_type == TYPE_RPM_REQ) {
            uint16_t rpm = read_rpm();
            uint8_t rpm_payload[2];
            rpm_payload[0] = (uint8_t)(rpm & 0xFF);         /* uint16 LE */
            rpm_payload[1] = (uint8_t)((rpm >> 8) & 0xFF);
            send_frame(TYPE_RPM, rpm_payload, RPM_LEN);
            debug_printf("RPM: %u", (unsigned)rpm);
        }

        else if (pkt_type == TYPE_VC1_DC) {
            uint8_t duty = (rx_payload[0] > 100u) ? 100u : rx_payload[0];
            XGpio_DiscreteWrite(&gpio_rpm, 2, (u32)duty);
            debug_printf("VC1 duty: %u%%", (unsigned)duty);
            send_frame(TYPE_ACK, rx_payload, CTRL_LEN);
        }

        /* any other packet type is silently ignored */
    }
}
