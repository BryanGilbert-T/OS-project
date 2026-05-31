;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.0 #15242 (MINGW64)
;--------------------------------------------------------
	.module preemptive
	
	.optsdcc -mmcs51 --model-small
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _scheduler
	.globl _main
	.globl _CY
	.globl _AC
	.globl _F0
	.globl _RS1
	.globl _RS0
	.globl _OV
	.globl _F1
	.globl _P
	.globl _PS
	.globl _PT1
	.globl _PX1
	.globl _PT0
	.globl _PX0
	.globl _RD
	.globl _WR
	.globl _T1
	.globl _T0
	.globl _INT1
	.globl _INT0
	.globl _TXD
	.globl _RXD
	.globl _P3_7
	.globl _P3_6
	.globl _P3_5
	.globl _P3_4
	.globl _P3_3
	.globl _P3_2
	.globl _P3_1
	.globl _P3_0
	.globl _EA
	.globl _ES
	.globl _ET1
	.globl _EX1
	.globl _ET0
	.globl _EX0
	.globl _P2_7
	.globl _P2_6
	.globl _P2_5
	.globl _P2_4
	.globl _P2_3
	.globl _P2_2
	.globl _P2_1
	.globl _P2_0
	.globl _SM0
	.globl _SM1
	.globl _SM2
	.globl _REN
	.globl _TB8
	.globl _RB8
	.globl _TI
	.globl _RI
	.globl _P1_7
	.globl _P1_6
	.globl _P1_5
	.globl _P1_4
	.globl _P1_3
	.globl _P1_2
	.globl _P1_1
	.globl _P1_0
	.globl _TF1
	.globl _TR1
	.globl _TF0
	.globl _TR0
	.globl _IE1
	.globl _IT1
	.globl _IE0
	.globl _IT0
	.globl _P0_7
	.globl _P0_6
	.globl _P0_5
	.globl _P0_4
	.globl _P0_3
	.globl _P0_2
	.globl _P0_1
	.globl _P0_0
	.globl _B
	.globl _ACC
	.globl _PSW
	.globl _IP
	.globl _P3
	.globl _IE
	.globl _P2
	.globl _SBUF
	.globl _SCON
	.globl _P1
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _P0
	.globl _savedEA
	.globl _savedFpHigh
	.globl _savedFpLow
	.globl _newThreadPSW
	.globl _zeroValue
	.globl _previousSP
	.globl _candidateMask
	.globl _candidateThread
	.globl _threadMask
	.globl _currentThread
	.globl _savedSP3
	.globl _savedSP2
	.globl _savedSP1
	.globl _savedSP0
	.globl _Bootstrap
	.globl _ThreadCreate
	.globl _ThreadYield
	.globl _ThreadExit
	.globl _myTimer0Handler
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0	=	0x0080
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_PCON	=	0x0087
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_P1	=	0x0090
_SCON	=	0x0098
_SBUF	=	0x0099
_P2	=	0x00a0
_IE	=	0x00a8
_P3	=	0x00b0
_IP	=	0x00b8
_PSW	=	0x00d0
_ACC	=	0x00e0
_B	=	0x00f0
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0_0	=	0x0080
_P0_1	=	0x0081
_P0_2	=	0x0082
_P0_3	=	0x0083
_P0_4	=	0x0084
_P0_5	=	0x0085
_P0_6	=	0x0086
_P0_7	=	0x0087
_IT0	=	0x0088
_IE0	=	0x0089
_IT1	=	0x008a
_IE1	=	0x008b
_TR0	=	0x008c
_TF0	=	0x008d
_TR1	=	0x008e
_TF1	=	0x008f
_P1_0	=	0x0090
_P1_1	=	0x0091
_P1_2	=	0x0092
_P1_3	=	0x0093
_P1_4	=	0x0094
_P1_5	=	0x0095
_P1_6	=	0x0096
_P1_7	=	0x0097
_RI	=	0x0098
_TI	=	0x0099
_RB8	=	0x009a
_TB8	=	0x009b
_REN	=	0x009c
_SM2	=	0x009d
_SM1	=	0x009e
_SM0	=	0x009f
_P2_0	=	0x00a0
_P2_1	=	0x00a1
_P2_2	=	0x00a2
_P2_3	=	0x00a3
_P2_4	=	0x00a4
_P2_5	=	0x00a5
_P2_6	=	0x00a6
_P2_7	=	0x00a7
_EX0	=	0x00a8
_ET0	=	0x00a9
_EX1	=	0x00aa
_ET1	=	0x00ab
_ES	=	0x00ac
_EA	=	0x00af
_P3_0	=	0x00b0
_P3_1	=	0x00b1
_P3_2	=	0x00b2
_P3_3	=	0x00b3
_P3_4	=	0x00b4
_P3_5	=	0x00b5
_P3_6	=	0x00b6
_P3_7	=	0x00b7
_RXD	=	0x00b0
_TXD	=	0x00b1
_INT0	=	0x00b2
_INT1	=	0x00b3
_T0	=	0x00b4
_T1	=	0x00b5
_WR	=	0x00b6
_RD	=	0x00b7
_PX0	=	0x00b8
_PT0	=	0x00b9
_PX1	=	0x00ba
_PT1	=	0x00bb
_PS	=	0x00bc
_P	=	0x00d0
_F1	=	0x00d1
_OV	=	0x00d2
_RS0	=	0x00d3
_RS1	=	0x00d4
_F0	=	0x00d5
_AC	=	0x00d6
_CY	=	0x00d7
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
_savedSP0	=	0x0020
_savedSP1	=	0x0021
_savedSP2	=	0x0022
_savedSP3	=	0x0023
_currentThread	=	0x0024
_threadMask	=	0x0025
_candidateThread	=	0x0026
_candidateMask	=	0x0027
_previousSP	=	0x0028
_zeroValue	=	0x0029
_newThreadPSW	=	0x002a
_savedFpLow	=	0x002b
_savedFpHigh	=	0x002c
_savedEA	=	0x002d
;--------------------------------------------------------
; overlayable items in internal ram
;--------------------------------------------------------
	.area	OSEG    (OVR,DATA)
;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; uninitialized external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; initialized external ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'scheduler'
;------------------------------------------------------------
;	preemptive.c:78: void scheduler(void) __naked
;	-----------------------------------------
;	 function scheduler
;	-----------------------------------------
_scheduler:
;	naked function: no prologue.
;	preemptive.c:117: __endasm;
SCHED_LOOP:
	inc	_currentThread
	mov	a, _currentThread
	cjne	a, #0x04, SCHED_CHECK
	mov	_currentThread, #0x00
SCHED_CHECK:
	mov	a, _currentThread
	jz	SCHED_THREAD0
	dec	a
	jz	SCHED_THREAD1
	dec	a
	jz	SCHED_THREAD2
	mov	a, _threadMask
	anl	a, #0x08
	jz	SCHED_LOOP
	ret
SCHED_THREAD0:
	mov	a, _threadMask
	anl	a, #0x01
	jz	SCHED_LOOP
	ret
SCHED_THREAD1:
	mov	a, _threadMask
	anl	a, #0x02
	jz	SCHED_LOOP
	ret
SCHED_THREAD2:
	mov	a, _threadMask
	anl	a, #0x04
	jz	SCHED_LOOP
	ret
;	preemptive.c:118: }
;	naked function: no epilogue.
;------------------------------------------------------------
;Allocation info for local variables in function 'Bootstrap'
;------------------------------------------------------------
;	preemptive.c:120: void Bootstrap(void)
;	-----------------------------------------
;	 function Bootstrap
;	-----------------------------------------
_Bootstrap:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	preemptive.c:122: EA = 0;
;	assignBit
	clr	_EA
;	preemptive.c:123: threadMask = 0x00;
	mov	_threadMask,#0x00
;	preemptive.c:124: currentThread = 0;
	mov	_currentThread,#0x00
;	preemptive.c:125: TMOD = 0x00;
	mov	_TMOD,#0x00
;	preemptive.c:126: IE = 0x02;
	mov	_IE,#0x02
;	preemptive.c:127: TR0 = 1;
;	assignBit
	setb	_TR0
;	preemptive.c:128: currentThread = ThreadCreate(main);
	mov	dptr,#_main
	lcall	_ThreadCreate
	mov	_currentThread,dpl
;	preemptive.c:129: RESTORESTATE;
	mov a, _currentThread 
	jz RS_LOAD_0_129 
	dec a 
	jz RS_LOAD_1_129 
	dec a 
	jz RS_LOAD_2_129 
	mov sp, _savedSP3 
	sjmp RS_LOAD_DONE_129 
RS_LOAD_0_129:
	mov sp, _savedSP0 
	sjmp RS_LOAD_DONE_129 
RS_LOAD_1_129:
	mov sp, _savedSP1 
	sjmp RS_LOAD_DONE_129 
RS_LOAD_2_129:
	mov sp, _savedSP2 
RS_LOAD_DONE_129:
	pop psw 
	pop dph 
	pop dpl 
	pop b 
	pop acc 
;	preemptive.c:130: EA = 1;
;	assignBit
	setb	_EA
;	preemptive.c:131: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadCreate'
;------------------------------------------------------------
;fp            Allocated to registers 
;------------------------------------------------------------
;	preemptive.c:133: ThreadID ThreadCreate(FunctionPtr fp)
;	-----------------------------------------
;	 function ThreadCreate
;	-----------------------------------------
_ThreadCreate:
;	preemptive.c:140: __endasm;
	mov	_savedFpLow, dpl
	mov	_savedFpHigh, dph
;	preemptive.c:142: if (EA)
	jnb	_EA,00102$
;	preemptive.c:144: savedEA = 1;
	mov	_savedEA,#0x01
	sjmp	00103$
00102$:
;	preemptive.c:148: savedEA = 0;
	mov	_savedEA,#0x00
00103$:
;	preemptive.c:151: EA = 0;
;	assignBit
	clr	_EA
;	preemptive.c:153: if ((threadMask & 0x01) == 0)
	mov	a,_threadMask
	mov	r7,a
	jb	acc.0,00116$
;	preemptive.c:155: candidateThread = 0;
	mov	_candidateThread,#0x00
;	preemptive.c:156: candidateMask = 0x01;
	mov	_candidateMask,#0x01
;	preemptive.c:157: newThreadPSW = 0x00;
	mov	_newThreadPSW,#0x00
;	preemptive.c:158: previousSP = SP;
	mov	_previousSP,_SP
;	preemptive.c:159: SP = 0x3F;
	mov	_SP,#0x3f
	sjmp	00117$
00116$:
;	preemptive.c:161: else if ((threadMask & 0x02) == 0)
	mov	a,_threadMask
	mov	r7,a
	jb	acc.1,00113$
;	preemptive.c:163: candidateThread = 1;
	mov	_candidateThread,#0x01
;	preemptive.c:164: candidateMask = 0x02;
	mov	_candidateMask,#0x02
;	preemptive.c:165: newThreadPSW = 0x08;
	mov	_newThreadPSW,#0x08
;	preemptive.c:166: previousSP = SP;
	mov	_previousSP,_SP
;	preemptive.c:167: SP = 0x4F;
	mov	_SP,#0x4f
	sjmp	00117$
00113$:
;	preemptive.c:169: else if ((threadMask & 0x04) == 0)
	mov	a,_threadMask
	mov	r7,a
	jb	acc.2,00110$
;	preemptive.c:171: candidateThread = 2;
	mov	_candidateThread,#0x02
;	preemptive.c:172: candidateMask = 0x04;
	mov	_candidateMask,#0x04
;	preemptive.c:173: newThreadPSW = 0x10;
	mov	_newThreadPSW,#0x10
;	preemptive.c:174: previousSP = SP;
	mov	_previousSP,_SP
;	preemptive.c:175: SP = 0x5F;
	mov	_SP,#0x5f
	sjmp	00117$
00110$:
;	preemptive.c:177: else if ((threadMask & 0x08) == 0)
	mov	a,_threadMask
	mov	r7,a
	jb	acc.3,00107$
;	preemptive.c:179: candidateThread = 3;
	mov	_candidateThread,#0x03
;	preemptive.c:180: candidateMask = 0x08;
	mov	_candidateMask,#0x08
;	preemptive.c:181: newThreadPSW = 0x18;
	mov	_newThreadPSW,#0x18
;	preemptive.c:182: previousSP = SP;
	mov	_previousSP,_SP
;	preemptive.c:183: SP = 0x6F;
	mov	_SP,#0x6f
	sjmp	00117$
00107$:
;	preemptive.c:187: if (savedEA)
	mov	a,_savedEA
	jz	00105$
;	preemptive.c:189: EA = 1;
;	assignBit
	setb	_EA
00105$:
;	preemptive.c:191: return (ThreadID)-1;
	mov	dpl, #0xff
	ret
00117$:
;	preemptive.c:194: threadMask |= candidateMask;
	mov	a,_candidateMask
	orl	_threadMask,a
;	preemptive.c:195: zeroValue = 0x00;
	mov	_zeroValue,#0x00
;	preemptive.c:205: __endasm;
	push	_savedFpLow
	push	_savedFpHigh
	push	_zeroValue
	push	_zeroValue
	push	_zeroValue
	push	_zeroValue
	push	_newThreadPSW
;	preemptive.c:207: if (candidateThread == 0)
	mov	a,_candidateThread
	jnz	00125$
;	preemptive.c:209: savedSP0 = SP;
	mov	_savedSP0,_SP
	sjmp	00126$
00125$:
;	preemptive.c:211: else if (candidateThread == 1)
	mov	a,#0x01
	cjne	a,_candidateThread,00122$
;	preemptive.c:213: savedSP1 = SP;
	mov	_savedSP1,_SP
	sjmp	00126$
00122$:
;	preemptive.c:215: else if (candidateThread == 2)
	mov	a,#0x02
	cjne	a,_candidateThread,00119$
;	preemptive.c:217: savedSP2 = SP;
	mov	_savedSP2,_SP
	sjmp	00126$
00119$:
;	preemptive.c:221: savedSP3 = SP;
	mov	_savedSP3,_SP
00126$:
;	preemptive.c:224: SP = previousSP;
	mov	_SP,_previousSP
;	preemptive.c:226: if (savedEA)
	mov	a,_savedEA
	jz	00128$
;	preemptive.c:228: EA = 1;
;	assignBit
	setb	_EA
00128$:
;	preemptive.c:231: return candidateThread;
	mov	dpl, _candidateThread
;	preemptive.c:232: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadYield'
;------------------------------------------------------------
;	preemptive.c:234: void ThreadYield(void)
;	-----------------------------------------
;	 function ThreadYield
;	-----------------------------------------
_ThreadYield:
;	preemptive.c:236: EA = 0;
;	assignBit
	clr	_EA
;	preemptive.c:237: SAVESTATE;
	push acc 
	push b 
	push dpl 
	push dph 
	push psw 
	mov a, _currentThread 
	jz SS_SAVE_0_237 
	dec a 
	jz SS_SAVE_1_237 
	dec a 
	jz SS_SAVE_2_237 
	mov _savedSP3, sp 
	sjmp SS_SAVE_DONE_237 
SS_SAVE_0_237:
	mov _savedSP0, sp 
	sjmp SS_SAVE_DONE_237 
SS_SAVE_1_237:
	mov _savedSP1, sp 
	sjmp SS_SAVE_DONE_237 
SS_SAVE_2_237:
	mov _savedSP2, sp 
SS_SAVE_DONE_237:
;	preemptive.c:240: __endasm;
	lcall	_scheduler
;	preemptive.c:241: RESTORESTATE;
	mov a, _currentThread 
	jz RS_LOAD_0_241 
	dec a 
	jz RS_LOAD_1_241 
	dec a 
	jz RS_LOAD_2_241 
	mov sp, _savedSP3 
	sjmp RS_LOAD_DONE_241 
RS_LOAD_0_241:
	mov sp, _savedSP0 
	sjmp RS_LOAD_DONE_241 
RS_LOAD_1_241:
	mov sp, _savedSP1 
	sjmp RS_LOAD_DONE_241 
RS_LOAD_2_241:
	mov sp, _savedSP2 
RS_LOAD_DONE_241:
	pop psw 
	pop dph 
	pop dpl 
	pop b 
	pop acc 
;	preemptive.c:242: EA = 1;
;	assignBit
	setb	_EA
;	preemptive.c:243: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadExit'
;------------------------------------------------------------
;	preemptive.c:245: void ThreadExit(void)
;	-----------------------------------------
;	 function ThreadExit
;	-----------------------------------------
_ThreadExit:
;	preemptive.c:247: EA = 0;
;	assignBit
	clr	_EA
;	preemptive.c:249: if (currentThread == 0)
	mov	a,_currentThread
	jnz	00108$
;	preemptive.c:251: threadMask &= 0xFE;
	anl	_threadMask,#0xfe
	sjmp	00109$
00108$:
;	preemptive.c:253: else if (currentThread == 1)
	mov	a,#0x01
	cjne	a,_currentThread,00105$
;	preemptive.c:255: threadMask &= 0xFD;
	anl	_threadMask,#0xfd
	sjmp	00109$
00105$:
;	preemptive.c:257: else if (currentThread == 2)
	mov	a,#0x02
	cjne	a,_currentThread,00102$
;	preemptive.c:259: threadMask &= 0xFB;
	anl	_threadMask,#0xfb
	sjmp	00109$
00102$:
;	preemptive.c:263: threadMask &= 0xF7;
	anl	_threadMask,#0xf7
00109$:
;	preemptive.c:266: if (threadMask == 0)
	mov	a,_threadMask
	jnz	00114$
;	preemptive.c:268: while (1)
00111$:
	sjmp	00111$
00114$:
;	preemptive.c:275: __endasm;
	lcall	_scheduler
;	preemptive.c:276: RESTORESTATE;
	mov a, _currentThread 
	jz RS_LOAD_0_276 
	dec a 
	jz RS_LOAD_1_276 
	dec a 
	jz RS_LOAD_2_276 
	mov sp, _savedSP3 
	sjmp RS_LOAD_DONE_276 
RS_LOAD_0_276:
	mov sp, _savedSP0 
	sjmp RS_LOAD_DONE_276 
RS_LOAD_1_276:
	mov sp, _savedSP1 
	sjmp RS_LOAD_DONE_276 
RS_LOAD_2_276:
	mov sp, _savedSP2 
RS_LOAD_DONE_276:
	pop psw 
	pop dph 
	pop dpl 
	pop b 
	pop acc 
;	preemptive.c:277: EA = 1;
;	assignBit
	setb	_EA
;	preemptive.c:278: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'myTimer0Handler'
;------------------------------------------------------------
;	preemptive.c:280: void myTimer0Handler(void) __naked
;	-----------------------------------------
;	 function myTimer0Handler
;	-----------------------------------------
_myTimer0Handler:
;	naked function: no prologue.
;	preemptive.c:282: SAVESTATE;
	push acc 
	push b 
	push dpl 
	push dph 
	push psw 
	mov a, _currentThread 
	jz SS_SAVE_0_282 
	dec a 
	jz SS_SAVE_1_282 
	dec a 
	jz SS_SAVE_2_282 
	mov _savedSP3, sp 
	sjmp SS_SAVE_DONE_282 
SS_SAVE_0_282:
	mov _savedSP0, sp 
	sjmp SS_SAVE_DONE_282 
SS_SAVE_1_282:
	mov _savedSP1, sp 
	sjmp SS_SAVE_DONE_282 
SS_SAVE_2_282:
	mov _savedSP2, sp 
SS_SAVE_DONE_282:
;	preemptive.c:285: __endasm;
	lcall	_scheduler
;	preemptive.c:286: RESTORESTATE;
	mov a, _currentThread 
	jz RS_LOAD_0_286 
	dec a 
	jz RS_LOAD_1_286 
	dec a 
	jz RS_LOAD_2_286 
	mov sp, _savedSP3 
	sjmp RS_LOAD_DONE_286 
RS_LOAD_0_286:
	mov sp, _savedSP0 
	sjmp RS_LOAD_DONE_286 
RS_LOAD_1_286:
	mov sp, _savedSP1 
	sjmp RS_LOAD_DONE_286 
RS_LOAD_2_286:
	mov sp, _savedSP2 
RS_LOAD_DONE_286:
	pop psw 
	pop dph 
	pop dpl 
	pop b 
	pop acc 
;	preemptive.c:289: __endasm;
	reti
;	preemptive.c:290: }
;	naked function: no epilogue.
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
