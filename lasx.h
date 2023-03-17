/*
 ============================================================================
 Name        : lasx.h
 Author      : hev <r@hev.cc>
 Copyright   : Copyright (c) 2023 hev
 Description : LASX macros
 ============================================================================
 */

#ifndef __LASX_H__
#define __LASX_H__

#include "asm.h"
#include "lsx.h"

	.macro xvld vd, rj, si12
	parse_x d, \vd
	parse_r j, \rj
	.word ((0b0010110010 << 22) | ((\si12 & 0xfff) << 10) | (j << 5) | d)
	.endm

	.macro xvst vd, rj, si12
	parse_x d, \vd
	parse_r j, \rj
	.word ((0b0010110011 << 22) | ((\si12 & 0xfff) << 10) | (j << 5) | d)
	.endm

	.macro xvreplgr2vr.b vd, rj
	parse_x d, \vd
	parse_r j, \rj
	.word ((0b0111011010011111000000 << 10) | (j << 5) | d)
	.endm

#endif /* __LASX_H__ */
