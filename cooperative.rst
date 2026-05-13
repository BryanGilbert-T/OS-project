                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.0 #15242 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module cooperative
                                      6 	
                                      7 	.optsdcc -mmcs51 --model-small
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _Bootstrap
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
                                    109 	.globl _savedFpHigh
                                    110 	.globl _savedFpLow
                                    111 	.globl _newThreadPSW
                                    112 	.globl _zeroValue
                                    113 	.globl _previousSP
                                    114 	.globl _candidateMask
                                    115 	.globl _candidateThread
                                    116 	.globl _threadMask
                                    117 	.globl _currentThread
                                    118 	.globl _savedSP
                                    119 	.globl _ThreadCreate
                                    120 	.globl _ThreadYield
                                    121 	.globl _ThreadExit
                                    122 ;--------------------------------------------------------
                                    123 ; special function registers
                                    124 ;--------------------------------------------------------
                                    125 	.area RSEG    (ABS,DATA)
      000000                        126 	.org 0x0000
                           000080   127 _P0	=	0x0080
                           000081   128 _SP	=	0x0081
                           000082   129 _DPL	=	0x0082
                           000083   130 _DPH	=	0x0083
                           000087   131 _PCON	=	0x0087
                           000088   132 _TCON	=	0x0088
                           000089   133 _TMOD	=	0x0089
                           00008A   134 _TL0	=	0x008a
                           00008B   135 _TL1	=	0x008b
                           00008C   136 _TH0	=	0x008c
                           00008D   137 _TH1	=	0x008d
                           000090   138 _P1	=	0x0090
                           000098   139 _SCON	=	0x0098
                           000099   140 _SBUF	=	0x0099
                           0000A0   141 _P2	=	0x00a0
                           0000A8   142 _IE	=	0x00a8
                           0000B0   143 _P3	=	0x00b0
                           0000B8   144 _IP	=	0x00b8
                           0000D0   145 _PSW	=	0x00d0
                           0000E0   146 _ACC	=	0x00e0
                           0000F0   147 _B	=	0x00f0
                                    148 ;--------------------------------------------------------
                                    149 ; special function bits
                                    150 ;--------------------------------------------------------
                                    151 	.area RSEG    (ABS,DATA)
      000000                        152 	.org 0x0000
                           000080   153 _P0_0	=	0x0080
                           000081   154 _P0_1	=	0x0081
                           000082   155 _P0_2	=	0x0082
                           000083   156 _P0_3	=	0x0083
                           000084   157 _P0_4	=	0x0084
                           000085   158 _P0_5	=	0x0085
                           000086   159 _P0_6	=	0x0086
                           000087   160 _P0_7	=	0x0087
                           000088   161 _IT0	=	0x0088
                           000089   162 _IE0	=	0x0089
                           00008A   163 _IT1	=	0x008a
                           00008B   164 _IE1	=	0x008b
                           00008C   165 _TR0	=	0x008c
                           00008D   166 _TF0	=	0x008d
                           00008E   167 _TR1	=	0x008e
                           00008F   168 _TF1	=	0x008f
                           000090   169 _P1_0	=	0x0090
                           000091   170 _P1_1	=	0x0091
                           000092   171 _P1_2	=	0x0092
                           000093   172 _P1_3	=	0x0093
                           000094   173 _P1_4	=	0x0094
                           000095   174 _P1_5	=	0x0095
                           000096   175 _P1_6	=	0x0096
                           000097   176 _P1_7	=	0x0097
                           000098   177 _RI	=	0x0098
                           000099   178 _TI	=	0x0099
                           00009A   179 _RB8	=	0x009a
                           00009B   180 _TB8	=	0x009b
                           00009C   181 _REN	=	0x009c
                           00009D   182 _SM2	=	0x009d
                           00009E   183 _SM1	=	0x009e
                           00009F   184 _SM0	=	0x009f
                           0000A0   185 _P2_0	=	0x00a0
                           0000A1   186 _P2_1	=	0x00a1
                           0000A2   187 _P2_2	=	0x00a2
                           0000A3   188 _P2_3	=	0x00a3
                           0000A4   189 _P2_4	=	0x00a4
                           0000A5   190 _P2_5	=	0x00a5
                           0000A6   191 _P2_6	=	0x00a6
                           0000A7   192 _P2_7	=	0x00a7
                           0000A8   193 _EX0	=	0x00a8
                           0000A9   194 _ET0	=	0x00a9
                           0000AA   195 _EX1	=	0x00aa
                           0000AB   196 _ET1	=	0x00ab
                           0000AC   197 _ES	=	0x00ac
                           0000AF   198 _EA	=	0x00af
                           0000B0   199 _P3_0	=	0x00b0
                           0000B1   200 _P3_1	=	0x00b1
                           0000B2   201 _P3_2	=	0x00b2
                           0000B3   202 _P3_3	=	0x00b3
                           0000B4   203 _P3_4	=	0x00b4
                           0000B5   204 _P3_5	=	0x00b5
                           0000B6   205 _P3_6	=	0x00b6
                           0000B7   206 _P3_7	=	0x00b7
                           0000B0   207 _RXD	=	0x00b0
                           0000B1   208 _TXD	=	0x00b1
                           0000B2   209 _INT0	=	0x00b2
                           0000B3   210 _INT1	=	0x00b3
                           0000B4   211 _T0	=	0x00b4
                           0000B5   212 _T1	=	0x00b5
                           0000B6   213 _WR	=	0x00b6
                           0000B7   214 _RD	=	0x00b7
                           0000B8   215 _PX0	=	0x00b8
                           0000B9   216 _PT0	=	0x00b9
                           0000BA   217 _PX1	=	0x00ba
                           0000BB   218 _PT1	=	0x00bb
                           0000BC   219 _PS	=	0x00bc
                           0000D0   220 _P	=	0x00d0
                           0000D1   221 _F1	=	0x00d1
                           0000D2   222 _OV	=	0x00d2
                           0000D3   223 _RS0	=	0x00d3
                           0000D4   224 _RS1	=	0x00d4
                           0000D5   225 _F0	=	0x00d5
                           0000D6   226 _AC	=	0x00d6
                           0000D7   227 _CY	=	0x00d7
                                    228 ;--------------------------------------------------------
                                    229 ; overlayable register banks
                                    230 ;--------------------------------------------------------
                                    231 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        232 	.ds 8
                                    233 ;--------------------------------------------------------
                                    234 ; internal ram data
                                    235 ;--------------------------------------------------------
                                    236 	.area DSEG    (DATA)
                           000020   237 _savedSP	=	0x0020
                           000024   238 _currentThread	=	0x0024
                           000025   239 _threadMask	=	0x0025
                           000026   240 _candidateThread	=	0x0026
                           000027   241 _candidateMask	=	0x0027
                           000028   242 _previousSP	=	0x0028
                           000029   243 _zeroValue	=	0x0029
                           00002A   244 _newThreadPSW	=	0x002a
                           00002B   245 _savedFpLow	=	0x002b
                           00002C   246 _savedFpHigh	=	0x002c
                                    247 ;--------------------------------------------------------
                                    248 ; overlayable items in internal ram
                                    249 ;--------------------------------------------------------
                                    250 	.area	OSEG    (OVR,DATA)
                                    251 ;--------------------------------------------------------
                                    252 ; indirectly addressable internal ram data
                                    253 ;--------------------------------------------------------
                                    254 	.area ISEG    (DATA)
                                    255 ;--------------------------------------------------------
                                    256 ; absolute internal ram data
                                    257 ;--------------------------------------------------------
                                    258 	.area IABS    (ABS,DATA)
                                    259 	.area IABS    (ABS,DATA)
                                    260 ;--------------------------------------------------------
                                    261 ; bit data
                                    262 ;--------------------------------------------------------
                                    263 	.area BSEG    (BIT)
                                    264 ;--------------------------------------------------------
                                    265 ; paged external ram data
                                    266 ;--------------------------------------------------------
                                    267 	.area PSEG    (PAG,XDATA)
                                    268 ;--------------------------------------------------------
                                    269 ; uninitialized external ram data
                                    270 ;--------------------------------------------------------
                                    271 	.area XSEG    (XDATA)
                                    272 ;--------------------------------------------------------
                                    273 ; absolute external ram data
                                    274 ;--------------------------------------------------------
                                    275 	.area XABS    (ABS,XDATA)
                                    276 ;--------------------------------------------------------
                                    277 ; initialized external ram data
                                    278 ;--------------------------------------------------------
                                    279 	.area XISEG   (XDATA)
                                    280 	.area HOME    (CODE)
                                    281 	.area GSINIT0 (CODE)
                                    282 	.area GSINIT1 (CODE)
                                    283 	.area GSINIT2 (CODE)
                                    284 	.area GSINIT3 (CODE)
                                    285 	.area GSINIT4 (CODE)
                                    286 	.area GSINIT5 (CODE)
                                    287 	.area GSINIT  (CODE)
                                    288 	.area GSFINAL (CODE)
                                    289 	.area CSEG    (CODE)
                                    290 ;--------------------------------------------------------
                                    291 ; global & static initialisations
                                    292 ;--------------------------------------------------------
                                    293 	.area HOME    (CODE)
                                    294 	.area GSINIT  (CODE)
                                    295 	.area GSFINAL (CODE)
                                    296 	.area GSINIT  (CODE)
                                    297 ;--------------------------------------------------------
                                    298 ; Home
                                    299 ;--------------------------------------------------------
                                    300 	.area HOME    (CODE)
                                    301 	.area HOME    (CODE)
                                    302 ;--------------------------------------------------------
                                    303 ; code
                                    304 ;--------------------------------------------------------
                                    305 	.area CSEG    (CODE)
                                    306 ;------------------------------------------------------------
                                    307 ;Allocation info for local variables in function 'Bootstrap'
                                    308 ;------------------------------------------------------------
                                    309 ;	cooperative.c:81: void Bootstrap(void)
                                    310 ;	-----------------------------------------
                                    311 ;	 function Bootstrap
                                    312 ;	-----------------------------------------
      0000A6                        313 _Bootstrap:
                           000007   314 	ar7 = 0x07
                           000006   315 	ar6 = 0x06
                           000005   316 	ar5 = 0x05
                           000004   317 	ar4 = 0x04
                           000003   318 	ar3 = 0x03
                           000002   319 	ar2 = 0x02
                           000001   320 	ar1 = 0x01
                           000000   321 	ar0 = 0x00
                                    322 ;	cooperative.c:95: threadMask = 0x00;
      0000A6 75 25 00         [24]  323 	mov	_threadMask,#0x00
                                    324 ;	cooperative.c:96: currentThread = ThreadCreate(main);
      0000A9 90 00 90         [24]  325 	mov	dptr,#_main
      0000AC 12 00 C4         [24]  326 	lcall	_ThreadCreate
      0000AF 85 82 24         [24]  327 	mov	_currentThread,dpl
                                    328 ;	cooperative.c:97: RESTORESTATE;
      0000B2 E5 24            [12]  329 	mov	a,_currentThread
      0000B4 24 20            [12]  330 	add	a, #_savedSP
      0000B6 F9               [12]  331 	mov	r1,a
      0000B7 87 81            [24]  332 	mov	_SP,@r1
      0000B9 D0 D0            [24]  333 	pop psw 
      0000BB D0 83            [24]  334 	pop dph 
      0000BD D0 82            [24]  335 	pop dpl 
      0000BF D0 F0            [24]  336 	pop b 
      0000C1 D0 E0            [24]  337 	pop acc 
                                    338 ;	cooperative.c:98: }
      0000C3 22               [24]  339 	ret
                                    340 ;------------------------------------------------------------
                                    341 ;Allocation info for local variables in function 'ThreadCreate'
                                    342 ;------------------------------------------------------------
                                    343 ;fp            Allocated to registers 
                                    344 ;------------------------------------------------------------
                                    345 ;	cooperative.c:106: ThreadID ThreadCreate(FunctionPtr fp)
                                    346 ;	-----------------------------------------
                                    347 ;	 function ThreadCreate
                                    348 ;	-----------------------------------------
      0000C4                        349 _ThreadCreate:
                                    350 ;	cooperative.c:155: __endasm;
      0000C4 85 82 2B         [24]  351 	mov	_savedFpLow, dpl
      0000C7 85 83 2C         [24]  352 	mov	_savedFpHigh, dph
                                    353 ;	cooperative.c:157: candidateThread = 0;
      0000CA 75 26 00         [24]  354 	mov	_candidateThread,#0x00
                                    355 ;	cooperative.c:158: candidateMask = 0x01;
      0000CD 75 27 01         [24]  356 	mov	_candidateMask,#0x01
                                    357 ;	cooperative.c:160: while (candidateThread < MAXTHREADS)
      0000D0                        358 00103$:
      0000D0 74 FC            [12]  359 	mov	a,#0x100 - 0x04
      0000D2 25 26            [12]  360 	add	a,_candidateThread
      0000D4 40 13            [24]  361 	jc	00105$
                                    362 ;	cooperative.c:162: if ((threadMask & candidateMask) == 0)
      0000D6 E5 27            [12]  363 	mov	a,_candidateMask
      0000D8 55 25            [12]  364 	anl	a,_threadMask
      0000DA 60 0D            [24]  365 	jz	00105$
                                    366 ;	cooperative.c:166: candidateThread++;
      0000DC E5 26            [12]  367 	mov	a,_candidateThread
      0000DE 04               [12]  368 	inc	a
      0000DF F5 26            [12]  369 	mov	_candidateThread,a
                                    370 ;	cooperative.c:167: candidateMask <<= 1;
      0000E1 E5 27            [12]  371 	mov	a,_candidateMask
      0000E3 25 E0            [12]  372 	add	a,acc
      0000E5 F5 27            [12]  373 	mov	_candidateMask,a
      0000E7 80 E7            [24]  374 	sjmp	00103$
      0000E9                        375 00105$:
                                    376 ;	cooperative.c:170: if (candidateThread == MAXTHREADS)
      0000E9 74 04            [12]  377 	mov	a,#0x04
      0000EB B5 26 04         [24]  378 	cjne	a,_candidateThread,00107$
                                    379 ;	cooperative.c:172: return -1;
      0000EE 75 82 FF         [24]  380 	mov	dpl, #0xff
      0000F1 22               [24]  381 	ret
      0000F2                        382 00107$:
                                    383 ;	cooperative.c:175: threadMask |= candidateMask;
      0000F2 E5 27            [12]  384 	mov	a,_candidateMask
      0000F4 42 25            [12]  385 	orl	_threadMask,a
                                    386 ;	cooperative.c:178: zeroValue = 0x00;
      0000F6 75 29 00         [24]  387 	mov	_zeroValue,#0x00
                                    388 ;	cooperative.c:179: newThreadPSW = candidateThread << 3;  /* bank 0, 1, 2, or 3 */
      0000F9 E5 26            [12]  389 	mov	a,_candidateThread
      0000FB C4               [12]  390 	swap	a
      0000FC 03               [12]  391 	rr	a
      0000FD 54 F8            [12]  392 	anl	a,#0xf8
      0000FF F5 2A            [12]  393 	mov	_newThreadPSW,a
                                    394 ;	cooperative.c:180: previousSP = SP;
      000101 85 81 28         [24]  395 	mov	_previousSP,_SP
                                    396 ;	cooperative.c:187: SP = 0x3F + (candidateThread << 4);
      000104 E5 26            [12]  397 	mov	a,_candidateThread
      000106 C4               [12]  398 	swap	a
      000107 54 F0            [12]  399 	anl	a,#0xf0
      000109 FF               [12]  400 	mov	r7,a
      00010A 24 3F            [12]  401 	add	a,#0x3f
      00010C F5 81            [12]  402 	mov	_SP,a
                                    403 ;	cooperative.c:202: __endasm;
      00010E C0 2B            [24]  404 	push	_savedFpLow
      000110 C0 2C            [24]  405 	push	_savedFpHigh
      000112 C0 29            [24]  406 	push	_zeroValue ;
      000114 C0 29            [24]  407 	push	_zeroValue ;
      000116 C0 29            [24]  408 	push	_zeroValue ;
      000118 C0 29            [24]  409 	push	_zeroValue ;
      00011A C0 2A            [24]  410 	push	_newThreadPSW ;
                                    411 ;	cooperative.c:204: savedSP[candidateThread] = SP;
      00011C E5 26            [12]  412 	mov	a,_candidateThread
      00011E 24 20            [12]  413 	add	a, #_savedSP
      000120 F8               [12]  414 	mov	r0,a
      000121 A6 81            [24]  415 	mov	@r0,_SP
                                    416 ;	cooperative.c:205: SP = previousSP;
      000123 85 28 81         [24]  417 	mov	_SP,_previousSP
                                    418 ;	cooperative.c:207: return candidateThread;
      000126 85 26 82         [24]  419 	mov	dpl, _candidateThread
                                    420 ;	cooperative.c:208: }
      000129 22               [24]  421 	ret
                                    422 ;------------------------------------------------------------
                                    423 ;Allocation info for local variables in function 'ThreadYield'
                                    424 ;------------------------------------------------------------
                                    425 ;	cooperative.c:217: void ThreadYield(void)
                                    426 ;	-----------------------------------------
                                    427 ;	 function ThreadYield
                                    428 ;	-----------------------------------------
      00012A                        429 _ThreadYield:
                                    430 ;	cooperative.c:219: SAVESTATE;
      00012A C0 E0            [24]  431 	push acc 
      00012C C0 F0            [24]  432 	push b 
      00012E C0 82            [24]  433 	push dpl 
      000130 C0 D0            [24]  434 	push psw 
      000132 C0 83            [24]  435 	push dph 
      000134 E5 24            [12]  436 	mov	a,_currentThread
      000136 24 20            [12]  437 	add	a, #_savedSP
      000138 F8               [12]  438 	mov	r0,a
      000139 A6 81            [24]  439 	mov	@r0,_SP
                                    440 ;	cooperative.c:220: do
      00013B                        441 00114$:
                                    442 ;	cooperative.c:232: currentThread++;
      00013B E5 24            [12]  443 	mov	a,_currentThread
      00013D 04               [12]  444 	inc	a
      00013E F5 24            [12]  445 	mov	_currentThread,a
                                    446 ;	cooperative.c:233: if (currentThread >= MAXTHREADS)
      000140 74 FC            [12]  447 	mov	a,#0x100 - 0x04
      000142 25 24            [12]  448 	add	a,_currentThread
      000144 50 03            [24]  449 	jnc	00102$
                                    450 ;	cooperative.c:235: currentThread = 0;
      000146 75 24 00         [24]  451 	mov	_currentThread,#0x00
      000149                        452 00102$:
                                    453 ;	cooperative.c:238: if (currentThread == 0)
      000149 E5 24            [12]  454 	mov	a,_currentThread
      00014B 70 05            [24]  455 	jnz	00110$
                                    456 ;	cooperative.c:240: candidateMask = 0x01;
      00014D 75 27 01         [24]  457 	mov	_candidateMask,#0x01
      000150 80 17            [24]  458 	sjmp	00111$
      000152                        459 00110$:
                                    460 ;	cooperative.c:242: else if (currentThread == 1)
      000152 74 01            [12]  461 	mov	a,#0x01
      000154 B5 24 05         [24]  462 	cjne	a,_currentThread,00107$
                                    463 ;	cooperative.c:244: candidateMask = 0x02;
      000157 75 27 02         [24]  464 	mov	_candidateMask,#0x02
      00015A 80 0D            [24]  465 	sjmp	00111$
      00015C                        466 00107$:
                                    467 ;	cooperative.c:246: else if (currentThread == 2)
      00015C 74 02            [12]  468 	mov	a,#0x02
      00015E B5 24 05         [24]  469 	cjne	a,_currentThread,00104$
                                    470 ;	cooperative.c:248: candidateMask = 0x04;
      000161 75 27 04         [24]  471 	mov	_candidateMask,#0x04
      000164 80 03            [24]  472 	sjmp	00111$
      000166                        473 00104$:
                                    474 ;	cooperative.c:252: candidateMask = 0x08;
      000166 75 27 08         [24]  475 	mov	_candidateMask,#0x08
      000169                        476 00111$:
                                    477 ;	cooperative.c:255: if (threadMask & candidateMask)
      000169 E5 27            [12]  478 	mov	a,_candidateMask
      00016B 55 25            [12]  479 	anl	a,_threadMask
      00016D 60 CC            [24]  480 	jz	00114$
                                    481 ;	cooperative.c:260: RESTORESTATE;
      00016F E5 24            [12]  482 	mov	a,_currentThread
      000171 24 20            [12]  483 	add	a, #_savedSP
      000173 F9               [12]  484 	mov	r1,a
      000174 87 81            [24]  485 	mov	_SP,@r1
      000176 D0 D0            [24]  486 	pop psw 
      000178 D0 83            [24]  487 	pop dph 
      00017A D0 82            [24]  488 	pop dpl 
      00017C D0 F0            [24]  489 	pop b 
      00017E D0 E0            [24]  490 	pop acc 
                                    491 ;	cooperative.c:261: }
      000180 22               [24]  492 	ret
                                    493 ;------------------------------------------------------------
                                    494 ;Allocation info for local variables in function 'ThreadExit'
                                    495 ;------------------------------------------------------------
                                    496 ;	cooperative.c:268: void ThreadExit(void)
                                    497 ;	-----------------------------------------
                                    498 ;	 function ThreadExit
                                    499 ;	-----------------------------------------
      000181                        500 _ThreadExit:
                                    501 ;	cooperative.c:276: if (currentThread == 0)
      000181 E5 24            [12]  502 	mov	a,_currentThread
      000183 70 05            [24]  503 	jnz	00108$
                                    504 ;	cooperative.c:278: threadMask &= 0xFE;
      000185 53 25 FE         [24]  505 	anl	_threadMask,#0xfe
      000188 80 17            [24]  506 	sjmp	00109$
      00018A                        507 00108$:
                                    508 ;	cooperative.c:280: else if (currentThread == 1)
      00018A 74 01            [12]  509 	mov	a,#0x01
      00018C B5 24 05         [24]  510 	cjne	a,_currentThread,00105$
                                    511 ;	cooperative.c:282: threadMask &= 0xFD;
      00018F 53 25 FD         [24]  512 	anl	_threadMask,#0xfd
      000192 80 0D            [24]  513 	sjmp	00109$
      000194                        514 00105$:
                                    515 ;	cooperative.c:284: else if (currentThread == 2)
      000194 74 02            [12]  516 	mov	a,#0x02
      000196 B5 24 05         [24]  517 	cjne	a,_currentThread,00102$
                                    518 ;	cooperative.c:286: threadMask &= 0xFB;
      000199 53 25 FB         [24]  519 	anl	_threadMask,#0xfb
      00019C 80 03            [24]  520 	sjmp	00109$
      00019E                        521 00102$:
                                    522 ;	cooperative.c:290: threadMask &= 0xF7;
      00019E 53 25 F7         [24]  523 	anl	_threadMask,#0xf7
      0001A1                        524 00109$:
                                    525 ;	cooperative.c:293: if (threadMask == 0)
      0001A1 E5 25            [12]  526 	mov	a,_threadMask
      0001A3 70 02            [24]  527 	jnz	00128$
                                    528 ;	cooperative.c:295: while (1)
      0001A5                        529 00111$:
                                    530 ;	cooperative.c:301: do
      0001A5 80 FE            [24]  531 	sjmp	00111$
      0001A7                        532 00128$:
                                    533 ;	cooperative.c:303: currentThread++;
      0001A7 E5 24            [12]  534 	mov	a,_currentThread
      0001A9 04               [12]  535 	inc	a
      0001AA F5 24            [12]  536 	mov	_currentThread,a
                                    537 ;	cooperative.c:304: if (currentThread >= MAXTHREADS)
      0001AC 74 FC            [12]  538 	mov	a,#0x100 - 0x04
      0001AE 25 24            [12]  539 	add	a,_currentThread
      0001B0 50 03            [24]  540 	jnc	00116$
                                    541 ;	cooperative.c:306: currentThread = 0;
      0001B2 75 24 00         [24]  542 	mov	_currentThread,#0x00
      0001B5                        543 00116$:
                                    544 ;	cooperative.c:309: if (currentThread == 0)
      0001B5 E5 24            [12]  545 	mov	a,_currentThread
      0001B7 70 05            [24]  546 	jnz	00124$
                                    547 ;	cooperative.c:311: candidateMask = 0x01;
      0001B9 75 27 01         [24]  548 	mov	_candidateMask,#0x01
      0001BC 80 17            [24]  549 	sjmp	00125$
      0001BE                        550 00124$:
                                    551 ;	cooperative.c:313: else if (currentThread == 1)
      0001BE 74 01            [12]  552 	mov	a,#0x01
      0001C0 B5 24 05         [24]  553 	cjne	a,_currentThread,00121$
                                    554 ;	cooperative.c:315: candidateMask = 0x02;
      0001C3 75 27 02         [24]  555 	mov	_candidateMask,#0x02
      0001C6 80 0D            [24]  556 	sjmp	00125$
      0001C8                        557 00121$:
                                    558 ;	cooperative.c:317: else if (currentThread == 2)
      0001C8 74 02            [12]  559 	mov	a,#0x02
      0001CA B5 24 05         [24]  560 	cjne	a,_currentThread,00118$
                                    561 ;	cooperative.c:319: candidateMask = 0x04;
      0001CD 75 27 04         [24]  562 	mov	_candidateMask,#0x04
      0001D0 80 03            [24]  563 	sjmp	00125$
      0001D2                        564 00118$:
                                    565 ;	cooperative.c:323: candidateMask = 0x08;
      0001D2 75 27 08         [24]  566 	mov	_candidateMask,#0x08
      0001D5                        567 00125$:
                                    568 ;	cooperative.c:326: if (threadMask & candidateMask)
      0001D5 E5 27            [12]  569 	mov	a,_candidateMask
      0001D7 55 25            [12]  570 	anl	a,_threadMask
      0001D9 60 CC            [24]  571 	jz	00128$
                                    572 ;	cooperative.c:332: RESTORESTATE;
      0001DB E5 24            [12]  573 	mov	a,_currentThread
      0001DD 24 20            [12]  574 	add	a, #_savedSP
      0001DF F9               [12]  575 	mov	r1,a
      0001E0 87 81            [24]  576 	mov	_SP,@r1
      0001E2 D0 D0            [24]  577 	pop psw 
      0001E4 D0 83            [24]  578 	pop dph 
      0001E6 D0 82            [24]  579 	pop dpl 
      0001E8 D0 F0            [24]  580 	pop b 
      0001EA D0 E0            [24]  581 	pop acc 
                                    582 ;	cooperative.c:333: }
      0001EC 22               [24]  583 	ret
                                    584 	.area CSEG    (CODE)
                                    585 	.area CONST   (CODE)
                                    586 	.area XINIT   (CODE)
                                    587 	.area CABS    (ABS,CODE)
