/*
 ============================================================================
 Name        : memmove-lsx.S
 Author      : hev <r@hev.cc>
 Copyright   : Copyright (c) 2023 hev
 Description : Memmove LSX
 ============================================================================
 */

#include "regdef.h"
#include "lasx.h"

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

	sltui	t0, a2, 65
	bnez	t0, __memcpy_small

	add.d	a3, a1, a2
	add.d	a2, a0, a2
	xvld	xr8, a1, 0
	xvld	xr9, a3, -32

	/* align up destination address */
	andi	t1, a2, 31
	sub.d	a3, a3, t1
	sub.d	a5, a2, t1

	addi.d	a4, a1, 256
	bgeu	a4, a3, .Llt256

	/* copy 256 bytes at a time */
.Lloop256:
	xvld	xr0, a3, -32
	xvld	xr1, a3, -64
	xvld	xr2, a3, -96
	xvld	xr3, a3, -128
	xvld	xr4, a3, -160
	xvld	xr5, a3, -192
	xvld	xr6, a3, -224
	xvld	xr7, a3, -256
	addi.d	a3, a3, -256
	xvst	xr0, a5, -32
	xvst	xr1, a5, -64
	xvst	xr2, a5, -96
	xvst	xr3, a5, -128
	xvst	xr4, a5, -160
	xvst	xr5, a5, -192
	xvst	xr6, a5, -224
	xvst	xr7, a5, -256
	addi.d	a5, a5, -256
	bltu	a4, a3, .Lloop256

	/* copy the remaining bytes */
.Llt256:
	addi.d	a4, a1, 128
	bgeu	a4, a3, .Llt128
	xvld	xr0, a3, -32
	xvld	xr1, a3, -64
	xvld	xr2, a3, -96
	xvld	xr3, a3, -128
	addi.d	a3, a3, -128
	xvst	xr0, a5, -32
	xvst	xr1, a5, -64
	xvst	xr2, a5, -96
	xvst	xr3, a5, -128
	addi.d	a5, a5, -128

.Llt128:
	addi.d	a4, a1, 64
	bgeu	a4, a3, .Llt64
	xvld	xr0, a3, -32
	xvld	xr1, a3, -64
	addi.d	a3, a3, -64
	xvst	xr0, a5, -32
	xvst	xr1, a5, -64
	addi.d	a5, a5, -64

.Llt64:
	addi.d	a4, a1, 32
	bgeu	a4, a3, .Llt32
	xvld	xr0, a3, -32
	xvst	xr0, a5, -32

.Llt32:
	xvst	xr8, a0, 0
	xvst	xr9, a2, -32

	/* return */
	jr	ra
