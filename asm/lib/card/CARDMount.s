.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global CARDProbeEx
CARDProbeEx:
/* 800D8F40 000D4E60  7C 08 02 A6 */	mflr r0
/* 800D8F44 000D4E64  90 01 00 04 */	stw r0, 4(r1)
/* 800D8F48 000D4E68  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 800D8F4C 000D4E6C  BF 61 00 1C */	stmw r27, 0x1c(r1)
/* 800D8F50 000D4E70  7C 7B 1B 79 */	or. r27, r3, r3
/* 800D8F54 000D4E74  3B 84 00 00 */	addi r28, r4, 0
/* 800D8F58 000D4E78  3B C5 00 00 */	addi r30, r5, 0
/* 800D8F5C 000D4E7C  41 80 00 0C */	blt lbl_800D8F68
/* 800D8F60 000D4E80  2C 1B 00 02 */	cmpwi r27, 2
/* 800D8F64 000D4E84  41 80 00 0C */	blt lbl_800D8F70
lbl_800D8F68:
/* 800D8F68 000D4E88  38 60 FF 80 */	li r3, -128
/* 800D8F6C 000D4E8C  48 00 01 24 */	b lbl_800D9090
lbl_800D8F70:
/* 800D8F70 000D4E90  1C 9B 01 08 */	mulli r4, r27, 0x108
/* 800D8F74 000D4E94  3C 60 80 2C */	lis r3, __CARDBlock@ha
/* 800D8F78 000D4E98  38 03 7C 60 */	addi r0, r3, __CARDBlock@l
/* 800D8F7C 000D4E9C  7F A0 22 14 */	add r29, r0, r4
/* 800D8F80 000D4EA0  4B FE D1 3D */	bl OSDisableInterrupts
/* 800D8F84 000D4EA4  3B E3 00 00 */	addi r31, r3, 0
/* 800D8F88 000D4EA8  38 7B 00 00 */	addi r3, r27, 0
/* 800D8F8C 000D4EAC  4B FE B8 E1 */	bl EXIProbeEx
/* 800D8F90 000D4EB0  2C 03 FF FF */	cmpwi r3, -1
/* 800D8F94 000D4EB4  40 82 00 0C */	bne lbl_800D8FA0
/* 800D8F98 000D4EB8  3B A0 FF FD */	li r29, -3
/* 800D8F9C 000D4EBC  48 00 00 E8 */	b lbl_800D9084
lbl_800D8FA0:
/* 800D8FA0 000D4EC0  2C 03 00 00 */	cmpwi r3, 0
/* 800D8FA4 000D4EC4  40 82 00 0C */	bne lbl_800D8FB0
/* 800D8FA8 000D4EC8  3B A0 FF FF */	li r29, -1
/* 800D8FAC 000D4ECC  48 00 00 D8 */	b lbl_800D9084
lbl_800D8FB0:
/* 800D8FB0 000D4ED0  80 1D 00 00 */	lwz r0, 0(r29)
/* 800D8FB4 000D4ED4  2C 00 00 00 */	cmpwi r0, 0
/* 800D8FB8 000D4ED8  41 82 00 40 */	beq lbl_800D8FF8
/* 800D8FBC 000D4EDC  80 1D 00 24 */	lwz r0, 0x24(r29)
/* 800D8FC0 000D4EE0  2C 00 00 01 */	cmpwi r0, 1
/* 800D8FC4 000D4EE4  40 80 00 0C */	bge lbl_800D8FD0
/* 800D8FC8 000D4EE8  3B A0 FF FF */	li r29, -1
/* 800D8FCC 000D4EEC  48 00 00 B8 */	b lbl_800D9084
lbl_800D8FD0:
/* 800D8FD0 000D4EF0  28 1C 00 00 */	cmplwi r28, 0
/* 800D8FD4 000D4EF4  41 82 00 0C */	beq lbl_800D8FE0
/* 800D8FD8 000D4EF8  A0 1D 00 08 */	lhz r0, 8(r29)
/* 800D8FDC 000D4EFC  90 1C 00 00 */	stw r0, 0(r28)
lbl_800D8FE0:
/* 800D8FE0 000D4F00  28 1E 00 00 */	cmplwi r30, 0
/* 800D8FE4 000D4F04  41 82 00 0C */	beq lbl_800D8FF0
/* 800D8FE8 000D4F08  80 1D 00 0C */	lwz r0, 0xc(r29)
/* 800D8FEC 000D4F0C  90 1E 00 00 */	stw r0, 0(r30)
lbl_800D8FF0:
/* 800D8FF0 000D4F10  3B A0 00 00 */	li r29, 0
/* 800D8FF4 000D4F14  48 00 00 90 */	b lbl_800D9084
lbl_800D8FF8:
/* 800D8FF8 000D4F18  7F 63 DB 78 */	mr r3, r27
/* 800D8FFC 000D4F1C  4B FE C2 A1 */	bl EXIGetStage
/* 800D9000 000D4F20  54 60 07 39 */	rlwinm. r0, r3, 0, 0x1c, 0x1c
/* 800D9004 000D4F24  41 82 00 0C */	beq lbl_800D9010
/* 800D9008 000D4F28  3B A0 FF FE */	li r29, -2
/* 800D900C 000D4F2C  48 00 00 78 */	b lbl_800D9084
lbl_800D9010:
/* 800D9010 000D4F30  38 7B 00 00 */	addi r3, r27, 0
/* 800D9014 000D4F34  38 A1 00 14 */	addi r5, r1, 0x14
/* 800D9018 000D4F38  38 80 00 00 */	li r4, 0
/* 800D901C 000D4F3C  4B FE C2 99 */	bl EXIGetID
/* 800D9020 000D4F40  2C 03 00 00 */	cmpwi r3, 0
/* 800D9024 000D4F44  40 82 00 0C */	bne lbl_800D9030
/* 800D9028 000D4F48  3B A0 FF FF */	li r29, -1
/* 800D902C 000D4F4C  48 00 00 58 */	b lbl_800D9084
lbl_800D9030:
/* 800D9030 000D4F50  80 61 00 14 */	lwz r3, 0x14(r1)
/* 800D9034 000D4F54  54 60 00 1F */	rlwinm. r0, r3, 0, 0, 0xf
/* 800D9038 000D4F58  40 82 00 0C */	bne lbl_800D9044
/* 800D903C 000D4F5C  54 60 07 BF */	clrlwi. r0, r3, 0x1e
/* 800D9040 000D4F60  41 82 00 0C */	beq lbl_800D904C
lbl_800D9044:
/* 800D9044 000D4F64  3B A0 FF FE */	li r29, -2
/* 800D9048 000D4F68  48 00 00 3C */	b lbl_800D9084
lbl_800D904C:
/* 800D904C 000D4F6C  28 1C 00 00 */	cmplwi r28, 0
/* 800D9050 000D4F70  41 82 00 0C */	beq lbl_800D905C
/* 800D9054 000D4F74  54 60 06 3A */	rlwinm r0, r3, 0, 0x18, 0x1d
/* 800D9058 000D4F78  90 1C 00 00 */	stw r0, 0(r28)
lbl_800D905C:
/* 800D905C 000D4F7C  28 1E 00 00 */	cmplwi r30, 0
/* 800D9060 000D4F80  41 82 00 20 */	beq lbl_800D9080
/* 800D9064 000D4F84  80 81 00 14 */	lwz r4, 0x14(r1)
/* 800D9068 000D4F88  3C 60 80 1F */	lis r3, lbl_801E8BE0@ha
/* 800D906C 000D4F8C  38 03 8B E0 */	addi r0, r3, lbl_801E8BE0@l
/* 800D9070 000D4F90  54 83 BE FA */	rlwinm r3, r4, 0x17, 0x1b, 0x1d
/* 800D9074 000D4F94  7C 60 1A 14 */	add r3, r0, r3
/* 800D9078 000D4F98  80 03 00 00 */	lwz r0, 0(r3)
/* 800D907C 000D4F9C  90 1E 00 00 */	stw r0, 0(r30)
lbl_800D9080:
/* 800D9080 000D4FA0  3B A0 00 00 */	li r29, 0
lbl_800D9084:
/* 800D9084 000D4FA4  7F E3 FB 78 */	mr r3, r31
/* 800D9088 000D4FA8  4B FE D0 5D */	bl OSRestoreInterrupts
/* 800D908C 000D4FAC  7F A3 EB 78 */	mr r3, r29
lbl_800D9090:
/* 800D9090 000D4FB0  BB 61 00 1C */	lmw r27, 0x1c(r1)
/* 800D9094 000D4FB4  80 01 00 34 */	lwz r0, 0x34(r1)
/* 800D9098 000D4FB8  38 21 00 30 */	addi r1, r1, 0x30
/* 800D909C 000D4FBC  7C 08 03 A6 */	mtlr r0
/* 800D90A0 000D4FC0  4E 80 00 20 */	blr

.global DoMount
DoMount:
/* 800D90A4 000D4FC4  7C 08 02 A6 */	mflr r0
/* 800D90A8 000D4FC8  90 01 00 04 */	stw r0, 4(r1)
/* 800D90AC 000D4FCC  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 800D90B0 000D4FD0  93 E1 00 2C */	stw r31, 0x2c(r1)
/* 800D90B4 000D4FD4  93 C1 00 28 */	stw r30, 0x28(r1)
/* 800D90B8 000D4FD8  93 A1 00 24 */	stw r29, 0x24(r1)
/* 800D90BC 000D4FDC  3B A3 00 00 */	addi r29, r3, 0
/* 800D90C0 000D4FE0  1C 9D 01 08 */	mulli r4, r29, 0x108
/* 800D90C4 000D4FE4  93 81 00 20 */	stw r28, 0x20(r1)
/* 800D90C8 000D4FE8  3C 60 80 2C */	lis r3, __CARDBlock@ha
/* 800D90CC 000D4FEC  38 03 7C 60 */	addi r0, r3, __CARDBlock@l
/* 800D90D0 000D4FF0  7C 60 22 14 */	add r3, r0, r4
/* 800D90D4 000D4FF4  80 03 00 24 */	lwz r0, 0x24(r3)
/* 800D90D8 000D4FF8  3B E3 00 00 */	addi r31, r3, 0
/* 800D90DC 000D4FFC  2C 00 00 00 */	cmpwi r0, 0
/* 800D90E0 000D5000  40 82 02 94 */	bne lbl_800D9374
/* 800D90E4 000D5004  38 7D 00 00 */	addi r3, r29, 0
/* 800D90E8 000D5008  38 81 00 18 */	addi r4, r1, 0x18
/* 800D90EC 000D500C  4B FF C4 1D */	bl __CARDReadNintendoID
/* 800D90F0 000D5010  7C 7E 1B 79 */	or. r30, r3, r3
/* 800D90F4 000D5014  41 80 03 1C */	blt lbl_800D9410
/* 800D90F8 000D5018  80 01 00 18 */	lwz r0, 0x18(r1)
/* 800D90FC 000D501C  3C 80 80 1F */	lis r4, lbl_801E8BE0@ha
/* 800D9100 000D5020  3C 60 80 1F */	lis r3, lbl_801E8C00@ha
/* 800D9104 000D5024  54 00 06 3A */	rlwinm r0, r0, 0, 0x18, 0x1d
/* 800D9108 000D5028  B0 1F 00 08 */	sth r0, 8(r31)
/* 800D910C 000D502C  38 03 8C 00 */	addi r0, r3, lbl_801E8C00@l
/* 800D9110 000D5030  38 84 8B E0 */	addi r4, r4, lbl_801E8BE0@l
/* 800D9114 000D5034  80 61 00 18 */	lwz r3, 0x18(r1)
/* 800D9118 000D5038  54 63 BE FA */	rlwinm r3, r3, 0x17, 0x1b, 0x1d
/* 800D911C 000D503C  7C 64 1A 14 */	add r3, r4, r3
/* 800D9120 000D5040  80 63 00 00 */	lwz r3, 0(r3)
/* 800D9124 000D5044  90 7F 00 0C */	stw r3, 0xc(r31)
/* 800D9128 000D5048  A0 9F 00 08 */	lhz r4, 8(r31)
/* 800D912C 000D504C  80 7F 00 0C */	lwz r3, 0xc(r31)
/* 800D9130 000D5050  54 84 A0 16 */	slwi r4, r4, 0x14
/* 800D9134 000D5054  7C 84 1E 70 */	srawi r4, r4, 3
/* 800D9138 000D5058  7C 84 01 94 */	addze r4, r4
/* 800D913C 000D505C  7C 64 1B D6 */	divw r3, r4, r3
/* 800D9140 000D5060  B0 7F 00 10 */	sth r3, 0x10(r31)
/* 800D9144 000D5064  80 61 00 18 */	lwz r3, 0x18(r1)
/* 800D9148 000D5068  54 63 D6 FA */	rlwinm r3, r3, 0x1a, 0x1b, 0x1d
/* 800D914C 000D506C  7C 60 1A 14 */	add r3, r0, r3
/* 800D9150 000D5070  80 03 00 00 */	lwz r0, 0(r3)
/* 800D9154 000D5074  90 1F 00 14 */	stw r0, 0x14(r31)
/* 800D9158 000D5078  80 1F 00 0C */	lwz r0, 0xc(r31)
/* 800D915C 000D507C  2C 00 00 00 */	cmpwi r0, 0
/* 800D9160 000D5080  41 82 00 10 */	beq lbl_800D9170
/* 800D9164 000D5084  A0 1F 00 10 */	lhz r0, 0x10(r31)
/* 800D9168 000D5088  28 00 00 08 */	cmplwi r0, 8
/* 800D916C 000D508C  40 80 00 0C */	bge lbl_800D9178
lbl_800D9170:
/* 800D9170 000D5090  3B C0 FF FE */	li r30, -2
/* 800D9174 000D5094  48 00 02 9C */	b lbl_800D9410
lbl_800D9178:
/* 800D9178 000D5098  7F A3 EB 78 */	mr r3, r29
/* 800D917C 000D509C  4B FF C6 49 */	bl __CARDClearStatus
/* 800D9180 000D50A0  7C 7E 1B 79 */	or. r30, r3, r3
/* 800D9184 000D50A4  41 80 02 8C */	blt lbl_800D9410
/* 800D9188 000D50A8  38 7D 00 00 */	addi r3, r29, 0
/* 800D918C 000D50AC  38 81 00 14 */	addi r4, r1, 0x14
/* 800D9190 000D50B0  4B FF C5 45 */	bl __CARDReadStatus
/* 800D9194 000D50B4  7C 7E 1B 79 */	or. r30, r3, r3
/* 800D9198 000D50B8  41 80 02 78 */	blt lbl_800D9410
/* 800D919C 000D50BC  7F A3 EB 78 */	mr r3, r29
/* 800D91A0 000D50C0  4B FE B5 65 */	bl __EXIProbe
/* 800D91A4 000D50C4  2C 03 00 00 */	cmpwi r3, 0
/* 800D91A8 000D50C8  40 82 00 0C */	bne lbl_800D91B4
/* 800D91AC 000D50CC  3B C0 FF FD */	li r30, -3
/* 800D91B0 000D50D0  48 00 02 60 */	b lbl_800D9410
lbl_800D91B4:
/* 800D91B4 000D50D4  88 01 00 14 */	lbz r0, 0x14(r1)
/* 800D91B8 000D50D8  54 00 06 73 */	rlwinm. r0, r0, 0, 0x19, 0x19
/* 800D91BC 000D50DC  40 82 01 14 */	bne lbl_800D92D0
/* 800D91C0 000D50E0  38 7D 00 00 */	addi r3, r29, 0
/* 800D91C4 000D50E4  38 9F 00 18 */	addi r4, r31, 0x18
/* 800D91C8 000D50E8  4B FF D6 85 */	bl __CARDUnlock
/* 800D91CC 000D50EC  7C 7E 1B 79 */	or. r30, r3, r3
/* 800D91D0 000D50F0  41 80 02 40 */	blt lbl_800D9410
/* 800D91D4 000D50F4  4B FE E9 A5 */	bl __OSLockSramEx
/* 800D91D8 000D50F8  1C 1D 00 0C */	mulli r0, r29, 0xc
/* 800D91DC 000D50FC  7C 83 02 14 */	add r4, r3, r0
/* 800D91E0 000D5100  88 1F 00 18 */	lbz r0, 0x18(r31)
/* 800D91E4 000D5104  38 BF 00 18 */	addi r5, r31, 0x18
/* 800D91E8 000D5108  98 04 00 00 */	stb r0, 0(r4)
/* 800D91EC 000D510C  39 05 00 02 */	addi r8, r5, 2
/* 800D91F0 000D5110  39 25 00 03 */	addi r9, r5, 3
/* 800D91F4 000D5114  88 FF 00 18 */	lbz r7, 0x18(r31)
/* 800D91F8 000D5118  39 45 00 04 */	addi r10, r5, 4
/* 800D91FC 000D511C  88 1F 00 19 */	lbz r0, 0x19(r31)
/* 800D9200 000D5120  39 65 00 05 */	addi r11, r5, 5
/* 800D9204 000D5124  39 85 00 06 */	addi r12, r5, 6
/* 800D9208 000D5128  98 04 00 01 */	stb r0, 1(r4)
/* 800D920C 000D512C  3B 85 00 07 */	addi r28, r5, 7
/* 800D9210 000D5130  38 A0 00 08 */	li r5, 8
/* 800D9214 000D5134  88 1F 00 19 */	lbz r0, 0x19(r31)
/* 800D9218 000D5138  88 C8 00 00 */	lbz r6, 0(r8)
/* 800D921C 000D513C  7C 07 02 14 */	add r0, r7, r0
/* 800D9220 000D5140  98 C4 00 02 */	stb r6, 2(r4)
/* 800D9224 000D5144  88 E8 00 00 */	lbz r7, 0(r8)
/* 800D9228 000D5148  88 C9 00 00 */	lbz r6, 0(r9)
/* 800D922C 000D514C  7C 00 3A 14 */	add r0, r0, r7
/* 800D9230 000D5150  98 C4 00 03 */	stb r6, 3(r4)
/* 800D9234 000D5154  88 E9 00 00 */	lbz r7, 0(r9)
/* 800D9238 000D5158  88 CA 00 00 */	lbz r6, 0(r10)
/* 800D923C 000D515C  7C 00 3A 14 */	add r0, r0, r7
/* 800D9240 000D5160  98 C4 00 04 */	stb r6, 4(r4)
/* 800D9244 000D5164  88 EA 00 00 */	lbz r7, 0(r10)
/* 800D9248 000D5168  88 CB 00 00 */	lbz r6, 0(r11)
/* 800D924C 000D516C  7C 00 3A 14 */	add r0, r0, r7
/* 800D9250 000D5170  98 C4 00 05 */	stb r6, 5(r4)
/* 800D9254 000D5174  88 EB 00 00 */	lbz r7, 0(r11)
/* 800D9258 000D5178  88 CC 00 00 */	lbz r6, 0(r12)
/* 800D925C 000D517C  7C 00 3A 14 */	add r0, r0, r7
/* 800D9260 000D5180  98 C4 00 06 */	stb r6, 6(r4)
/* 800D9264 000D5184  88 EC 00 00 */	lbz r7, 0(r12)
/* 800D9268 000D5188  88 DC 00 00 */	lbz r6, 0(r28)
/* 800D926C 000D518C  7C 00 3A 14 */	add r0, r0, r7
/* 800D9270 000D5190  98 C4 00 07 */	stb r6, 7(r4)
/* 800D9274 000D5194  88 DC 00 00 */	lbz r6, 0(r28)
/* 800D9278 000D5198  7C 00 32 14 */	add r0, r0, r6
/* 800D927C 000D519C  48 00 01 B0 */	b lbl_800D942C
lbl_800D9280:
/* 800D9280 000D51A0  20 85 00 0C */	subfic r4, r5, 0xc
/* 800D9284 000D51A4  2C 05 00 0C */	cmpwi r5, 0xc
/* 800D9288 000D51A8  7C 89 03 A6 */	mtctr r4
/* 800D928C 000D51AC  40 80 00 28 */	bge lbl_800D92B4
lbl_800D9290:
/* 800D9290 000D51B0  38 E5 00 18 */	addi r7, r5, 0x18
/* 800D9294 000D51B4  7C FF 3A 14 */	add r7, r31, r7
/* 800D9298 000D51B8  88 87 00 00 */	lbz r4, 0(r7)
/* 800D929C 000D51BC  38 A5 00 01 */	addi r5, r5, 1
/* 800D92A0 000D51C0  98 86 00 00 */	stb r4, 0(r6)
/* 800D92A4 000D51C4  38 C6 00 01 */	addi r6, r6, 1
/* 800D92A8 000D51C8  88 87 00 00 */	lbz r4, 0(r7)
/* 800D92AC 000D51CC  7C 00 22 14 */	add r0, r0, r4
/* 800D92B0 000D51D0  42 00 FF E0 */	bdnz lbl_800D9290
lbl_800D92B4:
/* 800D92B4 000D51D4  7C 63 EA 14 */	add r3, r3, r29
/* 800D92B8 000D51D8  7C 00 00 F8 */	nor r0, r0, r0
/* 800D92BC 000D51DC  98 03 00 26 */	stb r0, 0x26(r3)
/* 800D92C0 000D51E0  38 60 00 01 */	li r3, 1
/* 800D92C4 000D51E4  4B FE EC 3D */	bl __OSUnlockSramEx
/* 800D92C8 000D51E8  7F C3 F3 78 */	mr r3, r30
/* 800D92CC 000D51EC  48 00 01 70 */	b lbl_800D943C
lbl_800D92D0:
/* 800D92D0 000D51F0  38 00 00 01 */	li r0, 1
/* 800D92D4 000D51F4  90 1F 00 24 */	stw r0, 0x24(r31)
/* 800D92D8 000D51F8  4B FE E8 A1 */	bl __OSLockSramEx
/* 800D92DC 000D51FC  1C 1D 00 0C */	mulli r0, r29, 0xc
/* 800D92E0 000D5200  3B C3 00 00 */	addi r30, r3, 0
/* 800D92E4 000D5204  7C BE 02 14 */	add r5, r30, r0
/* 800D92E8 000D5208  88 85 00 00 */	lbz r4, 0(r5)
/* 800D92EC 000D520C  38 C0 00 08 */	li r6, 8
/* 800D92F0 000D5210  88 05 00 01 */	lbz r0, 1(r5)
/* 800D92F4 000D5214  88 65 00 02 */	lbz r3, 2(r5)
/* 800D92F8 000D5218  7F 84 02 14 */	add r28, r4, r0
/* 800D92FC 000D521C  88 05 00 03 */	lbz r0, 3(r5)
/* 800D9300 000D5220  7F 9C 1A 14 */	add r28, r28, r3
/* 800D9304 000D5224  88 65 00 04 */	lbz r3, 4(r5)
/* 800D9308 000D5228  7F 9C 02 14 */	add r28, r28, r0
/* 800D930C 000D522C  88 05 00 05 */	lbz r0, 5(r5)
/* 800D9310 000D5230  7F 9C 1A 14 */	add r28, r28, r3
/* 800D9314 000D5234  88 65 00 06 */	lbz r3, 6(r5)
/* 800D9318 000D5238  7F 9C 02 14 */	add r28, r28, r0
/* 800D931C 000D523C  88 05 00 07 */	lbz r0, 7(r5)
/* 800D9320 000D5240  7F 9C 1A 14 */	add r28, r28, r3
/* 800D9324 000D5244  7F 9C 02 14 */	add r28, r28, r0
/* 800D9328 000D5248  48 00 01 0C */	b lbl_800D9434
lbl_800D932C:
/* 800D932C 000D524C  20 06 00 0C */	subfic r0, r6, 0xc
/* 800D9330 000D5250  2C 06 00 0C */	cmpwi r6, 0xc
/* 800D9334 000D5254  7C 09 03 A6 */	mtctr r0
/* 800D9338 000D5258  40 80 00 14 */	bge lbl_800D934C
lbl_800D933C:
/* 800D933C 000D525C  88 03 00 00 */	lbz r0, 0(r3)
/* 800D9340 000D5260  38 63 00 01 */	addi r3, r3, 1
/* 800D9344 000D5264  7F 9C 02 14 */	add r28, r28, r0
/* 800D9348 000D5268  42 00 FF F4 */	bdnz lbl_800D933C
lbl_800D934C:
/* 800D934C 000D526C  38 60 00 00 */	li r3, 0
/* 800D9350 000D5270  4B FE EB B1 */	bl __OSUnlockSramEx
/* 800D9354 000D5274  7C 7E EA 14 */	add r3, r30, r29
/* 800D9358 000D5278  7F 80 E0 F8 */	nor r0, r28, r28
/* 800D935C 000D527C  88 63 00 26 */	lbz r3, 0x26(r3)
/* 800D9360 000D5280  54 00 06 3E */	clrlwi r0, r0, 0x18
/* 800D9364 000D5284  7C 03 00 40 */	cmplw r3, r0
/* 800D9368 000D5288  41 82 00 0C */	beq lbl_800D9374
/* 800D936C 000D528C  3B C0 FF FB */	li r30, -5
/* 800D9370 000D5290  48 00 00 A0 */	b lbl_800D9410
lbl_800D9374:
/* 800D9374 000D5294  80 1F 00 24 */	lwz r0, 0x24(r31)
/* 800D9378 000D5298  2C 00 00 01 */	cmpwi r0, 1
/* 800D937C 000D529C  40 82 00 48 */	bne lbl_800D93C4
/* 800D9380 000D52A0  38 00 00 02 */	li r0, 2
/* 800D9384 000D52A4  90 1F 00 24 */	stw r0, 0x24(r31)
/* 800D9388 000D52A8  38 7D 00 00 */	addi r3, r29, 0
/* 800D938C 000D52AC  38 80 00 01 */	li r4, 1
/* 800D9390 000D52B0  4B FF C2 85 */	bl __CARDEnableInterrupt
/* 800D9394 000D52B4  7C 7E 1B 79 */	or. r30, r3, r3
/* 800D9398 000D52B8  41 80 00 78 */	blt lbl_800D9410
/* 800D939C 000D52BC  3C 60 80 0D */	lis r3, __CARDExiHandler@ha
/* 800D93A0 000D52C0  38 83 52 C4 */	addi r4, r3, __CARDExiHandler@l
/* 800D93A4 000D52C4  38 7D 00 00 */	addi r3, r29, 0
/* 800D93A8 000D52C8  4B FE B2 E1 */	bl EXISetExiCallback
/* 800D93AC 000D52CC  7F A3 EB 78 */	mr r3, r29
/* 800D93B0 000D52D0  4B FE BE 11 */	bl EXIUnlock
/* 800D93B4 000D52D4  3C 80 00 01 */	lis r4, 0x0000A000@ha
/* 800D93B8 000D52D8  80 7F 00 80 */	lwz r3, 0x80(r31)
/* 800D93BC 000D52DC  38 84 A0 00 */	addi r4, r4, 0x0000A000@l
/* 800D93C0 000D52E0  4B FE 9B 71 */	bl DCInvalidateRange
lbl_800D93C4:
/* 800D93C4 000D52E4  80 9F 00 24 */	lwz r4, 0x24(r31)
/* 800D93C8 000D52E8  3C 60 80 0E */	lis r3, __CARDMountCallback@ha
/* 800D93CC 000D52EC  80 1F 00 0C */	lwz r0, 0xc(r31)
/* 800D93D0 000D52F0  38 E3 94 5C */	addi r7, r3, __CARDMountCallback@l
/* 800D93D4 000D52F4  38 64 FF FE */	addi r3, r4, -2
/* 800D93D8 000D52F8  7C 80 19 D6 */	mullw r4, r0, r3
/* 800D93DC 000D52FC  80 BF 00 80 */	lwz r5, 0x80(r31)
/* 800D93E0 000D5300  54 60 68 24 */	slwi r0, r3, 0xd
/* 800D93E4 000D5304  7C C5 02 14 */	add r6, r5, r0
/* 800D93E8 000D5308  38 7D 00 00 */	addi r3, r29, 0
/* 800D93EC 000D530C  38 A0 20 00 */	li r5, 0x2000
/* 800D93F0 000D5310  4B FF E4 09 */	bl __CARDRead
/* 800D93F4 000D5314  7C 7C 1B 79 */	or. r28, r3, r3
/* 800D93F8 000D5318  40 80 00 10 */	bge lbl_800D9408
/* 800D93FC 000D531C  38 7F 00 00 */	addi r3, r31, 0
/* 800D9400 000D5320  38 9C 00 00 */	addi r4, r28, 0
/* 800D9404 000D5324  4B FF CE 7D */	bl __CARDPutControlBlock
lbl_800D9408:
/* 800D9408 000D5328  7F 83 E3 78 */	mr r3, r28
/* 800D940C 000D532C  48 00 00 30 */	b lbl_800D943C
lbl_800D9410:
/* 800D9410 000D5330  7F A3 EB 78 */	mr r3, r29
/* 800D9414 000D5334  4B FE BD AD */	bl EXIUnlock
/* 800D9418 000D5338  38 7D 00 00 */	addi r3, r29, 0
/* 800D941C 000D533C  38 9E 00 00 */	addi r4, r30, 0
/* 800D9420 000D5340  48 00 03 15 */	bl DoUnmount
/* 800D9424 000D5344  7F C3 F3 78 */	mr r3, r30
/* 800D9428 000D5348  48 00 00 14 */	b lbl_800D943C
lbl_800D942C:
/* 800D942C 000D534C  38 C4 00 08 */	addi r6, r4, 8
/* 800D9430 000D5350  4B FF FE 50 */	b lbl_800D9280
lbl_800D9434:
/* 800D9434 000D5354  38 65 00 08 */	addi r3, r5, 8
/* 800D9438 000D5358  4B FF FE F4 */	b lbl_800D932C
lbl_800D943C:
/* 800D943C 000D535C  80 01 00 34 */	lwz r0, 0x34(r1)
/* 800D9440 000D5360  83 E1 00 2C */	lwz r31, 0x2c(r1)
/* 800D9444 000D5364  83 C1 00 28 */	lwz r30, 0x28(r1)
/* 800D9448 000D5368  7C 08 03 A6 */	mtlr r0
/* 800D944C 000D536C  83 A1 00 24 */	lwz r29, 0x24(r1)
/* 800D9450 000D5370  83 81 00 20 */	lwz r28, 0x20(r1)
/* 800D9454 000D5374  38 21 00 30 */	addi r1, r1, 0x30
/* 800D9458 000D5378  4E 80 00 20 */	blr

.global __CARDMountCallback
__CARDMountCallback:
/* 800D945C 000D537C  7C 08 02 A6 */	mflr r0
/* 800D9460 000D5380  90 01 00 04 */	stw r0, 4(r1)
/* 800D9464 000D5384  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 800D9468 000D5388  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 800D946C 000D538C  93 C1 00 18 */	stw r30, 0x18(r1)
/* 800D9470 000D5390  93 A1 00 14 */	stw r29, 0x14(r1)
/* 800D9474 000D5394  3B A4 00 00 */	addi r29, r4, 0
/* 800D9478 000D5398  2C 1D FF FD */	cmpwi r29, -3
/* 800D947C 000D539C  93 81 00 10 */	stw r28, 0x10(r1)
/* 800D9480 000D53A0  3B 83 00 00 */	addi r28, r3, 0
/* 800D9484 000D53A4  1C BC 01 08 */	mulli r5, r28, 0x108
/* 800D9488 000D53A8  3C 60 80 2C */	lis r3, __CARDBlock@ha
/* 800D948C 000D53AC  38 03 7C 60 */	addi r0, r3, __CARDBlock@l
/* 800D9490 000D53B0  7F E0 2A 14 */	add r31, r0, r5
/* 800D9494 000D53B4  41 82 00 78 */	beq lbl_800D950C
/* 800D9498 000D53B8  40 80 00 10 */	bge lbl_800D94A8
/* 800D949C 000D53BC  2C 1D FF FB */	cmpwi r29, -5
/* 800D94A0 000D53C0  41 82 00 6C */	beq lbl_800D950C
/* 800D94A4 000D53C4  48 00 00 74 */	b lbl_800D9518
lbl_800D94A8:
/* 800D94A8 000D53C8  2C 1D 00 01 */	cmpwi r29, 1
/* 800D94AC 000D53CC  41 82 00 4C */	beq lbl_800D94F8
/* 800D94B0 000D53D0  40 80 00 68 */	bge lbl_800D9518
/* 800D94B4 000D53D4  2C 1D 00 00 */	cmpwi r29, 0
/* 800D94B8 000D53D8  40 80 00 08 */	bge lbl_800D94C0
/* 800D94BC 000D53DC  48 00 00 5C */	b lbl_800D9518
lbl_800D94C0:
/* 800D94C0 000D53E0  80 7F 00 24 */	lwz r3, 0x24(r31)
/* 800D94C4 000D53E4  38 03 00 01 */	addi r0, r3, 1
/* 800D94C8 000D53E8  2C 00 00 07 */	cmpwi r0, 7
/* 800D94CC 000D53EC  90 1F 00 24 */	stw r0, 0x24(r31)
/* 800D94D0 000D53F0  40 80 00 18 */	bge lbl_800D94E8
/* 800D94D4 000D53F4  7F 83 E3 78 */	mr r3, r28
/* 800D94D8 000D53F8  4B FF FB CD */	bl DoMount
/* 800D94DC 000D53FC  7C 7D 1B 79 */	or. r29, r3, r3
/* 800D94E0 000D5400  41 80 00 38 */	blt lbl_800D9518
/* 800D94E4 000D5404  48 00 00 60 */	b lbl_800D9544
lbl_800D94E8:
/* 800D94E8 000D5408  7F E3 FB 78 */	mr r3, r31
/* 800D94EC 000D540C  4B FF F4 11 */	bl __CARDVerify
/* 800D94F0 000D5410  7C 7D 1B 78 */	mr r29, r3
/* 800D94F4 000D5414  48 00 00 24 */	b lbl_800D9518
lbl_800D94F8:
/* 800D94F8 000D5418  7F 83 E3 78 */	mr r3, r28
/* 800D94FC 000D541C  4B FF FB A9 */	bl DoMount
/* 800D9500 000D5420  7C 7D 1B 79 */	or. r29, r3, r3
/* 800D9504 000D5424  41 80 00 14 */	blt lbl_800D9518
/* 800D9508 000D5428  48 00 00 3C */	b lbl_800D9544
lbl_800D950C:
/* 800D950C 000D542C  38 7C 00 00 */	addi r3, r28, 0
/* 800D9510 000D5430  38 9D 00 00 */	addi r4, r29, 0
/* 800D9514 000D5434  48 00 02 21 */	bl DoUnmount
lbl_800D9518:
/* 800D9518 000D5438  83 DF 00 D0 */	lwz r30, 0xd0(r31)
/* 800D951C 000D543C  38 00 00 00 */	li r0, 0
/* 800D9520 000D5440  38 7F 00 00 */	addi r3, r31, 0
/* 800D9524 000D5444  90 1F 00 D0 */	stw r0, 0xd0(r31)
/* 800D9528 000D5448  7F A4 EB 78 */	mr r4, r29
/* 800D952C 000D544C  4B FF CD 55 */	bl __CARDPutControlBlock
/* 800D9530 000D5450  39 9E 00 00 */	addi r12, r30, 0
/* 800D9534 000D5454  7D 88 03 A6 */	mtlr r12
/* 800D9538 000D5458  38 7C 00 00 */	addi r3, r28, 0
/* 800D953C 000D545C  38 9D 00 00 */	addi r4, r29, 0
/* 800D9540 000D5460  4E 80 00 21 */	blrl
lbl_800D9544:
/* 800D9544 000D5464  80 01 00 24 */	lwz r0, 0x24(r1)
/* 800D9548 000D5468  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 800D954C 000D546C  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 800D9550 000D5470  7C 08 03 A6 */	mtlr r0
/* 800D9554 000D5474  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 800D9558 000D5478  83 81 00 10 */	lwz r28, 0x10(r1)
/* 800D955C 000D547C  38 21 00 20 */	addi r1, r1, 0x20
/* 800D9560 000D5480  4E 80 00 20 */	blr

.global CARDMountAsync
CARDMountAsync:
/* 800D9564 000D5484  7C 08 02 A6 */	mflr r0
/* 800D9568 000D5488  90 01 00 04 */	stw r0, 4(r1)
/* 800D956C 000D548C  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 800D9570 000D5490  BF 41 00 18 */	stmw r26, 0x18(r1)
/* 800D9574 000D5494  7C 7E 1B 79 */	or. r30, r3, r3
/* 800D9578 000D5498  3B 44 00 00 */	addi r26, r4, 0
/* 800D957C 000D549C  3B 65 00 00 */	addi r27, r5, 0
/* 800D9580 000D54A0  3B A6 00 00 */	addi r29, r6, 0
/* 800D9584 000D54A4  41 80 00 0C */	blt lbl_800D9590
/* 800D9588 000D54A8  2C 1E 00 02 */	cmpwi r30, 2
/* 800D958C 000D54AC  41 80 00 0C */	blt lbl_800D9598
lbl_800D9590:
/* 800D9590 000D54B0  38 60 FF 80 */	li r3, -128
/* 800D9594 000D54B4  48 00 01 44 */	b lbl_800D96D8
lbl_800D9598:
/* 800D9598 000D54B8  1C 9E 01 08 */	mulli r4, r30, 0x108
/* 800D959C 000D54BC  3C 60 80 2C */	lis r3, __CARDBlock@ha
/* 800D95A0 000D54C0  38 03 7C 60 */	addi r0, r3, __CARDBlock@l
/* 800D95A4 000D54C4  7F E0 22 14 */	add r31, r0, r4
/* 800D95A8 000D54C8  4B FE CB 15 */	bl OSDisableInterrupts
/* 800D95AC 000D54CC  80 1F 00 04 */	lwz r0, 4(r31)
/* 800D95B0 000D54D0  3B 83 00 00 */	addi r28, r3, 0
/* 800D95B4 000D54D4  2C 00 FF FF */	cmpwi r0, -1
/* 800D95B8 000D54D8  40 82 00 14 */	bne lbl_800D95CC
/* 800D95BC 000D54DC  7F 83 E3 78 */	mr r3, r28
/* 800D95C0 000D54E0  4B FE CB 25 */	bl OSRestoreInterrupts
/* 800D95C4 000D54E4  38 60 FF FF */	li r3, -1
/* 800D95C8 000D54E8  48 00 01 10 */	b lbl_800D96D8
lbl_800D95CC:
/* 800D95CC 000D54EC  80 1F 00 00 */	lwz r0, 0(r31)
/* 800D95D0 000D54F0  2C 00 00 00 */	cmpwi r0, 0
/* 800D95D4 000D54F4  40 82 00 24 */	bne lbl_800D95F8
/* 800D95D8 000D54F8  7F C3 F3 78 */	mr r3, r30
/* 800D95DC 000D54FC  4B FE BC C1 */	bl EXIGetStage
/* 800D95E0 000D5500  54 60 07 39 */	rlwinm. r0, r3, 0, 0x1c, 0x1c
/* 800D95E4 000D5504  41 82 00 14 */	beq lbl_800D95F8
/* 800D95E8 000D5508  7F 83 E3 78 */	mr r3, r28
/* 800D95EC 000D550C  4B FE CA F9 */	bl OSRestoreInterrupts
/* 800D95F0 000D5510  38 60 FF FE */	li r3, -2
/* 800D95F4 000D5514  48 00 00 E4 */	b lbl_800D96D8
lbl_800D95F8:
/* 800D95F8 000D5518  38 00 FF FF */	li r0, -1
/* 800D95FC 000D551C  90 1F 00 04 */	stw r0, 4(r31)
/* 800D9600 000D5520  28 1D 00 00 */	cmplwi r29, 0
/* 800D9604 000D5524  93 5F 00 80 */	stw r26, 0x80(r31)
/* 800D9608 000D5528  93 7F 00 C4 */	stw r27, 0xc4(r31)
/* 800D960C 000D552C  41 82 00 0C */	beq lbl_800D9618
/* 800D9610 000D5530  7F A0 EB 78 */	mr r0, r29
/* 800D9614 000D5534  48 00 00 0C */	b lbl_800D9620
lbl_800D9618:
/* 800D9618 000D5538  3C 60 80 0D */	lis r3, __CARDDefaultApiCallback@ha
/* 800D961C 000D553C  38 03 51 C0 */	addi r0, r3, __CARDDefaultApiCallback@l
lbl_800D9620:
/* 800D9620 000D5540  90 1F 00 D0 */	stw r0, 0xd0(r31)
/* 800D9624 000D5544  38 00 00 00 */	li r0, 0
/* 800D9628 000D5548  90 1F 00 CC */	stw r0, 0xcc(r31)
/* 800D962C 000D554C  80 1F 00 00 */	lwz r0, 0(r31)
/* 800D9630 000D5550  2C 00 00 00 */	cmpwi r0, 0
/* 800D9634 000D5554  40 82 00 34 */	bne lbl_800D9668
/* 800D9638 000D5558  3C 60 80 0D */	lis r3, __CARDExtHandler@ha
/* 800D963C 000D555C  38 83 51 F8 */	addi r4, r3, __CARDExtHandler@l
/* 800D9640 000D5560  38 7E 00 00 */	addi r3, r30, 0
/* 800D9644 000D5564  4B FE B2 89 */	bl EXIAttach
/* 800D9648 000D5568  2C 03 00 00 */	cmpwi r3, 0
/* 800D964C 000D556C  40 82 00 1C */	bne lbl_800D9668
/* 800D9650 000D5570  38 00 FF FD */	li r0, -3
/* 800D9654 000D5574  90 1F 00 04 */	stw r0, 4(r31)
/* 800D9658 000D5578  7F 83 E3 78 */	mr r3, r28
/* 800D965C 000D557C  4B FE CA 89 */	bl OSRestoreInterrupts
/* 800D9660 000D5580  38 60 FF FD */	li r3, -3
/* 800D9664 000D5584  48 00 00 74 */	b lbl_800D96D8
lbl_800D9668:
/* 800D9668 000D5588  3B A0 00 00 */	li r29, 0
/* 800D966C 000D558C  93 BF 00 24 */	stw r29, 0x24(r31)
/* 800D9670 000D5590  38 00 00 01 */	li r0, 1
/* 800D9674 000D5594  38 7E 00 00 */	addi r3, r30, 0
/* 800D9678 000D5598  90 1F 00 00 */	stw r0, 0(r31)
/* 800D967C 000D559C  38 80 00 00 */	li r4, 0
/* 800D9680 000D55A0  4B FE B0 09 */	bl EXISetExiCallback
/* 800D9684 000D55A4  38 7F 00 E0 */	addi r3, r31, 0xe0
/* 800D9688 000D55A8  4B FE 8C 21 */	bl OSCancelAlarm
/* 800D968C 000D55AC  93 BF 00 84 */	stw r29, 0x84(r31)
/* 800D9690 000D55B0  7F 83 E3 78 */	mr r3, r28
/* 800D9694 000D55B4  93 BF 00 88 */	stw r29, 0x88(r31)
/* 800D9698 000D55B8  4B FE CA 4D */	bl OSRestoreInterrupts
/* 800D969C 000D55BC  3C 60 80 0E */	lis r3, __CARDMountCallback@ha
/* 800D96A0 000D55C0  38 03 94 5C */	addi r0, r3, __CARDMountCallback@l
/* 800D96A4 000D55C4  3C 60 80 0D */	lis r3, __CARDUnlockedHandler@ha
/* 800D96A8 000D55C8  90 1F 00 DC */	stw r0, 0xdc(r31)
/* 800D96AC 000D55CC  38 A3 54 84 */	addi r5, r3, __CARDUnlockedHandler@l
/* 800D96B0 000D55D0  38 7E 00 00 */	addi r3, r30, 0
/* 800D96B4 000D55D4  38 80 00 00 */	li r4, 0
/* 800D96B8 000D55D8  4B FE BA 15 */	bl EXILock
/* 800D96BC 000D55DC  2C 03 00 00 */	cmpwi r3, 0
/* 800D96C0 000D55E0  40 82 00 0C */	bne lbl_800D96CC
/* 800D96C4 000D55E4  38 60 00 00 */	li r3, 0
/* 800D96C8 000D55E8  48 00 00 10 */	b lbl_800D96D8
lbl_800D96CC:
/* 800D96CC 000D55EC  93 BF 00 DC */	stw r29, 0xdc(r31)
/* 800D96D0 000D55F0  7F C3 F3 78 */	mr r3, r30
/* 800D96D4 000D55F4  4B FF F9 D1 */	bl DoMount
lbl_800D96D8:
/* 800D96D8 000D55F8  BB 41 00 18 */	lmw r26, 0x18(r1)
/* 800D96DC 000D55FC  80 01 00 34 */	lwz r0, 0x34(r1)
/* 800D96E0 000D5600  38 21 00 30 */	addi r1, r1, 0x30
/* 800D96E4 000D5604  7C 08 03 A6 */	mtlr r0
/* 800D96E8 000D5608  4E 80 00 20 */	blr

.global CARDMount
CARDMount:
/* 800D96EC 000D560C  7C 08 02 A6 */	mflr r0
/* 800D96F0 000D5610  3C C0 80 0D */	lis r6, __CARDSyncCallback@ha
/* 800D96F4 000D5614  90 01 00 04 */	stw r0, 4(r1)
/* 800D96F8 000D5618  38 C6 51 C4 */	addi r6, r6, __CARDSyncCallback@l
/* 800D96FC 000D561C  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 800D9700 000D5620  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 800D9704 000D5624  3B E3 00 00 */	addi r31, r3, 0
/* 800D9708 000D5628  4B FF FE 5D */	bl CARDMountAsync
/* 800D970C 000D562C  2C 03 00 00 */	cmpwi r3, 0
/* 800D9710 000D5630  40 80 00 08 */	bge lbl_800D9718
/* 800D9714 000D5634  48 00 00 0C */	b lbl_800D9720
lbl_800D9718:
/* 800D9718 000D5638  7F E3 FB 78 */	mr r3, r31
/* 800D971C 000D563C  4B FF CD 05 */	bl __CARDSync
lbl_800D9720:
/* 800D9720 000D5640  80 01 00 24 */	lwz r0, 0x24(r1)
/* 800D9724 000D5644  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 800D9728 000D5648  38 21 00 20 */	addi r1, r1, 0x20
/* 800D972C 000D564C  7C 08 03 A6 */	mtlr r0
/* 800D9730 000D5650  4E 80 00 20 */	blr

.global DoUnmount
DoUnmount:
/* 800D9734 000D5654  7C 08 02 A6 */	mflr r0
/* 800D9738 000D5658  90 01 00 04 */	stw r0, 4(r1)
/* 800D973C 000D565C  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 800D9740 000D5660  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 800D9744 000D5664  93 C1 00 18 */	stw r30, 0x18(r1)
/* 800D9748 000D5668  93 A1 00 14 */	stw r29, 0x14(r1)
/* 800D974C 000D566C  3B A4 00 00 */	addi r29, r4, 0
/* 800D9750 000D5670  93 81 00 10 */	stw r28, 0x10(r1)
/* 800D9754 000D5674  3B 83 00 00 */	addi r28, r3, 0
/* 800D9758 000D5678  1C BC 01 08 */	mulli r5, r28, 0x108
/* 800D975C 000D567C  3C 60 80 2C */	lis r3, __CARDBlock@ha
/* 800D9760 000D5680  38 03 7C 60 */	addi r0, r3, __CARDBlock@l
/* 800D9764 000D5684  7F E0 2A 14 */	add r31, r0, r5
/* 800D9768 000D5688  4B FE C9 55 */	bl OSDisableInterrupts
/* 800D976C 000D568C  80 1F 00 00 */	lwz r0, 0(r31)
/* 800D9770 000D5690  3B C3 00 00 */	addi r30, r3, 0
/* 800D9774 000D5694  2C 00 00 00 */	cmpwi r0, 0
/* 800D9778 000D5698  41 82 00 30 */	beq lbl_800D97A8
/* 800D977C 000D569C  38 7C 00 00 */	addi r3, r28, 0
/* 800D9780 000D56A0  38 80 00 00 */	li r4, 0
/* 800D9784 000D56A4  4B FE AF 05 */	bl EXISetExiCallback
/* 800D9788 000D56A8  7F 83 E3 78 */	mr r3, r28
/* 800D978C 000D56AC  4B FE B2 25 */	bl EXIDetach
/* 800D9790 000D56B0  38 7F 00 E0 */	addi r3, r31, 0xe0
/* 800D9794 000D56B4  4B FE 8B 15 */	bl OSCancelAlarm
/* 800D9798 000D56B8  38 00 00 00 */	li r0, 0
/* 800D979C 000D56BC  90 1F 00 00 */	stw r0, 0(r31)
/* 800D97A0 000D56C0  93 BF 00 04 */	stw r29, 4(r31)
/* 800D97A4 000D56C4  90 1F 00 24 */	stw r0, 0x24(r31)
lbl_800D97A8:
/* 800D97A8 000D56C8  7F C3 F3 78 */	mr r3, r30
/* 800D97AC 000D56CC  4B FE C9 39 */	bl OSRestoreInterrupts
/* 800D97B0 000D56D0  80 01 00 24 */	lwz r0, 0x24(r1)
/* 800D97B4 000D56D4  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 800D97B8 000D56D8  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 800D97BC 000D56DC  7C 08 03 A6 */	mtlr r0
/* 800D97C0 000D56E0  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 800D97C4 000D56E4  83 81 00 10 */	lwz r28, 0x10(r1)
/* 800D97C8 000D56E8  38 21 00 20 */	addi r1, r1, 0x20
/* 800D97CC 000D56EC  4E 80 00 20 */	blr

.global CARDUnmount
CARDUnmount:
/* 800D97D0 000D56F0  7C 08 02 A6 */	mflr r0
/* 800D97D4 000D56F4  90 01 00 04 */	stw r0, 4(r1)
/* 800D97D8 000D56F8  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 800D97DC 000D56FC  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 800D97E0 000D5700  38 81 00 0C */	addi r4, r1, 0xc
/* 800D97E4 000D5704  93 C1 00 18 */	stw r30, 0x18(r1)
/* 800D97E8 000D5708  93 A1 00 14 */	stw r29, 0x14(r1)
/* 800D97EC 000D570C  3B A3 00 00 */	addi r29, r3, 0
/* 800D97F0 000D5710  4B FF C9 E1 */	bl __CARDGetControlBlock
/* 800D97F4 000D5714  2C 03 00 00 */	cmpwi r3, 0
/* 800D97F8 000D5718  40 80 00 08 */	bge lbl_800D9800
/* 800D97FC 000D571C  48 00 00 64 */	b lbl_800D9860
lbl_800D9800:
/* 800D9800 000D5720  1C 9D 01 08 */	mulli r4, r29, 0x108
/* 800D9804 000D5724  3C 60 80 2C */	lis r3, __CARDBlock@ha
/* 800D9808 000D5728  38 03 7C 60 */	addi r0, r3, __CARDBlock@l
/* 800D980C 000D572C  7F C0 22 14 */	add r30, r0, r4
/* 800D9810 000D5730  4B FE C8 AD */	bl OSDisableInterrupts
/* 800D9814 000D5734  80 1E 00 00 */	lwz r0, 0(r30)
/* 800D9818 000D5738  3B E3 00 00 */	addi r31, r3, 0
/* 800D981C 000D573C  2C 00 00 00 */	cmpwi r0, 0
/* 800D9820 000D5740  41 82 00 34 */	beq lbl_800D9854
/* 800D9824 000D5744  38 7D 00 00 */	addi r3, r29, 0
/* 800D9828 000D5748  38 80 00 00 */	li r4, 0
/* 800D982C 000D574C  4B FE AE 5D */	bl EXISetExiCallback
/* 800D9830 000D5750  7F A3 EB 78 */	mr r3, r29
/* 800D9834 000D5754  4B FE B1 7D */	bl EXIDetach
/* 800D9838 000D5758  38 7E 00 E0 */	addi r3, r30, 0xe0
/* 800D983C 000D575C  4B FE 8A 6D */	bl OSCancelAlarm
/* 800D9840 000D5760  38 60 00 00 */	li r3, 0
/* 800D9844 000D5764  90 7E 00 00 */	stw r3, 0(r30)
/* 800D9848 000D5768  38 00 FF FD */	li r0, -3
/* 800D984C 000D576C  90 1E 00 04 */	stw r0, 4(r30)
/* 800D9850 000D5770  90 7E 00 24 */	stw r3, 0x24(r30)
lbl_800D9854:
/* 800D9854 000D5774  7F E3 FB 78 */	mr r3, r31
/* 800D9858 000D5778  4B FE C8 8D */	bl OSRestoreInterrupts
/* 800D985C 000D577C  38 60 00 00 */	li r3, 0
lbl_800D9860:
/* 800D9860 000D5780  80 01 00 24 */	lwz r0, 0x24(r1)
/* 800D9864 000D5784  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 800D9868 000D5788  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 800D986C 000D578C  7C 08 03 A6 */	mtlr r0
/* 800D9870 000D5790  83 A1 00 14 */	lwz r29, 0x14(r1)
/* 800D9874 000D5794  38 21 00 20 */	addi r1, r1, 0x20
/* 800D9878 000D5798  4E 80 00 20 */	blr
