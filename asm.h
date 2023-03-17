/*
 ============================================================================
 Name        : asm.h
 Author      : hev <r@hev.cc>
 Copyright   : Copyright (c) 2023 hev
 Description : Asm helpers
 ============================================================================
 */

#ifndef __ASM_H__
#define __ASM_H__

	.macro	parse_r var r
	\var	= -1
	.ifc	\r, $r0
	\var	= 0
	.endif
	.ifc	\r, $r1
	\var	= 1
	.endif
	.ifc	\r, $r2
	\var	= 2
	.endif
	.ifc	\r, $r3
	\var	= 3
	.endif
	.ifc	\r, $r4
	\var	= 4
	.endif
	.ifc	\r, $r5
	\var	= 5
	.endif
	.ifc	\r, $r6
	\var	= 6
	.endif
	.ifc	\r, $r7
	\var	= 7
	.endif
	.ifc	\r, $r8
	\var	= 8
	.endif
	.ifc	\r, $r9
	\var	= 9
	.endif
	.ifc	\r, $r10
	\var	= 10
	.endif
	.ifc	\r, $r11
	\var	= 11
	.endif
	.ifc	\r, $r12
	\var	= 12
	.endif
	.ifc	\r, $r13
	\var	= 13
	.endif
	.ifc	\r, $r14
	\var	= 14
	.endif
	.ifc	\r, $r15
	\var	= 15
	.endif
	.ifc	\r, $r16
	\var	= 16
	.endif
	.ifc	\r, $r17
	\var	= 17
	.endif
	.ifc	\r, $r18
	\var	= 18
	.endif
	.ifc	\r, $r19
	\var	= 19
	.endif
	.ifc	\r, $r20
	\var	= 20
	.endif
	.ifc	\r, $r21
	\var	= 21
	.endif
	.ifc	\r, $r22
	\var	= 22
	.endif
	.ifc	\r, $r23
	\var	= 23
	.endif
	.ifc	\r, $r24
	\var	= 24
	.endif
	.ifc	\r, $r25
	\var	= 25
	.endif
	.ifc	\r, $r26
	\var	= 26
	.endif
	.ifc	\r, $r27
	\var	= 27
	.endif
	.ifc	\r, $r28
	\var	= 28
	.endif
	.ifc	\r, $r29
	\var	= 29
	.endif
	.ifc	\r, $r30
	\var	= 30
	.endif
	.ifc	\r, $r31
	\var	= 31
	.endif
	.iflt	\var
	.error	"Unable to parse register name \r"
	.endif
	.endm

	.macro	parse_v var r
	\var	= -1
	.ifc	\r, vr0
	\var	= 0
	.endif
	.ifc	\r, vr1
	\var	= 1
	.endif
	.ifc	\r, vr2
	\var	= 2
	.endif
	.ifc	\r, vr3
	\var	= 3
	.endif
	.ifc	\r, vr4
	\var	= 4
	.endif
	.ifc	\r, vr5
	\var	= 5
	.endif
	.ifc	\r, vr6
	\var	= 6
	.endif
	.ifc	\r, vr7
	\var	= 7
	.endif
	.ifc	\r, vr8
	\var	= 8
	.endif
	.ifc	\r, vr9
	\var	= 9
	.endif
	.ifc	\r, vr10
	\var	= 10
	.endif
	.ifc	\r, vr11
	\var	= 11
	.endif
	.ifc	\r, vr12
	\var	= 12
	.endif
	.ifc	\r, vr13
	\var	= 13
	.endif
	.ifc	\r, vr14
	\var	= 14
	.endif
	.ifc	\r, vr15
	\var	= 15
	.endif
	.ifc	\r, vr16
	\var	= 16
	.endif
	.ifc	\r, vr17
	\var	= 17
	.endif
	.ifc	\r, vr18
	\var	= 18
	.endif
	.ifc	\r, vr19
	\var	= 19
	.endif
	.ifc	\r, vr20
	\var	= 20
	.endif
	.ifc	\r, vr21
	\var	= 21
	.endif
	.ifc	\r, vr22
	\var	= 22
	.endif
	.ifc	\r, vr23
	\var	= 23
	.endif
	.ifc	\r, vr24
	\var	= 24
	.endif
	.ifc	\r, vr25
	\var	= 25
	.endif
	.ifc	\r, vr26
	\var	= 26
	.endif
	.ifc	\r, vr27
	\var	= 27
	.endif
	.ifc	\r, vr28
	\var	= 28
	.endif
	.ifc	\r, vr29
	\var	= 29
	.endif
	.ifc	\r, vr30
	\var	= 30
	.endif
	.ifc	\r, vr31
	\var	= 31
	.endif
	.iflt	\var
	.error	"Unable to parse register name \r"
	.endif
	.endm

	.macro	parse_x var r
	\var	= -1
	.ifc	\r, xr0
	\var	= 0
	.endif
	.ifc	\r, xr1
	\var	= 1
	.endif
	.ifc	\r, xr2
	\var	= 2
	.endif
	.ifc	\r, xr3
	\var	= 3
	.endif
	.ifc	\r, xr4
	\var	= 4
	.endif
	.ifc	\r, xr5
	\var	= 5
	.endif
	.ifc	\r, xr6
	\var	= 6
	.endif
	.ifc	\r, xr7
	\var	= 7
	.endif
	.ifc	\r, xr8
	\var	= 8
	.endif
	.ifc	\r, xr9
	\var	= 9
	.endif
	.ifc	\r, xr10
	\var	= 10
	.endif
	.ifc	\r, xr11
	\var	= 11
	.endif
	.ifc	\r, xr12
	\var	= 12
	.endif
	.ifc	\r, xr13
	\var	= 13
	.endif
	.ifc	\r, xr14
	\var	= 14
	.endif
	.ifc	\r, xr15
	\var	= 15
	.endif
	.ifc	\r, xr16
	\var	= 16
	.endif
	.ifc	\r, xr17
	\var	= 17
	.endif
	.ifc	\r, xr18
	\var	= 18
	.endif
	.ifc	\r, xr19
	\var	= 19
	.endif
	.ifc	\r, xr20
	\var	= 20
	.endif
	.ifc	\r, xr21
	\var	= 21
	.endif
	.ifc	\r, xr22
	\var	= 22
	.endif
	.ifc	\r, xr23
	\var	= 23
	.endif
	.ifc	\r, xr24
	\var	= 24
	.endif
	.ifc	\r, xr25
	\var	= 25
	.endif
	.ifc	\r, xr26
	\var	= 26
	.endif
	.ifc	\r, xr27
	\var	= 27
	.endif
	.ifc	\r, xr28
	\var	= 28
	.endif
	.ifc	\r, xr29
	\var	= 29
	.endif
	.ifc	\r, xr30
	\var	= 30
	.endif
	.ifc	\r, xr31
	\var	= 31
	.endif
	.iflt	\var
	.error	"Unable to parse register name \r"
	.endif
	.endm

#endif /* __ASM_H__ */
