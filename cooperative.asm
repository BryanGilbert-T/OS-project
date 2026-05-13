;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.0 #15242 (MINGW64)
;--------------------------------------------------------
	.module cooperative
	
	.optsdcc -mmcs51 --model-small
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Bootstrap
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
	.globl _savedFpHigh
	.globl _savedFpLow
	.globl _newThreadPSW
	.globl _zeroValue
	.globl _previousSP
	.globl _candidateMask
	.globl _candidateThread
	.globl _threadMask
	.globl _currentThread
	.globl _savedSP
	.globl _ThreadCreate
	.globl _ThreadYield
	.globl _ThreadExit
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
_savedSP	=	0x0020
_currentThread	=	0x0024
_threadMask	=	0x0025
_candidateThread	=	0x0026
_candidateMask	=	0x0027
_previousSP	=	0x0028
_zeroValue	=	0x0029
_newThreadPSW	=	0x002a
_savedFpLow	=	0x002b
_savedFpHigh	=	0x002c
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
;Allocation info for local variables in function 'Bootstrap'
;------------------------------------------------------------
;	cooperative.c:81: void Bootstrap(void)
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
;	cooperative.c:95: threadMask = 0x00;
	mov	_threadMask,#0x00
;	cooperative.c:96: currentThread = ThreadCreate(main);
	mov	dptr,#_main
	lcall	_ThreadCreate
	mov	_currentThread,dpl
;	cooperative.c:97: RESTORESTATE;
	mov	a,_currentThread
	add	a, #_savedSP
	mov	r1,a
	mov	_SP,@r1
	pop psw 
	pop dph 
	pop dpl 
	pop b 
	pop acc 
;	cooperative.c:98: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadCreate'
;------------------------------------------------------------
;fp            Allocated to registers 
;------------------------------------------------------------
;	cooperative.c:106: ThreadID ThreadCreate(FunctionPtr fp)
;	-----------------------------------------
;	 function ThreadCreate
;	-----------------------------------------
_ThreadCreate:
;	cooperative.c:155: __endasm;
	mov	_savedFpLow, dpl
	mov	_savedFpHigh, dph
;	cooperative.c:157: candidateThread = 0;
	mov	_candidateThread,#0x00
;	cooperative.c:158: candidateMask = 0x01;
	mov	_candidateMask,#0x01
;	cooperative.c:160: while (candidateThread < MAXTHREADS)
00103$:
	mov	a,#0x100 - 0x04
	add	a,_candidateThread
	jc	00105$
;	cooperative.c:162: if ((threadMask & candidateMask) == 0)
	mov	a,_candidateMask
	anl	a,_threadMask
	jz	00105$
;	cooperative.c:166: candidateThread++;
	mov	a,_candidateThread
	inc	a
	mov	_candidateThread,a
;	cooperative.c:167: candidateMask <<= 1;
	mov	a,_candidateMask
	add	a,acc
	mov	_candidateMask,a
	sjmp	00103$
00105$:
;	cooperative.c:170: if (candidateThread == MAXTHREADS)
	mov	a,#0x04
	cjne	a,_candidateThread,00107$
;	cooperative.c:172: return -1;
	mov	dpl, #0xff
	ret
00107$:
;	cooperative.c:175: threadMask |= candidateMask;
	mov	a,_candidateMask
	orl	_threadMask,a
;	cooperative.c:178: zeroValue = 0x00;
	mov	_zeroValue,#0x00
;	cooperative.c:179: newThreadPSW = candidateThread << 3;  /* bank 0, 1, 2, or 3 */
	mov	a,_candidateThread
	swap	a
	rr	a
	anl	a,#0xf8
	mov	_newThreadPSW,a
;	cooperative.c:180: previousSP = SP;
	mov	_previousSP,_SP
;	cooperative.c:187: SP = 0x3F + (candidateThread << 4);
	mov	a,_candidateThread
	swap	a
	anl	a,#0xf0
	mov	r7,a
	add	a,#0x3f
	mov	_SP,a
;	cooperative.c:202: __endasm;
	push	_savedFpLow
	push	_savedFpHigh
	push	_zeroValue ;
	push	_zeroValue ;
	push	_zeroValue ;
	push	_zeroValue ;
	push	_newThreadPSW ;
;	cooperative.c:204: savedSP[candidateThread] = SP;
	mov	a,_candidateThread
	add	a, #_savedSP
	mov	r0,a
	mov	@r0,_SP
;	cooperative.c:205: SP = previousSP;
	mov	_SP,_previousSP
;	cooperative.c:207: return candidateThread;
	mov	dpl, _candidateThread
;	cooperative.c:208: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadYield'
;------------------------------------------------------------
;	cooperative.c:217: void ThreadYield(void)
;	-----------------------------------------
;	 function ThreadYield
;	-----------------------------------------
_ThreadYield:
;	cooperative.c:219: SAVESTATE;
	push acc 
	push b 
	push dpl 
	push psw 
	push dph 
	mov	a,_currentThread
	add	a, #_savedSP
	mov	r0,a
	mov	@r0,_SP
;	cooperative.c:220: do
00114$:
;	cooperative.c:232: currentThread++;
	mov	a,_currentThread
	inc	a
	mov	_currentThread,a
;	cooperative.c:233: if (currentThread >= MAXTHREADS)
	mov	a,#0x100 - 0x04
	add	a,_currentThread
	jnc	00102$
;	cooperative.c:235: currentThread = 0;
	mov	_currentThread,#0x00
00102$:
;	cooperative.c:238: if (currentThread == 0)
	mov	a,_currentThread
	jnz	00110$
;	cooperative.c:240: candidateMask = 0x01;
	mov	_candidateMask,#0x01
	sjmp	00111$
00110$:
;	cooperative.c:242: else if (currentThread == 1)
	mov	a,#0x01
	cjne	a,_currentThread,00107$
;	cooperative.c:244: candidateMask = 0x02;
	mov	_candidateMask,#0x02
	sjmp	00111$
00107$:
;	cooperative.c:246: else if (currentThread == 2)
	mov	a,#0x02
	cjne	a,_currentThread,00104$
;	cooperative.c:248: candidateMask = 0x04;
	mov	_candidateMask,#0x04
	sjmp	00111$
00104$:
;	cooperative.c:252: candidateMask = 0x08;
	mov	_candidateMask,#0x08
00111$:
;	cooperative.c:255: if (threadMask & candidateMask)
	mov	a,_candidateMask
	anl	a,_threadMask
	jz	00114$
;	cooperative.c:260: RESTORESTATE;
	mov	a,_currentThread
	add	a, #_savedSP
	mov	r1,a
	mov	_SP,@r1
	pop psw 
	pop dph 
	pop dpl 
	pop b 
	pop acc 
;	cooperative.c:261: }
	ret
;------------------------------------------------------------
;Allocation info for local variables in function 'ThreadExit'
;------------------------------------------------------------
;	cooperative.c:268: void ThreadExit(void)
;	-----------------------------------------
;	 function ThreadExit
;	-----------------------------------------
_ThreadExit:
;	cooperative.c:276: if (currentThread == 0)
	mov	a,_currentThread
	jnz	00108$
;	cooperative.c:278: threadMask &= 0xFE;
	anl	_threadMask,#0xfe
	sjmp	00109$
00108$:
;	cooperative.c:280: else if (currentThread == 1)
	mov	a,#0x01
	cjne	a,_currentThread,00105$
;	cooperative.c:282: threadMask &= 0xFD;
	anl	_threadMask,#0xfd
	sjmp	00109$
00105$:
;	cooperative.c:284: else if (currentThread == 2)
	mov	a,#0x02
	cjne	a,_currentThread,00102$
;	cooperative.c:286: threadMask &= 0xFB;
	anl	_threadMask,#0xfb
	sjmp	00109$
00102$:
;	cooperative.c:290: threadMask &= 0xF7;
	anl	_threadMask,#0xf7
00109$:
;	cooperative.c:293: if (threadMask == 0)
	mov	a,_threadMask
	jnz	00128$
;	cooperative.c:295: while (1)
00111$:
;	cooperative.c:301: do
	sjmp	00111$
00128$:
;	cooperative.c:303: currentThread++;
	mov	a,_currentThread
	inc	a
	mov	_currentThread,a
;	cooperative.c:304: if (currentThread >= MAXTHREADS)
	mov	a,#0x100 - 0x04
	add	a,_currentThread
	jnc	00116$
;	cooperative.c:306: currentThread = 0;
	mov	_currentThread,#0x00
00116$:
;	cooperative.c:309: if (currentThread == 0)
	mov	a,_currentThread
	jnz	00124$
;	cooperative.c:311: candidateMask = 0x01;
	mov	_candidateMask,#0x01
	sjmp	00125$
00124$:
;	cooperative.c:313: else if (currentThread == 1)
	mov	a,#0x01
	cjne	a,_currentThread,00121$
;	cooperative.c:315: candidateMask = 0x02;
	mov	_candidateMask,#0x02
	sjmp	00125$
00121$:
;	cooperative.c:317: else if (currentThread == 2)
	mov	a,#0x02
	cjne	a,_currentThread,00118$
;	cooperative.c:319: candidateMask = 0x04;
	mov	_candidateMask,#0x04
	sjmp	00125$
00118$:
;	cooperative.c:323: candidateMask = 0x08;
	mov	_candidateMask,#0x08
00125$:
;	cooperative.c:326: if (threadMask & candidateMask)
	mov	a,_candidateMask
	anl	a,_threadMask
	jz	00128$
;	cooperative.c:332: RESTORESTATE;
	mov	a,_currentThread
	add	a, #_savedSP
	mov	r1,a
	mov	_SP,@r1
	pop psw 
	pop dph 
	pop dpl 
	pop b 
	pop acc 
;	cooperative.c:333: }
	ret
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
