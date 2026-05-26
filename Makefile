#
# Makefile for Programming Project Checkpoint 2: preemptive multithreading
# Target: SDCC + EdSim51
#

CC = sdcc
CFLAGS = -c
LDFLAGS =

C_OBJECTS = testpreempt.rel preemptive.rel

all: testpreempt.hex

testpreempt.hex: $(C_OBJECTS)
	$(CC) $(LDFLAGS) -o testpreempt.hex $(C_OBJECTS)

clean:
	rm -f *.hex *.ihx *.lnk *.lst *.map *.mem *.rel *.rst *.sym *.asm *.lk

%.rel: %.c preemptive.h Makefile
	$(CC) $(CFLAGS) $<
