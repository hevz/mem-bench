/* SPDX-License-Identifier: GPL-2.0 */
/*
 * Copyright (C) 2020-2021 Loongson Technology Corporation Limited
 */

#include "regdef.h"

	.text

/*
 * void *__rmemcpy_fast(void *dst, const void *src, size_t n)
 *
 * a0: dst
 * a1: src
 * a2: n
 */
	.global memmove
memmove:
	move	a3, a0
	beqz	a2, 3f

	add.d	a0, a0, a2
	add.d	a1, a1, a2

	ori	a4, zero, 64
	blt	a2, a4, 2f

	/* copy 64 bytes at a time */
1:	ld.d	t0, a1, -8
	ld.d	t1, a1, -16
	ld.d	t2, a1, -24
	ld.d	t3, a1, -32
	ld.d	t4, a1, -40
	ld.d	t5, a1, -48
	ld.d	t6, a1, -56
	ld.d	t7, a1, -64
	st.d	t0, a0, -8
	st.d	t1, a0, -16
	st.d	t2, a0, -24
	st.d	t3, a0, -32
	st.d	t4, a0, -40
	st.d	t5, a0, -48
	st.d	t6, a0, -56
	st.d	t7, a0, -64

	addi.d	a0, a0, -64
	addi.d	a1, a1, -64
	addi.d	a2, a2, -64
	bge	a2, a4, 1b

	beqz	a2, 3f

	/* copy the remaining bytes */
2:	ld.b	t0, a1, -1
	st.b	t0, a0, -1
	addi.d	a0, a0, -1
	addi.d	a1, a1, -1
	addi.d	a2, a2, -1
	bgt	a2, zero, 2b

	/* return */
3:	move	a0, a3
	jr	ra
