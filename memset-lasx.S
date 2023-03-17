/*
 ============================================================================
 Name        : memset-lasx.S
 Author      : hev <r@hev.cc>
 Copyright   : Copyright (c) 2023 hev
 Description : Memset LASX
 ============================================================================
 */

#include "regdef.h"
#include "lasx.h"

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
	xvreplgr2vr.b	xr0, a1
	movfr2gr.d	a1, f0

	sltui	t0, a2, 79
	bnez	t0, .Lsmall

	add.d	a2, a0, a2
	xvst	xr0, a0, 0

	/* align up address */
	addi.d	a3, a0, 32
	bstrins.d	a3, zero, 4, 0

	addi.d	a4, a2, -256
	bgeu	a3, a4, .Llt256

	/* set 256 bytes at a time */
.Lloop256:
	xvst	xr0, a3, 0
	xvst	xr0, a3, 32
	xvst	xr0, a3, 64
	xvst	xr0, a3, 96
	xvst	xr0, a3, 128
	xvst	xr0, a3, 160
	xvst	xr0, a3, 192
	xvst	xr0, a3, 224
	addi.d	a3, a3, 256
	bltu	a3, a4, .Lloop256

	/* set the remaining bytes */
.Llt256:
	addi.d	a4, a2, -128
	bgeu	a3, a4, .Llt128
	xvst	xr0, a3, 0
	xvst	xr0, a3, 32
	xvst	xr0, a3, 64
	xvst	xr0, a3, 96
	addi.d	a3, a3, 128

.Llt128:
	addi.d	a4, a2, -64
	bgeu	a3, a4, .Llt64
	xvst	xr0, a3, 0
	xvst	xr0, a3, 32
	addi.d	a3, a3, 64

.Llt64:
	addi.d	a4, a2, -32
	bgeu	a3, a4, .Llt32
	xvst	xr0, a3, 0

.Llt32:
	xvst	xr0, a2, -32

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
16:	vst	vr0, a0, 0
	jr	ra

	.align	4
17:	vst	vr0, a0, 0
	st.b	a1, a0, 16
	jr	ra

	.align	4
18:	vst	vr0, a0, 0
	st.h	a1, a0, 16
	jr	ra

	.align	4
19:	vst	vr0, a0, 0
	st.w	a1, a0, 15
	jr	ra

	.align	4
20:	vst	vr0, a0, 0
	st.w	a1, a0, 16
	jr	ra

	.align	4
21:	vst	vr0, a0, 0
	st.d	a1, a0, 13
	jr	ra

	.align	4
22:	vst	vr0, a0, 0
	st.d	a1, a0, 14
	jr	ra

	.align	4
23:	vst	vr0, a0, 0
	st.d	a1, a0, 15
	jr	ra

	.align	4
24:	vst	vr0, a0, 0
	st.d	a1, a0, 16
	jr	ra

	.align	4
25:	vst	vr0, a0, 0
	vst	vr0, a0, 9
	jr	ra

	.align	4
26:	vst	vr0, a0, 0
	vst	vr0, a0, 10
	jr	ra

	.align	4
27:	vst	vr0, a0, 0
	vst	vr0, a0, 11
	jr	ra

	.align	4
28:	vst	vr0, a0, 0
	vst	vr0, a0, 12
	jr	ra

	.align	4
29:	vst	vr0, a0, 0
	vst	vr0, a0, 13
	jr	ra

	.align	4
30:	vst	vr0, a0, 0
	vst	vr0, a0, 14
	jr	ra

	.align	4
31:	vst	vr0, a0, 0
	vst	vr0, a0, 15
	jr	ra

	.align	4
32:	xvst	xr0, a0, 0
	jr	ra

	.align	4
33:	xvst	xr0, a0, 0
	st.b	a1, a0, 32
	jr	ra

	.align	4
34:	xvst	xr0, a0, 0
	st.h	a1, a0, 32
	jr	ra

	.align	4
35:	xvst	xr0, a0, 0
	st.w	a1, a0, 31
	jr	ra

	.align	4
36:	xvst	xr0, a0, 0
	st.w	a1, a0, 32
	jr	ra

	.align	4
37:	xvst	xr0, a0, 0
	st.d	a1, a0, 29
	jr	ra

	.align	4
38:	xvst	xr0, a0, 0
	st.d	a1, a0, 30
	jr	ra

	.align	4
39:	xvst	xr0, a0, 0
	st.d	a1, a0, 31
	jr	ra

	.align	4
40:	xvst	xr0, a0, 0
	st.d	a1, a0, 32
	jr	ra

	.align	4
41:	xvst	xr0, a0, 0
	vst	vr0, a0, 25
	jr	ra

	.align	4
42:	xvst	xr0, a0, 0
	vst	vr0, a0, 26
	jr	ra

	.align	4
43:	xvst	xr0, a0, 0
	vst	vr0, a0, 27
	jr	ra

	.align	4
44:	xvst	xr0, a0, 0
	vst	vr0, a0, 28
	jr	ra

	.align	4
45:	xvst	xr0, a0, 0
	vst	vr0, a0, 29
	jr	ra

	.align	4
46:	xvst	xr0, a0, 0
	vst	vr0, a0, 30
	jr	ra

	.align	4
47:	xvst	xr0, a0, 0
	vst	vr0, a0, 31
	jr	ra

	.align	4
48:	xvst	xr0, a0, 0
	vst	vr0, a0, 32
	jr	ra

	.align	4
49:	xvst	xr0, a0, 0
	xvst	xr0, a0, 17
	jr	ra

	.align	4
50:	xvst	xr0, a0, 0
	xvst	xr0, a0, 18
	jr	ra

	.align	4
51:	xvst	xr0, a0, 0
	xvst	xr0, a0, 19
	jr	ra

	.align	4
52:	xvst	xr0, a0, 0
	xvst	xr0, a0, 20
	jr	ra

	.align	4
53:	xvst	xr0, a0, 0
	xvst	xr0, a0, 21
	jr	ra

	.align	4
54:	xvst	xr0, a0, 0
	xvst	xr0, a0, 22
	jr	ra

	.align	4
55:	xvst	xr0, a0, 0
	xvst	xr0, a0, 23
	jr	ra

	.align	4
56:	xvst	xr0, a0, 0
	xvst	xr0, a0, 24
	jr	ra

	.align	4
57:	xvst	xr0, a0, 0
	xvst	xr0, a0, 25
	jr	ra

	.align	4
58:	xvst	xr0, a0, 0
	xvst	xr0, a0, 26
	jr	ra

	.align	4
59:	xvst	xr0, a0, 0
	xvst	xr0, a0, 27
	jr	ra

	.align	4
60:	xvst	xr0, a0, 0
	xvst	xr0, a0, 28
	jr	ra

	.align	4
61:	xvst	xr0, a0, 0
	xvst	xr0, a0, 29
	jr	ra

	.align	4
62:	xvst	xr0, a0, 0
	xvst	xr0, a0, 30
	jr	ra

	.align	4
63:	xvst	xr0, a0, 0
	xvst	xr0, a0, 31
	jr	ra

	.align	4
64:	xvst	xr0, a0, 0
	xvst	xr0, a0, 32
	jr	ra

	.align	4
65:	xvst	xr0, a0, 0
	xvst	xr0, a0, 32
	st.b	a1, a0, 64
	jr	ra

	.align	4
66:	xvst	xr0, a0, 0
	xvst	xr0, a0, 32
	st.h	a1, a0, 64
	jr	ra

	.align	4
67:	xvst	xr0, a0, 0
	xvst	xr0, a0, 32
	st.w	a1, a0, 63
	jr	ra

	.align	4
68:	xvst	xr0, a0, 0
	xvst	xr0, a0, 32
	st.w	a1, a0, 64
	jr	ra

	.align	4
69:	xvst	xr0, a0, 0
	xvst	xr0, a0, 32
	st.d	a1, a0, 61
	jr	ra

	.align	4
70:	xvst	xr0, a0, 0
	xvst	xr0, a0, 32
	st.d	a1, a0, 62
	jr	ra

	.align	4
71:	xvst	xr0, a0, 0
	xvst	xr0, a0, 32
	st.d	a1, a0, 63
	jr	ra

	.align	4
72:	xvst	xr0, a0, 0
	xvst	xr0, a0, 32
	st.d	a1, a0, 64
	jr	ra

	.align	4
73:	xvst	xr0, a0, 0
	xvst	xr0, a0, 32
	vst	vr0, a0, 57
	jr	ra

	.align	4
74:	xvst	xr0, a0, 0
	xvst	xr0, a0, 32
	vst	vr0, a0, 58
	jr	ra

	.align	4
75:	xvst	xr0, a0, 0
	xvst	xr0, a0, 32
	vst	vr0, a0, 59
	jr	ra

	.align	4
76:	xvst	xr0, a0, 0
	xvst	xr0, a0, 32
	vst	vr0, a0, 60
	jr	ra

	.align	4
77:	xvst	xr0, a0, 0
	xvst	xr0, a0, 32
	vst	vr0, a0, 61
	jr	ra

	.align	4
78:	xvst	xr0, a0, 0
	xvst	xr0, a0, 32
	vst	vr0, a0, 62
	jr	ra
