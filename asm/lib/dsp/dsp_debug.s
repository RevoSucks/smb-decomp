.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global __DSP_debug_printf
__DSP_debug_printf:
/* 800D48EC 000D080C  94 21 FF 90 */	stwu r1, -0x70(r1)
/* 800D48F0 000D0810  40 86 00 24 */	bne cr1, lbl_800D4914
/* 800D48F4 000D0814  D8 21 00 28 */	stfd f1, 0x28(r1)
/* 800D48F8 000D0818  D8 41 00 30 */	stfd f2, 0x30(r1)
/* 800D48FC 000D081C  D8 61 00 38 */	stfd f3, 0x38(r1)
/* 800D4900 000D0820  D8 81 00 40 */	stfd f4, 0x40(r1)
/* 800D4904 000D0824  D8 A1 00 48 */	stfd f5, 0x48(r1)
/* 800D4908 000D0828  D8 C1 00 50 */	stfd f6, 0x50(r1)
/* 800D490C 000D082C  D8 E1 00 58 */	stfd f7, 0x58(r1)
/* 800D4910 000D0830  D9 01 00 60 */	stfd f8, 0x60(r1)
lbl_800D4914:
/* 800D4914 000D0834  90 61 00 08 */	stw r3, 8(r1)
/* 800D4918 000D0838  90 81 00 0C */	stw r4, 0xc(r1)
/* 800D491C 000D083C  90 A1 00 10 */	stw r5, 0x10(r1)
/* 800D4920 000D0840  90 C1 00 14 */	stw r6, 0x14(r1)
/* 800D4924 000D0844  90 E1 00 18 */	stw r7, 0x18(r1)
/* 800D4928 000D0848  91 01 00 1C */	stw r8, 0x1c(r1)
/* 800D492C 000D084C  91 21 00 20 */	stw r9, 0x20(r1)
/* 800D4930 000D0850  91 41 00 24 */	stw r10, 0x24(r1)
/* 800D4934 000D0854  38 21 00 70 */	addi r1, r1, 0x70
/* 800D4938 000D0858  4E 80 00 20 */	blr
