/*
 ============================================================================
 Name        : memcpy-lsx.S
 Author      : hev <r@hev.cc>
 Copyright   : Copyright (c) 2023 hev
 Description : Memcpy LSX
 ============================================================================
 */

#include "regdef.h"
#include "lsx.h"

	.text

	.align	5
	.global __memcpy_small
__memcpy_small:
	pcaddi	t0, 8
	slli.d	a2, a2, 5
	add.d	t0, t0, a2
	jr	t0

	.align	5
0:	jr	ra

	.align	5
1:	ld.b	t0, a1, 0
	st.b	t0, a0, 0
	jr	ra

	.align	5
2:	ld.h	t0, a1, 0
	st.h	t0, a0, 0
	jr	ra

	.align	5
3:	ld.h	t0, a1, 0
	ld.b	t1, a1, 2
	st.h	t0, a0, 0
	st.b	t1, a0, 2
	jr	ra

	.align	5
4:	ld.w	t0, a1, 0
	st.w	t0, a0, 0
	jr	ra

	.align	5
5:	ld.w	t0, a1, 0
	ld.b	t1, a1, 4
	st.w	t0, a0, 0
	st.b	t1, a0, 4
	jr	ra

	.align	5
6:	ld.w	t0, a1, 0
	ld.h	t1, a1, 4
	st.w	t0, a0, 0
	st.h	t1, a0, 4
	jr	ra

	.align	5
7:	ld.w	t0, a1, 0
	ld.w	t1, a1, 3
	st.w	t0, a0, 0
	st.w	t1, a0, 3
	jr	ra

	.align	5
8:	ld.d	t0, a1, 0
	st.d	t0, a0, 0
	jr	ra

	.align	5
9:	ld.d	t0, a1, 0
	ld.b	t1, a1, 8
	st.d	t0, a0, 0
	st.b	t1, a0, 8
	jr	ra

	.align	5
10:	ld.d	t0, a1, 0
	ld.h	t1, a1, 8
	st.d	t0, a0, 0
	st.h	t1, a0, 8
	jr	ra

	.align	5
11:	ld.d	t0, a1, 0
	ld.w	t1, a1, 7
	st.d	t0, a0, 0
	st.w	t1, a0, 7
	jr	ra

	.align	5
12:	ld.d	t0, a1, 0
	ld.w	t1, a1, 8
	st.d	t0, a0, 0
	st.w	t1, a0, 8
	jr	ra

	.align	5
13:	ld.d	t0, a1, 0
	ld.d	t1, a1, 5
	st.d	t0, a0, 0
	st.d	t1, a0, 5
	jr	ra

	.align	5
14:	ld.d	t0, a1, 0
	ld.d	t1, a1, 6
	st.d	t0, a0, 0
	st.d	t1, a0, 6
	jr	ra

	.align	5
15:	ld.d	t0, a1, 0
	ld.d	t1, a1, 7
	st.d	t0, a0, 0
	st.d	t1, a0, 7
	jr	ra

	.align	5
16:	vld	vr0, a1, 0
	vst	vr0, a0, 0
	jr	ra

	.align	5
17:	vld	vr0, a1, 0
	ld.b	t0, a1, 16
	vst	vr0, a0, 0
	st.b	t0, a0, 16
	jr	ra

	.align	5
18:	vld	vr0, a1, 0
	ld.h	t0, a1, 16
	vst	vr0, a0, 0
	st.h	t0, a0, 16
	jr	ra

	.align	5
19:	vld	vr0, a1, 0
	ld.w	t0, a1, 15
	vst	vr0, a0, 0
	st.w	t0, a0, 15
	jr	ra

	.align	5
20:	vld	vr0, a1, 0
	ld.w	t0, a1, 16
	vst	vr0, a0, 0
	st.w	t0, a0, 16
	jr	ra

	.align	5
21:	vld	vr0, a1, 0
	ld.d	t0, a1, 13
	vst	vr0, a0, 0
	st.d	t0, a0, 13
	jr	ra

	.align	5
22:	vld	vr0, a1, 0
	ld.d	t0, a1, 14
	vst	vr0, a0, 0
	st.d	t0, a0, 14
	jr	ra

	.align	5
23:	vld	vr0, a1, 0
	ld.d	t0, a1, 15
	vst	vr0, a0, 0
	st.d	t0, a0, 15
	jr	ra

	.align	5
24:	vld	vr0, a1, 0
	ld.d	t0, a1, 16
	vst	vr0, a0, 0
	st.d	t0, a0, 16
	jr	ra

	.align	5
25:	vld	vr0, a1, 0
	vld	vr1, a1, 9
	vst	vr0, a0, 0
	vst	vr1, a0, 9
	jr	ra

	.align	5
26:	vld	vr0, a1, 0
	vld	vr1, a1, 10
	vst	vr0, a0, 0
	vst	vr1, a0, 10
	jr	ra

	.align	5
27:	vld	vr0, a1, 0
	vld	vr1, a1, 11
	vst	vr0, a0, 0
	vst	vr1, a0, 11
	jr	ra

	.align	5
28:	vld	vr0, a1, 0
	vld	vr1, a1, 12
	vst	vr0, a0, 0
	vst	vr1, a0, 12
	jr	ra

	.align	5
29:	vld	vr0, a1, 0
	vld	vr1, a1, 13
	vst	vr0, a0, 0
	vst	vr1, a0, 13
	jr	ra

	.align	5
30:	vld	vr0, a1, 0
	vld	vr1, a1, 14
	vst	vr0, a0, 0
	vst	vr1, a0, 14
	jr	ra

	.align	5
31:	vld	vr0, a1, 0
	vld	vr1, a1, 15
	vst	vr0, a0, 0
	vst	vr1, a0, 15
	jr	ra

	.align	5
32:	vld	vr0, a1, 0
	vld	vr1, a1, 16
	vst	vr0, a0, 0
	vst	vr1, a0, 16
	jr	ra

	.align	5
33:	vld	vr0, a1, 0
	vld	vr1, a1, 16
	ld.b	t0, a1, 32
	vst	vr0, a0, 0
	vst	vr1, a0, 16
	st.b	t0, a0, 32
	jr	ra

	.align	5
34:	vld	vr0, a1, 0
	vld	vr1, a1, 16
	ld.h	t0, a1, 32
	vst	vr0, a0, 0
	vst	vr1, a0, 16
	st.h	t0, a0, 32
	jr	ra

	.align	5
35:	vld	vr0, a1, 0
	vld	vr1, a1, 16
	ld.w	t0, a1, 31
	vst	vr0, a0, 0
	vst	vr1, a0, 16
	st.w	t0, a0, 31
	jr	ra

	.align	5
36:	vld	vr0, a1, 0
	vld	vr1, a1, 16
	ld.w	t0, a1, 32
	vst	vr0, a0, 0
	vst	vr1, a0, 16
	st.w	t0, a0, 32
	jr	ra

	.align	5
37:	vld	vr0, a1, 0
	vld	vr1, a1, 16
	ld.d	t0, a1, 29
	vst	vr0, a0, 0
	vst	vr1, a0, 16
	st.d	t0, a0, 29
	jr	ra

	.align	5
38:	vld	vr0, a1, 0
	vld	vr1, a1, 16
	ld.d	t0, a1, 30
	vst	vr0, a0, 0
	vst	vr1, a0, 16
	st.d	t0, a0, 30
	jr	ra

	.align	5
39:	vld	vr0, a1, 0
	vld	vr1, a1, 16
	ld.d	t0, a1, 31
	vst	vr0, a0, 0
	vst	vr1, a0, 16
	st.d	t0, a0, 31
	jr	ra

	.align	5
40:	vld	vr0, a1, 0
	vld	vr1, a1, 16
	ld.d	t0, a1, 32
	vst	vr0, a0, 0
	vst	vr1, a0, 16
	st.d	t0, a0, 32
	jr	ra

	.align	5
41:	vld	vr0, a1, 0
	vld	vr1, a1, 16
	vld	vr2, a1, 25
	vst	vr0, a0, 0
	vst	vr1, a0, 16
	vst	vr2, a0, 25
	jr	ra

	.align	5
42:	vld	vr0, a1, 0
	vld	vr1, a1, 16
	vld	vr2, a1, 26
	vst	vr0, a0, 0
	vst	vr1, a0, 16
	vst	vr2, a0, 26
	jr	ra

	.align	5
43:	vld	vr0, a1, 0
	vld	vr1, a1, 16
	vld	vr2, a1, 27
	vst	vr0, a0, 0
	vst	vr1, a0, 16
	vst	vr2, a0, 27
	jr	ra

	.align	5
44:	vld	vr0, a1, 0
	vld	vr1, a1, 16
	vld	vr2, a1, 28
	vst	vr0, a0, 0
	vst	vr1, a0, 16
	vst	vr2, a0, 28
	jr	ra

	.align	5
45:	vld	vr0, a1, 0
	vld	vr1, a1, 16
	vld	vr2, a1, 29
	vst	vr0, a0, 0
	vst	vr1, a0, 16
	vst	vr2, a0, 29
	jr	ra

	.align	5
46:	vld	vr0, a1, 0
	vld	vr1, a1, 16
	vld	vr2, a1, 30
	vst	vr0, a0, 0
	vst	vr1, a0, 16
	vst	vr2, a0, 30
	jr	ra

	.align	5
47:	vld	vr0, a1, 0
	vld	vr1, a1, 16
	vld	vr2, a1, 31
	vst	vr0, a0, 0
	vst	vr1, a0, 16
	vst	vr2, a0, 31
	jr	ra

	.align	5
48:	vld	vr0, a1, 0
	vld	vr1, a1, 16
	vld	vr2, a1, 32
	vst	vr0, a0, 0
	vst	vr1, a0, 16
	vst	vr2, a0, 32
	jr	ra

/*
 * void *memcpy(void *dst, const void *src, size_t n)
 *
 * a0: dst
 * a1: src
 * a2: n
 */
	.global memcpy
memcpy:
	sltui	t0, a2, 49
	bnez	t0, __memcpy_small

	add.d	a3, a1, a2
	add.d	a2, a0, a2
	vld	vr8, a1, 0
	vld	vr9, a3, -16

	/* align up destination address */
	andi	t1, a0, 15
	sub.d	t0, zero, t1
	addi.d	t0, t0, 16
	add.d	a1, a1, t0
	add.d	a5, a0, t0

	addi.d	a4, a3, -128
	bgeu	a1, a4, .Llt128

	/* copy 128 bytes at a time */
.Lloop128:
	vld	vr0, a1, 0
	vld	vr1, a1, 16
	vld	vr2, a1, 32
	vld	vr3, a1, 48
	vld	vr4, a1, 64
	vld	vr5, a1, 80
	vld	vr6, a1, 96
	vld	vr7, a1, 112
	addi.d	a1, a1, 128
	vst	vr0, a5, 0
	vst	vr1, a5, 16
	vst	vr2, a5, 32
	vst	vr3, a5, 48
	vst	vr4, a5, 64
	vst	vr5, a5, 80
	vst	vr6, a5, 96
	vst	vr7, a5, 112
	addi.d	a5, a5, 128
	bltu	a1, a4, .Lloop128

	/* copy the remaining bytes */
.Llt128:
	addi.d	a4, a3, -64
	bgeu	a1, a4, .Llt64
	vld	vr0, a1, 0
	vld	vr1, a1, 16
	vld	vr2, a1, 32
	vld	vr3, a1, 48
	addi.d	a1, a1, 64
	vst	vr0, a5, 0
	vst	vr1, a5, 16
	vst	vr2, a5, 32
	vst	vr3, a5, 48
	addi.d	a5, a5, 64

.Llt64:
	addi.d	a4, a3, -32
	bgeu	a1, a4, .Llt32
	vld	vr0, a1, 0
	vld	vr1, a1, 16
	addi.d	a1, a1, 32
	vst	vr0, a5, 0
	vst	vr1, a5, 16
	addi.d	a5, a5, 32

.Llt32:
	addi.d	a4, a3, -16
	bgeu	a1, a4, .Llt16
	vld	vr0, a1, 0
	vst	vr0, a5, 0

.Llt16:
	vst	vr8, a0, 0
	vst	vr9, a2, -16

	/* return */
	jr	ra
