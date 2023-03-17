/*
 ============================================================================
 Name        : memset-lsx.S
 Author      : hev <r@hev.cc>
 Copyright   : Copyright (c) 2023 hev
 Description : Memset LSX
 ============================================================================
 */

#include "regdef.h"
#include "lsx.h"

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
	vreplgr2vr.b	vr0, a1
	movfr2gr.d	a1, f0

	sltui	t0, a2, 49
	bnez	t0, .Lsmall

	add.d	a2, a0, a2
	vst	vr0, a0, 0

	/* align up address */
	addi.d	a3, a0, 16
	bstrins.d	a3, zero, 3, 0

	addi.d	a4, a2, -128
	bgeu	a3, a4, .Llt128

	/* set 128 bytes at a time */
.Lloop128:
	vst	vr0, a3, 0
	vst	vr0, a3, 16
	vst	vr0, a3, 32
	vst	vr0, a3, 48
	vst	vr0, a3, 64
	vst	vr0, a3, 80
	vst	vr0, a3, 96
	vst	vr0, a3, 112
	addi.d	a3, a3, 128
	bltu	a3, a4, .Lloop128

	/* set the remaining bytes */
.Llt128:
	addi.d	a4, a2, -64
	bgeu	a3, a4, .Llt64
	vst	vr0, a3, 0
	vst	vr0, a3, 16
	vst	vr0, a3, 32
	vst	vr0, a3, 48
	addi.d	a3, a3, 64

.Llt64:
	addi.d	a4, a2, -32
	bgeu	a3, a4, .Llt32
	vst	vr0, a3, 0
	vst	vr0, a3, 16
	addi.d	a3, a3, 32

.Llt32:
	addi.d	a4, a2, -16
	bgeu	a3, a4, .Llt16
	vst	vr0, a3, 0

.Llt16:
	vst	vr0, a2, -16

	/* return */
	jr	ra

	.align	4
.Lsmall:
	pcaddi	t0, 4
	alsl.d	t0, a2, t0, 4
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
32:	vst	vr0, a0, 0
	vst	vr0, a0, 16
	jr	ra

	.align	4
33:	vst	vr0, a0, 0
	vst	vr0, a0, 16
	st.b	a1, a0, 32
	jr	ra

	.align	4
34:	vst	vr0, a0, 0
	vst	vr0, a0, 16
	st.h	a1, a0, 32
	jr	ra

	.align	4
35:	vst	vr0, a0, 0
	vst	vr0, a0, 16
	st.w	a1, a0, 31
	jr	ra

	.align	4
36:	vst	vr0, a0, 0
	vst	vr0, a0, 16
	st.w	a1, a0, 32
	jr	ra

	.align	4
37:	vst	vr0, a0, 0
	vst	vr0, a0, 16
	st.d	a1, a0, 29
	jr	ra

	.align	4
38:	vst	vr0, a0, 0
	vst	vr0, a0, 16
	st.d	a1, a0, 30
	jr	ra

	.align	4
39:	vst	vr0, a0, 0
	vst	vr0, a0, 16
	st.d	a1, a0, 31
	jr	ra

	.align	4
40:	vst	vr0, a0, 0
	vst	vr0, a0, 16
	st.d	a1, a0, 32
	jr	ra

	.align	4
41:	vst	vr0, a0, 0
	vst	vr0, a0, 16
	vst	vr0, a0, 25
	jr	ra

	.align	4
42:	vst	vr0, a0, 0
	vst	vr0, a0, 16
	vst	vr0, a0, 26
	jr	ra

	.align	4
43:	vst	vr0, a0, 0
	vst	vr0, a0, 16
	vst	vr0, a0, 27
	jr	ra

	.align	4
44:	vst	vr0, a0, 0
	vst	vr0, a0, 16
	vst	vr0, a0, 28
	jr	ra

	.align	4
45:	vst	vr0, a0, 0
	vst	vr0, a0, 16
	vst	vr0, a0, 29
	jr	ra

	.align	4
46:	vst	vr0, a0, 0
	vst	vr0, a0, 16
	vst	vr0, a0, 30
	jr	ra

	.align	4
47:	vst	vr0, a0, 0
	vst	vr0, a0, 16
	vst	vr0, a0, 31
	jr	ra

	.align	4
48:	vst	vr0, a0, 0
	vst	vr0, a0, 16
	vst	vr0, a0, 32
	jr	ra
