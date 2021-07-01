.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global dataInitStack
dataInitStack:
/* 800F7E8C 000F3DAC  38 00 00 00 */	li r0, 0
/* 800F7E90 000F3DB0  B0 0D A4 E0 */	sth r0, lbl_802F26C0-_SDA_BASE_(r13)
/* 800F7E94 000F3DB4  4E 80 00 20 */	blr

.global InsertData
InsertData:
/* 800F7E98 000F3DB8  7C 08 02 A6 */	mflr r0
/* 800F7E9C 000F3DBC  90 01 00 04 */	stw r0, 4(r1)
/* 800F7EA0 000F3DC0  54 A0 06 3E */	clrlwi r0, r5, 0x18
/* 800F7EA4 000F3DC4  2C 00 00 02 */	cmpwi r0, 2
/* 800F7EA8 000F3DC8  94 21 FF F8 */	stwu r1, -8(r1)
/* 800F7EAC 000F3DCC  41 82 00 88 */	beq lbl_800F7F34
/* 800F7EB0 000F3DD0  40 80 00 14 */	bge lbl_800F7EC4
/* 800F7EB4 000F3DD4  2C 00 00 00 */	cmpwi r0, 0
/* 800F7EB8 000F3DD8  41 82 00 1C */	beq lbl_800F7ED4
/* 800F7EBC 000F3DDC  40 80 01 A8 */	bge lbl_800F8064
/* 800F7EC0 000F3DE0  48 00 01 B8 */	b lbl_800F8078
lbl_800F7EC4:
/* 800F7EC4 000F3DE4  2C 00 00 04 */	cmpwi r0, 4
/* 800F7EC8 000F3DE8  41 82 01 3C */	beq lbl_800F8004
/* 800F7ECC 000F3DEC  40 80 01 AC */	bge lbl_800F8078
/* 800F7ED0 000F3DF0  48 00 00 C8 */	b lbl_800F7F98
lbl_800F7ED4:
/* 800F7ED4 000F3DF4  28 06 00 00 */	cmplwi r6, 0
/* 800F7ED8 000F3DF8  40 82 00 54 */	bne lbl_800F7F2C
/* 800F7EDC 000F3DFC  80 04 00 00 */	lwz r0, 0(r4)
/* 800F7EE0 000F3E00  54 65 04 3E */	clrlwi r5, r3, 0x10
/* 800F7EE4 000F3E04  7C C4 02 14 */	add r6, r4, r0
/* 800F7EE8 000F3E08  48 00 00 1C */	b lbl_800F7F04
lbl_800F7EEC:
/* 800F7EEC 000F3E0C  A0 06 00 04 */	lhz r0, 4(r6)
/* 800F7EF0 000F3E10  7C 00 28 40 */	cmplw r0, r5
/* 800F7EF4 000F3E14  40 82 00 08 */	bne lbl_800F7EFC
/* 800F7EF8 000F3E18  48 00 00 20 */	b lbl_800F7F18
lbl_800F7EFC:
/* 800F7EFC 000F3E1C  80 06 00 00 */	lwz r0, 0(r6)
/* 800F7F00 000F3E20  7C C6 02 14 */	add r6, r6, r0
lbl_800F7F04:
/* 800F7F04 000F3E24  80 86 00 00 */	lwz r4, 0(r6)
/* 800F7F08 000F3E28  3C 04 00 01 */	addis r0, r4, 1
/* 800F7F0C 000F3E2C  28 00 FF FF */	cmplwi r0, 0xffff
/* 800F7F10 000F3E30  40 82 FF DC */	bne lbl_800F7EEC
/* 800F7F14 000F3E34  38 C0 00 00 */	li r6, 0
lbl_800F7F18:
/* 800F7F18 000F3E38  28 06 00 00 */	cmplwi r6, 0
/* 800F7F1C 000F3E3C  41 82 01 5C */	beq lbl_800F8078
/* 800F7F20 000F3E40  38 86 00 08 */	addi r4, r6, 8
/* 800F7F24 000F3E44  4B FF 99 FD */	bl dataInsertMacro
/* 800F7F28 000F3E48  48 00 01 50 */	b lbl_800F8078
lbl_800F7F2C:
/* 800F7F2C 000F3E4C  4B FF 9D 05 */	bl dataRemoveMacro
/* 800F7F30 000F3E50  48 00 01 48 */	b lbl_800F8078
lbl_800F7F34:
/* 800F7F34 000F3E54  28 06 00 00 */	cmplwi r6, 0
/* 800F7F38 000F3E58  60 63 40 00 */	ori r3, r3, 0x4000
/* 800F7F3C 000F3E5C  40 82 00 54 */	bne lbl_800F7F90
/* 800F7F40 000F3E60  80 04 00 08 */	lwz r0, 8(r4)
/* 800F7F44 000F3E64  54 65 04 3E */	clrlwi r5, r3, 0x10
/* 800F7F48 000F3E68  7C C4 02 14 */	add r6, r4, r0
/* 800F7F4C 000F3E6C  48 00 00 1C */	b lbl_800F7F68
lbl_800F7F50:
/* 800F7F50 000F3E70  A0 06 00 04 */	lhz r0, 4(r6)
/* 800F7F54 000F3E74  7C 00 28 40 */	cmplw r0, r5
/* 800F7F58 000F3E78  40 82 00 08 */	bne lbl_800F7F60
/* 800F7F5C 000F3E7C  48 00 00 20 */	b lbl_800F7F7C
lbl_800F7F60:
/* 800F7F60 000F3E80  80 06 00 00 */	lwz r0, 0(r6)
/* 800F7F64 000F3E84  7C C6 02 14 */	add r6, r6, r0
lbl_800F7F68:
/* 800F7F68 000F3E88  80 86 00 00 */	lwz r4, 0(r6)
/* 800F7F6C 000F3E8C  3C 04 00 01 */	addis r0, r4, 1
/* 800F7F70 000F3E90  28 00 FF FF */	cmplwi r0, 0xffff
/* 800F7F74 000F3E94  40 82 FF DC */	bne lbl_800F7F50
/* 800F7F78 000F3E98  38 C0 00 00 */	li r6, 0
lbl_800F7F7C:
/* 800F7F7C 000F3E9C  28 06 00 00 */	cmplwi r6, 0
/* 800F7F80 000F3EA0  41 82 00 F8 */	beq lbl_800F8078
/* 800F7F84 000F3EA4  38 86 00 08 */	addi r4, r6, 8
/* 800F7F88 000F3EA8  4B FF 86 5D */	bl dataInsertKeymap
/* 800F7F8C 000F3EAC  48 00 00 EC */	b lbl_800F8078
lbl_800F7F90:
/* 800F7F90 000F3EB0  4B FF 88 45 */	bl dataRemoveKeymap
/* 800F7F94 000F3EB4  48 00 00 E4 */	b lbl_800F8078
lbl_800F7F98:
/* 800F7F98 000F3EB8  28 06 00 00 */	cmplwi r6, 0
/* 800F7F9C 000F3EBC  60 63 80 00 */	ori r3, r3, 0x8000
/* 800F7FA0 000F3EC0  40 82 00 5C */	bne lbl_800F7FFC
/* 800F7FA4 000F3EC4  80 04 00 0C */	lwz r0, 0xc(r4)
/* 800F7FA8 000F3EC8  54 65 04 3E */	clrlwi r5, r3, 0x10
/* 800F7FAC 000F3ECC  7C C4 02 14 */	add r6, r4, r0
/* 800F7FB0 000F3ED0  48 00 00 1C */	b lbl_800F7FCC
lbl_800F7FB4:
/* 800F7FB4 000F3ED4  A0 06 00 04 */	lhz r0, 4(r6)
/* 800F7FB8 000F3ED8  7C 00 28 40 */	cmplw r0, r5
/* 800F7FBC 000F3EDC  40 82 00 08 */	bne lbl_800F7FC4
/* 800F7FC0 000F3EE0  48 00 00 20 */	b lbl_800F7FE0
lbl_800F7FC4:
/* 800F7FC4 000F3EE4  80 06 00 00 */	lwz r0, 0(r6)
/* 800F7FC8 000F3EE8  7C C6 02 14 */	add r6, r6, r0
lbl_800F7FCC:
/* 800F7FCC 000F3EEC  80 86 00 00 */	lwz r4, 0(r6)
/* 800F7FD0 000F3EF0  3C 04 00 01 */	addis r0, r4, 1
/* 800F7FD4 000F3EF4  28 00 FF FF */	cmplwi r0, 0xffff
/* 800F7FD8 000F3EF8  40 82 FF DC */	bne lbl_800F7FB4
/* 800F7FDC 000F3EFC  38 C0 00 00 */	li r6, 0
lbl_800F7FE0:
/* 800F7FE0 000F3F00  28 06 00 00 */	cmplwi r6, 0
/* 800F7FE4 000F3F04  41 82 00 94 */	beq lbl_800F8078
/* 800F7FE8 000F3F08  80 06 00 08 */	lwz r0, 8(r6)
/* 800F7FEC 000F3F0C  38 86 00 0C */	addi r4, r6, 0xc
/* 800F7FF0 000F3F10  54 05 04 3E */	clrlwi r5, r0, 0x10
/* 800F7FF4 000F3F14  4B FF 89 65 */	bl dataInsertLayer
/* 800F7FF8 000F3F18  48 00 00 80 */	b lbl_800F8078
lbl_800F7FFC:
/* 800F7FFC 000F3F1C  4B FF 8B A5 */	bl dataRemoveLayer
/* 800F8000 000F3F20  48 00 00 78 */	b lbl_800F8078
lbl_800F8004:
/* 800F8004 000F3F24  28 06 00 00 */	cmplwi r6, 0
/* 800F8008 000F3F28  40 82 00 54 */	bne lbl_800F805C
/* 800F800C 000F3F2C  80 04 00 04 */	lwz r0, 4(r4)
/* 800F8010 000F3F30  54 65 04 3E */	clrlwi r5, r3, 0x10
/* 800F8014 000F3F34  7C C4 02 14 */	add r6, r4, r0
/* 800F8018 000F3F38  48 00 00 1C */	b lbl_800F8034
lbl_800F801C:
/* 800F801C 000F3F3C  A0 06 00 04 */	lhz r0, 4(r6)
/* 800F8020 000F3F40  7C 00 28 40 */	cmplw r0, r5
/* 800F8024 000F3F44  40 82 00 08 */	bne lbl_800F802C
/* 800F8028 000F3F48  48 00 00 20 */	b lbl_800F8048
lbl_800F802C:
/* 800F802C 000F3F4C  80 06 00 00 */	lwz r0, 0(r6)
/* 800F8030 000F3F50  7C C6 02 14 */	add r6, r6, r0
lbl_800F8034:
/* 800F8034 000F3F54  80 86 00 00 */	lwz r4, 0(r6)
/* 800F8038 000F3F58  3C 04 00 01 */	addis r0, r4, 1
/* 800F803C 000F3F5C  28 00 FF FF */	cmplwi r0, 0xffff
/* 800F8040 000F3F60  40 82 FF DC */	bne lbl_800F801C
/* 800F8044 000F3F64  38 C0 00 00 */	li r6, 0
lbl_800F8048:
/* 800F8048 000F3F68  28 06 00 00 */	cmplwi r6, 0
/* 800F804C 000F3F6C  41 82 00 2C */	beq lbl_800F8078
/* 800F8050 000F3F70  38 86 00 08 */	addi r4, r6, 8
/* 800F8054 000F3F74  4B FF 8D 19 */	bl dataInsertCurve
/* 800F8058 000F3F78  48 00 00 20 */	b lbl_800F8078
lbl_800F805C:
/* 800F805C 000F3F7C  4B FF 8F 09 */	bl dataRemoveCurve
/* 800F8060 000F3F80  48 00 00 18 */	b lbl_800F8078
lbl_800F8064:
/* 800F8064 000F3F84  28 06 00 00 */	cmplwi r6, 0
/* 800F8068 000F3F88  40 82 00 0C */	bne lbl_800F8074
/* 800F806C 000F3F8C  4B FF 94 71 */	bl dataAddSampleReference
/* 800F8070 000F3F90  48 00 00 08 */	b lbl_800F8078
lbl_800F8074:
/* 800F8074 000F3F94  4B FF 95 41 */	bl dataRemoveSampleReference
lbl_800F8078:
/* 800F8078 000F3F98  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800F807C 000F3F9C  38 21 00 08 */	addi r1, r1, 8
/* 800F8080 000F3FA0  7C 08 03 A6 */	mtlr r0
/* 800F8084 000F3FA4  4E 80 00 20 */	blr

.global ScanIDList
ScanIDList:
/* 800F8088 000F3FA8  7C 08 02 A6 */	mflr r0
/* 800F808C 000F3FAC  90 01 00 04 */	stw r0, 4(r1)
/* 800F8090 000F3FB0  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 800F8094 000F3FB4  BF 61 00 1C */	stmw r27, 0x1c(r1)
/* 800F8098 000F3FB8  3B 63 00 00 */	addi r27, r3, 0
/* 800F809C 000F3FBC  3B 84 00 00 */	addi r28, r4, 0
/* 800F80A0 000F3FC0  3B A5 00 00 */	addi r29, r5, 0
/* 800F80A4 000F3FC4  3B C6 00 00 */	addi r30, r6, 0
/* 800F80A8 000F3FC8  48 00 00 5C */	b lbl_800F8104
lbl_800F80AC:
/* 800F80AC 000F3FCC  54 60 04 21 */	rlwinm. r0, r3, 0, 0x10, 0x10
/* 800F80B0 000F3FD0  41 82 00 3C */	beq lbl_800F80EC
/* 800F80B4 000F3FD4  54 7F 04 BE */	clrlwi r31, r3, 0x12
/* 800F80B8 000F3FD8  48 00 00 1C */	b lbl_800F80D4
lbl_800F80BC:
/* 800F80BC 000F3FDC  38 7F 00 00 */	addi r3, r31, 0
/* 800F80C0 000F3FE0  38 9C 00 00 */	addi r4, r28, 0
/* 800F80C4 000F3FE4  38 BD 00 00 */	addi r5, r29, 0
/* 800F80C8 000F3FE8  38 DE 00 00 */	addi r6, r30, 0
/* 800F80CC 000F3FEC  4B FF FD CD */	bl InsertData
/* 800F80D0 000F3FF0  3B FF 00 01 */	addi r31, r31, 1
lbl_800F80D4:
/* 800F80D4 000F3FF4  A0 1B 00 02 */	lhz r0, 2(r27)
/* 800F80D8 000F3FF8  57 E3 04 3E */	clrlwi r3, r31, 0x10
/* 800F80DC 000F3FFC  7C 03 00 40 */	cmplw r3, r0
/* 800F80E0 000F4000  40 81 FF DC */	ble lbl_800F80BC
/* 800F80E4 000F4004  3B 7B 00 04 */	addi r27, r27, 4
/* 800F80E8 000F4008  48 00 00 1C */	b lbl_800F8104
lbl_800F80EC:
/* 800F80EC 000F400C  A0 7B 00 00 */	lhz r3, 0(r27)
/* 800F80F0 000F4010  38 9C 00 00 */	addi r4, r28, 0
/* 800F80F4 000F4014  38 BD 00 00 */	addi r5, r29, 0
/* 800F80F8 000F4018  38 DE 00 00 */	addi r6, r30, 0
/* 800F80FC 000F401C  3B 7B 00 02 */	addi r27, r27, 2
/* 800F8100 000F4020  4B FF FD 99 */	bl InsertData
lbl_800F8104:
/* 800F8104 000F4024  A0 7B 00 00 */	lhz r3, 0(r27)
/* 800F8108 000F4028  28 03 FF FF */	cmplwi r3, 0xffff
/* 800F810C 000F402C  40 82 FF A0 */	bne lbl_800F80AC
/* 800F8110 000F4030  BB 61 00 1C */	lmw r27, 0x1c(r1)
/* 800F8114 000F4034  80 01 00 34 */	lwz r0, 0x34(r1)
/* 800F8118 000F4038  38 21 00 30 */	addi r1, r1, 0x30
/* 800F811C 000F403C  7C 08 03 A6 */	mtlr r0
/* 800F8120 000F4040  4E 80 00 20 */	blr

.global ScanIDListReverse
ScanIDListReverse:
/* 800F8124 000F4044  7C 08 02 A6 */	mflr r0
/* 800F8128 000F4048  90 01 00 04 */	stw r0, 4(r1)
/* 800F812C 000F404C  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 800F8130 000F4050  BF 41 00 18 */	stmw r26, 0x18(r1)
/* 800F8134 000F4054  7C 7A 1B 78 */	mr r26, r3
/* 800F8138 000F4058  3B 64 00 00 */	addi r27, r4, 0
/* 800F813C 000F405C  3B 85 00 00 */	addi r28, r5, 0
/* 800F8140 000F4060  3B A6 00 00 */	addi r29, r6, 0
/* 800F8144 000F4064  A0 03 00 00 */	lhz r0, 0(r3)
/* 800F8148 000F4068  28 00 FF FF */	cmplwi r0, 0xffff
/* 800F814C 000F406C  41 82 00 B4 */	beq lbl_800F8200
/* 800F8150 000F4070  7F 5E D3 78 */	mr r30, r26
/* 800F8154 000F4074  48 00 00 08 */	b lbl_800F815C
lbl_800F8158:
/* 800F8158 000F4078  3B DE 00 02 */	addi r30, r30, 2
lbl_800F815C:
/* 800F815C 000F407C  A0 1E 00 00 */	lhz r0, 0(r30)
/* 800F8160 000F4080  28 00 FF FF */	cmplwi r0, 0xffff
/* 800F8164 000F4084  40 82 FF F4 */	bne lbl_800F8158
/* 800F8168 000F4088  3B DE FF FE */	addi r30, r30, -2
/* 800F816C 000F408C  48 00 00 8C */	b lbl_800F81F8
lbl_800F8170:
/* 800F8170 000F4090  7C 1E D0 40 */	cmplw r30, r26
/* 800F8174 000F4094  41 82 00 6C */	beq lbl_800F81E0
/* 800F8178 000F4098  A0 1E FF FE */	lhz r0, -2(r30)
/* 800F817C 000F409C  54 00 04 21 */	rlwinm. r0, r0, 0, 0x10, 0x10
/* 800F8180 000F40A0  41 82 00 44 */	beq lbl_800F81C4
/* 800F8184 000F40A4  AB FE 00 00 */	lha r31, 0(r30)
/* 800F8188 000F40A8  48 00 00 1C */	b lbl_800F81A4
lbl_800F818C:
/* 800F818C 000F40AC  38 7F 00 00 */	addi r3, r31, 0
/* 800F8190 000F40B0  38 9B 00 00 */	addi r4, r27, 0
/* 800F8194 000F40B4  38 BC 00 00 */	addi r5, r28, 0
/* 800F8198 000F40B8  38 DD 00 00 */	addi r6, r29, 0
/* 800F819C 000F40BC  4B FF FC FD */	bl InsertData
/* 800F81A0 000F40C0  3B FF FF FF */	addi r31, r31, -1
lbl_800F81A4:
/* 800F81A4 000F40C4  A0 1E FF FE */	lhz r0, -2(r30)
/* 800F81A8 000F40C8  7F E3 07 34 */	extsh r3, r31
/* 800F81AC 000F40CC  54 00 04 BE */	clrlwi r0, r0, 0x12
/* 800F81B0 000F40D0  7C 00 07 34 */	extsh r0, r0
/* 800F81B4 000F40D4  7C 03 00 00 */	cmpw r3, r0
/* 800F81B8 000F40D8  40 80 FF D4 */	bge lbl_800F818C
/* 800F81BC 000F40DC  3B DE FF FC */	addi r30, r30, -4
/* 800F81C0 000F40E0  48 00 00 38 */	b lbl_800F81F8
lbl_800F81C4:
/* 800F81C4 000F40E4  A0 7E 00 00 */	lhz r3, 0(r30)
/* 800F81C8 000F40E8  38 9B 00 00 */	addi r4, r27, 0
/* 800F81CC 000F40EC  38 BC 00 00 */	addi r5, r28, 0
/* 800F81D0 000F40F0  38 DD 00 00 */	addi r6, r29, 0
/* 800F81D4 000F40F4  4B FF FC C5 */	bl InsertData
/* 800F81D8 000F40F8  3B DE FF FE */	addi r30, r30, -2
/* 800F81DC 000F40FC  48 00 00 1C */	b lbl_800F81F8
lbl_800F81E0:
/* 800F81E0 000F4100  A0 7E 00 00 */	lhz r3, 0(r30)
/* 800F81E4 000F4104  38 9B 00 00 */	addi r4, r27, 0
/* 800F81E8 000F4108  38 BC 00 00 */	addi r5, r28, 0
/* 800F81EC 000F410C  38 DD 00 00 */	addi r6, r29, 0
/* 800F81F0 000F4110  4B FF FC A9 */	bl InsertData
/* 800F81F4 000F4114  3B DE FF FE */	addi r30, r30, -2
lbl_800F81F8:
/* 800F81F8 000F4118  7C 1E D0 40 */	cmplw r30, r26
/* 800F81FC 000F411C  40 80 FF 74 */	bge lbl_800F8170
lbl_800F8200:
/* 800F8200 000F4120  BB 41 00 18 */	lmw r26, 0x18(r1)
/* 800F8204 000F4124  80 01 00 34 */	lwz r0, 0x34(r1)
/* 800F8208 000F4128  38 21 00 30 */	addi r1, r1, 0x30
/* 800F820C 000F412C  7C 08 03 A6 */	mtlr r0
/* 800F8210 000F4130  4E 80 00 20 */	blr

.global sndPushGroup
sndPushGroup:
/* 800F8214 000F4134  7C 08 02 A6 */	mflr r0
/* 800F8218 000F4138  90 01 00 04 */	stw r0, 4(r1)
/* 800F821C 000F413C  94 21 FF C8 */	stwu r1, -0x38(r1)
/* 800F8220 000F4140  BF 41 00 20 */	stmw r26, 0x20(r1)
/* 800F8224 000F4144  3B 63 00 00 */	addi r27, r3, 0
/* 800F8228 000F4148  3B 84 00 00 */	addi r28, r4, 0
/* 800F822C 000F414C  3B A6 00 00 */	addi r29, r6, 0
/* 800F8230 000F4150  3B C7 00 00 */	addi r30, r7, 0
/* 800F8234 000F4154  88 0D A4 18 */	lbz r0, sndActive_2-_SDA_BASE_(r13)
/* 800F8238 000F4158  28 00 00 00 */	cmplwi r0, 0
/* 800F823C 000F415C  41 82 01 2C */	beq lbl_800F8368
/* 800F8240 000F4160  A8 CD A4 E0 */	lha r6, lbl_802F26C0-_SDA_BASE_(r13)
/* 800F8244 000F4164  2C 06 00 80 */	cmpwi r6, 0x80
/* 800F8248 000F4168  40 80 01 20 */	bge lbl_800F8368
/* 800F824C 000F416C  3B FB 00 00 */	addi r31, r27, 0
/* 800F8250 000F4170  57 84 04 3E */	clrlwi r4, r28, 0x10
/* 800F8254 000F4174  48 00 01 04 */	b lbl_800F8358
lbl_800F8258:
/* 800F8258 000F4178  A0 1F 00 04 */	lhz r0, 4(r31)
/* 800F825C 000F417C  7C 00 20 40 */	cmplw r0, r4
/* 800F8260 000F4180  40 82 00 F0 */	bne lbl_800F8350
/* 800F8264 000F4184  3C 60 80 2E */	lis r3, lbl_802E3DB0@ha
/* 800F8268 000F4188  38 03 3D B0 */	addi r0, r3, lbl_802E3DB0@l
/* 800F826C 000F418C  54 C4 18 38 */	slwi r4, r6, 3
/* 800F8270 000F4190  7C 80 22 14 */	add r4, r0, r4
/* 800F8274 000F4194  93 E4 00 00 */	stw r31, 0(r4)
/* 800F8278 000F4198  7C A3 2B 78 */	mr r3, r5
/* 800F827C 000F419C  93 64 00 04 */	stw r27, 4(r4)
/* 800F8280 000F41A0  80 1F 00 0C */	lwz r0, 0xc(r31)
/* 800F8284 000F41A4  7F 5B 02 14 */	add r26, r27, r0
/* 800F8288 000F41A8  48 00 80 1D */	bl hwTransAddr
/* 800F828C 000F41AC  38 83 00 00 */	addi r4, r3, 0
/* 800F8290 000F41B0  38 7D 00 00 */	addi r3, r29, 0
/* 800F8294 000F41B4  4B FF 8E 55 */	bl dataInsertSDir
/* 800F8298 000F41B8  28 03 00 00 */	cmplwi r3, 0
/* 800F829C 000F41BC  41 82 00 18 */	beq lbl_800F82B4
/* 800F82A0 000F41C0  38 7A 00 00 */	addi r3, r26, 0
/* 800F82A4 000F41C4  38 9D 00 00 */	addi r4, r29, 0
/* 800F82A8 000F41C8  38 A0 00 01 */	li r5, 1
/* 800F82AC 000F41CC  38 C0 00 00 */	li r6, 0
/* 800F82B0 000F41D0  4B FF FD D9 */	bl ScanIDList
lbl_800F82B4:
/* 800F82B4 000F41D4  80 1F 00 08 */	lwz r0, 8(r31)
/* 800F82B8 000F41D8  38 9E 00 00 */	addi r4, r30, 0
/* 800F82BC 000F41DC  38 A0 00 00 */	li r5, 0
/* 800F82C0 000F41E0  7C 7B 02 14 */	add r3, r27, r0
/* 800F82C4 000F41E4  38 C0 00 00 */	li r6, 0
/* 800F82C8 000F41E8  4B FF FD C1 */	bl ScanIDList
/* 800F82CC 000F41EC  80 1F 00 10 */	lwz r0, 0x10(r31)
/* 800F82D0 000F41F0  38 9E 00 00 */	addi r4, r30, 0
/* 800F82D4 000F41F4  38 A0 00 04 */	li r5, 4
/* 800F82D8 000F41F8  7C 7B 02 14 */	add r3, r27, r0
/* 800F82DC 000F41FC  38 C0 00 00 */	li r6, 0
/* 800F82E0 000F4200  4B FF FD A9 */	bl ScanIDList
/* 800F82E4 000F4204  80 1F 00 14 */	lwz r0, 0x14(r31)
/* 800F82E8 000F4208  38 9E 00 00 */	addi r4, r30, 0
/* 800F82EC 000F420C  38 A0 00 02 */	li r5, 2
/* 800F82F0 000F4210  7C 7B 02 14 */	add r3, r27, r0
/* 800F82F4 000F4214  38 C0 00 00 */	li r6, 0
/* 800F82F8 000F4218  4B FF FD 91 */	bl ScanIDList
/* 800F82FC 000F421C  80 1F 00 18 */	lwz r0, 0x18(r31)
/* 800F8300 000F4220  38 9E 00 00 */	addi r4, r30, 0
/* 800F8304 000F4224  38 A0 00 03 */	li r5, 3
/* 800F8308 000F4228  7C 7B 02 14 */	add r3, r27, r0
/* 800F830C 000F422C  38 C0 00 00 */	li r6, 0
/* 800F8310 000F4230  4B FF FD 79 */	bl ScanIDList
/* 800F8314 000F4234  A0 1F 00 06 */	lhz r0, 6(r31)
/* 800F8318 000F4238  28 00 00 01 */	cmplwi r0, 1
/* 800F831C 000F423C  40 82 00 1C */	bne lbl_800F8338
/* 800F8320 000F4240  80 1F 00 1C */	lwz r0, 0x1c(r31)
/* 800F8324 000F4244  38 7C 00 00 */	addi r3, r28, 0
/* 800F8328 000F4248  7C 9B 02 14 */	add r4, r27, r0
/* 800F832C 000F424C  A0 A4 00 00 */	lhz r5, 0(r4)
/* 800F8330 000F4250  38 84 00 04 */	addi r4, r4, 4
/* 800F8334 000F4254  4B FF 93 69 */	bl dataInsertFX
lbl_800F8338:
/* 800F8338 000F4258  48 00 81 09 */	bl hwSyncSampleMem
/* 800F833C 000F425C  A8 8D A4 E0 */	lha r4, lbl_802F26C0-_SDA_BASE_(r13)
/* 800F8340 000F4260  38 60 00 01 */	li r3, 1
/* 800F8344 000F4264  38 04 00 01 */	addi r0, r4, 1
/* 800F8348 000F4268  B0 0D A4 E0 */	sth r0, lbl_802F26C0-_SDA_BASE_(r13)
/* 800F834C 000F426C  48 00 00 20 */	b lbl_800F836C
lbl_800F8350:
/* 800F8350 000F4270  80 1F 00 00 */	lwz r0, 0(r31)
/* 800F8354 000F4274  7F FB 02 14 */	add r31, r27, r0
lbl_800F8358:
/* 800F8358 000F4278  80 7F 00 00 */	lwz r3, 0(r31)
/* 800F835C 000F427C  3C 03 00 01 */	addis r0, r3, 1
/* 800F8360 000F4280  28 00 FF FF */	cmplwi r0, 0xffff
/* 800F8364 000F4284  40 82 FE F4 */	bne lbl_800F8258
lbl_800F8368:
/* 800F8368 000F4288  38 60 00 00 */	li r3, 0
lbl_800F836C:
/* 800F836C 000F428C  BB 41 00 20 */	lmw r26, 0x20(r1)
/* 800F8370 000F4290  80 01 00 3C */	lwz r0, 0x3c(r1)
/* 800F8374 000F4294  38 21 00 38 */	addi r1, r1, 0x38
/* 800F8378 000F4298  7C 08 03 A6 */	mtlr r0
/* 800F837C 000F429C  4E 80 00 20 */	blr

.global sndPopGroup
sndPopGroup:
/* 800F8380 000F42A0  7C 08 02 A6 */	mflr r0
/* 800F8384 000F42A4  3C 60 80 2E */	lis r3, lbl_802E3DB0@ha
/* 800F8388 000F42A8  90 01 00 04 */	stw r0, 4(r1)
/* 800F838C 000F42AC  38 83 3D B0 */	addi r4, r3, lbl_802E3DB0@l
/* 800F8390 000F42B0  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800F8394 000F42B4  93 E1 00 0C */	stw r31, 0xc(r1)
/* 800F8398 000F42B8  93 C1 00 08 */	stw r30, 8(r1)
/* 800F839C 000F42BC  A8 AD A4 E0 */	lha r5, lbl_802F26C0-_SDA_BASE_(r13)
/* 800F83A0 000F42C0  38 65 FF FF */	addi r3, r5, -1
/* 800F83A4 000F42C4  7C 60 07 34 */	extsh r0, r3
/* 800F83A8 000F42C8  B0 6D A4 E0 */	sth r3, lbl_802F26C0-_SDA_BASE_(r13)
/* 800F83AC 000F42CC  54 00 18 38 */	slwi r0, r0, 3
/* 800F83B0 000F42D0  7C 64 02 14 */	add r3, r4, r0
/* 800F83B4 000F42D4  A8 0D A4 E0 */	lha r0, lbl_802F26C0-_SDA_BASE_(r13)
/* 800F83B8 000F42D8  83 E3 00 00 */	lwz r31, 0(r3)
/* 800F83BC 000F42DC  54 03 18 38 */	slwi r3, r0, 3
/* 800F83C0 000F42E0  A0 1F 00 06 */	lhz r0, 6(r31)
/* 800F83C4 000F42E4  7C 64 1A 14 */	add r3, r4, r3
/* 800F83C8 000F42E8  83 C3 00 04 */	lwz r30, 4(r3)
/* 800F83CC 000F42EC  28 00 00 01 */	cmplwi r0, 1
/* 800F83D0 000F42F0  40 82 00 1C */	bne lbl_800F83EC
/* 800F83D4 000F42F4  80 1F 00 1C */	lwz r0, 0x1c(r31)
/* 800F83D8 000F42F8  7C 7E 02 14 */	add r3, r30, r0
/* 800F83DC 000F42FC  A0 83 00 00 */	lhz r4, 0(r3)
/* 800F83E0 000F4300  38 63 00 04 */	addi r3, r3, 4
/* 800F83E4 000F4304  48 00 49 9D */	bl s3dKillEmitterByFXID
/* 800F83E8 000F4308  48 00 00 0C */	b lbl_800F83F4
lbl_800F83EC:
/* 800F83EC 000F430C  A0 7F 00 04 */	lhz r3, 4(r31)
/* 800F83F0 000F4310  4B FF 14 51 */	bl seqKillInstancesByGroupID
lbl_800F83F4:
/* 800F83F4 000F4314  80 1F 00 08 */	lwz r0, 8(r31)
/* 800F83F8 000F4318  7C 7E 02 14 */	add r3, r30, r0
/* 800F83FC 000F431C  4B FF EE 7D */	bl synthKillVoicesByMacroReferences
/* 800F8400 000F4320  80 1F 00 0C */	lwz r0, 0xc(r31)
/* 800F8404 000F4324  38 80 00 00 */	li r4, 0
/* 800F8408 000F4328  38 A0 00 01 */	li r5, 1
/* 800F840C 000F432C  7C 7E 02 14 */	add r3, r30, r0
/* 800F8410 000F4330  38 C0 00 01 */	li r6, 1
/* 800F8414 000F4334  4B FF FD 11 */	bl ScanIDListReverse
/* 800F8418 000F4338  80 1F 00 08 */	lwz r0, 8(r31)
/* 800F841C 000F433C  38 80 00 00 */	li r4, 0
/* 800F8420 000F4340  38 A0 00 00 */	li r5, 0
/* 800F8424 000F4344  7C 7E 02 14 */	add r3, r30, r0
/* 800F8428 000F4348  38 C0 00 01 */	li r6, 1
/* 800F842C 000F434C  4B FF FC 5D */	bl ScanIDList
/* 800F8430 000F4350  80 1F 00 10 */	lwz r0, 0x10(r31)
/* 800F8434 000F4354  38 80 00 00 */	li r4, 0
/* 800F8438 000F4358  38 A0 00 04 */	li r5, 4
/* 800F843C 000F435C  7C 7E 02 14 */	add r3, r30, r0
/* 800F8440 000F4360  38 C0 00 01 */	li r6, 1
/* 800F8444 000F4364  4B FF FC 45 */	bl ScanIDList
/* 800F8448 000F4368  80 1F 00 14 */	lwz r0, 0x14(r31)
/* 800F844C 000F436C  38 80 00 00 */	li r4, 0
/* 800F8450 000F4370  38 A0 00 02 */	li r5, 2
/* 800F8454 000F4374  7C 7E 02 14 */	add r3, r30, r0
/* 800F8458 000F4378  38 C0 00 01 */	li r6, 1
/* 800F845C 000F437C  4B FF FC 2D */	bl ScanIDList
/* 800F8460 000F4380  80 1F 00 18 */	lwz r0, 0x18(r31)
/* 800F8464 000F4384  38 80 00 00 */	li r4, 0
/* 800F8468 000F4388  38 A0 00 03 */	li r5, 3
/* 800F846C 000F438C  7C 7E 02 14 */	add r3, r30, r0
/* 800F8470 000F4390  38 C0 00 01 */	li r6, 1
/* 800F8474 000F4394  4B FF FC 15 */	bl ScanIDList
/* 800F8478 000F4398  A0 1F 00 06 */	lhz r0, 6(r31)
/* 800F847C 000F439C  28 00 00 01 */	cmplwi r0, 1
/* 800F8480 000F43A0  40 82 00 0C */	bne lbl_800F848C
/* 800F8484 000F43A4  A0 7F 00 04 */	lhz r3, 4(r31)
/* 800F8488 000F43A8  4B FF 93 3D */	bl dataRemoveFX
lbl_800F848C:
/* 800F848C 000F43AC  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800F8490 000F43B0  38 60 00 01 */	li r3, 1
/* 800F8494 000F43B4  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 800F8498 000F43B8  83 C1 00 08 */	lwz r30, 8(r1)
/* 800F849C 000F43BC  7C 08 03 A6 */	mtlr r0
/* 800F84A0 000F43C0  38 21 00 10 */	addi r1, r1, 0x10
/* 800F84A4 000F43C4  4E 80 00 20 */	blr

.global seqPlaySong
seqPlaySong:
/* 800F84A8 000F43C8  7C 08 02 A6 */	mflr r0
/* 800F84AC 000F43CC  3D 20 80 2E */	lis r9, lbl_802E3DB0@ha
/* 800F84B0 000F43D0  90 01 00 04 */	stw r0, 4(r1)
/* 800F84B4 000F43D4  39 29 3D B0 */	addi r9, r9, lbl_802E3DB0@l
/* 800F84B8 000F43D8  94 21 FF C0 */	stwu r1, -0x40(r1)
/* 800F84BC 000F43DC  BF 21 00 24 */	stmw r25, 0x24(r1)
/* 800F84C0 000F43E0  3B A5 00 00 */	addi r29, r5, 0
/* 800F84C4 000F43E4  3B C6 00 00 */	addi r30, r6, 0
/* 800F84C8 000F43E8  3B E8 00 00 */	addi r31, r8, 0
/* 800F84CC 000F43EC  3B 83 00 00 */	addi r28, r3, 0
/* 800F84D0 000F43F0  38 C9 00 00 */	addi r6, r9, 0
/* 800F84D4 000F43F4  54 65 04 3E */	clrlwi r5, r3, 0x10
/* 800F84D8 000F43F8  39 00 00 00 */	li r8, 0
/* 800F84DC 000F43FC  A8 0D A4 E0 */	lha r0, lbl_802F26C0-_SDA_BASE_(r13)
/* 800F84E0 000F4400  2C 00 00 00 */	cmpwi r0, 0
/* 800F84E4 000F4404  7C 09 03 A6 */	mtctr r0
/* 800F84E8 000F4408  40 81 00 E8 */	ble lbl_800F85D0
lbl_800F84EC:
/* 800F84EC 000F440C  80 66 00 00 */	lwz r3, 0(r6)
/* 800F84F0 000F4410  A0 03 00 04 */	lhz r0, 4(r3)
/* 800F84F4 000F4414  7C 05 00 40 */	cmplw r5, r0
/* 800F84F8 000F4418  40 82 00 CC */	bne lbl_800F85C4
/* 800F84FC 000F441C  55 03 18 38 */	slwi r3, r8, 3
/* 800F8500 000F4420  7C C9 18 2E */	lwzx r6, r9, r3
/* 800F8504 000F4424  A0 06 00 06 */	lhz r0, 6(r6)
/* 800F8508 000F4428  28 00 00 00 */	cmplwi r0, 0
/* 800F850C 000F442C  40 82 00 B0 */	bne lbl_800F85BC
/* 800F8510 000F4430  7C 69 1A 14 */	add r3, r9, r3
/* 800F8514 000F4434  80 A6 00 1C */	lwz r5, 0x1c(r6)
/* 800F8518 000F4438  81 03 00 04 */	lwz r8, 4(r3)
/* 800F851C 000F443C  54 80 04 3E */	clrlwi r0, r4, 0x10
/* 800F8520 000F4440  80 86 00 20 */	lwz r4, 0x20(r6)
/* 800F8524 000F4444  80 66 00 24 */	lwz r3, 0x24(r6)
/* 800F8528 000F4448  7F 68 2A 14 */	add r27, r8, r5
/* 800F852C 000F444C  7F 48 22 14 */	add r26, r8, r4
/* 800F8530 000F4450  7F 28 1A 14 */	add r25, r8, r3
/* 800F8534 000F4454  48 00 00 74 */	b lbl_800F85A8
lbl_800F8538:
/* 800F8538 000F4458  7C 03 00 40 */	cmplw r3, r0
/* 800F853C 000F445C  40 82 00 68 */	bne lbl_800F85A4
/* 800F8540 000F4460  54 E0 06 3F */	clrlwi. r0, r7, 0x18
/* 800F8544 000F4464  41 82 00 2C */	beq lbl_800F8570
/* 800F8548 000F4468  38 7B 00 00 */	addi r3, r27, 0
/* 800F854C 000F446C  38 9A 00 00 */	addi r4, r26, 0
/* 800F8550 000F4470  38 B9 00 00 */	addi r5, r25, 0
/* 800F8554 000F4474  38 DD 00 00 */	addi r6, r29, 0
/* 800F8558 000F4478  38 FE 00 00 */	addi r7, r30, 0
/* 800F855C 000F447C  39 1F 00 00 */	addi r8, r31, 0
/* 800F8560 000F4480  39 3C 00 00 */	addi r9, r28, 0
/* 800F8564 000F4484  4B FF 03 D5 */	bl seqStartPlay
/* 800F8568 000F4488  7C 79 1B 78 */	mr r25, r3
/* 800F856C 000F448C  48 00 00 30 */	b lbl_800F859C
lbl_800F8570:
/* 800F8570 000F4490  48 00 8C 91 */	bl hwDisableIrq
/* 800F8574 000F4494  38 7B 00 00 */	addi r3, r27, 0
/* 800F8578 000F4498  38 9A 00 00 */	addi r4, r26, 0
/* 800F857C 000F449C  38 B9 00 00 */	addi r5, r25, 0
/* 800F8580 000F44A0  38 DD 00 00 */	addi r6, r29, 0
/* 800F8584 000F44A4  38 FE 00 00 */	addi r7, r30, 0
/* 800F8588 000F44A8  39 1F 00 00 */	addi r8, r31, 0
/* 800F858C 000F44AC  39 3C 00 00 */	addi r9, r28, 0
/* 800F8590 000F44B0  4B FF 03 A9 */	bl seqStartPlay
/* 800F8594 000F44B4  7C 79 1B 78 */	mr r25, r3
/* 800F8598 000F44B8  48 00 8C 31 */	bl hwEnableIrq
lbl_800F859C:
/* 800F859C 000F44BC  7F 23 CB 78 */	mr r3, r25
/* 800F85A0 000F44C0  48 00 00 34 */	b lbl_800F85D4
lbl_800F85A4:
/* 800F85A4 000F44C4  3B 39 00 54 */	addi r25, r25, 0x54
lbl_800F85A8:
/* 800F85A8 000F44C8  A0 79 00 00 */	lhz r3, 0(r25)
/* 800F85AC 000F44CC  28 03 FF FF */	cmplwi r3, 0xffff
/* 800F85B0 000F44D0  40 82 FF 88 */	bne lbl_800F8538
/* 800F85B4 000F44D4  38 60 FF FF */	li r3, -1
/* 800F85B8 000F44D8  48 00 00 1C */	b lbl_800F85D4
lbl_800F85BC:
/* 800F85BC 000F44DC  38 60 FF FF */	li r3, -1
/* 800F85C0 000F44E0  48 00 00 14 */	b lbl_800F85D4
lbl_800F85C4:
/* 800F85C4 000F44E4  38 C6 00 08 */	addi r6, r6, 8
/* 800F85C8 000F44E8  39 08 00 01 */	addi r8, r8, 1
/* 800F85CC 000F44EC  42 00 FF 20 */	bdnz lbl_800F84EC
lbl_800F85D0:
/* 800F85D0 000F44F0  38 60 FF FF */	li r3, -1
lbl_800F85D4:
/* 800F85D4 000F44F4  BB 21 00 24 */	lmw r25, 0x24(r1)
/* 800F85D8 000F44F8  80 01 00 44 */	lwz r0, 0x44(r1)
/* 800F85DC 000F44FC  38 21 00 40 */	addi r1, r1, 0x40
/* 800F85E0 000F4500  7C 08 03 A6 */	mtlr r0
/* 800F85E4 000F4504  4E 80 00 20 */	blr

.global sndSeqPlayEx
sndSeqPlayEx:
/* 800F85E8 000F4508  7C 08 02 A6 */	mflr r0
/* 800F85EC 000F450C  39 07 00 00 */	addi r8, r7, 0
/* 800F85F0 000F4510  90 01 00 04 */	stw r0, 4(r1)
/* 800F85F4 000F4514  38 E0 00 00 */	li r7, 0
/* 800F85F8 000F4518  94 21 FF F8 */	stwu r1, -8(r1)
/* 800F85FC 000F451C  4B FF FE AD */	bl seqPlaySong
/* 800F8600 000F4520  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800F8604 000F4524  38 21 00 08 */	addi r1, r1, 8
/* 800F8608 000F4528  7C 08 03 A6 */	mtlr r0
/* 800F860C 000F452C  4E 80 00 20 */	blr
