/*
 ============================================================================
 Name        : memcpy-int.S
 Author      : hev <r@hev.cc>
 Copyright   : Copyright (c) 2023 hev
 Description : Memcpy INT
 ============================================================================
 */

#include "regdef.h"

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
16:	ld.d	t0, a1, 0
	ld.d	t1, a1, 8
	st.d	t0, a0, 0
	st.d	t1, a0, 8
	jr	ra

	.align	5
17:	ld.d	t0, a1, 0
	ld.d	t1, a1, 8
	ld.b	t2, a1, 16
	st.d	t0, a0, 0
	st.d	t1, a0, 8
	st.b	t2, a0, 16
	jr	ra

	.align	5
18:	ld.d	t0, a1, 0
	ld.d	t1, a1, 8
	ld.h	t2, a1, 16
	st.d	t0, a0, 0
	st.d	t1, a0, 8
	st.h	t2, a0, 16
	jr	ra

	.align	5
19:	ld.d	t0, a1, 0
	ld.d	t1, a1, 8
	ld.w	t2, a1, 15
	st.d	t0, a0, 0
	st.d	t1, a0, 8
	st.w	t2, a0, 15
	jr	ra

	.align	5
20:	ld.d	t0, a1, 0
	ld.d	t1, a1, 8
	ld.w	t2, a1, 16
	st.d	t0, a0, 0
	st.d	t1, a0, 8
	st.w	t2, a0, 16
	jr	ra

	.align	5
21:	ld.d	t0, a1, 0
	ld.d	t1, a1, 8
	ld.d	t2, a1, 13
	st.d	t0, a0, 0
	st.d	t1, a0, 8
	st.d	t2, a0, 13
	jr	ra

	.align	5
22:	ld.d	t0, a1, 0
	ld.d	t1, a1, 8
	ld.d	t2, a1, 14
	st.d	t0, a0, 0
	st.d	t1, a0, 8
	st.d	t2, a0, 14
	jr	ra

	.align	5
23:	ld.d	t0, a1, 0
	ld.d	t1, a1, 8
	ld.d	t2, a1, 15
	st.d	t0, a0, 0
	st.d	t1, a0, 8
	st.d	t2, a0, 15
	jr	ra

	.align	5
24:	ld.d	t0, a1, 0
	ld.d	t1, a1, 8
	ld.d	t2, a1, 16
	st.d	t0, a0, 0
	st.d	t1, a0, 8
	st.d	t2, a0, 16
	jr	ra

/*
 * void *memcpy(void *dst, const void *src, size_t n)
 *
 * a0: dst
 * a1: src
 * a2: n
 */
	.align	6
	.global memcpy
memcpy:
	sltui	t0, a2, 25
	bnez	t0, __memcpy_small

	add.d	a3, a1, a2
	add.d	a2, a0, a2
	ld.d	a6, a1, 0
	ld.d	a7, a3, -8

	/* align up destination address */
	andi	t1, a0, 7
	sub.d	t0, zero, t1
	addi.d	t0, t0, 8
	add.d	a1, a1, t0
	add.d	a5, a0, t0

	addi.d	a4, a3, -64
	bgeu	a1, a4, .Llt64

	/* copy 64 bytes at a time */
.Lloop64:
	ld.d	t0, a1, 0
	ld.d	t1, a1, 8
	ld.d	t2, a1, 16
	ld.d	t3, a1, 24
	ld.d	t4, a1, 32
	ld.d	t5, a1, 40
	ld.d	t6, a1, 48
	ld.d	t7, a1, 56
	addi.d	a1, a1, 64
	st.d	t0, a5, 0
	st.d	t1, a5, 8
	st.d	t2, a5, 16
	st.d	t3, a5, 24
	st.d	t4, a5, 32
	st.d	t5, a5, 40
	st.d	t6, a5, 48
	st.d	t7, a5, 56
	addi.d	a5, a5, 64
	bltu	a1, a4, .Lloop64

	/* copy the remaining bytes */
.Llt64:
	addi.d	a4, a3, -32
	bgeu	a1, a4, .Llt32
	ld.d	t0, a1, 0
	ld.d	t1, a1, 8
	ld.d	t2, a1, 16
	ld.d	t3, a1, 24
	addi.d	a1, a1, 32
	st.d	t0, a5, 0
	st.d	t1, a5, 8
	st.d	t2, a5, 16
	st.d	t3, a5, 24
	addi.d	a5, a5, 32

.Llt32:
	addi.d	a4, a3, -16
	bgeu	a1, a4, .Llt16
	ld.d	t0, a1, 0
	ld.d	t1, a1, 8
	addi.d	a1, a1, 16
	st.d	t0, a5, 0
	st.d	t1, a5, 8
	addi.d	a5, a5, 16

.Llt16:
	addi.d	a4, a3, -8
	bgeu	a1, a4, .Llt8
	ld.d	t0, a1, 0
	st.d	t0, a5, 0

.Llt8:
	st.d	a6, a0, 0
	st.d	a7, a2, -8

	/* return */
	jr	ra
