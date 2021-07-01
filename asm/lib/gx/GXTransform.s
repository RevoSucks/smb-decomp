.include "macros.inc"

.section .text, "ax"  # 0x800065A0 - 0x8010F860

.global GXSetProjection
GXSetProjection:
/* 800E43A8 000E02C8  80 AD 97 C8 */	lwz r5, gx-_SDA_BASE_(r13)
/* 800E43AC 000E02CC  2C 04 00 01 */	cmpwi r4, 1
/* 800E43B0 000E02D0  90 85 04 20 */	stw r4, 0x420(r5)
/* 800E43B4 000E02D4  C0 03 00 00 */	lfs f0, 0(r3)
/* 800E43B8 000E02D8  80 8D 97 C8 */	lwz r4, gx-_SDA_BASE_(r13)
/* 800E43BC 000E02DC  D0 04 04 24 */	stfs f0, 0x424(r4)
/* 800E43C0 000E02E0  C0 03 00 14 */	lfs f0, 0x14(r3)
/* 800E43C4 000E02E4  80 8D 97 C8 */	lwz r4, gx-_SDA_BASE_(r13)
/* 800E43C8 000E02E8  D0 04 04 2C */	stfs f0, 0x42c(r4)
/* 800E43CC 000E02EC  C0 03 00 28 */	lfs f0, 0x28(r3)
/* 800E43D0 000E02F0  80 8D 97 C8 */	lwz r4, gx-_SDA_BASE_(r13)
/* 800E43D4 000E02F4  D0 04 04 34 */	stfs f0, 0x434(r4)
/* 800E43D8 000E02F8  C0 03 00 2C */	lfs f0, 0x2c(r3)
/* 800E43DC 000E02FC  80 8D 97 C8 */	lwz r4, gx-_SDA_BASE_(r13)
/* 800E43E0 000E0300  D0 04 04 38 */	stfs f0, 0x438(r4)
/* 800E43E4 000E0304  40 82 00 20 */	bne lbl_800E4404
/* 800E43E8 000E0308  C0 03 00 0C */	lfs f0, 0xc(r3)
/* 800E43EC 000E030C  80 8D 97 C8 */	lwz r4, gx-_SDA_BASE_(r13)
/* 800E43F0 000E0310  D0 04 04 28 */	stfs f0, 0x428(r4)
/* 800E43F4 000E0314  C0 03 00 1C */	lfs f0, 0x1c(r3)
/* 800E43F8 000E0318  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800E43FC 000E031C  D0 03 04 30 */	stfs f0, 0x430(r3)
/* 800E4400 000E0320  48 00 00 1C */	b lbl_800E441C
lbl_800E4404:
/* 800E4404 000E0324  C0 03 00 08 */	lfs f0, 8(r3)
/* 800E4408 000E0328  80 8D 97 C8 */	lwz r4, gx-_SDA_BASE_(r13)
/* 800E440C 000E032C  D0 04 04 28 */	stfs f0, 0x428(r4)
/* 800E4410 000E0330  C0 03 00 18 */	lfs f0, 0x18(r3)
/* 800E4414 000E0334  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800E4418 000E0338  D0 03 04 30 */	stfs f0, 0x430(r3)
lbl_800E441C:
/* 800E441C 000E033C  38 00 00 10 */	li r0, 0x10
/* 800E4420 000E0340  80 8D 97 C8 */	lwz r4, gx-_SDA_BASE_(r13)
/* 800E4424 000E0344  3C A0 CC 01 */	lis r5, 0xCC008000@ha
/* 800E4428 000E0348  3C 60 00 06 */	lis r3, 0x00061020@ha
/* 800E442C 000E034C  98 05 80 00 */	stb r0, 0xCC008000@l(r5)
/* 800E4430 000E0350  38 03 10 20 */	addi r0, r3, 0x00061020@l
/* 800E4434 000E0354  90 05 80 00 */	stw r0, -0x8000(r5)
/* 800E4438 000E0358  38 00 00 00 */	li r0, 0
/* 800E443C 000E035C  C0 04 04 24 */	lfs f0, 0x424(r4)
/* 800E4440 000E0360  D0 05 80 00 */	stfs f0, -0x8000(r5)
/* 800E4444 000E0364  C0 04 04 28 */	lfs f0, 0x428(r4)
/* 800E4448 000E0368  D0 05 80 00 */	stfs f0, -0x8000(r5)
/* 800E444C 000E036C  C0 04 04 2C */	lfs f0, 0x42c(r4)
/* 800E4450 000E0370  D0 05 80 00 */	stfs f0, -0x8000(r5)
/* 800E4454 000E0374  C0 04 04 30 */	lfs f0, 0x430(r4)
/* 800E4458 000E0378  D0 05 80 00 */	stfs f0, -0x8000(r5)
/* 800E445C 000E037C  C0 04 04 34 */	lfs f0, 0x434(r4)
/* 800E4460 000E0380  D0 05 80 00 */	stfs f0, -0x8000(r5)
/* 800E4464 000E0384  C0 04 04 38 */	lfs f0, 0x438(r4)
/* 800E4468 000E0388  D0 05 80 00 */	stfs f0, -0x8000(r5)
/* 800E446C 000E038C  80 64 04 20 */	lwz r3, 0x420(r4)
/* 800E4470 000E0390  90 65 80 00 */	stw r3, -0x8000(r5)
/* 800E4474 000E0394  B0 04 00 02 */	sth r0, 2(r4)
/* 800E4478 000E0398  4E 80 00 20 */	blr

.global GXGetProjectionv
GXGetProjectionv:
/* 800E447C 000E039C  94 21 FF E8 */	stwu r1, -0x18(r1)
/* 800E4480 000E03A0  3C 00 43 30 */	lis r0, 0x4330
/* 800E4484 000E03A4  80 8D 97 C8 */	lwz r4, gx-_SDA_BASE_(r13)
/* 800E4488 000E03A8  C8 22 C0 70 */	lfd f1, lbl_802F6870-_SDA2_BASE_(r2)
/* 800E448C 000E03AC  80 84 04 20 */	lwz r4, 0x420(r4)
/* 800E4490 000E03B0  90 81 00 14 */	stw r4, 0x14(r1)
/* 800E4494 000E03B4  90 01 00 10 */	stw r0, 0x10(r1)
/* 800E4498 000E03B8  C8 01 00 10 */	lfd f0, 0x10(r1)
/* 800E449C 000E03BC  38 21 00 18 */	addi r1, r1, 0x18
/* 800E44A0 000E03C0  EC 00 08 28 */	fsubs f0, f0, f1
/* 800E44A4 000E03C4  D0 03 00 00 */	stfs f0, 0(r3)
/* 800E44A8 000E03C8  80 8D 97 C8 */	lwz r4, gx-_SDA_BASE_(r13)
/* 800E44AC 000E03CC  C0 04 04 24 */	lfs f0, 0x424(r4)
/* 800E44B0 000E03D0  D0 03 00 04 */	stfs f0, 4(r3)
/* 800E44B4 000E03D4  80 8D 97 C8 */	lwz r4, gx-_SDA_BASE_(r13)
/* 800E44B8 000E03D8  C0 04 04 28 */	lfs f0, 0x428(r4)
/* 800E44BC 000E03DC  D0 03 00 08 */	stfs f0, 8(r3)
/* 800E44C0 000E03E0  80 8D 97 C8 */	lwz r4, gx-_SDA_BASE_(r13)
/* 800E44C4 000E03E4  C0 04 04 2C */	lfs f0, 0x42c(r4)
/* 800E44C8 000E03E8  D0 03 00 0C */	stfs f0, 0xc(r3)
/* 800E44CC 000E03EC  80 8D 97 C8 */	lwz r4, gx-_SDA_BASE_(r13)
/* 800E44D0 000E03F0  C0 04 04 30 */	lfs f0, 0x430(r4)
/* 800E44D4 000E03F4  D0 03 00 10 */	stfs f0, 0x10(r3)
/* 800E44D8 000E03F8  80 8D 97 C8 */	lwz r4, gx-_SDA_BASE_(r13)
/* 800E44DC 000E03FC  C0 04 04 34 */	lfs f0, 0x434(r4)
/* 800E44E0 000E0400  D0 03 00 14 */	stfs f0, 0x14(r3)
/* 800E44E4 000E0404  80 8D 97 C8 */	lwz r4, gx-_SDA_BASE_(r13)
/* 800E44E8 000E0408  C0 04 04 38 */	lfs f0, 0x438(r4)
/* 800E44EC 000E040C  D0 03 00 18 */	stfs f0, 0x18(r3)
/* 800E44F0 000E0410  4E 80 00 20 */	blr

.global WriteMTXPS4x3
WriteMTXPS4x3:
/* 800E44F4 000E0414  E0 03 00 00 */	psq_l f0, 0(r3), 0, qr0
/* 800E44F8 000E0418  E0 23 00 08 */	psq_l f1, 8(r3), 0, qr0
/* 800E44FC 000E041C  E0 43 00 10 */	psq_l f2, 16(r3), 0, qr0
/* 800E4500 000E0420  E0 63 00 18 */	psq_l f3, 24(r3), 0, qr0
/* 800E4504 000E0424  E0 83 00 20 */	psq_l f4, 32(r3), 0, qr0
/* 800E4508 000E0428  E0 A3 00 28 */	psq_l f5, 40(r3), 0, qr0
/* 800E450C 000E042C  F0 04 00 00 */	psq_st f0, 0(r4), 0, qr0
/* 800E4510 000E0430  F0 24 00 00 */	psq_st f1, 0(r4), 0, qr0
/* 800E4514 000E0434  F0 44 00 00 */	psq_st f2, 0(r4), 0, qr0
/* 800E4518 000E0438  F0 64 00 00 */	psq_st f3, 0(r4), 0, qr0
/* 800E451C 000E043C  F0 84 00 00 */	psq_st f4, 0(r4), 0, qr0
/* 800E4520 000E0440  F0 A4 00 00 */	psq_st f5, 0(r4), 0, qr0
/* 800E4524 000E0444  4E 80 00 20 */	blr

.global WriteMTXPS3x3from3x4
WriteMTXPS3x3from3x4:
/* 800E4528 000E0448  E0 03 00 00 */	psq_l f0, 0(r3), 0, qr0
/* 800E452C 000E044C  C0 23 00 08 */	lfs f1, 8(r3)
/* 800E4530 000E0450  E0 43 00 10 */	psq_l f2, 16(r3), 0, qr0
/* 800E4534 000E0454  C0 63 00 18 */	lfs f3, 0x18(r3)
/* 800E4538 000E0458  E0 83 00 20 */	psq_l f4, 32(r3), 0, qr0
/* 800E453C 000E045C  C0 A3 00 28 */	lfs f5, 0x28(r3)
/* 800E4540 000E0460  F0 04 00 00 */	psq_st f0, 0(r4), 0, qr0
/* 800E4544 000E0464  D0 24 00 00 */	stfs f1, 0(r4)
/* 800E4548 000E0468  F0 44 00 00 */	psq_st f2, 0(r4), 0, qr0
/* 800E454C 000E046C  D0 64 00 00 */	stfs f3, 0(r4)
/* 800E4550 000E0470  F0 84 00 00 */	psq_st f4, 0(r4), 0, qr0
/* 800E4554 000E0474  D0 A4 00 00 */	stfs f5, 0(r4)
/* 800E4558 000E0478  4E 80 00 20 */	blr

.global WriteMTXPS4x2
WriteMTXPS4x2:
/* 800E455C 000E047C  E0 03 00 00 */	psq_l f0, 0(r3), 0, qr0
/* 800E4560 000E0480  E0 23 00 08 */	psq_l f1, 8(r3), 0, qr0
/* 800E4564 000E0484  E0 43 00 10 */	psq_l f2, 16(r3), 0, qr0
/* 800E4568 000E0488  E0 63 00 18 */	psq_l f3, 24(r3), 0, qr0
/* 800E456C 000E048C  F0 04 00 00 */	psq_st f0, 0(r4), 0, qr0
/* 800E4570 000E0490  F0 24 00 00 */	psq_st f1, 0(r4), 0, qr0
/* 800E4574 000E0494  F0 44 00 00 */	psq_st f2, 0(r4), 0, qr0
/* 800E4578 000E0498  F0 64 00 00 */	psq_st f3, 0(r4), 0, qr0
/* 800E457C 000E049C  4E 80 00 20 */	blr

.global GXLoadPosMtxImm
GXLoadPosMtxImm:
/* 800E4580 000E04A0  7C 08 02 A6 */	mflr r0
/* 800E4584 000E04A4  90 01 00 04 */	stw r0, 4(r1)
/* 800E4588 000E04A8  94 21 FF F8 */	stwu r1, -8(r1)
/* 800E458C 000E04AC  38 C0 00 10 */	li r6, 0x10
/* 800E4590 000E04B0  3C A0 CC 01 */	lis r5, 0xCC008000@ha
/* 800E4594 000E04B4  54 80 10 3A */	slwi r0, r4, 2
/* 800E4598 000E04B8  98 C5 80 00 */	stb r6, 0xCC008000@l(r5)
/* 800E459C 000E04BC  64 00 00 0B */	oris r0, r0, 0xb
/* 800E45A0 000E04C0  90 05 80 00 */	stw r0, -0x8000(r5)
/* 800E45A4 000E04C4  38 85 80 00 */	addi r4, r5, -32768
/* 800E45A8 000E04C8  4B FF FF 4D */	bl WriteMTXPS4x3
/* 800E45AC 000E04CC  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800E45B0 000E04D0  38 21 00 08 */	addi r1, r1, 8
/* 800E45B4 000E04D4  7C 08 03 A6 */	mtlr r0
/* 800E45B8 000E04D8  4E 80 00 20 */	blr

.global GXLoadNrmMtxImm
GXLoadNrmMtxImm:
/* 800E45BC 000E04DC  7C 08 02 A6 */	mflr r0
/* 800E45C0 000E04E0  90 01 00 04 */	stw r0, 4(r1)
/* 800E45C4 000E04E4  94 21 FF F8 */	stwu r1, -8(r1)
/* 800E45C8 000E04E8  1C 84 00 03 */	mulli r4, r4, 3
/* 800E45CC 000E04EC  38 04 04 00 */	addi r0, r4, 0x400
/* 800E45D0 000E04F0  3C A0 CC 01 */	lis r5, 0xCC008000@ha
/* 800E45D4 000E04F4  38 C0 00 10 */	li r6, 0x10
/* 800E45D8 000E04F8  98 C5 80 00 */	stb r6, 0xCC008000@l(r5)
/* 800E45DC 000E04FC  64 00 00 08 */	oris r0, r0, 8
/* 800E45E0 000E0500  38 85 80 00 */	addi r4, r5, -32768
/* 800E45E4 000E0504  90 05 80 00 */	stw r0, -0x8000(r5)
/* 800E45E8 000E0508  4B FF FF 41 */	bl WriteMTXPS3x3from3x4
/* 800E45EC 000E050C  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800E45F0 000E0510  38 21 00 08 */	addi r1, r1, 8
/* 800E45F4 000E0514  7C 08 03 A6 */	mtlr r0
/* 800E45F8 000E0518  4E 80 00 20 */	blr

.global GXSetCurrentMtx
GXSetCurrentMtx:
/* 800E45FC 000E051C  7C 08 02 A6 */	mflr r0
/* 800E4600 000E0520  90 01 00 04 */	stw r0, 4(r1)
/* 800E4604 000E0524  94 21 FF F8 */	stwu r1, -8(r1)
/* 800E4608 000E0528  80 8D 97 C8 */	lwz r4, gx-_SDA_BASE_(r13)
/* 800E460C 000E052C  38 84 00 80 */	addi r4, r4, 0x80
/* 800E4610 000E0530  80 04 00 00 */	lwz r0, 0(r4)
/* 800E4614 000E0534  54 00 00 32 */	rlwinm r0, r0, 0, 0, 0x19
/* 800E4618 000E0538  7C 00 1B 78 */	or r0, r0, r3
/* 800E461C 000E053C  90 04 00 00 */	stw r0, 0(r4)
/* 800E4620 000E0540  38 60 00 00 */	li r3, 0
/* 800E4624 000E0544  48 00 02 F5 */	bl __GXSetMatrixIndex
/* 800E4628 000E0548  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800E462C 000E054C  38 21 00 08 */	addi r1, r1, 8
/* 800E4630 000E0550  7C 08 03 A6 */	mtlr r0
/* 800E4634 000E0554  4E 80 00 20 */	blr

.global GXLoadTexMtxImm
GXLoadTexMtxImm:
/* 800E4638 000E0558  7C 08 02 A6 */	mflr r0
/* 800E463C 000E055C  90 01 00 04 */	stw r0, 4(r1)
/* 800E4640 000E0560  94 21 FF F8 */	stwu r1, -8(r1)
/* 800E4644 000E0564  28 04 00 40 */	cmplwi r4, 0x40
/* 800E4648 000E0568  41 80 00 14 */	blt lbl_800E465C
/* 800E464C 000E056C  38 04 FF C0 */	addi r0, r4, -64
/* 800E4650 000E0570  54 04 10 3A */	slwi r4, r0, 2
/* 800E4654 000E0574  38 E4 05 00 */	addi r7, r4, 0x500
/* 800E4658 000E0578  48 00 00 08 */	b lbl_800E4660
lbl_800E465C:
/* 800E465C 000E057C  54 87 10 3A */	slwi r7, r4, 2
lbl_800E4660:
/* 800E4660 000E0580  2C 05 00 01 */	cmpwi r5, 1
/* 800E4664 000E0584  40 82 00 0C */	bne lbl_800E4670
/* 800E4668 000E0588  38 80 00 08 */	li r4, 8
/* 800E466C 000E058C  48 00 00 08 */	b lbl_800E4674
lbl_800E4670:
/* 800E4670 000E0590  38 80 00 0C */	li r4, 0xc
lbl_800E4674:
/* 800E4674 000E0594  38 04 FF FF */	addi r0, r4, -1
/* 800E4678 000E0598  54 00 80 1E */	slwi r0, r0, 0x10
/* 800E467C 000E059C  38 C0 00 10 */	li r6, 0x10
/* 800E4680 000E05A0  3C 80 CC 01 */	lis r4, 0xCC008000@ha
/* 800E4684 000E05A4  98 C4 80 00 */	stb r6, 0xCC008000@l(r4)
/* 800E4688 000E05A8  7C E0 03 78 */	or r0, r7, r0
/* 800E468C 000E05AC  2C 05 00 00 */	cmpwi r5, 0
/* 800E4690 000E05B0  90 04 80 00 */	stw r0, -0x8000(r4)
/* 800E4694 000E05B4  40 82 00 10 */	bne lbl_800E46A4
/* 800E4698 000E05B8  38 84 80 00 */	addi r4, r4, -32768
/* 800E469C 000E05BC  4B FF FE 59 */	bl WriteMTXPS4x3
/* 800E46A0 000E05C0  48 00 00 0C */	b lbl_800E46AC
lbl_800E46A4:
/* 800E46A4 000E05C4  38 84 80 00 */	addi r4, r4, -32768
/* 800E46A8 000E05C8  4B FF FE B5 */	bl WriteMTXPS4x2
lbl_800E46AC:
/* 800E46AC 000E05CC  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800E46B0 000E05D0  38 21 00 08 */	addi r1, r1, 8
/* 800E46B4 000E05D4  7C 08 03 A6 */	mtlr r0
/* 800E46B8 000E05D8  4E 80 00 20 */	blr

.global GXSetViewportJitter
GXSetViewportJitter:
/* 800E46BC 000E05DC  7C 08 02 A6 */	mflr r0
/* 800E46C0 000E05E0  90 01 00 04 */	stw r0, 4(r1)
/* 800E46C4 000E05E4  94 21 FF A0 */	stwu r1, -0x60(r1)
/* 800E46C8 000E05E8  DB E1 00 58 */	stfd f31, 0x58(r1)
/* 800E46CC 000E05EC  DB C1 00 50 */	stfd f30, 0x50(r1)
/* 800E46D0 000E05F0  DB A1 00 48 */	stfd f29, 0x48(r1)
/* 800E46D4 000E05F4  DB 81 00 40 */	stfd f28, 0x40(r1)
/* 800E46D8 000E05F8  DB 61 00 38 */	stfd f27, 0x38(r1)
/* 800E46DC 000E05FC  DB 41 00 30 */	stfd f26, 0x30(r1)
/* 800E46E0 000E0600  28 03 00 00 */	cmplwi r3, 0
/* 800E46E4 000E0604  40 82 00 0C */	bne lbl_800E46F0
/* 800E46E8 000E0608  C0 02 C0 68 */	lfs f0, lbl_802F6868-_SDA2_BASE_(r2)
/* 800E46EC 000E060C  EC 42 00 28 */	fsubs f2, f2, f0
lbl_800E46F0:
/* 800E46F0 000E0610  C1 62 C0 68 */	lfs f11, lbl_802F6868-_SDA2_BASE_(r2)
/* 800E46F4 000E0614  FD 40 20 50 */	fneg f10, f4
/* 800E46F8 000E0618  C0 02 C0 7C */	lfs f0, lbl_802F687C-_SDA2_BASE_(r2)
/* 800E46FC 000E061C  C1 22 C0 78 */	lfs f9, lbl_802F6878-_SDA2_BASE_(r2)
/* 800E4700 000E0620  EF E3 02 F2 */	fmuls f31, f3, f11
/* 800E4704 000E0624  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800E4708 000E0628  EC E4 02 F2 */	fmuls f7, f4, f11
/* 800E470C 000E062C  D0 23 04 3C */	stfs f1, 0x43c(r3)
/* 800E4710 000E0630  ED 01 F8 2A */	fadds f8, f1, f31
/* 800E4714 000E0634  EF C0 01 B2 */	fmuls f30, f0, f6
/* 800E4718 000E0638  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800E471C 000E063C  EC 22 38 2A */	fadds f1, f2, f7
/* 800E4720 000E0640  D0 43 04 40 */	stfs f2, 0x440(r3)
/* 800E4724 000E0644  EC 00 01 72 */	fmuls f0, f0, f5
/* 800E4728 000E0648  EF AA 02 F2 */	fmuls f29, f10, f11
/* 800E472C 000E064C  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800E4730 000E0650  EF 69 40 2A */	fadds f27, f9, f8
/* 800E4734 000E0654  D0 63 04 44 */	stfs f3, 0x444(r3)
/* 800E4738 000E0658  EF 49 08 2A */	fadds f26, f9, f1
/* 800E473C 000E065C  EF 9E 00 28 */	fsubs f28, f30, f0
/* 800E4740 000E0660  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800E4744 000E0664  D0 83 04 48 */	stfs f4, 0x448(r3)
/* 800E4748 000E0668  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800E474C 000E066C  D0 A3 04 4C */	stfs f5, 0x44c(r3)
/* 800E4750 000E0670  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800E4754 000E0674  D0 C3 04 50 */	stfs f6, 0x450(r3)
/* 800E4758 000E0678  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800E475C 000E067C  88 03 04 54 */	lbz r0, 0x454(r3)
/* 800E4760 000E0680  28 00 00 00 */	cmplwi r0, 0
/* 800E4764 000E0684  41 82 00 10 */	beq lbl_800E4774
/* 800E4768 000E0688  FC 20 28 90 */	fmr f1, f5
/* 800E476C 000E068C  C0 43 04 58 */	lfs f2, 0x458(r3)
/* 800E4770 000E0690  4B FF FA 29 */	bl __GXSetRange
lbl_800E4774:
/* 800E4774 000E0694  38 00 00 10 */	li r0, 0x10
/* 800E4778 000E0698  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800E477C 000E069C  3C A0 CC 01 */	lis r5, 0xCC008000@ha
/* 800E4780 000E06A0  3C 80 00 05 */	lis r4, 0x0005101A@ha
/* 800E4784 000E06A4  98 05 80 00 */	stb r0, 0xCC008000@l(r5)
/* 800E4788 000E06A8  38 04 10 1A */	addi r0, r4, 0x0005101A@l
/* 800E478C 000E06AC  90 05 80 00 */	stw r0, -0x8000(r5)
/* 800E4790 000E06B0  38 00 00 00 */	li r0, 0
/* 800E4794 000E06B4  D3 E5 80 00 */	stfs f31, -0x8000(r5)
/* 800E4798 000E06B8  D3 A5 80 00 */	stfs f29, -0x8000(r5)
/* 800E479C 000E06BC  D3 85 80 00 */	stfs f28, -0x8000(r5)
/* 800E47A0 000E06C0  D3 65 80 00 */	stfs f27, -0x8000(r5)
/* 800E47A4 000E06C4  D3 45 80 00 */	stfs f26, -0x8000(r5)
/* 800E47A8 000E06C8  D3 C5 80 00 */	stfs f30, -0x8000(r5)
/* 800E47AC 000E06CC  B0 03 00 02 */	sth r0, 2(r3)
/* 800E47B0 000E06D0  80 01 00 64 */	lwz r0, 0x64(r1)
/* 800E47B4 000E06D4  CB E1 00 58 */	lfd f31, 0x58(r1)
/* 800E47B8 000E06D8  CB C1 00 50 */	lfd f30, 0x50(r1)
/* 800E47BC 000E06DC  7C 08 03 A6 */	mtlr r0
/* 800E47C0 000E06E0  CB A1 00 48 */	lfd f29, 0x48(r1)
/* 800E47C4 000E06E4  CB 81 00 40 */	lfd f28, 0x40(r1)
/* 800E47C8 000E06E8  CB 61 00 38 */	lfd f27, 0x38(r1)
/* 800E47CC 000E06EC  CB 41 00 30 */	lfd f26, 0x30(r1)
/* 800E47D0 000E06F0  38 21 00 60 */	addi r1, r1, 0x60
/* 800E47D4 000E06F4  4E 80 00 20 */	blr

.global GXSetViewport
GXSetViewport:
/* 800E47D8 000E06F8  7C 08 02 A6 */	mflr r0
/* 800E47DC 000E06FC  90 01 00 04 */	stw r0, 4(r1)
/* 800E47E0 000E0700  94 21 FF F8 */	stwu r1, -8(r1)
/* 800E47E4 000E0704  38 60 00 01 */	li r3, 1
/* 800E47E8 000E0708  4B FF FE D5 */	bl GXSetViewportJitter
/* 800E47EC 000E070C  80 01 00 0C */	lwz r0, 0xc(r1)
/* 800E47F0 000E0710  38 21 00 08 */	addi r1, r1, 8
/* 800E47F4 000E0714  7C 08 03 A6 */	mtlr r0
/* 800E47F8 000E0718  4E 80 00 20 */	blr

.global GXSetScissor
GXSetScissor:
/* 800E47FC 000E071C  80 ED 97 C8 */	lwz r7, gx-_SDA_BASE_(r13)
/* 800E4800 000E0720  39 03 01 54 */	addi r8, r3, 0x154
/* 800E4804 000E0724  38 05 FF FF */	addi r0, r5, -1
/* 800E4808 000E0728  38 A7 00 F8 */	addi r5, r7, 0xf8
/* 800E480C 000E072C  80 65 00 00 */	lwz r3, 0(r5)
/* 800E4810 000E0730  7C 08 02 14 */	add r0, r8, r0
/* 800E4814 000E0734  38 84 01 54 */	addi r4, r4, 0x154
/* 800E4818 000E0738  54 63 00 28 */	rlwinm r3, r3, 0, 0, 0x14
/* 800E481C 000E073C  7C 63 23 78 */	or r3, r3, r4
/* 800E4820 000E0740  90 65 00 00 */	stw r3, 0(r5)
/* 800E4824 000E0744  38 66 FF FF */	addi r3, r6, -1
/* 800E4828 000E0748  55 07 60 26 */	slwi r7, r8, 0xc
/* 800E482C 000E074C  80 AD 97 C8 */	lwz r5, gx-_SDA_BASE_(r13)
/* 800E4830 000E0750  7C 84 1A 14 */	add r4, r4, r3
/* 800E4834 000E0754  54 03 60 26 */	slwi r3, r0, 0xc
/* 800E4838 000E0758  39 05 00 F8 */	addi r8, r5, 0xf8
/* 800E483C 000E075C  80 08 00 00 */	lwz r0, 0(r8)
/* 800E4840 000E0760  38 C0 00 61 */	li r6, 0x61
/* 800E4844 000E0764  3C A0 CC 01 */	lis r5, 0xCC008000@ha
/* 800E4848 000E0768  54 00 05 10 */	rlwinm r0, r0, 0, 0x14, 8
/* 800E484C 000E076C  7C 00 3B 78 */	or r0, r0, r7
/* 800E4850 000E0770  90 08 00 00 */	stw r0, 0(r8)
/* 800E4854 000E0774  38 00 00 01 */	li r0, 1
/* 800E4858 000E0778  80 ED 97 C8 */	lwz r7, gx-_SDA_BASE_(r13)
/* 800E485C 000E077C  39 07 00 FC */	addi r8, r7, 0xfc
/* 800E4860 000E0780  80 E8 00 00 */	lwz r7, 0(r8)
/* 800E4864 000E0784  54 E7 00 28 */	rlwinm r7, r7, 0, 0, 0x14
/* 800E4868 000E0788  7C E4 23 78 */	or r4, r7, r4
/* 800E486C 000E078C  90 88 00 00 */	stw r4, 0(r8)
/* 800E4870 000E0790  80 8D 97 C8 */	lwz r4, gx-_SDA_BASE_(r13)
/* 800E4874 000E0794  38 E4 00 FC */	addi r7, r4, 0xfc
/* 800E4878 000E0798  80 87 00 00 */	lwz r4, 0(r7)
/* 800E487C 000E079C  54 84 05 10 */	rlwinm r4, r4, 0, 0x14, 8
/* 800E4880 000E07A0  7C 83 1B 78 */	or r3, r4, r3
/* 800E4884 000E07A4  90 67 00 00 */	stw r3, 0(r7)
/* 800E4888 000E07A8  98 C5 80 00 */	stb r6, 0xCC008000@l(r5)
/* 800E488C 000E07AC  80 8D 97 C8 */	lwz r4, gx-_SDA_BASE_(r13)
/* 800E4890 000E07B0  80 64 00 F8 */	lwz r3, 0xf8(r4)
/* 800E4894 000E07B4  90 65 80 00 */	stw r3, -0x8000(r5)
/* 800E4898 000E07B8  98 C5 80 00 */	stb r6, -0x8000(r5)
/* 800E489C 000E07BC  80 64 00 FC */	lwz r3, 0xfc(r4)
/* 800E48A0 000E07C0  90 65 80 00 */	stw r3, -0x8000(r5)
/* 800E48A4 000E07C4  B0 04 00 02 */	sth r0, 2(r4)
/* 800E48A8 000E07C8  4E 80 00 20 */	blr

.global GXSetScissorBoxOffset
GXSetScissorBoxOffset:
/* 800E48AC 000E07CC  38 A3 01 54 */	addi r5, r3, 0x154
/* 800E48B0 000E07D0  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800E48B4 000E07D4  38 04 01 54 */	addi r0, r4, 0x154
/* 800E48B8 000E07D8  54 A4 F8 7E */	srwi r4, r5, 1
/* 800E48BC 000E07DC  54 00 F8 7E */	srwi r0, r0, 1
/* 800E48C0 000E07E0  54 84 05 96 */	rlwinm r4, r4, 0, 0x16, 0xb
/* 800E48C4 000E07E4  54 00 50 2A */	slwi r0, r0, 0xa
/* 800E48C8 000E07E8  7C 80 03 78 */	or r0, r4, r0
/* 800E48CC 000E07EC  54 05 02 3E */	clrlwi r5, r0, 8
/* 800E48D0 000E07F0  38 00 00 61 */	li r0, 0x61
/* 800E48D4 000E07F4  3C 80 CC 01 */	lis r4, 0xCC008000@ha
/* 800E48D8 000E07F8  98 04 80 00 */	stb r0, 0xCC008000@l(r4)
/* 800E48DC 000E07FC  64 A5 59 00 */	oris r5, r5, 0x5900
/* 800E48E0 000E0800  38 00 00 01 */	li r0, 1
/* 800E48E4 000E0804  90 A4 80 00 */	stw r5, -0x8000(r4)
/* 800E48E8 000E0808  B0 03 00 02 */	sth r0, 2(r3)
/* 800E48EC 000E080C  4E 80 00 20 */	blr

.global GXSetClipMode
GXSetClipMode:
/* 800E48F0 000E0810  38 00 00 10 */	li r0, 0x10
/* 800E48F4 000E0814  80 8D 97 C8 */	lwz r4, gx-_SDA_BASE_(r13)
/* 800E48F8 000E0818  3C C0 CC 01 */	lis r6, 0xCC008000@ha
/* 800E48FC 000E081C  98 06 80 00 */	stb r0, 0xCC008000@l(r6)
/* 800E4900 000E0820  38 A0 10 05 */	li r5, 0x1005
/* 800E4904 000E0824  38 00 00 00 */	li r0, 0
/* 800E4908 000E0828  90 A6 80 00 */	stw r5, -0x8000(r6)
/* 800E490C 000E082C  90 66 80 00 */	stw r3, -0x8000(r6)
/* 800E4910 000E0830  B0 04 00 02 */	sth r0, 2(r4)
/* 800E4914 000E0834  4E 80 00 20 */	blr

.global __GXSetMatrixIndex
__GXSetMatrixIndex:
/* 800E4918 000E0838  2C 03 00 05 */	cmpwi r3, 5
/* 800E491C 000E083C  40 80 00 3C */	bge lbl_800E4958
/* 800E4920 000E0840  38 00 00 08 */	li r0, 8
/* 800E4924 000E0844  80 8D 97 C8 */	lwz r4, gx-_SDA_BASE_(r13)
/* 800E4928 000E0848  3C A0 CC 01 */	lis r5, 0xCC008000@ha
/* 800E492C 000E084C  98 05 80 00 */	stb r0, 0xCC008000@l(r5)
/* 800E4930 000E0850  38 00 00 30 */	li r0, 0x30
/* 800E4934 000E0854  38 60 00 10 */	li r3, 0x10
/* 800E4938 000E0858  98 05 80 00 */	stb r0, -0x8000(r5)
/* 800E493C 000E085C  38 00 10 18 */	li r0, 0x1018
/* 800E4940 000E0860  80 84 00 80 */	lwz r4, 0x80(r4)
/* 800E4944 000E0864  90 85 80 00 */	stw r4, -0x8000(r5)
/* 800E4948 000E0868  98 65 80 00 */	stb r3, -0x8000(r5)
/* 800E494C 000E086C  90 05 80 00 */	stw r0, -0x8000(r5)
/* 800E4950 000E0870  90 85 80 00 */	stw r4, -0x8000(r5)
/* 800E4954 000E0874  48 00 00 38 */	b lbl_800E498C
lbl_800E4958:
/* 800E4958 000E0878  38 00 00 08 */	li r0, 8
/* 800E495C 000E087C  80 8D 97 C8 */	lwz r4, gx-_SDA_BASE_(r13)
/* 800E4960 000E0880  3C A0 CC 01 */	lis r5, 0xCC008000@ha
/* 800E4964 000E0884  98 05 80 00 */	stb r0, 0xCC008000@l(r5)
/* 800E4968 000E0888  38 00 00 40 */	li r0, 0x40
/* 800E496C 000E088C  38 60 00 10 */	li r3, 0x10
/* 800E4970 000E0890  98 05 80 00 */	stb r0, -0x8000(r5)
/* 800E4974 000E0894  38 00 10 19 */	li r0, 0x1019
/* 800E4978 000E0898  80 84 00 84 */	lwz r4, 0x84(r4)
/* 800E497C 000E089C  90 85 80 00 */	stw r4, -0x8000(r5)
/* 800E4980 000E08A0  98 65 80 00 */	stb r3, -0x8000(r5)
/* 800E4984 000E08A4  90 05 80 00 */	stw r0, -0x8000(r5)
/* 800E4988 000E08A8  90 85 80 00 */	stw r4, -0x8000(r5)
lbl_800E498C:
/* 800E498C 000E08AC  80 6D 97 C8 */	lwz r3, gx-_SDA_BASE_(r13)
/* 800E4990 000E08B0  38 00 00 00 */	li r0, 0
/* 800E4994 000E08B4  B0 03 00 02 */	sth r0, 2(r3)
/* 800E4998 000E08B8  4E 80 00 20 */	blr
