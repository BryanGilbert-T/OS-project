/*
 * file: testcoop.c
 */
#include <8051.h>
#include "cooperative.h"

/*
 * [TODONE]
 * declare your global variables here, for the shared buffer
 * between the producer and consumer.
 * Hint: you may want to manually designate the location for the
 * variable.  you can use
 *        __data __at (0x30) type var;
 * to declare a variable var of the type
 */
__data __at (0x30) char sharedChar;
__data __at (0x31) char bufferFull;
__data __at (0x32) char nextChar;

/* [TODONE for this function]
 * the producer in this test program generates one characters at a
 * time from 'A' to 'Z' and starts from 'A' again. The shared buffer
 * must be empty in order for the Producer to write.
 */
void Producer(void)
{
    /*
     * [TODONE]
     * initialize producer data structure, and then enter
     * an infinite loop (does not return)
     */
    nextChar = 'A';

    while (1)
    {
        /* [TODONE]
         * wait for the buffer to be available,
         * and then write the new data into the buffer */
        while (bufferFull)
        {
            ThreadYield();
        }
        
        sharedChar = nextChar;
        bufferFull = 1;

        nextChar++;
        if (nextChar > 'Z')
        {
            nextChar = 'A';
        }

        ThreadYield();
    }
}

/* [TODONE for this function]
 * the consumer in this test program gets the next item from
 * the queue and consume it and writes it to the serial port.
 * The Consumer also does not return.
 */
void Consumer(void)
{
    /*
     * [TODONE]
     * initialize Tx for polling
     */
    TMOD = 0x20;
    TH1 = 0xFA;
    TL1 = 0xFA;
    SCON = 0x50;
    TR1 = 1;
    TI = 1;

    while (1)
    {
        /*
         * [TODONE]
         * wait for new data from producer
         */
        while (!bufferFull)
        {
            ThreadYield();
        }

        /*
         * [TODONE]
         * write data to serial port Tx,
         * poll for Tx to finish writing (TI),
         * then clear the flag
         */
        TI = 0;
        SBUF = sharedChar;
        while (TI == 0){
            // Exhaust TI
        }
        TI = 0;
        bufferFull = 0;

        ThreadYield();
    }
}

/* [TODONE for this function]
 * main() is started by the thread bootstrapper as thread-0.
 * It can create more thread(s) as needed:
 * one thread can act as producer and another as consumer.
 */
void main(void)
{
    /*
     * [TODONE]
     * initialize globals
     */
    sharedChar = ' ';
    bufferFull = 0;

    
    /*
     * [TODONE]
     * set up Producer and Consumer.
     * Because both are infinite loops, there is no loop
     * in this function and no return.
     */
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
