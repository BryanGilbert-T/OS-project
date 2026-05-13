#include <8051.h>

#include "cooperative.h"

/*
 * [TODONE]
 * declare the static globals here using
 *        __data __at (address) type name; syntax
 * manually allocate the addresses of these variables, for
 * - saved stack pointers (MAXTHREADS)
 * - current thread ID
 * - a bitmap for which thread ID is a valid thread;
 *   maybe also a count, but strictly speaking not necessary
 * - plus any temporaries that you need.
 */
__data __at (0x20) unsigned char savedSP[MAXTHREADS];
__data __at (0x24) ThreadID currentThread;
__data __at (0x25) unsigned char threadMask;
__data __at (0x26) ThreadID candidateThread;
__data __at (0x27) unsigned char candidateMask;
__data __at (0x28) unsigned char previousSP;
__data __at (0x29) unsigned char zeroValue;
__data __at (0x2A) unsigned char newThreadPSW;
__data __at (0x2B) unsigned char savedFpLow;
__data __at (0x2C) unsigned char savedFpHigh;

/*
 * [TODONE]
 * define a macro for saving the context of the current thread by
 * 1) push ACC, B register, Data pointer registers (DPL, DPH), PSW
 * 2) save SP into the saved Stack Pointers array
 *   as indexed by the current thread ID.
 * Note that 1) should be written in assembly,
 *     while 2) can be written in either assembly or C
 */
#define SAVESTATE                           \
    {                                       \
        __asm                               \
            push acc                        \
            push b                          \
            push dpl                        \
            push psw                        \
            push dph                        \
        __endasm;                           \
        savedSP[currentThread] = SP;        \
    }

/*
 * [TODONE]
 * define a macro for restoring the context of the current thread by
 * essentially doing the reverse of SAVESTATE:
 * 1) assign SP to the saved SP from the saved stack pointer array
 * 2) pop the registers PSW, data pointer registers, B reg, and ACC
 * Again, popping must be done in assembly but restoring SP can be
 * done in either C or assembly.
 */
#define RESTORESTATE                        \
    {                                       \
        SP = savedSP[currentThread];        \
        __asm                               \
            pop psw                         \
            pop dph                         \
            pop dpl                         \
            pop b                           \
            pop acc                         \
        __endasm;                           \
    }

/*
 * we declare main() as an extern so we can reference its symbol
 * when creating a thread for it.
 */

extern void main(void);

/*
 * Bootstrap is jumped to by the startup code to make the thread for
 * main, and restore its context so the thread can run.
 */

void Bootstrap(void)
{
    /*
     * [TODONE]
     * initialize data structures for threads (e.g., mask)
     *
     * optional: move the stack pointer to some known location
     * only during bootstrapping. by default, SP is 0x07.
     *
     * [TODONE]
     *     create a thread for main; be sure current thread is
     *     set to this thread ID, and restore its context,
     *     so that it starts running main().
     */
    threadMask = 0x00;
    currentThread = ThreadCreate(main);
    RESTORESTATE;
}

/*
 * ThreadCreate() creates a thread data structure so it is ready
 * to be restored (context switched in).
 * The function pointer itself should take no argument and should
 * return no argument.
 */
ThreadID ThreadCreate(FunctionPtr fp)
{
    /*
     * [TODONE]
     * check to see we have not reached the max #threads.
     * if so, return -1, which is not a valid thread ID.
     */
    /*
     * [TODONE]
     *     otherwise, find a thread ID that is not in use,
     *     and grab it. (can check the bit mask for threads),
     *
     * [TODONE] below
     * a. update the bit mask
         (and increment thread count, if you use a thread count,
          but it is optional)
       b. calculate the starting stack location for new thread
       c. save the current SP in a temporary
          set SP to the starting location for the new thread
       d. push the return address fp (2-byte parameter to
          ThreadCreate) onto stack so it can be the return
          address to resume the thread. Note that in SDCC
          convention, 2-byte ptr is passed in DPTR.  but
          push instruction can only push it as two separate
          registers, DPL and DPH.
       e. we want to initialize the registers to 0, so we
          assign a register to 0 and push it four times
          for ACC, B, DPL, DPH.  Note: push #0 will not work
          because push takes only direct address as its operand,
          but it does not take an immediate (literal) operand.
       f. finally, we need to push PSW (processor status word)
          register, which consist of bits
           CY AC F0 RS1 RS0 OV UD P
          all bits can be initialized to zero, except <RS1:RS0>
          which selects the register bank.
          Thread 0 uses bank 0, Thread 1 uses bank 1, etc.
          Setting the bits to 00B, 01B, 10B, 11B will select
          the register bank so no need to push/pop registers
          R0-R7.  So, set PSW to
          00000000B for thread 0, 00001000B for thread 1,
          00010000B for thread 2, 00011000B for thread 3.
       g. write the current stack pointer to the saved stack
          pointer array for this newly created thread ID
       h. set SP to the saved SP in step c.
       i. finally, return the newly created thread ID.
     */
    __asm
        mov _savedFpLow, dpl
        mov _savedFpHigh, dph
    __endasm;

    candidateThread = 0;
    candidateMask = 0x01;

    while (candidateThread < MAXTHREADS)
    {
        if ((threadMask & candidateMask) == 0)
        {
            break;
        }
        candidateThread++;
        candidateMask <<= 1;
    }

    if (candidateThread == MAXTHREADS)
    {
        return -1;
    }

    threadMask |= candidateMask;

    /* Prepare values before moving SP to the new thread's stack. */
    zeroValue = 0x00;
    newThreadPSW = candidateThread << 3;  /* bank 0, 1, 2, or 3 */
    previousSP = SP;

    /*
     * Each thread owns a 16-byte stack:
     * thread 0: 0x40-0x4F, thread 1: 0x50-0x5F, etc.
     * PUSH increments SP first, so start one byte before the stack area.
     */
    SP = 0x3F + (candidateThread << 4);

    /*
     * Fake the stack as if this thread had been called normally.
     * LCALL stores low byte first, then high byte, so we push low then high.
     */
    __asm
        push _savedFpLow
        push _savedFpHigh

        push _zeroValue      ; 
        push _zeroValue      ; 
        push _zeroValue      ; 
        push _zeroValue      ; 
        push _newThreadPSW   ; 
    __endasm;

    savedSP[candidateThread] = SP;
    SP = previousSP;

    return candidateThread;
}

/*
 * this is called by a running thread to yield control to another
 * thread.  ThreadYield() saves the context of the current
 * running thread, picks another thread (and set the current thread
 * ID to it), if any, and then restores its state.
 */

void ThreadYield(void)
{
    SAVESTATE;
    do
    {
        /*
         * [TODONE]
         * do round-robin policy for now.
         * find the next thread that can run and
         * set the current thread ID to it,
         * so that it can be restored (by the last line of
         * this function).
         * there should be at least one thread, so this loop
         * will always terminate.
         */
        currentThread++;
        if (currentThread >= MAXTHREADS)
        {
            currentThread = 0;
        }

        if (currentThread == 0)
        {
            candidateMask = 0x01;
        }
        else if (currentThread == 1)
        {
            candidateMask = 0x02;
        }
        else if (currentThread == 2)
        {
            candidateMask = 0x04;
        }
        else
        {
            candidateMask = 0x08;
        }

        if (threadMask & candidateMask)
        {
            break;
        }
    } while (1);
    RESTORESTATE;
}

/*
 * ThreadExit() is called by the thread's own code to terminate
 * itself.  It will never return; instead, it switches context
 * to another thread.
 */
void ThreadExit(void)
{
    /*
     * clear the bit for the current thread from the
     * bit mask, decrement thread count (if any),
     * and set current thread to another valid ID.
     * Q: What happens if there are no more valid threads?
     */
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
            /* No runnable thread remains. */
        }
    }

    do
    {
        currentThread++;
        if (currentThread >= MAXTHREADS)
        {
            currentThread = 0;
        }

        if (currentThread == 0)
        {
            candidateMask = 0x01;
        }
        else if (currentThread == 1)
        {
            candidateMask = 0x02;
        }
        else if (currentThread == 2)
        {
            candidateMask = 0x04;
        }
        else
        {
            candidateMask = 0x08;
        }

        if (threadMask & candidateMask)
        {
            break;
        }
    } while (1);

    RESTORESTATE;
}
