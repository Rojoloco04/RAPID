/*
 * systemControl.c - Interactive motor and laser controller for the RAPID system.
 *
 * Runs on the Zynq PS (ARM Cortex-A9).  Reads initial configuration from the
 * user over UART, writes a packed 7-bit control word to a GPIO output channel,
 * then enters a command loop that allows real-time adjustment of the spindle
 * and stepper motor without restarting the system.
 *
 * GPIO output word layout (7 bits, channel 1):
 *   Bits 1-0  spindleSpeed  PWM duty cycle select (0=25%, 1=50%, 2=75%, 3=100%)
 *   Bit  2    spindleDir    Spindle direction      (0=backwards, 1=forwards)
 *   Bit  3    spindleEn     Spindle enable         (0=off, 1=on)
 *   Bit  4    stepperDir    Stepper direction      (0=backwards, 1=forwards)
 *   Bit  5    stepperEn     Stepper enable         (0=off, 1=on)
 *   Bit  6    stepperReset  Stepper reset pulse    (momentary high)
 *
 * Interactive commands (case-insensitive):
 *   S - set spindle speed (0-3)
 *   D - invert spindle direction (safely disables then re-enables spindle)
 *   P - toggle spindle power
 *   Q - toggle stepper power
 *   R - pulse stepper reset line
 *   H - print help
 *
 * Build: Xilinx Vitis bare-metal project targeting Zynq-7000 PS.
 */

#include "xgpio.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "platform.h"
#include "sleep.h"

#include <stdio.h>
#include <stdint.h>

/* ------------------------------------------------------------------ */
/*  Constants                                                         */
/* ------------------------------------------------------------------ */

/* Mask to keep only the 7 valid output bits when writing to GPIO. */
#define GPIO_MASK       0x7F

/* GPIO bit positions within the control word. */
#define BIT_SPINDLE_SPD 0   /* bits 1:0 - 2-bit speed field */
#define BIT_SPINDLE_DIR 2
#define BIT_SPINDLE_EN  3
#define BIT_STEPPER_DIR 4
#define BIT_STEPPER_EN  5
#define BIT_STEPPER_RST 6

/* ------------------------------------------------------------------ */
/*  Globals                                                           */
/* ------------------------------------------------------------------ */

XGpio gpio;     /* AXI GPIO driver instance */

/* ------------------------------------------------------------------ */
/*  Helper: validated integer input over UART                        */
/* ------------------------------------------------------------------ */

/*
 * input_check - prompt the user and block until a valid integer in
 * [min, max] is entered.  Supports backspace editing and echoes typed
 * characters.  Returns the validated integer value.
 */
int input_check(const char *prompt, int min, int max)
{
    char buf[16];
    int  idx = 0;
    int  value;

    while (1) {
        xil_printf("%s", prompt);
        idx = 0;

        /* accumulate one line of input */
        while (1) {
            char c = inbyte();  /* blocking UART read */

            if (c == '\r' || c == '\n') {
                buf[idx] = '\0';
                xil_printf("\r\n");
                break;
            }

            /* handle backspace (BS 0x08 and DEL 0x7F) */
            if ((c == 0x08 || c == 0x7F) && idx > 0) {
                idx--;
                xil_printf("\b \b");
                continue;
            }

            if (idx < (int)sizeof(buf) - 1) {
                buf[idx++] = c;
                xil_printf("%c", c);    /* echo typed character */
            }
        }

        if (sscanf(buf, "%d", &value) == 1 && value >= min && value <= max)
            return value;

        xil_printf("Invalid input. Please enter a value between %d and %d.\r\n", min, max);
    }
}

/* ------------------------------------------------------------------ */
/*  Helper: print command reference                                   */
/* ------------------------------------------------------------------ */

static void help_query(void)
{
    xil_printf("\r\nValid commands:\r\n"
               "  S - adjust spindle speed\r\n"
               "  D - invert spindle direction\r\n"
               "  P - toggle spindle power\r\n"
               "  Q - toggle stepper power\r\n"
               "  R - reset stepper\r\n"
               "  H - print this help\r\n");
}

/* ------------------------------------------------------------------ */
/*  Main                                                              */
/* ------------------------------------------------------------------ */

int main(void)
{
    init_platform();

    int  Status;
    u32  config  = 0x00000000;  /* packed GPIO control word */
    char command;

    /* ---- initialise AXI GPIO ---- */
    Status = XGpio_Initialize(&gpio, 0);
    if (Status != XST_SUCCESS) {
        xil_printf("GPIO Initialization Failed: %d\r\n", Status);
        return XST_FAILURE;
    }

    /* Configure channel 1 as all-outputs. */
    XGpio_SetDataDirection(&gpio, 1, 0x00000000);

    /* ---- collect initial configuration from user ---- */
    int spindleSpeed = input_check("\r\nEnter spindle speed (0=25%%, 1=50%%, 2=75%%, 3=100%%): ", 0, 3);
    int spindleDir   = input_check("\r\nEnter spindle direction (0=backwards, 1=forwards): ",      0, 1);
    int spindleEn    = input_check("\r\nEnable spindle? (0=disable, 1=enable): ",                  0, 1);
    int stepperDir   = input_check("\r\nEnter stepper direction (0=backwards, 1=forwards): ",      0, 1);
    int stepperEn    = input_check("\r\nEnable stepper? (0=disable, 1=enable): ",                  0, 1);

    /* Pack fields into the control word. */
    config |= (spindleSpeed & 0x03) << BIT_SPINDLE_SPD;
    config |= (spindleDir   & 0x01) << BIT_SPINDLE_DIR;
    config |= (spindleEn    & 0x01) << BIT_SPINDLE_EN;
    config |= (stepperDir   & 0x01) << BIT_STEPPER_DIR;
    config |= (stepperEn    & 0x01) << BIT_STEPPER_EN;

    XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);

    /* Readback to confirm the write took effect. */
    u32 rb = XGpio_DiscreteRead(&gpio, 1);
    xil_printf("\r\nConfiguration applied: wrote 0x%02x, read back 0x%02x\r\n",
               config & GPIO_MASK, rb & GPIO_MASK);

    help_query();

    /* ---- command loop ---- */
    while (1) {
        scanf(" %c", &command);

        /* R - pulse the stepper reset line high then immediately low */
        if (command == 'R' || command == 'r') {
            xil_printf("Stepper reset triggered.\r\n");
            config |= (1 << BIT_STEPPER_RST);
            XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);
            config &= ~(1 << BIT_STEPPER_RST);
            XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);
        }

        /* S - update spindle PWM duty-cycle speed */
        else if (command == 'S' || command == 's') {
            spindleSpeed = input_check("\r\nEnter new spindle speed (0=25%%, 1=50%%, 2=75%%, 3=100%%): ", 0, 3);

            config &= ~(0x03 << BIT_SPINDLE_SPD);
            config |=  (spindleSpeed & 0x03) << BIT_SPINDLE_SPD;
            XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);

            const int duty_pct[4] = {25, 50, 75, 100};
            xil_printf("Spindle speed set to %d%% duty cycle.\r\n", duty_pct[spindleSpeed]);
        }

        /*
         * D - reverse spindle direction.
         * The spindle is briefly disabled before the direction bit is flipped
         * to avoid applying a sudden polarity reversal under load, then
         * re-enabled after a short settling delay.
         */
        else if (command == 'D' || command == 'd') {
            xil_printf("Inverting spindle direction.\r\n");
            config &= ~(1 << BIT_SPINDLE_EN);              /* disable spindle  */
            XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);
            config ^=  (1 << BIT_SPINDLE_DIR);             /* flip direction   */
            XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);
            usleep(50000);                                  /* 50 ms settling   */
            config |=  (1 << BIT_SPINDLE_EN);              /* re-enable        */
            XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);
        }

        /* P - toggle spindle on/off */
        else if (command == 'P' || command == 'p') {
            config ^= (1 << BIT_SPINDLE_EN);
            xil_printf("Spindle power %s.\r\n", (config >> BIT_SPINDLE_EN) & 1 ? "on" : "off");
            XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);
        }

        /* Q - toggle stepper on/off */
        else if (command == 'Q' || command == 'q') {
            config ^= (1 << BIT_STEPPER_EN);
            xil_printf("Stepper power %s.\r\n", (config >> BIT_STEPPER_EN) & 1 ? "on" : "off");
            XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);
        }

        /* H - print command reference */
        else if (command == 'H' || command == 'h') {
            help_query();
        }

        else {
            xil_printf("Unknown command '%c'. Press H for help.\r\n", command);
        }
    }

    cleanup_platform();
    return 0;
}
