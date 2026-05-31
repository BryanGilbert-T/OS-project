                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ISO C Compiler
                                      3 ; Version 4.5.0 #15242 (MINGW64)
                                      4 ;--------------------------------------------------------
                                      5 	.module testpreempt
                                      6 	
                                      7 	.optsdcc -mmcs51 --model-small
                                      8 ;--------------------------------------------------------
                                      9 ; Public variables in this module
                                     10 ;--------------------------------------------------------
                                     11 	.globl _timer0_ISR
                                     12 	.globl __mcs51_genXRAMCLEAR
                                     13 	.globl __mcs51_genXINIT
                                     14 	.globl __mcs51_genRAMCLEAR
                                     15 	.globl __sdcc_gsinit_startup
                                     16 	.globl _main
                                     17 	.globl _Consumer
                                     18 	.globl _Producer
                                     19 	.globl _ThreadCreate
                                     20 	.globl _CY
                                     21 	.globl _AC
                                     22 	.globl _F0
                                     23 	.globl _RS1
                                     24 	.globl _RS0
                                     25 	.globl _OV
                                     26 	.globl _F1
                                     27 	.globl _P
                                     28 	.globl _PS
                                     29 	.globl _PT1
                                     30 	.globl _PX1
                                     31 	.globl _PT0
                                     32 	.globl _PX0
                                     33 	.globl _RD
                                     34 	.globl _WR
                                     35 	.globl _T1
                                     36 	.globl _T0
                                     37 	.globl _INT1
                                     38 	.globl _INT0
                                     39 	.globl _TXD
                                     40 	.globl _RXD
                                     41 	.globl _P3_7
                                     42 	.globl _P3_6
                                     43 	.globl _P3_5
                                     44 	.globl _P3_4
                                     45 	.globl _P3_3
                                     46 	.globl _P3_2
                                     47 	.globl _P3_1
                                     48 	.globl _P3_0
                                     49 	.globl _EA
                                     50 	.globl _ES
                                     51 	.globl _ET1
                                     52 	.globl _EX1
                                     53 	.globl _ET0
                                     54 	.globl _EX0
                                     55 	.globl _P2_7
                                     56 	.globl _P2_6
                                     57 	.globl _P2_5
                                     58 	.globl _P2_4
                                     59 	.globl _P2_3
                                     60 	.globl _P2_2
                                     61 	.globl _P2_1
                                     62 	.globl _P2_0
                                     63 	.globl _SM0
                                     64 	.globl _SM1
                                     65 	.globl _SM2
                                     66 	.globl _REN
                                     67 	.globl _TB8
                                     68 	.globl _RB8
                                     69 	.globl _TI
                                     70 	.globl _RI
                                     71 	.globl _P1_7
                                     72 	.globl _P1_6
                                     73 	.globl _P1_5
                                     74 	.globl _P1_4
                                     75 	.globl _P1_3
                                     76 	.globl _P1_2
                                     77 	.globl _P1_1
                                     78 	.globl _P1_0
                                     79 	.globl _TF1
                                     80 	.globl _TR1
                                     81 	.globl _TF0
                                     82 	.globl _TR0
                                     83 	.globl _IE1
                                     84 	.globl _IT1
                                     85 	.globl _IE0
                                     86 	.globl _IT0
                                     87 	.globl _P0_7
                                     88 	.globl _P0_6
                                     89 	.globl _P0_5
                                     90 	.globl _P0_4
                                     91 	.globl _P0_3
                                     92 	.globl _P0_2
                                     93 	.globl _P0_1
                                     94 	.globl _P0_0
                                     95 	.globl _B
                                     96 	.globl _ACC
                                     97 	.globl _PSW
                                     98 	.globl _IP
                                     99 	.globl _P3
                                    100 	.globl _IE
                                    101 	.globl _P2
                                    102 	.globl _SBUF
                                    103 	.globl _SCON
                                    104 	.globl _P1
                                    105 	.globl _TH1
                                    106 	.globl _TH0
                                    107 	.globl _TL1
                                    108 	.globl _TL0
                                    109 	.globl _TMOD
                                    110 	.globl _TCON
                                    111 	.globl _PCON
                                    112 	.globl _DPH
                                    113 	.globl _DPL
                                    114 	.globl _SP
                                    115 	.globl _P0
                                    116 	.globl _consumedChar
                                    117 	.globl _nextChar
                                    118 	.globl _tail
                                    119 	.globl _head
                                    120 	.globl _buffer
                                    121 	.globl _empty
                                    122 	.globl _full
                                    123 	.globl _mutex
                                    124 ;--------------------------------------------------------
                                    125 ; special function registers
                                    126 ;--------------------------------------------------------
                                    127 	.area RSEG    (ABS,DATA)
      000000                        128 	.org 0x0000
                           000080   129 _P0	=	0x0080
                           000081   130 _SP	=	0x0081
                           000082   131 _DPL	=	0x0082
                           000083   132 _DPH	=	0x0083
                           000087   133 _PCON	=	0x0087
                           000088   134 _TCON	=	0x0088
                           000089   135 _TMOD	=	0x0089
                           00008A   136 _TL0	=	0x008a
                           00008B   137 _TL1	=	0x008b
                           00008C   138 _TH0	=	0x008c
                           00008D   139 _TH1	=	0x008d
                           000090   140 _P1	=	0x0090
                           000098   141 _SCON	=	0x0098
                           000099   142 _SBUF	=	0x0099
                           0000A0   143 _P2	=	0x00a0
                           0000A8   144 _IE	=	0x00a8
                           0000B0   145 _P3	=	0x00b0
                           0000B8   146 _IP	=	0x00b8
                           0000D0   147 _PSW	=	0x00d0
                           0000E0   148 _ACC	=	0x00e0
                           0000F0   149 _B	=	0x00f0
                                    150 ;--------------------------------------------------------
                                    151 ; special function bits
                                    152 ;--------------------------------------------------------
                                    153 	.area RSEG    (ABS,DATA)
      000000                        154 	.org 0x0000
                           000080   155 _P0_0	=	0x0080
                           000081   156 _P0_1	=	0x0081
                           000082   157 _P0_2	=	0x0082
                           000083   158 _P0_3	=	0x0083
                           000084   159 _P0_4	=	0x0084
                           000085   160 _P0_5	=	0x0085
                           000086   161 _P0_6	=	0x0086
                           000087   162 _P0_7	=	0x0087
                           000088   163 _IT0	=	0x0088
                           000089   164 _IE0	=	0x0089
                           00008A   165 _IT1	=	0x008a
                           00008B   166 _IE1	=	0x008b
                           00008C   167 _TR0	=	0x008c
                           00008D   168 _TF0	=	0x008d
                           00008E   169 _TR1	=	0x008e
                           00008F   170 _TF1	=	0x008f
                           000090   171 _P1_0	=	0x0090
                           000091   172 _P1_1	=	0x0091
                           000092   173 _P1_2	=	0x0092
                           000093   174 _P1_3	=	0x0093
                           000094   175 _P1_4	=	0x0094
                           000095   176 _P1_5	=	0x0095
                           000096   177 _P1_6	=	0x0096
                           000097   178 _P1_7	=	0x0097
                           000098   179 _RI	=	0x0098
                           000099   180 _TI	=	0x0099
                           00009A   181 _RB8	=	0x009a
                           00009B   182 _TB8	=	0x009b
                           00009C   183 _REN	=	0x009c
                           00009D   184 _SM2	=	0x009d
                           00009E   185 _SM1	=	0x009e
                           00009F   186 _SM0	=	0x009f
                           0000A0   187 _P2_0	=	0x00a0
                           0000A1   188 _P2_1	=	0x00a1
                           0000A2   189 _P2_2	=	0x00a2
                           0000A3   190 _P2_3	=	0x00a3
                           0000A4   191 _P2_4	=	0x00a4
                           0000A5   192 _P2_5	=	0x00a5
                           0000A6   193 _P2_6	=	0x00a6
                           0000A7   194 _P2_7	=	0x00a7
                           0000A8   195 _EX0	=	0x00a8
                           0000A9   196 _ET0	=	0x00a9
                           0000AA   197 _EX1	=	0x00aa
                           0000AB   198 _ET1	=	0x00ab
                           0000AC   199 _ES	=	0x00ac
                           0000AF   200 _EA	=	0x00af
                           0000B0   201 _P3_0	=	0x00b0
                           0000B1   202 _P3_1	=	0x00b1
                           0000B2   203 _P3_2	=	0x00b2
                           0000B3   204 _P3_3	=	0x00b3
                           0000B4   205 _P3_4	=	0x00b4
                           0000B5   206 _P3_5	=	0x00b5
                           0000B6   207 _P3_6	=	0x00b6
                           0000B7   208 _P3_7	=	0x00b7
                           0000B0   209 _RXD	=	0x00b0
                           0000B1   210 _TXD	=	0x00b1
                           0000B2   211 _INT0	=	0x00b2
                           0000B3   212 _INT1	=	0x00b3
                           0000B4   213 _T0	=	0x00b4
                           0000B5   214 _T1	=	0x00b5
                           0000B6   215 _WR	=	0x00b6
                           0000B7   216 _RD	=	0x00b7
                           0000B8   217 _PX0	=	0x00b8
                           0000B9   218 _PT0	=	0x00b9
                           0000BA   219 _PX1	=	0x00ba
                           0000BB   220 _PT1	=	0x00bb
                           0000BC   221 _PS	=	0x00bc
                           0000D0   222 _P	=	0x00d0
                           0000D1   223 _F1	=	0x00d1
                           0000D2   224 _OV	=	0x00d2
                           0000D3   225 _RS0	=	0x00d3
                           0000D4   226 _RS1	=	0x00d4
                           0000D5   227 _F0	=	0x00d5
                           0000D6   228 _AC	=	0x00d6
                           0000D7   229 _CY	=	0x00d7
                                    230 ;--------------------------------------------------------
                                    231 ; overlayable register banks
                                    232 ;--------------------------------------------------------
                                    233 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        234 	.ds 8
                                    235 ;--------------------------------------------------------
                                    236 ; internal ram data
                                    237 ;--------------------------------------------------------
                                    238 	.area DSEG    (DATA)
                           000030   239 _mutex	=	0x0030
                           000031   240 _full	=	0x0031
                           000032   241 _empty	=	0x0032
                           000033   242 _buffer	=	0x0033
                           000036   243 _head	=	0x0036
                           000037   244 _tail	=	0x0037
                           000038   245 _nextChar	=	0x0038
                           000039   246 _consumedChar	=	0x0039
                                    247 ;--------------------------------------------------------
                                    248 ; overlayable items in internal ram
                                    249 ;--------------------------------------------------------
                                    250 ;--------------------------------------------------------
                                    251 ; Stack segment in internal ram
                                    252 ;--------------------------------------------------------
                                    253 	.area SSEG
      000008                        254 __start__stack:
      000008                        255 	.ds	1
                                    256 
                                    257 ;--------------------------------------------------------
                                    258 ; indirectly addressable internal ram data
                                    259 ;--------------------------------------------------------
                                    260 	.area ISEG    (DATA)
                                    261 ;--------------------------------------------------------
                                    262 ; absolute internal ram data
                                    263 ;--------------------------------------------------------
                                    264 	.area IABS    (ABS,DATA)
                                    265 	.area IABS    (ABS,DATA)
                                    266 ;--------------------------------------------------------
                                    267 ; bit data
                                    268 ;--------------------------------------------------------
                                    269 	.area BSEG    (BIT)
                                    270 ;--------------------------------------------------------
                                    271 ; paged external ram data
                                    272 ;--------------------------------------------------------
                                    273 	.area PSEG    (PAG,XDATA)
                                    274 ;--------------------------------------------------------
                                    275 ; uninitialized external ram data
                                    276 ;--------------------------------------------------------
                                    277 	.area XSEG    (XDATA)
                                    278 ;--------------------------------------------------------
                                    279 ; absolute external ram data
                                    280 ;--------------------------------------------------------
                                    281 	.area XABS    (ABS,XDATA)
                                    282 ;--------------------------------------------------------
                                    283 ; initialized external ram data
                                    284 ;--------------------------------------------------------
                                    285 	.area XISEG   (XDATA)
                                    286 	.area HOME    (CODE)
                                    287 	.area GSINIT0 (CODE)
                                    288 	.area GSINIT1 (CODE)
                                    289 	.area GSINIT2 (CODE)
                                    290 	.area GSINIT3 (CODE)
                                    291 	.area GSINIT4 (CODE)
                                    292 	.area GSINIT5 (CODE)
                                    293 	.area GSINIT  (CODE)
                                    294 	.area GSFINAL (CODE)
                                    295 	.area CSEG    (CODE)
                                    296 ;--------------------------------------------------------
                                    297 ; interrupt vector
                                    298 ;--------------------------------------------------------
                                    299 	.area HOME    (CODE)
      000000                        300 __interrupt_vect:
      000000 02 01 67         [24]  301 	ljmp	__sdcc_gsinit_startup
      000003 32               [24]  302 	reti
      000004                        303 	.ds	7
      00000B 02 01 6E         [24]  304 	ljmp	_timer0_ISR
                                    305 ; restartable atomic support routines
      00000E                        306 	.ds	2
      000010                        307 sdcc_atomic_exchange_rollback_start::
      000010 00               [12]  308 	nop
      000011 00               [12]  309 	nop
      000012                        310 sdcc_atomic_exchange_pdata_impl:
      000012 E2               [24]  311 	movx	a, @r0
      000013 FB               [12]  312 	mov	r3, a
      000014 EA               [12]  313 	mov	a, r2
      000015 F2               [24]  314 	movx	@r0, a
      000016 80 2C            [24]  315 	sjmp	sdcc_atomic_exchange_exit
      000018 00               [12]  316 	nop
      000019 00               [12]  317 	nop
      00001A                        318 sdcc_atomic_exchange_xdata_impl:
      00001A E0               [24]  319 	movx	a, @dptr
      00001B FB               [12]  320 	mov	r3, a
      00001C EA               [12]  321 	mov	a, r2
      00001D F0               [24]  322 	movx	@dptr, a
      00001E 80 24            [24]  323 	sjmp	sdcc_atomic_exchange_exit
      000020                        324 sdcc_atomic_compare_exchange_idata_impl:
      000020 E6               [12]  325 	mov	a, @r0
      000021 B5 02 02         [24]  326 	cjne	a, ar2, .+#5
      000024 EB               [12]  327 	mov	a, r3
      000025 F6               [12]  328 	mov	@r0, a
      000026 22               [24]  329 	ret
      000027 00               [12]  330 	nop
      000028                        331 sdcc_atomic_compare_exchange_pdata_impl:
      000028 E2               [24]  332 	movx	a, @r0
      000029 B5 02 02         [24]  333 	cjne	a, ar2, .+#5
      00002C EB               [12]  334 	mov	a, r3
      00002D F2               [24]  335 	movx	@r0, a
      00002E 22               [24]  336 	ret
      00002F 00               [12]  337 	nop
      000030                        338 sdcc_atomic_compare_exchange_xdata_impl:
      000030 E0               [24]  339 	movx	a, @dptr
      000031 B5 02 02         [24]  340 	cjne	a, ar2, .+#5
      000034 EB               [12]  341 	mov	a, r3
      000035 F0               [24]  342 	movx	@dptr, a
      000036 22               [24]  343 	ret
      000037                        344 sdcc_atomic_exchange_rollback_end::
                                    345 
      000037                        346 sdcc_atomic_exchange_gptr_impl::
      000037 30 F6 E0         [24]  347 	jnb	b.6, sdcc_atomic_exchange_xdata_impl
      00003A A8 82            [24]  348 	mov	r0, dpl
      00003C 20 F5 D3         [24]  349 	jb	b.5, sdcc_atomic_exchange_pdata_impl
      00003F                        350 sdcc_atomic_exchange_idata_impl:
      00003F EA               [12]  351 	mov	a, r2
      000040 C6               [12]  352 	xch	a, @r0
      000041 F5 82            [12]  353 	mov	dpl, a
      000043 22               [24]  354 	ret
      000044                        355 sdcc_atomic_exchange_exit:
      000044 8B 82            [24]  356 	mov	dpl, r3
      000046 22               [24]  357 	ret
      000047                        358 sdcc_atomic_compare_exchange_gptr_impl::
      000047 30 F6 E6         [24]  359 	jnb	b.6, sdcc_atomic_compare_exchange_xdata_impl
      00004A A8 82            [24]  360 	mov	r0, dpl
      00004C 20 F5 D9         [24]  361 	jb	b.5, sdcc_atomic_compare_exchange_pdata_impl
      00004F 80 CF            [24]  362 	sjmp	sdcc_atomic_compare_exchange_idata_impl
                                    363 ;--------------------------------------------------------
                                    364 ; global & static initialisations
                                    365 ;--------------------------------------------------------
                                    366 	.area HOME    (CODE)
                                    367 	.area GSINIT  (CODE)
                                    368 	.area GSFINAL (CODE)
                                    369 	.area GSINIT  (CODE)
                                    370 	.globl __sdcc_gsinit_startup
                                    371 	.globl __sdcc_program_startup
                                    372 	.globl __start__stack
                                    373 	.globl __mcs51_genXINIT
                                    374 	.globl __mcs51_genXRAMCLEAR
                                    375 	.globl __mcs51_genRAMCLEAR
                                    376 	.area GSFINAL (CODE)
      00007E 02 00 51         [24]  377 	ljmp	__sdcc_program_startup
                                    378 ;--------------------------------------------------------
                                    379 ; Home
                                    380 ;--------------------------------------------------------
                                    381 	.area HOME    (CODE)
                                    382 	.area HOME    (CODE)
      000051                        383 __sdcc_program_startup:
      000051 02 01 46         [24]  384 	ljmp	_main
                                    385 ;	return from main will return to caller
                                    386 ;--------------------------------------------------------
                                    387 ; code
                                    388 ;--------------------------------------------------------
                                    389 	.area CSEG    (CODE)
                                    390 ;------------------------------------------------------------
                                    391 ;Allocation info for local variables in function 'Producer'
                                    392 ;------------------------------------------------------------
                                    393 ;	testpreempt.c:13: void Producer(void)
                                    394 ;	-----------------------------------------
                                    395 ;	 function Producer
                                    396 ;	-----------------------------------------
      000081                        397 _Producer:
                           000007   398 	ar7 = 0x07
                           000006   399 	ar6 = 0x06
                           000005   400 	ar5 = 0x05
                           000004   401 	ar4 = 0x04
                           000003   402 	ar3 = 0x03
                           000002   403 	ar2 = 0x02
                           000001   404 	ar1 = 0x01
                           000000   405 	ar0 = 0x00
                                    406 ;	testpreempt.c:15: nextChar = 'A';
      000081 75 38 41         [24]  407 	mov	_nextChar,#0x41
                                    408 ;	testpreempt.c:19: SemaphoreWait(empty);
      000084                        409 00104$:
                                    410 ;	assignBit
      000084 C2 AF            [12]  411 	clr	_EA
      000086 E5 32            [12]  412 	mov	a,_empty
      000088 60 09            [24]  413 	jz	00102$
      00008A E5 32            [12]  414 	mov	a,_empty
      00008C 14               [12]  415 	dec	a
      00008D F5 32            [12]  416 	mov	_empty,a
                                    417 ;	assignBit
      00008F D2 AF            [12]  418 	setb	_EA
      000091 80 04            [24]  419 	sjmp	00112$
      000093                        420 00102$:
                                    421 ;	assignBit
      000093 D2 AF            [12]  422 	setb	_EA
                                    423 ;	testpreempt.c:20: SemaphoreWait(mutex);
      000095 80 ED            [24]  424 	sjmp	00104$
      000097                        425 00112$:
                                    426 ;	assignBit
      000097 C2 AF            [12]  427 	clr	_EA
      000099 E5 30            [12]  428 	mov	a,_mutex
      00009B 60 09            [24]  429 	jz	00110$
      00009D E5 30            [12]  430 	mov	a,_mutex
      00009F 14               [12]  431 	dec	a
      0000A0 F5 30            [12]  432 	mov	_mutex,a
                                    433 ;	assignBit
      0000A2 D2 AF            [12]  434 	setb	_EA
      0000A4 80 04            [24]  435 	sjmp	00115$
      0000A6                        436 00110$:
                                    437 ;	assignBit
      0000A6 D2 AF            [12]  438 	setb	_EA
      0000A8 80 ED            [24]  439 	sjmp	00112$
      0000AA                        440 00115$:
                                    441 ;	testpreempt.c:22: buffer[head] = nextChar;
      0000AA E5 36            [12]  442 	mov	a,_head
      0000AC 24 33            [12]  443 	add	a, #_buffer
      0000AE F8               [12]  444 	mov	r0,a
      0000AF A6 38            [24]  445 	mov	@r0,_nextChar
                                    446 ;	testpreempt.c:23: head++;
      0000B1 E5 36            [12]  447 	mov	a,_head
      0000B3 04               [12]  448 	inc	a
      0000B4 F5 36            [12]  449 	mov	_head,a
                                    450 ;	testpreempt.c:24: if (head == 3)
      0000B6 74 03            [12]  451 	mov	a,#0x03
      0000B8 B5 36 03         [24]  452 	cjne	a,_head,00119$
                                    453 ;	testpreempt.c:26: head = 0;
      0000BB 75 36 00         [24]  454 	mov	_head,#0x00
                                    455 ;	testpreempt.c:29: SemaphoreSignal(mutex);
      0000BE                        456 00119$:
                                    457 ;	assignBit
      0000BE C2 AF            [12]  458 	clr	_EA
      0000C0 E5 30            [12]  459 	mov	a,_mutex
      0000C2 04               [12]  460 	inc	a
      0000C3 F5 30            [12]  461 	mov	_mutex,a
                                    462 ;	assignBit
      0000C5 D2 AF            [12]  463 	setb	_EA
                                    464 ;	testpreempt.c:30: SemaphoreSignal(full);
                                    465 ;	assignBit
      0000C7 C2 AF            [12]  466 	clr	_EA
      0000C9 E5 31            [12]  467 	mov	a,_full
      0000CB 04               [12]  468 	inc	a
      0000CC F5 31            [12]  469 	mov	_full,a
                                    470 ;	assignBit
      0000CE D2 AF            [12]  471 	setb	_EA
                                    472 ;	testpreempt.c:32: nextChar++;
      0000D0 E5 38            [12]  473 	mov	a,_nextChar
      0000D2 04               [12]  474 	inc	a
      0000D3 F5 38            [12]  475 	mov	_nextChar,a
                                    476 ;	testpreempt.c:33: if (nextChar > 'Z')
      0000D5 E5 38            [12]  477 	mov	a,_nextChar
      0000D7 24 A5            [12]  478 	add	a,#0xff - 0x5a
      0000D9 50 A9            [24]  479 	jnc	00104$
                                    480 ;	testpreempt.c:35: nextChar = 'A';
      0000DB 75 38 41         [24]  481 	mov	_nextChar,#0x41
                                    482 ;	testpreempt.c:38: }
      0000DE 80 A4            [24]  483 	sjmp	00104$
                                    484 ;------------------------------------------------------------
                                    485 ;Allocation info for local variables in function 'Consumer'
                                    486 ;------------------------------------------------------------
                                    487 ;	testpreempt.c:40: void Consumer(void)
                                    488 ;	-----------------------------------------
                                    489 ;	 function Consumer
                                    490 ;	-----------------------------------------
      0000E0                        491 _Consumer:
                                    492 ;	testpreempt.c:42: TMOD |= 0x20;
      0000E0 43 89 20         [24]  493 	orl	_TMOD,#0x20
                                    494 ;	testpreempt.c:43: TH1 = 0xFA;
      0000E3 75 8D FA         [24]  495 	mov	_TH1,#0xfa
                                    496 ;	testpreempt.c:44: TL1 = 0xFA;
      0000E6 75 8B FA         [24]  497 	mov	_TL1,#0xfa
                                    498 ;	testpreempt.c:45: SCON = 0x50;
      0000E9 75 98 50         [24]  499 	mov	_SCON,#0x50
                                    500 ;	testpreempt.c:46: TR1 = 1;
                                    501 ;	assignBit
      0000EC D2 8E            [12]  502 	setb	_TR1
                                    503 ;	testpreempt.c:47: TI = 1;
                                    504 ;	assignBit
      0000EE D2 99            [12]  505 	setb	_TI
                                    506 ;	testpreempt.c:51: SemaphoreWait(full);
      0000F0                        507 00104$:
                                    508 ;	assignBit
      0000F0 C2 AF            [12]  509 	clr	_EA
      0000F2 E5 31            [12]  510 	mov	a,_full
      0000F4 60 09            [24]  511 	jz	00102$
      0000F6 E5 31            [12]  512 	mov	a,_full
      0000F8 14               [12]  513 	dec	a
      0000F9 F5 31            [12]  514 	mov	_full,a
                                    515 ;	assignBit
      0000FB D2 AF            [12]  516 	setb	_EA
      0000FD 80 04            [24]  517 	sjmp	00112$
      0000FF                        518 00102$:
                                    519 ;	assignBit
      0000FF D2 AF            [12]  520 	setb	_EA
                                    521 ;	testpreempt.c:52: SemaphoreWait(mutex);
      000101 80 ED            [24]  522 	sjmp	00104$
      000103                        523 00112$:
                                    524 ;	assignBit
      000103 C2 AF            [12]  525 	clr	_EA
      000105 E5 30            [12]  526 	mov	a,_mutex
      000107 60 09            [24]  527 	jz	00110$
      000109 E5 30            [12]  528 	mov	a,_mutex
      00010B 14               [12]  529 	dec	a
      00010C F5 30            [12]  530 	mov	_mutex,a
                                    531 ;	assignBit
      00010E D2 AF            [12]  532 	setb	_EA
      000110 80 04            [24]  533 	sjmp	00115$
      000112                        534 00110$:
                                    535 ;	assignBit
      000112 D2 AF            [12]  536 	setb	_EA
      000114 80 ED            [24]  537 	sjmp	00112$
      000116                        538 00115$:
                                    539 ;	testpreempt.c:54: consumedChar = buffer[tail];
      000116 E5 37            [12]  540 	mov	a,_tail
      000118 24 33            [12]  541 	add	a, #_buffer
      00011A F9               [12]  542 	mov	r1,a
      00011B 87 39            [24]  543 	mov	_consumedChar,@r1
                                    544 ;	testpreempt.c:55: tail++;
      00011D E5 37            [12]  545 	mov	a,_tail
      00011F 04               [12]  546 	inc	a
      000120 F5 37            [12]  547 	mov	_tail,a
                                    548 ;	testpreempt.c:56: if (tail == 3)
      000122 74 03            [12]  549 	mov	a,#0x03
      000124 B5 37 03         [24]  550 	cjne	a,_tail,00119$
                                    551 ;	testpreempt.c:58: tail = 0;
      000127 75 37 00         [24]  552 	mov	_tail,#0x00
                                    553 ;	testpreempt.c:61: SemaphoreSignal(mutex);
      00012A                        554 00119$:
                                    555 ;	assignBit
      00012A C2 AF            [12]  556 	clr	_EA
      00012C E5 30            [12]  557 	mov	a,_mutex
      00012E 04               [12]  558 	inc	a
      00012F F5 30            [12]  559 	mov	_mutex,a
                                    560 ;	assignBit
      000131 D2 AF            [12]  561 	setb	_EA
                                    562 ;	testpreempt.c:62: SemaphoreSignal(empty);
                                    563 ;	assignBit
      000133 C2 AF            [12]  564 	clr	_EA
      000135 E5 32            [12]  565 	mov	a,_empty
      000137 04               [12]  566 	inc	a
      000138 F5 32            [12]  567 	mov	_empty,a
                                    568 ;	assignBit
      00013A D2 AF            [12]  569 	setb	_EA
                                    570 ;	testpreempt.c:64: TI = 0;
                                    571 ;	assignBit
      00013C C2 99            [12]  572 	clr	_TI
                                    573 ;	testpreempt.c:65: SBUF = consumedChar;
      00013E 85 39 99         [24]  574 	mov	_SBUF,_consumedChar
                                    575 ;	testpreempt.c:66: while (TI == 0)
      000141                        576 00125$:
                                    577 ;	testpreempt.c:69: TI = 0;
                                    578 ;	assignBit
      000141 10 99 AC         [24]  579 	jbc	_TI,00104$
                                    580 ;	testpreempt.c:71: }
      000144 80 FB            [24]  581 	sjmp	00125$
                                    582 ;------------------------------------------------------------
                                    583 ;Allocation info for local variables in function 'main'
                                    584 ;------------------------------------------------------------
                                    585 ;	testpreempt.c:73: void main(void)
                                    586 ;	-----------------------------------------
                                    587 ;	 function main
                                    588 ;	-----------------------------------------
      000146                        589 _main:
                                    590 ;	testpreempt.c:75: buffer[0] = ' ';
      000146 75 33 20         [24]  591 	mov	_buffer,#0x20
                                    592 ;	testpreempt.c:76: buffer[1] = ' ';
      000149 75 34 20         [24]  593 	mov	(_buffer + 0x0001),#0x20
                                    594 ;	testpreempt.c:77: buffer[2] = ' ';
      00014C 75 35 20         [24]  595 	mov	(_buffer + 0x0002),#0x20
                                    596 ;	testpreempt.c:78: head = 0;
      00014F 75 36 00         [24]  597 	mov	_head,#0x00
                                    598 ;	testpreempt.c:79: tail = 0;
      000152 75 37 00         [24]  599 	mov	_tail,#0x00
                                    600 ;	testpreempt.c:81: SemaphoreCreate(mutex, 1);
      000155 75 30 01         [24]  601 	mov	_mutex,#0x01
                                    602 ;	testpreempt.c:82: SemaphoreCreate(full, 0);
      000158 75 31 00         [24]  603 	mov	_full,#0x00
                                    604 ;	testpreempt.c:83: SemaphoreCreate(empty, 3);
      00015B 75 32 03         [24]  605 	mov	_empty,#0x03
                                    606 ;	testpreempt.c:85: ThreadCreate(Producer);
      00015E 90 00 81         [24]  607 	mov	dptr,#_Producer
      000161 12 01 E6         [24]  608 	lcall	_ThreadCreate
                                    609 ;	testpreempt.c:86: Consumer();
                                    610 ;	testpreempt.c:87: }
      000164 02 00 E0         [24]  611 	ljmp	_Consumer
                                    612 ;------------------------------------------------------------
                                    613 ;Allocation info for local variables in function '_sdcc_gsinit_startup'
                                    614 ;------------------------------------------------------------
                                    615 ;	testpreempt.c:89: void _sdcc_gsinit_startup(void)
                                    616 ;	-----------------------------------------
                                    617 ;	 function _sdcc_gsinit_startup
                                    618 ;	-----------------------------------------
      000167                        619 __sdcc_gsinit_startup:
                                    620 ;	testpreempt.c:93: __endasm;
      000167 02 01 A4         [24]  621 	LJMP	_Bootstrap
                                    622 ;	testpreempt.c:94: }
      00016A 22               [24]  623 	ret
                                    624 ;------------------------------------------------------------
                                    625 ;Allocation info for local variables in function '_mcs51_genRAMCLEAR'
                                    626 ;------------------------------------------------------------
                                    627 ;	testpreempt.c:96: void _mcs51_genRAMCLEAR(void) {}
                                    628 ;	-----------------------------------------
                                    629 ;	 function _mcs51_genRAMCLEAR
                                    630 ;	-----------------------------------------
      00016B                        631 __mcs51_genRAMCLEAR:
      00016B 22               [24]  632 	ret
                                    633 ;------------------------------------------------------------
                                    634 ;Allocation info for local variables in function '_mcs51_genXINIT'
                                    635 ;------------------------------------------------------------
                                    636 ;	testpreempt.c:97: void _mcs51_genXINIT(void) {}
                                    637 ;	-----------------------------------------
                                    638 ;	 function _mcs51_genXINIT
                                    639 ;	-----------------------------------------
      00016C                        640 __mcs51_genXINIT:
      00016C 22               [24]  641 	ret
                                    642 ;------------------------------------------------------------
                                    643 ;Allocation info for local variables in function '_mcs51_genXRAMCLEAR'
                                    644 ;------------------------------------------------------------
                                    645 ;	testpreempt.c:98: void _mcs51_genXRAMCLEAR(void) {}
                                    646 ;	-----------------------------------------
                                    647 ;	 function _mcs51_genXRAMCLEAR
                                    648 ;	-----------------------------------------
      00016D                        649 __mcs51_genXRAMCLEAR:
      00016D 22               [24]  650 	ret
                                    651 ;------------------------------------------------------------
                                    652 ;Allocation info for local variables in function 'timer0_ISR'
                                    653 ;------------------------------------------------------------
                                    654 ;	testpreempt.c:100: void timer0_ISR(void) __interrupt(1)
                                    655 ;	-----------------------------------------
                                    656 ;	 function timer0_ISR
                                    657 ;	-----------------------------------------
      00016E                        658 _timer0_ISR:
                                    659 ;	testpreempt.c:104: __endasm;
      00016E 02 03 49         [24]  660 	ljmp	_myTimer0Handler
                                    661 ;	testpreempt.c:105: }
      000171 02 00 54         [24]  662 	ljmp	sdcc_atomic_maybe_rollback
                                    663 ;	eliminated unneeded mov psw,# (no regs used in bank)
                                    664 ;	eliminated unneeded push/pop not_psw
                                    665 ;	eliminated unneeded push/pop dpl
                                    666 ;	eliminated unneeded push/pop dph
                                    667 ;	eliminated unneeded push/pop b
                                    668 ;	eliminated unneeded push/pop acc
                                    669 	.area CSEG    (CODE)
                                    670 	.area CONST   (CODE)
                                    671 	.area XINIT   (CODE)
                                    672 	.area CABS    (ABS,CODE)
