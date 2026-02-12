#include "xgpio.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "platform.h"
#include "sleep.h"

#include <stdio.h>
#include <stdint.h>

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