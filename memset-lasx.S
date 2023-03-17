/*
 ============================================================================
 Name        : memset-lasx.S
 Author      : hev <r@hev.cc>
 Copyright   : Copyright (c) 2023 hev
 Description : Memset LASX
 ============================================================================
 */

#include "regdef.h"
#include "lasx.h"

	.text

/*
 * void *memset(void *s, int c, size_t n)
 *
 * a0: s
 * a1: c
 * a2: n
 */
	.global memset
memset:
	/* fill a1 to 128 bits */
	xvreplgr2vr.b	xr0, a1
	movfr2gr.d	a1, f0

	sltui	t0, a2, 33
	bnez	t0, .Lsmall

	add.d	a2, a0, a2
	xvst	xr0, a0, 0

	/* align up address */
	andi	t1, a0, 31
	sub.d	a3, a0, t1
	addi.d	a3, a3, 32

	addi.d	a4, a2, -256
	bgeu	a3, a4, .Llt256

	/* set 256 bytes at a time */
.Lloop256:
	xvst	xr0, a3, 0
	xvst	xr0, a3, 32
	xvst	xr0, a3, 64
	xvst	xr0, a3, 96
	xvst	xr0, a3, 128
	xvst	xr0, a3, 160
	xvst	xr0, a3, 192
	xvst	xr0, a3, 224
	addi.d	a3, a3, 256
	bltu	a3, a4, .Lloop256

	/* set the remaining bytes */
.Llt256:
	addi.d	a4, a2, -128
	bgeu	a3, a4, .Llt128
	xvst	xr0, a3, 0
	xvst	xr0, a3, 32
	xvst	xr0, a3, 64
	xvst	xr0, a3, 96
	addi.d	a3, a3, 128

.Llt128:
	addi.d	a4, a2, -64
	bgeu	a3, a4, .Llt64
	xvst	xr0, a3, 0
	xvst	xr0, a3, 32
	addi.d	a3, a3, 64

.Llt64:
	addi.d	a4, a2, -32
	bgeu	a3, a4, .Llt32
	xvst	xr0, a3, 0

.Llt32:
	xvst	xr0, a2, -32

	/* return */
	jr	ra

	.align	4
.Lsmall:
	pcaddi	t0, 4
	slli.d	a2, a2, 4
	add.d	t0, t0, a2
	jr	t0

	.align	4
0:	jr	ra

	.align	4
1:	st.b	a1, a0, 0
	jr	ra

	.align	4
2:	st.h	a1, a0, 0
	jr	ra

	.align	4
3:	st.h	a1, a0, 0
	st.b	a1, a0, 2
	jr	ra

	.align	4
4:	st.w	a1, a0, 0
	jr	ra

	.align	4
5:	st.w	a1, a0, 0
	st.b	a1, a0, 4
	jr	ra

	.align	4
6:	st.w	a1, a0, 0
	st.h	a1, a0, 4
	jr	ra

	.align	4
7:	st.w	a1, a0, 0
	st.w	a1, a0, 3
	jr	ra

	.align	4
8:	st.d	a1, a0, 0
	jr	ra

	.align	4
9:	st.d	a1, a0, 0
	st.b	a1, a0, 8
	jr	ra

	.align	4
10:	st.d	a1, a0, 0
	st.h	a1, a0, 8
	jr	ra

	.align	4
11:	st.d	a1, a0, 0
	st.w	a1, a0, 7
	jr	ra

	.align	4
12:	st.d	a1, a0, 0
	st.w	a1, a0, 8
	jr	ra

	.align	4
13:	st.d	a1, a0, 0
	st.d	a1, a0, 5
	jr	ra

	.align	4
14:	st.d	a1, a0, 0
	st.d	a1, a0, 6
	jr	ra

	.align	4
15:	st.d	a1, a0, 0
	st.d	a1, a0, 7
	jr	ra

	.align	4
16:	vst	vr0, a0, 0
	jr	ra

	.align	4
17:	vst	vr0, a0, 0
	st.b	a1, a0, 16
	jr	ra

	.align	4
18:	vst	vr0, a0, 0
	st.h	a1, a0, 16
	jr	ra

	.align	4
19:	vst	vr0, a0, 0
	st.w	a1, a0, 15
	jr	ra

	.align	4
20:	vst	vr0, a0, 0
	st.w	a1, a0, 16
	jr	ra

	.align	4
21:	vst	vr0, a0, 0
	st.d	a1, a0, 13
	jr	ra

	.align	4
22:	vst	vr0, a0, 0
	st.d	a1, a0, 14
	jr	ra

	.align	4
23:	vst	vr0, a0, 0
	st.d	a1, a0, 15
	jr	ra

	.align	4
24:	vst	vr0, a0, 0
	st.d	a1, a0, 16
	jr	ra

	.align	4
25:	vst	vr0, a0, 0
	vst	vr0, a0, 9
	jr	ra

	.align	4
26:	vst	vr0, a0, 0
	vst	vr0, a0, 10
	jr	ra

	.align	4
27:	vst	vr0, a0, 0
	vst	vr0, a0, 11
	jr	ra

	.align	4
28:	vst	vr0, a0, 0
	vst	vr0, a0, 12
	jr	ra

	.align	4
29:	vst	vr0, a0, 0
	vst	vr0, a0, 13
	jr	ra

	.align	4
30:	vst	vr0, a0, 0
	vst	vr0, a0, 14
	jr	ra

	.align	4
31:	vst	vr0, a0, 0
	vst	vr0, a0, 15
	jr	ra

	.align	4
32:	xvst	xr0, a0, 0
	jr	ra
