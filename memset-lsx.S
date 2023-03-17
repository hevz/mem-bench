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

	sltui	t0, a2, 17
	bnez	t0, .Lsmall

	add.d	a2, a0, a2
	vst	vr0, a0, 0

	/* align up address */
	andi	t1, a0, 15
	sub.d	a3, a0, t1
	addi.d	a3, a3, 16

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
