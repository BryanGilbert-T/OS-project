#include <8051.h>
#include "preemptive.h"

// Global Variables
__data __at (0x30) char sharedChar;
__data __at (0x31) char bufferFull;
__data __at (0x32) char nextChar;
__data __at (0x33) char consumedChar;

void Producer(void)
{
    nextChar = 'A';

    while (1)
    {
        while (bufferFull)
        {
            // Empty
        }

        EA = 0;
        sharedChar = nextChar;
        bufferFull = 1;
        EA = 1;

        nextChar++;
        if (nextChar > 'Z')
        {
            nextChar = 'A';
        }
    }
}

void Consumer(void)
{
    TMOD |= 0x20;
    TH1 = 0xFA;
    TL1 = 0xFA;
    SCON = 0x50;
    TR1 = 1;
    TI = 1;

    while (1)
    {
        while (!bufferFull)
        {
            // Empty
        }

        EA = 0;
        consumedChar = sharedChar;
        bufferFull = 0;
        EA = 1;

        TI = 0;
        SBUF = consumedChar;
        while (TI == 0)
        {
            // Waiting
        }
        TI = 0;
    }
}

void main(void)
{
    sharedChar = ' ';
    bufferFull = 0;

    ThreadCreate(Producer);
    Consumer();
}

void _sdcc_gsinit_startup(void)
{
    __asm
        LJMP _Bootstrap
    __endasm;
}

void _mcs51_genRAMCLEAR(void) {}
void _mcs51_genXINIT(void) {}
void _mcs51_genXRAMCLEAR(void) {}

void timer0_ISR(void) __interrupt(1)
{
    __asm
        ljmp _myTimer0Handler
    __endasm;
}
