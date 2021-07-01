.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global WriteSramCallback
WriteSramCallback:
/* 800C7870 000C3790  7C 08 02 A6 */	mflr r0
/* 800C7874 000C3794  3C 60 80 2C */	lis r3, Scb@ha
/* 800C7878 000C3798  90 01 00 04 */	stw r0, 4(r1)
/* 800C787C 000C379C  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 800C7880 000C37A0  93 E1 00 14 */	stw r31, 0x14(r1)
/* 800C7884 000C37A4  3B E3 6D 00 */	addi r31, r3, Scb@l
/* 800C7888 000C37A8  93 C1 00 10 */	stw r30, 0x10(r1)
/* 800C788C 000C37AC  3B DF 00 40 */	addi r30, r31, 0x40
/* 800C7890 000C37B0  80 9F 00 40 */	lwz r4, 0x40(r31)
/* 800C7894 000C37B4  7C 7F 22 14 */	add r3, r31, r4
/* 800C7898 000C37B8  20 A4 00 40 */	subfic r5, r4, 0x40
/* 800C789C 000C37BC  48 00 00 35 */	bl WriteSram
/* 800C78A0 000C37C0  90 7F 00 4C */	stw r3, 0x4c(r31)
/* 800C78A4 000C37C4  80 1F 00 4C */	lwz r0, 0x4c(r31)
/* 800C78A8 000C37C8  2C 00 00 00 */	cmpwi r0, 0
/* 800C78AC 000C37CC  41 82 00 0C */	beq lbl_800C78B8
/* 800C78B0 000C37D0  38 00 00 40 */	li r0, 0x40
/* 800C78B4 000C37D4  90 1E 00 00 */	stw r0, 0(r30)
lbl_800C78B8:
/* 800C78B8 000C37D8  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800C78BC 000C37DC  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 800C78C0 000C37E0  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 800C78C4 000C37E4  7C 08 03 A6 */	mtlr r0
/* 800C78C8 000C37E8  38 21 00 18 */	addi r1, r1, 0x18
/* 800C78CC 000C37EC  4E 80 00 20 */	blr

.global WriteSram
WriteSram:
/* 800C78D0 000C37F0  7C 08 02 A6 */	mflr r0
/* 800C78D4 000C37F4  3C C0 80 0C */	lis r6, WriteSramCallback@ha
/* 800C78D8 000C37F8  90 01 00 04 */	stw r0, 4(r1)
/* 800C78DC 000C37FC  38 06 78 70 */	addi r0, r6, WriteSramCallback@l
/* 800C78E0 000C3800  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 800C78E4 000C3804  93 E1 00 24 */	stw r31, 0x24(r1)
/* 800C78E8 000C3808  3B E4 00 00 */	addi r31, r4, 0
/* 800C78EC 000C380C  38 80 00 01 */	li r4, 1
/* 800C78F0 000C3810  93 C1 00 20 */	stw r30, 0x20(r1)
/* 800C78F4 000C3814  3B C5 00 00 */	addi r30, r5, 0
/* 800C78F8 000C3818  7C 05 03 78 */	mr r5, r0
/* 800C78FC 000C381C  93 A1 00 1C */	stw r29, 0x1c(r1)
/* 800C7900 000C3820  3B A3 00 00 */	addi r29, r3, 0
/* 800C7904 000C3824  38 60 00 00 */	li r3, 0
/* 800C7908 000C3828  4B FF D7 C5 */	bl EXILock
/* 800C790C 000C382C  2C 03 00 00 */	cmpwi r3, 0
/* 800C7910 000C3830  40 82 00 0C */	bne lbl_800C791C
/* 800C7914 000C3834  38 60 00 00 */	li r3, 0
/* 800C7918 000C3838  48 00 00 B4 */	b lbl_800C79CC
lbl_800C791C:
/* 800C791C 000C383C  38 60 00 00 */	li r3, 0
/* 800C7920 000C3840  38 80 00 01 */	li r4, 1
/* 800C7924 000C3844  38 A0 00 03 */	li r5, 3
/* 800C7928 000C3848  4B FF D1 45 */	bl EXISelect
/* 800C792C 000C384C  2C 03 00 00 */	cmpwi r3, 0
/* 800C7930 000C3850  40 82 00 14 */	bne lbl_800C7944
/* 800C7934 000C3854  38 60 00 00 */	li r3, 0
/* 800C7938 000C3858  4B FF D8 89 */	bl EXIUnlock
/* 800C793C 000C385C  38 60 00 00 */	li r3, 0
/* 800C7940 000C3860  48 00 00 8C */	b lbl_800C79CC
lbl_800C7944:
/* 800C7944 000C3864  57 FF 30 32 */	slwi r31, r31, 6
/* 800C7948 000C3868  38 1F 01 00 */	addi r0, r31, 0x100
/* 800C794C 000C386C  64 00 A0 00 */	oris r0, r0, 0xa000
/* 800C7950 000C3870  90 01 00 14 */	stw r0, 0x14(r1)
/* 800C7954 000C3874  38 81 00 14 */	addi r4, r1, 0x14
/* 800C7958 000C3878  38 60 00 00 */	li r3, 0
/* 800C795C 000C387C  38 A0 00 04 */	li r5, 4
/* 800C7960 000C3880  38 C0 00 01 */	li r6, 1
/* 800C7964 000C3884  38 E0 00 00 */	li r7, 0
/* 800C7968 000C3888  4B FF C6 E9 */	bl EXIImm
/* 800C796C 000C388C  7C 60 00 34 */	cntlzw r0, r3
/* 800C7970 000C3890  54 1F D9 7E */	srwi r31, r0, 5
/* 800C7974 000C3894  38 60 00 00 */	li r3, 0
/* 800C7978 000C3898  4B FF CA C1 */	bl EXISync
/* 800C797C 000C389C  7C 60 00 34 */	cntlzw r0, r3
/* 800C7980 000C38A0  54 00 D9 7E */	srwi r0, r0, 5
/* 800C7984 000C38A4  38 9D 00 00 */	addi r4, r29, 0
/* 800C7988 000C38A8  38 BE 00 00 */	addi r5, r30, 0
/* 800C798C 000C38AC  7F FF 03 78 */	or r31, r31, r0
/* 800C7990 000C38B0  38 60 00 00 */	li r3, 0
/* 800C7994 000C38B4  38 C0 00 01 */	li r6, 1
/* 800C7998 000C38B8  4B FF C9 15 */	bl EXIImmEx
/* 800C799C 000C38BC  7C 60 00 34 */	cntlzw r0, r3
/* 800C79A0 000C38C0  54 00 D9 7E */	srwi r0, r0, 5
/* 800C79A4 000C38C4  7F FF 03 78 */	or r31, r31, r0
/* 800C79A8 000C38C8  38 60 00 00 */	li r3, 0
/* 800C79AC 000C38CC  4B FF D1 ED */	bl EXIDeselect
/* 800C79B0 000C38D0  7C 60 00 34 */	cntlzw r0, r3
/* 800C79B4 000C38D4  54 00 D9 7E */	srwi r0, r0, 5
/* 800C79B8 000C38D8  7F FF 03 78 */	or r31, r31, r0
/* 800C79BC 000C38DC  38 60 00 00 */	li r3, 0
/* 800C79C0 000C38E0  4B FF D8 01 */	bl EXIUnlock
/* 800C79C4 000C38E4  7F E0 00 34 */	cntlzw r0, r31
/* 800C79C8 000C38E8  54 03 D9 7E */	srwi r3, r0, 5
lbl_800C79CC:
/* 800C79CC 000C38EC  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 800C79D0 000C38F0  83 E1 00 24 */	lwz r31, 0x24(r1)
/* 800C79D4 000C38F4  83 C1 00 20 */	lwz r30, 0x20(r1)
/* 800C79D8 000C38F8  7C 08 03 A6 */	mtlr r0
/* 800C79DC 000C38FC  83 A1 00 1C */	lwz r29, 0x1c(r1)
/* 800C79E0 000C3900  38 21 00 28 */	addi r1, r1, 0x28
/* 800C79E4 000C3904  4E 80 00 20 */	blr

.global __OSInitSram
__OSInitSram:
/* 800C79E8 000C3908  7C 08 02 A6 */	mflr r0
/* 800C79EC 000C390C  3C 60 80 2C */	lis r3, Scb@ha
/* 800C79F0 000C3910  90 01 00 04 */	stw r0, 4(r1)
/* 800C79F4 000C3914  38 80 00 40 */	li r4, 0x40
/* 800C79F8 000C3918  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 800C79FC 000C391C  93 E1 00 14 */	stw r31, 0x14(r1)
/* 800C7A00 000C3920  3B E0 00 00 */	li r31, 0
/* 800C7A04 000C3924  93 C1 00 10 */	stw r30, 0x10(r1)
/* 800C7A08 000C3928  3B C3 6D 00 */	addi r30, r3, Scb@l
/* 800C7A0C 000C392C  38 7E 00 00 */	addi r3, r30, 0
/* 800C7A10 000C3930  93 FE 00 44 */	stw r31, 0x44(r30)
/* 800C7A14 000C3934  93 FE 00 48 */	stw r31, 0x48(r30)
/* 800C7A18 000C3938  4B FF B5 19 */	bl DCInvalidateRange
/* 800C7A1C 000C393C  38 60 00 00 */	li r3, 0
/* 800C7A20 000C3940  38 80 00 01 */	li r4, 1
/* 800C7A24 000C3944  38 A0 00 00 */	li r5, 0
/* 800C7A28 000C3948  4B FF D6 A5 */	bl EXILock
/* 800C7A2C 000C394C  2C 03 00 00 */	cmpwi r3, 0
/* 800C7A30 000C3950  40 82 00 08 */	bne lbl_800C7A38
/* 800C7A34 000C3954  48 00 00 C4 */	b lbl_800C7AF8
lbl_800C7A38:
/* 800C7A38 000C3958  38 60 00 00 */	li r3, 0
/* 800C7A3C 000C395C  38 80 00 01 */	li r4, 1
/* 800C7A40 000C3960  38 A0 00 03 */	li r5, 3
/* 800C7A44 000C3964  4B FF D0 29 */	bl EXISelect
/* 800C7A48 000C3968  2C 03 00 00 */	cmpwi r3, 0
/* 800C7A4C 000C396C  40 82 00 10 */	bne lbl_800C7A5C
/* 800C7A50 000C3970  38 60 00 00 */	li r3, 0
/* 800C7A54 000C3974  4B FF D7 6D */	bl EXIUnlock
/* 800C7A58 000C3978  48 00 00 A0 */	b lbl_800C7AF8
lbl_800C7A5C:
/* 800C7A5C 000C397C  3C 60 20 00 */	lis r3, 0x20000100@ha
/* 800C7A60 000C3980  38 03 01 00 */	addi r0, r3, 0x20000100@l
/* 800C7A64 000C3984  90 01 00 08 */	stw r0, 8(r1)
/* 800C7A68 000C3988  38 81 00 08 */	addi r4, r1, 8
/* 800C7A6C 000C398C  38 60 00 00 */	li r3, 0
/* 800C7A70 000C3990  38 A0 00 04 */	li r5, 4
/* 800C7A74 000C3994  38 C0 00 01 */	li r6, 1
/* 800C7A78 000C3998  38 E0 00 00 */	li r7, 0
/* 800C7A7C 000C399C  4B FF C5 D5 */	bl EXIImm
/* 800C7A80 000C39A0  7C 60 00 34 */	cntlzw r0, r3
/* 800C7A84 000C39A4  54 1F D9 7E */	srwi r31, r0, 5
/* 800C7A88 000C39A8  38 60 00 00 */	li r3, 0
/* 800C7A8C 000C39AC  4B FF C9 AD */	bl EXISync
/* 800C7A90 000C39B0  7C 60 00 34 */	cntlzw r0, r3
/* 800C7A94 000C39B4  54 00 D9 7E */	srwi r0, r0, 5
/* 800C7A98 000C39B8  38 9E 00 00 */	addi r4, r30, 0
/* 800C7A9C 000C39BC  7F FF 03 78 */	or r31, r31, r0
/* 800C7AA0 000C39C0  38 60 00 00 */	li r3, 0
/* 800C7AA4 000C39C4  38 A0 00 40 */	li r5, 0x40
/* 800C7AA8 000C39C8  38 C0 00 00 */	li r6, 0
/* 800C7AAC 000C39CC  38 E0 00 00 */	li r7, 0
/* 800C7AB0 000C39D0  4B FF C8 9D */	bl EXIDma
/* 800C7AB4 000C39D4  7C 60 00 34 */	cntlzw r0, r3
/* 800C7AB8 000C39D8  54 00 D9 7E */	srwi r0, r0, 5
/* 800C7ABC 000C39DC  7F FF 03 78 */	or r31, r31, r0
/* 800C7AC0 000C39E0  38 60 00 00 */	li r3, 0
/* 800C7AC4 000C39E4  4B FF C9 75 */	bl EXISync
/* 800C7AC8 000C39E8  7C 60 00 34 */	cntlzw r0, r3
/* 800C7ACC 000C39EC  54 00 D9 7E */	srwi r0, r0, 5
/* 800C7AD0 000C39F0  7F FF 03 78 */	or r31, r31, r0
/* 800C7AD4 000C39F4  38 60 00 00 */	li r3, 0
/* 800C7AD8 000C39F8  4B FF D0 C1 */	bl EXIDeselect
/* 800C7ADC 000C39FC  7C 60 00 34 */	cntlzw r0, r3
/* 800C7AE0 000C3A00  54 00 D9 7E */	srwi r0, r0, 5
/* 800C7AE4 000C3A04  7F FF 03 78 */	or r31, r31, r0
/* 800C7AE8 000C3A08  38 60 00 00 */	li r3, 0
/* 800C7AEC 000C3A0C  4B FF D6 D5 */	bl EXIUnlock
/* 800C7AF0 000C3A10  7F E0 00 34 */	cntlzw r0, r31
/* 800C7AF4 000C3A14  54 1F D9 7E */	srwi r31, r0, 5
lbl_800C7AF8:
/* 800C7AF8 000C3A18  93 FE 00 4C */	stw r31, 0x4c(r30)
/* 800C7AFC 000C3A1C  38 00 00 40 */	li r0, 0x40
/* 800C7B00 000C3A20  90 1E 00 40 */	stw r0, 0x40(r30)
/* 800C7B04 000C3A24  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800C7B08 000C3A28  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 800C7B0C 000C3A2C  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 800C7B10 000C3A30  38 21 00 18 */	addi r1, r1, 0x18
/* 800C7B14 000C3A34  7C 08 03 A6 */	mtlr r0
/* 800C7B18 000C3A38  4E 80 00 20 */	blr

.global __OSLockSram
__OSLockSram:
/* 800C7B1C 000C3A3C  7C 08 02 A6 */	mflr r0
/* 800C7B20 000C3A40  3C 60 80 2C */	lis r3, Scb@ha
/* 800C7B24 000C3A44  90 01 00 04 */	stw r0, 4(r1)
/* 800C7B28 000C3A48  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800C7B2C 000C3A4C  93 E1 00 0C */	stw r31, 0xc(r1)
/* 800C7B30 000C3A50  3B E3 6D 00 */	addi r31, r3, Scb@l
/* 800C7B34 000C3A54  4B FF E5 89 */	bl OSDisableInterrupts
/* 800C7B38 000C3A58  80 1F 00 48 */	lwz r0, 0x48(r31)
/* 800C7B3C 000C3A5C  38 9F 00 48 */	addi r4, r31, 0x48
/* 800C7B40 000C3A60  2C 00 00 00 */	cmpwi r0, 0
/* 800C7B44 000C3A64  41 82 00 10 */	beq lbl_800C7B54
/* 800C7B48 000C3A68  4B FF E5 9D */	bl OSRestoreInterrupts
/* 800C7B4C 000C3A6C  3B E0 00 00 */	li r31, 0
/* 800C7B50 000C3A70  48 00 00 10 */	b lbl_800C7B60
lbl_800C7B54:
/* 800C7B54 000C3A74  90 7F 00 44 */	stw r3, 0x44(r31)
/* 800C7B58 000C3A78  38 00 00 01 */	li r0, 1
/* 800C7B5C 000C3A7C  90 04 00 00 */	stw r0, 0(r4)
lbl_800C7B60:
/* 800C7B60 000C3A80  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800C7B64 000C3A84  7F E3 FB 78 */	mr r3, r31
/* 800C7B68 000C3A88  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 800C7B6C 000C3A8C  38 21 00 10 */	addi r1, r1, 0x10
/* 800C7B70 000C3A90  7C 08 03 A6 */	mtlr r0
/* 800C7B74 000C3A94  4E 80 00 20 */	blr

.global __OSLockSramEx
__OSLockSramEx:
/* 800C7B78 000C3A98  7C 08 02 A6 */	mflr r0
/* 800C7B7C 000C3A9C  3C 60 80 2C */	lis r3, Scb@ha
/* 800C7B80 000C3AA0  90 01 00 04 */	stw r0, 4(r1)
/* 800C7B84 000C3AA4  94 21 FF F0 */	stwu r1, -0x10(r1)
/* 800C7B88 000C3AA8  93 E1 00 0C */	stw r31, 0xc(r1)
/* 800C7B8C 000C3AAC  3B E3 6D 00 */	addi r31, r3, Scb@l
/* 800C7B90 000C3AB0  4B FF E5 2D */	bl OSDisableInterrupts
/* 800C7B94 000C3AB4  80 1F 00 48 */	lwz r0, 0x48(r31)
/* 800C7B98 000C3AB8  38 9F 00 48 */	addi r4, r31, 0x48
/* 800C7B9C 000C3ABC  2C 00 00 00 */	cmpwi r0, 0
/* 800C7BA0 000C3AC0  41 82 00 10 */	beq lbl_800C7BB0
/* 800C7BA4 000C3AC4  4B FF E5 41 */	bl OSRestoreInterrupts
/* 800C7BA8 000C3AC8  38 60 00 00 */	li r3, 0
/* 800C7BAC 000C3ACC  48 00 00 14 */	b lbl_800C7BC0
lbl_800C7BB0:
/* 800C7BB0 000C3AD0  90 7F 00 44 */	stw r3, 0x44(r31)
/* 800C7BB4 000C3AD4  38 00 00 01 */	li r0, 1
/* 800C7BB8 000C3AD8  38 7F 00 14 */	addi r3, r31, 0x14
/* 800C7BBC 000C3ADC  90 04 00 00 */	stw r0, 0(r4)
lbl_800C7BC0:
/* 800C7BC0 000C3AE0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800C7BC4 000C3AE4  83 E1 00 0C */	lwz r31, 0xc(r1)
/* 800C7BC8 000C3AE8  38 21 00 10 */	addi r1, r1, 0x10
/* 800C7BCC 000C3AEC  7C 08 03 A6 */	mtlr r0
/* 800C7BD0 000C3AF0  4E 80 00 20 */	blr

.global UnlockSram
UnlockSram:
/* 800C7BD4 000C3AF4  7C 08 02 A6 */	mflr r0
/* 800C7BD8 000C3AF8  2C 03 00 00 */	cmpwi r3, 0
/* 800C7BDC 000C3AFC  90 01 00 04 */	stw r0, 4(r1)
/* 800C7BE0 000C3B00  3C 60 80 2C */	lis r3, Scb@ha
/* 800C7BE4 000C3B04  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 800C7BE8 000C3B08  BF 61 00 1C */	stmw r27, 0x1c(r1)
/* 800C7BEC 000C3B0C  3B E3 6D 00 */	addi r31, r3, Scb@l
/* 800C7BF0 000C3B10  41 82 02 C4 */	beq lbl_800C7EB4
/* 800C7BF4 000C3B14  28 04 00 00 */	cmplwi r4, 0
/* 800C7BF8 000C3B18  40 82 01 B0 */	bne lbl_800C7DA8
/* 800C7BFC 000C3B1C  88 7F 00 13 */	lbz r3, 0x13(r31)
/* 800C7C00 000C3B20  54 60 07 BE */	clrlwi r0, r3, 0x1e
/* 800C7C04 000C3B24  28 00 00 02 */	cmplwi r0, 2
/* 800C7C08 000C3B28  40 81 00 0C */	ble lbl_800C7C14
/* 800C7C0C 000C3B2C  54 60 00 3A */	rlwinm r0, r3, 0, 0, 0x1d
/* 800C7C10 000C3B30  98 1F 00 13 */	stb r0, 0x13(r31)
lbl_800C7C14:
/* 800C7C14 000C3B34  38 00 00 00 */	li r0, 0
/* 800C7C18 000C3B38  B0 1F 00 02 */	sth r0, 2(r31)
/* 800C7C1C 000C3B3C  38 BF 00 14 */	addi r5, r31, 0x14
/* 800C7C20 000C3B40  38 DF 00 0C */	addi r6, r31, 0xc
/* 800C7C24 000C3B44  38 65 00 01 */	addi r3, r5, 1
/* 800C7C28 000C3B48  B0 1F 00 00 */	sth r0, 0(r31)
/* 800C7C2C 000C3B4C  7C 66 18 50 */	subf r3, r6, r3
/* 800C7C30 000C3B50  7C 06 28 40 */	cmplw r6, r5
/* 800C7C34 000C3B54  54 63 F8 7E */	srwi r3, r3, 1
/* 800C7C38 000C3B58  40 80 01 70 */	bge lbl_800C7DA8
/* 800C7C3C 000C3B5C  54 60 E8 FF */	rlwinm. r0, r3, 0x1d, 3, 0x1f
/* 800C7C40 000C3B60  7C 09 03 A6 */	mtctr r0
/* 800C7C44 000C3B64  41 82 01 34 */	beq lbl_800C7D78
lbl_800C7C48:
/* 800C7C48 000C3B68  A0 BF 00 00 */	lhz r5, 0(r31)
/* 800C7C4C 000C3B6C  A0 06 00 00 */	lhz r0, 0(r6)
/* 800C7C50 000C3B70  7C 05 02 14 */	add r0, r5, r0
/* 800C7C54 000C3B74  B0 1F 00 00 */	sth r0, 0(r31)
/* 800C7C58 000C3B78  A0 06 00 00 */	lhz r0, 0(r6)
/* 800C7C5C 000C3B7C  A0 BF 00 02 */	lhz r5, 2(r31)
/* 800C7C60 000C3B80  7C 00 00 F8 */	nor r0, r0, r0
/* 800C7C64 000C3B84  7C 05 02 14 */	add r0, r5, r0
/* 800C7C68 000C3B88  B0 1F 00 02 */	sth r0, 2(r31)
/* 800C7C6C 000C3B8C  A0 BF 00 00 */	lhz r5, 0(r31)
/* 800C7C70 000C3B90  A0 06 00 02 */	lhz r0, 2(r6)
/* 800C7C74 000C3B94  7C 05 02 14 */	add r0, r5, r0
/* 800C7C78 000C3B98  B0 1F 00 00 */	sth r0, 0(r31)
/* 800C7C7C 000C3B9C  A0 06 00 02 */	lhz r0, 2(r6)
/* 800C7C80 000C3BA0  A0 BF 00 02 */	lhz r5, 2(r31)
/* 800C7C84 000C3BA4  7C 00 00 F8 */	nor r0, r0, r0
/* 800C7C88 000C3BA8  7C 05 02 14 */	add r0, r5, r0
/* 800C7C8C 000C3BAC  B0 1F 00 02 */	sth r0, 2(r31)
/* 800C7C90 000C3BB0  A0 BF 00 00 */	lhz r5, 0(r31)
/* 800C7C94 000C3BB4  A0 06 00 04 */	lhz r0, 4(r6)
/* 800C7C98 000C3BB8  7C 05 02 14 */	add r0, r5, r0
/* 800C7C9C 000C3BBC  B0 1F 00 00 */	sth r0, 0(r31)
/* 800C7CA0 000C3BC0  A0 06 00 04 */	lhz r0, 4(r6)
/* 800C7CA4 000C3BC4  A0 BF 00 02 */	lhz r5, 2(r31)
/* 800C7CA8 000C3BC8  7C 00 00 F8 */	nor r0, r0, r0
/* 800C7CAC 000C3BCC  7C 05 02 14 */	add r0, r5, r0
/* 800C7CB0 000C3BD0  B0 1F 00 02 */	sth r0, 2(r31)
/* 800C7CB4 000C3BD4  A0 BF 00 00 */	lhz r5, 0(r31)
/* 800C7CB8 000C3BD8  A0 06 00 06 */	lhz r0, 6(r6)
/* 800C7CBC 000C3BDC  7C 05 02 14 */	add r0, r5, r0
/* 800C7CC0 000C3BE0  B0 1F 00 00 */	sth r0, 0(r31)
/* 800C7CC4 000C3BE4  A0 06 00 06 */	lhz r0, 6(r6)
/* 800C7CC8 000C3BE8  A0 BF 00 02 */	lhz r5, 2(r31)
/* 800C7CCC 000C3BEC  7C 00 00 F8 */	nor r0, r0, r0
/* 800C7CD0 000C3BF0  7C 05 02 14 */	add r0, r5, r0
/* 800C7CD4 000C3BF4  B0 1F 00 02 */	sth r0, 2(r31)
/* 800C7CD8 000C3BF8  A0 BF 00 00 */	lhz r5, 0(r31)
/* 800C7CDC 000C3BFC  A0 06 00 08 */	lhz r0, 8(r6)
/* 800C7CE0 000C3C00  7C 05 02 14 */	add r0, r5, r0
/* 800C7CE4 000C3C04  B0 1F 00 00 */	sth r0, 0(r31)
/* 800C7CE8 000C3C08  A0 06 00 08 */	lhz r0, 8(r6)
/* 800C7CEC 000C3C0C  A0 BF 00 02 */	lhz r5, 2(r31)
/* 800C7CF0 000C3C10  7C 00 00 F8 */	nor r0, r0, r0
/* 800C7CF4 000C3C14  7C 05 02 14 */	add r0, r5, r0
/* 800C7CF8 000C3C18  B0 1F 00 02 */	sth r0, 2(r31)
/* 800C7CFC 000C3C1C  A0 BF 00 00 */	lhz r5, 0(r31)
/* 800C7D00 000C3C20  A0 06 00 0A */	lhz r0, 0xa(r6)
/* 800C7D04 000C3C24  7C 05 02 14 */	add r0, r5, r0
/* 800C7D08 000C3C28  B0 1F 00 00 */	sth r0, 0(r31)
/* 800C7D0C 000C3C2C  A0 06 00 0A */	lhz r0, 0xa(r6)
/* 800C7D10 000C3C30  A0 BF 00 02 */	lhz r5, 2(r31)
/* 800C7D14 000C3C34  7C 00 00 F8 */	nor r0, r0, r0
/* 800C7D18 000C3C38  7C 05 02 14 */	add r0, r5, r0
/* 800C7D1C 000C3C3C  B0 1F 00 02 */	sth r0, 2(r31)
/* 800C7D20 000C3C40  A0 BF 00 00 */	lhz r5, 0(r31)
/* 800C7D24 000C3C44  A0 06 00 0C */	lhz r0, 0xc(r6)
/* 800C7D28 000C3C48  7C 05 02 14 */	add r0, r5, r0
/* 800C7D2C 000C3C4C  B0 1F 00 00 */	sth r0, 0(r31)
/* 800C7D30 000C3C50  A0 06 00 0C */	lhz r0, 0xc(r6)
/* 800C7D34 000C3C54  A0 BF 00 02 */	lhz r5, 2(r31)
/* 800C7D38 000C3C58  7C 00 00 F8 */	nor r0, r0, r0
/* 800C7D3C 000C3C5C  7C 05 02 14 */	add r0, r5, r0
/* 800C7D40 000C3C60  B0 1F 00 02 */	sth r0, 2(r31)
/* 800C7D44 000C3C64  A0 BF 00 00 */	lhz r5, 0(r31)
/* 800C7D48 000C3C68  A0 06 00 0E */	lhz r0, 0xe(r6)
/* 800C7D4C 000C3C6C  7C 05 02 14 */	add r0, r5, r0
/* 800C7D50 000C3C70  B0 1F 00 00 */	sth r0, 0(r31)
/* 800C7D54 000C3C74  A0 06 00 0E */	lhz r0, 0xe(r6)
/* 800C7D58 000C3C78  38 C6 00 10 */	addi r6, r6, 0x10
/* 800C7D5C 000C3C7C  A0 BF 00 02 */	lhz r5, 2(r31)
/* 800C7D60 000C3C80  7C 00 00 F8 */	nor r0, r0, r0
/* 800C7D64 000C3C84  7C 05 02 14 */	add r0, r5, r0
/* 800C7D68 000C3C88  B0 1F 00 02 */	sth r0, 2(r31)
/* 800C7D6C 000C3C8C  42 00 FE DC */	bdnz lbl_800C7C48
/* 800C7D70 000C3C90  70 63 00 07 */	andi. r3, r3, 7
/* 800C7D74 000C3C94  41 82 00 34 */	beq lbl_800C7DA8
lbl_800C7D78:
/* 800C7D78 000C3C98  7C 69 03 A6 */	mtctr r3
lbl_800C7D7C:
/* 800C7D7C 000C3C9C  A0 BF 00 00 */	lhz r5, 0(r31)
/* 800C7D80 000C3CA0  A0 06 00 00 */	lhz r0, 0(r6)
/* 800C7D84 000C3CA4  7C 05 02 14 */	add r0, r5, r0
/* 800C7D88 000C3CA8  B0 1F 00 00 */	sth r0, 0(r31)
/* 800C7D8C 000C3CAC  A0 06 00 00 */	lhz r0, 0(r6)
/* 800C7D90 000C3CB0  38 C6 00 02 */	addi r6, r6, 2
/* 800C7D94 000C3CB4  A0 BF 00 02 */	lhz r5, 2(r31)
/* 800C7D98 000C3CB8  7C 00 00 F8 */	nor r0, r0, r0
/* 800C7D9C 000C3CBC  7C 05 02 14 */	add r0, r5, r0
/* 800C7DA0 000C3CC0  B0 1F 00 02 */	sth r0, 2(r31)
/* 800C7DA4 000C3CC4  42 00 FF D8 */	bdnz lbl_800C7D7C
lbl_800C7DA8:
/* 800C7DA8 000C3CC8  3B DF 00 40 */	addi r30, r31, 0x40
/* 800C7DAC 000C3CCC  80 1F 00 40 */	lwz r0, 0x40(r31)
/* 800C7DB0 000C3CD0  7C 04 00 40 */	cmplw r4, r0
/* 800C7DB4 000C3CD4  40 80 00 08 */	bge lbl_800C7DBC
/* 800C7DB8 000C3CD8  90 9E 00 00 */	stw r4, 0(r30)
lbl_800C7DBC:
/* 800C7DBC 000C3CDC  83 BE 00 00 */	lwz r29, 0(r30)
/* 800C7DC0 000C3CE0  3C 60 80 0C */	lis r3, WriteSramCallback@ha
/* 800C7DC4 000C3CE4  38 A3 78 70 */	addi r5, r3, WriteSramCallback@l
/* 800C7DC8 000C3CE8  23 7D 00 40 */	subfic r27, r29, 0x40
/* 800C7DCC 000C3CEC  7F 9F EA 14 */	add r28, r31, r29
/* 800C7DD0 000C3CF0  38 60 00 00 */	li r3, 0
/* 800C7DD4 000C3CF4  38 80 00 01 */	li r4, 1
/* 800C7DD8 000C3CF8  4B FF D2 F5 */	bl EXILock
/* 800C7DDC 000C3CFC  2C 03 00 00 */	cmpwi r3, 0
/* 800C7DE0 000C3D00  40 82 00 0C */	bne lbl_800C7DEC
/* 800C7DE4 000C3D04  38 00 00 00 */	li r0, 0
/* 800C7DE8 000C3D08  48 00 00 B4 */	b lbl_800C7E9C
lbl_800C7DEC:
/* 800C7DEC 000C3D0C  38 60 00 00 */	li r3, 0
/* 800C7DF0 000C3D10  38 80 00 01 */	li r4, 1
/* 800C7DF4 000C3D14  38 A0 00 03 */	li r5, 3
/* 800C7DF8 000C3D18  4B FF CC 75 */	bl EXISelect
/* 800C7DFC 000C3D1C  2C 03 00 00 */	cmpwi r3, 0
/* 800C7E00 000C3D20  40 82 00 14 */	bne lbl_800C7E14
/* 800C7E04 000C3D24  38 60 00 00 */	li r3, 0
/* 800C7E08 000C3D28  4B FF D3 B9 */	bl EXIUnlock
/* 800C7E0C 000C3D2C  38 00 00 00 */	li r0, 0
/* 800C7E10 000C3D30  48 00 00 8C */	b lbl_800C7E9C
lbl_800C7E14:
/* 800C7E14 000C3D34  57 A3 30 32 */	slwi r3, r29, 6
/* 800C7E18 000C3D38  38 03 01 00 */	addi r0, r3, 0x100
/* 800C7E1C 000C3D3C  64 00 A0 00 */	oris r0, r0, 0xa000
/* 800C7E20 000C3D40  90 01 00 10 */	stw r0, 0x10(r1)
/* 800C7E24 000C3D44  38 81 00 10 */	addi r4, r1, 0x10
/* 800C7E28 000C3D48  38 60 00 00 */	li r3, 0
/* 800C7E2C 000C3D4C  38 A0 00 04 */	li r5, 4
/* 800C7E30 000C3D50  38 C0 00 01 */	li r6, 1
/* 800C7E34 000C3D54  38 E0 00 00 */	li r7, 0
/* 800C7E38 000C3D58  4B FF C2 19 */	bl EXIImm
/* 800C7E3C 000C3D5C  7C 60 00 34 */	cntlzw r0, r3
/* 800C7E40 000C3D60  54 1D D9 7E */	srwi r29, r0, 5
/* 800C7E44 000C3D64  38 60 00 00 */	li r3, 0
/* 800C7E48 000C3D68  4B FF C5 F1 */	bl EXISync
/* 800C7E4C 000C3D6C  7C 60 00 34 */	cntlzw r0, r3
/* 800C7E50 000C3D70  54 00 D9 7E */	srwi r0, r0, 5
/* 800C7E54 000C3D74  38 9C 00 00 */	addi r4, r28, 0
/* 800C7E58 000C3D78  38 BB 00 00 */	addi r5, r27, 0
/* 800C7E5C 000C3D7C  7F BD 03 78 */	or r29, r29, r0
/* 800C7E60 000C3D80  38 60 00 00 */	li r3, 0
/* 800C7E64 000C3D84  38 C0 00 01 */	li r6, 1
/* 800C7E68 000C3D88  4B FF C4 45 */	bl EXIImmEx
/* 800C7E6C 000C3D8C  7C 60 00 34 */	cntlzw r0, r3
/* 800C7E70 000C3D90  54 00 D9 7E */	srwi r0, r0, 5
/* 800C7E74 000C3D94  7F BD 03 78 */	or r29, r29, r0
/* 800C7E78 000C3D98  38 60 00 00 */	li r3, 0
/* 800C7E7C 000C3D9C  4B FF CD 1D */	bl EXIDeselect
/* 800C7E80 000C3DA0  7C 60 00 34 */	cntlzw r0, r3
/* 800C7E84 000C3DA4  54 00 D9 7E */	srwi r0, r0, 5
/* 800C7E88 000C3DA8  7F BD 03 78 */	or r29, r29, r0
/* 800C7E8C 000C3DAC  38 60 00 00 */	li r3, 0
/* 800C7E90 000C3DB0  4B FF D3 31 */	bl EXIUnlock
/* 800C7E94 000C3DB4  7F A0 00 34 */	cntlzw r0, r29
/* 800C7E98 000C3DB8  54 00 D9 7E */	srwi r0, r0, 5
lbl_800C7E9C:
/* 800C7E9C 000C3DBC  90 1F 00 4C */	stw r0, 0x4c(r31)
/* 800C7EA0 000C3DC0  80 1F 00 4C */	lwz r0, 0x4c(r31)
/* 800C7EA4 000C3DC4  2C 00 00 00 */	cmpwi r0, 0
/* 800C7EA8 000C3DC8  41 82 00 0C */	beq lbl_800C7EB4
/* 800C7EAC 000C3DCC  38 00 00 40 */	li r0, 0x40
/* 800C7EB0 000C3DD0  90 1E 00 00 */	stw r0, 0(r30)
lbl_800C7EB4:
/* 800C7EB4 000C3DD4  38 00 00 00 */	li r0, 0
/* 800C7EB8 000C3DD8  90 1F 00 48 */	stw r0, 0x48(r31)
/* 800C7EBC 000C3DDC  80 7F 00 44 */	lwz r3, 0x44(r31)
/* 800C7EC0 000C3DE0  4B FF E2 25 */	bl OSRestoreInterrupts
/* 800C7EC4 000C3DE4  80 7F 00 4C */	lwz r3, 0x4c(r31)
/* 800C7EC8 000C3DE8  BB 61 00 1C */	lmw r27, 0x1c(r1)
/* 800C7ECC 000C3DEC  80 01 00 34 */	lwz r0, 0x34(r1)
/* 800C7ED0 000C3DF0  38 21 00 30 */	addi r1, r1, 0x30
/* 800C7ED4 000C3DF4  7C 08 03 A6 */	mtlr r0
/* 800C7ED8 000C3DF8  4E 80 00 20 */	blr

.global __OSUnlockSram
__OSUnlockSram:
/* 800C7EDC 000C3DFC  7C 08 02 A6 */	mflr r0
/* 800C7EE0 000C3E00  38 80 00 00 */	li r4, 0
/* 800C7EE4 000C3E04  90 01 00 04 */	stw r0, 4(r1)
/* 800C7EE8 000C3E08  94 21 FF F8 */	stwu r1, -8(r1)
/* 800C7EEC 000C3E0C  4B FF FC E9 */	bl UnlockSram
/* 800C7EF0 000C3E10  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800C7EF4 000C3E14  38 21 00 08 */	addi r1, r1, 8
/* 800C7EF8 000C3E18  7C 08 03 A6 */	mtlr r0
/* 800C7EFC 000C3E1C  4E 80 00 20 */	blr

.global __OSUnlockSramEx
__OSUnlockSramEx:
/* 800C7F00 000C3E20  7C 08 02 A6 */	mflr r0
/* 800C7F04 000C3E24  38 80 00 14 */	li r4, 0x14
/* 800C7F08 000C3E28  90 01 00 04 */	stw r0, 4(r1)
/* 800C7F0C 000C3E2C  94 21 FF F8 */	stwu r1, -8(r1)
/* 800C7F10 000C3E30  4B FF FC C5 */	bl UnlockSram
/* 800C7F14 000C3E34  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800C7F18 000C3E38  38 21 00 08 */	addi r1, r1, 8
/* 800C7F1C 000C3E3C  7C 08 03 A6 */	mtlr r0
/* 800C7F20 000C3E40  4E 80 00 20 */	blr

.global __OSSyncSram
__OSSyncSram:
/* 800C7F24 000C3E44  3C 60 80 2C */	lis r3, Scb@ha
/* 800C7F28 000C3E48  38 63 6D 00 */	addi r3, r3, Scb@l
/* 800C7F2C 000C3E4C  80 63 00 4C */	lwz r3, 0x4c(r3)
/* 800C7F30 000C3E50  4E 80 00 20 */	blr

.global __OSReadRom
__OSReadRom:
/* 800C7F34 000C3E54  7C 08 02 A6 */	mflr r0
/* 800C7F38 000C3E58  90 01 00 04 */	stw r0, 4(r1)
/* 800C7F3C 000C3E5C  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 800C7F40 000C3E60  93 E1 00 24 */	stw r31, 0x24(r1)
/* 800C7F44 000C3E64  3B E5 00 00 */	addi r31, r5, 0
/* 800C7F48 000C3E68  93 C1 00 20 */	stw r30, 0x20(r1)
/* 800C7F4C 000C3E6C  3B C4 00 00 */	addi r30, r4, 0
/* 800C7F50 000C3E70  93 A1 00 1C */	stw r29, 0x1c(r1)
/* 800C7F54 000C3E74  3B A3 00 00 */	addi r29, r3, 0
/* 800C7F58 000C3E78  4B FF AF D9 */	bl DCInvalidateRange
/* 800C7F5C 000C3E7C  38 60 00 00 */	li r3, 0
/* 800C7F60 000C3E80  38 80 00 01 */	li r4, 1
/* 800C7F64 000C3E84  38 A0 00 00 */	li r5, 0
/* 800C7F68 000C3E88  4B FF D1 65 */	bl EXILock
/* 800C7F6C 000C3E8C  2C 03 00 00 */	cmpwi r3, 0
/* 800C7F70 000C3E90  40 82 00 0C */	bne lbl_800C7F7C
/* 800C7F74 000C3E94  38 60 00 00 */	li r3, 0
/* 800C7F78 000C3E98  48 00 00 C4 */	b lbl_800C803C
lbl_800C7F7C:
/* 800C7F7C 000C3E9C  38 60 00 00 */	li r3, 0
/* 800C7F80 000C3EA0  38 80 00 01 */	li r4, 1
/* 800C7F84 000C3EA4  38 A0 00 03 */	li r5, 3
/* 800C7F88 000C3EA8  4B FF CA E5 */	bl EXISelect
/* 800C7F8C 000C3EAC  2C 03 00 00 */	cmpwi r3, 0
/* 800C7F90 000C3EB0  40 82 00 14 */	bne lbl_800C7FA4
/* 800C7F94 000C3EB4  38 60 00 00 */	li r3, 0
/* 800C7F98 000C3EB8  4B FF D2 29 */	bl EXIUnlock
/* 800C7F9C 000C3EBC  38 60 00 00 */	li r3, 0
/* 800C7FA0 000C3EC0  48 00 00 9C */	b lbl_800C803C
lbl_800C7FA4:
/* 800C7FA4 000C3EC4  57 E0 30 32 */	slwi r0, r31, 6
/* 800C7FA8 000C3EC8  90 01 00 14 */	stw r0, 0x14(r1)
/* 800C7FAC 000C3ECC  38 81 00 14 */	addi r4, r1, 0x14
/* 800C7FB0 000C3ED0  38 60 00 00 */	li r3, 0
/* 800C7FB4 000C3ED4  38 A0 00 04 */	li r5, 4
/* 800C7FB8 000C3ED8  38 C0 00 01 */	li r6, 1
/* 800C7FBC 000C3EDC  38 E0 00 00 */	li r7, 0
/* 800C7FC0 000C3EE0  4B FF C0 91 */	bl EXIImm
/* 800C7FC4 000C3EE4  7C 60 00 34 */	cntlzw r0, r3
/* 800C7FC8 000C3EE8  54 1F D9 7E */	srwi r31, r0, 5
/* 800C7FCC 000C3EEC  38 60 00 00 */	li r3, 0
/* 800C7FD0 000C3EF0  4B FF C4 69 */	bl EXISync
/* 800C7FD4 000C3EF4  7C 60 00 34 */	cntlzw r0, r3
/* 800C7FD8 000C3EF8  54 00 D9 7E */	srwi r0, r0, 5
/* 800C7FDC 000C3EFC  38 9D 00 00 */	addi r4, r29, 0
/* 800C7FE0 000C3F00  38 BE 00 00 */	addi r5, r30, 0
/* 800C7FE4 000C3F04  7F FF 03 78 */	or r31, r31, r0
/* 800C7FE8 000C3F08  38 60 00 00 */	li r3, 0
/* 800C7FEC 000C3F0C  38 C0 00 00 */	li r6, 0
/* 800C7FF0 000C3F10  38 E0 00 00 */	li r7, 0
/* 800C7FF4 000C3F14  4B FF C3 59 */	bl EXIDma
/* 800C7FF8 000C3F18  7C 60 00 34 */	cntlzw r0, r3
/* 800C7FFC 000C3F1C  54 00 D9 7E */	srwi r0, r0, 5
/* 800C8000 000C3F20  7F FF 03 78 */	or r31, r31, r0
/* 800C8004 000C3F24  38 60 00 00 */	li r3, 0
/* 800C8008 000C3F28  4B FF C4 31 */	bl EXISync
/* 800C800C 000C3F2C  7C 60 00 34 */	cntlzw r0, r3
/* 800C8010 000C3F30  54 00 D9 7E */	srwi r0, r0, 5
/* 800C8014 000C3F34  7F FF 03 78 */	or r31, r31, r0
/* 800C8018 000C3F38  38 60 00 00 */	li r3, 0
/* 800C801C 000C3F3C  4B FF CB 7D */	bl EXIDeselect
/* 800C8020 000C3F40  7C 60 00 34 */	cntlzw r0, r3
/* 800C8024 000C3F44  54 00 D9 7E */	srwi r0, r0, 5
/* 800C8028 000C3F48  7F FF 03 78 */	or r31, r31, r0
/* 800C802C 000C3F4C  38 60 00 00 */	li r3, 0
/* 800C8030 000C3F50  4B FF D1 91 */	bl EXIUnlock
/* 800C8034 000C3F54  7F E0 00 34 */	cntlzw r0, r31
/* 800C8038 000C3F58  54 03 D9 7E */	srwi r3, r0, 5
lbl_800C803C:
/* 800C803C 000C3F5C  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 800C8040 000C3F60  83 E1 00 24 */	lwz r31, 0x24(r1)
/* 800C8044 000C3F64  83 C1 00 20 */	lwz r30, 0x20(r1)
/* 800C8048 000C3F68  7C 08 03 A6 */	mtlr r0
/* 800C804C 000C3F6C  83 A1 00 1C */	lwz r29, 0x1c(r1)
/* 800C8050 000C3F70  38 21 00 28 */	addi r1, r1, 0x28
/* 800C8054 000C3F74  4E 80 00 20 */	blr

.global OSGetSoundMode
OSGetSoundMode:
/* 800C8058 000C3F78  7C 08 02 A6 */	mflr r0
/* 800C805C 000C3F7C  3C 60 80 2C */	lis r3, Scb@ha
/* 800C8060 000C3F80  90 01 00 04 */	stw r0, 4(r1)
/* 800C8064 000C3F84  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 800C8068 000C3F88  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 800C806C 000C3F8C  3B E3 6D 00 */	addi r31, r3, Scb@l
/* 800C8070 000C3F90  4B FF E0 4D */	bl OSDisableInterrupts
/* 800C8074 000C3F94  80 1F 00 48 */	lwz r0, 0x48(r31)
/* 800C8078 000C3F98  38 9F 00 48 */	addi r4, r31, 0x48
/* 800C807C 000C3F9C  2C 00 00 00 */	cmpwi r0, 0
/* 800C8080 000C3FA0  41 82 00 10 */	beq lbl_800C8090
/* 800C8084 000C3FA4  4B FF E0 61 */	bl OSRestoreInterrupts
/* 800C8088 000C3FA8  3B E0 00 00 */	li r31, 0
/* 800C808C 000C3FAC  48 00 00 10 */	b lbl_800C809C
lbl_800C8090:
/* 800C8090 000C3FB0  90 7F 00 44 */	stw r3, 0x44(r31)
/* 800C8094 000C3FB4  38 00 00 01 */	li r0, 1
/* 800C8098 000C3FB8  90 04 00 00 */	stw r0, 0(r4)
lbl_800C809C:
/* 800C809C 000C3FBC  88 1F 00 13 */	lbz r0, 0x13(r31)
/* 800C80A0 000C3FC0  54 00 07 7B */	rlwinm. r0, r0, 0, 0x1d, 0x1d
/* 800C80A4 000C3FC4  41 82 00 0C */	beq lbl_800C80B0
/* 800C80A8 000C3FC8  3B E0 00 01 */	li r31, 1
/* 800C80AC 000C3FCC  48 00 00 08 */	b lbl_800C80B4
lbl_800C80B0:
/* 800C80B0 000C3FD0  3B E0 00 00 */	li r31, 0
lbl_800C80B4:
/* 800C80B4 000C3FD4  38 60 00 00 */	li r3, 0
/* 800C80B8 000C3FD8  38 80 00 00 */	li r4, 0
/* 800C80BC 000C3FDC  4B FF FB 19 */	bl UnlockSram
/* 800C80C0 000C3FE0  80 01 00 24 */	lwz r0, 0x24(r1)
/* 800C80C4 000C3FE4  7F E3 FB 78 */	mr r3, r31
/* 800C80C8 000C3FE8  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 800C80CC 000C3FEC  38 21 00 20 */	addi r1, r1, 0x20
/* 800C80D0 000C3FF0  7C 08 03 A6 */	mtlr r0
/* 800C80D4 000C3FF4  4E 80 00 20 */	blr

.global OSSetSoundMode
OSSetSoundMode:
/* 800C80D8 000C3FF8  7C 08 02 A6 */	mflr r0
/* 800C80DC 000C3FFC  3C 80 80 2C */	lis r4, Scb@ha
/* 800C80E0 000C4000  90 01 00 04 */	stw r0, 4(r1)
/* 800C80E4 000C4004  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 800C80E8 000C4008  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 800C80EC 000C400C  3B E4 6D 00 */	addi r31, r4, Scb@l
/* 800C80F0 000C4010  93 C1 00 18 */	stw r30, 0x18(r1)
/* 800C80F4 000C4014  54 7E 17 7A */	rlwinm r30, r3, 2, 0x1d, 0x1d
/* 800C80F8 000C4018  4B FF DF C5 */	bl OSDisableInterrupts
/* 800C80FC 000C401C  80 1F 00 48 */	lwz r0, 0x48(r31)
/* 800C8100 000C4020  38 9F 00 48 */	addi r4, r31, 0x48
/* 800C8104 000C4024  2C 00 00 00 */	cmpwi r0, 0
/* 800C8108 000C4028  41 82 00 10 */	beq lbl_800C8118
/* 800C810C 000C402C  4B FF DF D9 */	bl OSRestoreInterrupts
/* 800C8110 000C4030  3B E0 00 00 */	li r31, 0
/* 800C8114 000C4034  48 00 00 10 */	b lbl_800C8124
lbl_800C8118:
/* 800C8118 000C4038  90 7F 00 44 */	stw r3, 0x44(r31)
/* 800C811C 000C403C  38 00 00 01 */	li r0, 1
/* 800C8120 000C4040  90 04 00 00 */	stw r0, 0(r4)
lbl_800C8124:
/* 800C8124 000C4044  88 7F 00 13 */	lbz r3, 0x13(r31)
/* 800C8128 000C4048  54 60 07 7A */	rlwinm r0, r3, 0, 0x1d, 0x1d
/* 800C812C 000C404C  7C 1E 00 40 */	cmplw r30, r0
/* 800C8130 000C4050  40 82 00 14 */	bne lbl_800C8144
/* 800C8134 000C4054  38 60 00 00 */	li r3, 0
/* 800C8138 000C4058  38 80 00 00 */	li r4, 0
/* 800C813C 000C405C  4B FF FA 99 */	bl UnlockSram
/* 800C8140 000C4060  48 00 00 24 */	b lbl_800C8164
lbl_800C8144:
/* 800C8144 000C4064  54 60 07 B8 */	rlwinm r0, r3, 0, 0x1e, 0x1c
/* 800C8148 000C4068  98 1F 00 13 */	stb r0, 0x13(r31)
/* 800C814C 000C406C  38 60 00 01 */	li r3, 1
/* 800C8150 000C4070  38 80 00 00 */	li r4, 0
/* 800C8154 000C4074  88 1F 00 13 */	lbz r0, 0x13(r31)
/* 800C8158 000C4078  7C 00 F3 78 */	or r0, r0, r30
/* 800C815C 000C407C  98 1F 00 13 */	stb r0, 0x13(r31)
/* 800C8160 000C4080  4B FF FA 75 */	bl UnlockSram
lbl_800C8164:
/* 800C8164 000C4084  80 01 00 24 */	lwz r0, 0x24(r1)
/* 800C8168 000C4088  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 800C816C 000C408C  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 800C8170 000C4090  7C 08 03 A6 */	mtlr r0
/* 800C8174 000C4094  38 21 00 20 */	addi r1, r1, 0x20
/* 800C8178 000C4098  4E 80 00 20 */	blr
