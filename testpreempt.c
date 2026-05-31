#include <8051.h>
#include "preemptive.h"

__data __at (0x30) Semaphore mutex;
__data __at (0x31) Semaphore full;
__data __at (0x32) Semaphore empty;
__data __at (0x33) char buffer[3];
__data __at (0x36) char head;
__data __at (0x37) char tail;
__data __at (0x38) char nextChar;
__data __at (0x39) char consumedChar;

void Producer(void)
{
    nextChar = 'A';

    while (1)
    {
        SemaphoreWait(empty);
        SemaphoreWait(mutex);

        buffer[head] = nextChar;
        head++;
        if (head == 3)
        {
            head = 0;
        }

        SemaphoreSignal(mutex);
        SemaphoreSignal(full);

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
        SemaphoreWait(full);
        SemaphoreWait(mutex);

        consumedChar = buffer[tail];
        tail++;
        if (tail == 3)
        {
            tail = 0;
        }

        SemaphoreSignal(mutex);
        SemaphoreSignal(empty);

        TI = 0;
        SBUF = consumedChar;
        while (TI == 0)
        {
        }
        TI = 0;
    }
}

void main(void)
{
    buffer[0] = ' ';
    buffer[1] = ' ';
    buffer[2] = ' ';
    head = 0;
    tail = 0;

    SemaphoreCreate(mutex, 1);
    SemaphoreCreate(full, 0);
    SemaphoreCreate(empty, 3);

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
