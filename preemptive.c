#include <8051.h>
#include "preemptive.h"

// Global Variables
__data __at (0x20) unsigned char savedSP0;
__data __at (0x21) unsigned char savedSP1;
__data __at (0x22) unsigned char savedSP2;
__data __at (0x23) unsigned char savedSP3;
__data __at (0x24) ThreadID currentThread;
__data __at (0x25) unsigned char threadMask;
__data __at (0x26) ThreadID candidateThread;
__data __at (0x27) unsigned char candidateMask;
__data __at (0x28) unsigned char previousSP;
__data __at (0x29) unsigned char zeroValue;
__data __at (0x2A) unsigned char newThreadPSW;
__data __at (0x2B) unsigned char savedFpLow;
__data __at (0x2C) unsigned char savedFpHigh;
__data __at (0x2D) unsigned char savedEA;

#define CAT2(a, b) a##b
#define CAT(a, b) CAT2(a, b)

#define SAVESTATE SAVESTATE_IMPL(__LINE__)
#define SAVESTATE_IMPL(line)                            \
    __asm                                              \
        push acc                                       \
        push b                                         \
        push dpl                                       \
        push dph                                       \
        push psw                                       \
        mov a, _currentThread                          \
        jz CAT(SS_SAVE_0_, line)                       \
        dec a                                          \
        jz CAT(SS_SAVE_1_, line)                       \
        dec a                                          \
        jz CAT(SS_SAVE_2_, line)                       \
        mov _savedSP3, sp                              \
        sjmp CAT(SS_SAVE_DONE_, line)                  \
    CAT(SS_SAVE_0_, line):                             \
        mov _savedSP0, sp                              \
        sjmp CAT(SS_SAVE_DONE_, line)                  \
    CAT(SS_SAVE_1_, line):                             \
        mov _savedSP1, sp                              \
        sjmp CAT(SS_SAVE_DONE_, line)                  \
    CAT(SS_SAVE_2_, line):                             \
        mov _savedSP2, sp                              \
    CAT(SS_SAVE_DONE_, line):                          \
    __endasm

#define RESTORESTATE RESTORESTATE_IMPL(__LINE__)
#define RESTORESTATE_IMPL(line)                         \
    __asm                                              \
        mov a, _currentThread                          \
        jz CAT(RS_LOAD_0_, line)                       \
        dec a                                          \
        jz CAT(RS_LOAD_1_, line)                       \
        dec a                                          \
        jz CAT(RS_LOAD_2_, line)                       \
        mov sp, _savedSP3                              \
        sjmp CAT(RS_LOAD_DONE_, line)                  \
    CAT(RS_LOAD_0_, line):                             \
        mov sp, _savedSP0                              \
        sjmp CAT(RS_LOAD_DONE_, line)                  \
    CAT(RS_LOAD_1_, line):                             \
        mov sp, _savedSP1                              \
        sjmp CAT(RS_LOAD_DONE_, line)                  \
    CAT(RS_LOAD_2_, line):                             \
        mov sp, _savedSP2                              \
    CAT(RS_LOAD_DONE_, line):                          \
        pop psw                                        \
        pop dph                                        \
        pop dpl                                        \
        pop b                                          \
        pop acc                                        \
    __endasm

extern void main(void);

void scheduler(void) __naked
{
    __asm
    SCHED_LOOP:
        inc _currentThread
        mov a, _currentThread
        cjne a, #0x04, SCHED_CHECK
        mov _currentThread, #0x00

    SCHED_CHECK:
        mov a, _currentThread
        jz SCHED_THREAD0
        dec a
        jz SCHED_THREAD1
        dec a
        jz SCHED_THREAD2

        mov a, _threadMask     ; currentThread == 3
        anl a, #0x08
        jz SCHED_LOOP
        ret

    SCHED_THREAD0:
        mov a, _threadMask
        anl a, #0x01
        jz SCHED_LOOP
        ret

    SCHED_THREAD1:
        mov a, _threadMask
        anl a, #0x02
        jz SCHED_LOOP
        ret

    SCHED_THREAD2:
        mov a, _threadMask
        anl a, #0x04
        jz SCHED_LOOP
        ret
    __endasm;
}

void Bootstrap(void)
{
    EA = 0;

    threadMask = 0x00;
    currentThread = 0;

    TMOD = 0x00;       
    IE = 0x02;         
    TR0 = 1;           

    currentThread = ThreadCreate(main);

    RESTORESTATE;
    EA = 1;
}

ThreadID ThreadCreate(FunctionPtr fp)
{
    (void)fp;  

    __asm
        mov _savedFpLow, dpl
        mov _savedFpHigh, dph
    __endasm;

    if (EA)
    {
        savedEA = 1;
    }
    else
    {
        savedEA = 0;
    }
    EA = 0;

    if ((threadMask & 0x01) == 0)
    {
        candidateThread = 0;
        candidateMask = 0x01;
        newThreadPSW = 0x00;
        previousSP = SP;
        SP = 0x3F;
    }
    else if ((threadMask & 0x02) == 0)
    {
        candidateThread = 1;
        candidateMask = 0x02;
        newThreadPSW = 0x08;
        previousSP = SP;
        SP = 0x4F;
    }
    else if ((threadMask & 0x04) == 0)
    {
        candidateThread = 2;
        candidateMask = 0x04;
        newThreadPSW = 0x10;
        previousSP = SP;
        SP = 0x5F;
    }
    else if ((threadMask & 0x08) == 0)
    {
        candidateThread = 3;
        candidateMask = 0x08;
        newThreadPSW = 0x18;
        previousSP = SP;
        SP = 0x6F;
    }
    else
    {
        if (savedEA)
        {
            EA = 1;
        }
        return (ThreadID)-1;
    }

    threadMask |= candidateMask;
    zeroValue = 0x00;

    __asm
        push _savedFpLow
        push _savedFpHigh
        push _zeroValue       ; ACC
        push _zeroValue       ; B
        push _zeroValue       ; DPL
        push _zeroValue       ; DPH
        push _newThreadPSW    ; PSW selects register bank
    __endasm;

    if (candidateThread == 0)
    {
        savedSP0 = SP;
    }
    else if (candidateThread == 1)
    {
        savedSP1 = SP;
    }
    else if (candidateThread == 2)
    {
        savedSP2 = SP;
    }
    else
    {
        savedSP3 = SP;
    }

    SP = previousSP;

    if (savedEA)
    {
        EA = 1;
    }

    return candidateThread;
}

void ThreadYield(void)
{
    EA = 0;
    SAVESTATE;
    __asm
        lcall _scheduler
    __endasm;
    RESTORESTATE;
    EA = 1;
}

void ThreadExit(void)
{
    EA = 0;

    if (currentThread == 0)
    {
        threadMask &= 0xFE;
    }
    else if (currentThread == 1)
    {
        threadMask &= 0xFD;
    }
    else if (currentThread == 2)
    {
        threadMask &= 0xFB;
    }
    else
    {
        threadMask &= 0xF7;
    }

    if (threadMask == 0)
    {
        while (1)
        {
            // Emptjjjy
        }
    }

    __asm
        lcall _scheduler
    __endasm;
    RESTORESTATE;
    EA = 1;
}

void myTimer0Handler(void) __naked
{
    SAVESTATE;
    __asm
        lcall _scheduler
    __endasm;
    RESTORESTATE;
    __asm
        reti
    __endasm;
}
