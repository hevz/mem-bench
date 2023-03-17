/*
 ============================================================================
 Name        : memset-int.S
 Author      : hev <r@hev.cc>
 Copyright   : Copyright (c) 2023 hev
 Description : Memset INT
 ============================================================================
 */

#include "regdef.h"

	.text

/*
 * void *memset(void *s, int c, size_t n)
 *
 * a0: s
 * a1: c
 * a2: n
 */
	.align	6
	.global memset
memset:
	/* fill a1 to 64 bits */
	bstrins.d	a1, a1, 15, 8
	bstrins.d	a1, a1, 31, 16
	bstrins.d	a1, a1, 63, 32

	sltui	t0, a2, 25
	bnez	t0, .Lsmall

	add.d	a2, a0, a2
	st.d	a1, a0, 0

	/* align up address */
	addi.d	a3, a0, 8
	bstrins.d	a3, zero, 2, 0

	addi.d	a4, a2, -64
	bgeu	a3, a4, .Llt64

	/* set 64 bytes at a time */
.Lloop64:
	st.d	a1, a3, 0
	st.d	a1, a3, 8
	st.d	a1, a3, 16
	st.d	a1, a3, 24
	st.d	a1, a3, 32
	st.d	a1, a3, 40
	st.d	a1, a3, 48
	st.d	a1, a3, 56
	addi.d	a3, a3, 64
	bltu	a3, a4, .Lloop64

	/* set the remaining bytes */
.Llt64:
	addi.d	a4, a2, -32
	bgeu	a3, a4, .Llt32
	st.d	a1, a3, 0
	st.d	a1, a3, 8
	st.d	a1, a3, 16
	st.d	a1, a3, 24
	addi.d	a3, a3, 32

.Llt32:
	addi.d	a4, a2, -16
	bgeu	a3, a4, .Llt16
	st.d	a1, a3, 0
	st.d	a1, a3, 8
	addi.d	a3, a3, 16

.Llt16:
	addi.d	a4, a2, -8
	bgeu	a3, a4, .Llt8
	st.d	a1, a3, 0

.Llt8:
	st.d	a1, a2, -8

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
16:	st.d	a1, a0, 0
	st.d	a1, a0, 8
	jr	ra

	.align	4
17:	st.d	a1, a0, 0
	st.d	a1, a0, 8
	st.b	a1, a0, 16
	jr	ra

	.align	4
18:	st.d	a1, a0, 0
	st.d	a1, a0, 8
	st.h	a1, a0, 16
	jr	ra

	.align	4
19:	st.d	a1, a0, 0
	st.d	a1, a0, 8
	st.w	a1, a0, 15
	jr	ra

	.align	4
20:	st.d	a1, a0, 0
	st.d	a1, a0, 8
	st.w	a1, a0, 16
	jr	ra

	.align	4
21:	st.d	a1, a0, 0
	st.d	a1, a0, 8
	st.d	a1, a0, 13
	jr	ra

	.align	4
22:	st.d	a1, a0, 0
	st.d	a1, a0, 8
	st.d	a1, a0, 14
	jr	ra

	.align	4
23:	st.d	a1, a0, 0
	st.d	a1, a0, 8
	st.d	a1, a0, 15
	jr	ra

	.align	4
24:	st.d	a1, a0, 0
	st.d	a1, a0, 8
	st.d	a1, a0, 16
	jr	ra
