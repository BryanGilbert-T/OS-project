                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.0 #15242 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module preemptive
                                      6 	
                                      7 	.optsdcc -mmcs51 --model-small
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _scheduler
                                     12 	.globl _main
                                     13 	.globl _CY
                                     14 	.globl _AC
                                     15 	.globl _F0
                                     16 	.globl _RS1
                                     17 	.globl _RS0
                                     18 	.globl _OV
                                     19 	.globl _F1
                                     20 	.globl _P
                                     21 	.globl _PS
                                     22 	.globl _PT1
                                     23 	.globl _PX1
                                     24 	.globl _PT0
                                     25 	.globl _PX0
                                     26 	.globl _RD
                                     27 	.globl _WR
                                     28 	.globl _T1
                                     29 	.globl _T0
                                     30 	.globl _INT1
                                     31 	.globl _INT0
                                     32 	.globl _TXD
                                     33 	.globl _RXD
                                     34 	.globl _P3_7
                                     35 	.globl _P3_6
                                     36 	.globl _P3_5
                                     37 	.globl _P3_4
                                     38 	.globl _P3_3
                                     39 	.globl _P3_2
                                     40 	.globl _P3_1
                                     41 	.globl _P3_0
                                     42 	.globl _EA
                                     43 	.globl _ES
                                     44 	.globl _ET1
                                     45 	.globl _EX1
                                     46 	.globl _ET0
                                     47 	.globl _EX0
                                     48 	.globl _P2_7
                                     49 	.globl _P2_6
                                     50 	.globl _P2_5
                                     51 	.globl _P2_4
                                     52 	.globl _P2_3
                                     53 	.globl _P2_2
                                     54 	.globl _P2_1
                                     55 	.globl _P2_0
                                     56 	.globl _SM0
                                     57 	.globl _SM1
                                     58 	.globl _SM2
                                     59 	.globl _REN
                                     60 	.globl _TB8
                                     61 	.globl _RB8
                                     62 	.globl _TI
                                     63 	.globl _RI
                                     64 	.globl _P1_7
                                     65 	.globl _P1_6
                                     66 	.globl _P1_5
                                     67 	.globl _P1_4
                                     68 	.globl _P1_3
                                     69 	.globl _P1_2
                                     70 	.globl _P1_1
                                     71 	.globl _P1_0
                                     72 	.globl _TF1
                                     73 	.globl _TR1
                                     74 	.globl _TF0
                                     75 	.globl _TR0
                                     76 	.globl _IE1
                                     77 	.globl _IT1
                                     78 	.globl _IE0
                                     79 	.globl _IT0
                                     80 	.globl _P0_7
                                     81 	.globl _P0_6
                                     82 	.globl _P0_5
                                     83 	.globl _P0_4
                                     84 	.globl _P0_3
                                     85 	.globl _P0_2
                                     86 	.globl _P0_1
                                     87 	.globl _P0_0
                                     88 	.globl _B
                                     89 	.globl _ACC
                                     90 	.globl _PSW
                                     91 	.globl _IP
                                     92 	.globl _P3
                                     93 	.globl _IE
                                     94 	.globl _P2
                                     95 	.globl _SBUF
                                     96 	.globl _SCON
                                     97 	.globl _P1
                                     98 	.globl _TH1
                                     99 	.globl _TH0
                                    100 	.globl _TL1
                                    101 	.globl _TL0
                                    102 	.globl _TMOD
                                    103 	.globl _TCON
                                    104 	.globl _PCON
                                    105 	.globl _DPH
                                    106 	.globl _DPL
                                    107 	.globl _SP
                                    108 	.globl _P0
                                    109 	.globl _savedEA
                                    110 	.globl _savedFpHigh
                                    111 	.globl _savedFpLow
                                    112 	.globl _newThreadPSW
                                    113 	.globl _zeroValue
                                    114 	.globl _previousSP
                                    115 	.globl _candidateMask
                                    116 	.globl _candidateThread
                                    117 	.globl _threadMask
                                    118 	.globl _currentThread
                                    119 	.globl _savedSP3
                                    120 	.globl _savedSP2
                                    121 	.globl _savedSP1
                                    122 	.globl _savedSP0
                                    123 	.globl _Bootstrap
                                    124 	.globl _ThreadCreate
                                    125 	.globl _ThreadYield
                                    126 	.globl _ThreadExit
                                    127 	.globl _myTimer0Handler
                                    128 ;--------------------------------------------------------
                                    129 ; special function registers
                                    130 ;--------------------------------------------------------
                                    131 	.area RSEG    (ABS,DATA)
      000000                        132 	.org 0x0000
                           000080   133 _P0	=	0x0080
                           000081   134 _SP	=	0x0081
                           000082   135 _DPL	=	0x0082
                           000083   136 _DPH	=	0x0083
                           000087   137 _PCON	=	0x0087
                           000088   138 _TCON	=	0x0088
                           000089   139 _TMOD	=	0x0089
                           00008A   140 _TL0	=	0x008a
                           00008B   141 _TL1	=	0x008b
                           00008C   142 _TH0	=	0x008c
                           00008D   143 _TH1	=	0x008d
                           000090   144 _P1	=	0x0090
                           000098   145 _SCON	=	0x0098
                           000099   146 _SBUF	=	0x0099
                           0000A0   147 _P2	=	0x00a0
                           0000A8   148 _IE	=	0x00a8
                           0000B0   149 _P3	=	0x00b0
                           0000B8   150 _IP	=	0x00b8
                           0000D0   151 _PSW	=	0x00d0
                           0000E0   152 _ACC	=	0x00e0
                           0000F0   153 _B	=	0x00f0
                                    154 ;--------------------------------------------------------
                                    155 ; special function bits
                                    156 ;--------------------------------------------------------
                                    157 	.area RSEG    (ABS,DATA)
      000000                        158 	.org 0x0000
                           000080   159 _P0_0	=	0x0080
                           000081   160 _P0_1	=	0x0081
                           000082   161 _P0_2	=	0x0082
                           000083   162 _P0_3	=	0x0083
                           000084   163 _P0_4	=	0x0084
                           000085   164 _P0_5	=	0x0085
                           000086   165 _P0_6	=	0x0086
                           000087   166 _P0_7	=	0x0087
                           000088   167 _IT0	=	0x0088
                           000089   168 _IE0	=	0x0089
                           00008A   169 _IT1	=	0x008a
                           00008B   170 _IE1	=	0x008b
                           00008C   171 _TR0	=	0x008c
                           00008D   172 _TF0	=	0x008d
                           00008E   173 _TR1	=	0x008e
                           00008F   174 _TF1	=	0x008f
                           000090   175 _P1_0	=	0x0090
                           000091   176 _P1_1	=	0x0091
                           000092   177 _P1_2	=	0x0092
                           000093   178 _P1_3	=	0x0093
                           000094   179 _P1_4	=	0x0094
                           000095   180 _P1_5	=	0x0095
                           000096   181 _P1_6	=	0x0096
                           000097   182 _P1_7	=	0x0097
                           000098   183 _RI	=	0x0098
                           000099   184 _TI	=	0x0099
                           00009A   185 _RB8	=	0x009a
                           00009B   186 _TB8	=	0x009b
                           00009C   187 _REN	=	0x009c
                           00009D   188 _SM2	=	0x009d
                           00009E   189 _SM1	=	0x009e
                           00009F   190 _SM0	=	0x009f
                           0000A0   191 _P2_0	=	0x00a0
                           0000A1   192 _P2_1	=	0x00a1
                           0000A2   193 _P2_2	=	0x00a2
                           0000A3   194 _P2_3	=	0x00a3
                           0000A4   195 _P2_4	=	0x00a4
                           0000A5   196 _P2_5	=	0x00a5
                           0000A6   197 _P2_6	=	0x00a6
                           0000A7   198 _P2_7	=	0x00a7
                           0000A8   199 _EX0	=	0x00a8
                           0000A9   200 _ET0	=	0x00a9
                           0000AA   201 _EX1	=	0x00aa
                           0000AB   202 _ET1	=	0x00ab
                           0000AC   203 _ES	=	0x00ac
                           0000AF   204 _EA	=	0x00af
                           0000B0   205 _P3_0	=	0x00b0
                           0000B1   206 _P3_1	=	0x00b1
                           0000B2   207 _P3_2	=	0x00b2
                           0000B3   208 _P3_3	=	0x00b3
                           0000B4   209 _P3_4	=	0x00b4
                           0000B5   210 _P3_5	=	0x00b5
                           0000B6   211 _P3_6	=	0x00b6
                           0000B7   212 _P3_7	=	0x00b7
                           0000B0   213 _RXD	=	0x00b0
                           0000B1   214 _TXD	=	0x00b1
                           0000B2   215 _INT0	=	0x00b2
                           0000B3   216 _INT1	=	0x00b3
                           0000B4   217 _T0	=	0x00b4
                           0000B5   218 _T1	=	0x00b5
                           0000B6   219 _WR	=	0x00b6
                           0000B7   220 _RD	=	0x00b7
                           0000B8   221 _PX0	=	0x00b8
                           0000B9   222 _PT0	=	0x00b9
                           0000BA   223 _PX1	=	0x00ba
                           0000BB   224 _PT1	=	0x00bb
                           0000BC   225 _PS	=	0x00bc
                           0000D0   226 _P	=	0x00d0
                           0000D1   227 _F1	=	0x00d1
                           0000D2   228 _OV	=	0x00d2
                           0000D3   229 _RS0	=	0x00d3
                           0000D4   230 _RS1	=	0x00d4
                           0000D5   231 _F0	=	0x00d5
                           0000D6   232 _AC	=	0x00d6
                           0000D7   233 _CY	=	0x00d7
                                    234 ;--------------------------------------------------------
                                    235 ; overlayable register banks
                                    236 ;--------------------------------------------------------
                                    237 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        238 	.ds 8
                                    239 ;--------------------------------------------------------
                                    240 ; internal ram data
                                    241 ;--------------------------------------------------------
                                    242 	.area DSEG    (DATA)
                           000020   243 _savedSP0	=	0x0020
                           000021   244 _savedSP1	=	0x0021
                           000022   245 _savedSP2	=	0x0022
                           000023   246 _savedSP3	=	0x0023
                           000024   247 _currentThread	=	0x0024
                           000025   248 _threadMask	=	0x0025
                           000026   249 _candidateThread	=	0x0026
                           000027   250 _candidateMask	=	0x0027
                           000028   251 _previousSP	=	0x0028
                           000029   252 _zeroValue	=	0x0029
                           00002A   253 _newThreadPSW	=	0x002a
                           00002B   254 _savedFpLow	=	0x002b
                           00002C   255 _savedFpHigh	=	0x002c
                           00002D   256 _savedEA	=	0x002d
                                    257 ;--------------------------------------------------------
                                    258 ; overlayable items in internal ram
                                    259 ;--------------------------------------------------------
                                    260 	.area	OSEG    (OVR,DATA)
                                    261 ;--------------------------------------------------------
                                    262 ; indirectly addressable internal ram data
                                    263 ;--------------------------------------------------------
                                    264 	.area ISEG    (DATA)
                                    265 ;--------------------------------------------------------
                                    266 ; absolute internal ram data
                                    267 ;--------------------------------------------------------
                                    268 	.area IABS    (ABS,DATA)
                                    269 	.area IABS    (ABS,DATA)
                                    270 ;--------------------------------------------------------
                                    271 ; bit data
                                    272 ;--------------------------------------------------------
                                    273 	.area BSEG    (BIT)
                                    274 ;--------------------------------------------------------
                                    275 ; paged external ram data
                                    276 ;--------------------------------------------------------
                                    277 	.area PSEG    (PAG,XDATA)
                                    278 ;--------------------------------------------------------
                                    279 ; uninitialized external ram data
                                    280 ;--------------------------------------------------------
                                    281 	.area XSEG    (XDATA)
                                    282 ;--------------------------------------------------------
                                    283 ; absolute external ram data
                                    284 ;--------------------------------------------------------
                                    285 	.area XABS    (ABS,XDATA)
                                    286 ;--------------------------------------------------------
                                    287 ; initialized external ram data
                                    288 ;--------------------------------------------------------
                                    289 	.area XISEG   (XDATA)
                                    290 	.area HOME    (CODE)
                                    291 	.area GSINIT0 (CODE)
                                    292 	.area GSINIT1 (CODE)
                                    293 	.area GSINIT2 (CODE)
                                    294 	.area GSINIT3 (CODE)
                                    295 	.area GSINIT4 (CODE)
                                    296 	.area GSINIT5 (CODE)
                                    297 	.area GSINIT  (CODE)
                                    298 	.area GSFINAL (CODE)
                                    299 	.area CSEG    (CODE)
                                    300 ;--------------------------------------------------------
                                    301 ; global & static initialisations
                                    302 ;--------------------------------------------------------
                                    303 	.area HOME    (CODE)
                                    304 	.area GSINIT  (CODE)
                                    305 	.area GSFINAL (CODE)
                                    306 	.area GSINIT  (CODE)
                                    307 ;--------------------------------------------------------
                                    308 ; Home
                                    309 ;--------------------------------------------------------
                                    310 	.area HOME    (CODE)
                                    311 	.area HOME    (CODE)
                                    312 ;--------------------------------------------------------
                                    313 ; code
                                    314 ;--------------------------------------------------------
                                    315 	.area CSEG    (CODE)
                                    316 ;------------------------------------------------------------
                                    317 ;Allocation info for local variables in function 'scheduler'
                                    318 ;------------------------------------------------------------
                                    319 ;	preemptive.c:78: void scheduler(void) __naked
                                    320 ;	-----------------------------------------
                                    321 ;	 function scheduler
                                    322 ;	-----------------------------------------
      000174                        323 _scheduler:
                                    324 ;	naked function: no prologue.
                                    325 ;	preemptive.c:117: __endasm;
      000174                        326 SCHED_LOOP:
      000174 05 24            [12]  327 	inc	_currentThread
      000176 E5 24            [12]  328 	mov	a, _currentThread
      000178 B4 04 03         [24]  329 	cjne	a, #0x04, SCHED_CHECK
      00017B 75 24 00         [24]  330 	mov	_currentThread, #0x00
      00017E                        331 SCHED_CHECK:
      00017E E5 24            [12]  332 	mov	a, _currentThread
      000180 60 0D            [24]  333 	jz	SCHED_THREAD0
      000182 14               [12]  334 	dec	a
      000183 60 11            [24]  335 	jz	SCHED_THREAD1
      000185 14               [12]  336 	dec	a
      000186 60 15            [24]  337 	jz	SCHED_THREAD2
      000188 E5 25            [12]  338 	mov	a, _threadMask
      00018A 54 08            [12]  339 	anl	a, #0x08
      00018C 60 E6            [24]  340 	jz	SCHED_LOOP
      00018E 22               [24]  341 	ret
      00018F                        342 SCHED_THREAD0:
      00018F E5 25            [12]  343 	mov	a, _threadMask
      000191 54 01            [12]  344 	anl	a, #0x01
      000193 60 DF            [24]  345 	jz	SCHED_LOOP
      000195 22               [24]  346 	ret
      000196                        347 SCHED_THREAD1:
      000196 E5 25            [12]  348 	mov	a, _threadMask
      000198 54 02            [12]  349 	anl	a, #0x02
      00019A 60 D8            [24]  350 	jz	SCHED_LOOP
      00019C 22               [24]  351 	ret
      00019D                        352 SCHED_THREAD2:
      00019D E5 25            [12]  353 	mov	a, _threadMask
      00019F 54 04            [12]  354 	anl	a, #0x04
      0001A1 60 D1            [24]  355 	jz	SCHED_LOOP
      0001A3 22               [24]  356 	ret
                                    357 ;	preemptive.c:118: }
                                    358 ;	naked function: no epilogue.
                                    359 ;------------------------------------------------------------
                                    360 ;Allocation info for local variables in function 'Bootstrap'
                                    361 ;------------------------------------------------------------
                                    362 ;	preemptive.c:120: void Bootstrap(void)
                                    363 ;	-----------------------------------------
                                    364 ;	 function Bootstrap
                                    365 ;	-----------------------------------------
      0001A4                        366 _Bootstrap:
                           000007   367 	ar7 = 0x07
                           000006   368 	ar6 = 0x06
                           000005   369 	ar5 = 0x05
                           000004   370 	ar4 = 0x04
                           000003   371 	ar3 = 0x03
                           000002   372 	ar2 = 0x02
                           000001   373 	ar1 = 0x01
                           000000   374 	ar0 = 0x00
                                    375 ;	preemptive.c:122: EA = 0;
                                    376 ;	assignBit
      0001A4 C2 AF            [12]  377 	clr	_EA
                                    378 ;	preemptive.c:123: threadMask = 0x00;
      0001A6 75 25 00         [24]  379 	mov	_threadMask,#0x00
                                    380 ;	preemptive.c:124: currentThread = 0;
      0001A9 75 24 00         [24]  381 	mov	_currentThread,#0x00
                                    382 ;	preemptive.c:125: TMOD = 0x00;
      0001AC 75 89 00         [24]  383 	mov	_TMOD,#0x00
                                    384 ;	preemptive.c:126: IE = 0x02;
      0001AF 75 A8 02         [24]  385 	mov	_IE,#0x02
                                    386 ;	preemptive.c:127: TR0 = 1;
                                    387 ;	assignBit
      0001B2 D2 8C            [12]  388 	setb	_TR0
                                    389 ;	preemptive.c:128: currentThread = ThreadCreate(main);
      0001B4 90 01 46         [24]  390 	mov	dptr,#_main
      0001B7 12 01 E6         [24]  391 	lcall	_ThreadCreate
      0001BA 85 82 24         [24]  392 	mov	_currentThread,dpl
                                    393 ;	preemptive.c:129: RESTORESTATE;
      0001BD E5 24            [12]  394 	mov a, _currentThread 
      0001BF 60 0B            [24]  395 	jz RS_LOAD_0_129 
      0001C1 14               [12]  396 	dec a 
      0001C2 60 0D            [24]  397 	jz RS_LOAD_1_129 
      0001C4 14               [12]  398 	dec a 
      0001C5 60 0F            [24]  399 	jz RS_LOAD_2_129 
      0001C7 85 23 81         [24]  400 	mov sp, _savedSP3 
      0001CA 80 0D            [24]  401 	sjmp RS_LOAD_DONE_129 
      0001CC                        402 RS_LOAD_0_129:
      0001CC 85 20 81         [24]  403 	mov sp, _savedSP0 
      0001CF 80 08            [24]  404 	sjmp RS_LOAD_DONE_129 
      0001D1                        405 RS_LOAD_1_129:
      0001D1 85 21 81         [24]  406 	mov sp, _savedSP1 
      0001D4 80 03            [24]  407 	sjmp RS_LOAD_DONE_129 
      0001D6                        408 RS_LOAD_2_129:
      0001D6 85 22 81         [24]  409 	mov sp, _savedSP2 
      0001D9                        410 RS_LOAD_DONE_129:
      0001D9 D0 D0            [24]  411 	pop psw 
      0001DB D0 83            [24]  412 	pop dph 
      0001DD D0 82            [24]  413 	pop dpl 
      0001DF D0 F0            [24]  414 	pop b 
      0001E1 D0 E0            [24]  415 	pop acc 
                                    416 ;	preemptive.c:130: EA = 1;
                                    417 ;	assignBit
      0001E3 D2 AF            [12]  418 	setb	_EA
                                    419 ;	preemptive.c:131: }
      0001E5 22               [24]  420 	ret
                                    421 ;------------------------------------------------------------
                                    422 ;Allocation info for local variables in function 'ThreadCreate'
                                    423 ;------------------------------------------------------------
                                    424 ;fp            Allocated to registers 
                                    425 ;------------------------------------------------------------
                                    426 ;	preemptive.c:133: ThreadID ThreadCreate(FunctionPtr fp)
                                    427 ;	-----------------------------------------
                                    428 ;	 function ThreadCreate
                                    429 ;	-----------------------------------------
      0001E6                        430 _ThreadCreate:
                                    431 ;	preemptive.c:140: __endasm;
      0001E6 85 82 2B         [24]  432 	mov	_savedFpLow, dpl
      0001E9 85 83 2C         [24]  433 	mov	_savedFpHigh, dph
                                    434 ;	preemptive.c:142: if (EA)
      0001EC 30 AF 05         [24]  435 	jnb	_EA,00102$
                                    436 ;	preemptive.c:144: savedEA = 1;
      0001EF 75 2D 01         [24]  437 	mov	_savedEA,#0x01
      0001F2 80 03            [24]  438 	sjmp	00103$
      0001F4                        439 00102$:
                                    440 ;	preemptive.c:148: savedEA = 0;
      0001F4 75 2D 00         [24]  441 	mov	_savedEA,#0x00
      0001F7                        442 00103$:
                                    443 ;	preemptive.c:151: EA = 0;
                                    444 ;	assignBit
      0001F7 C2 AF            [12]  445 	clr	_EA
                                    446 ;	preemptive.c:153: if ((threadMask & 0x01) == 0)
      0001F9 E5 25            [12]  447 	mov	a,_threadMask
      0001FB FF               [12]  448 	mov	r7,a
      0001FC 20 E0 11         [24]  449 	jb	acc.0,00116$
                                    450 ;	preemptive.c:155: candidateThread = 0;
      0001FF 75 26 00         [24]  451 	mov	_candidateThread,#0x00
                                    452 ;	preemptive.c:156: candidateMask = 0x01;
      000202 75 27 01         [24]  453 	mov	_candidateMask,#0x01
                                    454 ;	preemptive.c:157: newThreadPSW = 0x00;
      000205 75 2A 00         [24]  455 	mov	_newThreadPSW,#0x00
                                    456 ;	preemptive.c:158: previousSP = SP;
      000208 85 81 28         [24]  457 	mov	_previousSP,_SP
                                    458 ;	preemptive.c:159: SP = 0x3F;
      00020B 75 81 3F         [24]  459 	mov	_SP,#0x3f
      00020E 80 4F            [24]  460 	sjmp	00117$
      000210                        461 00116$:
                                    462 ;	preemptive.c:161: else if ((threadMask & 0x02) == 0)
      000210 E5 25            [12]  463 	mov	a,_threadMask
      000212 FF               [12]  464 	mov	r7,a
      000213 20 E1 11         [24]  465 	jb	acc.1,00113$
                                    466 ;	preemptive.c:163: candidateThread = 1;
      000216 75 26 01         [24]  467 	mov	_candidateThread,#0x01
                                    468 ;	preemptive.c:164: candidateMask = 0x02;
      000219 75 27 02         [24]  469 	mov	_candidateMask,#0x02
                                    470 ;	preemptive.c:165: newThreadPSW = 0x08;
      00021C 75 2A 08         [24]  471 	mov	_newThreadPSW,#0x08
                                    472 ;	preemptive.c:166: previousSP = SP;
      00021F 85 81 28         [24]  473 	mov	_previousSP,_SP
                                    474 ;	preemptive.c:167: SP = 0x4F;
      000222 75 81 4F         [24]  475 	mov	_SP,#0x4f
      000225 80 38            [24]  476 	sjmp	00117$
      000227                        477 00113$:
                                    478 ;	preemptive.c:169: else if ((threadMask & 0x04) == 0)
      000227 E5 25            [12]  479 	mov	a,_threadMask
      000229 FF               [12]  480 	mov	r7,a
      00022A 20 E2 11         [24]  481 	jb	acc.2,00110$
                                    482 ;	preemptive.c:171: candidateThread = 2;
      00022D 75 26 02         [24]  483 	mov	_candidateThread,#0x02
                                    484 ;	preemptive.c:172: candidateMask = 0x04;
      000230 75 27 04         [24]  485 	mov	_candidateMask,#0x04
                                    486 ;	preemptive.c:173: newThreadPSW = 0x10;
      000233 75 2A 10         [24]  487 	mov	_newThreadPSW,#0x10
                                    488 ;	preemptive.c:174: previousSP = SP;
      000236 85 81 28         [24]  489 	mov	_previousSP,_SP
                                    490 ;	preemptive.c:175: SP = 0x5F;
      000239 75 81 5F         [24]  491 	mov	_SP,#0x5f
      00023C 80 21            [24]  492 	sjmp	00117$
      00023E                        493 00110$:
                                    494 ;	preemptive.c:177: else if ((threadMask & 0x08) == 0)
      00023E E5 25            [12]  495 	mov	a,_threadMask
      000240 FF               [12]  496 	mov	r7,a
      000241 20 E3 11         [24]  497 	jb	acc.3,00107$
                                    498 ;	preemptive.c:179: candidateThread = 3;
      000244 75 26 03         [24]  499 	mov	_candidateThread,#0x03
                                    500 ;	preemptive.c:180: candidateMask = 0x08;
      000247 75 27 08         [24]  501 	mov	_candidateMask,#0x08
                                    502 ;	preemptive.c:181: newThreadPSW = 0x18;
      00024A 75 2A 18         [24]  503 	mov	_newThreadPSW,#0x18
                                    504 ;	preemptive.c:182: previousSP = SP;
      00024D 85 81 28         [24]  505 	mov	_previousSP,_SP
                                    506 ;	preemptive.c:183: SP = 0x6F;
      000250 75 81 6F         [24]  507 	mov	_SP,#0x6f
      000253 80 0A            [24]  508 	sjmp	00117$
      000255                        509 00107$:
                                    510 ;	preemptive.c:187: if (savedEA)
      000255 E5 2D            [12]  511 	mov	a,_savedEA
      000257 60 02            [24]  512 	jz	00105$
                                    513 ;	preemptive.c:189: EA = 1;
                                    514 ;	assignBit
      000259 D2 AF            [12]  515 	setb	_EA
      00025B                        516 00105$:
                                    517 ;	preemptive.c:191: return (ThreadID)-1;
      00025B 75 82 FF         [24]  518 	mov	dpl, #0xff
      00025E 22               [24]  519 	ret
      00025F                        520 00117$:
                                    521 ;	preemptive.c:194: threadMask |= candidateMask;
      00025F E5 27            [12]  522 	mov	a,_candidateMask
      000261 42 25            [12]  523 	orl	_threadMask,a
                                    524 ;	preemptive.c:195: zeroValue = 0x00;
      000263 75 29 00         [24]  525 	mov	_zeroValue,#0x00
                                    526 ;	preemptive.c:205: __endasm;
      000266 C0 2B            [24]  527 	push	_savedFpLow
      000268 C0 2C            [24]  528 	push	_savedFpHigh
      00026A C0 29            [24]  529 	push	_zeroValue
      00026C C0 29            [24]  530 	push	_zeroValue
      00026E C0 29            [24]  531 	push	_zeroValue
      000270 C0 29            [24]  532 	push	_zeroValue
      000272 C0 2A            [24]  533 	push	_newThreadPSW
                                    534 ;	preemptive.c:207: if (candidateThread == 0)
      000274 E5 26            [12]  535 	mov	a,_candidateThread
      000276 70 05            [24]  536 	jnz	00125$
                                    537 ;	preemptive.c:209: savedSP0 = SP;
      000278 85 81 20         [24]  538 	mov	_savedSP0,_SP
      00027B 80 17            [24]  539 	sjmp	00126$
      00027D                        540 00125$:
                                    541 ;	preemptive.c:211: else if (candidateThread == 1)
      00027D 74 01            [12]  542 	mov	a,#0x01
      00027F B5 26 05         [24]  543 	cjne	a,_candidateThread,00122$
                                    544 ;	preemptive.c:213: savedSP1 = SP;
      000282 85 81 21         [24]  545 	mov	_savedSP1,_SP
      000285 80 0D            [24]  546 	sjmp	00126$
      000287                        547 00122$:
                                    548 ;	preemptive.c:215: else if (candidateThread == 2)
      000287 74 02            [12]  549 	mov	a,#0x02
      000289 B5 26 05         [24]  550 	cjne	a,_candidateThread,00119$
                                    551 ;	preemptive.c:217: savedSP2 = SP;
      00028C 85 81 22         [24]  552 	mov	_savedSP2,_SP
      00028F 80 03            [24]  553 	sjmp	00126$
      000291                        554 00119$:
                                    555 ;	preemptive.c:221: savedSP3 = SP;
      000291 85 81 23         [24]  556 	mov	_savedSP3,_SP
      000294                        557 00126$:
                                    558 ;	preemptive.c:224: SP = previousSP;
      000294 85 28 81         [24]  559 	mov	_SP,_previousSP
                                    560 ;	preemptive.c:226: if (savedEA)
      000297 E5 2D            [12]  561 	mov	a,_savedEA
      000299 60 02            [24]  562 	jz	00128$
                                    563 ;	preemptive.c:228: EA = 1;
                                    564 ;	assignBit
      00029B D2 AF            [12]  565 	setb	_EA
      00029D                        566 00128$:
                                    567 ;	preemptive.c:231: return candidateThread;
      00029D 85 26 82         [24]  568 	mov	dpl, _candidateThread
                                    569 ;	preemptive.c:232: }
      0002A0 22               [24]  570 	ret
                                    571 ;------------------------------------------------------------
                                    572 ;Allocation info for local variables in function 'ThreadYield'
                                    573 ;------------------------------------------------------------
                                    574 ;	preemptive.c:234: void ThreadYield(void)
                                    575 ;	-----------------------------------------
                                    576 ;	 function ThreadYield
                                    577 ;	-----------------------------------------
      0002A1                        578 _ThreadYield:
                                    579 ;	preemptive.c:236: EA = 0;
                                    580 ;	assignBit
      0002A1 C2 AF            [12]  581 	clr	_EA
                                    582 ;	preemptive.c:237: SAVESTATE;
      0002A3 C0 E0            [24]  583 	push acc 
      0002A5 C0 F0            [24]  584 	push b 
      0002A7 C0 82            [24]  585 	push dpl 
      0002A9 C0 83            [24]  586 	push dph 
      0002AB C0 D0            [24]  587 	push psw 
      0002AD E5 24            [12]  588 	mov a, _currentThread 
      0002AF 60 0B            [24]  589 	jz SS_SAVE_0_237 
      0002B1 14               [12]  590 	dec a 
      0002B2 60 0D            [24]  591 	jz SS_SAVE_1_237 
      0002B4 14               [12]  592 	dec a 
      0002B5 60 0F            [24]  593 	jz SS_SAVE_2_237 
      0002B7 85 81 23         [24]  594 	mov _savedSP3, sp 
      0002BA 80 0D            [24]  595 	sjmp SS_SAVE_DONE_237 
      0002BC                        596 SS_SAVE_0_237:
      0002BC 85 81 20         [24]  597 	mov _savedSP0, sp 
      0002BF 80 08            [24]  598 	sjmp SS_SAVE_DONE_237 
      0002C1                        599 SS_SAVE_1_237:
      0002C1 85 81 21         [24]  600 	mov _savedSP1, sp 
      0002C4 80 03            [24]  601 	sjmp SS_SAVE_DONE_237 
      0002C6                        602 SS_SAVE_2_237:
      0002C6 85 81 22         [24]  603 	mov _savedSP2, sp 
      0002C9                        604 SS_SAVE_DONE_237:
                                    605 ;	preemptive.c:240: __endasm;
      0002C9 12 01 74         [24]  606 	lcall	_scheduler
                                    607 ;	preemptive.c:241: RESTORESTATE;
      0002CC E5 24            [12]  608 	mov a, _currentThread 
      0002CE 60 0B            [24]  609 	jz RS_LOAD_0_241 
      0002D0 14               [12]  610 	dec a 
      0002D1 60 0D            [24]  611 	jz RS_LOAD_1_241 
      0002D3 14               [12]  612 	dec a 
      0002D4 60 0F            [24]  613 	jz RS_LOAD_2_241 
      0002D6 85 23 81         [24]  614 	mov sp, _savedSP3 
      0002D9 80 0D            [24]  615 	sjmp RS_LOAD_DONE_241 
      0002DB                        616 RS_LOAD_0_241:
      0002DB 85 20 81         [24]  617 	mov sp, _savedSP0 
      0002DE 80 08            [24]  618 	sjmp RS_LOAD_DONE_241 
      0002E0                        619 RS_LOAD_1_241:
      0002E0 85 21 81         [24]  620 	mov sp, _savedSP1 
      0002E3 80 03            [24]  621 	sjmp RS_LOAD_DONE_241 
      0002E5                        622 RS_LOAD_2_241:
      0002E5 85 22 81         [24]  623 	mov sp, _savedSP2 
      0002E8                        624 RS_LOAD_DONE_241:
      0002E8 D0 D0            [24]  625 	pop psw 
      0002EA D0 83            [24]  626 	pop dph 
      0002EC D0 82            [24]  627 	pop dpl 
      0002EE D0 F0            [24]  628 	pop b 
      0002F0 D0 E0            [24]  629 	pop acc 
                                    630 ;	preemptive.c:242: EA = 1;
                                    631 ;	assignBit
      0002F2 D2 AF            [12]  632 	setb	_EA
                                    633 ;	preemptive.c:243: }
      0002F4 22               [24]  634 	ret
                                    635 ;------------------------------------------------------------
                                    636 ;Allocation info for local variables in function 'ThreadExit'
                                    637 ;------------------------------------------------------------
                                    638 ;	preemptive.c:245: void ThreadExit(void)
                                    639 ;	-----------------------------------------
                                    640 ;	 function ThreadExit
                                    641 ;	-----------------------------------------
      0002F5                        642 _ThreadExit:
                                    643 ;	preemptive.c:247: EA = 0;
                                    644 ;	assignBit
      0002F5 C2 AF            [12]  645 	clr	_EA
                                    646 ;	preemptive.c:249: if (currentThread == 0)
      0002F7 E5 24            [12]  647 	mov	a,_currentThread
      0002F9 70 05            [24]  648 	jnz	00108$
                                    649 ;	preemptive.c:251: threadMask &= 0xFE;
      0002FB 53 25 FE         [24]  650 	anl	_threadMask,#0xfe
      0002FE 80 17            [24]  651 	sjmp	00109$
      000300                        652 00108$:
                                    653 ;	preemptive.c:253: else if (currentThread == 1)
      000300 74 01            [12]  654 	mov	a,#0x01
      000302 B5 24 05         [24]  655 	cjne	a,_currentThread,00105$
                                    656 ;	preemptive.c:255: threadMask &= 0xFD;
      000305 53 25 FD         [24]  657 	anl	_threadMask,#0xfd
      000308 80 0D            [24]  658 	sjmp	00109$
      00030A                        659 00105$:
                                    660 ;	preemptive.c:257: else if (currentThread == 2)
      00030A 74 02            [12]  661 	mov	a,#0x02
      00030C B5 24 05         [24]  662 	cjne	a,_currentThread,00102$
                                    663 ;	preemptive.c:259: threadMask &= 0xFB;
      00030F 53 25 FB         [24]  664 	anl	_threadMask,#0xfb
      000312 80 03            [24]  665 	sjmp	00109$
      000314                        666 00102$:
                                    667 ;	preemptive.c:263: threadMask &= 0xF7;
      000314 53 25 F7         [24]  668 	anl	_threadMask,#0xf7
      000317                        669 00109$:
                                    670 ;	preemptive.c:266: if (threadMask == 0)
      000317 E5 25            [12]  671 	mov	a,_threadMask
      000319 70 02            [24]  672 	jnz	00114$
                                    673 ;	preemptive.c:268: while (1)
      00031B                        674 00111$:
      00031B 80 FE            [24]  675 	sjmp	00111$
      00031D                        676 00114$:
                                    677 ;	preemptive.c:275: __endasm;
      00031D 12 01 74         [24]  678 	lcall	_scheduler
                                    679 ;	preemptive.c:276: RESTORESTATE;
      000320 E5 24            [12]  680 	mov a, _currentThread 
      000322 60 0B            [24]  681 	jz RS_LOAD_0_276 
      000324 14               [12]  682 	dec a 
      000325 60 0D            [24]  683 	jz RS_LOAD_1_276 
      000327 14               [12]  684 	dec a 
      000328 60 0F            [24]  685 	jz RS_LOAD_2_276 
      00032A 85 23 81         [24]  686 	mov sp, _savedSP3 
      00032D 80 0D            [24]  687 	sjmp RS_LOAD_DONE_276 
      00032F                        688 RS_LOAD_0_276:
      00032F 85 20 81         [24]  689 	mov sp, _savedSP0 
      000332 80 08            [24]  690 	sjmp RS_LOAD_DONE_276 
      000334                        691 RS_LOAD_1_276:
      000334 85 21 81         [24]  692 	mov sp, _savedSP1 
      000337 80 03            [24]  693 	sjmp RS_LOAD_DONE_276 
      000339                        694 RS_LOAD_2_276:
      000339 85 22 81         [24]  695 	mov sp, _savedSP2 
      00033C                        696 RS_LOAD_DONE_276:
      00033C D0 D0            [24]  697 	pop psw 
      00033E D0 83            [24]  698 	pop dph 
      000340 D0 82            [24]  699 	pop dpl 
      000342 D0 F0            [24]  700 	pop b 
      000344 D0 E0            [24]  701 	pop acc 
                                    702 ;	preemptive.c:277: EA = 1;
                                    703 ;	assignBit
      000346 D2 AF            [12]  704 	setb	_EA
                                    705 ;	preemptive.c:278: }
      000348 22               [24]  706 	ret
                                    707 ;------------------------------------------------------------
                                    708 ;Allocation info for local variables in function 'myTimer0Handler'
                                    709 ;------------------------------------------------------------
                                    710 ;	preemptive.c:280: void myTimer0Handler(void) __naked
                                    711 ;	-----------------------------------------
                                    712 ;	 function myTimer0Handler
                                    713 ;	-----------------------------------------
      000349                        714 _myTimer0Handler:
                                    715 ;	naked function: no prologue.
                                    716 ;	preemptive.c:282: SAVESTATE;
      000349 C0 E0            [24]  717 	push acc 
      00034B C0 F0            [24]  718 	push b 
      00034D C0 82            [24]  719 	push dpl 
      00034F C0 83            [24]  720 	push dph 
      000351 C0 D0            [24]  721 	push psw 
      000353 E5 24            [12]  722 	mov a, _currentThread 
      000355 60 0B            [24]  723 	jz SS_SAVE_0_282 
      000357 14               [12]  724 	dec a 
      000358 60 0D            [24]  725 	jz SS_SAVE_1_282 
      00035A 14               [12]  726 	dec a 
      00035B 60 0F            [24]  727 	jz SS_SAVE_2_282 
      00035D 85 81 23         [24]  728 	mov _savedSP3, sp 
      000360 80 0D            [24]  729 	sjmp SS_SAVE_DONE_282 
      000362                        730 SS_SAVE_0_282:
      000362 85 81 20         [24]  731 	mov _savedSP0, sp 
      000365 80 08            [24]  732 	sjmp SS_SAVE_DONE_282 
      000367                        733 SS_SAVE_1_282:
      000367 85 81 21         [24]  734 	mov _savedSP1, sp 
      00036A 80 03            [24]  735 	sjmp SS_SAVE_DONE_282 
      00036C                        736 SS_SAVE_2_282:
      00036C 85 81 22         [24]  737 	mov _savedSP2, sp 
      00036F                        738 SS_SAVE_DONE_282:
                                    739 ;	preemptive.c:285: __endasm;
      00036F 12 01 74         [24]  740 	lcall	_scheduler
                                    741 ;	preemptive.c:286: RESTORESTATE;
      000372 E5 24            [12]  742 	mov a, _currentThread 
      000374 60 0B            [24]  743 	jz RS_LOAD_0_286 
      000376 14               [12]  744 	dec a 
      000377 60 0D            [24]  745 	jz RS_LOAD_1_286 
      000379 14               [12]  746 	dec a 
      00037A 60 0F            [24]  747 	jz RS_LOAD_2_286 
      00037C 85 23 81         [24]  748 	mov sp, _savedSP3 
      00037F 80 0D            [24]  749 	sjmp RS_LOAD_DONE_286 
      000381                        750 RS_LOAD_0_286:
      000381 85 20 81         [24]  751 	mov sp, _savedSP0 
      000384 80 08            [24]  752 	sjmp RS_LOAD_DONE_286 
      000386                        753 RS_LOAD_1_286:
      000386 85 21 81         [24]  754 	mov sp, _savedSP1 
      000389 80 03            [24]  755 	sjmp RS_LOAD_DONE_286 
      00038B                        756 RS_LOAD_2_286:
      00038B 85 22 81         [24]  757 	mov sp, _savedSP2 
      00038E                        758 RS_LOAD_DONE_286:
      00038E D0 D0            [24]  759 	pop psw 
      000390 D0 83            [24]  760 	pop dph 
      000392 D0 82            [24]  761 	pop dpl 
      000394 D0 F0            [24]  762 	pop b 
      000396 D0 E0            [24]  763 	pop acc 
                                    764 ;	preemptive.c:289: __endasm;
      000398 32               [24]  765 	reti
                                    766 ;	preemptive.c:290: }
                                    767 ;	naked function: no epilogue.
                                    768 	.area CSEG    (CODE)
                                    769 	.area CONST   (CODE)
                                    770 	.area XINIT   (CODE)
                                    771 	.area CABS    (ABS,CODE)
