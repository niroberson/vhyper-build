/* ************************************************************************** */
/** Descriptive File Name

  @Company
    Vhyper

  @File Name
    Vhyper_UART.c

  @Summary
    Implementation file of UART interface.

  @Description
    Implementation of UART header file. 
 */
/* ************************************************************************** */

#include "Vhyper_UART.h"


//UART initialization function
void initUART(UART_MODULE uart, unsigned int sourceClock, unsigned int dataRate)
{
    UINT32 actualDataRate;
    
    // Basic Configuration
    UARTConfigure (uart, UART_ENABLE_PINS_TX_RX_ONLY); 

    // 8bits, no parity, 1 stop bit
    UARTSetLineControl(uart, UART_DATA_SIZE_8_BITS|UART_PARITY_NONE|UART_STOP_BITS_1); 

    // Set data rate
    actualDataRate = UARTSetDataRate(uart, sourceClock, dataRate); 

    // Enable UART_PERIPHERAL, UART_RX and UART_TX
    UARTEnable(uart, UART_ENABLE_FLAGS(UART_PERIPHERAL | UART_RX | UART_TX));
}

//Function to receive array of characters, implementation of backspace key
char * UARTReceiveString (UART_MODULE uart)
{
    int i = 0;
    static char getData[59];
    for(i = 0; i < 59; i++)
    {
        while(!UARTReceivedDataIsAvailable(UART1))
        {

        }
        getData[i] = UARTGetDataByte(UART1);
        if(getData[i] == 8) //Backspace key implementation
        {
            i = i - 2;
            LATGSET = 1 << 12;
        }
    }
    return getData;
}

//Function to transmit string through UART
void UARTSendString(UART_MODULE uart, unsigned char string[])
{
    int i = 0;
    while(!string[i]=='\0')
    {
        while(!UARTTransmitterIsReady(UART1))
        {

        }
        UARTSendDataByte(UART1, string[i]);
        i++;
    }
}

//Function to transmit integer through UART
void UARTSendByte(UART_MODULE uart, char data)
{
    UARTSendDataByte(UART1, data);
}

// Transmit integer as a string to UART
void UARTSendInt(UART_MODULE uart, int data)
{
	unsigned char buffer[33];
	//itoa(data, buffer, 10);
	//UARTSendString(buffer);
}

/* *****************************************************************************
 End of File
 */

