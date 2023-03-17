/*
 ============================================================================
 Name        : lsx.h
 Author      : hev <r@hev.cc>
 Copyright   : Copyright (c) 2023 hev
 Description : LSX macros
 ============================================================================
 */

#ifndef __LSX_H__
#define __LSX_H__

#include "asm.h"

	.macro vld vd, rj, si12
	parse_v d, \vd
	parse_r j, \rj
	.word ((0b0010110000 << 22) | ((\si12 & 0xfff) << 10) | (j << 5) | d)
	.endm

	.macro vst vd, rj, si12
	parse_v d, \vd
	parse_r j, \rj
	.word ((0b0010110001 << 22) | ((\si12 & 0xfff) << 10) | (j << 5) | d)
	.endm

	.macro vreplgr2vr.b vd, rj
	parse_v d, \vd
	parse_r j, \rj
	.word ((0b0111001010011111000000 << 10) | (j << 5) | d)
	.endm

#endif /* __LSX_H__ */
