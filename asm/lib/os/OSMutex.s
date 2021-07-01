.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global __OSUnlockAllMutex
__OSUnlockAllMutex:
/* 800C7028 000C2F48  7C 08 02 A6 */	mflr r0
/* 800C702C 000C2F4C  90 01 00 04 */	stw r0, 4(r1)
/* 800C7030 000C2F50  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 800C7034 000C2F54  93 E1 00 14 */	stw r31, 0x14(r1)
/* 800C7038 000C2F58  3B E0 00 00 */	li r31, 0
/* 800C703C 000C2F5C  93 C1 00 10 */	stw r30, 0x10(r1)
/* 800C7040 000C2F60  3B C3 00 00 */	addi r30, r3, 0
/* 800C7044 000C2F64  48 00 00 30 */	b lbl_800C7074
lbl_800C7048:
/* 800C7048 000C2F68  80 A4 00 10 */	lwz r5, 0x10(r4)
/* 800C704C 000C2F6C  38 64 00 00 */	addi r3, r4, 0
/* 800C7050 000C2F70  28 05 00 00 */	cmplwi r5, 0
/* 800C7054 000C2F74  40 82 00 0C */	bne lbl_800C7060
/* 800C7058 000C2F78  93 FE 02 F8 */	stw r31, 0x2f8(r30)
/* 800C705C 000C2F7C  48 00 00 08 */	b lbl_800C7064
lbl_800C7060:
/* 800C7060 000C2F80  93 E5 00 14 */	stw r31, 0x14(r5)
lbl_800C7064:
/* 800C7064 000C2F84  90 BE 02 F4 */	stw r5, 0x2f4(r30)
/* 800C7068 000C2F88  93 E4 00 0C */	stw r31, 0xc(r4)
/* 800C706C 000C2F8C  93 E4 00 08 */	stw r31, 8(r4)
/* 800C7070 000C2F90  48 00 28 09 */	bl OSWakeupThread
lbl_800C7074:
/* 800C7074 000C2F94  80 9E 02 F4 */	lwz r4, 0x2f4(r30)
/* 800C7078 000C2F98  28 04 00 00 */	cmplwi r4, 0
/* 800C707C 000C2F9C  40 82 FF CC */	bne lbl_800C7048
/* 800C7080 000C2FA0  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800C7084 000C2FA4  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 800C7088 000C2FA8  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 800C708C 000C2FAC  7C 08 03 A6 */	mtlr r0
/* 800C7090 000C2FB0  38 21 00 18 */	addi r1, r1, 0x18
/* 800C7094 000C2FB4  4E 80 00 20 */	blr
