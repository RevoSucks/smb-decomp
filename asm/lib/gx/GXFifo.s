.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global GXCPInterruptHandler
GXCPInterruptHandler:
/* 800DCF70 000D8E90  7C 08 02 A6 */	mflr r0
/* 800DCF74 000D8E94  90 01 00 04 */	stw r0, 4(r1)
/* 800DCF78 000D8E98  94 21 FD 20 */	stwu r1, -0x2e0(r1)
/* 800DCF7C 000D8E9C  93 E1 02 DC */	stw r31, 0x2dc(r1)
/* 800DCF80 000D8EA0  7C 9F 23 78 */	mr r31, r4
/* 800DCF84 000D8EA4  80 AD A3 64 */	lwz r5, __cpReg-_SDA_BASE_(r13)
/* 800DCF88 000D8EA8  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800DCF8C 000D8EAC  A0 05 00 00 */	lhz r0, 0(r5)
/* 800DCF90 000D8EB0  90 03 00 0C */	stw r0, 0xc(r3)
/* 800DCF94 000D8EB4  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800DCF98 000D8EB8  80 03 00 08 */	lwz r0, 8(r3)
/* 800DCF9C 000D8EBC  54 00 EF FF */	rlwinm. r0, r0, 0x1d, 0x1f, 0x1f
/* 800DCFA0 000D8EC0  41 82 00 38 */	beq lbl_800DCFD8
/* 800DCFA4 000D8EC4  80 03 00 0C */	lwz r0, 0xc(r3)
/* 800DCFA8 000D8EC8  54 00 FF FF */	rlwinm. r0, r0, 0x1f, 0x1f, 0x1f
/* 800DCFAC 000D8ECC  41 82 00 2C */	beq lbl_800DCFD8
/* 800DCFB0 000D8ED0  80 6D A3 70 */	lwz r3, __GXCurrentThread-_SDA_BASE_(r13)
/* 800DCFB4 000D8ED4  4B FE C3 E1 */	bl OSResumeThread
/* 800DCFB8 000D8ED8  38 00 00 00 */	li r0, 0
/* 800DCFBC 000D8EDC  90 0D A3 78 */	stw r0, GXOverflowSuspendInProgress-_SDA_BASE_(r13)
/* 800DCFC0 000D8EE0  38 60 00 01 */	li r3, 1
/* 800DCFC4 000D8EE4  38 80 00 01 */	li r4, 1
/* 800DCFC8 000D8EE8  48 00 07 6D */	bl __GXWriteFifoIntReset
/* 800DCFCC 000D8EEC  38 60 00 01 */	li r3, 1
/* 800DCFD0 000D8EF0  38 80 00 00 */	li r4, 0
/* 800DCFD4 000D8EF4  48 00 07 15 */	bl __GXWriteFifoIntEnable
lbl_800DCFD8:
/* 800DCFD8 000D8EF8  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800DCFDC 000D8EFC  80 03 00 08 */	lwz r0, 8(r3)
/* 800DCFE0 000D8F00  54 00 F7 FF */	rlwinm. r0, r0, 0x1e, 0x1f, 0x1f
/* 800DCFE4 000D8F04  41 82 00 44 */	beq lbl_800DD028
/* 800DCFE8 000D8F08  80 03 00 0C */	lwz r0, 0xc(r3)
/* 800DCFEC 000D8F0C  54 00 07 FF */	clrlwi. r0, r0, 0x1f
/* 800DCFF0 000D8F10  41 82 00 38 */	beq lbl_800DD028
/* 800DCFF4 000D8F14  80 AD A3 80 */	lwz r5, __GXOverflowCount-_SDA_BASE_(r13)
/* 800DCFF8 000D8F18  38 60 00 00 */	li r3, 0
/* 800DCFFC 000D8F1C  38 80 00 01 */	li r4, 1
/* 800DD000 000D8F20  38 05 00 01 */	addi r0, r5, 1
/* 800DD004 000D8F24  90 0D A3 80 */	stw r0, __GXOverflowCount-_SDA_BASE_(r13)
/* 800DD008 000D8F28  48 00 06 E1 */	bl __GXWriteFifoIntEnable
/* 800DD00C 000D8F2C  38 60 00 01 */	li r3, 1
/* 800DD010 000D8F30  38 80 00 00 */	li r4, 0
/* 800DD014 000D8F34  48 00 07 21 */	bl __GXWriteFifoIntReset
/* 800DD018 000D8F38  38 00 00 01 */	li r0, 1
/* 800DD01C 000D8F3C  80 6D A3 70 */	lwz r3, __GXCurrentThread-_SDA_BASE_(r13)
/* 800DD020 000D8F40  90 0D A3 78 */	stw r0, GXOverflowSuspendInProgress-_SDA_BASE_(r13)
/* 800DD024 000D8F44  4B FE C5 F9 */	bl OSSuspendThread
lbl_800DD028:
/* 800DD028 000D8F48  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800DD02C 000D8F4C  80 83 00 08 */	lwz r4, 8(r3)
/* 800DD030 000D8F50  38 A3 00 08 */	addi r5, r3, 8
/* 800DD034 000D8F54  54 80 DF FF */	rlwinm. r0, r4, 0x1b, 0x1f, 0x1f
/* 800DD038 000D8F58  41 82 00 60 */	beq lbl_800DD098
/* 800DD03C 000D8F5C  80 03 00 0C */	lwz r0, 0xc(r3)
/* 800DD040 000D8F60  54 00 E7 FF */	rlwinm. r0, r0, 0x1c, 0x1f, 0x1f
/* 800DD044 000D8F64  41 82 00 54 */	beq lbl_800DD098
/* 800DD048 000D8F68  54 80 06 F2 */	rlwinm r0, r4, 0, 0x1b, 0x19
/* 800DD04C 000D8F6C  90 05 00 00 */	stw r0, 0(r5)
/* 800DD050 000D8F70  80 8D 97 C8 */	lwz r4, gx-_SDA_BASE_(r13)
/* 800DD054 000D8F74  80 6D A3 64 */	lwz r3, __cpReg-_SDA_BASE_(r13)
/* 800DD058 000D8F78  80 04 00 08 */	lwz r0, 8(r4)
/* 800DD05C 000D8F7C  B0 03 00 02 */	sth r0, 2(r3)
/* 800DD060 000D8F80  80 0D A3 7C */	lwz r0, BreakPointCB-_SDA_BASE_(r13)
/* 800DD064 000D8F84  28 00 00 00 */	cmplwi r0, 0
/* 800DD068 000D8F88  41 82 00 30 */	beq lbl_800DD098
/* 800DD06C 000D8F8C  38 61 00 10 */	addi r3, r1, 0x10
/* 800DD070 000D8F90  4B FE 68 19 */	bl OSClearContext
/* 800DD074 000D8F94  38 61 00 10 */	addi r3, r1, 0x10
/* 800DD078 000D8F98  4B FE 66 49 */	bl OSSetCurrentContext
/* 800DD07C 000D8F9C  81 8D A3 7C */	lwz r12, BreakPointCB-_SDA_BASE_(r13)
/* 800DD080 000D8FA0  7D 88 03 A6 */	mtlr r12
/* 800DD084 000D8FA4  4E 80 00 21 */	blrl
/* 800DD088 000D8FA8  38 61 00 10 */	addi r3, r1, 0x10
/* 800DD08C 000D8FAC  4B FE 67 FD */	bl OSClearContext
/* 800DD090 000D8FB0  7F E3 FB 78 */	mr r3, r31
/* 800DD094 000D8FB4  4B FE 66 2D */	bl OSSetCurrentContext
lbl_800DD098:
/* 800DD098 000D8FB8  80 01 02 E4 */	lwz r0, 0x2e4(r1)
/* 800DD09C 000D8FBC  83 E1 02 DC */	lwz r31, 0x2dc(r1)
/* 800DD0A0 000D8FC0  38 21 02 E0 */	addi r1, r1, 0x2e0
/* 800DD0A4 000D8FC4  7C 08 03 A6 */	mtlr r0
/* 800DD0A8 000D8FC8  4E 80 00 20 */	blr

.global GXInitFifoBase
GXInitFifoBase:
/* 800DD0AC 000D8FCC  7C 08 02 A6 */	mflr r0
/* 800DD0B0 000D8FD0  90 01 00 04 */	stw r0, 4(r1)
/* 800DD0B4 000D8FD4  38 05 FF FC */	addi r0, r5, -4
/* 800DD0B8 000D8FD8  94 21 FF E0 */	stwu r1, -0x20(r1)
/* 800DD0BC 000D8FDC  93 E1 00 1C */	stw r31, 0x1c(r1)
/* 800DD0C0 000D8FE0  3B E4 00 00 */	addi r31, r4, 0
/* 800DD0C4 000D8FE4  7C 1F 02 14 */	add r0, r31, r0
/* 800DD0C8 000D8FE8  93 C1 00 18 */	stw r30, 0x18(r1)
/* 800DD0CC 000D8FEC  3B C3 00 00 */	addi r30, r3, 0
/* 800DD0D0 000D8FF0  38 85 C0 00 */	addi r4, r5, -16384
/* 800DD0D4 000D8FF4  93 E3 00 00 */	stw r31, 0(r3)
/* 800DD0D8 000D8FF8  90 03 00 04 */	stw r0, 4(r3)
/* 800DD0DC 000D8FFC  38 00 00 00 */	li r0, 0
/* 800DD0E0 000D9000  90 A3 00 08 */	stw r5, 8(r3)
/* 800DD0E4 000D9004  54 A5 F8 74 */	rlwinm r5, r5, 0x1f, 1, 0x1a
/* 800DD0E8 000D9008  90 1E 00 1C */	stw r0, 0x1c(r30)
/* 800DD0EC 000D900C  48 00 00 9D */	bl GXInitFifoLimits
/* 800DD0F0 000D9010  38 7E 00 00 */	addi r3, r30, 0
/* 800DD0F4 000D9014  38 9F 00 00 */	addi r4, r31, 0
/* 800DD0F8 000D9018  38 BF 00 00 */	addi r5, r31, 0
/* 800DD0FC 000D901C  48 00 00 1D */	bl GXInitFifoPtrs
/* 800DD100 000D9020  80 01 00 24 */	lwz r0, 0x24(r1)
/* 800DD104 000D9024  83 E1 00 1C */	lwz r31, 0x1c(r1)
/* 800DD108 000D9028  83 C1 00 18 */	lwz r30, 0x18(r1)
/* 800DD10C 000D902C  7C 08 03 A6 */	mtlr r0
/* 800DD110 000D9030  38 21 00 20 */	addi r1, r1, 0x20
/* 800DD114 000D9034  4E 80 00 20 */	blr

.global GXInitFifoPtrs
GXInitFifoPtrs:
/* 800DD118 000D9038  7C 08 02 A6 */	mflr r0
/* 800DD11C 000D903C  90 01 00 04 */	stw r0, 4(r1)
/* 800DD120 000D9040  94 21 FF D8 */	stwu r1, -0x28(r1)
/* 800DD124 000D9044  93 E1 00 24 */	stw r31, 0x24(r1)
/* 800DD128 000D9048  3B E5 00 00 */	addi r31, r5, 0
/* 800DD12C 000D904C  93 C1 00 20 */	stw r30, 0x20(r1)
/* 800DD130 000D9050  3B C4 00 00 */	addi r30, r4, 0
/* 800DD134 000D9054  93 A1 00 1C */	stw r29, 0x1c(r1)
/* 800DD138 000D9058  3B A3 00 00 */	addi r29, r3, 0
/* 800DD13C 000D905C  4B FE 8F 81 */	bl OSDisableInterrupts
/* 800DD140 000D9060  93 DD 00 14 */	stw r30, 0x14(r29)
/* 800DD144 000D9064  7C 1E F8 50 */	subf r0, r30, r31
/* 800DD148 000D9068  93 FD 00 18 */	stw r31, 0x18(r29)
/* 800DD14C 000D906C  90 1D 00 1C */	stw r0, 0x1c(r29)
/* 800DD150 000D9070  80 9D 00 1C */	lwz r4, 0x1c(r29)
/* 800DD154 000D9074  2C 04 00 00 */	cmpwi r4, 0
/* 800DD158 000D9078  40 80 00 10 */	bge lbl_800DD168
/* 800DD15C 000D907C  80 1D 00 08 */	lwz r0, 8(r29)
/* 800DD160 000D9080  7C 04 02 14 */	add r0, r4, r0
/* 800DD164 000D9084  90 1D 00 1C */	stw r0, 0x1c(r29)
lbl_800DD168:
/* 800DD168 000D9088  4B FE 8F 7D */	bl OSRestoreInterrupts
/* 800DD16C 000D908C  80 01 00 2C */	lwz r0, 0x2c(r1)
/* 800DD170 000D9090  83 E1 00 24 */	lwz r31, 0x24(r1)
/* 800DD174 000D9094  83 C1 00 20 */	lwz r30, 0x20(r1)
/* 800DD178 000D9098  7C 08 03 A6 */	mtlr r0
/* 800DD17C 000D909C  83 A1 00 1C */	lwz r29, 0x1c(r1)
/* 800DD180 000D90A0  38 21 00 28 */	addi r1, r1, 0x28
/* 800DD184 000D90A4  4E 80 00 20 */	blr

.global GXInitFifoLimits
GXInitFifoLimits:
/* 800DD188 000D90A8  90 83 00 0C */	stw r4, 0xc(r3)
/* 800DD18C 000D90AC  90 A3 00 10 */	stw r5, 0x10(r3)
/* 800DD190 000D90B0  4E 80 00 20 */	blr

.global GXSetCPUFifo
GXSetCPUFifo:
/* 800DD194 000D90B4  7C 08 02 A6 */	mflr r0
/* 800DD198 000D90B8  90 01 00 04 */	stw r0, 4(r1)
/* 800DD19C 000D90BC  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 800DD1A0 000D90C0  93 E1 00 14 */	stw r31, 0x14(r1)
/* 800DD1A4 000D90C4  93 C1 00 10 */	stw r30, 0x10(r1)
/* 800DD1A8 000D90C8  7C 7E 1B 78 */	mr r30, r3
/* 800DD1AC 000D90CC  4B FE 8F 11 */	bl OSDisableInterrupts
/* 800DD1B0 000D90D0  80 0D A3 84 */	lwz r0, GPFifo-_SDA_BASE_(r13)
/* 800DD1B4 000D90D4  3B E3 00 00 */	addi r31, r3, 0
/* 800DD1B8 000D90D8  93 CD A3 88 */	stw r30, CPUFifo-_SDA_BASE_(r13)
/* 800DD1BC 000D90DC  7C 1E 00 40 */	cmplw r30, r0
/* 800DD1C0 000D90E0  40 82 00 64 */	bne lbl_800DD224
/* 800DD1C4 000D90E4  80 BE 00 00 */	lwz r5, 0(r30)
/* 800DD1C8 000D90E8  38 00 00 01 */	li r0, 1
/* 800DD1CC 000D90EC  80 8D A3 60 */	lwz r4, __piReg-_SDA_BASE_(r13)
/* 800DD1D0 000D90F0  38 60 00 01 */	li r3, 1
/* 800DD1D4 000D90F4  54 A5 00 BE */	clrlwi r5, r5, 2
/* 800DD1D8 000D90F8  90 A4 00 0C */	stw r5, 0xc(r4)
/* 800DD1DC 000D90FC  38 80 00 01 */	li r4, 1
/* 800DD1E0 000D9100  80 DE 00 04 */	lwz r6, 4(r30)
/* 800DD1E4 000D9104  80 AD A3 60 */	lwz r5, __piReg-_SDA_BASE_(r13)
/* 800DD1E8 000D9108  54 C6 00 BE */	clrlwi r6, r6, 2
/* 800DD1EC 000D910C  90 C5 00 10 */	stw r6, 0x10(r5)
/* 800DD1F0 000D9110  80 DE 00 18 */	lwz r6, 0x18(r30)
/* 800DD1F4 000D9114  80 AD A3 60 */	lwz r5, __piReg-_SDA_BASE_(r13)
/* 800DD1F8 000D9118  54 C6 00 B4 */	rlwinm r6, r6, 0, 2, 0x1a
/* 800DD1FC 000D911C  54 C6 01 88 */	rlwinm r6, r6, 0, 6, 4
/* 800DD200 000D9120  90 C5 00 14 */	stw r6, 0x14(r5)
/* 800DD204 000D9124  98 0D A3 74 */	stb r0, CPGPLinked-_SDA_BASE_(r13)
/* 800DD208 000D9128  48 00 05 2D */	bl __GXWriteFifoIntReset
/* 800DD20C 000D912C  38 60 00 01 */	li r3, 1
/* 800DD210 000D9130  38 80 00 00 */	li r4, 0
/* 800DD214 000D9134  48 00 04 D5 */	bl __GXWriteFifoIntEnable
/* 800DD218 000D9138  38 60 00 01 */	li r3, 1
/* 800DD21C 000D913C  48 00 04 89 */	bl __GXFifoLink
/* 800DD220 000D9140  48 00 00 60 */	b lbl_800DD280
lbl_800DD224:
/* 800DD224 000D9144  88 0D A3 74 */	lbz r0, CPGPLinked-_SDA_BASE_(r13)
/* 800DD228 000D9148  28 00 00 00 */	cmplwi r0, 0
/* 800DD22C 000D914C  41 82 00 14 */	beq lbl_800DD240
/* 800DD230 000D9150  38 60 00 00 */	li r3, 0
/* 800DD234 000D9154  48 00 04 71 */	bl __GXFifoLink
/* 800DD238 000D9158  38 00 00 00 */	li r0, 0
/* 800DD23C 000D915C  98 0D A3 74 */	stb r0, CPGPLinked-_SDA_BASE_(r13)
lbl_800DD240:
/* 800DD240 000D9160  38 60 00 00 */	li r3, 0
/* 800DD244 000D9164  38 80 00 00 */	li r4, 0
/* 800DD248 000D9168  48 00 04 A1 */	bl __GXWriteFifoIntEnable
/* 800DD24C 000D916C  80 1E 00 00 */	lwz r0, 0(r30)
/* 800DD250 000D9170  80 6D A3 60 */	lwz r3, __piReg-_SDA_BASE_(r13)
/* 800DD254 000D9174  54 00 00 BE */	clrlwi r0, r0, 2
/* 800DD258 000D9178  90 03 00 0C */	stw r0, 0xc(r3)
/* 800DD25C 000D917C  80 1E 00 04 */	lwz r0, 4(r30)
/* 800DD260 000D9180  80 6D A3 60 */	lwz r3, __piReg-_SDA_BASE_(r13)
/* 800DD264 000D9184  54 00 00 BE */	clrlwi r0, r0, 2
/* 800DD268 000D9188  90 03 00 10 */	stw r0, 0x10(r3)
/* 800DD26C 000D918C  80 1E 00 18 */	lwz r0, 0x18(r30)
/* 800DD270 000D9190  80 6D A3 60 */	lwz r3, __piReg-_SDA_BASE_(r13)
/* 800DD274 000D9194  54 00 00 B4 */	rlwinm r0, r0, 0, 2, 0x1a
/* 800DD278 000D9198  54 00 01 88 */	rlwinm r0, r0, 0, 6, 4
/* 800DD27C 000D919C  90 03 00 14 */	stw r0, 0x14(r3)
lbl_800DD280:
/* 800DD280 000D91A0  7C 00 04 AC */	sync 0
/* 800DD284 000D91A4  7F E3 FB 78 */	mr r3, r31
/* 800DD288 000D91A8  4B FE 8E 5D */	bl OSRestoreInterrupts
/* 800DD28C 000D91AC  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800DD290 000D91B0  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 800DD294 000D91B4  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 800DD298 000D91B8  7C 08 03 A6 */	mtlr r0
/* 800DD29C 000D91BC  38 21 00 18 */	addi r1, r1, 0x18
/* 800DD2A0 000D91C0  4E 80 00 20 */	blr

.global GXSetGPFifo
GXSetGPFifo:
/* 800DD2A4 000D91C4  7C 08 02 A6 */	mflr r0
/* 800DD2A8 000D91C8  90 01 00 04 */	stw r0, 4(r1)
/* 800DD2AC 000D91CC  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 800DD2B0 000D91D0  93 E1 00 14 */	stw r31, 0x14(r1)
/* 800DD2B4 000D91D4  93 C1 00 10 */	stw r30, 0x10(r1)
/* 800DD2B8 000D91D8  7C 7E 1B 78 */	mr r30, r3
/* 800DD2BC 000D91DC  4B FE 8E 01 */	bl OSDisableInterrupts
/* 800DD2C0 000D91E0  7C 7F 1B 78 */	mr r31, r3
/* 800DD2C4 000D91E4  48 00 03 BD */	bl __GXFifoReadDisable
/* 800DD2C8 000D91E8  38 60 00 00 */	li r3, 0
/* 800DD2CC 000D91EC  38 80 00 00 */	li r4, 0
/* 800DD2D0 000D91F0  48 00 04 19 */	bl __GXWriteFifoIntEnable
/* 800DD2D4 000D91F4  93 CD A3 84 */	stw r30, GPFifo-_SDA_BASE_(r13)
/* 800DD2D8 000D91F8  80 6D A3 64 */	lwz r3, __cpReg-_SDA_BASE_(r13)
/* 800DD2DC 000D91FC  80 1E 00 00 */	lwz r0, 0(r30)
/* 800DD2E0 000D9200  B0 03 00 20 */	sth r0, 0x20(r3)
/* 800DD2E4 000D9204  80 1E 00 04 */	lwz r0, 4(r30)
/* 800DD2E8 000D9208  80 6D A3 64 */	lwz r3, __cpReg-_SDA_BASE_(r13)
/* 800DD2EC 000D920C  B0 03 00 24 */	sth r0, 0x24(r3)
/* 800DD2F0 000D9210  80 1E 00 1C */	lwz r0, 0x1c(r30)
/* 800DD2F4 000D9214  80 6D A3 64 */	lwz r3, __cpReg-_SDA_BASE_(r13)
/* 800DD2F8 000D9218  B0 03 00 30 */	sth r0, 0x30(r3)
/* 800DD2FC 000D921C  80 1E 00 18 */	lwz r0, 0x18(r30)
/* 800DD300 000D9220  80 6D A3 64 */	lwz r3, __cpReg-_SDA_BASE_(r13)
/* 800DD304 000D9224  B0 03 00 34 */	sth r0, 0x34(r3)
/* 800DD308 000D9228  80 1E 00 14 */	lwz r0, 0x14(r30)
/* 800DD30C 000D922C  80 6D A3 64 */	lwz r3, __cpReg-_SDA_BASE_(r13)
/* 800DD310 000D9230  B0 03 00 38 */	sth r0, 0x38(r3)
/* 800DD314 000D9234  80 1E 00 0C */	lwz r0, 0xc(r30)
/* 800DD318 000D9238  80 6D A3 64 */	lwz r3, __cpReg-_SDA_BASE_(r13)
/* 800DD31C 000D923C  B0 03 00 28 */	sth r0, 0x28(r3)
/* 800DD320 000D9240  80 1E 00 10 */	lwz r0, 0x10(r30)
/* 800DD324 000D9244  80 6D A3 64 */	lwz r3, __cpReg-_SDA_BASE_(r13)
/* 800DD328 000D9248  B0 03 00 2C */	sth r0, 0x2c(r3)
/* 800DD32C 000D924C  80 1E 00 00 */	lwz r0, 0(r30)
/* 800DD330 000D9250  80 6D A3 64 */	lwz r3, __cpReg-_SDA_BASE_(r13)
/* 800DD334 000D9254  54 00 84 BE */	rlwinm r0, r0, 0x10, 0x12, 0x1f
/* 800DD338 000D9258  B0 03 00 22 */	sth r0, 0x22(r3)
/* 800DD33C 000D925C  80 1E 00 04 */	lwz r0, 4(r30)
/* 800DD340 000D9260  80 6D A3 64 */	lwz r3, __cpReg-_SDA_BASE_(r13)
/* 800DD344 000D9264  54 00 84 BE */	rlwinm r0, r0, 0x10, 0x12, 0x1f
/* 800DD348 000D9268  B0 03 00 26 */	sth r0, 0x26(r3)
/* 800DD34C 000D926C  80 1E 00 1C */	lwz r0, 0x1c(r30)
/* 800DD350 000D9270  80 6D A3 64 */	lwz r3, __cpReg-_SDA_BASE_(r13)
/* 800DD354 000D9274  7C 00 86 70 */	srawi r0, r0, 0x10
/* 800DD358 000D9278  B0 03 00 32 */	sth r0, 0x32(r3)
/* 800DD35C 000D927C  80 1E 00 18 */	lwz r0, 0x18(r30)
/* 800DD360 000D9280  80 6D A3 64 */	lwz r3, __cpReg-_SDA_BASE_(r13)
/* 800DD364 000D9284  54 00 84 BE */	rlwinm r0, r0, 0x10, 0x12, 0x1f
/* 800DD368 000D9288  B0 03 00 36 */	sth r0, 0x36(r3)
/* 800DD36C 000D928C  80 1E 00 14 */	lwz r0, 0x14(r30)
/* 800DD370 000D9290  80 6D A3 64 */	lwz r3, __cpReg-_SDA_BASE_(r13)
/* 800DD374 000D9294  54 00 84 BE */	rlwinm r0, r0, 0x10, 0x12, 0x1f
/* 800DD378 000D9298  B0 03 00 3A */	sth r0, 0x3a(r3)
/* 800DD37C 000D929C  80 1E 00 0C */	lwz r0, 0xc(r30)
/* 800DD380 000D92A0  80 6D A3 64 */	lwz r3, __cpReg-_SDA_BASE_(r13)
/* 800DD384 000D92A4  54 00 84 3E */	srwi r0, r0, 0x10
/* 800DD388 000D92A8  B0 03 00 2A */	sth r0, 0x2a(r3)
/* 800DD38C 000D92AC  80 1E 00 10 */	lwz r0, 0x10(r30)
/* 800DD390 000D92B0  80 6D A3 64 */	lwz r3, __cpReg-_SDA_BASE_(r13)
/* 800DD394 000D92B4  54 00 84 3E */	srwi r0, r0, 0x10
/* 800DD398 000D92B8  B0 03 00 2E */	sth r0, 0x2e(r3)
/* 800DD39C 000D92BC  7C 00 04 AC */	sync 0
/* 800DD3A0 000D92C0  80 6D A3 88 */	lwz r3, CPUFifo-_SDA_BASE_(r13)
/* 800DD3A4 000D92C4  80 0D A3 84 */	lwz r0, GPFifo-_SDA_BASE_(r13)
/* 800DD3A8 000D92C8  7C 03 00 40 */	cmplw r3, r0
/* 800DD3AC 000D92CC  40 82 00 24 */	bne lbl_800DD3D0
/* 800DD3B0 000D92D0  38 00 00 01 */	li r0, 1
/* 800DD3B4 000D92D4  98 0D A3 74 */	stb r0, CPGPLinked-_SDA_BASE_(r13)
/* 800DD3B8 000D92D8  38 60 00 01 */	li r3, 1
/* 800DD3BC 000D92DC  38 80 00 00 */	li r4, 0
/* 800DD3C0 000D92E0  48 00 03 29 */	bl __GXWriteFifoIntEnable
/* 800DD3C4 000D92E4  38 60 00 01 */	li r3, 1
/* 800DD3C8 000D92E8  48 00 02 DD */	bl __GXFifoLink
/* 800DD3CC 000D92EC  48 00 00 20 */	b lbl_800DD3EC
lbl_800DD3D0:
/* 800DD3D0 000D92F0  38 00 00 00 */	li r0, 0
/* 800DD3D4 000D92F4  98 0D A3 74 */	stb r0, CPGPLinked-_SDA_BASE_(r13)
/* 800DD3D8 000D92F8  38 60 00 00 */	li r3, 0
/* 800DD3DC 000D92FC  38 80 00 00 */	li r4, 0
/* 800DD3E0 000D9300  48 00 03 09 */	bl __GXWriteFifoIntEnable
/* 800DD3E4 000D9304  38 60 00 00 */	li r3, 0
/* 800DD3E8 000D9308  48 00 02 BD */	bl __GXFifoLink
lbl_800DD3EC:
/* 800DD3EC 000D930C  38 60 00 01 */	li r3, 1
/* 800DD3F0 000D9310  38 80 00 01 */	li r4, 1
/* 800DD3F4 000D9314  48 00 03 41 */	bl __GXWriteFifoIntReset
/* 800DD3F8 000D9318  48 00 02 61 */	bl __GXFifoReadEnable
/* 800DD3FC 000D931C  7F E3 FB 78 */	mr r3, r31
/* 800DD400 000D9320  4B FE 8C E5 */	bl OSRestoreInterrupts
/* 800DD404 000D9324  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800DD408 000D9328  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 800DD40C 000D932C  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 800DD410 000D9330  7C 08 03 A6 */	mtlr r0
/* 800DD414 000D9334  38 21 00 18 */	addi r1, r1, 0x18
/* 800DD418 000D9338  4E 80 00 20 */	blr

.global GXSaveCPUFifo
GXSaveCPUFifo:
/* 800DD41C 000D933C  7C 08 02 A6 */	mflr r0
/* 800DD420 000D9340  90 01 00 04 */	stw r0, 4(r1)
/* 800DD424 000D9344  94 21 FF F8 */	stwu r1, -8(r1)
/* 800DD428 000D9348  48 00 00 15 */	bl __GXSaveCPUFifoAux
/* 800DD42C 000D934C  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800DD430 000D9350  38 21 00 08 */	addi r1, r1, 8
/* 800DD434 000D9354  7C 08 03 A6 */	mtlr r0
/* 800DD438 000D9358  4E 80 00 20 */	blr

.global __GXSaveCPUFifoAux
__GXSaveCPUFifoAux:
/* 800DD43C 000D935C  7C 08 02 A6 */	mflr r0
/* 800DD440 000D9360  90 01 00 04 */	stw r0, 4(r1)
/* 800DD444 000D9364  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 800DD448 000D9368  93 E1 00 14 */	stw r31, 0x14(r1)
/* 800DD44C 000D936C  93 C1 00 10 */	stw r30, 0x10(r1)
/* 800DD450 000D9370  7C 7E 1B 78 */	mr r30, r3
/* 800DD454 000D9374  4B FE 8C 69 */	bl OSDisableInterrupts
/* 800DD458 000D9378  7C 7F 1B 78 */	mr r31, r3
/* 800DD45C 000D937C  48 00 1C 51 */	bl GXFlush
/* 800DD460 000D9380  80 6D A3 60 */	lwz r3, __piReg-_SDA_BASE_(r13)
/* 800DD464 000D9384  80 63 00 0C */	lwz r3, 0xc(r3)
/* 800DD468 000D9388  3C 03 80 00 */	addis r0, r3, 0x8000
/* 800DD46C 000D938C  90 1E 00 00 */	stw r0, 0(r30)
/* 800DD470 000D9390  80 6D A3 60 */	lwz r3, __piReg-_SDA_BASE_(r13)
/* 800DD474 000D9394  80 63 00 10 */	lwz r3, 0x10(r3)
/* 800DD478 000D9398  3C 03 80 00 */	addis r0, r3, 0x8000
/* 800DD47C 000D939C  90 1E 00 04 */	stw r0, 4(r30)
/* 800DD480 000D93A0  80 6D A3 60 */	lwz r3, __piReg-_SDA_BASE_(r13)
/* 800DD484 000D93A4  80 03 00 14 */	lwz r0, 0x14(r3)
/* 800DD488 000D93A8  54 03 01 88 */	rlwinm r3, r0, 0, 6, 4
/* 800DD48C 000D93AC  3C 03 80 00 */	addis r0, r3, 0x8000
/* 800DD490 000D93B0  90 1E 00 18 */	stw r0, 0x18(r30)
/* 800DD494 000D93B4  88 0D A3 74 */	lbz r0, CPGPLinked-_SDA_BASE_(r13)
/* 800DD498 000D93B8  28 00 00 00 */	cmplwi r0, 0
/* 800DD49C 000D93BC  41 82 00 34 */	beq lbl_800DD4D0
/* 800DD4A0 000D93C0  80 8D A3 64 */	lwz r4, __cpReg-_SDA_BASE_(r13)
/* 800DD4A4 000D93C4  A0 64 00 3A */	lhz r3, 0x3a(r4)
/* 800DD4A8 000D93C8  A0 84 00 38 */	lhz r4, 0x38(r4)
/* 800DD4AC 000D93CC  50 64 80 1E */	rlwimi r4, r3, 0x10, 0, 0xf
/* 800DD4B0 000D93D0  3C 04 80 00 */	addis r0, r4, 0x8000
/* 800DD4B4 000D93D4  90 1E 00 14 */	stw r0, 0x14(r30)
/* 800DD4B8 000D93D8  80 8D A3 64 */	lwz r4, __cpReg-_SDA_BASE_(r13)
/* 800DD4BC 000D93DC  A0 64 00 32 */	lhz r3, 0x32(r4)
/* 800DD4C0 000D93E0  A0 04 00 30 */	lhz r0, 0x30(r4)
/* 800DD4C4 000D93E4  50 60 80 1E */	rlwimi r0, r3, 0x10, 0, 0xf
/* 800DD4C8 000D93E8  90 1E 00 1C */	stw r0, 0x1c(r30)
/* 800DD4CC 000D93EC  48 00 00 2C */	b lbl_800DD4F8
lbl_800DD4D0:
/* 800DD4D0 000D93F0  80 7E 00 14 */	lwz r3, 0x14(r30)
/* 800DD4D4 000D93F4  80 1E 00 18 */	lwz r0, 0x18(r30)
/* 800DD4D8 000D93F8  7C 03 00 50 */	subf r0, r3, r0
/* 800DD4DC 000D93FC  90 1E 00 1C */	stw r0, 0x1c(r30)
/* 800DD4E0 000D9400  80 7E 00 1C */	lwz r3, 0x1c(r30)
/* 800DD4E4 000D9404  2C 03 00 00 */	cmpwi r3, 0
/* 800DD4E8 000D9408  40 80 00 10 */	bge lbl_800DD4F8
/* 800DD4EC 000D940C  80 1E 00 08 */	lwz r0, 8(r30)
/* 800DD4F0 000D9410  7C 03 02 14 */	add r0, r3, r0
/* 800DD4F4 000D9414  90 1E 00 1C */	stw r0, 0x1c(r30)
lbl_800DD4F8:
/* 800DD4F8 000D9418  7F E3 FB 78 */	mr r3, r31
/* 800DD4FC 000D941C  4B FE 8B E9 */	bl OSRestoreInterrupts
/* 800DD500 000D9420  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800DD504 000D9424  83 E1 00 14 */	lwz r31, 0x14(r1)
/* 800DD508 000D9428  83 C1 00 10 */	lwz r30, 0x10(r1)
/* 800DD50C 000D942C  7C 08 03 A6 */	mtlr r0
/* 800DD510 000D9430  38 21 00 18 */	addi r1, r1, 0x18
/* 800DD514 000D9434  4E 80 00 20 */	blr

.global GXGetGPStatus
GXGetGPStatus:
/* 800DD518 000D9438  81 2D A3 64 */	lwz r9, __cpReg-_SDA_BASE_(r13)
/* 800DD51C 000D943C  81 0D 97 C8 */	lwz r8, gx-_SDA_BASE_(r13)
/* 800DD520 000D9440  A0 09 00 00 */	lhz r0, 0(r9)
/* 800DD524 000D9444  90 08 00 0C */	stw r0, 0xc(r8)
/* 800DD528 000D9448  81 0D 97 C8 */	lwz r8, gx-_SDA_BASE_(r13)
/* 800DD52C 000D944C  80 08 00 0C */	lwz r0, 0xc(r8)
/* 800DD530 000D9450  54 00 07 FE */	clrlwi r0, r0, 0x1f
/* 800DD534 000D9454  98 03 00 00 */	stb r0, 0(r3)
/* 800DD538 000D9458  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800DD53C 000D945C  80 03 00 0C */	lwz r0, 0xc(r3)
/* 800DD540 000D9460  54 00 FF FE */	rlwinm r0, r0, 0x1f, 0x1f, 0x1f
/* 800DD544 000D9464  98 04 00 00 */	stb r0, 0(r4)
/* 800DD548 000D9468  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800DD54C 000D946C  80 03 00 0C */	lwz r0, 0xc(r3)
/* 800DD550 000D9470  54 00 F7 FE */	rlwinm r0, r0, 0x1e, 0x1f, 0x1f
/* 800DD554 000D9474  98 05 00 00 */	stb r0, 0(r5)
/* 800DD558 000D9478  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800DD55C 000D947C  80 03 00 0C */	lwz r0, 0xc(r3)
/* 800DD560 000D9480  54 00 EF FE */	rlwinm r0, r0, 0x1d, 0x1f, 0x1f
/* 800DD564 000D9484  98 06 00 00 */	stb r0, 0(r6)
/* 800DD568 000D9488  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800DD56C 000D948C  80 03 00 0C */	lwz r0, 0xc(r3)
/* 800DD570 000D9490  54 00 E7 FE */	rlwinm r0, r0, 0x1c, 0x1f, 0x1f
/* 800DD574 000D9494  98 07 00 00 */	stb r0, 0(r7)
/* 800DD578 000D9498  4E 80 00 20 */	blr

.global GXGetFifoPtrs
GXGetFifoPtrs:
/* 800DD57C 000D949C  80 0D A3 88 */	lwz r0, CPUFifo-_SDA_BASE_(r13)
/* 800DD580 000D94A0  7C 03 00 40 */	cmplw r3, r0
/* 800DD584 000D94A4  40 82 00 18 */	bne lbl_800DD59C
/* 800DD588 000D94A8  80 CD A3 60 */	lwz r6, __piReg-_SDA_BASE_(r13)
/* 800DD58C 000D94AC  80 06 00 14 */	lwz r0, 0x14(r6)
/* 800DD590 000D94B0  54 06 01 88 */	rlwinm r6, r0, 0, 6, 4
/* 800DD594 000D94B4  3C 06 80 00 */	addis r0, r6, 0x8000
/* 800DD598 000D94B8  90 03 00 18 */	stw r0, 0x18(r3)
lbl_800DD59C:
/* 800DD59C 000D94BC  80 0D A3 84 */	lwz r0, GPFifo-_SDA_BASE_(r13)
/* 800DD5A0 000D94C0  7C 03 00 40 */	cmplw r3, r0
/* 800DD5A4 000D94C4  40 82 00 34 */	bne lbl_800DD5D8
/* 800DD5A8 000D94C8  80 ED A3 64 */	lwz r7, __cpReg-_SDA_BASE_(r13)
/* 800DD5AC 000D94CC  A0 C7 00 3A */	lhz r6, 0x3a(r7)
/* 800DD5B0 000D94D0  A0 E7 00 38 */	lhz r7, 0x38(r7)
/* 800DD5B4 000D94D4  50 C7 80 1E */	rlwimi r7, r6, 0x10, 0, 0xf
/* 800DD5B8 000D94D8  3C 07 80 00 */	addis r0, r7, 0x8000
/* 800DD5BC 000D94DC  90 03 00 14 */	stw r0, 0x14(r3)
/* 800DD5C0 000D94E0  80 ED A3 64 */	lwz r7, __cpReg-_SDA_BASE_(r13)
/* 800DD5C4 000D94E4  A0 C7 00 32 */	lhz r6, 0x32(r7)
/* 800DD5C8 000D94E8  A0 07 00 30 */	lhz r0, 0x30(r7)
/* 800DD5CC 000D94EC  50 C0 80 1E */	rlwimi r0, r6, 0x10, 0, 0xf
/* 800DD5D0 000D94F0  90 03 00 1C */	stw r0, 0x1c(r3)
/* 800DD5D4 000D94F4  48 00 00 2C */	b lbl_800DD600
lbl_800DD5D8:
/* 800DD5D8 000D94F8  80 C3 00 14 */	lwz r6, 0x14(r3)
/* 800DD5DC 000D94FC  80 03 00 18 */	lwz r0, 0x18(r3)
/* 800DD5E0 000D9500  7C 06 00 50 */	subf r0, r6, r0
/* 800DD5E4 000D9504  90 03 00 1C */	stw r0, 0x1c(r3)
/* 800DD5E8 000D9508  80 C3 00 1C */	lwz r6, 0x1c(r3)
/* 800DD5EC 000D950C  2C 06 00 00 */	cmpwi r6, 0
/* 800DD5F0 000D9510  40 80 00 10 */	bge lbl_800DD600
/* 800DD5F4 000D9514  80 03 00 08 */	lwz r0, 8(r3)
/* 800DD5F8 000D9518  7C 06 02 14 */	add r0, r6, r0
/* 800DD5FC 000D951C  90 03 00 1C */	stw r0, 0x1c(r3)
lbl_800DD600:
/* 800DD600 000D9520  80 03 00 14 */	lwz r0, 0x14(r3)
/* 800DD604 000D9524  90 04 00 00 */	stw r0, 0(r4)
/* 800DD608 000D9528  80 03 00 18 */	lwz r0, 0x18(r3)
/* 800DD60C 000D952C  90 05 00 00 */	stw r0, 0(r5)
/* 800DD610 000D9530  4E 80 00 20 */	blr

.global __GXFifoInit
__GXFifoInit:
/* 800DD614 000D9534  7C 08 02 A6 */	mflr r0
/* 800DD618 000D9538  3C 60 80 0E */	lis r3, GXCPInterruptHandler@ha
/* 800DD61C 000D953C  90 01 00 04 */	stw r0, 4(r1)
/* 800DD620 000D9540  38 83 CF 70 */	addi r4, r3, GXCPInterruptHandler@l
/* 800DD624 000D9544  38 60 00 11 */	li r3, 0x11
/* 800DD628 000D9548  94 21 FF F8 */	stwu r1, -8(r1)
/* 800DD62C 000D954C  4B FE 8A DD */	bl __OSSetInterruptHandler
/* 800DD630 000D9550  38 60 40 00 */	li r3, 0x4000
/* 800DD634 000D9554  4B FE 8E B1 */	bl __OSUnmaskInterrupts
/* 800DD638 000D9558  4B FE B6 81 */	bl OSGetCurrentThread
/* 800DD63C 000D955C  38 00 00 00 */	li r0, 0
/* 800DD640 000D9560  90 6D A3 70 */	stw r3, __GXCurrentThread-_SDA_BASE_(r13)
/* 800DD644 000D9564  90 0D A3 78 */	stw r0, GXOverflowSuspendInProgress-_SDA_BASE_(r13)
/* 800DD648 000D9568  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800DD64C 000D956C  38 21 00 08 */	addi r1, r1, 8
/* 800DD650 000D9570  7C 08 03 A6 */	mtlr r0
/* 800DD654 000D9574  4E 80 00 20 */	blr

.global __GXFifoReadEnable
__GXFifoReadEnable:
/* 800DD658 000D9578  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800DD65C 000D957C  84 03 00 08 */	lwzu r0, 8(r3)
/* 800DD660 000D9580  54 00 00 3C */	rlwinm r0, r0, 0, 0, 0x1e
/* 800DD664 000D9584  60 00 00 01 */	ori r0, r0, 1
/* 800DD668 000D9588  90 03 00 00 */	stw r0, 0(r3)
/* 800DD66C 000D958C  80 8D 97 C8 */	lwz r4, gx-_SDA_BASE_(r13)
/* 800DD670 000D9590  80 6D A3 64 */	lwz r3, __cpReg-_SDA_BASE_(r13)
/* 800DD674 000D9594  80 04 00 08 */	lwz r0, 8(r4)
/* 800DD678 000D9598  B0 03 00 02 */	sth r0, 2(r3)
/* 800DD67C 000D959C  4E 80 00 20 */	blr

.global __GXFifoReadDisable
__GXFifoReadDisable:
/* 800DD680 000D95A0  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800DD684 000D95A4  84 03 00 08 */	lwzu r0, 8(r3)
/* 800DD688 000D95A8  54 00 00 3C */	rlwinm r0, r0, 0, 0, 0x1e
/* 800DD68C 000D95AC  90 03 00 00 */	stw r0, 0(r3)
/* 800DD690 000D95B0  80 8D 97 C8 */	lwz r4, gx-_SDA_BASE_(r13)
/* 800DD694 000D95B4  80 6D A3 64 */	lwz r3, __cpReg-_SDA_BASE_(r13)
/* 800DD698 000D95B8  80 04 00 08 */	lwz r0, 8(r4)
/* 800DD69C 000D95BC  B0 03 00 02 */	sth r0, 2(r3)
/* 800DD6A0 000D95C0  4E 80 00 20 */	blr

.global __GXFifoLink
__GXFifoLink:
/* 800DD6A4 000D95C4  54 60 06 3F */	clrlwi. r0, r3, 0x18
/* 800DD6A8 000D95C8  41 82 00 0C */	beq lbl_800DD6B4
/* 800DD6AC 000D95CC  38 00 00 01 */	li r0, 1
/* 800DD6B0 000D95D0  48 00 00 08 */	b lbl_800DD6B8
lbl_800DD6B4:
/* 800DD6B4 000D95D4  38 00 00 00 */	li r0, 0
lbl_800DD6B8:
/* 800DD6B8 000D95D8  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800DD6BC 000D95DC  54 00 20 36 */	slwi r0, r0, 4
/* 800DD6C0 000D95E0  38 83 00 08 */	addi r4, r3, 8
/* 800DD6C4 000D95E4  80 63 00 08 */	lwz r3, 8(r3)
/* 800DD6C8 000D95E8  54 63 07 34 */	rlwinm r3, r3, 0, 0x1c, 0x1a
/* 800DD6CC 000D95EC  7C 60 03 78 */	or r0, r3, r0
/* 800DD6D0 000D95F0  90 04 00 00 */	stw r0, 0(r4)
/* 800DD6D4 000D95F4  80 8D 97 C8 */	lwz r4, gx-_SDA_BASE_(r13)
/* 800DD6D8 000D95F8  80 6D A3 64 */	lwz r3, __cpReg-_SDA_BASE_(r13)
/* 800DD6DC 000D95FC  80 04 00 08 */	lwz r0, 8(r4)
/* 800DD6E0 000D9600  B0 03 00 02 */	sth r0, 2(r3)
/* 800DD6E4 000D9604  4E 80 00 20 */	blr

.global __GXWriteFifoIntEnable
__GXWriteFifoIntEnable:
/* 800DD6E8 000D9608  80 AD 97 C8 */	lwz r5, gx-_SDA_BASE_(r13)
/* 800DD6EC 000D960C  54 63 15 BA */	rlwinm r3, r3, 2, 0x16, 0x1d
/* 800DD6F0 000D9610  54 80 1D 78 */	rlwinm r0, r4, 3, 0x15, 0x1c
/* 800DD6F4 000D9614  38 C5 00 08 */	addi r6, r5, 8
/* 800DD6F8 000D9618  80 A5 00 08 */	lwz r5, 8(r5)
/* 800DD6FC 000D961C  54 A4 07 B8 */	rlwinm r4, r5, 0, 0x1e, 0x1c
/* 800DD700 000D9620  7C 83 1B 78 */	or r3, r4, r3
/* 800DD704 000D9624  90 66 00 00 */	stw r3, 0(r6)
/* 800DD708 000D9628  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800DD70C 000D962C  38 83 00 08 */	addi r4, r3, 8
/* 800DD710 000D9630  80 63 00 08 */	lwz r3, 8(r3)
/* 800DD714 000D9634  54 63 07 76 */	rlwinm r3, r3, 0, 0x1d, 0x1b
/* 800DD718 000D9638  7C 60 03 78 */	or r0, r3, r0
/* 800DD71C 000D963C  90 04 00 00 */	stw r0, 0(r4)
/* 800DD720 000D9640  80 8D 97 C8 */	lwz r4, gx-_SDA_BASE_(r13)
/* 800DD724 000D9644  80 6D A3 64 */	lwz r3, __cpReg-_SDA_BASE_(r13)
/* 800DD728 000D9648  80 04 00 08 */	lwz r0, 8(r4)
/* 800DD72C 000D964C  B0 03 00 02 */	sth r0, 2(r3)
/* 800DD730 000D9650  4E 80 00 20 */	blr

.global __GXWriteFifoIntReset
__GXWriteFifoIntReset:
/* 800DD734 000D9654  80 AD 97 C8 */	lwz r5, gx-_SDA_BASE_(r13)
/* 800DD738 000D9658  54 63 06 3E */	clrlwi r3, r3, 0x18
/* 800DD73C 000D965C  54 80 0D FC */	rlwinm r0, r4, 1, 0x17, 0x1e
/* 800DD740 000D9660  38 C5 00 10 */	addi r6, r5, 0x10
/* 800DD744 000D9664  80 A5 00 10 */	lwz r5, 0x10(r5)
/* 800DD748 000D9668  54 A4 00 3C */	rlwinm r4, r5, 0, 0, 0x1e
/* 800DD74C 000D966C  7C 83 1B 78 */	or r3, r4, r3
/* 800DD750 000D9670  90 66 00 00 */	stw r3, 0(r6)
/* 800DD754 000D9674  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800DD758 000D9678  38 83 00 10 */	addi r4, r3, 0x10
/* 800DD75C 000D967C  80 63 00 10 */	lwz r3, 0x10(r3)
/* 800DD760 000D9680  54 63 07 FA */	rlwinm r3, r3, 0, 0x1f, 0x1d
/* 800DD764 000D9684  7C 60 03 78 */	or r0, r3, r0
/* 800DD768 000D9688  90 04 00 00 */	stw r0, 0(r4)
/* 800DD76C 000D968C  80 8D 97 C8 */	lwz r4, gx-_SDA_BASE_(r13)
/* 800DD770 000D9690  80 6D A3 64 */	lwz r3, __cpReg-_SDA_BASE_(r13)
/* 800DD774 000D9694  80 04 00 10 */	lwz r0, 0x10(r4)
/* 800DD778 000D9698  B0 03 00 04 */	sth r0, 4(r3)
/* 800DD77C 000D969C  4E 80 00 20 */	blr

.global GXGetCPUFifo
GXGetCPUFifo:
/* 800DD780 000D96A0  80 6D A3 88 */	lwz r3, CPUFifo-_SDA_BASE_(r13)
/* 800DD784 000D96A4  4E 80 00 20 */	blr

.global GXGetGPFifo
GXGetGPFifo:
/* 800DD788 000D96A8  80 6D A3 84 */	lwz r3, GPFifo-_SDA_BASE_(r13)
/* 800DD78C 000D96AC  4E 80 00 20 */	blr
