.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global __kernel_cos
__kernel_cos:
/* 8010721C 0010313C  94 21 FF C8 */	stwu r1, -0x38(r1)
/* 80107220 00103140  3C 00 3E 40 */	lis r0, 0x3e40
/* 80107224 00103144  D8 21 00 08 */	stfd f1, 8(r1)
/* 80107228 00103148  80 61 00 08 */	lwz r3, 8(r1)
/* 8010722C 0010314C  54 64 00 7E */	clrlwi r4, r3, 1
/* 80107230 00103150  7C 04 00 00 */	cmpw r4, r0
/* 80107234 00103154  40 80 00 24 */	bge lbl_80107258
/* 80107238 00103158  C8 01 00 08 */	lfd f0, 8(r1)
/* 8010723C 0010315C  FC 00 00 1E */	fctiwz f0, f0
/* 80107240 00103160  D8 01 00 30 */	stfd f0, 0x30(r1)
/* 80107244 00103164  80 01 00 34 */	lwz r0, 0x34(r1)
/* 80107248 00103168  2C 00 00 00 */	cmpwi r0, 0
/* 8010724C 0010316C  40 82 00 0C */	bne lbl_80107258
/* 80107250 00103170  C8 22 C3 08 */	lfd f1, lbl_802F6B08-_SDA2_BASE_(r2)
/* 80107254 00103174  48 00 00 B8 */	b lbl_8010730C
lbl_80107258:
/* 80107258 00103178  C8 C1 00 08 */	lfd f6, 8(r1)
/* 8010725C 0010317C  3C 60 3F D3 */	lis r3, 0x3FD33333@ha
/* 80107260 00103180  38 03 33 33 */	addi r0, r3, 0x3FD33333@l
/* 80107264 00103184  C8 22 C3 38 */	lfd f1, lbl_802F6B38-_SDA2_BASE_(r2)
/* 80107268 00103188  FC E6 01 B2 */	fmul f7, f6, f6
/* 8010726C 0010318C  C8 02 C3 30 */	lfd f0, lbl_802F6B30-_SDA2_BASE_(r2)
/* 80107270 00103190  7C 04 00 00 */	cmpw r4, r0
/* 80107274 00103194  C8 82 C3 28 */	lfd f4, lbl_802F6B28-_SDA2_BASE_(r2)
/* 80107278 00103198  C8 62 C3 20 */	lfd f3, lbl_802F6B20-_SDA2_BASE_(r2)
/* 8010727C 0010319C  FC A1 01 FA */	fmadd f5, f1, f7, f0
/* 80107280 001031A0  C8 22 C3 18 */	lfd f1, lbl_802F6B18-_SDA2_BASE_(r2)
/* 80107284 001031A4  C8 02 C3 10 */	lfd f0, lbl_802F6B10-_SDA2_BASE_(r2)
/* 80107288 001031A8  FC 87 21 7A */	fmadd f4, f7, f5, f4
/* 8010728C 001031AC  FC 67 19 3A */	fmadd f3, f7, f4, f3
/* 80107290 001031B0  FC 27 08 FA */	fmadd f1, f7, f3, f1
/* 80107294 001031B4  FC 07 00 7A */	fmadd f0, f7, f1, f0
/* 80107298 001031B8  FC 87 00 32 */	fmul f4, f7, f0
/* 8010729C 001031BC  40 80 00 20 */	bge lbl_801072BC
/* 801072A0 001031C0  FC 06 00 B2 */	fmul f0, f6, f2
/* 801072A4 001031C4  C8 22 C3 40 */	lfd f1, lbl_802F6B40-_SDA2_BASE_(r2)
/* 801072A8 001031C8  C8 42 C3 08 */	lfd f2, lbl_802F6B08-_SDA2_BASE_(r2)
/* 801072AC 001031CC  FC 07 01 38 */	fmsub f0, f7, f4, f0
/* 801072B0 001031D0  FC 01 01 F8 */	fmsub f0, f1, f7, f0
/* 801072B4 001031D4  FC 22 00 28 */	fsub f1, f2, f0
/* 801072B8 001031D8  48 00 00 54 */	b lbl_8010730C
lbl_801072BC:
/* 801072BC 001031DC  3C 00 3F E9 */	lis r0, 0x3fe9
/* 801072C0 001031E0  7C 04 00 00 */	cmpw r4, r0
/* 801072C4 001031E4  40 81 00 10 */	ble lbl_801072D4
/* 801072C8 001031E8  C8 02 C3 48 */	lfd f0, lbl_802F6B48-_SDA2_BASE_(r2)
/* 801072CC 001031EC  D8 01 00 18 */	stfd f0, 0x18(r1)
/* 801072D0 001031F0  48 00 00 14 */	b lbl_801072E4
lbl_801072D4:
/* 801072D4 001031F4  3C 04 FF E0 */	addis r0, r4, 0xffe0
/* 801072D8 001031F8  90 01 00 18 */	stw r0, 0x18(r1)
/* 801072DC 001031FC  38 00 00 00 */	li r0, 0
/* 801072E0 00103200  90 01 00 1C */	stw r0, 0x1c(r1)
lbl_801072E4:
/* 801072E4 00103204  C8 01 00 08 */	lfd f0, 8(r1)
/* 801072E8 00103208  C8 61 00 18 */	lfd f3, 0x18(r1)
/* 801072EC 0010320C  FC 00 00 B2 */	fmul f0, f0, f2
/* 801072F0 00103210  C8 22 C3 40 */	lfd f1, lbl_802F6B40-_SDA2_BASE_(r2)
/* 801072F4 00103214  C8 42 C3 08 */	lfd f2, lbl_802F6B08-_SDA2_BASE_(r2)
/* 801072F8 00103218  FC 21 19 F8 */	fmsub f1, f1, f7, f3
/* 801072FC 0010321C  FC 07 01 38 */	fmsub f0, f7, f4, f0
/* 80107300 00103220  FC 42 18 28 */	fsub f2, f2, f3
/* 80107304 00103224  FC 01 00 28 */	fsub f0, f1, f0
/* 80107308 00103228  FC 22 00 28 */	fsub f1, f2, f0
lbl_8010730C:
/* 8010730C 0010322C  38 21 00 38 */	addi r1, r1, 0x38
/* 80107310 00103230  4E 80 00 20 */	blr
