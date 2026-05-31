#ifndef __PREEMPTIVE_H__
#define __PREEMPTIVE_H__

#define MAXTHREADS 4

typedef char ThreadID;
typedef void (*FunctionPtr)(void);
typedef char Semaphore;

ThreadID ThreadCreate(FunctionPtr);
void ThreadYield(void);
void ThreadExit(void);
void Bootstrap(void);
void myTimer0Handler(void);

#define SemaphoreCreate(s, n) do { s = n; } while (0)
#define SemaphoreWait(s) do { while (1) { EA = 0; if (s > 0) { s--; EA = 1; break; } EA = 1; } } while (0)
#define SemaphoreSignal(s) do { EA = 0; s++; EA = 1; } while (0)

#endif
