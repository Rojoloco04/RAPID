/*
 * systemControl.c - Interactive motor and laser controller for the RAPID system.
 *
 * Runs on the Zynq PS (ARM Cortex-A9).  Reads initial configuration from the
 * user over UART, writes a packed 7-bit control word to a GPIO output channel,
 * then enters a command loop that allows real-time adjustment of the spindle
 * and stepper motor without restarting the system.
 *
 * GPIO output word layout (26 bits, channel 1):
 *   Bit  0        spindle_en   Spindle enable         (0=off, 1=on)
 *   Bit  1        stepper_dir  Stepper direction      (0=backwards, 1=forwards)
 *   Bit  2        stepper_en   Stepper enable         (0=off, 1=on)
 *   Bit  3        zero_req     Zero/home request      (momentary high)
 *   Bits 4-24     num_step     Step count             (0 to 2^21-1)
 *   Bit  25       step_go      Step go pulse          (momentary high)
 *   Bit  26       LaserEn      Laser On/Off           (0=off, 1=on)
 *
 * Interactive commands (case-insensitive):
 *   P - toggle spindle power
 *   D - toggle stepper direction
 *   Q - toggle stepper power
 *   Z - pulse zero request line
 *   N - set number of steps
 *   G - pulse step go line
 *   L - Toggle Laser
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

/* Mask to keep only the 27 valid output bits when writing to GPIO. */
#define GPIO_MASK       0x07FFFFFF


/* GPIO bit positions within the control word. */
//#define BIT_SPINDLE_SPD 0   /* bits 1:0 - 2-bit speed field */
//#define BIT_SPINDLE_DIR 2
//#define BIT_SPINDLE_EN  3
//#define BIT_STEPPER_DIR 4
//#define BIT_STEPPER_EN  5
//#define BIT_STEPPER_RST 6

#define BIT_SPINDLE_EN  0
#define BIT_STEPPER_DIR 1
#define BIT_STEPPER_EN  2
#define BIT_ZERO_REQ    3
#define BIT_NUM_STEP    4   /* bits 24:4 - 21-bit step count field */
#define BIT_STEP_GO     25
#define BIT_LASER_EN    26

#define NUM_STEP_MAX    ((1 << 21) - 1)   /* 2097151 */
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

static void help_query(void) {
    xil_printf("\r\nValid commands:\r\n"
               " P - toggle spindle power\r\n"
               " D - toggle stepper direction\r\n"
               " Q - toggle stepper power\r\n"
               " Z - pulse zero request line\r\n"
               " N - set number of steps (0 to %d)\r\n"
               " G - pulse step go\r\n"
               " L - toggle laser power\r\n"
               " H - print this help\r\n", NUM_STEP_MAX);
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
    XGpio_SetDataDirection(&gpio, 1, 0x00000000);  /*channel 1 all outputs*/
    XGpio_SetDataDirection(&gpio, 2, 0xFFFFFFFF);  /* channel 2 all inputs  */

    XGpio_DiscreteWrite(&gpio, 1, (1 << BIT_STEPPER_EN));
    xil_printf("\r\nZeroing in progress - waiting for proximity switch...\r\n");

    /* ---- collect initial configuration from user ---- */
   // int spindleSpeed = input_check("\r\nEnter spindle speed (0=25%%, 1=50%%, 2=75%%, 3=100%%): ", 0, 3);
   // int spindleDir   = input_check("\r\nEnter spindle direction (0=backwards, 1=forwards): ",      0, 1);
   // int spindleEn    = input_check("\r\nEnable spindle? (0=disable, 1=enable): ",                  0, 1);
   // int stepperDir   = input_check("\r\nEnter stepper direction (0=backwards, 1=forwards): ",      0, 1);
   // int stepperEn    = input_check("\r\nEnable stepper? (0=disable, 1=enable): ",                  0, 1);

    int spindleEn  = input_check("\r\nEnable spindle? (0=disable, 1=enable): ",                  0, 1);
    int stepperDir = input_check("\r\nEnter stepper direction (0=backwards, 1=forwards): ",      0, 1);
    int stepperEn  =  input_check("\r\nEnable stepper? (0=disable, 1=enable): ",                  0, 1);
    int numStep    = input_check("\r\nEnter number of steps (0 to 2097151): ", 0, NUM_STEP_MAX);
    int laserEn    = input_check("\r\nEnable Laser? (0=off, 1=on)", 0, 1);


    /* Pack fields into the control word. */
    /*config |= (spindleSpeed & 0x03) << BIT_SPINDLE_SPD;
    config |= (spindleDir   & 0x01) << BIT_SPINDLE_DIR;
    config |= (spindleEn    & 0x01) << BIT_SPINDLE_EN;
    config |= (stepperDir   & 0x01) << BIT_STEPPER_DIR;
    config |= (stepperEn    & 0x01) << BIT_STEPPER_EN;*/

    config |= (spindleEn  & 0x01)       << BIT_SPINDLE_EN;
    config |= (stepperDir & 0x01)       << BIT_STEPPER_DIR;
    config |= (stepperEn  & 0x01)       << BIT_STEPPER_EN;
    /* zero_req and step_go start low; they are pulsed by commands */
    config |= ((u32)(numStep & NUM_STEP_MAX)) << BIT_NUM_STEP;
    config |= (laserEn & 0x01)          << BIT_LASER_EN;

    XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);

    /* Readback to confirm the write took effect. */
    u32 rb = XGpio_DiscreteRead(&gpio, 1);
    xil_printf("\r\nConfiguration applied: wrote 0x%08x, read back 0x%08x\r\n",
               config & GPIO_MASK, rb & GPIO_MASK);

    help_query();

    /* ---- command loop ---- */
    while (1) {
        scanf(" %c", &command);

        /* Z - pulse the zero request line high then immediately low */
        if (command == 'Z' || command == 'z') {
            xil_printf("Zero request triggered.\r\n");
            config |=  (1 << BIT_ZERO_REQ);
            XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);
            usleep(100000);
            config &= ~(1 << BIT_ZERO_REQ);
            XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);
        }

        /* G - pulse the step go line high then immediately low */
        else if (command == 'G' || command == 'g') {
            xil_printf("Step go triggered.\r\n");
            config |=  (1U << BIT_STEP_GO);
            XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);
            usleep(100000);
            config &= ~(1U << BIT_STEP_GO);
            XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);
        }

        /* N - update the num_step field */
        else if (command == 'N' || command == 'n') {
            numStep = input_check("\r\nEnter number of steps (0 to 2097151): ", 0, NUM_STEP_MAX);

            config &= ~((u32)NUM_STEP_MAX << BIT_NUM_STEP);
            config |=  ((u32)(numStep & NUM_STEP_MAX)) << BIT_NUM_STEP;
            XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);

            xil_printf("Step count set to %d.\r\n", numStep);
        }

        /* P - toggle spindle on/off */
        else if (command == 'P' || command == 'p') {
            config ^= (1 << BIT_SPINDLE_EN);
            xil_printf("Spindle power %s.\r\n", (config >> BIT_SPINDLE_EN) & 1 ? "on" : "off");
            XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);
        }

        /* D - toggle stepper direction */
        else if (command == 'D' || command == 'd') {
            config ^= (1 << BIT_STEPPER_DIR);
            xil_printf("Stepper direction %s.\r\n", (config >> BIT_STEPPER_DIR) & 1 ? "forwards" : "backwards");
            XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);
        }

        /* Q - toggle stepper on/off */
        else if (command == 'Q' || command == 'q') {
            config ^= (1 << BIT_STEPPER_EN);
            xil_printf("Stepper power %s.\r\n", (config >> BIT_STEPPER_EN) & 1 ? "on" : "off");
            XGpio_DiscreteWrite(&gpio, 1, config & GPIO_MASK);
        }

        /* L - toggle laser on/off */
        else if (command == 'L' || command == 'l') {
            config ^= (1 << BIT_LASER_EN);
            xil_printf("Laser power %s.\r\n", (config >> BIT_LASER_EN) & 1 ? "on" : "off");
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
