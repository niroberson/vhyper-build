/* ************************************************************************** */
/** Vhyper UART Header File

  @Company
    Vhyper

  @File Name
    Vhyper_UART.h

  @Summary
    Header file for UART functionality on Cerebots

  @Description
    Provides the functionality of the UART interface.
    Useful for debugging apps without OLED display.
 */
/* ************************************************************************** */

#ifndef _VHYPER_UART_H_    /* Guard against multiple inclusion */
#define _VHYPER_UART_H_

#include "uart.h"

// Inputs UART channel, peripheral clock speed, and baud rate. No outputs
void initUART(UART_MODULE uart, unsigned int sourceClock, unsigned int dataRate); 
    
// Send string via UART. Inputs UART channel, string to be sent
void UARTSendString(UART_MODULE uart, unsigned char string[]);
    
//Function to receive string, inputs UART channel, outputs pointer to string received.
char * UARTReceiveString (UART_MODULE uart);
    
// Send a byte over UART
void UARTSendByte(UART_MODULE uart, char data); 

// Transmit integer as a string 
void UARTSendInt(UART_MODULE uart, int data);

#endif 

/* *****************************************************************************
 End of File
 */
