/*******************************************************************************
  MPLAB Harmony Application Source File
  
  Company:
    Microchip Technology Inc.
  
  File Name:
    app.c

  Summary:
    This file contains the source code for the MPLAB Harmony application.

  Description:
    This file contains the source code for the MPLAB Harmony application.  It 
    implements the logic of the application's state machine and it may call 
    API routines of other MPLAB Harmony modules in the system, such as drivers,
    system services, and middleware.  However, it does not call any of the
    system interfaces (such as the "Initialize" and "Tasks" functions) of any of
    the modules in the system or make any assumptions about when those functions
    are called.  That is the responsibility of the configuration-specific system
    files.
 *******************************************************************************/

// DOM-IGNORE-BEGIN
/*******************************************************************************
Copyright (c) 2013-2014 released Microchip Technology Inc.  All rights reserved.

Microchip licenses to you the right to use, modify, copy and distribute
Software only when embedded on a Microchip microcontroller or digital signal
controller that is integrated into your product or third party product
(pursuant to the sublicense terms in the accompanying license agreement).

You should refer to the license agreement accompanying this Software for
additional information regarding your rights and obligations.

SOFTWARE AND DOCUMENTATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND,
EITHER EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION, ANY WARRANTY OF
MERCHANTABILITY, TITLE, NON-INFRINGEMENT AND FITNESS FOR A PARTICULAR PURPOSE.
IN NO EVENT SHALL MICROCHIP OR ITS LICENSORS BE LIABLE OR OBLIGATED UNDER
CONTRACT, NEGLIGENCE, STRICT LIABILITY, CONTRIBUTION, BREACH OF WARRANTY, OR
OTHER LEGAL EQUITABLE THEORY ANY DIRECT OR INDIRECT DAMAGES OR EXPENSES
INCLUDING BUT NOT LIMITED TO ANY INCIDENTAL, SPECIAL, INDIRECT, PUNITIVE OR
CONSEQUENTIAL DAMAGES, LOST PROFITS OR LOST DATA, COST OF PROCUREMENT OF
SUBSTITUTE GOODS, TECHNOLOGY, SERVICES, OR ANY CLAIMS BY THIRD PARTIES
(INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF), OR OTHER SIMILAR COSTS.
 *******************************************************************************/
// DOM-IGNORE-END


// *****************************************************************************
// *****************************************************************************
// Section: Included Files 
// *****************************************************************************
// *****************************************************************************

#include "app.h"
#include "BNO055.h"

// *****************************************************************************
// *****************************************************************************
// Section: Global Data Definitions
// *****************************************************************************
// *****************************************************************************

// *****************************************************************************
/* Application Data

  Summary:
    Holds application data

  Description:
    This structure holds the application's data.

  Remarks:
    This structure should be initialized by the APP_Initialize function.
    
    Application strings and buffers are be defined outside this structure.
*/

APP_DATA appData;

const char *string1 = "*** Vacuum Compatibility Test One: Chipkit Mx7 ***\r\n";
const char *string2 = "*** String2 ***\r\n";
volatile unsigned int delay = 100000;

// *****************************************************************************
// *****************************************************************************
// Section: Application Callback Functions
// *****************************************************************************
// *****************************************************************************

/* TODO:  Add any necessary callback funtions.
*/

// *****************************************************************************
// *****************************************************************************
// Section: Application Local Functions
// *****************************************************************************
// *****************************************************************************

/* TODO:  Add any necessary local functions.
*/


// *****************************************************************************
// *****************************************************************************
// Section: Application Initialization and State Machine Functions
// *****************************************************************************
// *****************************************************************************

/*******************************************************************************
  Function:
    void APP_Initialize ( void )

  Remarks:
    See prototype in app.h.
 */

void APP_Initialize ( void )
{
    /* Place the App state machine in its initial state. */
    appData.state = APP_STATE_INIT;
    appData.seconds = 0;
    appData.min = 0;
    appData.stringIndex = 0;
}

/******************************************************************************
  Function:
    void APP_Tasks ( void )

  Remarks:
    See prototype in app.h.
 */

void APP_Tasks ( void )
{
    /* Check the application's current state. */
    switch ( appData.state )
    {
        /* Application's initial state. */
        case APP_STATE_INIT:
        {
            appData.state = APP_STATE_RUN;
            appData.stringPointer = string1;
            
            break;
        }
        
        case APP_STATE_RUN:
        {
            if(true == WriteString())
            {
                PLIB_PORTS_PinWrite(PORTS_ID_0, PORT_CHANNEL_G, PORTS_BIT_POS_15, 1);
                appData.stringPointer = string2;
                appData.state = APP_STATE_PRINT;
            }           
            break;
        }
        
        case APP_STATE_PRINT:
        {
            sprintf(appData.buffer, "Minutes: %i, Seconds: %i \n",appData.min,appData.seconds);
            appData.stringPointer = appData.buffer;
            
            if(true == WriteStringTwo())
            {
                PLIB_PORTS_PinWrite(PORTS_ID_0, PORT_CHANNEL_G, PORTS_BIT_POS_13, 1);
                appData.state = APP_STATE_DELAY;
            }
          
            break;
        }
        
        case APP_STATE_DELAY:
        {
            PLIB_PORTS_PinWrite(PORTS_ID_0, PORT_CHANNEL_G, PORTS_BIT_POS_14, 1);
            if(appData.seconds == 59)
            {
                appData.seconds = 0;
                appData.min = appData.min + 1;
            }
            else
                appData.seconds = appData.seconds + 1;
  
            vTaskDelay(1000 / portTICK_PERIOD_MS);
            appData.state = APP_STATE_PRINT;
            break;
        }

        /* The default state should never be executed. */
        default:
        {
            SYS_DEBUG (SYS_ERROR_FATAL,"ERROR! Invalid state\r\n");
            while (1);
        }
    }
}
bool WriteStringTwo(void)
{
    if(appData.buffer[appData.stringIndex] == '\0')
    {
        appData.stringIndex = 0;
        return true;
    }

    /* Write a character at a time, only if transmitter is empty */
    while (PLIB_USART_TransmitterIsEmpty(USART_ID_1))
    {
        /* Send character */
        PLIB_USART_TransmitterByteSend(USART_ID_1, appData.buffer[appData.stringIndex]);

        /* Increment to address of next character */
        appData.stringIndex++;

        if(appData.buffer[appData.stringIndex] == '\0')
        {
            appData.stringIndex = 0;
            return true;
        }
    }
    return false;
}

bool WriteString(void)
{
    if(*appData.stringPointer == '\0')
    {
        return true;
    }

    /* Write a character at a time, only if transmitter is empty */
    while (PLIB_USART_TransmitterIsEmpty(USART_ID_1))
    {
        /* Send character */
        PLIB_USART_TransmitterByteSend(USART_ID_1, *appData.stringPointer);

        /* Increment to address of next character */
        appData.stringPointer++;

        if(*appData.stringPointer == '\0')
        {
            return true;
        }
    }
    return false;
}

void delay_some(volatile unsigned int delay)
{
    while(delay--);
}
/*******************************************************************************
 End of File
 */
