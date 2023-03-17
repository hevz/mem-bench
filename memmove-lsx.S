/*
 ============================================================================
 Name        : memmove-lsx.S
 Author      : hev <r@hev.cc>
 Copyright   : Copyright (c) 2023 hev
 Description : Memmove LSX
 ============================================================================
 */

#include "regdef.h"
#include "lsx.h"

	.text

/*
 * void *memmove(void *dst, const void *src, size_t n)
 *
 * a0: dst
 * a1: src
 * a2: n
 */
	.global memmove
memmove:
	blt	a0, a1, memcpy
	blt	a1, a0, .Lrmemcpy
	jr	ra

.Lrmemcpy:
	sltui	t0, a2, 17
	bnez	t0, __memcpy_small

	add.d	a3, a1, a2
	add.d	a2, a0, a2
	vld	vr8, a1, 0
	vld	vr9, a3, -16

	/* align up destination address */
	andi	t1, a2, 15
	sub.d	a3, a3, t1
	sub.d	a5, a2, t1

	addi.d	a4, a1, 128
	bgeu	a4, a3, .Llt128

	/* copy 128 bytes at a time */
.Lloop128:
	vld	vr0, a3, -16
	vld	vr1, a3, -32
	vld	vr2, a3, -48
	vld	vr3, a3, -64
	vld	vr4, a3, -80
	vld	vr5, a3, -96
	vld	vr6, a3, -112
	vld	vr7, a3, -128
	addi.d	a3, a3, -128
	vst	vr0, a5, -16
	vst	vr1, a5, -32
	vst	vr2, a5, -48
	vst	vr3, a5, -64
	vst	vr4, a5, -80
	vst	vr5, a5, -96
	vst	vr6, a5, -112
	vst	vr7, a5, -128
	addi.d	a5, a5, -128
	bltu	a4, a3, .Lloop128

	/* copy the remaining bytes */
.Llt128:
	addi.d	a4, a1, 64
	bgeu	a4, a3, .Llt64
	vld	vr0, a3, -16
	vld	vr1, a3, -32
	vld	vr2, a3, -48
	vld	vr3, a3, -64
	addi.d	a3, a3, -64
	vst	vr0, a5, -16
	vst	vr1, a5, -32
	vst	vr2, a5, -48
	vst	vr3, a5, -64
	addi.d	a5, a5, -64

.Llt64:
	addi.d	a4, a1, 32
	bgeu	a4, a3, .Llt32
	vld	vr0, a3, -16
	vld	vr1, a3, -32
	addi.d	a3, a3, -32
	vst	vr0, a5, -16
	vst	vr1, a5, -32
	addi.d	a5, a5, -32

.Llt32:
	addi.d	a4, a1, 16
	bgeu	a4, a3, .Llt16
	vld	vr0, a3, -16
	vst	vr0, a5, -16

.Llt16:
	vst	vr8, a0, 0
	vst	vr9, a2, -16

	/* return */
	jr	ra
