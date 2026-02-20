/*
 * systemControl.c - Interactive motor and laser controller for the RAPID system.
 *
 * Runs on the Zynq PS (ARM Cortex-A9).  Reads initial configuration from the
 * user over UART, writes a packed 7-bit control word to a GPIO output channel,
 * then enters a command loop that allows real-time adjustment of the spindle
 * and stepper motor without restarting the system.
 *
 * GPIO output word layout (30 bits, channel 1):
 *   Bit  0        spindle_en   Spindle enable         (0=off, 1=on)
 *   Bit  1        stepper_dir  Stepper direction      (0=backwards, 1=forwards)
 *   Bit  2        stepper_en   Stepper enable         (0=off, 1=on)
 *   Bit  3        zero_req     Zero/home request      (momentary high)
 *   Bits 4-24     num_step     Step count             (0 to 2^21-1)
 *   Bit  25       step_go      Step go pulse          (momentary high)
 *   Bits 27:26    M[0] enc     M[0] signal encoding   (00=low, 10=high, 11=hi-Z)
 *   Bits 29:28    M[1] enc     M[1] signal encoding   (00=low, 10=high, 11=hi-Z)
 *
 * Interactive commands (case-insensitive):
 *   P - toggle spindle power
 *   D - toggle stepper direction
 *   Q - toggle stepper power
 *   Z - pulse zero request line
 *   N - set number of steps
 *   G - pulse step go line
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
//#define GPIO_MASK       0x7F
#define GPIO_MASK       0x03FFFFFFF


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
/*M field, two bit per M bit to indicate high, low, or float -- used for step size*/
#define BIT_M0              26              /* M[0] encoding LSB, bits 27:26 */
#define BIT_M1              28              /* M[1] encoding LSB, bits 29:28 */
#define M0_FIELD_MASK       ((u32)0x03 << BIT_M0)
#define M1_FIELD_MASK       ((u32)0x03 << BIT_M1)
#define M_FIELD_MASK        (M0_FIELD_MASK | M1_FIELD_MASK)
/* 2-bit encoding values for each M signal */
#define M_ENC_LOW           0x00            /* 00 = drive low  */
#define M_ENC_HIGH          0x02            /* 10 = drive high */
#define M_ENC_HIZ           0x03            /* 11 = hi-Z       */


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
/*encode user input as 1, 0, or Z for M microstep output*/
static int encode_m_char(char c)
{
    if (c == '0')              return M_ENC_LOW;
    if (c == '1')              return M_ENC_HIGH;
    if (c == 'Z' || c == 'z') return M_ENC_HIZ;
    return -1;
}

/*decode user input to display char back*/
static char decode_m_enc(u32 enc)
{
    switch (enc & 0x03) {
        case M_ENC_LOW:  return '0';
        case M_ENC_HIGH: return '1';
        case M_ENC_HIZ:  return 'Z';
        default:         return '?'; /* 01 - unused/invalid */
    }
}

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
/*prompt M1:0, pack encoding into config, write GPIO,*/
static u32 input_m_field(void)
{
    char buf[8];
    int  idx;

    while (1) {
        xil_printf("\r\nEnter M[1:0] (e.g. 00, 10, Z1, ZZ; 0=low, 1=high, Z=hi-Z): ");
        idx = 0;

        while (1) {
            char c = inbyte();
            if (c == '\r' || c == '\n') {
                buf[idx] = '\0';
                xil_printf("\r\n");
                break;
            }
            if ((c == 0x08 || c == 0x7F) && idx > 0) {
                idx--;
                xil_printf("\b \b");
                continue;
            }
            if (idx < (int)sizeof(buf) - 1) {
                buf[idx++] = c;
                xil_printf("%c", c);
            }
        }

        if (buf[0] == '\0' || buf[1] == '\0' || buf[2] != '\0') {
            xil_printf("Invalid. Enter exactly 2 characters (e.g. Z0, 10, ZZ).\r\n");
            continue;
        }

        int enc1 = encode_m_char(buf[0]);
        int enc0 = encode_m_char(buf[1]);

        if (enc1 < 0) { xil_printf("Invalid character '%c'. Use 0, 1, or Z.\r\n", buf[0]); continue; }
        if (enc0 < 0) { xil_printf("Invalid character '%c'. Use 0, 1, or Z.\r\n", buf[1]); continue; }

        xil_printf("M field: M[1]=%c (enc=%02u), M[0]=%c (enc=%02u).\r\n",
                   decode_m_enc(enc1), (unsigned)enc1,
                   decode_m_enc(enc0), (unsigned)enc0);

        return ((u32)enc1 << BIT_M1) | ((u32)enc0 << BIT_M0);
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
               " M - set M[1:0] field (0=low, 1=high, Z=hi-Z; e.g. Z0, 1Z, 00)\r\n"
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
    xil_printf("\r\nConfigure M[1:0] microstep encoding.\r\n");
    u32 mField     = input_m_field();


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
    config |= mField;

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

        else if (command == 'M' || command == 'm') {
            config &= ~M_FIELD_MASK;
            config |= input_m_field();
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
