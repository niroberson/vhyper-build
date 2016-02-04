/****************************************************************************/
// Vhyper:        	Hello World Application
// File name:       HelloVhyper.c
// Description:     This program is a simple hello world application that
// 					prints data over UART to a terminal command.
// 					The Vhyper_UART library is useful for debugging without
// 					OLED display
/****************************************************************************/

#define _PLIB_DISABLE_LEGACY
#include <stdio.h>
#include <time.h>
#include <plib.h>
#include <stdlib.h>
#include "PmodOLED.h"
#include "OledChar.h"
#include "OledGrph.h"
#include "delay.h"
#include "Vhyper_UART.h"

// Digilent board configuration
#pragma config ICESEL       = ICS_PGx1  // ICE/ICD Comm Channel Select
#pragma config DEBUG        = OFF       // Debugger Disabled for Starter Kit
#pragma config FNOSC        = PRIPLL	// Oscillator selection
#pragma config POSCMOD      = XT	// Primary oscillator mode
#pragma config FPLLIDIV     = DIV_2	// PLL input divider
#pragma config FPLLMUL      = MUL_20	// PLL multiplier
#pragma config FPLLODIV     = DIV_1	// PLL output divider
#pragma config FPBDIV       = DIV_8	// Peripheral bus clock divider
#pragma config FSOSCEN      = OFF	// Secondary oscillator enable


// Function prototypes
// Function to delay for arbitrary amount of time
void delaySec(int sec);

//Function to delay two seconds
void countTwoSeconds();

//Function to delay five seconds.
void countFiveSeconds();

// Global variables
unsigned int oneSecond;
unsigned int fiveSeconds;
unsigned int sec1000; // This is updated 1000 times per second by the interrupt handler
unsigned char buttonOneHistory = 0x00;
unsigned char buttonTwoHistory = 0x00;
unsigned char buttonThreeHistory = 0x00;

//The following code is the interrupt handler which countes number of milliseconds and
//also samples button presses every millisecond in order to debounce buttons.
#pragma interrupt InterruptHandler_2534 ipl1 vector 0
void InterruptHandler_2534( void ){
    if(INTGetFlag(INT_T2))      // Verify source of interrupt
    {
        if(PORTG & 0x40)
        {       //Read Button in PORT G Bit 6
            buttonOneHistory = buttonOneHistory << 1;   // Shift the values to the left by one
            buttonOneHistory = buttonOneHistory + 1;    // Add a 1 to the end
        }
        else if(PORTG & 0x80)
        {   //Read Button in Port G bit 7
            buttonTwoHistory = buttonTwoHistory << 1;   //Shift the values to the left by one
            buttonTwoHistory = buttonTwoHistory + 1;    //Add a 1 to the end
        }
        else if(PORTA & 0x01)
        {   //Read Button in Port G bit 7
            buttonThreeHistory = buttonThreeHistory << 1;   //Shift the values to the left by one
            buttonThreeHistory = buttonThreeHistory + 1;    //Add a 1 to the end
        }
        else
        {
            buttonThreeHistory = buttonThreeHistory << 1; //Else, start shifting bits out
            buttonTwoHistory = buttonTwoHistory << 1;
            buttonOneHistory = buttonOneHistory << 1;} //Else, start shifting bits out

        sec1000++;              // Update global variable
        fiveSeconds++;
        if(sec1000 == 1000)
        {
            sec1000 = 0;
            oneSecond+=1;
        }

        INTClearFlag(INT_T2);   // Acknowledge interrupt
    }
    return;

}

int main()
{
    // Set up Timer2 to roll over every millisecond
    OpenTimer2(T2_ON | T2_IDLE_CON | T2_SOURCE_INT  | T2_PS_1_16 | T2_GATE_OFF, 624);

    // Set up CPU to respond to interrupts from Timer2
    INTSetVectorPriority(INT_TIMER_2_VECTOR, INT_PRIORITY_LEVEL_1);
    INTClearFlag(INT_T2);
    INTEnable(INT_T2, INT_ENABLED);
    INTConfigureSystem(INT_SYSTEM_CONFIG_SINGLE_VECTOR);
    INTEnableInterrupts();

    // Initialize GPIO for BTN1-3 and LED1-4
    DDPCONbits.JTAGEN = 0; //Disable JTAG to enable BTN 3 use
    TRISGSET = 0xC0;     // For BTN1 - 2: configure PortG bit for input
    TRISASET = 0x01;     // For BTN3: configure PortG bit for input
    TRISGCLR = 0xF000;   // For LED1-4: configure PortG pin for output
    ODCGCLR  = 0xF000;   // For LED1-4: configure as normal output (not open drain)


    UINT32 sourceClock = 10000000;  //Clock Frequency 10MHz
    UINT32 dataRate = 9600; 		//BaudRate
    initUART(UART1, sourceClock, dataRate); //initialize UART communication

    enum states {titleScreen, work} UARTstate;

    UARTstate = titleScreen; //Initial conditions

    //Main processing loop
    while (1)
    {
        switch(UARTstate)
        {
            //In titleScreen state, Oled displays a title screen that swithces
            // to main menu screen after five seconds
            case titleScreen:
            {
                unsigned char lineOne[] = "Welcome to the build phase! - VHyper\n\r";
                UARTSendString(UART1, lineOne);

                LATGSET = 0xF << 12;

                delaySec(1);
                UARTstate = work;

                break;
            }

            case work:
            {
                int i = 0;
                char data = 65;

                for(i = 65; i < 123; i++)
                {
                    UARTSendByte(UART1,data);
                    data++;
                    LATGSET = 0xF << 12;
                    delaySec(1);
                    LATGCLR = 0xF << 12;
                    delaySec(1);
                }
                
                break;
            }

            default:
            {
            }
        }

    }
    return 0;
}

// Function to delay for arbitrary amount of time
void delaySec(int sec)
{
	oneSecond = 0;
	while(oneSecond < sec)
	{

	}
}

//Function to delay two seconds
void countTwoSeconds()
{
    oneSecond = 0;

    while(oneSecond < 2)
    {

    }
}
//Function to delay five seconds
void countFiveSeconds()
{
    oneSecond = 0;
    while(oneSecond < 5)
    {

    }
}