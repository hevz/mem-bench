/* SPDX-License-Identifier: GPL-2.0 */
/*
 * This file is subject to the terms and conditions of the GNU General Public
 * License.  See the file "COPYING" in the main directory of this archive
 * for more details.
 *
 * Copyright (C) 1985 MIPS Computer Systems, Inc.
 * Copyright (C) 1994, 95, 99, 2003 by Ralf Baechle
 * Copyright (C) 1990 - 1992, 1999 Silicon Graphics, Inc.
 * Copyright (C) 2011 Wind River Systems,
 *   written by Ralf Baechle <ralf@linux-mips.org>
 * Copyright (C) 2020 Loongson Technology Co., Ltd.
 */
#ifndef _ASM_REGDEF_H
#define _ASM_REGDEF_H

#define zero	$r0	/* wired zero */
#define ra	$r1	/* return address */
#define tp	$r2
#define sp	$r3	/* stack pointer */
#define a0	$r4	/* argument registers */
#define a1	$r5
#define a2	$r6
#define a3	$r7
#define a4	$r8
#define a5	$r9
#define a6	$r10
#define a7	$r11
#define t0	$r12	/* caller saved */
#define t1	$r13
#define t2	$r14
#define t3	$r15
#define t4	$r16
#define t5	$r17
#define t6	$r18
#define t7	$r19
#define t8	$r20
#define u0	$r21
#define fp	$r22	/* frame pointer */
#define s0	$r23	/* callee saved */
#define s1	$r24
#define s2	$r25
#define s3	$r26
#define s4	$r27
#define s5	$r28
#define s6	$r29
#define s7	$r30
#define s8	$r31

#define f0	$f0
#define f1	$f1
#define f2	$f2
#define f3	$f3
#define f4	$f4
#define f5	$f5
#define f6	$f6
#define f7	$f7
#define f8	$f8
#define f9	$f9
#define f10	$f10
#define f11	$f11
#define f12	$f12
#define f13	$f13
#define f14	$f14
#define f15	$f15
#define f16	$f16
#define f17	$f17
#define f18	$f18
#define f19	$f19
#define f20	$f20
#define f21	$f21
#define f22	$f22
#define f23	$f23
#define f24	$f24
#define f25	$f25
#define f26	$f26
#define f27	$f27
#define f28	$f28
#define f29	$f29
#define f30	$f30
#define f31	$f31

#define vr0	$vr0
#define vr1	$vr1
#define vr2	$vr2
#define vr3	$vr3
#define vr4	$vr4
#define vr5	$vr5
#define vr6	$vr6
#define vr7	$vr7
#define vr8	$vr8
#define vr9	$vr9
#define vr10	$vr10
#define vr11	$vr11
#define vr12	$vr12
#define vr13	$vr13
#define vr14	$vr14
#define vr15	$vr15
#define vr16	$vr16
#define vr17	$vr17
#define vr18	$vr18
#define vr19	$vr19
#define vr20	$vr20
#define vr21	$vr21
#define vr22	$vr22
#define vr23	$vr23
#define vr24	$vr24
#define vr25	$vr25
#define vr26	$vr26
#define vr27	$vr27
#define vr28	$vr28
#define vr29	$vr29
#define vr30	$vr30
#define vr31	$vr31

#define xr0	$xr0
#define xr1	$xr1
#define xr2	$xr2
#define xr3	$xr3
#define xr4	$xr4
#define xr5	$xr5
#define xr6	$xr6
#define xr7	$xr7
#define xr8	$xr8
#define xr9	$xr9
#define xr10	$xr10
#define xr11	$xr11
#define xr12	$xr12
#define xr13	$xr13
#define xr14	$xr14
#define xr15	$xr15
#define xr16	$xr16
#define xr17	$xr17
#define xr18	$xr18
#define xr19	$xr19
#define xr20	$xr20
#define xr21	$xr21
#define xr22	$xr22
#define xr23	$xr23
#define xr24	$xr24
#define xr25	$xr25
#define xr26	$xr26
#define xr27	$xr27
#define xr28	$xr28
#define xr29	$xr29
#define xr30	$xr30
#define xr31	$xr31

#endif /* _ASM_REGDEF_H */
