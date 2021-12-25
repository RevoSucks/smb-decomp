.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global GXClearGPMetric
GXClearGPMetric:
/* 800E499C 000E08BC  80 6D A3 64 */	lwz r3, __cpReg@sda21(r13)
/* 800E49A0 000E08C0  38 00 00 04 */	li r0, 4
/* 800E49A4 000E08C4  B0 03 00 04 */	sth r0, 4(r3)
/* 800E49A8 000E08C8  4E 80 00 20 */	blr

.global GXInitXfRasMetric
GXInitXfRasMetric:
/* 800E49AC 000E08CC  38 00 00 61 */	li r0, 0x61
/* 800E49B0 000E08D0  80 6D 97 C8 */	lwz r3, gx@sda21(r13)
/* 800E49B4 000E08D4  3C A0 CC 01 */	lis r5, 0xCC008000@ha
/* 800E49B8 000E08D8  3C 80 24 03 */	lis r4, 0x2402C022@ha
/* 800E49BC 000E08DC  98 05 80 00 */	stb r0, 0xCC008000@l(r5)
/* 800E49C0 000E08E0  38 04 C0 22 */	addi r0, r4, 0x2402C022@l
/* 800E49C4 000E08E4  90 05 80 00 */	stw r0, -0x8000(r5)
/* 800E49C8 000E08E8  38 00 00 10 */	li r0, 0x10
/* 800E49CC 000E08EC  3C 80 00 03 */	lis r4, 0x00031000@ha
/* 800E49D0 000E08F0  98 05 80 00 */	stb r0, -0x8000(r5)
/* 800E49D4 000E08F4  38 00 10 06 */	li r0, 0x1006
/* 800E49D8 000E08F8  38 84 10 00 */	addi r4, r4, 0x00031000@l
/* 800E49DC 000E08FC  90 05 80 00 */	stw r0, -0x8000(r5)
/* 800E49E0 000E0900  38 00 00 00 */	li r0, 0
/* 800E49E4 000E0904  90 85 80 00 */	stw r4, -0x8000(r5)
/* 800E49E8 000E0908  B0 03 00 02 */	sth r0, 2(r3)
/* 800E49EC 000E090C  4E 80 00 20 */	blr

.global GXReadXfRasMetric
GXReadXfRasMetric:
/* 800E49F0 000E0910  80 ED A3 64 */	lwz r7, __cpReg@sda21(r13)
/* 800E49F4 000E0914  A1 07 00 42 */	lhz r8, 0x42(r7)
/* 800E49F8 000E0918  A0 07 00 40 */	lhz r0, 0x40(r7)
/* 800E49FC 000E091C  51 00 80 1E */	rlwimi r0, r8, 0x10, 0, 0xf
/* 800E4A00 000E0920  90 05 00 00 */	stw r0, 0(r5)
/* 800E4A04 000E0924  80 AD A3 64 */	lwz r5, __cpReg@sda21(r13)
/* 800E4A08 000E0928  A0 E5 00 46 */	lhz r7, 0x46(r5)
/* 800E4A0C 000E092C  A0 05 00 44 */	lhz r0, 0x44(r5)
/* 800E4A10 000E0930  50 E0 80 1E */	rlwimi r0, r7, 0x10, 0, 0xf
/* 800E4A14 000E0934  90 06 00 00 */	stw r0, 0(r6)
/* 800E4A18 000E0938  80 AD A3 64 */	lwz r5, __cpReg@sda21(r13)
/* 800E4A1C 000E093C  A0 05 00 4A */	lhz r0, 0x4a(r5)
/* 800E4A20 000E0940  A0 A5 00 48 */	lhz r5, 0x48(r5)
/* 800E4A24 000E0944  50 05 80 1E */	rlwimi r5, r0, 0x10, 0, 0xf
/* 800E4A28 000E0948  90 A3 00 00 */	stw r5, 0(r3)
/* 800E4A2C 000E094C  80 AD A3 64 */	lwz r5, __cpReg@sda21(r13)
/* 800E4A30 000E0950  A0 65 00 4E */	lhz r3, 0x4e(r5)
/* 800E4A34 000E0954  A0 05 00 4C */	lhz r0, 0x4c(r5)
/* 800E4A38 000E0958  50 60 80 1E */	rlwimi r0, r3, 0x10, 0, 0xf
/* 800E4A3C 000E095C  90 04 00 00 */	stw r0, 0(r4)
/* 800E4A40 000E0960  4E 80 00 20 */	blr

.section .data

.global lbl_801E91C0
lbl_801E91C0:
	# ROM: 0x1E61C0
	.4byte 0
	.byte 0x00, 0x00, 0x00, 0x01
	.byte 0x00, 0x00, 0x00, 0x02
	.byte 0x00, 0x00, 0x00, 0x03
	.byte 0x00, 0x00, 0x00, 0x04
	.byte 0x00, 0x00, 0x00, 0x04
	.byte 0x00, 0x00, 0x00, 0x04
	.byte 0x00, 0x00, 0x00, 0x05
