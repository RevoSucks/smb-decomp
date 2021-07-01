.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global salCallback
salCallback:
/* 80100DE8 000FCD08  7C 08 02 A6 */	mflr r0
/* 80100DEC 000FCD0C  38 80 02 80 */	li r4, 0x280
/* 80100DF0 000FCD10  90 01 00 04 */	stw r0, 4(r1)
/* 80100DF4 000FCD14  94 21 FF F8 */	stwu r1, -8(r1)
/* 80100DF8 000FCD18  88 AD A5 9C */	lbz r5, salAIBufferIndex-_SDA_BASE_(r13)
/* 80100DFC 000FCD1C  80 6D A5 7C */	lwz r3, salAIBufferBase-_SDA_BASE_(r13)
/* 80100E00 000FCD20  38 A5 00 01 */	addi r5, r5, 1
/* 80100E04 000FCD24  7C A0 16 70 */	srawi r0, r5, 2
/* 80100E08 000FCD28  7C 00 01 94 */	addze r0, r0
/* 80100E0C 000FCD2C  54 00 10 3A */	slwi r0, r0, 2
/* 80100E10 000FCD30  7C 00 28 10 */	subfc r0, r0, r5
/* 80100E14 000FCD34  98 0D A5 9C */	stb r0, salAIBufferIndex-_SDA_BASE_(r13)
/* 80100E18 000FCD38  3C 63 80 00 */	addis r3, r3, 0x8000
/* 80100E1C 000FCD3C  88 0D A5 9C */	lbz r0, salAIBufferIndex-_SDA_BASE_(r13)
/* 80100E20 000FCD40  1C 00 02 80 */	mulli r0, r0, 0x280
/* 80100E24 000FCD44  7C 63 02 14 */	add r3, r3, r0
/* 80100E28 000FCD48  4B FD 1B 01 */	bl AIInitDMA
/* 80100E2C 000FCD4C  4B FC 8B 69 */	bl OSGetTick
/* 80100E30 000FCD50  90 6D A5 8C */	stw r3, salLastTick-_SDA_BASE_(r13)
/* 80100E34 000FCD54  80 0D A5 80 */	lwz r0, salDspIsDone-_SDA_BASE_(r13)
/* 80100E38 000FCD58  28 00 00 00 */	cmplwi r0, 0
/* 80100E3C 000FCD5C  41 82 00 38 */	beq lbl_80100E74
/* 80100E40 000FCD60  80 0D A5 88 */	lwz r0, salLogicActive-_SDA_BASE_(r13)
/* 80100E44 000FCD64  28 00 00 00 */	cmplwi r0, 0
/* 80100E48 000FCD68  40 82 00 34 */	bne lbl_80100E7C
/* 80100E4C 000FCD6C  38 00 00 01 */	li r0, 1
/* 80100E50 000FCD70  90 0D A5 88 */	stw r0, salLogicActive-_SDA_BASE_(r13)
/* 80100E54 000FCD74  4B FC 52 7D */	bl OSEnableInterrupts
/* 80100E58 000FCD78  81 8D A5 78 */	lwz r12, userCallback-_SDA_BASE_(r13)
/* 80100E5C 000FCD7C  7D 88 03 A6 */	mtlr r12
/* 80100E60 000FCD80  4E 80 00 21 */	blrl
/* 80100E64 000FCD84  4B FC 52 59 */	bl OSDisableInterrupts
/* 80100E68 000FCD88  38 00 00 00 */	li r0, 0
/* 80100E6C 000FCD8C  90 0D A5 88 */	stw r0, salLogicActive-_SDA_BASE_(r13)
/* 80100E70 000FCD90  48 00 00 0C */	b lbl_80100E7C
lbl_80100E74:
/* 80100E74 000FCD94  38 00 00 01 */	li r0, 1
/* 80100E78 000FCD98  90 0D A5 84 */	stw r0, salLogicIsWaiting-_SDA_BASE_(r13)
lbl_80100E7C:
/* 80100E7C 000FCD9C  80 01 00 0C */	lwz r0, 0xc(r1)
/* 80100E80 000FCDA0  38 21 00 08 */	addi r1, r1, 8
/* 80100E84 000FCDA4  7C 08 03 A6 */	mtlr r0
/* 80100E88 000FCDA8  4E 80 00 20 */	blr

.global dspInitCallback
dspInitCallback:
/* 80100E8C 000FCDAC  38 00 00 01 */	li r0, 1
/* 80100E90 000FCDB0  90 0D A5 80 */	stw r0, salDspIsDone-_SDA_BASE_(r13)
/* 80100E94 000FCDB4  90 0D A5 90 */	stw r0, salDspInitIsDone-_SDA_BASE_(r13)
/* 80100E98 000FCDB8  4E 80 00 20 */	blr

.global dspResumeCallback
dspResumeCallback:
/* 80100E9C 000FCDBC  7C 08 02 A6 */	mflr r0
/* 80100EA0 000FCDC0  38 60 00 01 */	li r3, 1
/* 80100EA4 000FCDC4  90 01 00 04 */	stw r0, 4(r1)
/* 80100EA8 000FCDC8  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 80100EAC 000FCDCC  93 E1 00 14 */	stw r31, 0x14(r1)
/* 80100EB0 000FCDD0  90 6D A5 80 */	stw r3, salDspIsDone-_SDA_BASE_(r13)
/* 80100EB4 000FCDD4  80 0D A5 84 */	lwz r0, salLogicIsWaiting-_SDA_BASE_(r13)
/* 80100EB8 000FCDD8  28 00 00 00 */	cmplwi r0, 0
/* 80100EBC 000FCDDC  41 82 00 34 */	beq lbl_80100EF0
/* 80100EC0 000FCDE0  3B E0 00 00 */	li r31, 0
/* 80100EC4 000FCDE4  93 ED A5 84 */	stw r31, salLogicIsWaiting-_SDA_BASE_(r13)
/* 80100EC8 000FCDE8  80 0D A5 88 */	lwz r0, salLogicActive-_SDA_BASE_(r13)
/* 80100ECC 000FCDEC  28 00 00 00 */	cmplwi r0, 0
/* 80100ED0 000FCDF0  40 82 00 20 */	bne lbl_80100EF0
/* 80100ED4 000FCDF4  90 6D A5 88 */	stw r3, salLogicActive-_SDA_BASE_(r13)
/* 80100ED8 000FCDF8  4B FC 51 F9 */	bl OSEnableInterrupts
/* 80100EDC 000FCDFC  81 8D A5 78 */	lwz r12, userCallback-_SDA_BASE_(r13)
/* 80100EE0 000FCE00  7D 88 03 A6 */	mtlr r12
/* 80100EE4 000FCE04  4E 80 00 21 */	blrl
/* 80100EE8 000FCE08  4B FC 51 D5 */	bl OSDisableInterrupts
/* 80100EEC 000FCE0C  93 ED A5 88 */	stw r31, salLogicActive-_SDA_BASE_(r13)
lbl_80100EF0:
/* 80100EF0 000FCE10  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 80100EF4 000FCE14  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 80100EF8 000FCE18  38 21 00 18 */	addi r1, r1, 0x18
/* 80100EFC 000FCE1C  7C 08 03 A6 */	mtlr r0
/* 80100F00 000FCE20  4E 80 00 20 */	blr

.global salInitAi
salInitAi:
/* 80100F04 000FCE24  7C 08 02 A6 */	mflr r0
/* 80100F08 000FCE28  90 01 00 04 */	stw r0, 4(r1)
/* 80100F0C 000FCE2C  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 80100F10 000FCE30  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 80100F14 000FCE34  3B E5 00 00 */	addi r31, r5, 0
/* 80100F18 000FCE38  93 C1 00 18 */	stw r30, 0x18(r1)
/* 80100F1C 000FCE3C  3B C3 00 00 */	addi r30, r3, 0
/* 80100F20 000FCE40  38 60 0A 00 */	li r3, 0xa00
/* 80100F24 000FCE44  48 00 03 55 */	bl salMalloc
/* 80100F28 000FCE48  28 03 00 00 */	cmplwi r3, 0
/* 80100F2C 000FCE4C  90 6D A5 7C */	stw r3, salAIBufferBase-_SDA_BASE_(r13)
/* 80100F30 000FCE50  41 82 00 84 */	beq lbl_80100FB4
/* 80100F34 000FCE54  80 6D A5 7C */	lwz r3, salAIBufferBase-_SDA_BASE_(r13)
/* 80100F38 000FCE58  38 80 00 00 */	li r4, 0
/* 80100F3C 000FCE5C  38 A0 0A 00 */	li r5, 0xa00
/* 80100F40 000FCE60  4B F0 23 E1 */	bl memset
/* 80100F44 000FCE64  80 6D A5 7C */	lwz r3, salAIBufferBase-_SDA_BASE_(r13)
/* 80100F48 000FCE68  38 80 0A 00 */	li r4, 0xa00
/* 80100F4C 000FCE6C  4B FC 20 15 */	bl DCFlushRange
/* 80100F50 000FCE70  38 00 00 00 */	li r0, 0
/* 80100F54 000FCE74  93 CD A5 78 */	stw r30, userCallback-_SDA_BASE_(r13)
/* 80100F58 000FCE78  38 80 00 01 */	li r4, 1
/* 80100F5C 000FCE7C  90 0D A5 84 */	stw r0, salLogicIsWaiting-_SDA_BASE_(r13)
/* 80100F60 000FCE80  3C 60 80 10 */	lis r3, salCallback@ha
/* 80100F64 000FCE84  38 63 0D E8 */	addi r3, r3, salCallback@l
/* 80100F68 000FCE88  90 8D A5 80 */	stw r4, salDspIsDone-_SDA_BASE_(r13)
/* 80100F6C 000FCE8C  98 8D A5 9C */	stb r4, salAIBufferIndex-_SDA_BASE_(r13)
/* 80100F70 000FCE90  90 0D A5 88 */	stw r0, salLogicActive-_SDA_BASE_(r13)
/* 80100F74 000FCE94  4B FD 19 71 */	bl AIRegisterDMACallback
/* 80100F78 000FCE98  88 0D A5 9C */	lbz r0, salAIBufferIndex-_SDA_BASE_(r13)
/* 80100F7C 000FCE9C  38 80 02 80 */	li r4, 0x280
/* 80100F80 000FCEA0  80 6D A5 7C */	lwz r3, salAIBufferBase-_SDA_BASE_(r13)
/* 80100F84 000FCEA4  1C 00 02 80 */	mulli r0, r0, 0x280
/* 80100F88 000FCEA8  3C 63 80 00 */	addis r3, r3, 0x8000
/* 80100F8C 000FCEAC  7C 63 02 14 */	add r3, r3, r0
/* 80100F90 000FCEB0  4B FD 19 99 */	bl AIInitDMA
/* 80100F94 000FCEB4  3C 60 80 2D */	lis r3, lbl_802D6240@ha
/* 80100F98 000FCEB8  38 63 62 40 */	addi r3, r3, lbl_802D6240@l
/* 80100F9C 000FCEBC  38 00 00 20 */	li r0, 0x20
/* 80100FA0 000FCEC0  90 03 00 04 */	stw r0, 4(r3)
/* 80100FA4 000FCEC4  38 00 7D 00 */	li r0, 0x7d00
/* 80100FA8 000FCEC8  38 60 00 01 */	li r3, 1
/* 80100FAC 000FCECC  90 1F 00 00 */	stw r0, 0(r31)
/* 80100FB0 000FCED0  48 00 00 08 */	b lbl_80100FB8
lbl_80100FB4:
/* 80100FB4 000FCED4  38 60 00 00 */	li r3, 0
lbl_80100FB8:
/* 80100FB8 000FCED8  80 01 00 24 */	lwz r0, 0x24(r1)
/* 80100FBC 000FCEDC  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 80100FC0 000FCEE0  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 80100FC4 000FCEE4  7C 08 03 A6 */	mtlr r0
/* 80100FC8 000FCEE8  38 21 00 20 */	addi r1, r1, 0x20
/* 80100FCC 000FCEEC  4E 80 00 20 */	blr

.global salStartAi
salStartAi:
/* 80100FD0 000FCEF0  7C 08 02 A6 */	mflr r0
/* 80100FD4 000FCEF4  90 01 00 04 */	stw r0, 4(r1)
/* 80100FD8 000FCEF8  94 21 FF F8 */	stwu r1, -8(r1)
/* 80100FDC 000FCEFC  4B FD 19 D5 */	bl AIStartDMA
/* 80100FE0 000FCF00  80 01 00 0C */	lwz r0, 0xc(r1)
/* 80100FE4 000FCF04  38 21 00 08 */	addi r1, r1, 8
/* 80100FE8 000FCF08  7C 08 03 A6 */	mtlr r0
/* 80100FEC 000FCF0C  4E 80 00 20 */	blr

.global salAiGetDest
salAiGetDest:
/* 80100FF0 000FCF10  88 6D A5 9C */	lbz r3, salAIBufferIndex-_SDA_BASE_(r13)
/* 80100FF4 000FCF14  80 8D A5 7C */	lwz r4, salAIBufferBase-_SDA_BASE_(r13)
/* 80100FF8 000FCF18  38 63 00 02 */	addi r3, r3, 2
/* 80100FFC 000FCF1C  7C 60 16 70 */	srawi r0, r3, 2
/* 80101000 000FCF20  7C 00 01 94 */	addze r0, r0
/* 80101004 000FCF24  54 00 10 3A */	slwi r0, r0, 2
/* 80101008 000FCF28  7C 00 18 10 */	subfc r0, r0, r3
/* 8010100C 000FCF2C  54 00 06 3E */	clrlwi r0, r0, 0x18
/* 80101010 000FCF30  1C 00 02 80 */	mulli r0, r0, 0x280
/* 80101014 000FCF34  7C 64 02 14 */	add r3, r4, r0
/* 80101018 000FCF38  4E 80 00 20 */	blr

.global salInitDsp
salInitDsp:
/* 8010101C 000FCF3C  7C 08 02 A6 */	mflr r0
/* 80101020 000FCF40  3C 80 80 10 */	lis r4, dspInitCallback@ha
/* 80101024 000FCF44  90 01 00 04 */	stw r0, 4(r1)
/* 80101028 000FCF48  3C 60 80 2F */	lis r3, lbl_802EBE80@ha
/* 8010102C 000FCF4C  38 E0 20 00 */	li r7, 0x2000
/* 80101030 000FCF50  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 80101034 000FCF54  38 C0 00 10 */	li r6, 0x10
/* 80101038 000FCF58  38 84 0E 8C */	addi r4, r4, dspInitCallback@l
/* 8010103C 000FCF5C  93 E1 00 14 */	stw r31, 0x14(r1)
/* 80101040 000FCF60  3B E0 00 00 */	li r31, 0
/* 80101044 000FCF64  93 C1 00 10 */	stw r30, 0x10(r1)
/* 80101048 000FCF68  3B C3 BE 80 */	addi r30, r3, lbl_802EBE80@l
/* 8010104C 000FCF6C  3C 60 80 1F */	lis r3, lbl_801EAE00@ha
/* 80101050 000FCF70  38 03 AE 00 */	addi r0, r3, lbl_801EAE00@l
/* 80101054 000FCF74  90 1E 00 0C */	stw r0, 0xc(r30)
/* 80101058 000FCF78  38 1E 00 60 */	addi r0, r30, 0x60
/* 8010105C 000FCF7C  3C 60 80 10 */	lis r3, dspResumeCallback@ha
/* 80101060 000FCF80  A0 AD 98 B0 */	lhz r5, dspSlaveLength-_SDA_BASE_(r13)
/* 80101064 000FCF84  90 BE 00 10 */	stw r5, 0x10(r30)
/* 80101068 000FCF88  38 A0 00 30 */	li r5, 0x30
/* 8010106C 000FCF8C  93 FE 00 14 */	stw r31, 0x14(r30)
/* 80101070 000FCF90  90 1E 00 18 */	stw r0, 0x18(r30)
/* 80101074 000FCF94  38 03 0E 9C */	addi r0, r3, dspResumeCallback@l
/* 80101078 000FCF98  90 FE 00 1C */	stw r7, 0x1c(r30)
/* 8010107C 000FCF9C  93 FE 00 20 */	stw r31, 0x20(r30)
/* 80101080 000FCFA0  B0 DE 00 24 */	sth r6, 0x24(r30)
/* 80101084 000FCFA4  B0 BE 00 26 */	sth r5, 0x26(r30)
/* 80101088 000FCFA8  90 9E 00 28 */	stw r4, 0x28(r30)
/* 8010108C 000FCFAC  90 1E 00 2C */	stw r0, 0x2c(r30)
/* 80101090 000FCFB0  93 FE 00 30 */	stw r31, 0x30(r30)
/* 80101094 000FCFB4  93 FE 00 34 */	stw r31, 0x34(r30)
/* 80101098 000FCFB8  93 FE 00 04 */	stw r31, 4(r30)
/* 8010109C 000FCFBC  4B FD 37 29 */	bl DSPInit
/* 801010A0 000FCFC0  7F C3 F3 78 */	mr r3, r30
/* 801010A4 000FCFC4  4B FD 37 D9 */	bl DSPAddTask
/* 801010A8 000FCFC8  93 ED A5 90 */	stw r31, salDspInitIsDone-_SDA_BASE_(r13)
/* 801010AC 000FCFCC  48 00 01 1D */	bl hwEnableIrq
lbl_801010B0:
/* 801010B0 000FCFD0  80 0D A5 90 */	lwz r0, salDspInitIsDone-_SDA_BASE_(r13)
/* 801010B4 000FCFD4  28 00 00 00 */	cmplwi r0, 0
/* 801010B8 000FCFD8  41 82 FF F8 */	beq lbl_801010B0
/* 801010BC 000FCFDC  48 00 01 45 */	bl hwDisableIrq
/* 801010C0 000FCFE0  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 801010C4 000FCFE4  38 60 00 01 */	li r3, 1
/* 801010C8 000FCFE8  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 801010CC 000FCFEC  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 801010D0 000FCFF0  7C 08 03 A6 */	mtlr r0
/* 801010D4 000FCFF4  38 21 00 18 */	addi r1, r1, 0x18
/* 801010D8 000FCFF8  4E 80 00 20 */	blr

.global salCtrlDsp
salCtrlDsp:
/* 801010DC 000FCFFC  7C 08 02 A6 */	mflr r0
/* 801010E0 000FD000  90 01 00 04 */	stw r0, 4(r1)
/* 801010E4 000FD004  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 801010E8 000FD008  93 E1 00 14 */	stw r31, 0x14(r1)
/* 801010EC 000FD00C  7C 7F 1B 78 */	mr r31, r3
/* 801010F0 000FD010  48 00 00 61 */	bl salGetStartDelay
/* 801010F4 000FD014  38 83 00 00 */	addi r4, r3, 0
/* 801010F8 000FD018  38 7F 00 00 */	addi r3, r31, 0
/* 801010FC 000FD01C  4B FF 7E 45 */	bl salBuildCommandList
/* 80101100 000FD020  38 00 00 00 */	li r0, 0
/* 80101104 000FD024  83 ED A5 08 */	lwz r31, dspCmdList-_SDA_BASE_(r13)
/* 80101108 000FD028  90 0D A5 80 */	stw r0, salDspIsDone-_SDA_BASE_(r13)
/* 8010110C 000FD02C  4B FC 06 25 */	bl PPCSync
/* 80101110 000FD030  A0 0D A5 04 */	lhz r0, dspCmdFirstSize-_SDA_BASE_(r13)
/* 80101114 000FD034  64 03 BA BE */	oris r3, r0, 0xbabe
/* 80101118 000FD038  4B FD 36 99 */	bl DSPSendMailToDSP
lbl_8010111C:
/* 8010111C 000FD03C  4B FD 36 5D */	bl DSPCheckMailToDSP
/* 80101120 000FD040  28 03 00 00 */	cmplwi r3, 0
/* 80101124 000FD044  40 82 FF F8 */	bne lbl_8010111C
/* 80101128 000FD048  7F E3 FB 78 */	mr r3, r31
/* 8010112C 000FD04C  4B FD 36 85 */	bl DSPSendMailToDSP
lbl_80101130:
/* 80101130 000FD050  4B FD 36 49 */	bl DSPCheckMailToDSP
/* 80101134 000FD054  28 03 00 00 */	cmplwi r3, 0
/* 80101138 000FD058  40 82 FF F8 */	bne lbl_80101130
/* 8010113C 000FD05C  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 80101140 000FD060  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 80101144 000FD064  38 21 00 18 */	addi r1, r1, 0x18
/* 80101148 000FD068  7C 08 03 A6 */	mtlr r0
/* 8010114C 000FD06C  4E 80 00 20 */	blr

.global salGetStartDelay
salGetStartDelay:
/* 80101150 000FD070  7C 08 02 A6 */	mflr r0
/* 80101154 000FD074  90 01 00 04 */	stw r0, 4(r1)
/* 80101158 000FD078  94 21 FF F8 */	stwu r1, -8(r1)
/* 8010115C 000FD07C  4B FC 88 39 */	bl OSGetTick
/* 80101160 000FD080  3C 80 80 00 */	lis r4, 0x800000F8@ha
/* 80101164 000FD084  80 AD A5 8C */	lwz r5, salLastTick-_SDA_BASE_(r13)
/* 80101168 000FD088  80 04 00 F8 */	lwz r0, 0x800000F8@l(r4)
/* 8010116C 000FD08C  3C 80 43 1C */	lis r4, 0x431BDE83@ha
/* 80101170 000FD090  7C A5 18 50 */	subf r5, r5, r3
/* 80101174 000FD094  54 00 F0 BE */	srwi r0, r0, 2
/* 80101178 000FD098  38 64 DE 83 */	addi r3, r4, 0x431BDE83@l
/* 8010117C 000FD09C  7C 03 00 16 */	mulhwu r0, r3, r0
/* 80101180 000FD0A0  54 A3 18 38 */	slwi r3, r5, 3
/* 80101184 000FD0A4  54 00 8B FE */	srwi r0, r0, 0xf
/* 80101188 000FD0A8  7C 63 03 96 */	divwu r3, r3, r0
/* 8010118C 000FD0AC  80 01 00 0C */	lwz r0, 0xc(r1)
/* 80101190 000FD0B0  38 21 00 08 */	addi r1, r1, 8
/* 80101194 000FD0B4  7C 08 03 A6 */	mtlr r0
/* 80101198 000FD0B8  4E 80 00 20 */	blr

.global hwInitIrq
hwInitIrq:
/* 8010119C 000FD0BC  7C 08 02 A6 */	mflr r0
/* 801011A0 000FD0C0  90 01 00 04 */	stw r0, 4(r1)
/* 801011A4 000FD0C4  94 21 FF F8 */	stwu r1, -8(r1)
/* 801011A8 000FD0C8  4B FC 4F 15 */	bl OSDisableInterrupts
/* 801011AC 000FD0CC  90 6D A5 98 */	stw r3, oldState-_SDA_BASE_(r13)
/* 801011B0 000FD0D0  38 00 00 01 */	li r0, 1
/* 801011B4 000FD0D4  B0 0D A5 94 */	sth r0, hwIrqLevel-_SDA_BASE_(r13)
/* 801011B8 000FD0D8  80 01 00 0C */	lwz r0, 0xc(r1)
/* 801011BC 000FD0DC  38 21 00 08 */	addi r1, r1, 8
/* 801011C0 000FD0E0  7C 08 03 A6 */	mtlr r0
/* 801011C4 000FD0E4  4E 80 00 20 */	blr

.global hwEnableIrq
hwEnableIrq:
/* 801011C8 000FD0E8  7C 08 02 A6 */	mflr r0
/* 801011CC 000FD0EC  90 01 00 04 */	stw r0, 4(r1)
/* 801011D0 000FD0F0  94 21 FF F8 */	stwu r1, -8(r1)
/* 801011D4 000FD0F4  A0 6D A5 94 */	lhz r3, hwIrqLevel-_SDA_BASE_(r13)
/* 801011D8 000FD0F8  38 63 FF FF */	addi r3, r3, -1
/* 801011DC 000FD0FC  54 60 04 3F */	clrlwi. r0, r3, 0x10
/* 801011E0 000FD100  B0 6D A5 94 */	sth r3, hwIrqLevel-_SDA_BASE_(r13)
/* 801011E4 000FD104  40 82 00 0C */	bne lbl_801011F0
/* 801011E8 000FD108  80 6D A5 98 */	lwz r3, oldState-_SDA_BASE_(r13)
/* 801011EC 000FD10C  4B FC 4E F9 */	bl OSRestoreInterrupts
lbl_801011F0:
/* 801011F0 000FD110  80 01 00 0C */	lwz r0, 0xc(r1)
/* 801011F4 000FD114  38 21 00 08 */	addi r1, r1, 8
/* 801011F8 000FD118  7C 08 03 A6 */	mtlr r0
/* 801011FC 000FD11C  4E 80 00 20 */	blr

.global hwDisableIrq
hwDisableIrq:
/* 80101200 000FD120  7C 08 02 A6 */	mflr r0
/* 80101204 000FD124  90 01 00 04 */	stw r0, 4(r1)
/* 80101208 000FD128  94 21 FF F8 */	stwu r1, -8(r1)
/* 8010120C 000FD12C  A0 6D A5 94 */	lhz r3, hwIrqLevel-_SDA_BASE_(r13)
/* 80101210 000FD130  38 03 00 01 */	addi r0, r3, 1
/* 80101214 000FD134  28 03 00 00 */	cmplwi r3, 0
/* 80101218 000FD138  B0 0D A5 94 */	sth r0, hwIrqLevel-_SDA_BASE_(r13)
/* 8010121C 000FD13C  40 82 00 0C */	bne lbl_80101228
/* 80101220 000FD140  4B FC 4E 9D */	bl OSDisableInterrupts
/* 80101224 000FD144  90 6D A5 98 */	stw r3, oldState-_SDA_BASE_(r13)
lbl_80101228:
/* 80101228 000FD148  80 01 00 0C */	lwz r0, 0xc(r1)
/* 8010122C 000FD14C  38 21 00 08 */	addi r1, r1, 8
/* 80101230 000FD150  7C 08 03 A6 */	mtlr r0
/* 80101234 000FD154  4E 80 00 20 */	blr

.global hwIRQEnterCritical
hwIRQEnterCritical:
/* 80101238 000FD158  7C 08 02 A6 */	mflr r0
/* 8010123C 000FD15C  90 01 00 04 */	stw r0, 4(r1)
/* 80101240 000FD160  94 21 FF F8 */	stwu r1, -8(r1)
/* 80101244 000FD164  4B FC 4E 79 */	bl OSDisableInterrupts
/* 80101248 000FD168  80 01 00 0C */	lwz r0, 0xc(r1)
/* 8010124C 000FD16C  38 21 00 08 */	addi r1, r1, 8
/* 80101250 000FD170  7C 08 03 A6 */	mtlr r0
/* 80101254 000FD174  4E 80 00 20 */	blr

.global hwIRQLeaveCritical
hwIRQLeaveCritical:
/* 80101258 000FD178  7C 08 02 A6 */	mflr r0
/* 8010125C 000FD17C  90 01 00 04 */	stw r0, 4(r1)
/* 80101260 000FD180  94 21 FF F8 */	stwu r1, -8(r1)
/* 80101264 000FD184  4B FC 4E 6D */	bl OSEnableInterrupts
/* 80101268 000FD188  80 01 00 0C */	lwz r0, 0xc(r1)
/* 8010126C 000FD18C  38 21 00 08 */	addi r1, r1, 8
/* 80101270 000FD190  7C 08 03 A6 */	mtlr r0
/* 80101274 000FD194  4E 80 00 20 */	blr
