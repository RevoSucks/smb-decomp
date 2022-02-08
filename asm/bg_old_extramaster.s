.include "macros.inc"

.section .text

.global bg_old_extramaster_init
bg_old_extramaster_init:
/* 80057A9C 000539BC  7C 08 02 A6 */	mflr r0
/* 80057AA0 000539C0  3C 60 FC 00 */	lis r3, 0xFBFFFFFF@ha
/* 80057AA4 000539C4  90 01 00 04 */	stw r0, 4(r1)
/* 80057AA8 000539C8  38 83 FF FF */	addi r4, r3, 0xFBFFFFFF@l
/* 80057AAC 000539CC  94 21 FE C0 */	stwu r1, -0x140(r1)
/* 80057AB0 000539D0  DB E1 01 38 */	stfd f31, 0x138(r1)
/* 80057AB4 000539D4  DB C1 01 30 */	stfd f30, 0x130(r1)
/* 80057AB8 000539D8  BF 21 01 14 */	stmw r25, 0x114(r1)
/* 80057ABC 000539DC  80 AD 99 1C */	lwz r5, naomiBackgroundObj@sda21(r13)
/* 80057AC0 000539E0  80 65 00 08 */	lwz r3, 8(r5)
/* 80057AC4 000539E4  3C A0 04 00 */	lis r5, 0x400
/* 80057AC8 000539E8  48 03 58 A5 */	bl func_8008D36C
/* 80057ACC 000539EC  80 8D 99 1C */	lwz r4, naomiBackgroundObj@sda21(r13)
/* 80057AD0 000539F0  3C 60 80 1C */	lis r3, backgroundInfo@ha
/* 80057AD4 000539F4  3B A3 91 78 */	addi r29, r3, backgroundInfo@l
/* 80057AD8 000539F8  80 04 00 A0 */	lwz r0, 0xa0(r4)
/* 80057ADC 000539FC  90 1D 00 80 */	stw r0, 0x80(r29)
/* 80057AE0 00053A00  C0 02 95 F0 */	lfs f0, lbl_802F3DF0@sda21(r2)
/* 80057AE4 00053A04  D0 1D 00 84 */	stfs f0, 0x84(r29)
/* 80057AE8 00053A08  4B FA FA 7D */	bl mathutil_mtxA_from_identity
/* 80057AEC 00053A0C  C0 22 95 F4 */	lfs f1, lbl_802F3DF4@sda21(r2)
/* 80057AF0 00053A10  FC 40 08 90 */	fmr f2, f1
/* 80057AF4 00053A14  FC 60 08 90 */	fmr f3, f1
/* 80057AF8 00053A18  4B FB 02 E1 */	bl mathutil_mtxA_scale_xyz
/* 80057AFC 00053A1C  3B FD 00 48 */	addi r31, r29, 0x48
/* 80057B00 00053A20  38 7F 00 00 */	addi r3, r31, 0
/* 80057B04 00053A24  4B FA FD 75 */	bl mathutil_mtxA_to_mtx
/* 80057B08 00053A28  48 0A ED 5D */	bl rand
/* 80057B0C 00053A2C  6C 60 80 00 */	xoris r0, r3, 0x8000
/* 80057B10 00053A30  C8 62 96 58 */	lfd f3, lbl_802F3E58@sda21(r2)
/* 80057B14 00053A34  90 01 01 0C */	stw r0, 0x10c(r1)
/* 80057B18 00053A38  3F C0 43 30 */	lis r30, 0x4330
/* 80057B1C 00053A3C  C0 22 95 F8 */	lfs f1, lbl_802F3DF8@sda21(r2)
/* 80057B20 00053A40  3B 9D 00 14 */	addi r28, r29, 0x14
/* 80057B24 00053A44  93 C1 01 08 */	stw r30, 0x108(r1)
/* 80057B28 00053A48  C8 02 96 00 */	lfd f0, lbl_802F3E00@sda21(r2)
/* 80057B2C 00053A4C  C8 41 01 08 */	lfd f2, 0x108(r1)
/* 80057B30 00053A50  EC 42 18 28 */	fsubs f2, f2, f3
/* 80057B34 00053A54  EC 22 08 24 */	fdivs f1, f2, f1
/* 80057B38 00053A58  FC 01 00 28 */	fsub f0, f1, f0
/* 80057B3C 00053A5C  FC 00 00 18 */	frsp f0, f0
/* 80057B40 00053A60  D0 1D 00 14 */	stfs f0, 0x14(r29)
/* 80057B44 00053A64  48 0A ED 21 */	bl rand
/* 80057B48 00053A68  6C 60 80 00 */	xoris r0, r3, 0x8000
/* 80057B4C 00053A6C  C8 62 96 58 */	lfd f3, lbl_802F3E58@sda21(r2)
/* 80057B50 00053A70  90 01 01 04 */	stw r0, 0x104(r1)
/* 80057B54 00053A74  C0 22 95 F8 */	lfs f1, lbl_802F3DF8@sda21(r2)
/* 80057B58 00053A78  93 C1 01 00 */	stw r30, 0x100(r1)
/* 80057B5C 00053A7C  C8 02 96 00 */	lfd f0, lbl_802F3E00@sda21(r2)
/* 80057B60 00053A80  C8 41 01 00 */	lfd f2, 0x100(r1)
/* 80057B64 00053A84  EC 42 18 28 */	fsubs f2, f2, f3
/* 80057B68 00053A88  EC 22 08 24 */	fdivs f1, f2, f1
/* 80057B6C 00053A8C  FC 01 00 28 */	fsub f0, f1, f0
/* 80057B70 00053A90  FC 00 00 18 */	frsp f0, f0
/* 80057B74 00053A94  D0 1D 00 18 */	stfs f0, 0x18(r29)
/* 80057B78 00053A98  48 0A EC ED */	bl rand
/* 80057B7C 00053A9C  6C 60 80 00 */	xoris r0, r3, 0x8000
/* 80057B80 00053AA0  C8 62 96 58 */	lfd f3, lbl_802F3E58@sda21(r2)
/* 80057B84 00053AA4  90 01 00 FC */	stw r0, 0xfc(r1)
/* 80057B88 00053AA8  C0 22 95 F8 */	lfs f1, lbl_802F3DF8@sda21(r2)
/* 80057B8C 00053AAC  93 C1 00 F8 */	stw r30, 0xf8(r1)
/* 80057B90 00053AB0  C8 02 96 00 */	lfd f0, lbl_802F3E00@sda21(r2)
/* 80057B94 00053AB4  C8 41 00 F8 */	lfd f2, 0xf8(r1)
/* 80057B98 00053AB8  EC 42 18 28 */	fsubs f2, f2, f3
/* 80057B9C 00053ABC  EC 22 08 24 */	fdivs f1, f2, f1
/* 80057BA0 00053AC0  FC 01 00 28 */	fsub f0, f1, f0
/* 80057BA4 00053AC4  FC 00 00 18 */	frsp f0, f0
/* 80057BA8 00053AC8  D0 1D 00 1C */	stfs f0, 0x1c(r29)
/* 80057BAC 00053ACC  48 0A EC B9 */	bl rand
/* 80057BB0 00053AD0  6C 60 80 00 */	xoris r0, r3, 0x8000
/* 80057BB4 00053AD4  C8 62 96 58 */	lfd f3, lbl_802F3E58@sda21(r2)
/* 80057BB8 00053AD8  90 01 00 F4 */	stw r0, 0xf4(r1)
/* 80057BBC 00053ADC  7F 83 E3 78 */	mr r3, r28
/* 80057BC0 00053AE0  C0 22 95 F8 */	lfs f1, lbl_802F3DF8@sda21(r2)
/* 80057BC4 00053AE4  7F 84 E3 78 */	mr r4, r28
/* 80057BC8 00053AE8  93 C1 00 F0 */	stw r30, 0xf0(r1)
/* 80057BCC 00053AEC  C8 02 96 08 */	lfd f0, lbl_802F3E08@sda21(r2)
/* 80057BD0 00053AF0  C8 41 00 F0 */	lfd f2, 0xf0(r1)
/* 80057BD4 00053AF4  EC 42 18 28 */	fsubs f2, f2, f3
/* 80057BD8 00053AF8  EC 22 08 24 */	fdivs f1, f2, f1
/* 80057BDC 00053AFC  FC 00 00 72 */	fmul f0, f0, f1
/* 80057BE0 00053B00  FC 20 00 18 */	frsp f1, f0
/* 80057BE4 00053B04  4B FB 05 91 */	bl mathutil_vec_set_len
/* 80057BE8 00053B08  7F 83 E3 78 */	mr r3, r28
/* 80057BEC 00053B0C  4B FA F9 D1 */	bl mathutil_mtxA_from_translate
/* 80057BF0 00053B10  48 0A EC 75 */	bl rand
/* 80057BF4 00053B14  6C 60 80 00 */	xoris r0, r3, 0x8000
/* 80057BF8 00053B18  C8 62 96 58 */	lfd f3, lbl_802F3E58@sda21(r2)
/* 80057BFC 00053B1C  90 01 00 EC */	stw r0, 0xec(r1)
/* 80057C00 00053B20  7F 83 E3 78 */	mr r3, r28
/* 80057C04 00053B24  C0 22 95 F8 */	lfs f1, lbl_802F3DF8@sda21(r2)
/* 80057C08 00053B28  38 9D 00 20 */	addi r4, r29, 0x20
/* 80057C0C 00053B2C  93 C1 00 E8 */	stw r30, 0xe8(r1)
/* 80057C10 00053B30  C8 02 96 10 */	lfd f0, lbl_802F3E10@sda21(r2)
/* 80057C14 00053B34  C8 41 00 E8 */	lfd f2, 0xe8(r1)
/* 80057C18 00053B38  EC 42 18 28 */	fsubs f2, f2, f3
/* 80057C1C 00053B3C  EC 22 08 24 */	fdivs f1, f2, f1
/* 80057C20 00053B40  FC 00 00 72 */	fmul f0, f0, f1
/* 80057C24 00053B44  FC 20 00 18 */	frsp f1, f0
/* 80057C28 00053B48  4B FB 05 4D */	bl mathutil_vec_set_len
/* 80057C2C 00053B4C  48 0A EC 39 */	bl rand
/* 80057C30 00053B50  6C 60 80 00 */	xoris r0, r3, 0x8000
/* 80057C34 00053B54  C8 82 96 58 */	lfd f4, lbl_802F3E58@sda21(r2)
/* 80057C38 00053B58  90 01 00 E4 */	stw r0, 0xe4(r1)
/* 80057C3C 00053B5C  3B 5D 00 2C */	addi r26, r29, 0x2c
/* 80057C40 00053B60  C0 42 95 F8 */	lfs f2, lbl_802F3DF8@sda21(r2)
/* 80057C44 00053B64  93 C1 00 E0 */	stw r30, 0xe0(r1)
/* 80057C48 00053B68  C8 22 96 00 */	lfd f1, lbl_802F3E00@sda21(r2)
/* 80057C4C 00053B6C  C8 61 00 E0 */	lfd f3, 0xe0(r1)
/* 80057C50 00053B70  C8 02 96 18 */	lfd f0, lbl_802F3E18@sda21(r2)
/* 80057C54 00053B74  EC 63 20 28 */	fsubs f3, f3, f4
/* 80057C58 00053B78  EC 43 10 24 */	fdivs f2, f3, f2
/* 80057C5C 00053B7C  FC 22 08 28 */	fsub f1, f2, f1
/* 80057C60 00053B80  FC 00 00 72 */	fmul f0, f0, f1
/* 80057C64 00053B84  FC 00 00 18 */	frsp f0, f0
/* 80057C68 00053B88  D0 1D 00 2C */	stfs f0, 0x2c(r29)
/* 80057C6C 00053B8C  48 0A EB F9 */	bl rand
/* 80057C70 00053B90  6C 60 80 00 */	xoris r0, r3, 0x8000
/* 80057C74 00053B94  C8 62 96 58 */	lfd f3, lbl_802F3E58@sda21(r2)
/* 80057C78 00053B98  90 01 00 DC */	stw r0, 0xdc(r1)
/* 80057C7C 00053B9C  3B 7D 00 30 */	addi r27, r29, 0x30
/* 80057C80 00053BA0  C0 22 95 F8 */	lfs f1, lbl_802F3DF8@sda21(r2)
/* 80057C84 00053BA4  93 C1 00 D8 */	stw r30, 0xd8(r1)
/* 80057C88 00053BA8  C0 02 96 20 */	lfs f0, lbl_802F3E20@sda21(r2)
/* 80057C8C 00053BAC  C8 41 00 D8 */	lfd f2, 0xd8(r1)
/* 80057C90 00053BB0  EC 42 18 28 */	fsubs f2, f2, f3
/* 80057C94 00053BB4  EC 22 08 24 */	fdivs f1, f2, f1
/* 80057C98 00053BB8  EC 00 00 72 */	fmuls f0, f0, f1
/* 80057C9C 00053BBC  D0 1D 00 30 */	stfs f0, 0x30(r29)
/* 80057CA0 00053BC0  48 0A EB C5 */	bl rand
/* 80057CA4 00053BC4  6C 60 80 00 */	xoris r0, r3, 0x8000
/* 80057CA8 00053BC8  C8 82 96 58 */	lfd f4, lbl_802F3E58@sda21(r2)
/* 80057CAC 00053BCC  90 01 00 D4 */	stw r0, 0xd4(r1)
/* 80057CB0 00053BD0  3B 3D 00 34 */	addi r25, r29, 0x34
/* 80057CB4 00053BD4  C0 42 95 F8 */	lfs f2, lbl_802F3DF8@sda21(r2)
/* 80057CB8 00053BD8  93 C1 00 D0 */	stw r30, 0xd0(r1)
/* 80057CBC 00053BDC  C8 22 96 00 */	lfd f1, lbl_802F3E00@sda21(r2)
/* 80057CC0 00053BE0  C8 61 00 D0 */	lfd f3, 0xd0(r1)
/* 80057CC4 00053BE4  C8 02 96 18 */	lfd f0, lbl_802F3E18@sda21(r2)
/* 80057CC8 00053BE8  EC 63 20 28 */	fsubs f3, f3, f4
/* 80057CCC 00053BEC  EC 43 10 24 */	fdivs f2, f3, f2
/* 80057CD0 00053BF0  FC 22 08 28 */	fsub f1, f2, f1
/* 80057CD4 00053BF4  FC 00 00 72 */	fmul f0, f0, f1
/* 80057CD8 00053BF8  FC 00 00 18 */	frsp f0, f0
/* 80057CDC 00053BFC  D0 1D 00 34 */	stfs f0, 0x34(r29)
/* 80057CE0 00053C00  48 0A EB 85 */	bl rand
/* 80057CE4 00053C04  6C 60 80 00 */	xoris r0, r3, 0x8000
/* 80057CE8 00053C08  C8 82 96 58 */	lfd f4, lbl_802F3E58@sda21(r2)
/* 80057CEC 00053C0C  90 01 00 CC */	stw r0, 0xcc(r1)
/* 80057CF0 00053C10  C0 42 95 F8 */	lfs f2, lbl_802F3DF8@sda21(r2)
/* 80057CF4 00053C14  93 C1 00 C8 */	stw r30, 0xc8(r1)
/* 80057CF8 00053C18  C8 22 96 00 */	lfd f1, lbl_802F3E00@sda21(r2)
/* 80057CFC 00053C1C  C8 61 00 C8 */	lfd f3, 0xc8(r1)
/* 80057D00 00053C20  C8 02 96 28 */	lfd f0, lbl_802F3E28@sda21(r2)
/* 80057D04 00053C24  EC 63 20 28 */	fsubs f3, f3, f4
/* 80057D08 00053C28  EC 43 10 24 */	fdivs f2, f3, f2
/* 80057D0C 00053C2C  FC 22 08 28 */	fsub f1, f2, f1
/* 80057D10 00053C30  FC 00 00 72 */	fmul f0, f0, f1
/* 80057D14 00053C34  FC 00 00 18 */	frsp f0, f0
/* 80057D18 00053C38  D0 1D 00 38 */	stfs f0, 0x38(r29)
/* 80057D1C 00053C3C  48 0A EB 49 */	bl rand
/* 80057D20 00053C40  6C 60 80 00 */	xoris r0, r3, 0x8000
/* 80057D24 00053C44  C8 82 96 58 */	lfd f4, lbl_802F3E58@sda21(r2)
/* 80057D28 00053C48  90 01 00 C4 */	stw r0, 0xc4(r1)
/* 80057D2C 00053C4C  3B 9D 00 3C */	addi r28, r29, 0x3c
/* 80057D30 00053C50  C0 42 95 F8 */	lfs f2, lbl_802F3DF8@sda21(r2)
/* 80057D34 00053C54  93 C1 00 C0 */	stw r30, 0xc0(r1)
/* 80057D38 00053C58  C8 22 96 00 */	lfd f1, lbl_802F3E00@sda21(r2)
/* 80057D3C 00053C5C  C8 61 00 C0 */	lfd f3, 0xc0(r1)
/* 80057D40 00053C60  C8 02 96 30 */	lfd f0, lbl_802F3E30@sda21(r2)
/* 80057D44 00053C64  EC 63 20 28 */	fsubs f3, f3, f4
/* 80057D48 00053C68  EC 43 10 24 */	fdivs f2, f3, f2
/* 80057D4C 00053C6C  FC 21 10 2A */	fadd f1, f1, f2
/* 80057D50 00053C70  FC 00 00 72 */	fmul f0, f0, f1
/* 80057D54 00053C74  FC 00 00 18 */	frsp f0, f0
/* 80057D58 00053C78  D0 1D 00 3C */	stfs f0, 0x3c(r29)
/* 80057D5C 00053C7C  48 0A EB 09 */	bl rand
/* 80057D60 00053C80  6C 60 80 00 */	xoris r0, r3, 0x8000
/* 80057D64 00053C84  C8 82 96 58 */	lfd f4, lbl_802F3E58@sda21(r2)
/* 80057D68 00053C88  90 01 00 BC */	stw r0, 0xbc(r1)
/* 80057D6C 00053C8C  C0 42 95 F8 */	lfs f2, lbl_802F3DF8@sda21(r2)
/* 80057D70 00053C90  93 C1 00 B8 */	stw r30, 0xb8(r1)
/* 80057D74 00053C94  C8 22 96 00 */	lfd f1, lbl_802F3E00@sda21(r2)
/* 80057D78 00053C98  C8 61 00 B8 */	lfd f3, 0xb8(r1)
/* 80057D7C 00053C9C  C8 02 96 28 */	lfd f0, lbl_802F3E28@sda21(r2)
/* 80057D80 00053CA0  EC 63 20 28 */	fsubs f3, f3, f4
/* 80057D84 00053CA4  EC 43 10 24 */	fdivs f2, f3, f2
/* 80057D88 00053CA8  FC 22 08 28 */	fsub f1, f2, f1
/* 80057D8C 00053CAC  FC 00 00 72 */	fmul f0, f0, f1
/* 80057D90 00053CB0  FC 00 00 18 */	frsp f0, f0
/* 80057D94 00053CB4  D0 1D 00 40 */	stfs f0, 0x40(r29)
/* 80057D98 00053CB8  48 0A EA CD */	bl rand
/* 80057D9C 00053CBC  54 60 07 FF */	clrlwi. r0, r3, 0x1f
/* 80057DA0 00053CC0  41 82 00 10 */	beq lbl_80057DB0
/* 80057DA4 00053CC4  C0 1C 00 00 */	lfs f0, 0(r28)
/* 80057DA8 00053CC8  FC 00 00 50 */	fneg f0, f0
/* 80057DAC 00053CCC  D0 1C 00 00 */	stfs f0, 0(r28)
lbl_80057DB0:
/* 80057DB0 00053CD0  80 0D 99 54 */	lwz r0, unpausedFrameCounter@sda21(r13)
/* 80057DB4 00053CD4  54 03 30 32 */	slwi r3, r0, 6
/* 80057DB8 00053CD8  4B FA F4 29 */	bl mathutil_sin
/* 80057DBC 00053CDC  C8 42 96 48 */	lfd f2, lbl_802F3E48@sda21(r2)
/* 80057DC0 00053CE0  C0 1B 00 00 */	lfs f0, 0(r27)
/* 80057DC4 00053CE4  FC 62 00 72 */	fmul f3, f2, f1
/* 80057DC8 00053CE8  C8 42 96 40 */	lfd f2, lbl_802F3E40@sda21(r2)
/* 80057DCC 00053CEC  C8 22 96 38 */	lfd f1, lbl_802F3E38@sda21(r2)
/* 80057DD0 00053CF0  FC 00 00 1E */	fctiwz f0, f0
/* 80057DD4 00053CF4  FC 42 18 2A */	fadd f2, f2, f3
/* 80057DD8 00053CF8  D8 01 00 B8 */	stfd f0, 0xb8(r1)
/* 80057DDC 00053CFC  FF C1 10 24 */	fdiv f30, f1, f2
/* 80057DE0 00053D00  80 01 00 BC */	lwz r0, 0xbc(r1)
/* 80057DE4 00053D04  7C 03 07 34 */	extsh r3, r0
/* 80057DE8 00053D08  FF C0 F0 18 */	frsp f30, f30
/* 80057DEC 00053D0C  4B FB 02 11 */	bl mathutil_mtxA_rotate_y
/* 80057DF0 00053D10  C0 1A 00 00 */	lfs f0, 0(r26)
/* 80057DF4 00053D14  FC 00 00 1E */	fctiwz f0, f0
/* 80057DF8 00053D18  D8 01 00 C0 */	stfd f0, 0xc0(r1)
/* 80057DFC 00053D1C  80 01 00 C4 */	lwz r0, 0xc4(r1)
/* 80057E00 00053D20  7C 03 07 34 */	extsh r3, r0
/* 80057E04 00053D24  4B FB 01 85 */	bl mathutil_mtxA_rotate_x
/* 80057E08 00053D28  C0 19 00 00 */	lfs f0, 0(r25)
/* 80057E0C 00053D2C  FC 00 00 1E */	fctiwz f0, f0
/* 80057E10 00053D30  D8 01 00 C8 */	stfd f0, 0xc8(r1)
/* 80057E14 00053D34  80 01 00 CC */	lwz r0, 0xcc(r1)
/* 80057E18 00053D38  7C 03 07 34 */	extsh r3, r0
/* 80057E1C 00053D3C  4B FB 02 6D */	bl mathutil_mtxA_rotate_z
/* 80057E20 00053D40  FC 20 F0 90 */	fmr f1, f30
/* 80057E24 00053D44  FC 40 F0 90 */	fmr f2, f30
/* 80057E28 00053D48  FC 60 F0 90 */	fmr f3, f30
/* 80057E2C 00053D4C  4B FA FF AD */	bl mathutil_mtxA_scale_xyz
/* 80057E30 00053D50  7F E3 FB 78 */	mr r3, r31
/* 80057E34 00053D54  4B FA FA 45 */	bl mathutil_mtxA_to_mtx
/* 80057E38 00053D58  38 61 00 08 */	addi r3, r1, 8
/* 80057E3C 00053D5C  38 80 00 00 */	li r4, 0
/* 80057E40 00053D60  38 A0 00 AC */	li r5, 0xac
/* 80057E44 00053D64  4B FA B4 DD */	bl memset
/* 80057E48 00053D68  38 00 00 0B */	li r0, 0xb
/* 80057E4C 00053D6C  B0 01 00 10 */	sth r0, 0x10(r1)
/* 80057E50 00053D70  3C 60 80 1C */	lis r3, lbl_801B9B48@ha
/* 80057E54 00053D74  3B C3 9B 48 */	addi r30, r3, lbl_801B9B48@l
/* 80057E58 00053D78  80 8D 99 1C */	lwz r4, naomiBackgroundObj@sda21(r13)
/* 80057E5C 00053D7C  38 00 00 00 */	li r0, 0
/* 80057E60 00053D80  38 7E 00 00 */	addi r3, r30, 0
/* 80057E64 00053D84  80 84 00 08 */	lwz r4, 8(r4)
/* 80057E68 00053D88  90 81 00 38 */	stw r4, 0x38(r1)
/* 80057E6C 00053D8C  90 01 00 18 */	stw r0, 0x18(r1)
/* 80057E70 00053D90  48 0A EC F1 */	bl strlen
/* 80057E74 00053D94  80 8D 99 1C */	lwz r4, naomiBackgroundObj@sda21(r13)
/* 80057E78 00053D98  7C 7A 1B 78 */	mr r26, r3
/* 80057E7C 00053D9C  CB C2 96 58 */	lfd f30, lbl_802F3E58@sda21(r2)
/* 80057E80 00053DA0  3F E0 43 30 */	lis r31, 0x4330
/* 80057E84 00053DA4  CB E2 96 50 */	lfd f31, lbl_802F3E50@sda21(r2)
/* 80057E88 00053DA8  3B 24 00 04 */	addi r25, r4, 4
/* 80057E8C 00053DAC  48 00 00 70 */	b lbl_80057EFC
lbl_80057E90:
/* 80057E90 00053DB0  80 63 FF F8 */	lwz r3, -8(r3)
/* 80057E94 00053DB4  38 9E 00 00 */	addi r4, r30, 0
/* 80057E98 00053DB8  38 BA 00 00 */	addi r5, r26, 0
/* 80057E9C 00053DBC  48 0A EA 1D */	bl strncmp
/* 80057EA0 00053DC0  2C 03 00 00 */	cmpwi r3, 0
/* 80057EA4 00053DC4  40 82 00 54 */	bne lbl_80057EF8
/* 80057EA8 00053DC8  80 B9 00 00 */	lwz r5, 0(r25)
/* 80057EAC 00053DCC  38 61 00 08 */	addi r3, r1, 8
/* 80057EB0 00053DD0  80 85 00 08 */	lwz r4, 8(r5)
/* 80057EB4 00053DD4  80 05 00 0C */	lwz r0, 0xc(r5)
/* 80057EB8 00053DD8  90 81 00 3C */	stw r4, 0x3c(r1)
/* 80057EBC 00053DDC  90 01 00 40 */	stw r0, 0x40(r1)
/* 80057EC0 00053DE0  80 05 00 10 */	lwz r0, 0x10(r5)
/* 80057EC4 00053DE4  90 01 00 44 */	stw r0, 0x44(r1)
/* 80057EC8 00053DE8  4B FF 50 41 */	bl g_create_pickup_item
/* 80057ECC 00053DEC  80 01 00 18 */	lwz r0, 0x18(r1)
/* 80057ED0 00053DF0  6C 00 80 00 */	xoris r0, r0, 0x8000
/* 80057ED4 00053DF4  90 01 00 BC */	stw r0, 0xbc(r1)
/* 80057ED8 00053DF8  93 E1 00 B8 */	stw r31, 0xb8(r1)
/* 80057EDC 00053DFC  C8 01 00 B8 */	lfd f0, 0xb8(r1)
/* 80057EE0 00053E00  FC 00 F0 28 */	fsub f0, f0, f30
/* 80057EE4 00053E04  FC 00 F8 2A */	fadd f0, f0, f31
/* 80057EE8 00053E08  FC 00 00 1E */	fctiwz f0, f0
/* 80057EEC 00053E0C  D8 01 00 C0 */	stfd f0, 0xc0(r1)
/* 80057EF0 00053E10  80 01 00 C4 */	lwz r0, 0xc4(r1)
/* 80057EF4 00053E14  90 01 00 18 */	stw r0, 0x18(r1)
lbl_80057EF8:
/* 80057EF8 00053E18  3B 39 00 04 */	addi r25, r25, 4
lbl_80057EFC:
/* 80057EFC 00053E1C  80 79 00 00 */	lwz r3, 0(r25)
/* 80057F00 00053E20  28 03 00 00 */	cmplwi r3, 0
/* 80057F04 00053E24  40 82 FF 8C */	bne lbl_80057E90
/* 80057F08 00053E28  38 61 00 08 */	addi r3, r1, 8
/* 80057F0C 00053E2C  38 80 00 00 */	li r4, 0
/* 80057F10 00053E30  38 A0 00 AC */	li r5, 0xac
/* 80057F14 00053E34  4B FA B4 0D */	bl memset
/* 80057F18 00053E38  38 00 00 10 */	li r0, 0x10
/* 80057F1C 00053E3C  B0 01 00 10 */	sth r0, 0x10(r1)
/* 80057F20 00053E40  38 61 00 08 */	addi r3, r1, 8
/* 80057F24 00053E44  4B FF 4F E5 */	bl g_create_pickup_item
/* 80057F28 00053E48  38 61 00 08 */	addi r3, r1, 8
/* 80057F2C 00053E4C  38 80 00 00 */	li r4, 0
/* 80057F30 00053E50  38 A0 00 AC */	li r5, 0xac
/* 80057F34 00053E54  4B FA B3 ED */	bl memset
/* 80057F38 00053E58  38 00 00 11 */	li r0, 0x11
/* 80057F3C 00053E5C  B0 01 00 10 */	sth r0, 0x10(r1)
/* 80057F40 00053E60  80 6D 9D 50 */	lwz r3, decodedStageLzPtr@sda21(r13)
/* 80057F44 00053E64  80 03 00 5C */	lwz r0, 0x5c(r3)
/* 80057F48 00053E68  28 00 00 00 */	cmplwi r0, 0
/* 80057F4C 00053E6C  40 82 00 84 */	bne lbl_80057FD0
/* 80057F50 00053E70  3C 60 80 21 */	lis r3, lbl_802099E8@ha
/* 80057F54 00053E74  38 63 99 E8 */	addi r3, r3, lbl_802099E8@l
/* 80057F58 00053E78  3B 63 00 0C */	addi r27, r3, 0xc
/* 80057F5C 00053E7C  3B 20 00 01 */	li r25, 1
/* 80057F60 00053E80  48 00 00 60 */	b lbl_80057FC0
lbl_80057F64:
/* 80057F64 00053E84  93 21 00 18 */	stw r25, 0x18(r1)
/* 80057F68 00053E88  3B 40 00 00 */	li r26, 0
/* 80057F6C 00053E8C  3B A0 00 00 */	li r29, 0
/* 80057F70 00053E90  48 00 00 3C */	b lbl_80057FAC
lbl_80057F74:
/* 80057F74 00053E94  80 7B 00 00 */	lwz r3, 0(r27)
/* 80057F78 00053E98  7C A3 E8 2E */	lwzx r5, r3, r29
/* 80057F7C 00053E9C  28 05 00 00 */	cmplwi r5, 0
/* 80057F80 00053EA0  41 82 00 24 */	beq lbl_80057FA4
/* 80057F84 00053EA4  80 85 00 08 */	lwz r4, 8(r5)
/* 80057F88 00053EA8  38 61 00 08 */	addi r3, r1, 8
/* 80057F8C 00053EAC  80 05 00 0C */	lwz r0, 0xc(r5)
/* 80057F90 00053EB0  90 81 00 90 */	stw r4, 0x90(r1)
/* 80057F94 00053EB4  90 01 00 94 */	stw r0, 0x94(r1)
/* 80057F98 00053EB8  80 05 00 10 */	lwz r0, 0x10(r5)
/* 80057F9C 00053EBC  90 01 00 98 */	stw r0, 0x98(r1)
/* 80057FA0 00053EC0  4B FF 4F 69 */	bl g_create_pickup_item
lbl_80057FA4:
/* 80057FA4 00053EC4  3B BD 00 04 */	addi r29, r29, 4
/* 80057FA8 00053EC8  3B 5A 00 01 */	addi r26, r26, 1
lbl_80057FAC:
/* 80057FAC 00053ECC  80 1B 00 08 */	lwz r0, 8(r27)
/* 80057FB0 00053ED0  7C 1A 00 00 */	cmpw r26, r0
/* 80057FB4 00053ED4  41 80 FF C0 */	blt lbl_80057F74
/* 80057FB8 00053ED8  3B 39 00 01 */	addi r25, r25, 1
/* 80057FBC 00053EDC  3B 7B 00 0C */	addi r27, r27, 0xc
lbl_80057FC0:
/* 80057FC0 00053EE0  80 0D 9D 68 */	lwz r0, movableStagePartCount@sda21(r13)
/* 80057FC4 00053EE4  7C 19 00 00 */	cmpw r25, r0
/* 80057FC8 00053EE8  41 80 FF 9C */	blt lbl_80057F64
/* 80057FCC 00053EEC  48 00 00 88 */	b lbl_80058054
lbl_80057FD0:
/* 80057FD0 00053EF0  3C 60 80 21 */	lis r3, lbl_8020A348@ha
/* 80057FD4 00053EF4  38 63 A3 48 */	addi r3, r3, lbl_8020A348@l
/* 80057FD8 00053EF8  3B 63 00 08 */	addi r27, r3, 8
/* 80057FDC 00053EFC  3B 20 00 01 */	li r25, 1
/* 80057FE0 00053F00  48 00 00 68 */	b lbl_80058048
lbl_80057FE4:
/* 80057FE4 00053F04  93 21 00 18 */	stw r25, 0x18(r1)
/* 80057FE8 00053F08  3B 40 00 00 */	li r26, 0
/* 80057FEC 00053F0C  83 9B 00 00 */	lwz r28, 0(r27)
/* 80057FF0 00053F10  48 00 00 44 */	b lbl_80058034
lbl_80057FF4:
/* 80057FF4 00053F14  80 1C 00 00 */	lwz r0, 0(r28)
/* 80057FF8 00053F18  28 00 00 01 */	cmplwi r0, 1
/* 80057FFC 00053F1C  40 82 00 30 */	bne lbl_8005802C
/* 80058000 00053F20  80 BC 00 04 */	lwz r5, 4(r28)
/* 80058004 00053F24  28 05 00 00 */	cmplwi r5, 0
/* 80058008 00053F28  41 82 00 24 */	beq lbl_8005802C
/* 8005800C 00053F2C  80 85 00 08 */	lwz r4, 8(r5)
/* 80058010 00053F30  38 61 00 08 */	addi r3, r1, 8
/* 80058014 00053F34  80 05 00 0C */	lwz r0, 0xc(r5)
/* 80058018 00053F38  90 81 00 90 */	stw r4, 0x90(r1)
/* 8005801C 00053F3C  90 01 00 94 */	stw r0, 0x94(r1)
/* 80058020 00053F40  80 05 00 10 */	lwz r0, 0x10(r5)
/* 80058024 00053F44  90 01 00 98 */	stw r0, 0x98(r1)
/* 80058028 00053F48  4B FF 4E E1 */	bl g_create_pickup_item
lbl_8005802C:
/* 8005802C 00053F4C  3B 5A 00 01 */	addi r26, r26, 1
/* 80058030 00053F50  3B 9C 00 0C */	addi r28, r28, 0xc
lbl_80058034:
/* 80058034 00053F54  80 1B 00 04 */	lwz r0, 4(r27)
/* 80058038 00053F58  7C 1A 00 00 */	cmpw r26, r0
/* 8005803C 00053F5C  41 80 FF B8 */	blt lbl_80057FF4
/* 80058040 00053F60  3B 39 00 01 */	addi r25, r25, 1
/* 80058044 00053F64  3B 7B 00 08 */	addi r27, r27, 8
lbl_80058048:
/* 80058048 00053F68  80 0D 9D 68 */	lwz r0, movableStagePartCount@sda21(r13)
/* 8005804C 00053F6C  7C 19 00 00 */	cmpw r25, r0
/* 80058050 00053F70  41 80 FF 94 */	blt lbl_80057FE4
lbl_80058054:
/* 80058054 00053F74  BB 21 01 14 */	lmw r25, 0x114(r1)
/* 80058058 00053F78  80 01 01 44 */	lwz r0, 0x144(r1)
/* 8005805C 00053F7C  CB E1 01 38 */	lfd f31, 0x138(r1)
/* 80058060 00053F80  CB C1 01 30 */	lfd f30, 0x130(r1)
/* 80058064 00053F84  7C 08 03 A6 */	mtlr r0
/* 80058068 00053F88  38 21 01 40 */	addi r1, r1, 0x140
/* 8005806C 00053F8C  4E 80 00 20 */	blr
.global bg_old_extramaster_main
bg_old_extramaster_main:
/* 80058070 00053F90  7C 08 02 A6 */	mflr r0
/* 80058074 00053F94  90 01 00 04 */	stw r0, 4(r1)
/* 80058078 00053F98  94 21 FF D0 */	stwu r1, -0x30(r1)
/* 8005807C 00053F9C  93 E1 00 2C */	stw r31, 0x2c(r1)
/* 80058080 00053FA0  93 C1 00 28 */	stw r30, 0x28(r1)
/* 80058084 00053FA4  93 A1 00 24 */	stw r29, 0x24(r1)
/* 80058088 00053FA8  80 0D 9D 00 */	lwz r0, gamePauseStatus@sda21(r13)
/* 8005808C 00053FAC  70 00 00 0A */	andi. r0, r0, 0xa
/* 80058090 00053FB0  40 82 01 A8 */	bne lbl_80058238
/* 80058094 00053FB4  3C 60 80 1C */	lis r3, backgroundInfo@ha
/* 80058098 00053FB8  3B E3 91 78 */	addi r31, r3, backgroundInfo@l
/* 8005809C 00053FBC  C0 1F 00 20 */	lfs f0, 0x20(r31)
/* 800580A0 00053FC0  38 7F 00 14 */	addi r3, r31, 0x14
/* 800580A4 00053FC4  C0 3F 00 14 */	lfs f1, 0x14(r31)
/* 800580A8 00053FC8  EC 01 00 2A */	fadds f0, f1, f0
/* 800580AC 00053FCC  D0 1F 00 14 */	stfs f0, 0x14(r31)
/* 800580B0 00053FD0  C0 3F 00 18 */	lfs f1, 0x18(r31)
/* 800580B4 00053FD4  C0 1F 00 24 */	lfs f0, 0x24(r31)
/* 800580B8 00053FD8  EC 01 00 2A */	fadds f0, f1, f0
/* 800580BC 00053FDC  D0 1F 00 18 */	stfs f0, 0x18(r31)
/* 800580C0 00053FE0  C0 3F 00 1C */	lfs f1, 0x1c(r31)
/* 800580C4 00053FE4  C0 1F 00 28 */	lfs f0, 0x28(r31)
/* 800580C8 00053FE8  EC 01 00 2A */	fadds f0, f1, f0
/* 800580CC 00053FEC  D0 1F 00 1C */	stfs f0, 0x1c(r31)
/* 800580D0 00053FF0  4B FA F4 ED */	bl mathutil_mtxA_from_translate
/* 800580D4 00053FF4  3B DF 00 2C */	addi r30, r31, 0x2c
/* 800580D8 00053FF8  C0 1F 00 38 */	lfs f0, 0x38(r31)
/* 800580DC 00053FFC  C0 3F 00 2C */	lfs f1, 0x2c(r31)
/* 800580E0 00054000  38 7F 00 30 */	addi r3, r31, 0x30
/* 800580E4 00054004  3B BF 00 34 */	addi r29, r31, 0x34
/* 800580E8 00054008  EC 01 00 2A */	fadds f0, f1, f0
/* 800580EC 0005400C  D0 1F 00 2C */	stfs f0, 0x2c(r31)
/* 800580F0 00054010  C0 3F 00 30 */	lfs f1, 0x30(r31)
/* 800580F4 00054014  C0 1F 00 3C */	lfs f0, 0x3c(r31)
/* 800580F8 00054018  EC 01 00 2A */	fadds f0, f1, f0
/* 800580FC 0005401C  D0 1F 00 30 */	stfs f0, 0x30(r31)
/* 80058100 00054020  C0 3F 00 34 */	lfs f1, 0x34(r31)
/* 80058104 00054024  C0 1F 00 40 */	lfs f0, 0x40(r31)
/* 80058108 00054028  EC 01 00 2A */	fadds f0, f1, f0
/* 8005810C 0005402C  D0 1F 00 34 */	stfs f0, 0x34(r31)
/* 80058110 00054030  C0 3F 00 2C */	lfs f1, 0x2c(r31)
/* 80058114 00054034  C8 02 96 60 */	lfd f0, lbl_802F3E60@sda21(r2)
/* 80058118 00054038  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8005811C 0005403C  40 80 00 14 */	bge lbl_80058130
/* 80058120 00054040  C0 02 96 20 */	lfs f0, lbl_802F3E20@sda21(r2)
/* 80058124 00054044  EC 01 00 2A */	fadds f0, f1, f0
/* 80058128 00054048  D0 1E 00 00 */	stfs f0, 0(r30)
/* 8005812C 0005404C  48 00 00 18 */	b lbl_80058144
lbl_80058130:
/* 80058130 00054050  C0 02 96 20 */	lfs f0, lbl_802F3E20@sda21(r2)
/* 80058134 00054054  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 80058138 00054058  40 81 00 0C */	ble lbl_80058144
/* 8005813C 0005405C  EC 01 00 28 */	fsubs f0, f1, f0
/* 80058140 00054060  D0 1E 00 00 */	stfs f0, 0(r30)
lbl_80058144:
/* 80058144 00054064  C0 23 00 00 */	lfs f1, 0(r3)
/* 80058148 00054068  C8 02 96 60 */	lfd f0, lbl_802F3E60@sda21(r2)
/* 8005814C 0005406C  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 80058150 00054070  40 80 00 14 */	bge lbl_80058164
/* 80058154 00054074  C0 02 96 20 */	lfs f0, lbl_802F3E20@sda21(r2)
/* 80058158 00054078  EC 01 00 2A */	fadds f0, f1, f0
/* 8005815C 0005407C  D0 03 00 00 */	stfs f0, 0(r3)
/* 80058160 00054080  48 00 00 18 */	b lbl_80058178
lbl_80058164:
/* 80058164 00054084  C0 02 96 20 */	lfs f0, lbl_802F3E20@sda21(r2)
/* 80058168 00054088  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 8005816C 0005408C  40 81 00 0C */	ble lbl_80058178
/* 80058170 00054090  EC 01 00 28 */	fsubs f0, f1, f0
/* 80058174 00054094  D0 03 00 00 */	stfs f0, 0(r3)
lbl_80058178:
/* 80058178 00054098  C0 3D 00 00 */	lfs f1, 0(r29)
/* 8005817C 0005409C  C8 02 96 60 */	lfd f0, lbl_802F3E60@sda21(r2)
/* 80058180 000540A0  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 80058184 000540A4  40 80 00 14 */	bge lbl_80058198
/* 80058188 000540A8  C0 02 96 20 */	lfs f0, lbl_802F3E20@sda21(r2)
/* 8005818C 000540AC  EC 01 00 2A */	fadds f0, f1, f0
/* 80058190 000540B0  D0 1D 00 00 */	stfs f0, 0(r29)
/* 80058194 000540B4  48 00 00 18 */	b lbl_800581AC
lbl_80058198:
/* 80058198 000540B8  C0 02 96 20 */	lfs f0, lbl_802F3E20@sda21(r2)
/* 8005819C 000540BC  FC 01 00 40 */	fcmpo cr0, f1, f0
/* 800581A0 000540C0  40 81 00 0C */	ble lbl_800581AC
/* 800581A4 000540C4  EC 01 00 28 */	fsubs f0, f1, f0
/* 800581A8 000540C8  D0 1D 00 00 */	stfs f0, 0(r29)
lbl_800581AC:
/* 800581AC 000540CC  C0 03 00 00 */	lfs f0, 0(r3)
/* 800581B0 000540D0  FC 00 00 1E */	fctiwz f0, f0
/* 800581B4 000540D4  D8 01 00 18 */	stfd f0, 0x18(r1)
/* 800581B8 000540D8  80 01 00 1C */	lwz r0, 0x1c(r1)
/* 800581BC 000540DC  7C 03 07 34 */	extsh r3, r0
/* 800581C0 000540E0  4B FA FE 3D */	bl mathutil_mtxA_rotate_y
/* 800581C4 000540E4  C0 1E 00 00 */	lfs f0, 0(r30)
/* 800581C8 000540E8  FC 00 00 1E */	fctiwz f0, f0
/* 800581CC 000540EC  D8 01 00 10 */	stfd f0, 0x10(r1)
/* 800581D0 000540F0  80 01 00 14 */	lwz r0, 0x14(r1)
/* 800581D4 000540F4  7C 03 07 34 */	extsh r3, r0
/* 800581D8 000540F8  4B FA FD B1 */	bl mathutil_mtxA_rotate_x
/* 800581DC 000540FC  C0 1D 00 00 */	lfs f0, 0(r29)
/* 800581E0 00054100  FC 00 00 1E */	fctiwz f0, f0
/* 800581E4 00054104  D8 01 00 08 */	stfd f0, 8(r1)
/* 800581E8 00054108  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800581EC 0005410C  7C 03 07 34 */	extsh r3, r0
/* 800581F0 00054110  4B FA FE 99 */	bl mathutil_mtxA_rotate_z
/* 800581F4 00054114  80 0D 99 54 */	lwz r0, unpausedFrameCounter@sda21(r13)
/* 800581F8 00054118  54 03 30 32 */	slwi r3, r0, 6
/* 800581FC 0005411C  4B FA EF E5 */	bl mathutil_sin
/* 80058200 00054120  C8 02 96 48 */	lfd f0, lbl_802F3E48@sda21(r2)
/* 80058204 00054124  C8 42 96 40 */	lfd f2, lbl_802F3E40@sda21(r2)
/* 80058208 00054128  FC 20 00 72 */	fmul f1, f0, f1
/* 8005820C 0005412C  C8 02 96 38 */	lfd f0, lbl_802F3E38@sda21(r2)
/* 80058210 00054130  FC 22 08 2A */	fadd f1, f2, f1
/* 80058214 00054134  FC 20 08 24 */	fdiv f1, f0, f1
/* 80058218 00054138  FC 20 08 18 */	frsp f1, f1
/* 8005821C 0005413C  FC 40 08 90 */	fmr f2, f1
/* 80058220 00054140  FC 60 08 90 */	fmr f3, f1
/* 80058224 00054144  4B FA FB B5 */	bl mathutil_mtxA_scale_xyz
/* 80058228 00054148  3C 60 80 1C */	lis r3, backgroundInfo@ha
/* 8005822C 0005414C  38 63 91 78 */	addi r3, r3, backgroundInfo@l
/* 80058230 00054150  38 63 00 48 */	addi r3, r3, 0x48
/* 80058234 00054154  4B FA F6 45 */	bl mathutil_mtxA_to_mtx
lbl_80058238:
/* 80058238 00054158  80 01 00 34 */	lwz r0, 0x34(r1)
/* 8005823C 0005415C  83 E1 00 2C */	lwz r31, 0x2c(r1)
/* 80058240 00054160  83 C1 00 28 */	lwz r30, 0x28(r1)
/* 80058244 00054164  7C 08 03 A6 */	mtlr r0
/* 80058248 00054168  83 A1 00 24 */	lwz r29, 0x24(r1)
/* 8005824C 0005416C  38 21 00 30 */	addi r1, r1, 0x30
/* 80058250 00054170  4E 80 00 20 */	blr
.global bg_old_extramaster_finish
bg_old_extramaster_finish:
/* 80058254 00054174  4E 80 00 20 */	blr
.global bg_old_extramaster_draw
bg_old_extramaster_draw:
/* 80058258 00054178  7C 08 02 A6 */	mflr r0
/* 8005825C 0005417C  90 01 00 04 */	stw r0, 4(r1)
/* 80058260 00054180  94 21 FF F8 */	stwu r1, -8(r1)
/* 80058264 00054184  80 6D 99 5C */	lwz r3, lbl_802F1B3C@sda21(r13)
/* 80058268 00054188  38 63 00 30 */	addi r3, r3, 0x30
/* 8005826C 0005418C  4B FA F6 45 */	bl mathutil_mtxA_from_mtx
/* 80058270 00054190  80 6D 99 1C */	lwz r3, naomiBackgroundObj@sda21(r13)
/* 80058274 00054194  80 63 00 A4 */	lwz r3, 0xa4(r3)
/* 80058278 00054198  4B FD B8 5D */	bl g_call_draw_naomi_model_and_do_other_stuff
/* 8005827C 0005419C  80 01 00 0C */	lwz r0, 0xc(r1)
/* 80058280 000541A0  38 21 00 08 */	addi r1, r1, 8
/* 80058284 000541A4  7C 08 03 A6 */	mtlr r0
/* 80058288 000541A8  4E 80 00 20 */	blr
.global func_8005828C
func_8005828C:
/* 8005828C 000541AC  7C 08 02 A6 */	mflr r0
/* 80058290 000541B0  2C 03 00 02 */	cmpwi r3, 2
/* 80058294 000541B4  90 01 00 04 */	stw r0, 4(r1)
/* 80058298 000541B8  94 21 FF 00 */	stwu r1, -0x100(r1)
/* 8005829C 000541BC  DB E1 00 F8 */	stfd f31, 0xf8(r1)
/* 800582A0 000541C0  93 E1 00 F4 */	stw r31, 0xf4(r1)
/* 800582A4 000541C4  93 C1 00 F0 */	stw r30, 0xf0(r1)
/* 800582A8 000541C8  40 80 01 FC */	bge lbl_800584A4
/* 800582AC 000541CC  2C 03 00 00 */	cmpwi r3, 0
/* 800582B0 000541D0  40 80 00 08 */	bge lbl_800582B8
/* 800582B4 000541D4  48 00 01 F0 */	b lbl_800584A4
lbl_800582B8:
/* 800582B8 000541D8  38 61 00 18 */	addi r3, r1, 0x18
/* 800582BC 000541DC  38 80 00 00 */	li r4, 0
/* 800582C0 000541E0  38 A0 00 AC */	li r5, 0xac
/* 800582C4 000541E4  4B FA B0 5D */	bl memset
/* 800582C8 000541E8  80 6D 99 5C */	lwz r3, lbl_802F1B3C@sda21(r13)
/* 800582CC 000541EC  38 00 00 0C */	li r0, 0xc
/* 800582D0 000541F0  B0 01 00 20 */	sth r0, 0x20(r1)
/* 800582D4 000541F4  38 63 00 30 */	addi r3, r3, 0x30
/* 800582D8 000541F8  4B FA F5 D9 */	bl mathutil_mtxA_from_mtx
/* 800582DC 000541FC  48 0A E5 89 */	bl rand
/* 800582E0 00054200  6C 60 80 00 */	xoris r0, r3, 0x8000
/* 800582E4 00054204  C8 82 96 58 */	lfd f4, lbl_802F3E58@sda21(r2)
/* 800582E8 00054208  90 01 00 EC */	stw r0, 0xec(r1)
/* 800582EC 0005420C  3F E0 43 30 */	lis r31, 0x4330
/* 800582F0 00054210  C0 42 95 F8 */	lfs f2, lbl_802F3DF8@sda21(r2)
/* 800582F4 00054214  93 E1 00 E8 */	stw r31, 0xe8(r1)
/* 800582F8 00054218  C8 22 96 70 */	lfd f1, lbl_802F3E70@sda21(r2)
/* 800582FC 0005421C  C8 61 00 E8 */	lfd f3, 0xe8(r1)
/* 80058300 00054220  C8 02 96 68 */	lfd f0, lbl_802F3E68@sda21(r2)
/* 80058304 00054224  EC 63 20 28 */	fsubs f3, f3, f4
/* 80058308 00054228  EC 43 10 24 */	fdivs f2, f3, f2
/* 8005830C 0005422C  FC 21 00 B2 */	fmul f1, f1, f2
/* 80058310 00054230  FC 00 08 2A */	fadd f0, f0, f1
/* 80058314 00054234  FC 00 00 18 */	frsp f0, f0
/* 80058318 00054238  D0 01 00 14 */	stfs f0, 0x14(r1)
/* 8005831C 0005423C  48 0A E5 49 */	bl rand
/* 80058320 00054240  6C 60 80 00 */	xoris r0, r3, 0x8000
/* 80058324 00054244  80 6D 9A 5C */	lwz r3, currentCameraStructPtr@sda21(r13)
/* 80058328 00054248  90 01 00 E4 */	stw r0, 0xe4(r1)
/* 8005832C 0005424C  3B C1 00 4C */	addi r30, r1, 0x4c
/* 80058330 00054250  C8 22 96 58 */	lfd f1, lbl_802F3E58@sda21(r2)
/* 80058334 00054254  38 A3 00 38 */	addi r5, r3, 0x38
/* 80058338 00054258  93 E1 00 E0 */	stw r31, 0xe0(r1)
/* 8005833C 0005425C  C0 62 95 F8 */	lfs f3, lbl_802F3DF8@sda21(r2)
/* 80058340 00054260  7F C4 F3 78 */	mr r4, r30
/* 80058344 00054264  C8 01 00 E0 */	lfd f0, 0xe0(r1)
/* 80058348 00054268  C8 42 96 78 */	lfd f2, lbl_802F3E78@sda21(r2)
/* 8005834C 0005426C  EC 80 08 28 */	fsubs f4, f0, f1
/* 80058350 00054270  C0 21 00 14 */	lfs f1, 0x14(r1)
/* 80058354 00054274  C0 03 00 38 */	lfs f0, 0x38(r3)
/* 80058358 00054278  38 61 00 0C */	addi r3, r1, 0xc
/* 8005835C 0005427C  FC 22 00 72 */	fmul f1, f2, f1
/* 80058360 00054280  EC 84 18 24 */	fdivs f4, f4, f3
/* 80058364 00054284  C8 62 96 00 */	lfd f3, lbl_802F3E00@sda21(r2)
/* 80058368 00054288  C8 42 96 80 */	lfd f2, lbl_802F3E80@sda21(r2)
/* 8005836C 0005428C  FC 01 00 32 */	fmul f0, f1, f0
/* 80058370 00054290  FC 24 18 28 */	fsub f1, f4, f3
/* 80058374 00054294  FC 00 00 72 */	fmul f0, f0, f1
/* 80058378 00054298  FC 00 00 18 */	frsp f0, f0
/* 8005837C 0005429C  D0 01 00 0C */	stfs f0, 0xc(r1)
/* 80058380 000542A0  C0 21 00 14 */	lfs f1, 0x14(r1)
/* 80058384 000542A4  C0 05 00 00 */	lfs f0, 0(r5)
/* 80058388 000542A8  FC 22 00 72 */	fmul f1, f2, f1
/* 8005838C 000542AC  FC 01 00 32 */	fmul f0, f1, f0
/* 80058390 000542B0  FC 00 00 18 */	frsp f0, f0
/* 80058394 000542B4  D0 01 00 10 */	stfs f0, 0x10(r1)
/* 80058398 000542B8  4B FA FB 35 */	bl mathutil_mtxA_rigid_inv_tf_point
/* 8005839C 000542BC  C0 01 00 14 */	lfs f0, 0x14(r1)
/* 800583A0 000542C0  C8 22 96 88 */	lfd f1, lbl_802F3E88@sda21(r2)
/* 800583A4 000542C4  FC 00 00 50 */	fneg f0, f0
/* 800583A8 000542C8  FF E1 00 32 */	fmul f31, f1, f0
/* 800583AC 000542CC  FF E0 F8 18 */	frsp f31, f31
/* 800583B0 000542D0  48 0A E4 B5 */	bl rand
/* 800583B4 000542D4  6C 60 80 00 */	xoris r0, r3, 0x8000
/* 800583B8 000542D8  C8 62 96 58 */	lfd f3, lbl_802F3E58@sda21(r2)
/* 800583BC 000542DC  90 01 00 DC */	stw r0, 0xdc(r1)
/* 800583C0 000542E0  C0 22 95 F8 */	lfs f1, lbl_802F3DF8@sda21(r2)
/* 800583C4 000542E4  93 E1 00 D8 */	stw r31, 0xd8(r1)
/* 800583C8 000542E8  C8 02 96 38 */	lfd f0, lbl_802F3E38@sda21(r2)
/* 800583CC 000542EC  C8 41 00 D8 */	lfd f2, 0xd8(r1)
/* 800583D0 000542F0  EC 42 18 28 */	fsubs f2, f2, f3
/* 800583D4 000542F4  EC 22 08 24 */	fdivs f1, f2, f1
/* 800583D8 000542F8  FC 00 08 2A */	fadd f0, f0, f1
/* 800583DC 000542FC  FC 1F 00 32 */	fmul f0, f31, f0
/* 800583E0 00054300  FC 00 00 18 */	frsp f0, f0
/* 800583E4 00054304  D0 01 00 58 */	stfs f0, 0x58(r1)
/* 800583E8 00054308  48 0A E4 7D */	bl rand
/* 800583EC 0005430C  6C 60 80 00 */	xoris r0, r3, 0x8000
/* 800583F0 00054310  C8 82 96 58 */	lfd f4, lbl_802F3E58@sda21(r2)
/* 800583F4 00054314  90 01 00 D4 */	stw r0, 0xd4(r1)
/* 800583F8 00054318  C0 42 95 F8 */	lfs f2, lbl_802F3DF8@sda21(r2)
/* 800583FC 0005431C  93 E1 00 D0 */	stw r31, 0xd0(r1)
/* 80058400 00054320  C8 22 96 98 */	lfd f1, lbl_802F3E98@sda21(r2)
/* 80058404 00054324  C8 61 00 D0 */	lfd f3, 0xd0(r1)
/* 80058408 00054328  C8 02 96 90 */	lfd f0, lbl_802F3E90@sda21(r2)
/* 8005840C 0005432C  EC 63 20 28 */	fsubs f3, f3, f4
/* 80058410 00054330  EC 43 10 24 */	fdivs f2, f3, f2
/* 80058414 00054334  FC 21 00 B2 */	fmul f1, f1, f2
/* 80058418 00054338  FC 00 08 2A */	fadd f0, f0, f1
/* 8005841C 0005433C  FC 1F 00 32 */	fmul f0, f31, f0
/* 80058420 00054340  FC 00 00 18 */	frsp f0, f0
/* 80058424 00054344  D0 01 00 5C */	stfs f0, 0x5c(r1)
/* 80058428 00054348  48 0A E4 3D */	bl rand
/* 8005842C 0005434C  6C 60 80 00 */	xoris r0, r3, 0x8000
/* 80058430 00054350  C0 02 96 A0 */	lfs f0, lbl_802F3EA0@sda21(r2)
/* 80058434 00054354  90 01 00 CC */	stw r0, 0xcc(r1)
/* 80058438 00054358  38 61 00 0C */	addi r3, r1, 0xc
/* 8005843C 0005435C  C8 82 96 58 */	lfd f4, lbl_802F3E58@sda21(r2)
/* 80058440 00054360  7C 64 1B 78 */	mr r4, r3
/* 80058444 00054364  93 E1 00 C8 */	stw r31, 0xc8(r1)
/* 80058448 00054368  C0 42 95 F8 */	lfs f2, lbl_802F3DF8@sda21(r2)
/* 8005844C 0005436C  C8 61 00 C8 */	lfd f3, 0xc8(r1)
/* 80058450 00054370  C8 22 96 38 */	lfd f1, lbl_802F3E38@sda21(r2)
/* 80058454 00054374  EC 63 20 28 */	fsubs f3, f3, f4
/* 80058458 00054378  D0 01 00 0C */	stfs f0, 0xc(r1)
/* 8005845C 0005437C  EC 43 10 24 */	fdivs f2, f3, f2
/* 80058460 00054380  FC 21 10 2A */	fadd f1, f1, f2
/* 80058464 00054384  FC 3F 00 72 */	fmul f1, f31, f1
/* 80058468 00054388  FC 20 08 18 */	frsp f1, f1
/* 8005846C 0005438C  D0 21 00 60 */	stfs f1, 0x60(r1)
/* 80058470 00054390  D0 01 00 10 */	stfs f0, 0x10(r1)
/* 80058474 00054394  D0 01 00 14 */	stfs f0, 0x14(r1)
/* 80058478 00054398  4B FA FA 55 */	bl mathutil_mtxA_rigid_inv_tf_point
/* 8005847C 0005439C  38 9E 00 00 */	addi r4, r30, 0
/* 80058480 000543A0  38 61 00 0C */	addi r3, r1, 0xc
/* 80058484 000543A4  38 A1 00 64 */	addi r5, r1, 0x64
/* 80058488 000543A8  38 C1 00 66 */	addi r6, r1, 0x66
/* 8005848C 000543AC  4B FB 02 35 */	bl mathutil_ray_to_euler_xy
/* 80058490 000543B0  48 0A E3 D5 */	bl rand
/* 80058494 000543B4  54 60 04 7E */	clrlwi r0, r3, 0x11
/* 80058498 000543B8  B0 01 00 68 */	sth r0, 0x68(r1)
/* 8005849C 000543BC  38 61 00 18 */	addi r3, r1, 0x18
/* 800584A0 000543C0  4B FF 4A 69 */	bl g_create_pickup_item
lbl_800584A4:
/* 800584A4 000543C4  80 01 01 04 */	lwz r0, 0x104(r1)
/* 800584A8 000543C8  CB E1 00 F8 */	lfd f31, 0xf8(r1)
/* 800584AC 000543CC  83 E1 00 F4 */	lwz r31, 0xf4(r1)
/* 800584B0 000543D0  7C 08 03 A6 */	mtlr r0
/* 800584B4 000543D4  83 C1 00 F0 */	lwz r30, 0xf0(r1)
/* 800584B8 000543D8  38 21 01 00 */	addi r1, r1, 0x100
/* 800584BC 000543DC  4E 80 00 20 */	blr

.section .sdata2

    .balign 8
.global lbl_802F3DF0
lbl_802F3DF0:
	# ROM: 0x1ED810
	.4byte 0x3F800000

.global lbl_802F3DF4
lbl_802F3DF4:
	# ROM: 0x1ED814
	.4byte 0x3F2AAAAB

.global lbl_802F3DF8
lbl_802F3DF8:
	# ROM: 0x1ED818
	.4byte 0x46FFFE00
	.4byte 0

.global lbl_802F3E00
lbl_802F3E00:
	# ROM: 0x1ED820
	.4byte 0x3FE00000
	.4byte 0

.global lbl_802F3E08
lbl_802F3E08:
	# ROM: 0x1ED828
	.4byte 0x40440000
	.4byte 0

.global lbl_802F3E10
lbl_802F3E10:
	# ROM: 0x1ED830
	.4byte 0xBF423456
	.4byte 0x789ABCDF

.global lbl_802F3E18
lbl_802F3E18:
	# ROM: 0x1ED838
	.4byte 0x40700000
	.4byte 0

.global lbl_802F3E20
lbl_802F3E20:
	# ROM: 0x1ED840
	.4byte 0x47800000
	.4byte 0

.global lbl_802F3E28
lbl_802F3E28:
	# ROM: 0x1ED848
	.4byte 0x40323456
	.4byte 0x789ABCDF

.global lbl_802F3E30
lbl_802F3E30:
	# ROM: 0x1ED850
	.4byte 0x40600000
	.4byte 0

.global lbl_802F3E38
lbl_802F3E38:
	# ROM: 0x1ED858
	.4byte 0x3FF00000
	.4byte 0

.global lbl_802F3E40
lbl_802F3E40:
	# ROM: 0x1ED860
	.4byte 0x400C0000
	.4byte 0

.global lbl_802F3E48
lbl_802F3E48:
	# ROM: 0x1ED868
	.4byte 0x3FF80000
	.4byte 0

.global lbl_802F3E50
lbl_802F3E50:
	# ROM: 0x1ED870
	.4byte 0x403E0000
	.4byte 0

.global lbl_802F3E58
lbl_802F3E58:
	# ROM: 0x1ED878
	.4byte 0x43300000
	.4byte 0x80000000

.global lbl_802F3E60
lbl_802F3E60:
	# ROM: 0x1ED880
	.4byte 0
	.4byte 0

.global lbl_802F3E68
lbl_802F3E68:
	# ROM: 0x1ED888
	.4byte 0xC0668000
	.4byte 0

.global lbl_802F3E70
lbl_802F3E70:
	# ROM: 0x1ED890
	.4byte 0xC072C000
	.4byte 0

.global lbl_802F3E78
lbl_802F3E78:
	# ROM: 0x1ED898
	.4byte 0xC0055555
	.4byte 0x55555555

.global lbl_802F3E80
lbl_802F3E80:
	# ROM: 0x1ED8A0
	.4byte 0xBFF19999
	.4byte 0x9999999A

.global lbl_802F3E88
lbl_802F3E88:
	# ROM: 0x1ED8A8
	.4byte 0x3F6B4E81
	.4byte 0xB4E81B4F

.global lbl_802F3E90
lbl_802F3E90:
	# ROM: 0x1ED8B0
	.4byte 0xC0080000
	.4byte 0

.global lbl_802F3E98
lbl_802F3E98:
	# ROM: 0x1ED8B8
	.4byte 0xBFF00000
	.4byte 0

.global lbl_802F3EA0
lbl_802F3EA0:
	# ROM: 0x1ED8C0
	.4byte 0
	.4byte 0

.section .data

    .balign 8
.global lbl_801B9B48
lbl_801B9B48:
	# ROM: 0x1B6B48
glabel string_obj_STARPOINT_
	.asciz "obj_STARPOINT_"
	.balign 4
