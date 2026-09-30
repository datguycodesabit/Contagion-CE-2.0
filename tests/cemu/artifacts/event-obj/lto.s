	.section	.text,"ax",@progbits
	.assume	ADL = 1
	.file	"llvm-link"
	.section	.text._ClampProbability,"ax",@progbits
	.globl	_ClampProbability               ; -- Begin function ClampProbability
	.type	_ClampProbability,@function
_ClampProbability:                      ; @ClampProbability
; %bb.0:
	call	__frameset0
	ld	hl, (ix + 6)
	ld	e, (ix + 9)
	ld	bc, 10000
	xor	a, a
	call	__lcmpzero
	jp	m, .LBB0_2
; %bb.1:
	ld	d, 0
	jr	.LBB0_3
	.local	.LBB0_2
.LBB0_2:
	ld	d, 1
	.local	.LBB0_3
.LBB0_3:
	call	__lcmpu
	jr	c, .LBB0_5
; %bb.4:
	push	bc
	pop	hl
	.local	.LBB0_5
.LBB0_5:
	bit	0, d
	jr	z, .LBB0_7
; %bb.6:
	ld.sis	hl, 0
	.local	.LBB0_7
.LBB0_7:
                                        ; kill: def $hl killed $hl killed $uhl
	pop	ix
	ret
	.local	.Lfunc_end0
.Lfunc_end0:
	.size	_ClampProbability, .Lfunc_end0-_ClampProbability
                                        ; -- End function
	.section	.text._LandCount,"ax",@progbits
	.globl	_LandCount                      ; -- Begin function LandCount
	.type	_LandCount,@function
_LandCount:                             ; @LandCount
; %bb.0:
	call	__frameset0
	ld	de, (ix + 6)
	ld	hl, (ix + 8)
	add.sis	hl, de
	ld	de, (ix + 10)
	add.sis	hl, de
                                        ; kill: def $hl killed $hl killed $uhl
	pop	ix
	ret
	.local	.Lfunc_end1
.Lfunc_end1:
	.size	_LandCount, .Lfunc_end1-_LandCount
                                        ; -- End function
	.section	.text._Percentage,"ax",@progbits
	.globl	_Percentage                     ; -- Begin function Percentage
	.type	_Percentage,@function
_Percentage:                            ; @Percentage
; %bb.0:
	call	__frameset0
	ld	de, (ix + 9)
	sbc.sis	hl, hl
	adc.sis	hl, de
	jr	nz, .LBB2_2
; %bb.1:
	ld	l, 0
	jr	.LBB2_3
	.local	.LBB2_2
.LBB2_2:
	ld	hl, (ix + 6)
	ld	bc, 100
	push	de
	pop	iy
	ld	de, 0
	ld	e, l
	ld	d, h
	push	de
	pop	hl
	call	__imulu
	ld	e, iyl
	ld	d, iyh
	push	de
	pop	bc
	call	__idivu
	.local	.LBB2_3
.LBB2_3:
	ld	a, l
	pop	ix
	ret
	.local	.Lfunc_end2
.Lfunc_end2:
	.size	_Percentage, .Lfunc_end2-_Percentage
                                        ; -- End function
	.section	.text._Roll,"ax",@progbits
	.globl	_Roll                           ; -- Begin function Roll
	.type	_Roll,@function
_Roll:                                  ; @Roll
; %bb.0:
	call	__frameset0
	ld	bc, (ix + 9)
	sbc.sis	hl, hl
	adc.sis	hl, bc
	jr	nz, .LBB3_2
; %bb.1:
	xor	a, a
	jp	.LBB3_5
	.local	.LBB3_2
.LBB3_2:
	ld.sis	de, 10000
	ld	l, c
	ld	h, b
	or	a, a
	sbc.sis	hl, de
	jr	c, .LBB3_4
; %bb.3:
	ld	a, 1
	jp	.LBB3_5
	.local	.LBB3_4
.LBB3_4:
	ld	hl, (ix + 6)
	ld	de, 10000
	push	de
	call	__indcallhl
	pop	de
	ld	de, (ix + 9)
	or	a, a
	sbc.sis	hl, de
                                        ; kill: def $a killed $a
	sbc	a, a
	.local	.LBB3_5
.LBB3_5:
	pop	ix
	ret
	.local	.Lfunc_end3
.Lfunc_end3:
	.size	_Roll, .Lfunc_end3-_Roll
                                        ; -- End function
	.section	.text._Owns,"ax",@progbits
	.globl	_Owns                           ; -- Begin function Owns
	.type	_Owns,@function
_Owns:                                  ; @Owns
; %bb.0:
	ld	hl, -3
	call	__frameset
	ld	a, (ix + 9)
	ld	d, 0
	cp	a, 39
	jr	nc, .LBB4_4
; %bb.1:
	ld	iy, (ix + 6)
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	c, 5
	call	__ishru
	add	hl, hl
	add	hl, hl
	push	hl
	pop	bc
	add	iy, bc
	ld	hl, (iy)
	ld	(ix - 3), hl
	ld	e, (iy + 3)
	ld	l, 31
	and	a, l
	ld	l, a
	ld	bc, 1
	ld	a, d
	call	__lshl
	ld	hl, (ix - 3)
	call	__land
	call	__lcmpzero
	jr	nz, .LBB4_3
; %bb.2:
	ld	d, 0
	jr	.LBB4_4
	.local	.LBB4_3
.LBB4_3:
	ld	d, -1
	.local	.LBB4_4
.LBB4_4:
	ld	a, d
	pop	hl
	pop	ix
	ret
	.local	.Lfunc_end4
.Lfunc_end4:
	.size	_Owns, .Lfunc_end4-_Owns
                                        ; -- End function
	.section	.text._Eligible,"ax",@progbits
	.globl	_Eligible                       ; -- Begin function Eligible
	.type	_Eligible,@function
_Eligible:                              ; @Eligible
; %bb.0:
	ld	hl, -6
	call	__frameset
	ld	a, (ix + 9)
	ld	e, 0
	cp	a, 39
	jp	nc, .LBB5_12
; %bb.1:
	ld	de, (ix + 6)
	ld	l, a
	push	hl
	push	de
	call	_Owns
	pop	hl
	pop	hl
	bit	0, a
	jr	z, .LBB5_3
	.local	.LBB5_2
.LBB5_2:
	ld	e, 0
	jr	.LBB5_12
	.local	.LBB5_3
.LBB5_3:                                ; %.preheader.preheader
	ld	bc, 22
	ld	iy, _traits
	or	a, a
	sbc	hl, hl
	ld	(ix - 3), hl
	ld	e, 1
	ld	l, (ix + 9)
	call	__imulu
	push	hl
	pop	bc
	add	iy, bc
	.local	.LBB5_4
.LBB5_4:                                ; %.preheader
                                        ; =>This Inner Loop Header: Depth=1
	ld	bc, 2
	ld	hl, (ix - 3)
	or	a, a
	sbc	hl, bc
	jr	z, .LBB5_8
; %bb.5:                                ;   in Loop: Header=BB5_4 Depth=1
	ld	(ix - 6), iy
	ld	de, (ix - 3)
	add	iy, de
	ld	a, (iy + 6)
	cp	a, -1
	jr	z, .LBB5_7
; %bb.6:                                ;   in Loop: Header=BB5_4 Depth=1
	ld	l, a
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_Owns
	pop	hl
	pop	hl
	bit	0, a
	jr	z, .LBB5_2
	.local	.LBB5_7
.LBB5_7:                                ;   in Loop: Header=BB5_4 Depth=1
	ld	hl, (ix - 3)
	inc	hl
	ld	(ix - 3), hl
	ld	e, 1
	ld	iy, (ix - 6)
	jr	.LBB5_4
	.local	.LBB5_8
.LBB5_8:
	ld	a, (ix + 9)
	cp	a, 37
	ld	l, 0
	jr	c, .LBB5_12
; %bb.9:
	ld	iy, (ix + 6)
	ld	a, (iy + 35)
	or	a, a
	ld	e, l
	jr	z, .LBB5_12
; %bb.10:
	ld	hl, (iy + 22)
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	jr	z, .LBB5_2
; %bb.11:
	ld	e, -1
	.local	.LBB5_12
.LBB5_12:                               ; %.loopexit
	ld	a, e
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end5
.Lfunc_end5:
	.size	_Eligible, .Lfunc_end5-_Eligible
                                        ; -- End function
	.section	.text._Purchase,"ax",@progbits
	.globl	_Purchase                       ; -- Begin function Purchase
	.type	_Purchase,@function
_Purchase:                              ; @Purchase
; %bb.0:
	ld	hl, -6
	call	__frameset
	ld	iy, (ix + 6)
	ld	l, 0
	ld	a, (iy + 33)
	or	a, a
	jp	z, .LBB6_11
; %bb.1:
	ld	a, (iy + 34)
	or	a, a
	jp	nz, .LBB6_11
; %bb.2:
	ld	l, (ix + 9)
	push	hl
	push	iy
	call	_Eligible
	pop	hl
	pop	hl
	bit	0, a
	jp	z, .LBB6_10
; %bb.3:
	ld	iy, (ix + 6)
	ld	hl, (iy + 20)
	ld	(ix - 3), hl
	ld	de, 0
	ld	e, (ix + 9)
	ld	bc, 22
	push	de
	pop	hl
	call	__imulu
	push	hl
	pop	bc
	ld	iy, _traits
	add	iy, bc
	ld	c, (iy + 8)
	ld	iy, (ix - 3)
	ld	b, d
	ex	de, hl
	ld	e, iyl
	ld	d, iyh
	ex	de, hl
	or	a, a
	sbc.sis	hl, bc
	ld	l, b
	jp	c, .LBB6_11
; %bb.4:
	ld	(ix - 6), de
	ex	de, hl
	ld	e, iyl
	ld	d, iyh
	ex	de, hl
	or	a, a
	sbc.sis	hl, bc
	ld	iy, (ix + 6)
	ld	(iy + 20), l
	ld	(iy + 21), h
	ld	l, (ix + 9)
	push	hl
	push	iy
	call	_SetOwned
	pop	hl
	pop	hl
	ld	a, (ix + 9)
	cp	a, 37
	jp	c, .LBB6_9
; %bb.5:
	ld	de, -37
	ld	iy, _reshuffle_reductions
	ld	hl, (ix - 6)
	add	hl, de
	add	hl, hl
	ex	de, hl
	add	iy, de
	ld	de, (iy)
	ld	iy, (ix + 6)
	ld	bc, (iy + 22)
	or	a, a
	ld	l, c
	ld	h, b
	ld	(ix - 3), de
	sbc.sis	hl, de
	ld.sis	de, 0
	jr	c, .LBB6_7
; %bb.6:
	ex.sis	de, hl
	.local	.LBB6_7
.LBB6_7:
	ld	(iy + 22), e
	ld	(iy + 23), d
	ld	hl, (ix - 3)
                                        ; kill: def $hl killed $hl killed $uhl
	or	a, a
	sbc.sis	hl, bc
	jr	c, .LBB6_9
; %bb.8:
	ld.sis	hl, 0
	ld	(iy + 24), l
	ld	(iy + 25), h
	.local	.LBB6_9
.LBB6_9:
	ld	l, 1
	jr	.LBB6_11
	.local	.LBB6_10
.LBB6_10:
	ld	l, 0
	.local	.LBB6_11
.LBB6_11:
	ld	a, l
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end6
.Lfunc_end6:
	.size	_Purchase, .Lfunc_end6-_Purchase
                                        ; -- End function
	.section	.text._SetOwned,"ax",@progbits
	.type	_SetOwned,@function             ; -- Begin function SetOwned
_SetOwned:                              ; @SetOwned
; %bb.0:
	ld	hl, -6
	call	__frameset
	ld	iy, (ix + 6)
	ld	a, (ix + 9)
	ld	bc, 1
	ld	h, b
	ld	de, 0
	ld	e, a
	ld	l, 31
	and	a, l
	ld	l, a
	ld	a, h
	call	__lshl
	ld	(ix - 3), bc
	ld	c, 5
	ex	de, hl
	call	__ishru
	add	hl, hl
	add	hl, hl
	ex	de, hl
	add	iy, de
	ld	hl, (iy)
	ld	(ix - 6), iy
	lea	iy, iy + 3
	ld	e, (iy)
	ld	bc, (ix - 3)
	call	__lor
	ld	iy, (ix - 6)
	ld	(iy), hl
	ld	(iy + 3), e
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end7
.Lfunc_end7:
	.size	_SetOwned, .Lfunc_end7-_SetOwned
                                        ; -- End function
	.section	.text._DevolveCost,"ax",@progbits
	.globl	_DevolveCost                    ; -- Begin function DevolveCost
	.type	_DevolveCost,@function
_DevolveCost:                           ; @DevolveCost
; %bb.0:
	call	__frameset0
	ld	iy, (ix + 6)
	ld	a, (iy + 32)
	cp	a, 1
	jr	z, .LBB8_2
; %bb.1:
	ld	a, 4
	jr	.LBB8_3
	.local	.LBB8_2
.LBB8_2:
	ld	a, 7
	.local	.LBB8_3
.LBB8_3:
	pop	ix
	ret
	.local	.Lfunc_end8
.Lfunc_end8:
	.size	_DevolveCost, .Lfunc_end8-_DevolveCost
                                        ; -- End function
	.section	.text._CanDevolve,"ax",@progbits
	.globl	_CanDevolve                     ; -- Begin function CanDevolve
	.type	_CanDevolve,@function
_CanDevolve:                            ; @CanDevolve
; %bb.0:
	ld	hl, -7
	call	__frameset
	ld	e, (ix + 9)
	ld	l, -29
	ld	d, 0
	ld	a, e
	add	a, l
	ld	l, a
	cp	a, -12
	jr	c, .LBB9_10
; %bb.1:
	ld	bc, (ix + 6)
	ld	l, e
	push	hl
	push	bc
	call	_Owns
	ld	d, 0
	pop	hl
	pop	hl
	bit	0, a
	jr	z, .LBB9_10
; %bb.2:                                ; %.preheader.preheader
	or	a, a
	sbc	hl, hl
	ld	iyl, 0
	.local	.LBB9_3
.LBB9_3:                                ; %.preheader
                                        ; =>This Inner Loop Header: Depth=1
	ld	bc, 858
	ld	d, -1
	ld	a, 0
	ld	(ix - 3), hl
	or	a, a
	sbc	hl, bc
	jr	z, .LBB9_5
; %bb.4:                                ; %.preheader
                                        ;   in Loop: Header=BB9_3 Depth=1
	ld	d, a
	.local	.LBB9_5
.LBB9_5:                                ; %.preheader
                                        ;   in Loop: Header=BB9_3 Depth=1
	bit	0, d
	jr	nz, .LBB9_10
; %bb.6:                                ;   in Loop: Header=BB9_3 Depth=1
	push	iy
	ld	hl, (ix + 6)
	push	hl
	ld	(ix - 4), d                     ; 1-byte Folded Spill
	ld	(ix - 7), iy
	call	_Owns
	ld	iy, (ix - 7)
	ld	de, 22
	push	de
	pop	bc
	ld	d, (ix - 4)                     ; 1-byte Folded Reload
	pop	hl
	pop	hl
	bit	0, a
	jr	z, .LBB9_9
; %bb.7:                                ;   in Loop: Header=BB9_3 Depth=1
	lea	hl, iy + 0
	ld	iy, _traits
	ld	bc, (ix - 3)
	add	iy, bc
	ld	a, (iy + 6)
	ld	b, (ix + 9)
	cp	a, b
	jr	z, .LBB9_10
; %bb.8:                                ;   in Loop: Header=BB9_3 Depth=1
	ld	a, (iy + 7)
	cp	a, b
	push	hl
	pop	iy
	ld	bc, 22
	jr	z, .LBB9_10
	.local	.LBB9_9
.LBB9_9:                                ;   in Loop: Header=BB9_3 Depth=1
	inc	iyl
	ld	hl, (ix - 3)
	add	hl, bc
	jr	.LBB9_3
	.local	.LBB9_10
.LBB9_10:                               ; %.loopexit
	ld	a, d
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end9
.Lfunc_end9:
	.size	_CanDevolve, .Lfunc_end9-_CanDevolve
                                        ; -- End function
	.section	.text._Devolve,"ax",@progbits
	.globl	_Devolve                        ; -- Begin function Devolve
	.type	_Devolve,@function
_Devolve:                               ; @Devolve
; %bb.0:
	ld	hl, -6
	call	__frameset
	ld	iy, (ix + 6)
	ld	d, 0
	ld	a, (iy + 33)
	or	a, a
	jp	z, .LBB10_9
; %bb.1:
	ld	a, (iy + 34)
	or	a, a
	jp	nz, .LBB10_9
; %bb.2:
	ld	l, (ix + 9)
	push	hl
	push	iy
	call	_CanDevolve
	pop	hl
	pop	hl
	bit	0, a
	jr	z, .LBB10_7
; %bb.3:
	ld	iy, (ix + 6)
	ld	de, (iy + 20)
	ld	a, (iy + 32)
	cp	a, 1
	jr	z, .LBB10_5
; %bb.4:
	ld.sis	bc, 4
	jr	.LBB10_6
	.local	.LBB10_5
.LBB10_5:
	ld.sis	bc, 7
	.local	.LBB10_6
.LBB10_6:
	ld	l, e
	ld	h, d
	or	a, a
	sbc.sis	hl, bc
	jr	nc, .LBB10_8
	.local	.LBB10_7
.LBB10_7:
	ld	d, 0
	jp	.LBB10_9
	.local	.LBB10_8
.LBB10_8:
	ex	de, hl
	ld	d, 1
                                        ; kill: def $hl killed $hl killed $uhl
	or	a, a
	sbc.sis	hl, bc
	ld	(iy + 20), l
	ld	(iy + 21), h
	or	a, a
	sbc	hl, hl
	ld	a, (ix + 9)
	ld	l, a
	ld	(ix - 6), hl
	ld	l, 31
	and	a, l
	ld	l, a
	ld	bc, 1
	xor	a, a
	call	__lshl
	push	bc
	pop	hl
	ld	e, a
	call	__lnot
	ld	(ix - 3), hl
	ld	a, e
	ld	c, 5
	ld	hl, (ix - 6)
	call	__ishru
	add	hl, hl
	add	hl, hl
	push	hl
	pop	bc
	add	iy, bc
	ld	hl, (iy)
	ld	(ix - 6), iy
	lea	iy, iy + 3
	ld	e, (iy)
	ld	bc, (ix - 3)
	call	__land
	ld	iy, (ix - 6)
	ld	(iy), hl
	ld	(iy + 3), e
	.local	.LBB10_9
.LBB10_9:
	ld	a, d
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end10
.Lfunc_end10:
	.size	_Devolve, .Lfunc_end10-_Devolve
                                        ; -- End function
	.section	.text._ResetDisease,"ax",@progbits
	.globl	_ResetDisease                   ; -- Begin function ResetDisease
	.type	_ResetDisease,@function
_ResetDisease:                          ; @ResetDisease
; %bb.0:
	call	__frameset0
	ld	hl, (ix + 6)
	ld	(hl), 0
	push	hl
	pop	iy
	inc	iy
	ld	bc, 57
	lea	de, iy + 0
	push	hl
	pop	iy
	ldir
	ld.sis	hl, 12
	ld	(iy + 20), l
	ld	(iy + 21), h
	lea	de, iy + 37
	ld	hl, _.str.61.724
	ld	bc, 9
	ldir
	pop	ix
	ret
	.local	.Lfunc_end11
.Lfunc_end11:
	.size	_ResetDisease, .Lfunc_end11-_ResetDisease
                                        ; -- End function
	.section	.text._TransmissionContribution,"ax",@progbits
	.globl	_TransmissionContribution       ; -- Begin function TransmissionContribution
	.type	_TransmissionContribution,@function
_TransmissionContribution:              ; @TransmissionContribution
; %bb.0:
	ld	hl, -5
	call	__frameset
	ld	c, (ix + 9)
	ld.sis	hl, 0
	ld	a, c
	cp	a, 7
	jp	nc, .LBB12_11
; %bb.1:
	ld	a, (ix + 12)
	ld	iy, _environments
	or	a, a
	sbc	hl, hl
	ld	l, c
	ld	bc, 7
	call	__imulu
	ex	de, hl
	add	iy, de
	ld	(ix - 3), iy
	cp	a, 13
	jr	c, .LBB12_3
; %bb.2:
	ld.sis	hl, 0
	jp	.LBB12_11
	.local	.LBB12_3
.LBB12_3:
	ld.sis	bc, 220
	ld	de, 0
	ld	e, a
	ld	hl, JTI12_0
	add	hl, de
	add	hl, de
	add	hl, de
	ld	iy, (hl)
	ld.sis	hl, 0
	jp	(iy)
	.local	.LBB12_4
.LBB12_4:
	ld	iy, (ix - 3)
	ld	a, (iy + 3)
	ld	h, 0
	ld	l, a
	ld	(ix - 5), l
	ld	(ix - 4), h
	call	__smulu
	ld	(ix - 3), l
	ld	(ix - 2), h
	or	a, a
	sbc	hl, hl
	jp	.LBB12_9
	.local	.LBB12_5
.LBB12_5:
	ld	iy, (ix - 3)
	ld	a, (iy + 4)
	ld	h, 0
	ld	l, a
	ld	(ix - 5), l
	ld	(ix - 4), h
	ld.sis	bc, 280
	call	__smulu
	ld	(ix - 3), l
	ld	(ix - 2), h
	ld	hl, 6
	jr	.LBB12_9
	.local	.LBB12_6
.LBB12_6:
	ld	iy, (ix - 3)
	ld	a, (iy + 2)
	ld	h, 0
	ld	l, a
	ld	(ix - 5), l
	ld	(ix - 4), h
	call	__smulu
	ld	(ix - 3), l
	ld	(ix - 2), h
	ld	hl, 2
	jr	.LBB12_9
	.local	.LBB12_7
.LBB12_7:
	ld	iy, (ix - 3)
	ld	a, (iy + 5)
	ld	h, 0
	ld	l, a
	ld	(ix - 5), l
	ld	(ix - 4), h
	ld.sis	bc, 280
	call	__smulu
	ld	(ix - 3), l
	ld	(ix - 2), h
	ld	hl, 4
	jr	.LBB12_9
	.local	.LBB12_8
.LBB12_8:
	ld	hl, (ix - 3)
	ld	a, (hl)
	ld	h, 0
	ld	l, a
	ld	(ix - 5), l
	ld	(ix - 4), h
	ld.sis	bc, 280
	call	__smulu
	ld	(ix - 3), l
	ld	(ix - 2), h
	ld	hl, 8
	.local	.LBB12_9
.LBB12_9:
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_Level
	ld	c, (ix - 5)
	ld	b, (ix - 4)
	ld	c, a
	pop	hl
	pop	hl
	ld	l, (ix - 3)
	ld	h, (ix - 2)
	.local	.LBB12_10
.LBB12_10:
	call	__smulu
	.local	.LBB12_11
.LBB12_11:
	ld	sp, ix
	pop	ix
	ret
	.local	.LBB12_12
.LBB12_12:
	ld	hl, 12
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_Level
	ld	e, a
	pop	hl
	pop	hl
	ld	d, 0
	ld	iy, (ix - 3)
	ld	c, (iy + 6)
	ld	b, d
	ld.sis	hl, 4
	or	a, a
	sbc.sis	hl, bc
	ld.sis	bc, 100
	call	__smulu
	ld.sis	bc, 50
	add.sis	hl, bc
	ld	c, e
	ld	b, d
	jr	.LBB12_10
	.local	.Lfunc_end12
.Lfunc_end12:
	.size	_TransmissionContribution, .Lfunc_end12-_TransmissionContribution
	.section	.rodata._TransmissionContribution,"a",@progbits
JTI12_0:
	d24	.LBB12_4
	d24	.LBB12_11
	d24	.LBB12_6
	d24	.LBB12_11
	d24	.LBB12_7
	d24	.LBB12_11
	d24	.LBB12_5
	d24	.LBB12_11
	d24	.LBB12_8
	d24	.LBB12_11
	d24	.LBB12_11
	d24	.LBB12_11
	d24	.LBB12_12
                                        ; -- End function
	.section	.text._Level,"ax",@progbits
	.type	_Level,@function                ; -- Begin function Level
_Level:                                 ; @Level
; %bb.0:
	ld	hl, -1
	call	__frameset
	ld	de, (ix + 6)
	ld	l, (ix + 9)
	push	hl
	push	de
	call	_Owns
	pop	hl
	pop	hl
	ld	l, 1
	and	a, l
	ld	l, a
	ld	(ix - 1), l
	ld	a, (ix + 9)
	inc	a
	ld	l, a
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_Owns
	pop	hl
	pop	hl
	ld	l, 1
	and	a, l
	ld	l, a
	ld	e, (ix - 1)
	ld	a, l
	add	a, e
	ld	l, a
	inc	sp
	pop	ix
	ret
	.local	.Lfunc_end13
.Lfunc_end13:
	.size	_Level, .Lfunc_end13-_Level
                                        ; -- End function
	.section	.text._CalculateEffects,"ax",@progbits
	.globl	_CalculateEffects               ; -- Begin function CalculateEffects
	.type	_CalculateEffects,@function
_CalculateEffects:                      ; @CalculateEffects
; %bb.0:
	ld	hl, -73
	call	__frameset
	ld	hl, (ix + 9)
	ld.sis	de, 800
	ld	(ix - 23), e
	ld	(ix - 22), d
	ld	e, 45
	ld	(ix - 28), e
	ld	(ix - 27), d
	ld.sis	de, 12
	ld	(ix - 18), e
	ld	(ix - 17), d
	ld	de, _environments+6
	ld	(ix - 26), de
	ld	(hl), 0
	push	hl
	pop	iy
	inc	iy
	ld	bc, 27
	lea	de, iy + 0
	ldir
	ld.sis	bc, 0
	or	a, a
	sbc	hl, hl
	ld	d, b
	ld	iyl, d
	ld	de, 858
	ld	(ix - 20), c
	ld	(ix - 19), b
	.local	.LBB14_1
.LBB14_1:                               ; =>This Inner Loop Header: Depth=1
	ld	(ix - 16), hl
	or	a, a
	sbc	hl, de
	jr	z, .LBB14_6
; %bb.2:                                ;   in Loop: Header=BB14_1 Depth=1
	ld	(ix - 31), c
	ld	(ix - 30), b
	ld	(ix - 34), iy
	push	iy
	ld	hl, (ix + 6)
	push	hl
	call	_Owns
	pop	hl
	pop	hl
	bit	0, a
	jr	z, .LBB14_4
; %bb.3:                                ;   in Loop: Header=BB14_1 Depth=1
	ld	iy, _traits
	ld	de, (ix - 16)
	add	iy, de
	ld	e, (iy + 10)
	ld	d, 0
	ld	l, (ix - 18)
	ld	h, (ix - 17)
	add.sis	hl, de
	ld	(ix - 18), l
	ld	(ix - 17), h
	ld	e, (iy + 11)
	ld	l, (ix - 20)
	ld	h, (ix - 19)
	add.sis	hl, de
	ld	(ix - 20), l
	ld	(ix - 19), h
	ld	e, (iy + 12)
	ld	l, (ix - 31)
	ld	h, (ix - 30)
	add.sis	hl, de
	ld	c, l
	ld	b, h
	jr	.LBB14_5
	.local	.LBB14_4
.LBB14_4:                               ;   in Loop: Header=BB14_1 Depth=1
	ld	c, (ix - 31)
	ld	b, (ix - 30)
	.local	.LBB14_5
.LBB14_5:                               ;   in Loop: Header=BB14_1 Depth=1
	ld	hl, (ix - 16)
	ld	iy, (ix - 34)
	inc	iyl
	ld	de, 22
	add	hl, de
	ld	de, 858
	jr	.LBB14_1
	.local	.LBB14_6
.LBB14_6:
	ld	hl, (ix + 9)
	push	hl
	pop	iy
	ld	l, (ix - 18)
	ld	h, (ix - 17)
	ld	(iy + 14), l
	ld	(iy + 15), h
	ld	l, (ix - 20)
	ld	h, (ix - 19)
	ld	(iy + 16), l
	ld	(iy + 17), h
	ld	(iy + 18), c
	ld	(iy + 19), b
	ld	hl, 35
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_Level
	ld	e, 30
	ld	d, a
	pop	hl
	pop	hl
	mlt	de
	ld	h, 0
	ld	l, e
	ld	(ix - 16), l
	ld	(ix - 15), h
	ld	iy, (ix + 9)
	ld	(iy + 20), l
	ld	(iy + 21), h
	or	a, a
	sbc	hl, hl
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_Level
	ld	l, a
	pop	de
	pop	de
	ld	e, (ix - 16)
	ld	d, (ix - 15)
	ld	h, d
	ld.sis	bc, 1200
	call	__smulu
	ld	(ix - 20), l
	ld	(ix - 19), h
	ld	iy, (ix + 6)
	ld	hl, (iy)
	ld	e, (iy + 3)
	ld	(ix - 31), hl
	ld	(ix - 35), e                    ; 1-byte Folded Spill
	ld	bc, 16384
	push	hl
	ld	l, (ix - 16)
	ld	h, (ix - 15)
	ex	(sp), hl
	pop	iy
	ld	a, iyh
	call	__land
	ld	a, h
	or	a, a
	sbc	hl, hl
	ld	l, h
	ld	(ix - 36), a                    ; 1-byte Folded Spill
	ld	(ix - 34), l                    ; 1-byte Folded Spill
	cp	a, l
	jr	z, .LBB14_8
; %bb.7:
	ld.sis	hl, 1800
	ld	(ix - 23), l
	ld	(ix - 22), h
	.local	.LBB14_8
.LBB14_8:
	ld	l, (ix - 23)
	ld	h, (ix - 22)
	ld	e, (ix - 20)
	ld	d, (ix - 19)
	add.sis	hl, de
	ld	(ix - 39), l
	ld	(ix - 38), h
	ld	iy, (ix + 9)
	ld	(iy + 22), l
	ld	(iy + 23), h
	ld	hl, 2
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_Level
	ld	l, a
	pop	de
	pop	de
	ld	h, 0
	ld	(ix - 20), l
	ld	(ix - 19), h
	ld.sis	bc, 1200
	call	__smulu
	ld	e, (ix - 23)
	ld	d, (ix - 22)
	add.sis	hl, de
	ld	iy, (ix + 9)
	ld	(iy + 24), l
	ld	(iy + 25), h
	ld	iy, (ix + 6)
	ld	a, (iy + 32)
	cp	a, 2
	jr	nz, .LBB14_10
; %bb.9:
	ld	e, (ix - 39)
	ld	d, (ix - 38)
	srl	d
	rr	e
	ld	iy, (ix + 9)
	ld	(iy + 22), e
	ld	(iy + 23), d
	srl	h
	rr	l
	ld	(iy + 24), l
	ld	(iy + 25), h
	.local	.LBB14_10
.LBB14_10:
	ld	hl, 10
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_Level
	ld	l, a
	pop	de
	pop	de
	or	a, a
	jr	nz, .LBB14_12
; %bb.11:
	ld	hl, (ix - 31)
	ld	e, (ix - 35)                    ; 1-byte Folded Reload
	ld	bc, 65536
	push	hl
	ld	l, (ix - 16)
	ld	h, (ix - 15)
	ex	(sp), hl
	pop	iy
	ld	a, iyh
	call	__land
	ld	(ix - 39), hl
	ld	(ix - 40), e                    ; 1-byte Folded Spill
	ld.sis	hl, 0
	jr	.LBB14_15
	.local	.LBB14_12
.LBB14_12:
	ld	e, (ix - 20)
	ld	d, (ix - 19)
	ld	h, d
	ld.sis	bc, 100
	call	__smulu
	ld	(ix - 23), l
	ld	(ix - 22), h
	ld	hl, (ix - 31)
	ld	e, (ix - 35)                    ; 1-byte Folded Reload
	ld	bc, 65536
	push	hl
	ld	l, (ix - 16)
	ld	h, (ix - 15)
	ex	(sp), hl
	pop	iy
	ld	a, iyh
	call	__land
	push	hl
	pop	bc
	ld	a, e
	ld	l, 16
	ld	(ix - 39), bc
	ld	(ix - 40), a                    ; 1-byte Folded Spill
	call	__lshru
	bit	0, c
	ld.sis	de, 0
	jr	z, .LBB14_14
; %bb.13:
	ld.sis	de, 200
	.local	.LBB14_14
.LBB14_14:
	ld	l, (ix - 23)
	ld	h, (ix - 22)
	add.sis	hl, de
	.local	.LBB14_15
.LBB14_15:
	ld	iy, (ix + 9)
	ld	(iy + 26), l
	ld	(iy + 27), h
	ld	l, (ix - 20)
	ld	h, (ix - 19)
	ld	(ix - 13), h
	ld	hl, (ix - 15)
	ld	e, (ix - 18)
	ld	d, (ix - 17)
	ld	h, d
	ld	l, e
	ld	de, 0
	ld	(ix - 18), e                    ; 1-byte Folded Spill
	ld	bc, 100
	push	hl
	ld	l, (ix - 16)
	ld	h, (ix - 15)
	ex	(sp), hl
	pop	iy
	ld	a, iyh
	call	__lmulu
	ld	(ix - 43), hl
	ld	(ix - 44), e                    ; 1-byte Folded Spill
	ld	hl, (ix - 31)
	ld	e, (ix - 35)                    ; 1-byte Folded Reload
	ld	bc, 32768
	call	__land
	ld	de, 14
	ld	a, h
	ld	(ix - 35), a
	ex	de, hl
	ld	e, iyh
	ex	de, hl
	ld	(ix - 23), hl
	ld	bc, 0
	.local	.LBB14_16
.LBB14_16:                              ; =>This Inner Loop Header: Depth=1
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	jp	z, .LBB14_38
; %bb.17:                               ;   in Loop: Header=BB14_16 Depth=1
	ld	(ix - 47), bc
	ld	a, (ix - 36)                    ; 1-byte Folded Reload
	ld	l, (ix - 34)
	cp	a, l
	ld	a, -1
	jr	z, .LBB14_19
; %bb.18:                               ;   in Loop: Header=BB14_16 Depth=1
	ld	a, 0
	.local	.LBB14_19
.LBB14_19:                              ;   in Loop: Header=BB14_16 Depth=1
	ld	(ix - 49), a
	ld	iy, (ix - 26)
	ld	a, (iy - 6)
	ld	e, (ix - 20)
	ld	d, (ix - 19)
	ld	(ix - 12), d
	ld	hl, (ix - 14)
	ld	h, d
	ld	l, a
	ld	e, (ix - 18)                    ; 1-byte Folded Reload
	ld	bc, 100
	push	hl
	ld	l, (ix - 16)
	ld	h, (ix - 15)
	ex	(sp), hl
	pop	iy
	ld	a, iyh
	call	__lmulu
	ld	(ix - 31), hl
	ld	(ix - 48), e                    ; 1-byte Folded Spill
	ld	hl, 29
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_Level
	ld	e, (ix - 28)
	ld	d, (ix - 27)
	ld	d, a
	ld	(ix - 28), e
	ld	(ix - 27), d
	pop	hl
	pop	hl
	ex.sis	de, hl
	mlt	hl
	ld	de, 0
	ld	e, l
	ld	hl, 100
	or	a, a
	sbc	hl, de
	push	hl
	pop	bc
	ld	hl, (ix - 31)
	ld	e, (ix - 48)                    ; 1-byte Folded Reload
	ld	a, (ix - 18)                    ; 1-byte Folded Reload
	call	__lmulu
	ld	bc, 100
	push	hl
	ld	l, (ix - 16)
	ld	h, (ix - 15)
	ex	(sp), hl
	pop	iy
	ld	a, iyh
	call	__ldivu
	ld	(ix - 31), hl
	ld	(ix - 50), e                    ; 1-byte Folded Spill
	ld	iy, (ix - 26)
	ld	a, (iy - 5)
	ld	e, (ix - 20)
	ld	d, (ix - 19)
	ld	(ix - 11), d
	ld	hl, (ix - 13)
	ld	h, d
	ld	(ix - 48), a                    ; 1-byte Folded Spill
	ld	l, a
	ld	e, (ix - 18)                    ; 1-byte Folded Reload
	ld	bc, 180
	push	hl
	ld	l, (ix - 16)
	ld	h, (ix - 15)
	ex	(sp), hl
	pop	iy
	ld	a, iyh
	call	__lmulu
	ld	(ix - 53), hl
	ld	(ix - 54), e                    ; 1-byte Folded Spill
	ld	hl, 31
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_Level
	ld	h, a
	pop	de
	pop	de
	ld	e, (ix - 28)
	ld	d, (ix - 27)
	ld	l, e
	mlt	hl
	ld	de, 0
	ld	e, l
	ld	hl, 100
	or	a, a
	sbc	hl, de
	push	hl
	pop	bc
	ld	hl, (ix - 53)
	ld	e, (ix - 54)                    ; 1-byte Folded Reload
	ld	a, (ix - 18)                    ; 1-byte Folded Reload
	call	__lmulu
	ld	bc, 100
	push	hl
	ld	l, (ix - 16)
	ld	h, (ix - 15)
	ex	(sp), hl
	pop	iy
	ld	a, iyh
	call	__ldivu
	ld	(ix - 53), hl
	ld	(ix - 54), e                    ; 1-byte Folded Spill
	ld	hl, (ix - 26)
	ld	a, (hl)
	ld	e, (ix - 20)
	ld	d, (ix - 19)
	ld	(ix - 10), d
	ld	hl, (ix - 12)
	ld	h, d
	ld	l, a
	ld	e, (ix - 18)                    ; 1-byte Folded Reload
	push	hl
	ld	l, (ix - 16)
	ld	h, (ix - 15)
	ex	(sp), hl
	pop	iy
	ld	a, iyh
	call	__lmulu
	ld	(ix - 57), hl
	ld	(ix - 58), e                    ; 1-byte Folded Spill
	ld	hl, 33
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_Level
	ld	h, a
	pop	de
	pop	de
	ld	e, (ix - 28)
	ld	d, (ix - 27)
	ld	l, e
	mlt	hl
	ld	de, 0
	ld	e, l
	ld	hl, 100
	or	a, a
	sbc	hl, de
	push	hl
	pop	bc
	ld	hl, (ix - 57)
	ld	e, (ix - 58)                    ; 1-byte Folded Reload
	ld	a, (ix - 18)                    ; 1-byte Folded Reload
	call	__lmulu
	ld	bc, 100
	push	hl
	ld	l, (ix - 16)
	ld	h, (ix - 15)
	ex	(sp), hl
	pop	iy
	ld	a, iyh
	call	__ldivu
	ld	(ix - 57), hl
	ld	(ix - 58), e                    ; 1-byte Folded Spill
	or	a, a
	sbc	hl, hl
	push	hl
	ld	hl, (ix - 23)
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_TransmissionContribution
	pop	de
	pop	de
	pop	de
	ld	e, (ix - 20)
	ld	d, (ix - 19)
	ld	(ix - 9), d
	ld	de, (ix - 11)
	ld	d, h
	ld	e, l
	ld	(ix - 61), de
	ld	hl, 2
	push	hl
	ld	hl, (ix - 23)
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_TransmissionContribution
	pop	de
	pop	de
	pop	de
	ld	e, (ix - 20)
	ld	d, (ix - 19)
	ld	(ix - 8), d
	ld	de, (ix - 10)
	ld	d, h
	ld	e, l
	ld	(ix - 67), de
	ld	hl, 4
	push	hl
	ld	hl, (ix - 23)
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_TransmissionContribution
	pop	de
	pop	de
	pop	de
	ld	e, (ix - 20)
	ld	d, (ix - 19)
	ld	(ix - 7), d
	ld	de, (ix - 9)
	ld	d, h
	ld	e, l
	ld	(ix - 64), de
	ld	hl, 6
	push	hl
	ld	hl, (ix - 23)
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_TransmissionContribution
	pop	de
	pop	de
	pop	de
	ld	e, (ix - 20)
	ld	d, (ix - 19)
	ld	(ix - 6), d
	ld	de, (ix - 8)
	ld	d, h
	ld	e, l
	ld	(ix - 73), de
	ld	hl, 8
	push	hl
	ld	hl, (ix - 23)
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_TransmissionContribution
	pop	de
	pop	de
	pop	de
	ld	e, (ix - 20)
	ld	d, (ix - 19)
	ld	(ix - 5), d
	ld	de, (ix - 7)
	ld	d, h
	ld	e, l
	ld	(ix - 70), de
	ld	hl, 12
	push	hl
	ld	hl, (ix - 23)
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_TransmissionContribution
	pop	de
	pop	de
	pop	de
	ld	e, (ix - 20)
	ld	d, (ix - 19)
	ld	(ix - 4), d
	ld	iy, (ix - 6)
	ex	de, hl
	ld	iyh, d
	ld	iyl, e
	ex	de, hl
	ld	hl, (ix - 43)
	ld	e, (ix - 44)                    ; 1-byte Folded Reload
	ld	bc, (ix - 31)
	ld	a, (ix - 50)                    ; 1-byte Folded Reload
	call	__lsub
	ld	bc, (ix - 61)
	ld	a, (ix - 18)                    ; 1-byte Folded Reload
	call	__ladd
	ld	bc, (ix - 67)
	ld	a, (ix - 18)                    ; 1-byte Folded Reload
	call	__ladd
	ld	bc, (ix - 53)
	ld	a, (ix - 54)                    ; 1-byte Folded Reload
	call	__lsub
	ld	bc, (ix - 64)
	ld	a, (ix - 18)                    ; 1-byte Folded Reload
	call	__ladd
	ld	bc, (ix - 73)
	ld	a, (ix - 18)                    ; 1-byte Folded Reload
	call	__ladd
	ld	bc, (ix - 57)
	ld	a, (ix - 58)                    ; 1-byte Folded Reload
	call	__lsub
	ld	bc, (ix - 70)
	ld	a, (ix - 18)                    ; 1-byte Folded Reload
	call	__ladd
	lea	bc, iy + 0
	push	hl
	ld	l, (ix - 16)
	ld	h, (ix - 15)
	ex	(sp), hl
	pop	iy
	ld	a, (ix - 18)                    ; 1-byte Folded Reload
	call	__ladd
	ld	d, e
	ld	(ix - 31), hl
	ld	bc, 300
	ld	a, iyh
	call	__ladd
	ld	a, (ix - 49)                    ; 1-byte Folded Reload
	bit	0, a
	jr	nz, .LBB14_21
; %bb.20:                               ;   in Loop: Header=BB14_16 Depth=1
	ld	(ix - 31), hl
	.local	.LBB14_21
.LBB14_21:                              ;   in Loop: Header=BB14_16 Depth=1
	bit	0, a
	jr	nz, .LBB14_23
; %bb.22:                               ;   in Loop: Header=BB14_16 Depth=1
	ld	d, e
	.local	.LBB14_23
.LBB14_23:                              ;   in Loop: Header=BB14_16 Depth=1
	ld	a, (ix - 35)                    ; 1-byte Folded Reload
	ld	l, (ix - 34)
	cp	a, l
	jr	z, .LBB14_25
; %bb.24:                               ;   in Loop: Header=BB14_16 Depth=1
	ld	iy, (ix - 26)
	ld	a, (iy - 2)
	or	a, a
	sbc	hl, hl
	push	hl
	pop	bc
	ld	l, a
	ld	a, (iy - 1)
	ld	c, a
	add	hl, bc
	push	hl
	pop	bc
	ld	hl, 8
	or	a, a
	sbc	hl, bc
	ld	bc, 100
	call	__imulu
	push	hl
	pop	iy
	ld	bc, 600
	add	iy, bc
	ld	(ix - 3), iy
	ld	a, (ix - 1)
	rlc	a
	sbc	a, a
	ld	hl, (ix - 31)
	ld	e, d
	lea	bc, iy + 0
	push	hl
	ld	l, (ix - 16)
	ld	h, (ix - 15)
	ex	(sp), hl
	pop	iy
	call	__ladd
	ld	(ix - 31), hl
	ld	d, e
	.local	.LBB14_25
.LBB14_25:                              ;   in Loop: Header=BB14_16 Depth=1
	ld	bc, (ix - 39)
	ld	a, (ix - 40)                    ; 1-byte Folded Reload
	ld	l, 16
	call	__lshru
	ld	l, 1
	ld	a, c
	xor	a, l
	ld	e, a
	or	a, a
	sbc	hl, hl
	ld	l, (ix - 48)                    ; 1-byte Folded Reload
	ld	bc, 280
	call	__imulu
	bit	0, e
	ld	bc, 0
	jr	nz, .LBB14_27
; %bb.26:                               ;   in Loop: Header=BB14_16 Depth=1
	push	hl
	pop	bc
	.local	.LBB14_27
.LBB14_27:                              ;   in Loop: Header=BB14_16 Depth=1
	bit	0, e
	ld	a, iyh
	jr	nz, .LBB14_29
; %bb.28:                               ;   in Loop: Header=BB14_16 Depth=1
	ld	a, (ix - 18)                    ; 1-byte Folded Reload
	.local	.LBB14_29
.LBB14_29:                              ;   in Loop: Header=BB14_16 Depth=1
	ld	hl, (ix - 31)
	ld	e, d
	call	__ladd
	push	hl
	pop	bc
	ld	a, e
	ld	hl, 100
	ld	e, iyh
	push	bc
	pop	iy
	call	__lcmps
	call	pe, __setflag
	ld	l, 1
	ld	c, l
	jp	m, .LBB14_31
; %bb.30:                               ;   in Loop: Header=BB14_16 Depth=1
	ld	l, 0
	ld	c, l
	.local	.LBB14_31
.LBB14_31:                              ;   in Loop: Header=BB14_16 Depth=1
	bit	0, c
	jr	nz, .LBB14_33
; %bb.32:                               ;   in Loop: Header=BB14_16 Depth=1
	ld	iy, 100
	.local	.LBB14_33
.LBB14_33:                              ;   in Loop: Header=BB14_16 Depth=1
	bit	0, c
	jr	nz, .LBB14_35
; %bb.34:                               ;   in Loop: Header=BB14_16 Depth=1
	ld	e, (ix - 16)
	ld	d, (ix - 15)
	ld	a, d
	.local	.LBB14_35
.LBB14_35:                              ;   in Loop: Header=BB14_16 Depth=1
	lea	hl, iy + 0
	ld	e, a
	ld	(ix - 31), iy
	ld	bc, 10000
	push	hl
	ld	l, (ix - 16)
	ld	h, (ix - 15)
	ex	(sp), hl
	pop	iy
	ld	a, iyh
	call	__lcmpu
	ld	hl, (ix - 31)
	jr	c, .LBB14_37
; %bb.36:                               ;   in Loop: Header=BB14_16 Depth=1
	ld	hl, 10000
	.local	.LBB14_37
.LBB14_37:                              ;   in Loop: Header=BB14_16 Depth=1
	ld	iy, (ix + 9)
	ld	de, (ix - 47)
	add	iy, de
	ld	(iy), l
	ld	(iy + 1), h
	ex	de, hl
	ld	de, 2
	add	hl, de
	ld	de, (ix - 23)
	inc	e
	ld	(ix - 23), de
	ld	iy, (ix - 26)
	lea	iy, iy + 7
	ld	(ix - 26), iy
	push	hl
	pop	bc
	push	hl
	ld	l, (ix - 16)
	ld	h, (ix - 15)
	ex	(sp), hl
	pop	iy
	ld	de, 14
	jp	.LBB14_16
	.local	.LBB14_38
.LBB14_38:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end14
.Lfunc_end14:
	.size	_CalculateEffects, .Lfunc_end14-_CalculateEffects
                                        ; -- End function
	.section	.text._Mutate,"ax",@progbits
	.globl	_Mutate                         ; -- Begin function Mutate
	.type	_Mutate,@function
_Mutate:                                ; @Mutate
; %bb.0:
	ld	hl, -7
	call	__frameset
	ld	iy, (ix + 6)
	ld	d, -1
	ld	a, (iy + 32)
	cp	a, 1
	jp	nz, .LBB15_16
; %bb.1:
	ld	a, (iy + 33)
	or	a, a
	jp	z, .LBB15_16
; %bb.2:
	ld	a, (iy + 34)
	or	a, a
	jp	nz, .LBB15_16
; %bb.3:
	xor	a, a
	ld	bc, 1
	ld	hl, (iy + 8)
	ld	e, (iy + 11)
	call	__ladd
	ld	bc, 12
	ld	(ix - 1), a                     ; 1-byte Folded Spill
	call	__lremu
	call	__lcmpzero
	jp	nz, .LBB15_16
; %bb.4:
	ld	iy, (ix + 9)
	ld	hl, 10000
	push	hl
	call	__indcall
	pop	de
	ld.sis	de, 1500
	or	a, a
	sbc.sis	hl, de
	jr	nc, .LBB15_13
; %bb.5:                                ; %.preheader.preheader
	ld	c, 17
	ld	d, -1
	ld	iyl, d
	ld	hl, (ix + 6)
	.local	.LBB15_6
.LBB15_6:                               ; %.preheader
                                        ; =>This Inner Loop Header: Depth=1
	ld	a, c
	cp	a, 29
	jr	z, .LBB15_14
; %bb.7:                                ;   in Loop: Header=BB15_6 Depth=1
	ld	(ix - 4), iy
	push	bc
	push	hl
	ld	(ix - 7), bc
	call	_Eligible
	pop	hl
	pop	hl
	bit	0, a
	jr	z, .LBB15_11
; %bb.8:                                ;   in Loop: Header=BB15_6 Depth=1
	ld	a, (ix - 1)                     ; 1-byte Folded Reload
	inc	a
	or	a, a
	sbc	hl, hl
	ld	(ix - 1), a                     ; 1-byte Folded Spill
	ld	l, a
	push	hl
	ld	hl, (ix + 9)
	call	__indcallhl
	pop	de
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	ld	bc, (ix - 7)
	ld	a, c
	jr	z, .LBB15_10
; %bb.9:                                ;   in Loop: Header=BB15_6 Depth=1
	ld	hl, (ix - 4)
	ld	a, l
	.local	.LBB15_10
.LBB15_10:                              ;   in Loop: Header=BB15_6 Depth=1
	ld	iyl, a
	ld	d, -1
	ld	hl, (ix + 6)
	jr	.LBB15_12
	.local	.LBB15_11
.LBB15_11:                              ;   in Loop: Header=BB15_6 Depth=1
	ld	d, -1
	ld	hl, (ix + 6)
	ld	iy, (ix - 4)
	ld	bc, (ix - 7)
	.local	.LBB15_12
.LBB15_12:                              ;   in Loop: Header=BB15_6 Depth=1
	inc	c
	jr	.LBB15_6
	.local	.LBB15_13
.LBB15_13:
	ld	d, -1
	jr	.LBB15_16
	.local	.LBB15_14
.LBB15_14:
	ld	a, iyl
	cp	a, -1
	jr	z, .LBB15_16
; %bb.15:
	push	iy
	push	hl
	ld	(ix - 4), iy
	call	_SetOwned
	pop	hl
	pop	hl
	ld	hl, (ix - 4)
	ld	d, l
	.local	.LBB15_16
.LBB15_16:
	ld	a, d
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end15
.Lfunc_end15:
	.size	_Mutate, .Lfunc_end15-_Mutate
                                        ; -- End function
	.section	.text._AwardDNA,"ax",@progbits
	.globl	_AwardDNA                       ; -- Begin function AwardDNA
	.type	_AwardDNA,@function
_AwardDNA:                              ; @AwardDNA
; %bb.0:
	ld	hl, -20
	call	__frameset
	ld	iy, (ix + 6)
	ld	bc, 0
	ld	hl, (ix + 12)
	ld	(ix - 16), hl
                                        ; kill: def $hl killed $hl killed $uhl
	ld	(ix - 7), l
	ld	(ix - 6), h
	ld	hl, (ix + 14)
	ld	(ix - 10), hl
	ld	a, (iy + 30)
	ld	(ix - 13), a
	.local	.LBB16_1
.LBB16_1:                               ; =>This Inner Loop Header: Depth=1
	ld	de, 7
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	jp	z, .LBB16_8
; %bb.2:                                ;   in Loop: Header=BB16_1 Depth=1
	ld	hl, 1
	call	__ishl
	ld	e, (ix - 13)
	ld	a, l
	and	a, e
	ld	e, a
	or	a, a
	jp	z, .LBB16_7
; %bb.3:                                ;   in Loop: Header=BB16_1 Depth=1
	ld	iy, (ix + 6)
	ld	d, (iy + 29)
	ld	a, l
	and	a, d
	ld	e, a
	or	a, a
	jp	nz, .LBB16_7
; %bb.4:                                ;   in Loop: Header=BB16_1 Depth=1
                                        ; kill: def $l killed $l killed $uhl
	ld	a, d
	or	a, l
	ld	l, a
	ld	de, (ix + 6)
	push	de
	pop	iy
	ld	(iy + 29), l
	ld	hl, (iy + 20)
	ex	de, hl
	ld	iyl, e
	ld	iyh, d
	ex	de, hl
	ld.sis	de, 5
	add.sis	iy, de
                                        ; kill: def $hl killed $hl killed $uhl
	ld.sis	de, 175
	or	a, a
	sbc.sis	hl, de
	ld.sis	hl, 179
	jr	nc, .LBB16_6
; %bb.5:                                ;   in Loop: Header=BB16_1 Depth=1
	ex	de, hl
	ld	e, iyl
	ld	d, iyh
	ex	de, hl
	.local	.LBB16_6
.LBB16_6:                               ;   in Loop: Header=BB16_1 Depth=1
	ld	iy, (ix + 6)
	ld	(iy + 20), l
	ld	(iy + 21), h
	.local	.LBB16_7
.LBB16_7:                               ;   in Loop: Header=BB16_1 Depth=1
	inc	bc
	jp	.LBB16_1
	.local	.LBB16_8
.LBB16_8:
	ld	l, (ix - 7)
	ld	h, (ix - 6)
	ld	de, (ix + 10)
	add.sis	hl, de
	ld	de, (ix - 10)
	add.sis	hl, de
	ld	(ix - 7), l
	ld	(ix - 6), h
	ld	iy, (ix + 6)
	ld	hl, (iy + 26)
	ld	(ix - 13), hl
	or	a, a
	sbc	hl, hl
	push	hl
	pop	bc
	ld	de, (ix - 16)
	ld	c, e
	ld	b, d
	ld	de, (ix - 10)
	ld	l, e
	ld	h, d
	add	hl, bc
	ld	bc, 100
	call	__imulu
	ld	(ix - 19), hl
	ld	de, 9
	ld	bc, 0
	.local	.LBB16_9
.LBB16_9:                               ; =>This Inner Loop Header: Depth=1
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	jp	z, .LBB16_17
; %bb.10:                               ;   in Loop: Header=BB16_9 Depth=1
	ld	de, 0
	ld	hl, (ix - 13)
	ld	e, l
	ld	d, h
	ld	hl, 1
	ld	(ix - 16), bc
                                        ; kill: def $c killed $c killed $ubc
	call	__ishl
	push	hl
	pop	iy
	push	de
	pop	bc
	call	__iand
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jp	nz, .LBB16_16
; %bb.11:                               ;   in Loop: Header=BB16_9 Depth=1
	ld	e, (ix - 7)
	ld	d, (ix - 6)
	sbc.sis	hl, hl
	adc.sis	hl, de
	jp	z, .LBB16_16
; %bb.12:                               ;   in Loop: Header=BB16_9 Depth=1
	xor	a, a
	ld	(ix - 5), a
	ld	bc, (ix - 7)
	ld	b, d
	ld	c, e
	sbc	hl, hl
	ld	a, l
	ld	hl, _TickerObserve.affected
	ld	de, (ix - 16)
	add	hl, de
	ld	e, (hl)
	ld	d, 0
	ld	(ix - 4), d
	ld	hl, (ix - 6)
	ld	h, d
	ld	l, e
	ld	e, a
	call	__lmulu
	push	hl
	pop	bc
	ld	d, e
	ld	hl, (ix - 19)
	ld	e, a
	ld	a, d
	call	__lcmpu
	jp	c, .LBB16_16
; %bb.13:                               ;   in Loop: Header=BB16_9 Depth=1
	ld	hl, (ix - 13)
                                        ; kill: def $hl killed $hl killed $uhl
	ld	c, iyl
	ld	b, iyh
	call	__sor
	ld	e, l
	ld	d, h
	ld	hl, (ix + 6)
	push	hl
	pop	iy
	ld	(ix - 13), de
	ld	(iy + 26), e
	ld	(iy + 27), d
	ld	hl, (iy + 20)
	ex	de, hl
	ld	iyl, e
	ld	iyh, d
	ex	de, hl
	ld.sis	de, 8
	add.sis	iy, de
                                        ; kill: def $hl killed $hl killed $uhl
	ld.sis	de, 172
	or	a, a
	sbc.sis	hl, de
	ld.sis	hl, 179
	jr	nc, .LBB16_15
; %bb.14:                               ;   in Loop: Header=BB16_9 Depth=1
	ex	de, hl
	ld	e, iyl
	ld	d, iyh
	ex	de, hl
	.local	.LBB16_15
.LBB16_15:                              ;   in Loop: Header=BB16_9 Depth=1
	ld	iy, (ix + 6)
	ld	(iy + 20), l
	ld	(iy + 21), h
	.local	.LBB16_16
.LBB16_16:                              ;   in Loop: Header=BB16_9 Depth=1
	ld	de, 9
	ld	bc, (ix - 16)
	inc	bc
	jp	.LBB16_9
	.local	.LBB16_17
.LBB16_17:
	ld	iy, (ix + 6)
	ld	a, (iy + 28)
	ld	(ix - 13), a
	xor	a, a
	ld	(ix - 3), a
	ld	hl, (ix - 5)
	ld	de, (ix - 10)
	ld	h, d
	ld	l, e
	ld	de, 0
	ld	(ix - 16), e                    ; 1-byte Folded Spill
	ld	bc, 100
	call	__lmulu
	ld	(ix - 19), hl
	ld	(ix - 20), e                    ; 1-byte Folded Spill
	ld	de, 6
	ld	bc, 0
	.local	.LBB16_18
.LBB16_18:                              ; =>This Inner Loop Header: Depth=1
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	jp	z, .LBB16_28
; %bb.19:                               ;   in Loop: Header=BB16_18 Depth=1
	ld	hl, 1
	ld	(ix - 10), bc
                                        ; kill: def $c killed $c killed $ubc
	call	__ishl
	push	hl
	pop	iy
	ld	l, (ix - 13)
	ld	a, iyl
	and	a, l
	ld	l, a
	or	a, a
	jp	nz, .LBB16_26
; %bb.20:                               ;   in Loop: Header=BB16_18 Depth=1
	ld	e, (ix - 7)
	ld	d, (ix - 6)
	sbc.sis	hl, hl
	adc.sis	hl, de
	jp	z, .LBB16_25
; %bb.21:                               ;   in Loop: Header=BB16_18 Depth=1
	xor	a, a
	ld	(ix - 2), a
	ld	bc, (ix - 4)
	ld	b, d
	ld	c, e
	ld	hl, _TickerObserve.deaths
	ld	de, (ix - 10)
	add	hl, de
	ld	a, (hl)
	ld	e, 0
	ld	(ix - 1), e
	ld	hl, (ix - 3)
	ld	h, e
	ld	l, a
	ld	a, (ix - 16)                    ; 1-byte Folded Reload
	ld	e, a
	call	__lmulu
	push	hl
	pop	bc
	ld	a, e
	ld	hl, (ix - 19)
	ld	e, (ix - 20)                    ; 1-byte Folded Reload
	call	__lcmpu
	jp	c, .LBB16_25
; %bb.22:                               ;   in Loop: Header=BB16_18 Depth=1
	ex	de, hl
	ld	e, iyl
	ex	de, hl
	ld	e, (ix - 13)                    ; 1-byte Folded Reload
	ld	a, e
	or	a, l
	ld	e, a
	ld	hl, (ix + 6)
	push	hl
	pop	iy
	ld	(ix - 13), e                    ; 1-byte Folded Spill
	ld	(iy + 28), e
	ld	hl, (iy + 20)
	ex	de, hl
	ld	iyl, e
	ld	iyh, d
	ex	de, hl
	ld.sis	de, 10
	add.sis	iy, de
                                        ; kill: def $hl killed $hl killed $uhl
	ld.sis	de, 170
	or	a, a
	sbc.sis	hl, de
	ld.sis	hl, 179
	jr	nc, .LBB16_24
; %bb.23:                               ;   in Loop: Header=BB16_18 Depth=1
	ex	de, hl
	ld	e, iyl
	ld	d, iyh
	ex	de, hl
	.local	.LBB16_24
.LBB16_24:                              ;   in Loop: Header=BB16_18 Depth=1
	ld	iy, (ix + 6)
	ld	(iy + 20), l
	ld	(iy + 21), h
	.local	.LBB16_25
.LBB16_25:                              ;   in Loop: Header=BB16_18 Depth=1
	ld	bc, (ix - 10)
	ld	de, 6
	jr	.LBB16_27
	.local	.LBB16_26
.LBB16_26:                              ;   in Loop: Header=BB16_18 Depth=1
	ld	bc, (ix - 10)
	.local	.LBB16_27
.LBB16_27:                              ;   in Loop: Header=BB16_18 Depth=1
	inc	bc
	jp	.LBB16_18
	.local	.LBB16_28
.LBB16_28:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end16
.Lfunc_end16:
	.size	_AwardDNA, .Lfunc_end16-_AwardDNA
                                        ; -- End function
	.section	.text._EvaluateOutcome,"ax",@progbits
	.globl	_EvaluateOutcome                ; -- Begin function EvaluateOutcome
	.type	_EvaluateOutcome,@function
_EvaluateOutcome:                       ; @EvaluateOutcome
; %bb.0:
	ld	hl, -3
	call	__frameset
	ld	iy, (ix + 6)
	ld	a, (iy + 33)
	or	a, a
	jp	z, .LBB17_11
; %bb.1:
	ld	a, (iy + 34)
	or	a, a
	jp	nz, .LBB17_11
; %bb.2:
	ld	de, (ix + 10)
	ld	hl, (ix + 12)
	ld	(ix - 3), hl
                                        ; kill: def $hl killed $hl killed $uhl
	add.sis	hl, de
	ld	c, l
	ld	b, h
	ld	hl, (ix + 14)
                                        ; kill: def $hl killed $hl killed $uhl
	call	__sneg
	ex.sis	de, hl
	ld	l, c
	ld	h, b
	or	a, a
	sbc.sis	hl, de
	jp	z, .LBB17_11
; %bb.3:
	ld	de, (ix - 3)
	ld	l, e
	ld	h, d
	ld	bc, (ix + 10)
                                        ; kill: def $bc killed $bc killed $ubc
	call	__sor
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	jr	nz, .LBB17_5
; %bb.4:
	ld	a, 1
	jp	.LBB17_10
	.local	.LBB17_5
.LBB17_5:
	ld	hl, (ix + 10)
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	jr	z, .LBB17_8
; %bb.6:
	sbc.sis	hl, hl
	adc.sis	hl, de
	jr	nz, .LBB17_8
; %bb.7:
	ld	a, 2
	jp	.LBB17_10
	.local	.LBB17_8
.LBB17_8:
	ld	hl, (iy + 22)
	ld.sis	de, 10000
                                        ; kill: def $hl killed $hl killed $uhl
	or	a, a
	sbc.sis	hl, de
	jr	c, .LBB17_11
; %bb.9:
	ld	a, 3
	.local	.LBB17_10
.LBB17_10:
	ld	(iy + 34), a
	.local	.LBB17_11
.LBB17_11:
	pop	hl
	pop	ix
	ret
	.local	.Lfunc_end17
.Lfunc_end17:
	.size	_EvaluateOutcome, .Lfunc_end17-_EvaluateOutcome
                                        ; -- End function
	.section	.text._AdvanceDisease,"ax",@progbits
	.globl	_AdvanceDisease                 ; -- Begin function AdvanceDisease
	.type	_AdvanceDisease,@function
_AdvanceDisease:                        ; @AdvanceDisease
; %bb.0:
	call	__frameset0
	ld	iy, (ix + 6)
	ld	de, (ix + 9)
	ld	bc, (ix + 12)
	ld	hl, 100
	push	hl
	push	hl
	push	bc
	push	de
	push	iy
	call	_AdvanceDiseaseEvents
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end18
.Lfunc_end18:
	.size	_AdvanceDisease, .Lfunc_end18-_AdvanceDisease
                                        ; -- End function
	.section	.text._AdvanceDiseaseEvents,"ax",@progbits
	.globl	_AdvanceDiseaseEvents           ; -- Begin function AdvanceDiseaseEvents
	.type	_AdvanceDiseaseEvents,@function
_AdvanceDiseaseEvents:                  ; @AdvanceDiseaseEvents
; %bb.0:
	ld	hl, -48
	call	__frameset
	ld	iy, (ix + 6)
	ld	d, 0
	ld	a, (iy + 33)
	or	a, a
	jp	z, .LBB19_11
; %bb.1:
	ld	a, (iy + 34)
	or	a, a
	jp	nz, .LBB19_11
; %bb.2:
	ld	bc, -2
	ld	a, b
	ld	hl, (iy + 8)
	ld	e, (iy + 11)
	call	__lcmpu
	jr	nc, .LBB19_4
; %bb.3:
	ld	bc, 1
	ld	a, d
	call	__ladd
	ld	bc, (ix + 6)
	push	bc
	pop	iy
	ld	(iy + 8), hl
	ld	(iy + 11), e
	.local	.LBB19_4
.LBB19_4:
	ld	bc, 7
	ld.sis	de, 0
	ld	a, 1
	ld	(ix - 19), a
	ld	hl, _environments+6
	ld	(ix - 25), hl
	lea	hl, ix - 7
	ld	(ix - 34), hl
	ld	iy, (ix + 9)
	lea	hl, iy + 4
	ld	(ix - 28), hl
	ld	iy, 0
	lea	hl, iy + 0
	ld	(ix - 22), e
	ld	(ix - 21), d
	ld	(ix - 18), e
	ld	(ix - 17), d
	dec	a
	ld	(ix - 39), a                    ; 1-byte Folded Spill
	ld	(ix - 37), iy
	ld	(ix - 38), a                    ; 1-byte Folded Spill
	.local	.LBB19_5
.LBB19_5:                               ; =>This Inner Loop Header: Depth=1
	ld	iy, (ix + 6)
	ld	(ix - 31), hl
	or	a, a
	sbc	hl, bc
	jp	z, .LBB19_12
; %bb.6:                                ;   in Loop: Header=BB19_5 Depth=1
	ld	iy, (ix - 28)
	ld	hl, (iy - 4)
	add.sis	hl, de
	ld	(ix - 42), hl
	ld	de, (iy - 2)
	ld	l, e
	ld	h, d
	ld	c, (ix - 18)
	ld	b, (ix - 17)
	add.sis	hl, bc
	ld	(ix - 18), l
	ld	(ix - 17), h
	ld	hl, (iy)
	ld	c, (ix - 22)
	ld	b, (ix - 21)
	add.sis	hl, bc
	ld	(ix - 22), hl
	sbc.sis	hl, hl
	adc.sis	hl, de
	jp	z, .LBB19_10
; %bb.7:                                ;   in Loop: Header=BB19_5 Depth=1
	ld	hl, 1
	ld	bc, (ix - 31)
                                        ; kill: def $c killed $c killed $ubc
	call	__ishl
	lea	bc, iy + 0
	ld	iy, (ix + 6)
	ld	a, (iy + 30)
                                        ; kill: def $l killed $l killed $uhl
	or	a, l
	ld	l, a
	ld	(iy + 30), l
	ld	hl, (ix - 25)
	ld	a, (hl)
	push	bc
	pop	iy
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	(ix - 45), hl
	ld	bc, (iy - 4)
	ld	hl, (iy - 2)
	ld	iy, (iy)
	add.sis	hl, bc
	lea	bc, iy + 0
	add.sis	hl, bc
	ld	(ix - 48), hl
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	ld	hl, 0
	jr	z, .LBB19_9
; %bb.8:                                ;   in Loop: Header=BB19_5 Depth=1
	ld	iy, 0
	ld	iyl, e
	ld	iyh, d
	lea	hl, iy + 0
	ld	bc, 100
	call	__imulu
	ld	de, (ix - 48)
	ld	iyl, e
	ld	iyh, d
	lea	bc, iy + 0
	call	__idivu
	.local	.LBB19_9
.LBB19_9:                               ;   in Loop: Header=BB19_5 Depth=1
	inc	(ix - 39)
	ld	bc, 255
	call	__iand
	ld	bc, (ix - 45)
	call	__imulu
	push	hl
	pop	bc
	or	a, a
	sbc	hl, hl
	ld	a, l
	ld	hl, (ix - 37)
	ld	e, (ix - 38)                    ; 1-byte Folded Reload
	call	__ladd
	ld	(ix - 37), hl
	ld	(ix - 38), e                    ; 1-byte Folded Spill
	ld	iy, (ix - 28)
	.local	.LBB19_10
.LBB19_10:                              ;   in Loop: Header=BB19_5 Depth=1
	ld	hl, (ix - 31)
	inc	hl
	lea	iy, iy + 6
	ld	(ix - 28), iy
	ld	iy, (ix - 25)
	lea	iy, iy + 7
	ld	(ix - 25), iy
	ld	de, (ix - 22)
                                        ; kill: def $de killed $de killed $ude
	ld	(ix - 22), e
	ld	(ix - 21), d
	ld	de, (ix - 42)
                                        ; kill: def $de killed $de killed $ude
	ld	bc, 7
	jp	.LBB19_5
	.local	.LBB19_11
.LBB19_11:
	ld	a, d
	jp	.LBB19_32
	.local	.LBB19_12
.LBB19_12:
	ld	(ix - 7), e
	ld	(ix - 6), d
	ld	l, (ix - 18)
	ld	h, (ix - 17)
	ld	(ix - 5), l
	ld	(ix - 4), h
	ld	c, (ix - 22)
	ld	b, (ix - 21)
	ld	(ix - 3), c
	ld	(ix - 2), b
	add.sis	hl, bc
	add.sis	hl, de
	ld	(ix - 31), l
	ld	(ix - 30), h
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	ld	a, 0
	ld	(ix - 25), a                    ; 1-byte Folded Spill
	ld	l, a
	ld	(ix - 28), hl
	jr	z, .LBB19_14
; %bb.13:
	ld	iy, 0
	lea	hl, iy + 0
	ld	e, (ix - 18)
	ld	d, (ix - 17)
	ld	l, e
	ld	h, d
	ld	de, 100
	ld	iyl, c
	ld	iyh, b
	push	de
	pop	bc
	call	__imulu
	ld	de, 0
	ld	c, (ix - 31)
	ld	b, (ix - 30)
	ld	e, c
	ld	d, b
	push	de
	pop	bc
	call	__idivu
	ld	(ix - 25), hl
	or	a, a
	sbc	hl, hl
	ex	de, hl
	ld	e, iyl
	ld	d, iyh
	ex	de, hl
	ld	bc, 100
	call	__imulu
	push	de
	pop	bc
	call	__idivu
	ld	(ix - 28), hl
	ld	hl, (ix - 25)
	ld	(ix - 25), l                    ; 1-byte Folded Spill
	ld	iy, (ix + 6)
	.local	.LBB19_14
.LBB19_14:
	push	hl
	push	hl
	dec	sp
	ex	de, hl
	ld	hl, 0
	add	hl, sp
	ex	de, hl
	inc	de
	ld	bc, 6
	ld	hl, (ix - 34)
	ldir
	push	iy
	call	_AwardDNA
	ld	iy, (ix + 6)
	pop	hl
	pop	hl
	pop	hl
	inc	sp
	ld	e, (iy + 35)
	ld	a, e
	or	a, a
	jp	nz, .LBB19_19
; %bb.15:
	ld	l, 3
	ld	bc, (ix - 37)
	ld	a, (ix - 38)                    ; 1-byte Folded Reload
	call	__lshru
	ld	e, a
	ld	d, 0
	ld	(ix - 15), d
	ld	iy, (ix - 17)
	ld	iyh, d
	push	af
	ld	a, (ix - 25)                    ; 1-byte Folded Reload
	ld	iyl, a
	pop	af
	or	a, a
	sbc	hl, hl
	ld	a, l
	push	bc
	pop	hl
	lea	bc, iy + 0
	call	__ladd
	ld	(ix - 22), hl
	ld	iy, (ix + 12)
	ld	hl, (iy + 16)
	ld	bc, 0
	push	bc
	pop	iy
	ex	de, hl
	ld	iyl, e
	ld	iyh, d
	ex	de, hl
	add	iy, iy
	push	bc
	pop	hl
	ld	bc, (ix - 28)
	ld	l, c
	add	hl, hl
	add	hl, hl
	add	hl, hl
	push	hl
	pop	bc
	ld	hl, (ix - 22)
	call	__ladd
	lea	bc, iy + 0
	call	__ladd
	ld	(ix - 14), d
	ld	bc, (ix - 16)
	ld	iy, (ix + 15)
	ld	b, iyh
	ld	c, iyl
	call	__lmulu
	ld	bc, 100
	ld	a, d
	call	__ldivu
	ld	a, e
	ld	iy, (ix + 6)
	lea	de, iy + 16
	ld	bc, (iy + 16)
	push	de
	pop	iy
	ld	d, 0
	lea	iy, iy + 3
	ld	e, a
	ld	a, (iy)
	ld	iy, (ix + 6)
	call	__ladd
	push	hl
	pop	bc
	ld	a, e
	ld	(iy + 16), bc
	ld	(iy + 19), a
	ld	hl, 11999
	ld	e, d
	call	__lcmpu
	jr	c, .LBB19_18
; %bb.16:
	ld	a, (ix - 25)                    ; 1-byte Folded Reload
	cp	a, 65
	jr	nc, .LBB19_18
; %bb.17:
	ld	hl, (ix - 28)
	ld	a, l
	cp	a, 5
	jp	c, .LBB19_46
	.local	.LBB19_18
.LBB19_18:
	ld	hl, 12000
	ld	(iy + 16), hl
	ld	(iy + 19), 0
	ld	(iy + 35), 1
	ld	bc, (iy + 8)
	ld	a, (iy + 11)
	ld	(iy + 12), bc
	ld	(iy + 15), a
	push	bc
	pop	hl
	ld	e, a
	jr	.LBB19_21
	.local	.LBB19_19
.LBB19_19:
	ld	a, e
	cp	a, 1
	ld	d, 0
	ld	l, d
	jr	nz, .LBB19_23
; %bb.20:
	ld	hl, (iy + 8)
	ld	e, (iy + 11)
	ld	bc, (iy + 12)
	ld	a, (iy + 15)
	ld	(ix - 19), d                    ; 1-byte Folded Spill
	.local	.LBB19_21
.LBB19_21:
	call	__lsub
	push	hl
	pop	bc
	ld	a, e
	ld	hl, 7
	ld	e, d
	call	__lcmpu
	jr	nc, .LBB19_24
; %bb.22:
	ld	(iy + 35), 2
	ld	l, (ix - 19)                    ; 1-byte Folded Reload
	ld	a, 2
	ld	e, a
	ld	a, l
	add	a, e
	ld	l, a
	.local	.LBB19_23
.LBB19_23:
	ld	(ix - 19), l
	ld	l, (ix - 18)
	ld	h, (ix - 17)
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	jp	nz, .LBB19_33
	.local	.LBB19_24
.LBB19_24:
	ld	bc, 0
	ld	hl, (iy + 22)
	ld	de, 0
	ld	e, l
	ld	d, h
	ld	(ix - 22), de
	.local	.LBB19_25
.LBB19_25:
	ld	de, 4
	.local	.LBB19_26
.LBB19_26:                              ; =>This Inner Loop Header: Depth=1
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	jp	z, .LBB19_31
; %bb.27:                               ;   in Loop: Header=BB19_26 Depth=1
	ld	hl, _cure_thresholds
	add	hl, bc
	ld	a, (hl)
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	(ix - 18), bc
	ld	bc, 100
	call	__imulu
	ex	de, hl
	ld	hl, (ix - 22)
	or	a, a
	sbc	hl, de
	jp	c, .LBB19_30
; %bb.28:                               ;   in Loop: Header=BB19_26 Depth=1
	ld	iy, (ix + 6)
	ld	d, (iy + 31)
	ld	hl, 1
	ld	bc, (ix - 18)
                                        ; kill: def $c killed $c killed $ubc
	call	__ishl
	ld	a, l
	and	a, d
	ld	e, a
	or	a, a
	jp	nz, .LBB19_30
; %bb.29:                               ;   in Loop: Header=BB19_26 Depth=1
                                        ; kill: def $l killed $l killed $uhl
	ld	a, d
	or	a, l
	ld	l, a
	ld	(iy + 31), l
	ld	hl, 8
	ld	bc, (ix - 18)
                                        ; kill: def $c killed $c killed $ubc
	call	__ishl
                                        ; kill: def $l killed $l killed $uhl
	ld	e, (ix - 19)
	ld	a, e
	or	a, l
	ld	e, a
	ld	(ix - 19), e
	.local	.LBB19_30
.LBB19_30:                              ;   in Loop: Header=BB19_26 Depth=1
	ld	de, 4
	ld	bc, (ix - 18)
	inc	bc
	ld	iy, (ix + 6)
	jp	.LBB19_26
	.local	.LBB19_31
.LBB19_31:
	push	hl
	push	hl
	dec	sp
	ex	de, hl
	ld	hl, 0
	add	hl, sp
	ex	de, hl
	inc	de
	ld	bc, 6
	ld	hl, (ix - 34)
	ldir
	push	iy
	call	_EvaluateOutcome
	pop	hl
	pop	hl
	pop	hl
	inc	sp
	ld	a, (ix - 19)                    ; 1-byte Folded Reload
	.local	.LBB19_32
.LBB19_32:
	ld	sp, ix
	pop	ix
	ret
	.local	.LBB19_33
.LBB19_33:
	ld	(ix - 31), e                    ; 1-byte Folded Spill
	ld	a, (ix - 25)                    ; 1-byte Folded Reload
	srl	a
	ld	l, 20
	add	a, l
	ld	l, a
	ld	de, 0
	push	de
	pop	bc
	ld	e, l
	ld	(ix - 18), de
	push	bc
	pop	de
	ld	hl, (ix - 28)
	ld	e, l
	ld	iy, (ix + 12)
	ld	bc, (iy + 16)
	ld	iy, 0
	lea	hl, iy + 0
	ld	(ix - 37), bc
	ld	l, c
	ld	h, b
	add	hl, hl
	ld	(ix - 22), hl
	push	af
	ld	a, (ix - 39)                    ; 1-byte Folded Reload
	ld	iyl, a
	pop	af
	lea	hl, iy + 0
	ld	bc, 3
	call	__imulu
	add	hl, de
	ld	de, (ix - 18)
	add	hl, de
	ld	de, (ix - 22)
	add	hl, de
	ld	(ix - 22), hl
	ld	de, 0
	ld	a, e
	ld	(ix - 18), a
	ld	iy, (ix + 12)
	ld	hl, (iy + 20)
	ld	e, l
	ld	d, h
	ld	hl, 100
	or	a, a
	sbc	hl, de
	ld	(ix - 13), hl
	ld	a, (ix - 11)
	rlc	a
	sbc	a, a
	ld	e, b
	ld	(ix - 10), e
	ld	bc, (ix - 12)
	ld	de, (ix + 18)
	ld	b, d
	ld	c, e
	ld	e, a
	ld	a, (ix - 18)                    ; 1-byte Folded Reload
	call	__lmulu
	ld	bc, (ix - 22)
	call	__lmulu
	push	hl
	pop	iy
	ld	d, e
	ld	bc, 100
	xor	a, a
	call	__ldivu
	ld	(ix - 25), hl
	ld	(ix - 22), e                    ; 1-byte Folded Spill
	lea	hl, iy + 0
	ld	e, d
	ld	d, a
	ld	a, d
	call	__lcmpu
	ccf
                                        ; kill: def $a killed $a
	sbc	a, a
	inc	a
	bit	0, a
	ld	hl, 1
	jr	nz, .LBB19_35
; %bb.34:
	ld	hl, (ix - 25)
	.local	.LBB19_35
.LBB19_35:
	bit	0, a
	ld	e, d
	ld	bc, (ix + 6)
	jr	nz, .LBB19_37
; %bb.36:
	ld	e, (ix - 22)                    ; 1-byte Folded Reload
	.local	.LBB19_37
.LBB19_37:
	push	bc
	pop	iy
	ld	iy, (iy + 24)
	ld	(ix - 9), d
	ld	bc, (ix - 11)
	ld	b, iyh
	ld	c, iyl
	ld	d, (ix - 18)                    ; 1-byte Folded Reload
	ld	a, d
	call	__ladd
	ld	iy, (ix + 6)
	ld	bc, (iy + 22)
	xor	a, a
	ld	(ix - 8), a
	ld	iy, (ix - 10)
	ld	iyh, b
	ld	iyl, c
	ld	(ix - 22), hl
	ld	bc, 200
	call	__ldivu
	ld	(ix - 25), hl
	lea	bc, iy + 0
	ld	a, d
	call	__ladd
	ld	bc, 10000
	xor	a, a
	call	__lcmpu
	jr	c, .LBB19_39
; %bb.38:
	push	bc
	pop	hl
	.local	.LBB19_39
.LBB19_39:
	ex	de, hl
	ld	iy, (ix + 6)
	ld	(iy + 22), e
	ld	(iy + 23), d
	ld.sis	bc, -200
	ld	hl, (ix - 25)
                                        ; kill: def $hl killed $hl killed $uhl
	call	__smulu
	ex	de, hl
	ld	iyl, e
	ld	iyh, d
	ex	de, hl
	ld	bc, (ix - 22)
	add.sis	iy, bc
	ld.sis	bc, 10000
	ld	(ix - 22), de
	ld	l, e
	ld	h, d
	or	a, a
	sbc.sis	hl, bc
	ld.sis	hl, 0
	jr	z, .LBB19_41
; %bb.40:
	ex	de, hl
	ld	e, iyl
	ld	d, iyh
	ex	de, hl
	.local	.LBB19_41
.LBB19_41:
	ld	iy, (ix + 6)
	ld	(iy + 24), l
	ld	(iy + 25), h
	ld	a, (ix - 31)                    ; 1-byte Folded Reload
	cp	a, 2
	ld	bc, 0
	jp	nz, .LBB19_25
; %bb.42:
	ld.sis	de, 2500
	ld	hl, (ix - 22)
                                        ; kill: def $hl killed $hl killed $uhl
	or	a, a
	sbc.sis	hl, de
	jp	nc, .LBB19_45
; %bb.43:
	ld.sis	de, 30
	ld	hl, (ix - 37)
                                        ; kill: def $hl killed $hl killed $uhl
	or	a, a
	sbc.sis	hl, de
	jr	nc, .LBB19_45
; %bb.44:
	ld	hl, (ix - 28)
	ld	a, l
	cp	a, 10
	jp	c, .LBB19_25
	.local	.LBB19_45
.LBB19_45:
	ld	(iy + 35), 3
	ld	l, (ix - 19)
	ld	e, 4
	ld	a, l
	add	a, e
	ld	l, a
	ld	(ix - 19), l
	jp	.LBB19_25
	.local	.LBB19_46
.LBB19_46:
	ld	(ix - 19), d                    ; 1-byte Folded Spill
	jp	.LBB19_24
	.local	.Lfunc_end19
.Lfunc_end19:
	.size	_AdvanceDiseaseEvents, .Lfunc_end19-_AdvanceDiseaseEvents
                                        ; -- End function
	.section	.text._ValidateDisease,"ax",@progbits
	.globl	_ValidateDisease                ; -- Begin function ValidateDisease
	.type	_ValidateDisease,@function
_ValidateDisease:                       ; @ValidateDisease
; %bb.0:
	ld	hl, -45
	call	__frameset
	ld	iy, (ix + 6)
	ld	d, 0
	ld	l, (iy + 32)
	ld	a, l
	cp	a, 3
	jp	nc, .LBB20_41
; %bb.1:
	ld	h, (iy + 33)
	ld	a, h
	cp	a, 2
	jp	nc, .LBB20_41
; %bb.2:
	ld	b, (iy + 34)
	ld	a, b
	cp	a, 4
	jp	nc, .LBB20_41
; %bb.3:
	ld	e, (iy + 35)
	ld	a, e
	cp	a, 4
	jp	nc, .LBB20_41
; %bb.4:
	ld	c, (iy + 36)
	ld	a, c
	cp	a, 4
	jp	nc, .LBB20_41
; %bb.5:
	ld	a, l
	cp	a, 2
	jr	z, .LBB20_7
; %bb.6:
	ld	a, c
	or	a, a
	jp	nz, .LBB20_41
	.local	.LBB20_7
.LBB20_7:
	ld	(ix - 7), b                     ; 1-byte Folded Spill
	ld	(ix - 6), h                     ; 1-byte Folded Spill
	ld	(ix - 8), c                     ; 1-byte Folded Spill
	ld	hl, (iy + 20)
	ld.sis	bc, 180
	ld	(ix - 3), hl
                                        ; kill: def $hl killed $hl killed $uhl
	or	a, a
	sbc.sis	hl, bc
	jp	nc, .LBB20_41
; %bb.8:
	ld	hl, (iy + 22)
	ld.sis	bc, 10001
	ld	(ix - 11), hl
                                        ; kill: def $hl killed $hl killed $uhl
	or	a, a
	sbc.sis	hl, bc
	jp	nc, .LBB20_41
; %bb.9:
	ld	hl, (iy + 24)
	ld.sis	bc, 200
	ld	(ix - 14), hl
                                        ; kill: def $hl killed $hl killed $uhl
	or	a, a
	sbc.sis	hl, bc
	jp	nc, .LBB20_41
; %bb.10:
	ld	(ix - 15), e                    ; 1-byte Folded Spill
	ld	e, 0
	ld	hl, 127
	ld	bc, (iy + 4)
	ld	a, (iy + 7)
	ld	(ix - 18), bc
	ld	(ix - 19), a                    ; 1-byte Folded Spill
	call	__lcmpu
	jp	c, .LBB20_41
; %bb.11:
	ld	hl, (iy + 26)
	ld.sis	bc, 512
	ld	(ix - 22), hl
                                        ; kill: def $hl killed $hl killed $uhl
	or	a, a
	sbc.sis	hl, bc
	jp	nc, .LBB20_41
; %bb.12:
	ld	l, (iy + 28)
	ld	a, l
	cp	a, 64
	jp	nc, .LBB20_41
; %bb.13:
	ld	e, (iy + 29)
	ld	a, e
	cp	a, 0
	call	pe, __setflag
	jp	m, .LBB20_41
; %bb.14:
	ld	a, (iy + 30)
	cp	a, 0
	call	pe, __setflag
	jp	m, .LBB20_41
; %bb.15:
	ld	(ix - 23), l                    ; 1-byte Folded Spill
	ld	l, -1
	ld	(ix - 27), a                    ; 1-byte Folded Spill
	xor	a, l
	ld	l, a
	ld	(ix - 26), e                    ; 1-byte Folded Spill
	ld	a, e
	and	a, l
	ld	l, a
	or	a, a
	jp	nz, .LBB20_41
; %bb.16:
	ld	a, (iy + 31)
	ld	(ix - 28), a                    ; 1-byte Folded Spill
	cp	a, 16
	jp	nc, .LBB20_40
; %bb.17:
	ld	de, 12000
	ld	hl, (ix + 6)
	push	hl
	pop	iy
	ld	bc, (iy + 16)
	ld	a, (iy + 19)
	ex	de, hl
	ld	e, 0
	ld	(ix - 32), bc
	ld	(ix - 29), a                    ; 1-byte Folded Spill
	call	__lcmpu
	jp	c, .LBB20_40
; %bb.18:
	ld	bc, -1
	ld	hl, (ix + 6)
	push	hl
	pop	iy
	ld	hl, (iy + 8)
	ld	e, (iy + 11)
	ld	(ix - 35), hl
	ld	(ix - 36), e                    ; 1-byte Folded Spill
	ld	a, b
	call	__lcmpu
	jp	z, .LBB20_40
; %bb.19:
	ld	hl, (ix + 6)
	push	hl
	pop	iy
	ld	bc, (iy + 12)
	ld	a, (iy + 15)
	ld	hl, (ix - 35)
	ld	e, (ix - 36)                    ; 1-byte Folded Reload
	ld	(ix - 40), bc
	ld	(ix - 37), a                    ; 1-byte Folded Spill
	call	__lcmpu
	jp	c, .LBB20_40
; %bb.20:
	ld	bc, (ix - 22)
	ld	l, c
	ld	h, b
	inc.sis	hl
                                        ; kill: def $bc killed $bc killed $ubc
	call	__sand
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	jp	nz, .LBB20_40
; %bb.21:
	ld	e, (ix - 23)                    ; 1-byte Folded Reload
	ld	l, e
	inc	l
	ld	a, l
	and	a, e
	ld	l, a
	or	a, a
	jp	nz, .LBB20_40
; %bb.22:
	ld	e, (ix - 28)                    ; 1-byte Folded Reload
	ld	l, e
	inc	l
	ld	a, l
	and	a, e
	ld	l, a
	or	a, a
	jp	nz, .LBB20_40
; %bb.23:                               ; %.preheader30.preheader
	ld	bc, 0
	ld.sis	hl, 12
	ld	(ix - 42), l
	ld	(ix - 41), h
	ld	hl, _traits+6
	ld	(ix - 45), hl
	ld	iy, 7
	.local	.LBB20_24
.LBB20_24:                              ; %.preheader30
                                        ; =>This Inner Loop Header: Depth=1
	push	bc
	pop	hl
	lea	de, iy + 0
	or	a, a
	sbc	hl, de
	jr	z, .LBB20_28
; %bb.25:                               ;   in Loop: Header=BB20_24 Depth=1
	ld	hl, 1
	call	__ishl
	ld	e, (ix - 26)
	ld	a, l
	and	a, e
	ld	l, a
	or	a, a
	jr	z, .LBB20_27
; %bb.26:                               ;   in Loop: Header=BB20_24 Depth=1
	ld	l, (ix - 42)
	ld	h, (ix - 41)
	ld.sis	de, 5
	add.sis	hl, de
	ld	(ix - 42), l
	ld	(ix - 41), h
	.local	.LBB20_27
.LBB20_27:                              ;   in Loop: Header=BB20_24 Depth=1
	inc	bc
	jr	.LBB20_24
	.local	.LBB20_28
.LBB20_28:
	ld	de, 0
	ld	hl, (ix - 22)
	ld	e, l
	ld	d, h
	ld	iy, 0
	.local	.LBB20_29
.LBB20_29:                              ; =>This Inner Loop Header: Depth=1
	lea	hl, iy + 0
	ld	bc, 9
	or	a, a
	sbc	hl, bc
	jr	z, .LBB20_33
; %bb.30:                               ;   in Loop: Header=BB20_29 Depth=1
	ld	hl, 1
	ld	c, iyl
	call	__ishl
	push	de
	pop	bc
	call	__iand
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	z, .LBB20_32
; %bb.31:                               ;   in Loop: Header=BB20_29 Depth=1
	ld	l, (ix - 42)
	ld	h, (ix - 41)
	ld.sis	bc, 8
	add.sis	hl, bc
	ld	(ix - 42), l
	ld	(ix - 41), h
	.local	.LBB20_32
.LBB20_32:                              ;   in Loop: Header=BB20_29 Depth=1
	inc	iy
	jr	.LBB20_29
	.local	.LBB20_33
.LBB20_33:
	ld	iy, 6
	ld	bc, 0
	.local	.LBB20_34
.LBB20_34:                              ; =>This Inner Loop Header: Depth=1
	push	bc
	pop	hl
	lea	de, iy + 0
	or	a, a
	sbc	hl, de
	jr	z, .LBB20_38
; %bb.35:                               ;   in Loop: Header=BB20_34 Depth=1
	ld	hl, 1
	call	__ishl
	ld	e, (ix - 23)
	ld	a, l
	and	a, e
	ld	l, a
	or	a, a
	jr	z, .LBB20_37
; %bb.36:                               ;   in Loop: Header=BB20_34 Depth=1
	ld.sis	de, 10
	ld	l, (ix - 42)
	ld	h, (ix - 41)
	add.sis	hl, de
	ld	(ix - 42), l
	ld	(ix - 41), h
	.local	.LBB20_37
.LBB20_37:                              ;   in Loop: Header=BB20_34 Depth=1
	inc	bc
	jr	.LBB20_34
	.local	.LBB20_38
.LBB20_38:
	ld	l, (ix - 42)
	ld	h, (ix - 41)
	ld	de, (ix - 3)
	or	a, a
	sbc.sis	hl, de
	jr	c, .LBB20_40
; %bb.39:
	ld	iy, (ix + 6)
	lea	de, iy + 37
	ld	hl, 20
	push	hl
	or	a, a
	sbc	hl, hl
	push	hl
	ld	(ix - 26), de
	push	de
	call	_memchr
	pop	de
	pop	de
	pop	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB20_42
	.local	.LBB20_40
.LBB20_40:
	ld	d, 0
	.local	.LBB20_41
.LBB20_41:                              ; %.loopexit25
	ld	a, d
	ld	sp, ix
	pop	ix
	ret
	.local	.LBB20_42
.LBB20_42:                              ; %.preheader28.preheader
	ld	c, 0
	.local	.LBB20_43
.LBB20_43:                              ; %.preheader28
                                        ; =>This Inner Loop Header: Depth=1
	ld	de, 0
	ld	e, c
	ld	hl, (ix - 26)
	add	hl, de
	ld	l, (hl)
	ld	a, l
	or	a, a
	jr	z, .LBB20_46
; %bb.44:                               ;   in Loop: Header=BB20_43 Depth=1
	ld	e, -127
	ld	a, l
	add	a, e
	ld	l, a
	cp	a, -95
	jr	c, .LBB20_40
; %bb.45:                               ;   in Loop: Header=BB20_43 Depth=1
	inc	c
	jr	.LBB20_43
	.local	.LBB20_46
.LBB20_46:
	or	a, a
	sbc	hl, hl
	ld	l, c
	ld	bc, 21
	ld	(ix - 26), hl
	sbc	hl, bc
	jr	nc, .LBB20_48
; %bb.47:
	ld	hl, 20
	ld	(ix - 26), hl
	.local	.LBB20_48
.LBB20_48:                              ; =>This Inner Loop Header: Depth=1
	ld	hl, (ix - 26)
	or	a, a
	sbc	hl, de
	jr	z, .LBB20_50
; %bb.49:                               ;   in Loop: Header=BB20_48 Depth=1
	ld	iy, (ix + 6)
	add	iy, de
	inc	de
	ld	a, (iy + 37)
	or	a, a
	jr	nz, .LBB20_40
	jr	.LBB20_48
	.local	.LBB20_50
.LBB20_50:
	ld	a, (ix - 6)                     ; 1-byte Folded Reload
	or	a, a
	jp	nz, .LBB20_61
; %bb.51:
	ld	a, (ix - 7)                     ; 1-byte Folded Reload
	or	a, a
	jr	nz, .LBB20_40
; %bb.52:
	ld	hl, (ix - 35)
	ld	e, (ix - 36)                    ; 1-byte Folded Reload
	call	__lcmpzero
	jr	nz, .LBB20_40
; %bb.53:
	ld	iy, (ix + 6)
	ld	hl, (iy)
	ld	e, (iy + 3)
	ld	bc, (ix - 18)
	ld	a, (ix - 19)                    ; 1-byte Folded Reload
	call	__lor
	push	hl
	pop	iy
	ld	d, e
	ld	hl, (ix - 14)
                                        ; kill: def $hl killed $hl killed $uhl
	ld	bc, (ix - 11)
                                        ; kill: def $bc killed $bc killed $ubc
	call	__sor
	ld	a, (ix - 28)                    ; 1-byte Folded Reload
	or	a, a
	jp	nz, .LBB20_40
; %bb.54:
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	jp	nz, .LBB20_40
; %bb.55:
	ld.sis	bc, 12
	ld	hl, (ix - 3)
                                        ; kill: def $hl killed $hl killed $uhl
	or	a, a
	sbc.sis	hl, bc
	jp	nz, .LBB20_40
; %bb.56:
	ld	hl, (ix - 32)
	ld	e, (ix - 29)                    ; 1-byte Folded Reload
	call	__lcmpzero
	jp	nz, .LBB20_40
; %bb.57:
	ld	a, (ix - 23)                    ; 1-byte Folded Reload
	or	a, a
	jp	nz, .LBB20_40
; %bb.58:
	ld	hl, (ix - 22)
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	jp	nz, .LBB20_40
; %bb.59:
	ld	l, (ix - 15)
	ld	a, (ix - 8)
	or	a, l
	ld	l, a
	ld	e, (ix - 27)
	ld	a, l
	or	a, e
	ld	l, a
	or	a, a
	jp	nz, .LBB20_40
; %bb.60:
	lea	hl, iy + 0
	ld	e, d
	jp	.LBB20_65
	.local	.LBB20_61
.LBB20_61:
	ld	a, (ix - 15)                    ; 1-byte Folded Reload
	or	a, a
	jp	nz, .LBB20_67
; %bb.62:
	ld	hl, (ix - 14)
                                        ; kill: def $hl killed $hl killed $uhl
	ld	bc, (ix - 11)
                                        ; kill: def $bc killed $bc killed $ubc
	call	__sor
	ld	a, (ix - 28)                    ; 1-byte Folded Reload
	or	a, a
	jp	nz, .LBB20_40
; %bb.63:
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	jp	nz, .LBB20_40
; %bb.64:
	ld	hl, (ix - 40)
	ld	e, (ix - 37)                    ; 1-byte Folded Reload
	.local	.LBB20_65
.LBB20_65:
	call	__lcmpzero
	jp	nz, .LBB20_40
; %bb.66:
	ld	hl, (ix - 18)
	ld	a, l
	bit	5, a
	jp	nz, .LBB20_40
	jr	.LBB20_69
	.local	.LBB20_67
.LBB20_67:
	ld	hl, (ix - 32)
	ld	e, (ix - 29)                    ; 1-byte Folded Reload
	ld	bc, 12000
	xor	a, a
	call	__lcmpu
	jp	nz, .LBB20_40
; %bb.68:
	ld	hl, (ix - 40)
	ld	e, (ix - 37)                    ; 1-byte Folded Reload
	call	__lcmpzero
	jp	z, .LBB20_40
	.local	.LBB20_69
.LBB20_69:                              ; %.preheader64
	or	a, a
	sbc	hl, hl
	ld	(ix - 3), hl
	.local	.LBB20_70
.LBB20_70:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB20_73 Depth 2
	ld	hl, (ix - 3)
	ld	de, 39
	or	a, a
	sbc	hl, de
	jr	z, .LBB20_78
; %bb.71:                               ;   in Loop: Header=BB20_70 Depth=1
	ld	hl, (ix - 3)
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_Owns
	pop	hl
	pop	hl
	bit	0, a
	jr	z, .LBB20_77
; %bb.72:                               ; %.preheader.preheader
                                        ;   in Loop: Header=BB20_70 Depth=1
	or	a, a
	sbc	hl, hl
	.local	.LBB20_73
.LBB20_73:                              ; %.preheader
                                        ;   Parent Loop BB20_70 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ld	(ix - 6), hl
	ld	hl, (ix - 6)
	ld	de, 2
	or	a, a
	sbc	hl, de
	jr	z, .LBB20_77
; %bb.74:                               ;   in Loop: Header=BB20_73 Depth=2
	ld	iy, (ix - 45)
	ld	de, (ix - 6)
	add	iy, de
	ld	a, (iy)
	cp	a, -1
	jr	z, .LBB20_76
; %bb.75:                               ;   in Loop: Header=BB20_73 Depth=2
	ld	l, a
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_Owns
	pop	hl
	pop	hl
	bit	0, a
	jp	z, .LBB20_40
	.local	.LBB20_76
.LBB20_76:                              ;   in Loop: Header=BB20_73 Depth=2
	ld	hl, (ix - 6)
	inc	hl
	jr	.LBB20_73
	.local	.LBB20_77
.LBB20_77:                              ; %.loopexit
                                        ;   in Loop: Header=BB20_70 Depth=1
	ld	hl, (ix - 3)
	inc	hl
	ld	(ix - 3), hl
	ld	iy, (ix - 45)
	lea	iy, iy + 22
	ld	(ix - 45), iy
	jr	.LBB20_70
	.local	.LBB20_78
.LBB20_78:
	ld	d, 1
	jp	.LBB20_41
	.local	.Lfunc_end20
.Lfunc_end20:
	.size	_ValidateDisease, .Lfunc_end20-_ValidateDisease
                                        ; -- End function
	.section	.text._WorldEventsMenu,"ax",@progbits
	.globl	_WorldEventsMenu                ; -- Begin function WorldEventsMenu
	.type	_WorldEventsMenu,@function
_WorldEventsMenu:                       ; @WorldEventsMenu
; %bb.0:
	ld	hl, -202
	call	__frameset
	xor	a, a
	ld	de, 12
	ld	bc, 0
	lea	hl, ix - 86
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 71
	ld	(iy + 0), hl
	lea	hl, ix - 91
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 62
	ld	(iy + 0), hl
	push	de
	ld	de, -171
	lea	hl, ix + 0
	add	hl, de
	pop	de
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 53
	ld	(iy + 0), hl
	ld	(ix - 87), a
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 47
	ld	(iy + 0), a                     ; 1-byte Folded Spill
	.local	.LBB21_1
.LBB21_1:                               ; =>This Inner Loop Header: Depth=1
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	jr	z, .LBB21_6
; %bb.2:                                ;   in Loop: Header=BB21_1 Depth=1
	ld	iyl, a
	ld	hl, _world_events+38
	add	hl, bc
	ld	a, (hl)
	cp	a, -1
	jr	nz, .LBB21_4
; %bb.3:                                ;   in Loop: Header=BB21_1 Depth=1
	ld	a, iyl
	jr	.LBB21_5
	.local	.LBB21_4
.LBB21_4:                               ;   in Loop: Header=BB21_1 Depth=1
	ld	de, 0
	push	ix
	lea	ix, ix - 128
	ld	a, (ix - 47)                    ; 1-byte Folded Reload
	pop	ix
	ld	e, a
	inc	a
	push	ix
	lea	ix, ix - 128
	ld	(ix - 47), a
	pop	ix
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 62)
	pop	ix
	add	hl, de
	ld	de, 12
	ld	a, iyl
	ld	(hl), a
	.local	.LBB21_5
.LBB21_5:                               ;   in Loop: Header=BB21_1 Depth=1
	push	bc
	pop	hl
	ld	bc, 3
	add	hl, bc
	inc	a
	push	hl
	pop	bc
	jr	.LBB21_1
	.local	.LBB21_6
.LBB21_6:
	ld	de, -175
	lea	iy, ix + 0
	add	iy, de
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	ld	l, a
	inc	l
	ld	de, -202
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	de, -184
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	.local	.LBB21_7
.LBB21_7:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB21_8 Depth 2
                                        ;     Child Loop BB21_20 Depth 2
                                        ;     Child Loop BB21_45 Depth 2
	ld	hl, _.str.390
	push	hl
	call	_BeginScreen
	pop	hl
	ld	de, -175
	lea	iy, ix + 0
	add	iy, de
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	or	a, a
	ld	hl, 38
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, _.str.1.391
	push	hl
	call	z, _Text
	pop	hl
	pop	hl
	pop	hl
	ld	a, (ix - 87)
	or	a, a
	sbc	hl, hl
	ld	de, -187
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), a                     ; 1-byte Folded Spill
	ld	l, a
	ld	de, -193
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	ld	hl, 51
	ld	de, -174
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	or	a, a
	sbc	hl, hl
	push	hl
	pop	bc
	.local	.LBB21_8
.LBB21_8:                               ;   Parent Loop BB21_7 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ld	de, -184
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	or	a, a
	sbc	hl, bc
	jp	z, .LBB21_12
; %bb.9:                                ;   in Loop: Header=BB21_8 Depth=2
	ld	de, -190
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	add	hl, bc
	ld	a, (hl)
	ld	iy, 0
	lea	hl, iy + 0
	ld	l, a
	push	ix
	lea	ix, ix - 128
	ld	(ix - 50), bc
	pop	ix
	ld	bc, 3
	call	__imulu
	ex	de, hl
	ld	hl, _world_events+38
	add	hl, de
	push	ix
	lea	ix, ix - 128
	ld	(ix - 68), hl
	pop	ix
	ld	a, (hl)
	lea	hl, iy + 0
	ld	l, a
	ld	bc, 28
	call	__imulu
	ex	de, hl
	ld	hl, _event_catalog
	add	hl, de
	ld	de, (hl)
	ld	bc, -174
	lea	hl, ix + 0
	add	hl, bc
	ld	iy, (hl)
	ld	bc, -13
	add	iy, bc
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 65)
	pop	ix
	push	ix
	lea	ix, ix - 128
	ld	bc, (ix - 50)
	pop	ix
	or	a, a
	sbc	hl, bc
	ld	hl, -1
	jr	z, .LBB21_11
; %bb.10:                               ;   in Loop: Header=BB21_8 Depth=2
	ld	hl, 0
	.local	.LBB21_11
.LBB21_11:                              ;   in Loop: Header=BB21_8 Depth=2
	push	hl
	push	iy
	push	de
	call	_MenuItem
	pop	hl
	pop	hl
	pop	hl
	ld	de, -196
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	a, (iy + 1)
	or	a, a
	sbc	hl, hl
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de, hl
	ld	hl, _region
	add	hl, de
	ld	hl, (hl)
	ld	a, (iy + 2)
	ld	de, 0
	ld	e, a
	push	de
	push	hl
	ld	hl, _.str.2.392
	push	hl
	ld	hl, 80
	push	hl
	ld	de, -181
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_snprintf
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	de, -174
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, 24
	push	hl
	ld	de, -181
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	de, -178
	lea	iy, ix + 0
	add	iy, de
	ld	bc, (iy + 0)
	inc	bc
	ld	de, 36
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 46
	ld	hl, (iy + 0)
	add	hl, de
	ld	de, -174
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	jp	.LBB21_8
	.local	.LBB21_12
.LBB21_12:                              ;   in Loop: Header=BB21_7 Depth=1
	ld	de, -187
	lea	iy, ix + 0
	add	iy, de
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	ld	de, -175
	lea	iy, ix + 0
	add	iy, de
	ld	l, (iy + 0)
	cp	a, l
	ld	hl, -1
	jr	z, .LBB21_14
; %bb.13:                               ;   in Loop: Header=BB21_7 Depth=1
	ld	hl, 0
	.local	.LBB21_14
.LBB21_14:                              ;   in Loop: Header=BB21_7 Depth=1
	push	hl
	ld	hl, 190
	push	hl
	ld	hl, _.str.79.462
	push	hl
	call	_MenuItem
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 212
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, _.str.4.394
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 227
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, _.str.25.503
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	call	_gfx_SwapDraw
	call	_WaitKey
	ld	e, a
	cp	a, 6
	jp	z, .LBB21_53
; %bb.15:                               ;   in Loop: Header=BB21_7 Depth=1
	ld	bc, -187
	lea	iy, ix + 0
	add	iy, bc
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	ld	bc, -175
	lea	iy, ix + 0
	add	iy, bc
	ld	l, (iy + 0)
	cp	a, l
	jr	nz, .LBB21_17
; %bb.16:                               ;   in Loop: Header=BB21_7 Depth=1
	ld	a, e
	cp	a, 5
	jp	z, .LBB21_53
	.local	.LBB21_17
.LBB21_17:                              ;   in Loop: Header=BB21_7 Depth=1
	ld	bc, -202
	lea	iy, ix + 0
	add	iy, bc
	ld	hl, (iy + 0)
	push	hl
	pea	ix - 87
	push	de
	ld	bc, -174
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), de
	call	_MenuMove
	pop	hl
	pop	hl
	pop	hl
	bit	0, a
	jp	nz, .LBB21_7
; %bb.18:                               ;   in Loop: Header=BB21_7 Depth=1
	ld	de, -174
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	ld	a, l
	cp	a, 5
	jp	nz, .LBB21_7
; %bb.19:                               ;   in Loop: Header=BB21_7 Depth=1
	or	a, a
	sbc	hl, hl
	ex	de, hl
	ld	e, (ix - 87)
	ld	bc, -190
	lea	iy, ix + 0
	add	iy, bc
	ld	hl, (iy + 0)
	add	hl, de
	ld	a, (hl)
	ld	e, a
	push	de
	pop	hl
	push	de
	pop	iy
	ld	bc, 3
	call	__imulu
	ex	de, hl
	ld	hl, _world_events+38
	add	hl, de
	push	ix
	lea	ix, ix - 128
	ld	(ix - 59), hl
	pop	ix
	ld	a, (hl)
	lea	hl, iy + 0
	ld	l, a
	ld	de, -178
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	ld	bc, 28
	call	__imulu
	ex	de, hl
	ld	hl, _event_catalog
	add	hl, de
	ld	de, -174
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	ld	hl, _.str.6.396
	push	hl
	call	_BeginScreen
	pop	hl
	ld	de, -174
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	ld	hl, (hl)
	ld	de, 2
	push	de
	ld	de, 304
	push	de
	ld	de, 27
	push	de
	ld	de, 8
	push	de
	push	hl
	call	_WrapText
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	de, -187
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	a, (iy + 1)
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 50)
	pop	ix
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de, hl
	ld	hl, _region
	add	hl, de
	ld	hl, (hl)
	ld	a, (iy + 2)
	ld	de, 0
	ld	e, a
	push	de
	push	hl
	ld	hl, _.str.7.397
	push	hl
	ld	hl, 80
	push	hl
	ld	de, -199
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_snprintf
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 54
	push	hl
	ld	hl, 8
	push	hl
	ld	de, -199
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	de, -174
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	hl, (iy + 3)
	ld	de, 4
	push	de
	ld	de, 304
	push	de
	ld	de, 72
	push	de
	ld	de, 8
	push	de
	push	hl
	call	_WrapText
	ld	bc, 80
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	de, -174
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	lea	hl, iy + 6
	ld	de, -178
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	ld	iy, 124
	.local	.LBB21_20
.LBB21_20:                              ;   Parent Loop BB21_7 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lea	hl, iy + 0
	ld	de, 148
	or	a, a
	sbc	hl, de
	jp	z, .LBB21_32
; %bb.21:                               ;   in Loop: Header=BB21_20 Depth=2
	ld	de, -193
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), iy
	ld	de, -178
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	ld	e, (hl)
	ld	a, e
	or	a, a
	jp	z, .LBB21_31
; %bb.22:                               ;   in Loop: Header=BB21_20 Depth=2
	or	a, a
	sbc	hl, hl
	ld	l, e
	ld	a, e
	cp	a, 7
	jr	c, .LBB21_24
; %bb.23:                               ;   in Loop: Header=BB21_20 Depth=2
	push	bc
	pop	iy
	ld	bc, 3
	call	__imulu
	ex	de, hl
	ld	hl, _effect_names
	add	hl, de
	ld	hl, (hl)
	push	hl
	ld	hl, _.str.8.398
	push	hl
	push	iy
	ld	de, -199
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_snprintf
	jp	.LBB21_30
	.local	.LBB21_24
.LBB21_24:                              ;   in Loop: Header=BB21_20 Depth=2
	push	ix
	lea	ix, ix - 128
	ld	iy, (ix - 50)
	pop	ix
	ld	a, (iy + 1)
	cp	a, -1
	jr	nz, .LBB21_26
; %bb.25:                               ;   in Loop: Header=BB21_20 Depth=2
	ld	bc, 3
	call	__imulu
	ex	de, hl
	ld	hl, _effect_names
	add	hl, de
	ld	hl, (hl)
	push	ix
	lea	ix, ix - 128
	ld	(ix - 68), hl
	pop	ix
	ld	hl, _disease
	push	hl
	push	iy
	ld	de, -174
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_EventAmount
	ex.sis	de, hl
	pop	hl
	pop	hl
	pop	hl
	ld	a, d
	rlc	a
	sbc	hl, hl
	ld	l, e
	ld	h, d
	push	hl
	ld	de, -196
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _.str.10.400
	jr	.LBB21_29
	.local	.LBB21_26
.LBB21_26:                              ;   in Loop: Header=BB21_20 Depth=2
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	bc, 22
	call	__imulu
	ex	de, hl
	ld	hl, _traits
	add	hl, de
	ld	hl, (hl)
	ld	de, -196
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	ld	l, a
	push	hl
	ld	hl, _disease
	push	hl
	call	_Owns
	pop	hl
	pop	hl
	bit	0, a
	ld	hl, 0
	jr	z, .LBB21_28
; %bb.27:                               ;   in Loop: Header=BB21_20 Depth=2
	ld	hl, _disease
	push	hl
	ld	de, -178
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -174
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_EventAmount
	ex.sis	de, hl
	pop	hl
	pop	hl
	pop	hl
	ld	a, d
	rlc	a
	sbc	hl, hl
	ld	l, e
	ld	h, d
	.local	.LBB21_28
.LBB21_28:                              ;   in Loop: Header=BB21_20 Depth=2
	push	hl
	ld	de, -196
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _.str.9.399
	.local	.LBB21_29
.LBB21_29:                              ;   in Loop: Header=BB21_20 Depth=2
	push	hl
	ld	hl, 80
	push	hl
	ld	de, -199
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_snprintf
	pop	hl
	.local	.LBB21_30
.LBB21_30:                              ;   in Loop: Header=BB21_20 Depth=2
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	de, -193
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, 8
	push	hl
	ld	de, -199
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	iy, 80
	lea	bc, iy + 0
	.local	.LBB21_31
.LBB21_31:                              ;   in Loop: Header=BB21_20 Depth=2
	ld	de, -178
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	lea	iy, iy + 3
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), iy
	ld	de, 12
	push	ix
	lea	ix, ix - 128
	ld	iy, (ix - 65)
	pop	ix
	add	iy, de
	jp	.LBB21_20
	.local	.LBB21_32
.LBB21_32:                              ;   in Loop: Header=BB21_7 Depth=1
	ld	de, -174
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	a, (iy + 23)
	cp	a, d
	jr	nz, .LBB21_36
; %bb.33:                               ;   in Loop: Header=BB21_7 Depth=1
	ld	a, (iy + 15)
	cp	a, 3
	jp	nz, .LBB21_39
; %bb.34:                               ;   in Loop: Header=BB21_7 Depth=1
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 59)
	pop	ix
	ld	a, (hl)
	ld	h, 0
	ld	l, a
	ld.sis	de, -100
	add.sis	hl, de
	ld.sis	bc, 5
	call	__srems
	ld.sis	de, 2
	or	a, a
	sbc.sis	hl, de
	call	pe, __setflag
	jp	p, .LBB21_39
; %bb.35:                               ;   in Loop: Header=BB21_7 Depth=1
	ld	hl, 2
	push	hl
	ld	hl, 304
	push	hl
	ld	hl, 151
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, _.str.14.404
	jp	.LBB21_43
	.local	.LBB21_36
.LBB21_36:                              ;   in Loop: Header=BB21_7 Depth=1
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	bc, 22
	call	__imulu
	ex	de, hl
	ld	hl, _traits
	add	hl, de
	ld	hl, (hl)
	ld	de, -174
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	ld	l, a
	push	hl
	ld	hl, _disease
	push	hl
	call	_Owns
	pop	hl
	pop	hl
	bit	0, a
	ld	hl, _.str.12.401
	jr	nz, .LBB21_38
; %bb.37:                               ;   in Loop: Header=BB21_7 Depth=1
	ld	hl, _.str.567
	.local	.LBB21_38
.LBB21_38:                              ;   in Loop: Header=BB21_7 Depth=1
	push	hl
	ld	de, -174
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _.str.11.403
	push	hl
	ld	hl, 80
	push	hl
	ld	de, -199
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_snprintf
	pop	hl
	jr	.LBB21_42
	.local	.LBB21_39
.LBB21_39:                              ;   in Loop: Header=BB21_7 Depth=1
	ld	e, (iy + 24)
	ld	a, e
	cp	a, 1
	jp	nz, .LBB21_47
; %bb.40:                               ;   in Loop: Header=BB21_7 Depth=1
	ld	a, (iy + 25)
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	bc, 22
	call	__imulu
	ex	de, hl
	ld	hl, _traits
	add	hl, de
	ld	hl, (hl)
	push	hl
	ld	hl, _.str.15.405
	.local	.LBB21_41
.LBB21_41:                              ;   in Loop: Header=BB21_7 Depth=1
	push	hl
	ld	hl, 80
	push	hl
	ld	de, -199
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_snprintf
	.local	.LBB21_42
.LBB21_42:                              ;   in Loop: Header=BB21_7 Depth=1
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 2
	push	hl
	ld	hl, 304
	push	hl
	ld	hl, 151
	push	hl
	ld	hl, 8
	push	hl
	ld	de, -199
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	.local	.LBB21_43
.LBB21_43:                              ;   in Loop: Header=BB21_7 Depth=1
	push	hl
	call	_WrapText
	pop	hl
	pop	hl
	.local	.LBB21_44
.LBB21_44:                              ;   in Loop: Header=BB21_7 Depth=1
	pop	hl
	pop	hl
	pop	hl
	ld	de, -187
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	a, (iy + 1)
	ld	iy, 0
	lea	hl, iy + 0
	ld	l, a
	add	hl, hl
	ex	de, hl
	ld	hl, _effects
	add	hl, de
	ld	de, (hl)
	ld	l, e
	ld	h, d
	ld.sis	bc, 100
	call	__sdivu
	ex	de, hl
	ld	iyl, e
	ld	iyh, d
	ex	de, hl
	ld.sis	bc, -100
	call	__smulu
	add.sis	hl, de
	ld	de, 0
	ld	e, l
	ld	d, h
	push	de
	push	iy
	ld	hl, _.str.24.409
	push	hl
	ld	hl, 80
	push	hl
	ld	de, -199
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_snprintf
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 178
	push	hl
	ld	hl, 8
	push	hl
	ld	de, -199
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	de, -187
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	a, (iy + 1)
	ld	bc, 0
	push	bc
	pop	hl
	ld	l, a
	add	hl, hl
	ex	de, hl
	ld	hl, _event_modifiers
	add	hl, de
	ld	hl, (hl)
	push	bc
	pop	iy
	ex	de, hl
	ld	iyl, e
	ld	iyh, d
	ex	de, hl
	ld	hl, _event_modifiers+14
	add	hl, de
	ld	hl, (hl)
	ld	c, l
	ld	b, h
	ld	hl, _event_modifiers+28
	add	hl, de
	ld	hl, (hl)
	ld	de, 0
	ld	e, l
	ld	d, h
	push	ix
	lea	ix, ix - 128
	ld	(ix - 46), de
	pop	ix
	push	de
	push	bc
	push	iy
	ld	hl, _.str.25.410
	push	hl
	ld	hl, 80
	push	hl
	ld	de, -199
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_snprintf
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 192
	push	hl
	ld	hl, 8
	push	hl
	ld	de, -199
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, _event_modifiers+44
	ld	hl, (hl)
	ld	de, -174
	lea	iy, ix + 0
	add	iy, de
	ld	bc, (iy + 0)
	ld	c, l
	ld	b, h
	ld	hl, _event_modifiers+42
	ld	hl, (hl)
	ld	de, 0
	ld	e, l
	ld	d, h
	push	de
	push	bc
	ld	hl, _.str.26.411
	push	hl
	ld	hl, 80
	push	hl
	ld	de, -199
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_snprintf
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 206
	push	hl
	ld	hl, 8
	push	hl
	ld	de, -199
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 1
	push	hl
	ld	hl, 224
	push	hl
	ld	hl, _.str.4.682
	push	hl
	call	_MenuItem
	pop	hl
	pop	hl
	pop	hl
	call	_gfx_SwapDraw
	.local	.LBB21_45
.LBB21_45:                              ;   Parent Loop BB21_7 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	call	_WaitKey
	ld	l, -5
	add	a, l
	ld	l, a
	cp	a, 2
	jr	nc, .LBB21_45
; %bb.46:                               ;   in Loop: Header=BB21_7 Depth=1
	call	_EndModal
	jp	.LBB21_7
	.local	.LBB21_47
.LBB21_47:                              ;   in Loop: Header=BB21_7 Depth=1
	ld	a, (iy + 26)
	cp	a, -1
	ld	iy, 8
	lea	bc, iy + 0
	jr	nz, .LBB21_49
; %bb.48:                               ;   in Loop: Header=BB21_7 Depth=1
	ld	hl, 151
	push	hl
	push	bc
	ld	hl, _.str.16.406
	jr	.LBB21_51
	.local	.LBB21_49
.LBB21_49:                              ;   in Loop: Header=BB21_7 Depth=1
	ld	a, e
	or	a, a
	jr	nz, .LBB21_52
; %bb.50:                               ;   in Loop: Header=BB21_7 Depth=1
	ld	hl, 151
	push	hl
	push	bc
	ld	hl, _.str.17.407
	.local	.LBB21_51
.LBB21_51:                              ;   in Loop: Header=BB21_7 Depth=1
	push	hl
	call	_Text
	jp	.LBB21_44
	.local	.LBB21_52
.LBB21_52:                              ;   in Loop: Header=BB21_7 Depth=1
	or	a, a
	sbc	hl, hl
	ld	l, e
	ld	bc, 3
	call	__imulu
	ex	de, hl
	ld	hl, _EventDetail.checks
	add	hl, de
	ld	hl, (hl)
	push	hl
	ld	hl, _.str.23.408
	jp	.LBB21_41
	.local	.LBB21_53
.LBB21_53:
	call	_EndModal
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end21
.Lfunc_end21:
	.size	_WorldEventsMenu, .Lfunc_end21-_WorldEventsMenu
                                        ; -- End function
	.section	.text._EventsOccurred,"ax",@progbits
	.globl	_EventsOccurred                 ; -- Begin function EventsOccurred
	.type	_EventsOccurred,@function
_EventsOccurred:                        ; @EventsOccurred
; %bb.0:
	call	__frameset0
	ld	a, (ix + 9)
	cp	a, -56
	jr	nc, .LBB22_3
; %bb.1:
	ld	iy, (ix + 6)
	ld	de, 1
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	c, 3
	call	__ishru
	push	hl
	pop	bc
	add	iy, bc
	ld	b, (iy + 12)
	ld	l, 7
	and	a, l
	ld	c, a
	ex	de, hl
	call	__ishl
	ld	a, l
	and	a, b
	ld	l, a
	or	a, a
	jr	nz, .LBB22_4
; %bb.2:
	ld	a, 0
	jr	.LBB22_5
	.local	.LBB22_3
.LBB22_3:
	xor	a, a
	jr	.LBB22_5
	.local	.LBB22_4
.LBB22_4:
	ld	a, -1
	.local	.LBB22_5
.LBB22_5:
	pop	ix
	ret
	.local	.Lfunc_end22
.Lfunc_end22:
	.size	_EventsOccurred, .Lfunc_end22-_EventsOccurred
                                        ; -- End function
	.section	.text._EventsInit,"ax",@progbits
	.globl	_EventsInit                     ; -- Begin function EventsInit
	.type	_EventsInit,@function
_EventsInit:                            ; @EventsInit
; %bb.0:
	call	__frameset0
	ld	iy, (ix + 6)
	ld	a, (ix + 15)
	lea	hl, iy + 4
	ld	(iy + 4), 0
	push	hl
	pop	de
	inc	de
	ld	bc, 45
	ldir
	ld	hl, (ix + 12)
	ld	e, a
	call	__lcmpzero
	jr	z, .LBB23_2
; %bb.1:
	ld	c, 0
	jr	.LBB23_3
	.local	.LBB23_2
.LBB23_2:
	ld	c, 1
	.local	.LBB23_3
.LBB23_3:
	bit	0, c
	jr	z, .LBB23_5
; %bb.4:
	ld	hl, 3635641
	.local	.LBB23_5
.LBB23_5:
	bit	0, c
	jr	z, .LBB23_7
; %bb.6:
	ld	a, -98
	.local	.LBB23_7
.LBB23_7:
	ld	(iy), hl
	ld	(iy + 3), a
	lea	de, iy + 0
	ld	hl, (ix + 9)
	push	hl
	pop	bc
	push	bc
	pop	iy
	ld	hl, (iy + 8)
	ld	a, (iy + 11)
	push	de
	pop	iy
	ld	(iy + 4), hl
	ld	(iy + 7), a
	ld	de, 24
	add	hl, de
	adc	a, d
	ld	c, a
                                        ; kill: def $a killed $a
	sbc	a, a
	bit	0, a
	jr	z, .LBB23_9
; %bb.8:
	scf
	sbc	hl, hl
	.local	.LBB23_9
.LBB23_9:
	ld	b, 5
	bit	0, a
	jr	z, .LBB23_11
; %bb.10:
	ld	c, -1
	.local	.LBB23_11
.LBB23_11:
	ld	de, 0
	ld	iy, (ix + 6)
	ld	(iy + 8), hl
	ld	(iy + 11), c
	ld	iy, (ix + 9)
	ld	a, (iy + 4)
	call	__bshru
	ld	l, 3
	and	a, l
	ld	l, a
	ld	iy, (ix + 6)
	ld	(iy + 37), l
	ld	bc, 12
	.local	.LBB23_12
.LBB23_12:                              ; =>This Inner Loop Header: Depth=1
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	jr	z, .LBB23_14
; %bb.13:                               ;   in Loop: Header=BB23_12 Depth=1
	ld	iy, (ix + 6)
	add	iy, de
	ld	(iy + 38), -1
	ld	(iy + 40), 0
	ld	(iy + 39), 0
	ex	de, hl
	ld	de, 3
	add	hl, de
	ex	de, hl
	jr	.LBB23_12
	.local	.LBB23_14
.LBB23_14:
	pop	ix
	ret
	.local	.Lfunc_end23
.Lfunc_end23:
	.size	_EventsInit, .Lfunc_end23-_EventsInit
                                        ; -- End function
	.section	.text._EventsValidate,"ax",@progbits
	.globl	_EventsValidate                 ; -- Begin function EventsValidate
	.type	_EventsValidate,@function
_EventsValidate:                        ; @EventsValidate
; %bb.0:
	ld	hl, -25
	call	__frameset
	ld	iy, (ix + 6)
	xor	a, a
	ld	hl, (iy)
	ld	e, (iy + 3)
	call	__lcmpzero
	jp	z, .LBB24_22
; %bb.1:
	ld	hl, (ix + 9)
	ld	bc, (iy + 4)
	ld	a, (iy + 7)
	ex	de, hl
	push	de
	pop	iy
	ld	hl, (iy + 8)
	ld	d, (iy + 11)
	push	hl
	pop	iy
	ld	e, d
	call	__lsub
	ld	(ix - 3), hl
	ld	(ix - 6), e                     ; 1-byte Folded Spill
	lea	hl, iy + 0
	ld	e, d
	push	bc
	pop	iy
	ld	(ix - 9), a                     ; 1-byte Folded Spill
	call	__lcmpu
	jp	c, .LBB24_21
; %bb.2:
	ld	hl, 1
	ld	e, h
	ld	bc, (ix - 3)
	ld	a, (ix - 6)                     ; 1-byte Folded Reload
	call	__lcmpu
	jp	c, .LBB24_21
; %bb.3:
	ld	(ix - 3), e                     ; 1-byte Folded Spill
	ld	de, 24
	lea	hl, iy + 0
	add	hl, de
	ld	a, (ix - 9)                     ; 1-byte Folded Reload
	adc	a, d
	ld	e, a
                                        ; kill: def $a killed $a
	sbc	a, a
	bit	0, a
	jr	z, .LBB24_5
; %bb.4:
	scf
	sbc	hl, hl
	.local	.LBB24_5
.LBB24_5:
	ld	iy, (ix + 6)
	ld	bc, (iy + 8)
	bit	0, a
	jr	z, .LBB24_7
; %bb.6:
	ld	e, -1
	.local	.LBB24_7
.LBB24_7:
	ld	a, (iy + 11)
	call	__lcmpu
	jp	c, .LBB24_21
; %bb.8:
	ld	c, (iy + 37)
	ld	a, c
	cp	a, 4
	jp	nc, .LBB24_21
; %bb.9:
	lea	de, iy + 0
	ld	l, 3
	ld	b, 5
	ld	iy, (ix + 9)
	ld	a, (iy + 4)
	call	__bshru
	and	a, l
	ld	l, a
	ld	a, c
	cp	a, l
	jp	nz, .LBB24_21
; %bb.10:                               ; %.preheader.preheader
	ld	(ix - 9), c                     ; 1-byte Folded Spill
	ld	bc, 16
	or	a, a
	sbc	hl, hl
	ld	(ix - 18), hl
	ld	l, 100
	.local	.LBB24_11
.LBB24_11:                              ; %.preheader
                                        ; =>This Inner Loop Header: Depth=1
	ld	a, l
	cp	a, -56
	jp	nc, .LBB24_23
; %bb.12:                               ;   in Loop: Header=BB24_11 Depth=1
	push	hl
	push	de
	ld	(ix - 6), hl
	call	_EventsOccurred
	ld	(ix - 22), a                    ; 1-byte Folded Spill
	pop	hl
	pop	hl
	ld	hl, (ix - 6)
                                        ; kill: def $l killed $l killed $uhl def $uhl
	inc	l
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_EventsOccurred
	ld	(ix - 15), a                    ; 1-byte Folded Spill
	pop	hl
	pop	hl
	ld	l, 2
	ld	de, (ix - 6)
	ld	a, e
	add	a, l
	ld	l, a
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_EventsOccurred
	ld	(ix - 21), a                    ; 1-byte Folded Spill
	pop	hl
	pop	hl
	ld	l, 3
	ld	de, (ix - 6)
	ld	a, e
	add	a, l
	ld	l, a
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_EventsOccurred
	ld	(ix - 12), a                    ; 1-byte Folded Spill
	pop	hl
	pop	hl
	ld	l, 4
	ld	de, (ix - 6)
	ld	a, e
	add	a, l
	ld	l, a
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_EventsOccurred
	ld	l, a
	pop	de
	pop	de
	ld	e, 1
	ld	a, (ix - 15)
	xor	a, e
	ld	e, a
	bit	0, e
	jr	nz, .LBB24_14
; %bb.13:                               ;   in Loop: Header=BB24_11 Depth=1
	bit	0, (ix - 22)                    ; 1-byte Folded Reload
	jr	z, .LBB24_21
	.local	.LBB24_14
.LBB24_14:                              ;   in Loop: Header=BB24_11 Depth=1
	ld	h, (ix - 21)                    ; 1-byte Folded Reload
	ld	c, (ix - 12)
	ld	a, h
	or	a, c
	ld	c, a
	bit	0, c
	jr	z, .LBB24_16
; %bb.15:                               ;   in Loop: Header=BB24_11 Depth=1
	bit	0, e
	jr	nz, .LBB24_21
	.local	.LBB24_16
.LBB24_16:                              ;   in Loop: Header=BB24_11 Depth=1
	bit	0, h
	jr	z, .LBB24_18
; %bb.17:                               ;   in Loop: Header=BB24_11 Depth=1
	bit	0, (ix - 12)                    ; 1-byte Folded Reload
	jr	nz, .LBB24_21
	.local	.LBB24_18
.LBB24_18:                              ;   in Loop: Header=BB24_11 Depth=1
	ld	a, 5
	ld	e, a
	ld	bc, (ix - 6)
	ld	a, c
	add	a, e
	ld	c, a
	bit	0, l
	push	bc
	pop	hl
	ld	iy, (ix + 6)
	lea	de, iy + 0
	ld	bc, 16
	jp	z, .LBB24_11
; %bb.19:                               ;   in Loop: Header=BB24_11 Depth=1
	bit	0, (ix - 21)                    ; 1-byte Folded Reload
	jp	nz, .LBB24_11
; %bb.20:                               ;   in Loop: Header=BB24_11 Depth=1
	bit	0, (ix - 12)                    ; 1-byte Folded Reload
	jp	nz, .LBB24_11
	.local	.LBB24_21
.LBB24_21:
	xor	a, a
	.local	.LBB24_22
.LBB24_22:                              ; %.loopexit
	ld	sp, ix
	pop	ix
	ret
	.local	.LBB24_23
.LBB24_23:
	ld	de, 0
	ld	e, (ix - 9)                     ; 1-byte Folded Reload
	push	de
	pop	hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	call	__iand
	push	hl
	pop	iy
	ex	de, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	call	__iand
	ex	de, hl
	add	iy, de
	ld	de, 4
	ld	bc, 0
	ld	(ix - 6), bc
	.local	.LBB24_24
.LBB24_24:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB24_40 Depth 2
                                        ;     Child Loop BB24_48 Depth 2
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	jp	z, .LBB24_50
; %bb.25:                               ;   in Loop: Header=BB24_24 Depth=1
	ld	(ix - 9), iy
	ld	(ix - 12), bc
	push	bc
	pop	hl
	ld	bc, 3
	call	__imulu
	ex	de, hl
	ld	iy, (ix + 6)
	add	iy, de
	ld	d, (iy + 38)
	ld	a, d
	cp	a, -1
	jr	nz, .LBB24_29
; %bb.26:                               ;   in Loop: Header=BB24_24 Depth=1
	ld	a, (iy + 39)
	or	a, a
	jr	nz, .LBB24_21
; %bb.27:                               ;   in Loop: Header=BB24_24 Depth=1
	ld	a, (iy + 40)
	or	a, a
	jr	nz, .LBB24_21
	.local	.LBB24_28
.LBB24_28:                              ; %.loopexit11
                                        ;   in Loop: Header=BB24_24 Depth=1
	ld	bc, (ix - 12)
	inc	bc
	ld	de, 3
	ld	hl, (ix - 6)
	add	hl, de
	ld	(ix - 6), hl
	ld	iy, (ix - 9)
	inc	de
	jr	.LBB24_24
	.local	.LBB24_29
.LBB24_29:                              ;   in Loop: Header=BB24_24 Depth=1
	ld	a, d
	cp	a, -56
	jr	nc, .LBB24_21
; %bb.30:                               ;   in Loop: Header=BB24_24 Depth=1
	ld	a, (iy + 39)
	cp	a, 7
	jp	nc, .LBB24_21
; %bb.31:                               ;   in Loop: Header=BB24_24 Depth=1
	ld	e, (iy + 40)
	ld	a, e
	or	a, a
	jp	z, .LBB24_21
; %bb.32:                               ;   in Loop: Header=BB24_24 Depth=1
	or	a, a
	sbc	hl, hl
	ld	l, d
	ld	(ix - 25), hl
	ld	bc, 28
	call	__imulu
	push	hl
	pop	bc
	ld	iy, _event_catalog
	add	iy, bc
	ld	a, (iy + 16)
	ld	(ix - 15), a
	ld	a, (iy + 15)
	ld	(ix - 22), a                    ; 1-byte Folded Spill
	cp	a, 3
	ld	hl, 0
	jr	nz, .LBB24_35
; %bb.33:                               ;   in Loop: Header=BB24_24 Depth=1
	ld	l, -100
	ld	a, d
	add	a, l
	ld	l, a
	ld	c, 5
	call	__brems
	cp	a, 2
	call	pe, __setflag
	ld	hl, (ix - 9)
	jp	m, .LBB24_35
; %bb.34:                               ;   in Loop: Header=BB24_24 Depth=1
	or	a, a
	sbc	hl, hl
	.local	.LBB24_35
.LBB24_35:                              ;   in Loop: Header=BB24_24 Depth=1
	ld	(ix - 21), d                    ; 1-byte Folded Spill
	ld	iy, 0
	lea	bc, iy + 0
	ld	c, e
	lea	de, iy + 0
	ld	e, (ix - 15)                    ; 1-byte Folded Reload
	add	hl, de
	or	a, a
	sbc	hl, bc
	jp	c, .LBB24_21
; %bb.36:                               ;   in Loop: Header=BB24_24 Depth=1
	ld	l, (ix - 21)                    ; 1-byte Folded Reload
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_EventsOccurred
	pop	hl
	pop	hl
	bit	0, a
	jp	z, .LBB24_21
; %bb.37:                               ;   in Loop: Header=BB24_24 Depth=1
	ld	a, (ix - 22)                    ; 1-byte Folded Reload
	cp	a, -1
	ld	l, 1
	jr	nz, .LBB24_39
; %bb.38:                               ;   in Loop: Header=BB24_24 Depth=1
	ld	l, 0
	.local	.LBB24_39
.LBB24_39:                              ;   in Loop: Header=BB24_24 Depth=1
	ld	e, (ix - 3)
	ld	a, e
	add	a, l
	ld	e, a
	ld	(ix - 3), e
	ld	de, 0
	.local	.LBB24_40
.LBB24_40:                              ;   Parent Loop BB24_24 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ld	hl, (ix - 6)
	or	a, a
	sbc	hl, de
	jr	z, .LBB24_46
; %bb.41:                               ;   in Loop: Header=BB24_40 Depth=2
	ld	iy, (ix + 6)
	add	iy, de
	ld	c, (iy + 38)
	ld	a, c
	cp	a, -1
	jr	nz, .LBB24_43
	.local	.LBB24_42
.LBB24_42:                              ;   in Loop: Header=BB24_40 Depth=2
	ex	de, hl
	ld	de, 3
	add	hl, de
	ex	de, hl
	jr	.LBB24_40
	.local	.LBB24_43
.LBB24_43:                              ;   in Loop: Header=BB24_40 Depth=2
	ld	a, c
	ld	l, (ix - 21)
	cp	a, l
	jp	z, .LBB24_21
; %bb.44:                               ;   in Loop: Header=BB24_40 Depth=2
	ld	a, (ix - 22)                    ; 1-byte Folded Reload
	cp	a, -1
	jr	z, .LBB24_42
; %bb.45:                               ;   in Loop: Header=BB24_40 Depth=2
	or	a, a
	sbc	hl, hl
	ld	l, c
	ld	bc, 28
	call	__imulu
	push	hl
	pop	bc
	ld	iy, _event_catalog
	add	iy, bc
	ld	a, (iy + 15)
	ld	l, (ix - 22)
	cp	a, l
	jp	z, .LBB24_21
	jr	.LBB24_42
	.local	.LBB24_46
.LBB24_46:                              ;   in Loop: Header=BB24_24 Depth=1
	ld	a, (ix - 21)                    ; 1-byte Folded Reload
	cp	a, 100
	jp	c, .LBB24_28
; %bb.47:                               ;   in Loop: Header=BB24_24 Depth=1
	ld	de, -100
	ld	hl, (ix - 25)
	add	hl, de
	ld	bc, 5
	call	__iremu
                                        ; kill: def $l killed $l killed $uhl
	ld	d, (ix - 21)                    ; 1-byte Folded Reload
	ld	a, d
	sub	a, l
	ld	e, a
	or	a, a
	sbc	hl, hl
	ld	l, e
	add	hl, bc
	ld	(ix - 15), hl
	inc	d
	ld	c, d
	.local	.LBB24_48
.LBB24_48:                              ;   Parent Loop BB24_24 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	or	a, a
	sbc	hl, hl
	ld	l, c
	ld	de, (ix - 15)
	sbc	hl, de
	jp	nc, .LBB24_28
; %bb.49:                               ;   in Loop: Header=BB24_48 Depth=2
	ld	(ix - 21), bc
	push	bc
	ld	hl, (ix + 6)
	push	hl
	call	_EventsOccurred
	pop	hl
	pop	hl
	ld	bc, (ix - 21)
	inc	c
	bit	0, a
	jp	nz, .LBB24_21
	jr	.LBB24_48
	.local	.LBB24_50
.LBB24_50:
	ld	a, (ix - 3)                     ; 1-byte Folded Reload
	cp	a, 3
	ld	a, 0
	jp	nc, .LBB24_22
; %bb.51:
	ld	iy, (ix + 9)
	ld	a, (iy + 33)
	or	a, a
	ld	a, 1
	jp	nz, .LBB24_22
; %bb.52:
	ld	de, 25
	ld	c, -1
	ld	b, d
	.local	.LBB24_53
.LBB24_53:                              ; =>This Inner Loop Header: Depth=1
	ld	hl, (ix - 18)
	or	a, a
	sbc	hl, de
	ld	a, c
	jr	z, .LBB24_55
; %bb.54:                               ;   in Loop: Header=BB24_53 Depth=1
	ld	a, b
	.local	.LBB24_55
.LBB24_55:                              ;   in Loop: Header=BB24_53 Depth=1
	bit	0, a
	jp	nz, .LBB24_22
; %bb.56:                               ;   in Loop: Header=BB24_53 Depth=1
	ld	iy, (ix + 6)
	ex	de, hl
	ld	de, (ix - 18)
	add	iy, de
	inc	de
	ld	(ix - 18), de
	ex	de, hl
	ld	l, a
	ld	a, (iy + 12)
	or	a, a
	ld	a, l
	jr	z, .LBB24_53
	jp	.LBB24_22
	.local	.Lfunc_end24
.Lfunc_end24:
	.size	_EventsValidate, .Lfunc_end24-_EventsValidate
                                        ; -- End function
	.section	.text._EventsEligible,"ax",@progbits
	.globl	_EventsEligible                 ; -- Begin function EventsEligible
	.type	_EventsEligible,@function
_EventsEligible:                        ; @EventsEligible
; %bb.0:
	ld	hl, -16
	call	__frameset
	ld	d, 0
	ld	a, (ix + 15)
	cp	a, 7
	jr	nc, .LBB25_6
; %bb.1:
	ld	iy, (ix + 9)
	ld	a, (iy + 33)
	or	a, a
	jr	z, .LBB25_6
; %bb.2:
	ld	a, (iy + 34)
	or	a, a
	jr	nz, .LBB25_6
; %bb.3:
	ld	bc, (ix + 6)
	ld	hl, (iy + 8)
	ld	e, (iy + 11)
	push	bc
	pop	iy
	ld	iy, (iy + 12)
	xor	a, a
	ld	(ix - 1), a
	ld	bc, (ix - 3)
	ld	b, iyh
	ld	c, iyl
	ld	iy, 0
	ld	a, iyl
	call	__lcmpu
	jr	c, .LBB25_6
; %bb.4:
	ld	hl, (ix + 9)
	push	hl
	pop	iy
	ld	a, (iy + 35)
	ld	iy, (ix + 6)
	ld	l, (iy + 18)
	cp	a, l
	jr	c, .LBB25_6
; %bb.5:
	ld	(ix - 5), a                     ; 1-byte Folded Spill
	ld	hl, 1
	ld	e, (iy + 20)
	ld	iy, (ix + 9)
	ld	c, (iy + 32)
	call	__ishl
	ld	a, l
	and	a, e
	ld	l, a
	or	a, a
	jr	nz, .LBB25_7
	.local	.LBB25_6
.LBB25_6:                               ; %.thread18
	ld	a, d
	ld	sp, ix
	pop	ix
	ret
	.local	.LBB25_7
.LBB25_7:
	ld	iy, (ix + 6)
	ld	a, (iy + 19)
	cp	a, -1
	jr	z, .LBB25_9
; %bb.8:
	ld	l, a
	push	hl
	ld	hl, (ix + 9)
	push	hl
	call	_Owns
	pop	hl
	pop	hl
	bit	0, a
	jr	z, .LBB25_12
	.local	.LBB25_9
.LBB25_9:
	ld	iy, (ix + 12)
	ld	hl, _environments
	ld	(ix - 4), hl
	ld	de, 0
	ld	e, (ix + 15)
	ld	bc, 6
	push	de
	pop	hl
	call	__imulu
	push	hl
	pop	bc
	add	iy, bc
	ld	hl, (iy)
	ld	(ix - 8), hl
	ld	hl, (iy + 2)
	ld	(ix - 11), hl
	ld	hl, (iy + 4)
	ld	(ix - 14), hl
	ld	bc, 7
	ex	de, hl
	call	__imulu
	ex	de, hl
	ld	hl, (ix - 4)
	add	hl, de
	ld	(ix - 4), hl
	ld	hl, (ix - 8)
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	ld	d, b
	ld	iy, (ix + 6)
	jr	nz, .LBB25_15
; %bb.10:
	ld	hl, (ix - 11)
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	jr	nz, .LBB25_13
; %bb.11:
	ld	a, 0
	jr	.LBB25_14
	.local	.LBB25_12
.LBB25_12:
	ld	d, 0
	jp	.LBB25_6
	.local	.LBB25_13
.LBB25_13:
	ld	a, -1
	.local	.LBB25_14
.LBB25_14:
	bit	0, a
	jp	z, .LBB25_6
	.local	.LBB25_15
.LBB25_15:
	ld	e, (iy + 21)
	ld	a, e
	or	a, a
	jp	z, .LBB25_19
; %bb.16:
	ld	hl, (ix - 11)
                                        ; kill: def $hl killed $hl killed $uhl
	ld	bc, (ix - 8)
	add.sis	hl, bc
	ld	bc, (ix - 14)
	add.sis	hl, bc
	ex	de, hl
	ld	iyl, e
	ld	iyh, d
	ex	de, hl
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	ld	a, 0
	ld	l, a
	jr	z, .LBB25_18
; %bb.17:
	or	a, a
	sbc	hl, hl
	ld	bc, (ix - 11)
	ld	l, c
	ld	h, b
	ld	bc, 100
	call	__imulu
	ld	bc, 0
	ld	c, iyl
	ld	b, iyh
	call	__idivu
	.local	.LBB25_18
.LBB25_18:                              ; %Percentage.exit
	ld	a, l
	cp	a, e
	jp	c, .LBB25_6
	.local	.LBB25_19
.LBB25_19:
	ld	iy, (ix + 6)
	ld	e, (iy + 22)
	ld	a, e
	or	a, a
	jp	z, .LBB25_23
; %bb.20:
	ld	hl, (ix - 11)
                                        ; kill: def $hl killed $hl killed $uhl
	ld	bc, (ix - 8)
	add.sis	hl, bc
	ld	bc, (ix - 14)
	add.sis	hl, bc
	ld	(ix - 16), l
	ld	(ix - 15), h
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	ld	a, 0
	ld	l, a
	jr	z, .LBB25_22
; %bb.21:
	ld	iy, 0
	lea	hl, iy + 0
	ld	l, c
	ld	h, b
	ld	bc, 100
	call	__imulu
	lea	bc, iy + 0
	ld	iyl, d
	ld	a, e
	ld	e, (ix - 16)
	ld	d, (ix - 15)
	ld	c, e
	ld	b, d
	ld	e, a
	ld	d, iyl
	call	__idivu
	.local	.LBB25_22
.LBB25_22:                              ; %Percentage.exit10
	ld	a, l
	cp	a, e
	jp	c, .LBB25_6
	.local	.LBB25_23
.LBB25_23:
	ld	iy, (ix + 6)
	ld	a, (iy + 17)
	dec	a
	cp	a, 11
	jr	nc, .LBB25_40
; %bb.24:
	ld	de, 0
	ld	e, a
	ld	hl, JTI25_0
	add	hl, de
	add	hl, de
	add	hl, de
	ld	hl, (hl)
	jp	(hl)
	.local	.LBB25_25
.LBB25_25:
	ld	hl, (ix - 11)
	jr	.LBB25_32
	.local	.LBB25_26
.LBB25_26:
	ld	iy, (ix - 4)
	ld	a, (iy + 2)
	jr	.LBB25_39
	.local	.LBB25_27
.LBB25_27:
	ld	hl, 2
	jr	.LBB25_36
	.local	.LBB25_28
.LBB25_28:
	ld	hl, (ix - 4)
	ld	a, (hl)
	jr	.LBB25_39
	.local	.LBB25_29
.LBB25_29:
	ld	iy, (ix - 4)
	ld	a, (iy + 1)
	jr	.LBB25_39
	.local	.LBB25_30
.LBB25_30:
	ld	iy, (ix - 4)
	ld	a, (iy + 5)
	jr	.LBB25_39
	.local	.LBB25_31
.LBB25_31:
	ld	hl, (ix - 8)
	.local	.LBB25_32
.LBB25_32:
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	jr	.LBB25_37
	.local	.LBB25_33
.LBB25_33:
	ld	iy, (ix - 4)
	ld	a, (iy + 3)
	jr	.LBB25_39
	.local	.LBB25_34
.LBB25_34:
	ld	iy, (ix - 4)
	ld	a, (iy + 4)
	jr	.LBB25_39
	.local	.LBB25_35
.LBB25_35:
	ld	hl, 1
	.local	.LBB25_36
.LBB25_36:
	push	hl
	ld	l, (ix + 15)
	push	hl
	call	_Capable
	pop	hl
	pop	hl
	bit	0, a
	.local	.LBB25_37
.LBB25_37:
	ld	d, 0
	jp	z, .LBB25_6
	jr	.LBB25_40
	.local	.LBB25_38
.LBB25_38:
	ld	iy, (ix - 4)
	ld	a, (iy + 6)
	.local	.LBB25_39
.LBB25_39:
	cp	a, 3
	ld	d, 0
	jp	c, .LBB25_6
	.local	.LBB25_40
.LBB25_40:
	ld	bc, 0
	ld	a, -1
	ld	l, b
	ld	(ix - 8), l
	.local	.LBB25_41
.LBB25_41:                              ; =>This Inner Loop Header: Depth=1
	push	bc
	pop	hl
	ld	de, 6
	or	a, a
	sbc	hl, de
	ld	d, a
	ld	iy, (ix + 6)
	jr	nz, .LBB25_43
; %bb.42:                               ;   in Loop: Header=BB25_41 Depth=1
	ld	d, 0
	.local	.LBB25_43
.LBB25_43:                              ;   in Loop: Header=BB25_41 Depth=1
	push	bc
	pop	hl
	ld	(ix - 4), bc
	ld	bc, 6
	or	a, a
	sbc	hl, bc
	jp	z, .LBB25_6
; %bb.44:                               ;   in Loop: Header=BB25_41 Depth=1
	ld	bc, (ix - 4)
	add	iy, bc
	ld	l, (iy + 6)
	ld	a, l
	or	a, a
	jr	z, .LBB25_46
; %bb.45:                               ;   in Loop: Header=BB25_41 Depth=1
	ld	a, (iy + 8)
	or	a, a
	jr	nz, .LBB25_47
	.local	.LBB25_46
.LBB25_46:                              ;   in Loop: Header=BB25_41 Depth=1
	push	bc
	pop	hl
	ld	de, 3
	add	hl, de
	push	hl
	pop	bc
	ld	a, -1
	jr	.LBB25_41
	.local	.LBB25_47
.LBB25_47:                              ;   in Loop: Header=BB25_41 Depth=1
	ld	a, (iy + 7)
	cp	a, -1
	jr	nz, .LBB25_50
; %bb.48:                               ;   in Loop: Header=BB25_41 Depth=1
	ld	a, l
	cp	a, 4
	jp	nz, .LBB25_54
	.local	.LBB25_49
.LBB25_49:                              ;   in Loop: Header=BB25_41 Depth=1
	ld	iy, (ix + 9)
	ld	hl, (iy)
	ld	e, (iy + 3)
	push	bc
	pop	iy
	ld	bc, 1024
	xor	a, a
	call	__land
	lea	bc, iy + 0
	ld	a, h
	ld	l, (ix - 8)
	cp	a, l
	jp	nz, .LBB25_6
	jr	.LBB25_46
	.local	.LBB25_50
.LBB25_50:                              ;   in Loop: Header=BB25_41 Depth=1
	ld	(ix - 14), l                    ; 1-byte Folded Spill
	ld	(ix - 16), a                    ; 1-byte Folded Spill
	ld	l, a
	push	hl
	ld	hl, (ix + 9)
	push	hl
	ld	(ix - 11), d                    ; 1-byte Folded Spill
	call	_Owns
	ld	bc, (ix - 4)
	ld	d, (ix - 11)                    ; 1-byte Folded Reload
	pop	hl
	pop	hl
	ld	l, (ix - 14)                    ; 1-byte Folded Reload
	bit	0, a
	jr	z, .LBB25_46
; %bb.51:                               ; %.thread
                                        ;   in Loop: Header=BB25_41 Depth=1
	dec	l
	ld	a, l
	cp	a, 6
	jp	nc, .LBB25_6
; %bb.52:                               ; %.thread
                                        ;   in Loop: Header=BB25_41 Depth=1
	ld	de, 0
	ld	e, l
	ld	hl, JTI25_1
	add	hl, de
	add	hl, de
	add	hl, de
	ld	d, (ix - 11)                    ; 1-byte Folded Reload
	ld	hl, (hl)
	jp	(hl)
	.local	.LBB25_53
.LBB25_53:                              ;   in Loop: Header=BB25_41 Depth=1
	ld	l, (ix - 16)                    ; 1-byte Folded Reload
	push	hl
	ld	l, (ix + 15)
	push	hl
	ld	hl, (ix + 9)
	push	hl
	call	_TransmissionContribution
	ld	bc, (ix - 4)
	pop	de
	pop	de
	pop	de
	ld	d, (ix - 11)                    ; 1-byte Folded Reload
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	jp	nz, .LBB25_6
	jp	.LBB25_46
	.local	.LBB25_54
.LBB25_54:                              ;   in Loop: Header=BB25_41 Depth=1
	ld	a, l
	cp	a, 5
	jr	nz, .LBB25_56
	.local	.LBB25_55
.LBB25_55:                              ;   in Loop: Header=BB25_41 Depth=1
	ld	a, (ix - 5)                     ; 1-byte Folded Reload
	or	a, a
	jp	z, .LBB25_6
	jp	.LBB25_46
	.local	.LBB25_56
.LBB25_56:                              ;   in Loop: Header=BB25_41 Depth=1
	ld	a, l
	cp	a, 6
	jp	nz, .LBB25_6
	.local	.LBB25_57
.LBB25_57:                              ;   in Loop: Header=BB25_41 Depth=1
	ld	a, (ix - 5)                     ; 1-byte Folded Reload
	cp	a, 2
	jp	nc, .LBB25_6
	jp	.LBB25_46
	.local	.Lfunc_end25
.Lfunc_end25:
	.size	_EventsEligible, .Lfunc_end25-_EventsEligible
	.section	.rodata._EventsEligible,"a",@progbits
JTI25_0:
	d24	.LBB25_25
	d24	.LBB25_31
	d24	.LBB25_28
	d24	.LBB25_29
	d24	.LBB25_26
	d24	.LBB25_33
	d24	.LBB25_34
	d24	.LBB25_30
	d24	.LBB25_38
	d24	.LBB25_27
	d24	.LBB25_35
JTI25_1:
	d24	.LBB25_53
	d24	.LBB25_6
	d24	.LBB25_6
	d24	.LBB25_49
	d24	.LBB25_55
	d24	.LBB25_57
                                        ; -- End function
	.section	.text._Capable,"ax",@progbits
	.type	_Capable,@function              ; -- Begin function Capable
_Capable:                               ; @Capable
; %bb.0:
	call	__frameset0
	ld	iy, _port_definitions+3
	ld	de, 0
	ld	bc, 22
	.local	.LBB26_1
.LBB26_1:                               ; =>This Inner Loop Header: Depth=1
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	jr	z, .LBB26_5
; %bb.2:                                ;   in Loop: Header=BB26_1 Depth=1
	ld	a, (iy - 1)
	ld	l, (ix + 6)
	cp	a, l
	jr	nz, .LBB26_4
; %bb.3:                                ;   in Loop: Header=BB26_1 Depth=1
	ld	a, (iy)
	ld	l, (ix + 9)
	and	a, l
	ld	l, a
	or	a, a
	jr	nz, .LBB26_5
	.local	.LBB26_4
.LBB26_4:                               ;   in Loop: Header=BB26_1 Depth=1
	inc	de
	lea	iy, iy + 6
	jr	.LBB26_1
	.local	.LBB26_5
.LBB26_5:
	ex	de, hl
	or	a, a
	sbc	hl, bc
                                        ; kill: def $a killed $a
	sbc	a, a
	pop	ix
	ret
	.local	.Lfunc_end26
.Lfunc_end26:
	.size	_Capable, .Lfunc_end26-_Capable
                                        ; -- End function
	.section	.text._EventsRefreshTraits,"ax",@progbits
	.globl	_EventsRefreshTraits            ; -- Begin function EventsRefreshTraits
	.type	_EventsRefreshTraits,@function
_EventsRefreshTraits:                   ; @EventsRefreshTraits
; %bb.0:
	ld	hl, -5
	call	__frameset
	ld	de, (ix + 6)
	ld	iy, (ix + 9)
	ld	b, 5
	ld	l, 3
	ld	h, -1
	ld	c, 1
	ld	a, (iy + 4)
	push	de
	pop	iy
	call	__bshru
	and	a, l
	ld	e, a
	ld	a, (iy + 37)
	xor	a, h
	ld	l, a
	ld	(ix - 1), e                     ; 1-byte Folded Spill
	ld	a, e
	and	a, l
	ld	l, a
	ld	a, l
	and	a, c
	ld	e, a
	ld	a, l
	cp	a, 2
                                        ; kill: def $a killed $a
	sbc	a, a
	ld	l, a
	inc	l
	ld	a, e
	add	a, l
	ld	l, a
	or	a, a
	jr	nz, .LBB27_2
	.local	.LBB27_1
.LBB27_1:                               ; %.loopexit
	ld	a, (ix - 1)
	ld	(iy + 37), a
	ld	sp, ix
	pop	ix
	ret
	.local	.LBB27_2
.LBB27_2:
	ld	b, 4
	ld	de, 0
	ld	a, l
	call	__bshl
	ld	(ix - 5), a                     ; 1-byte Folded Spill
	.local	.LBB27_3
.LBB27_3:                               ; =>This Inner Loop Header: Depth=1
	ld	bc, 12
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	jr	z, .LBB27_1
; %bb.4:                                ;   in Loop: Header=BB27_3 Depth=1
	ld	(ix - 4), de
	add	iy, de
	ld	a, (iy + 38)
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	de, -115
	add	hl, de
	ld	de, 5
	or	a, a
	sbc	hl, de
	jr	nc, .LBB27_7
; %bb.5:                                ;   in Loop: Header=BB27_3 Depth=1
	ld	h, 0
	ld	l, a
	ld.sis	de, -100
	add.sis	hl, de
	ld.sis	bc, 5
	call	__srems
	ld.sis	de, 2
	or	a, a
	sbc.sis	hl, de
	call	pe, __setflag
	jp	p, .LBB27_7
; %bb.6:                                ;   in Loop: Header=BB27_3 Depth=1
	ld	a, (iy + 40)
	ld	l, (ix - 5)
	add	a, l
	ld	l, a
	ld	(iy + 40), l
	.local	.LBB27_7
.LBB27_7:                               ;   in Loop: Header=BB27_3 Depth=1
	ld	hl, (ix - 4)
	ld	de, 3
	add	hl, de
	ex	de, hl
	ld	iy, (ix + 6)
	jr	.LBB27_3
	.local	.Lfunc_end27
.Lfunc_end27:
	.size	_EventsRefreshTraits, .Lfunc_end27-_EventsRefreshTraits
                                        ; -- End function
	.section	.text._EventsAdvance,"ax",@progbits
	.globl	_EventsAdvance                  ; -- Begin function EventsAdvance
	.type	_EventsAdvance,@function
_EventsAdvance:                         ; @EventsAdvance
; %bb.0:
	ld	hl, -79
	call	__frameset
	ld	iy, (ix + 9)
	or	a, a
	sbc	hl, hl
	ld	(ix - 33), hl
	ld	(ix - 30), h
	ld	a, (iy + 33)
	or	a, a
	jp	z, .LBB28_46
; %bb.1:
	ld	a, (iy + 34)
	or	a, a
	jp	nz, .LBB28_46
; %bb.2:
	ld	de, (ix + 6)
	ld	hl, (ix + 9)
	push	hl
	pop	iy
	ld	bc, (iy + 8)
	ld	a, (iy + 11)
	push	de
	pop	iy
	ld	hl, (iy + 4)
	ld	d, a
	ld	e, (iy + 7)
	ld	(ix - 41), hl
	ld	(ix - 44), e                    ; 1-byte Folded Spill
	ld	(ix - 38), bc
	call	__lcmpu
	jp	nc, .LBB28_46
; %bb.3:
	ld	a, -1
	ld	(ix - 47), a
	ld	hl, 200
	ld	(ix - 55), hl
	lea	hl, ix - 33
	ld	(ix - 59), hl
	ld	hl, (ix - 38)
	ld	e, d
	ld	bc, (ix - 41)
	ld	a, (ix - 44)                    ; 1-byte Folded Reload
	call	__lsub
	ld	(ix - 41), hl
	ld	(ix - 50), e                    ; 1-byte Folded Spill
	ld	iy, (ix + 6)
	ld	bc, (ix - 38)
	ld	(iy + 4), bc
	ld	(iy + 7), d
	ld	hl, (ix + 9)
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_EventsRefreshTraits
	pop	hl
	pop	hl
	ld	iy, (ix + 6)
	lea	hl, iy + 12
	ld	(ix - 62), hl
	ld	hl, (ix - 41)
	ld	(ix - 52), l                    ; 1-byte Folded Spill
	ld	bc, 12
	ld	iyl, b
	ld	a, iyl
	ld	de, 0
	push	af
	ld	a, iyl
	ld	(ix - 51), a                    ; 1-byte Folded Spill
	pop	af
	.local	.LBB28_4
.LBB28_4:                               ; =>This Inner Loop Header: Depth=1
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	jp	z, .LBB28_42
; %bb.5:                                ;   in Loop: Header=BB28_4 Depth=1
	ld	l, a
	ld	iy, (ix + 6)
	add	iy, de
	ld	(ix - 38), iy
	ld	a, (iy + 38)
	cp	a, -1
	jr	nz, .LBB28_8
; %bb.6:                                ;   in Loop: Header=BB28_4 Depth=1
	ld	a, l
	.local	.LBB28_7
.LBB28_7:                               ;   in Loop: Header=BB28_4 Depth=1
	ld	(ix - 47), a                    ; 1-byte Folded Spill
	jp	.LBB28_39
	.local	.LBB28_8
.LBB28_8:                               ;   in Loop: Header=BB28_4 Depth=1
	ld	(ix - 44), de
	ld	(ix - 56), l                    ; 1-byte Folded Spill
	ld	iy, 0
	lea	hl, iy + 0
	ld	(ix - 66), a                    ; 1-byte Folded Spill
	ld	l, a
	ld	bc, 28
	call	__imulu
	ex	de, hl
	ld	hl, _event_catalog
	add	hl, de
	ld	(ix - 65), hl
	ld	iy, (ix - 38)
	ld	a, (iy + 39)
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	bc, 6
	call	__imulu
	ex	de, hl
	ld	iy, (ix + 12)
	add	iy, de
	ld	de, (iy)
	sbc.sis	hl, hl
	adc.sis	hl, de
	jr	nz, .LBB28_13
; %bb.9:                                ;   in Loop: Header=BB28_4 Depth=1
	ld	hl, (iy + 2)
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	jr	nz, .LBB28_13
; %bb.10:                               ;   in Loop: Header=BB28_4 Depth=1
	ld	hl, (ix + 15)
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	z, .LBB28_12
; %bb.11:                               ;   in Loop: Header=BB28_4 Depth=1
	ld	hl, 1
	push	hl
	ld	l, a
	push	hl
	ld	l, (ix - 66)                    ; 1-byte Folded Reload
	push	hl
	ld	hl, (ix + 15)
	call	__indcallhl
	pop	hl
	pop	hl
	pop	hl
	.local	.LBB28_12
.LBB28_12:                              ;   in Loop: Header=BB28_4 Depth=1
	ld	iy, (ix - 38)
	ld	(iy + 38), -1
	lea	bc, iy + 0
	ld	hl, (ix + 6)
	push	hl
	pop	iy
	ld	de, (ix - 44)
	add	iy, de
	ld	(iy + 40), 0
	push	bc
	pop	iy
	ld	(iy + 39), 0
	ld	a, (ix - 56)                    ; 1-byte Folded Reload
	jp	.LBB28_7
	.local	.LBB28_13
.LBB28_13:                              ;   in Loop: Header=BB28_4 Depth=1
	ld	(ix - 73), iy
	ld	(ix - 70), de
	ld	(ix - 67), a                    ; 1-byte Folded Spill
	ld	iy, (ix + 6)
	ld	de, (ix - 44)
	add	iy, de
	ld	d, (iy + 40)
	xor	a, a
	ld	(ix - 35), a
	ld	bc, (ix - 37)
	ld	b, a
	ld	c, d
	sbc	hl, hl
	ld	a, l
	ld	hl, (ix - 41)
	ld	e, (ix - 50)                    ; 1-byte Folded Reload
	call	__lcmpu
	jr	nc, .LBB28_17
; %bb.14:                               ;   in Loop: Header=BB28_4 Depth=1
	ld	l, (ix - 52)
	ld	a, d
	sub	a, l
	ld	l, a
	ld	(iy + 40), l
	.local	.LBB28_15
.LBB28_15:                              ;   in Loop: Header=BB28_4 Depth=1
	ld	iy, (ix - 38)
	ld	a, (iy + 38)
	cp	a, -1
	jr	nz, .LBB28_19
; %bb.16:                               ;   in Loop: Header=BB28_4 Depth=1
	ld	a, (ix - 56)                    ; 1-byte Folded Reload
	ld	(ix - 47), a                    ; 1-byte Folded Spill
	jp	.LBB28_20
	.local	.LBB28_17
.LBB28_17:                              ;   in Loop: Header=BB28_4 Depth=1
	ld	(ix - 76), iy
	ld	iy, (ix - 65)
	ld	a, (iy + 24)
	dec	a
	cp	a, 6
	jp	c, .LBB28_21
; %bb.18:                               ;   in Loop: Header=BB28_4 Depth=1
	ld	bc, (ix - 44)
	ld	de, (ix - 38)
	jp	.LBB28_33
	.local	.LBB28_19
.LBB28_19:                              ;   in Loop: Header=BB28_4 Depth=1
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	de, -100
	add	hl, de
	ld	de, 100
	or	a, a
	sbc	hl, de
	ccf
                                        ; kill: def $a killed $a
	sbc	a, a
	ld	l, a
	inc	l
	ld	e, (ix - 51)
	ld	a, e
	add	a, l
	ld	e, a
	ld	(ix - 51), e
	ld	a, (ix - 56)                    ; 1-byte Folded Reload
	.local	.LBB28_20
.LBB28_20:                              ;   in Loop: Header=BB28_4 Depth=1
	ld	de, (ix - 44)
	jp	.LBB28_39
	.local	.LBB28_21
.LBB28_21:                              ;   in Loop: Header=BB28_4 Depth=1
	ld	de, 0
	ld	e, a
	ld	hl, JTI28_0
	add	hl, de
	add	hl, de
	add	hl, de
	ld	hl, (hl)
	lea	de, iy + 27
	ld	(ix - 79), de
	jp	(hl)
	.local	.LBB28_22
.LBB28_22:                              ;   in Loop: Header=BB28_4 Depth=1
	ld	a, (iy + 25)
	ld	l, a
	push	hl
	ld	hl, (ix + 9)
	push	hl
	call	_Owns
	pop	hl
	pop	hl
	bit	0, a
	ld	bc, (ix - 44)
	ld	de, (ix - 38)
	ld	hl, (ix - 79)
	jp	nz, .LBB28_33
	jp	.LBB28_34
	.local	.LBB28_23
.LBB28_23:                              ;   in Loop: Header=BB28_4 Depth=1
	ld	iy, (ix + 9)
	ld	hl, (iy + 22)
                                        ; kill: def $hl killed $hl killed $uhl
	ld.sis	de, 5000
	jp	.LBB28_29
	.local	.LBB28_24
.LBB28_24:                              ;   in Loop: Header=BB28_4 Depth=1
	ld	de, (ix - 73)
	push	de
	pop	iy
	ld	hl, (iy + 4)
	ld	de, (iy + 2)
	ld	(ix - 73), hl
                                        ; kill: def $hl killed $hl killed $uhl
	ld	bc, (ix - 70)
	add.sis	hl, bc
	add.sis	hl, de
	ld	(ix - 70), l
	ld	(ix - 69), h
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	jp	z, .LBB28_27
; %bb.25:                               ; %Percentage.exit
                                        ;   in Loop: Header=BB28_4 Depth=1
	ld	de, 0
	push	de
	pop	hl
	ld	bc, (ix - 73)
	ld	l, c
	ld	h, b
	ld	bc, 100
	call	__imulu
	push	de
	pop	bc
	ld	e, (ix - 70)
	ld	d, (ix - 69)
	ld	c, e
	ld	b, d
	call	__idivu
	ld	a, l
	cp	a, 25
	jp	.LBB28_32
	.local	.LBB28_26
.LBB28_26:                              ;   in Loop: Header=BB28_4 Depth=1
	ld	de, (ix - 73)
	push	de
	pop	iy
	ld	hl, (iy + 2)
	ld	de, (iy + 4)
	ld	(ix - 73), hl
                                        ; kill: def $hl killed $hl killed $uhl
	ld	bc, (ix - 70)
	add.sis	hl, bc
	add.sis	hl, de
	ld	(ix - 70), l
	ld	(ix - 69), h
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	jp	nz, .LBB28_31
	.local	.LBB28_27
.LBB28_27:                              ; %Percentage.exit.thread
                                        ;   in Loop: Header=BB28_4 Depth=1
	ld	bc, (ix - 44)
	ld	de, (ix - 38)
	ld	hl, (ix - 79)
	jp	.LBB28_34
	.local	.LBB28_28
.LBB28_28:                              ;   in Loop: Header=BB28_4 Depth=1
	pea	ix - 29
	ld	hl, (ix + 9)
	push	hl
	call	_CalculateEffects
	pop	hl
	pop	hl
	ld	hl, (ix - 13)
                                        ; kill: def $hl killed $hl killed $uhl
	ld.sis	de, 20
	.local	.LBB28_29
.LBB28_29:                              ;   in Loop: Header=BB28_4 Depth=1
	or	a, a
	sbc.sis	hl, de
	jr	.LBB28_32
	.local	.LBB28_30
.LBB28_30:                              ;   in Loop: Header=BB28_4 Depth=1
	ld	iy, (ix + 9)
	ld	a, (iy + 35)
	cp	a, 3
	jr	.LBB28_32
	.local	.LBB28_31
.LBB28_31:                              ; %Percentage.exit11
                                        ;   in Loop: Header=BB28_4 Depth=1
	ld	de, 0
	push	de
	pop	hl
	ld	bc, (ix - 73)
	ld	l, c
	ld	h, b
	ld	bc, 100
	call	__imulu
	push	de
	pop	bc
	ld	e, (ix - 70)
	ld	d, (ix - 69)
	ld	c, e
	ld	b, d
	call	__idivu
	ld	a, l
	cp	a, 50
	.local	.LBB28_32
.LBB28_32:                              ;   in Loop: Header=BB28_4 Depth=1
	ld	bc, (ix - 44)
	ld	de, (ix - 38)
	ld	hl, (ix - 79)
	jr	c, .LBB28_34
	.local	.LBB28_33
.LBB28_33:                              ;   in Loop: Header=BB28_4 Depth=1
	ld	iy, (ix - 65)
	lea	hl, iy + 26
	.local	.LBB28_34
.LBB28_34:                              ;   in Loop: Header=BB28_4 Depth=1
	ld	a, (hl)
	cp	a, -1
	push	de
	pop	iy
	jr	z, .LBB28_36
; %bb.35:                               ;   in Loop: Header=BB28_4 Depth=1
	ld	(ix - 65), a                    ; 1-byte Folded Spill
	ld	l, (ix - 65)                    ; 1-byte Folded Reload
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_EventsOccurred
	ld	iy, (ix - 38)
	ld	bc, (ix - 44)
	pop	hl
	pop	hl
	ld	l, (ix - 65)                    ; 1-byte Folded Reload
	bit	0, a
	jr	z, .LBB28_40
	.local	.LBB28_36
.LBB28_36:                              ;   in Loop: Header=BB28_4 Depth=1
	ld	hl, (ix + 15)
	add	hl, bc
	or	a, a
	sbc	hl, bc
	ld	a, (ix - 56)                    ; 1-byte Folded Reload
	jr	z, .LBB28_38
; %bb.37:                               ;   in Loop: Header=BB28_4 Depth=1
	ld	hl, 1
	push	hl
	ld	l, (ix - 67)                    ; 1-byte Folded Reload
	push	hl
	ld	l, (ix - 66)                    ; 1-byte Folded Reload
	push	hl
	ld	hl, (ix + 15)
	call	__indcallhl
	ld	iy, (ix - 38)
	ld	bc, (ix - 44)
	ld	a, (ix - 56)                    ; 1-byte Folded Reload
	pop	hl
	pop	hl
	pop	hl
	.local	.LBB28_38
.LBB28_38:                              ;   in Loop: Header=BB28_4 Depth=1
	ld	(iy + 38), -1
	lea	hl, iy + 0
	ld	iy, (ix - 76)
	ld	(iy + 40), 0
	push	hl
	pop	iy
	ld	(iy + 39), 0
	ld	(ix - 47), a                    ; 1-byte Folded Spill
	push	bc
	pop	de
	.local	.LBB28_39
.LBB28_39:                              ;   in Loop: Header=BB28_4 Depth=1
	ex	de, hl
	ld	bc, 3
	add	hl, bc
	inc	a
	ex	de, hl
	ld	bc, 12
	jp	.LBB28_4
	.local	.LBB28_40
.LBB28_40:                              ;   in Loop: Header=BB28_4 Depth=1
	ld	de, 0
	ld	e, l
	ld	(iy + 38), l
	push	de
	pop	hl
	ld	bc, 28
	call	__imulu
	push	hl
	pop	bc
	ld	iy, _event_catalog
	add	iy, bc
	ld	a, (iy + 16)
	ld	iy, (ix - 76)
	ld	(iy + 40), a
	ld	l, 7
	ld	a, (ix - 65)
	and	a, l
	ld	b, a
	ld	a, 1
	call	__bshl
	ld	b, a
	ex	de, hl
	ld	c, 3
	call	__ishru
	ex	de, hl
	ld	hl, (ix - 62)
	add	hl, de
	ld	a, (hl)
	or	a, b
	ld	e, a
	ld	(hl), e
	ld	hl, (ix + 15)
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jp	z, .LBB28_15
; %bb.41:                               ;   in Loop: Header=BB28_4 Depth=1
	ld	iy, (ix - 38)
	ld	a, (iy + 39)
	or	a, a
	sbc	hl, hl
	push	hl
	ld	l, a
	push	hl
	ld	l, (ix - 65)                    ; 1-byte Folded Reload
	push	hl
	ld	hl, (ix + 15)
	call	__indcallhl
	pop	hl
	pop	hl
	pop	hl
	jp	.LBB28_15
	.local	.LBB28_42
.LBB28_42:
	ld	a, (ix - 47)                    ; 1-byte Folded Reload
	cp	a, -1
	ld	iy, (ix + 9)
	jr	z, .LBB28_46
; %bb.43:
	ld	hl, (iy + 8)
	lea	de, iy + 0
	ld	iy, (ix + 6)
	ld	bc, (iy + 8)
	push	de
	pop	iy
	ld	e, (iy + 11)
	ld	iy, (ix + 6)
	ld	a, (iy + 11)
	call	__lcmpu
	jr	c, .LBB28_46
; %bb.44:
	ld	e, 7
	ld	a, l
	and	a, e
	ld	l, a
	or	a, a
	jr	nz, .LBB28_46
; %bb.45:
	ld	hl, (ix + 6)
	push	hl
	call	_RandomEvent
	pop	bc
	ld	bc, 100
	ld	d, b
	ld	a, d
	call	__lremu
	push	hl
	pop	bc
	ld	a, e
	ld	hl, 24
	ld	e, d
	call	__lcmpu
	jr	nc, .LBB28_47
	.local	.LBB28_46
.LBB28_46:                              ; %.loopexit16
	ld	sp, ix
	pop	ix
	ret
	.local	.LBB28_47
.LBB28_47:
	or	a, a
	sbc	hl, hl
	ld	l, (ix - 47)                    ; 1-byte Folded Reload
	ld	(ix - 44), hl
	ld	bc, 200
	ld	de, 0
	ld	iy, (ix + 6)
	.local	.LBB28_48
.LBB28_48:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB28_55 Depth 2
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	jp	z, .LBB28_59
; %bb.49:                               ;   in Loop: Header=BB28_48 Depth=1
	push	de
	push	iy
	ld	(ix - 38), de
	call	_EventsOccurred
	pop	hl
	pop	hl
	ld	hl, (ix - 38)
	bit	0, a
	ld	iy, (ix + 9)
	lea	bc, iy + 0
	jr	z, .LBB28_51
	.local	.LBB28_50
.LBB28_50:                              ; %.loopexit17
                                        ;   in Loop: Header=BB28_48 Depth=1
	inc	hl
	ld	de, (ix + 6)
	push	de
	pop	iy
	ld	bc, 200
	ex	de, hl
	jr	.LBB28_48
	.local	.LBB28_51
.LBB28_51:                              ;   in Loop: Header=BB28_48 Depth=1
	push	hl
	pop	iy
	ld	de, 100
	or	a, a
	sbc	hl, de
	lea	hl, iy + 0
	jr	c, .LBB28_54
; %bb.52:                               ;   in Loop: Header=BB28_48 Depth=1
	lea	hl, iy + 0
	ld	de, -100
	add	hl, de
	push	bc
	pop	de
	ld	bc, 5
	call	__iremu
	push	de
	pop	bc
	add	hl, bc
	or	a, a
	sbc	hl, bc
	lea	hl, iy + 0
	jr	nz, .LBB28_50
; %bb.53:                               ;   in Loop: Header=BB28_48 Depth=1
	ld	a, (ix - 51)                    ; 1-byte Folded Reload
	cp	a, 2
	jr	nc, .LBB28_50
	.local	.LBB28_54
.LBB28_54:                              ;   in Loop: Header=BB28_48 Depth=1
	push	hl
	pop	de
	push	bc
	pop	iy
	ld	bc, 28
	call	__imulu
	push	hl
	pop	bc
	ld	hl, _event_catalog
	add	hl, bc
	ld	(ix - 41), hl
	ex	de, hl
	ld	de, 100
	or	a, a
	sbc	hl, de
	sbc	hl, hl
	inc	hl
	add	hl, hl
	ex	de, hl
	ld	hl, (ix - 59)
	add	hl, de
	ld	(ix - 50), hl
	xor	a, a
	ld	e, a
	.local	.LBB28_55
.LBB28_55:                              ;   Parent Loop BB28_48 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ld	a, e
	cp	a, 7
	ld	hl, (ix - 38)
	jr	z, .LBB28_50
; %bb.56:                               ;   in Loop: Header=BB28_55 Depth=2
	ld	(ix - 47), de
	push	de
	ld	hl, (ix + 12)
	push	hl
	push	iy
	ld	hl, (ix - 41)
	push	hl
	call	_EventsEligible
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	bit	0, a
	jr	z, .LBB28_58
; %bb.57:                               ;   in Loop: Header=BB28_55 Depth=2
	ld	iy, (ix - 50)
	ld	hl, (iy)
	inc.sis	hl
	ld	(iy), l
	ld	(iy + 1), h
	.local	.LBB28_58
.LBB28_58:                              ;   in Loop: Header=BB28_55 Depth=2
	ld	de, (ix - 47)
	inc	e
	ld	iy, (ix + 9)
	jr	.LBB28_55
	.local	.LBB28_59
.LBB28_59:
	ld	bc, (ix - 33)
	ld	de, (ix - 31)
	sbc.sis	hl, hl
	adc.sis	hl, bc
	jr	nz, .LBB28_64
; %bb.60:
	sbc.sis	hl, hl
	adc.sis	hl, de
	jr	nz, .LBB28_62
; %bb.61:
	ld	a, 0
	jr	.LBB28_63
	.local	.LBB28_62
.LBB28_62:
	ld	a, -1
	.local	.LBB28_63
.LBB28_63:
	bit	0, a
	jp	z, .LBB28_46
	.local	.LBB28_64
.LBB28_64:
	sbc.sis	hl, hl
	adc.sis	hl, bc
	jr	z, .LBB28_66
; %bb.65:
	ld	a, 0
	jr	.LBB28_67
	.local	.LBB28_66
.LBB28_66:
	ld	a, -1
	.local	.LBB28_67
.LBB28_67:
	ld	(ix - 38), a
	ld	iy, (ix + 6)
	sbc.sis	hl, hl
	adc.sis	hl, bc
	jp	z, .LBB28_70
; %bb.68:
	sbc.sis	hl, hl
	adc.sis	hl, de
	jp	z, .LBB28_70
; %bb.69:
	push	iy
	call	_RandomEvent
	ld	iy, (ix + 6)
	pop	bc
	ld	bc, 100
	ld	d, b
	ld	a, d
	call	__lremu
	push	hl
	pop	bc
	ld	a, e
	ld	hl, 69
	ld	e, d
	call	__lcmpu
                                        ; kill: def $a killed $a
	sbc	a, a
	ld	(ix - 38), a                    ; 1-byte Folded Spill
	.local	.LBB28_70
.LBB28_70:
	ld	l, (ix - 38)                    ; 1-byte Folded Reload
	ld	bc, 1
	call	__iand
	ld	(ix - 41), hl
	push	iy
	call	_RandomEvent
	pop	bc
	ld	iy, (ix - 41)
	add	iy, iy
	lea	bc, iy + 0
	ld	iy, (ix - 59)
	add	iy, bc
	ld	iy, (iy)
	xor	a, a
	ld	(ix - 34), a
	ld	bc, (ix - 36)
	ld	b, iyh
	ld	c, iyl
	ld	iy, 0
	ld	a, iyl
	call	__lremu
	ex	de, hl
	bit	0, (ix - 38)                    ; 1-byte Folded Reload
	ld	iy, 100
	jr	nz, .LBB28_72
; %bb.71:
	ld	iy, 0
	.local	.LBB28_72
.LBB28_72:
	bit	0, (ix - 38)                    ; 1-byte Folded Reload
	jr	nz, .LBB28_74
; %bb.73:
	ld	hl, 100
	ld	(ix - 55), hl
	.local	.LBB28_74
.LBB28_74:
	ld	(ix - 47), de
	.local	.LBB28_75
.LBB28_75:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB28_82 Depth 2
	lea	hl, iy + 0
	ld	de, (ix - 55)
	or	a, a
	sbc	hl, de
	ld	hl, (ix + 6)
	jp	z, .LBB28_46
; %bb.76:                               ;   in Loop: Header=BB28_75 Depth=1
	push	iy
	push	hl
	ld	(ix - 41), iy
	call	_EventsOccurred
	pop	hl
	pop	hl
	bit	0, a
	jr	z, .LBB28_79
; %bb.77:                               ;   in Loop: Header=BB28_75 Depth=1
	ld	iy, (ix - 41)
	.local	.LBB28_78
.LBB28_78:                              ; %.loopexit
                                        ;   in Loop: Header=BB28_75 Depth=1
	inc	iy
	jr	.LBB28_75
	.local	.LBB28_79
.LBB28_79:                              ;   in Loop: Header=BB28_75 Depth=1
	ld	iy, (ix - 41)
	ld	e, iyl
	bit	0, (ix - 38)                    ; 1-byte Folded Reload
	jr	z, .LBB28_81
; %bb.80:                               ;   in Loop: Header=BB28_75 Depth=1
	ld	l, -100
	ld	a, e
	add	a, l
	ld	l, a
	ld	c, 5
	call	__brems
	or	a, a
	jr	nz, .LBB28_78
	.local	.LBB28_81
.LBB28_81:                              ;   in Loop: Header=BB28_75 Depth=1
	ld	(ix - 52), e                    ; 1-byte Folded Spill
	lea	hl, iy + 0
	ld	bc, 28
	call	__imulu
	ex	de, hl
	ld	hl, _event_catalog
	add	hl, de
	ld	(ix - 50), hl
	xor	a, a
	.local	.LBB28_82
.LBB28_82:                              ;   Parent Loop BB28_75 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ld	de, (ix + 9)
	cp	a, 7
	jr	z, .LBB28_78
; %bb.83:                               ;   in Loop: Header=BB28_82 Depth=2
	ld	(ix - 51), a                    ; 1-byte Folded Spill
	ld	l, a
	push	hl
	ld	hl, (ix + 12)
	push	hl
	push	de
	ld	hl, (ix - 50)
	push	hl
	call	_EventsEligible
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	bit	0, a
	jr	z, .LBB28_86
; %bb.84:                               ;   in Loop: Header=BB28_82 Depth=2
	ld	de, (ix - 47)
	sbc.sis	hl, hl
	adc.sis	hl, de
	jr	z, .LBB28_87
; %bb.85:                               ;   in Loop: Header=BB28_82 Depth=2
	dec.sis	de
	ld	(ix - 47), de
	.local	.LBB28_86
.LBB28_86:                              ;   in Loop: Header=BB28_82 Depth=2
	ld	iy, (ix - 41)
	ld	a, (ix - 51)                    ; 1-byte Folded Reload
	inc	a
	jr	.LBB28_82
	.local	.LBB28_87
.LBB28_87:
	ld	bc, 3
	ld	hl, (ix - 44)
	call	__imulu
	ex	de, hl
	ld	iy, (ix + 6)
	add	iy, de
	ld	e, (ix - 52)                    ; 1-byte Folded Reload
	ld	(iy + 38), e
	ld	a, (ix - 51)
	ld	(iy + 39), a
	lea	hl, iy + 0
	ld	iy, (ix - 50)
	ld	a, (iy + 16)
	push	hl
	pop	iy
	ld	(iy + 40), a
	ld	l, 7
	ld	a, e
	and	a, l
	ld	b, a
	ld	a, 1
	call	__bshl
	ld	e, a
	ld	hl, (ix - 41)
	call	__ishru
	ld	bc, 31
	call	__iand
	push	hl
	pop	bc
	ld	iy, (ix - 62)
	add	iy, bc
	ld	a, (iy)
	or	a, e
	ld	l, a
	ld	(iy), l
	ld	iy, (ix + 9)
	ld	hl, (iy + 8)
	ld	de, 16
	add	hl, de
	ld	a, (iy + 11)
	adc	a, d
	ld	e, a
                                        ; kill: def $a killed $a
	sbc	a, a
	bit	0, a
	jr	z, .LBB28_89
; %bb.88:
	scf
	sbc	hl, hl
	.local	.LBB28_89
.LBB28_89:
	bit	0, a
	ld	iy, (ix + 6)
	jr	z, .LBB28_91
; %bb.90:
	ld	e, -1
	.local	.LBB28_91
.LBB28_91:
	ld	(iy + 8), hl
	ld	(iy + 11), e
	ld	hl, (ix + 15)
	add	hl, bc
	or	a, a
	sbc	hl, bc
	ld	de, (ix - 41)
	jp	z, .LBB28_46
; %bb.92:
	or	a, a
	sbc	hl, hl
	push	hl
	ld	l, (ix - 51)                    ; 1-byte Folded Reload
	push	hl
	push	de
	ld	hl, (ix + 15)
	call	__indcallhl
	pop	hl
	pop	hl
	pop	hl
	jp	.LBB28_46
	.local	.Lfunc_end28
.Lfunc_end28:
	.size	_EventsAdvance, .Lfunc_end28-_EventsAdvance
	.section	.rodata._EventsAdvance,"a",@progbits
JTI28_0:
	d24	.LBB28_22
	d24	.LBB28_28
	d24	.LBB28_24
	d24	.LBB28_26
	d24	.LBB28_23
	d24	.LBB28_30
                                        ; -- End function
	.section	.text._RandomEvent,"ax",@progbits
	.type	_RandomEvent,@function          ; -- Begin function RandomEvent
_RandomEvent:                           ; @RandomEvent
; %bb.0:
	call	__frameset0
	ld	iy, (ix + 6)
	ld	bc, (iy)
	lea	hl, iy + 3
	ld	d, (hl)
	ld	l, 13
	push	bc
	pop	iy
	ld	a, d
	call	__lshl
	push	bc
	pop	hl
	ld	e, a
	lea	bc, iy + 0
	ld	a, d
	call	__lxor
	push	hl
	pop	iy
	ld	d, e
	ld	l, 17
	lea	bc, iy + 0
	ld	a, d
	call	__lshru
	push	bc
	pop	hl
	ld	e, a
	lea	bc, iy + 0
	ld	a, d
	call	__lxor
	push	hl
	pop	iy
	ld	d, e
	ld	l, 5
	lea	bc, iy + 0
	ld	a, d
	call	__lshl
	push	bc
	pop	hl
	ld	e, a
	lea	bc, iy + 0
	ld	a, d
	call	__lxor
	ld	iy, (ix + 6)
	ld	(iy), hl
	ld	(iy + 3), e
	pop	ix
	ret
	.local	.Lfunc_end29
.Lfunc_end29:
	.size	_RandomEvent, .Lfunc_end29-_RandomEvent
                                        ; -- End function
	.section	.text._EventAmount,"ax",@progbits
	.globl	_EventAmount                    ; -- Begin function EventAmount
	.type	_EventAmount,@function
_EventAmount:                           ; @EventAmount
; %bb.0:
	call	__frameset0
	ld	iy, (ix + 6)
	ld	a, (iy + 23)
	cp	a, -1
	jr	z, .LBB30_3
; %bb.1:
	ld	hl, (ix + 12)
	ld	e, a
	push	de
	push	hl
	call	_Owns
	pop	hl
	pop	hl
	bit	0, a
	jr	z, .LBB30_3
; %bb.2:
	ld	iy, (ix + 9)
	ld	l, (iy + 2)
	ld	b, 7
	ld	a, l
	rlc	a
	sbc	a, a
	call	__bshru
	ld	e, a
	ld	a, l
	add	a, e
	ld	e, a
	sra	e
	jr	.LBB30_4
	.local	.LBB30_3
.LBB30_3:
	ld	iy, (ix + 9)
	ld	e, (iy + 2)
	.local	.LBB30_4
.LBB30_4:
	ld	a, e
	rlc	a
	sbc.sis	hl, hl
	ld	l, e
	pop	ix
	ret
	.local	.Lfunc_end30
.Lfunc_end30:
	.size	_EventAmount, .Lfunc_end30-_EventAmount
                                        ; -- End function
	.section	.text._EventsApply,"ax",@progbits
	.globl	_EventsApply                    ; -- Begin function EventsApply
	.type	_EventsApply,@function
_EventsApply:                           ; @EventsApply
; %bb.0:
	ld	hl, -158
	call	__frameset
	ld.sis	hl, 0
	ld	(ix - 91), l
	ld	(ix - 90), h
	ld.sis	hl, 125
	ld	(ix - 118), l
	ld	(ix - 117), h
	ld.sis	hl, 75
	ld	(ix - 116), l
	ld	(ix - 115), h
	lea	hl, ix - 34
	lea	de, ix - 49
	ld	(ix - 97), de
	lea	de, ix - 63
	ld	(ix - 100), de
	lea	de, ix - 77
	ld	(ix - 103), de
	ld	(ix - 34), 0
	push	hl
	pop	iy
	inc	iy
	ld	bc, 27
	lea	de, iy + 0
	ld	(ix - 88), hl
	ldir
	ld	(ix - 49), 0
	ld	bc, (ix - 97)
	push	bc
	pop	hl
	inc	hl
	ld	iy, 13
	ex	de, hl
	push	bc
	pop	hl
	lea	bc, iy + 0
	ldir
	ld	(ix - 63), 0
	ld	bc, (ix - 100)
	push	bc
	pop	hl
	inc	hl
	ex	de, hl
	push	bc
	pop	hl
	lea	bc, iy + 0
	ldir
	ld	(ix - 77), 0
	ld	bc, (ix - 103)
	push	bc
	pop	hl
	inc	hl
	ex	de, hl
	push	bc
	pop	hl
	lea	bc, iy + 0
	ldir
	ld	hl, (ix + 18)
	ld	(hl), 0
	push	hl
	pop	iy
	inc	iy
	ld	bc, 47
	lea	de, iy + 0
	ldir
	ld	de, 42
	ld	bc, 0
	.local	.LBB31_1
.LBB31_1:                               ; =>This Inner Loop Header: Depth=1
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	jr	z, .LBB31_3
; %bb.2:                                ;   in Loop: Header=BB31_1 Depth=1
	ld	iy, (ix + 12)
	add	iy, bc
	ld	hl, (iy)
	ld	de, (iy + 2)
	ld	(ix - 85), de
	ld	iy, (iy + 4)
	ld	e, (ix - 91)
	ld	d, (ix - 90)
	add.sis	hl, de
	ld	de, (ix - 85)
	add.sis	hl, de
	lea	de, iy + 0
	add.sis	hl, de
	push	hl
	pop	iy
	push	bc
	pop	hl
	ld	de, 6
	add	hl, de
	ld	de, 42
	push	hl
	pop	bc
	ex	de, hl
	ld	e, iyl
	ld	d, iyh
	ex	de, hl
	ld	(ix - 91), l
	ld	(ix - 90), h
	jr	.LBB31_1
	.local	.LBB31_3
.LBB31_3:
	ld	bc, 4
	xor	a, a
	ld	(ix - 114), a                   ; 1-byte Folded Spill
	ld	(ix - 121), a                   ; 1-byte Folded Spill
	ld	de, 0
	push	de
	pop	iy
	ld	(ix - 94), de
	ld	(ix - 104), a                   ; 1-byte Folded Spill
	ld	(ix - 105), a                   ; 1-byte Folded Spill
	.local	.LBB31_4
.LBB31_4:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB31_8 Depth 2
	lea	hl, iy + 0
	or	a, a
	sbc	hl, bc
	push	de
	pop	hl
	ld	(ix - 85), de
	jp	z, .LBB31_46
; %bb.5:                                ;   in Loop: Header=BB31_4 Depth=1
	ld	(ix - 108), iy
	lea	hl, iy + 0
	ld	bc, 3
	call	__imulu
	ex	de, hl
	ld	iy, (ix + 6)
	add	iy, de
	ld	a, (iy + 38)
	cp	a, -1
	jr	nz, .LBB31_7
; %bb.6:                                ;   in Loop: Header=BB31_4 Depth=1
	ld	hl, (ix - 85)
	jp	.LBB31_45
	.local	.LBB31_7
.LBB31_7:                               ;   in Loop: Header=BB31_4 Depth=1
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	bc, 28
	call	__imulu
	ex	de, hl
	ld	hl, _event_catalog
	add	hl, de
	ld	(ix - 127), hl
	ld	a, (iy + 39)
	ld	iy, 0
	ld	iyl, a
	ld	hl, 1
	ld	c, a
	call	__ishl
	push	ix
	lea	ix, ix - 128
	ld	(ix - 5), l                     ; 1-byte Folded Spill
	pop	ix
	lea	hl, iy + 0
	ld	bc, 6
	call	__imulu
	ex	de, hl
	ld	hl, (ix + 12)
	add	hl, de
	push	ix
	lea	ix, ix - 128
	ld	(ix - 20), hl
	pop	ix
	lea	hl, iy + 0
	add	hl, hl
	ex	de, hl
	ld	hl, (ix - 103)
	add	hl, de
	push	ix
	lea	ix, ix - 128
	ld	(ix - 11), hl
	pop	ix
	ld	hl, (ix - 100)
	add	hl, de
	push	ix
	lea	ix, ix - 128
	ld	(ix - 14), hl
	pop	ix
	ld	hl, (ix - 97)
	add	hl, de
	push	ix
	lea	ix, ix - 128
	ld	(ix - 17), hl
	pop	ix
	ld	hl, (ix + 15)
	add	hl, de
	push	ix
	lea	ix, ix - 128
	ld	(ix - 23), hl
	pop	ix
	lea	hl, iy + 0
	add	hl, hl
	add	hl, hl
	ex	de, hl
	ld	hl, (ix - 88)
	add	hl, de
	ld	de, -136
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	ld	l, a
	ld	de, -154
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	ld	de, 0
	ld	iy, (ix - 85)
	.local	.LBB31_8
.LBB31_8:                               ;   Parent Loop BB31_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	jp	z, .LBB31_44
; %bb.9:                                ;   in Loop: Header=BB31_8 Depth=2
	ld	(ix - 85), iy
	push	de
	pop	bc
	ld	de, (ix - 127)
	push	de
	pop	iy
	ld	(ix - 124), bc
	add	iy, bc
	ld	(ix - 111), iy
	ld	hl, (ix + 9)
	push	hl
	pea	iy + 6
	push	de
	call	_EventAmount
	ex.sis	de, hl
	pop	hl
	pop	hl
	pop	hl
	ld	iy, (ix - 111)
	ld	c, (iy + 7)
	ld	a, c
	cp	a, -1
	jr	z, .LBB31_11
; %bb.10:                               ;   in Loop: Header=BB31_8 Depth=2
	ld	l, c
	push	hl
	ld	hl, (ix + 9)
	push	hl
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 1
	ld	(iy + 0), e
	ld	(iy + 1), d
	ld	de, -132
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), c                     ; 1-byte Folded Spill
	call	_Owns
	ld	de, -132
	lea	iy, ix + 0
	add	iy, de
	ld	c, (iy + 0)                     ; 1-byte Folded Reload
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 1
	ld	e, (iy + 0)
	ld	d, (iy + 1)
	pop	hl
	pop	hl
	bit	0, a
	jr	z, .LBB31_12
	.local	.LBB31_11
.LBB31_11:                              ;   in Loop: Header=BB31_8 Depth=2
	ld	iy, (ix - 111)
	ld	l, (iy + 6)
	ld	a, l
	dec	a
	cp	a, 8
	jr	c, .LBB31_14
	.local	.LBB31_12
.LBB31_12:                              ;   in Loop: Header=BB31_8 Depth=2
	ld	iy, (ix - 85)
	.local	.LBB31_13
.LBB31_13:                              ;   in Loop: Header=BB31_8 Depth=2
	ld	hl, (ix - 124)
	ld	bc, 3
	add	hl, bc
	ex	de, hl
	ld	bc, 6
	jp	.LBB31_8
	.local	.LBB31_14
.LBB31_14:                              ;   in Loop: Header=BB31_8 Depth=2
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 4
	ld	(iy + 0), c                     ; 1-byte Folded Spill
	ld	(ix - 111), l                   ; 1-byte Folded Spill
	ld	bc, -129
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), e
	ld	(iy + 1), d
	ld	de, 0
	push	de
	pop	bc
	ld	c, a
	ld	hl, JTI31_0
	add	hl, bc
	add	hl, bc
	add	hl, bc
	ld	hl, (hl)
	ld	a, e
	ld	iy, (ix - 85)
	jp	(hl)
	.local	.LBB31_15
.LBB31_15:                              ;   in Loop: Header=BB31_8 Depth=2
	ld	de, -155
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), a                     ; 1-byte Folded Spill
	ld	de, -132
	lea	iy, ix + 0
	add	iy, de
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	cp	a, d
	jp	nz, .LBB31_42
; %bb.16:                               ;   in Loop: Header=BB31_8 Depth=2
	ld	de, -151
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	ld	hl, (hl)
	jp	.LBB31_43
	.local	.LBB31_17
.LBB31_17:                              ;   in Loop: Header=BB31_8 Depth=2
	ld	c, (ix - 91)
	ld	b, (ix - 90)
	sbc.sis	hl, hl
	adc.sis	hl, bc
	jp	z, .LBB31_13
; %bb.18:                               ;   in Loop: Header=BB31_8 Depth=2
	ld	e, 0
	ld	(ix - 82), e
	ld	hl, (ix - 84)
	ld	h, b
	ld	l, c
	ld	de, -132
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	ld	de, -129
	lea	hl, ix + 0
	add	hl, de
	push	de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	hl
	ld	iyl, e
	ld	iyh, d
	pop	de
	ld	de, -155
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), a                         ; 1-byte Folded Spill
	ld	a, iyh
	rlc	a
	sbc	hl, hl
	push	hl
	pop	bc
	ld	c, iyl
	ld	b, iyh
	ld	a, iyh
	rlc	a
	sbc	a, a
	ld	de, -148
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	de, (iy)
	ld	hl, (iy + 2)
	ld	iy, (iy + 4)
	add.sis	hl, de
	lea	de, iy + 0
	add.sis	hl, de
	ld	e, 0
	ld	(ix - 81), e
	ld	iy, (ix - 83)
	ex	de, hl
	ld	iyh, d
	ex	de, hl
	push	ix
	lea	ix, ix - 128
	ld	(ix - 30), hl
	pop	ix
	ex	de, hl
	ld	iyl, e
	ex	de, hl
	lea	hl, iy + 0
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 27
	ld	d, (iy + 0)                     ; 1-byte Folded Reload
	ld	e, d
	call	__lmulu
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 4
	ld	bc, (iy + 0)
	ld	a, d
	call	__ldivs
	ld	iyl, e
	push	ix
	lea	ix, ix - 128
	ld	(ix - 4), hl
	pop	ix
	call	__lcmpzero
	jr	nz, .LBB31_24
; %bb.19:                               ;   in Loop: Header=BB31_8 Depth=2
	ld	bc, -129
	lea	hl, ix + 0
	add	hl, bc
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	hl
	sbc.sis	hl, hl
	adc.sis	hl, de
	ld	bc, 0
	jr	z, .LBB31_25
; %bb.20:                               ;   in Loop: Header=BB31_8 Depth=2
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 30
	ld	hl, (iy + 0)
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 4
	ld	(iy + 0), bc
	ld	iyl, 0
	jr	z, .LBB31_25
; %bb.21:                               ;   in Loop: Header=BB31_8 Depth=2
	ex.sis	de, hl
	ld.sis	de, 1
	or	a, a
	sbc.sis	hl, de
	call	pe, __setflag
	ld	a, -1
	jp	m, .LBB31_23
; %bb.22:                               ;   in Loop: Header=BB31_8 Depth=2
	ld	a, 0
	.local	.LBB31_23
.LBB31_23:                              ;   in Loop: Header=BB31_8 Depth=2
	rrc	a
	sbc	hl, hl
	ld	e, l
	ld	bc, 1
	xor	a, a
	call	__lor
	ld	bc, -132
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), hl
	ld	iyl, e
	.local	.LBB31_24
.LBB31_24:                              ;   in Loop: Header=BB31_8 Depth=2
	ld	bc, 0
	.local	.LBB31_25
.LBB31_25:                              ;   in Loop: Header=BB31_8 Depth=2
	ld	a, (ix - 111)                   ; 1-byte Folded Reload
	cp	a, 6
	ld	d, -1
	jr	z, .LBB31_27
; %bb.26:                               ;   in Loop: Header=BB31_8 Depth=2
	ld	d, 0
	.local	.LBB31_27
.LBB31_27:                              ;   in Loop: Header=BB31_8 Depth=2
	bit	0, d
	push	bc
	pop	hl
	jr	nz, .LBB31_29
; %bb.28:                               ;   in Loop: Header=BB31_8 Depth=2
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 4)
	pop	ix
	.local	.LBB31_29
.LBB31_29:                              ;   in Loop: Header=BB31_8 Depth=2
	bit	0, d
	ld	e, 0
	jr	nz, .LBB31_31
; %bb.30:                               ;   in Loop: Header=BB31_8 Depth=2
	ld	e, iyl
	.local	.LBB31_31
.LBB31_31:                              ;   in Loop: Header=BB31_8 Depth=2
	ld	bc, (ix - 94)
	ld	a, (ix - 104)                   ; 1-byte Folded Reload
	call	__ladd
	ld	(ix - 94), hl
	ld	(ix - 104), e                   ; 1-byte Folded Spill
	bit	0, d
	jr	nz, .LBB31_33
; %bb.32:                               ;   in Loop: Header=BB31_8 Depth=2
	or	a, a
	sbc	hl, hl
	push	ix
	lea	ix, ix - 128
	ld	(ix - 4), hl
	pop	ix
	.local	.LBB31_33
.LBB31_33:                              ;   in Loop: Header=BB31_8 Depth=2
	bit	0, d
	jr	nz, .LBB31_35
; %bb.34:                               ;   in Loop: Header=BB31_8 Depth=2
	ld	iyl, 0
	.local	.LBB31_35
.LBB31_35:                              ;   in Loop: Header=BB31_8 Depth=2
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 4)
	pop	ix
	ld	e, iyl
	ld	bc, (ix - 85)
	ld	a, (ix - 105)                   ; 1-byte Folded Reload
	call	__ladd
	push	hl
	pop	iy
	ld	(ix - 105), e                   ; 1-byte Folded Spill
	jp	.LBB31_13
	.local	.LBB31_36
.LBB31_36:                              ;   in Loop: Header=BB31_8 Depth=2
	lea	de, iy + 0
	ld	bc, -142
	jr	.LBB31_39
	.local	.LBB31_37
.LBB31_37:                              ;   in Loop: Header=BB31_8 Depth=2
	lea	de, iy + 0
	ld	bc, -139
	jr	.LBB31_39
	.local	.LBB31_38
.LBB31_38:                              ;   in Loop: Header=BB31_8 Depth=2
	lea	de, iy + 0
	ld	bc, -145
	.local	.LBB31_39
.LBB31_39:                              ;   in Loop: Header=BB31_8 Depth=2
	lea	hl, ix + 0
	add	hl, bc
	ld	iy, (hl)
	ld	hl, (iy)
	push	ix
	lea	ix, ix - 128
	ld	c, (ix - 1)
	ld	b, (ix + 0)
	pop	ix
	add.sis	hl, bc
	ld	(iy), l
	ld	(iy + 1), h
	push	de
	pop	iy
	jp	.LBB31_13
	.local	.LBB31_40
.LBB31_40:                              ;   in Loop: Header=BB31_8 Depth=2
	ld	l, (ix - 114)                   ; 1-byte Folded Reload
	ld	bc, -133
	lea	iy, ix + 0
	add	iy, bc
	ld	e, (iy + 0)
	ld	a, l
	or	a, e
	ld	l, a
	ld	iy, (ix + 18)
	ld	(ix - 114), l                   ; 1-byte Folded Spill
	ld	(iy + 46), l
	jp	.LBB31_12
	.local	.LBB31_41
.LBB31_41:                              ;   in Loop: Header=BB31_8 Depth=2
	ld	l, (ix - 121)                   ; 1-byte Folded Reload
	ld	bc, -133
	lea	iy, ix + 0
	add	iy, bc
	ld	e, (iy + 0)
	ld	a, l
	or	a, e
	ld	l, a
	ld	iy, (ix + 18)
	ld	(ix - 121), l                   ; 1-byte Folded Spill
	ld	(iy + 47), l
	jp	.LBB31_12
	.local	.LBB31_42
.LBB31_42:                              ;   in Loop: Header=BB31_8 Depth=2
	ld	l, a
	push	hl
	ld	de, -154
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, (ix + 9)
	push	hl
	call	_TransmissionContribution
                                        ; kill: def $hl killed $hl def $uhl
	pop	de
	pop	de
	pop	de
	.local	.LBB31_43
.LBB31_43:                              ;   in Loop: Header=BB31_8 Depth=2
	xor	a, a
	ld	(ix - 80), a
	ld	iy, (ix - 82)
	ex	de, hl
	ld	iyh, d
	ld	iyl, e
	ex	de, hl
	ld	bc, -129
	lea	hl, ix + 0
	add	hl, bc
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	hl
	ld	a, d
	rlc	a
	sbc	hl, hl
	push	hl
	pop	bc
	ld	c, e
	ld	b, d
	rlc	d
	sbc	a, a
	lea	hl, iy + 0
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 27
	ld	e, (iy + 0)                     ; 1-byte Folded Reload
	call	__lmulu
	ld	bc, 100
	xor	a, a
	call	__ldivs
	ld	a, e
	push	ix
	lea	ix, ix - 128
	ld	iy, (ix - 8)
	pop	ix
	ld	bc, (iy)
	lea	de, iy + 3
	ld	(ix - 111), de
	ld	e, a
	ld	iy, (ix - 111)
	ld	a, (iy)
	call	__ladd
	push	ix
	lea	ix, ix - 128
	ld	iy, (ix - 8)
	pop	ix
	ld	(iy), hl
	ld	(iy + 3), e
	jp	.LBB31_12
	.local	.LBB31_44
.LBB31_44:                              ;   in Loop: Header=BB31_4 Depth=1
	lea	hl, iy + 0
	.local	.LBB31_45
.LBB31_45:                              ; %.loopexit
                                        ;   in Loop: Header=BB31_4 Depth=1
	ld	iy, (ix - 108)
	inc	iy
	ld	bc, 4
	ex	de, hl
	jp	.LBB31_4
	.local	.LBB31_46
.LBB31_46:
	ld	bc, 14
	push	hl
	pop	iy
	ld	de, 0
	.local	.LBB31_47
.LBB31_47:                              ; =>This Inner Loop Header: Depth=1
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	jp	z, .LBB31_69
; %bb.48:                               ;   in Loop: Header=BB31_47 Depth=1
	ld	hl, (ix + 15)
	ld	(ix - 91), de
	add	hl, de
	ld	(ix - 121), hl
	ld	hl, (hl)
	ld	(ix - 114), hl
	xor	a, a
	ld	(ix - 79), a
	ld	bc, (ix - 81)
	ld	b, h
	ld	c, l
	sbc	hl, hl
	ld	a, l
	ld	hl, (ix - 88)
	ld	de, (hl)
	ex	de, hl
	ld	iy, (ix - 88)
	ld	e, (iy + 3)
	ld	d, a
	call	__ladd
	ld	(ix - 108), hl
	ld	(ix - 111), e                   ; 1-byte Folded Spill
	ld	hl, (ix - 114)
	ld	a, h
                                        ; kill: def $l killed $l killed $uhl
	srl	a
	rr	l
	ex	de, hl
	ld	iyl, e
	ex	de, hl
	ld	iyh, a
	push	bc
	pop	hl
	ld	e, d
	ld	bc, 150
	xor	a, a
	call	__lmulu
	ld	bc, 100
	call	__ldivu
	ld	(ix - 114), hl
	ld	(ix - 124), e                   ; 1-byte Folded Spill
	ld	(ix - 78), a
	ld	bc, (ix - 80)
	ld	b, iyh
	ld	c, iyl
	ld	hl, (ix - 108)
	ld	e, (ix - 111)                   ; 1-byte Folded Reload
	ld	a, d
	call	__lcmps
	call	pe, __setflag
	ld	d, 1
	jp	m, .LBB31_50
; %bb.49:                               ;   in Loop: Header=BB31_47 Depth=1
	ld	d, 0
	.local	.LBB31_50
.LBB31_50:                              ;   in Loop: Header=BB31_47 Depth=1
	ld	hl, (ix - 114)
	ld	e, (ix - 124)                   ; 1-byte Folded Reload
	ld	bc, 65535
	xor	a, a
	call	__land
	ld	bc, (ix - 108)
	ld	a, (ix - 111)                   ; 1-byte Folded Reload
	call	__lcmps
	call	pe, __setflag
	jp	m, .LBB31_52
; %bb.51:                               ;   in Loop: Header=BB31_47 Depth=1
	ld	(ix - 114), bc
	.local	.LBB31_52
.LBB31_52:                              ;   in Loop: Header=BB31_47 Depth=1
	bit	0, d
	ld	de, (ix - 91)
	jr	nz, .LBB31_54
; %bb.53:                               ;   in Loop: Header=BB31_47 Depth=1
	ld	hl, (ix - 114)
	ex	de, hl
	ld	iyl, e
	ld	iyh, d
	ex	de, hl
	.local	.LBB31_54
.LBB31_54:                              ;   in Loop: Header=BB31_47 Depth=1
	ex	de, hl
	ld	e, iyl
	ld	d, iyh
	ex	de, hl
	ld.sis	bc, 10000
	or	a, a
	sbc.sis	hl, bc
	jr	c, .LBB31_56
; %bb.55:                               ;   in Loop: Header=BB31_47 Depth=1
	ld.sis	iy, 10000
	.local	.LBB31_56
.LBB31_56:                              ;   in Loop: Header=BB31_47 Depth=1
	ld	hl, (ix - 121)
	push	de
	ld	e, iyl
	ld	d, iyh
	ld	(hl), e
	inc	hl
	ld	(hl), d
	pop	de
	ld	hl, (ix - 97)
	add	hl, de
	ld	de, (hl)
	ld	iyl, e
	ld	iyh, d
	ld.sis	bc, 100
	add.sis	iy, bc
	ld	l, e
	ld	h, d
	ld.sis	bc, 51
	or	a, a
	sbc.sis	hl, bc
	call	pe, __setflag
	ld.sis	bc, 150
	jp	p, .LBB31_58
; %bb.57:                               ;   in Loop: Header=BB31_47 Depth=1
	ld	c, iyl
	ld	b, iyh
	.local	.LBB31_58
.LBB31_58:                              ;   in Loop: Header=BB31_47 Depth=1
	ld	iyl, c
	ld	iyh, b
	ld	l, e
	ld	h, d
	ld.sis	de, -50
	or	a, a
	sbc.sis	hl, de
	call	pe, __setflag
	ld.sis	hl, 50
	ld	c, l
	ld	b, h
	jp	m, .LBB31_60
; %bb.59:                               ;   in Loop: Header=BB31_47 Depth=1
	ld	c, iyl
	ld	b, iyh
	.local	.LBB31_60
.LBB31_60:                              ;   in Loop: Header=BB31_47 Depth=1
	ld	de, (ix + 18)
	ex	de, hl
	ld	de, (ix - 91)
	add	hl, de
	ld	(ix - 108), hl
	ld	(hl), c
	inc	hl
	ld	(hl), b
	ld	hl, (ix - 100)
	add	hl, de
	ld	de, (hl)
	ld	iyl, e
	ld	iyh, d
	ld.sis	bc, 100
	add.sis	iy, bc
	ld	l, e
	ld	h, d
	ld.sis	bc, 51
	or	a, a
	sbc.sis	hl, bc
	call	pe, __setflag
	ld.sis	bc, 150
	jp	p, .LBB31_62
; %bb.61:                               ;   in Loop: Header=BB31_47 Depth=1
	ld	c, iyl
	ld	b, iyh
	.local	.LBB31_62
.LBB31_62:                              ;   in Loop: Header=BB31_47 Depth=1
	ld	l, e
	ld	h, d
	ld.sis	de, -50
	or	a, a
	sbc.sis	hl, de
	call	pe, __setflag
	ld.sis	hl, 50
	jp	m, .LBB31_64
; %bb.63:                               ;   in Loop: Header=BB31_47 Depth=1
	ld	l, c
	ld	h, b
	.local	.LBB31_64
.LBB31_64:                              ;   in Loop: Header=BB31_47 Depth=1
	ld	iy, (ix - 108)
	ld	(iy + 14), l
	ld	(iy + 15), h
	ld	hl, (ix - 103)
	ld	de, (ix - 91)
	add	hl, de
	ld	de, (hl)
	ld	iyl, e
	ld	iyh, d
	ld.sis	bc, 100
	add.sis	iy, bc
	ld	l, e
	ld	h, d
	ld.sis	bc, 51
	or	a, a
	sbc.sis	hl, bc
	call	pe, __setflag
	ld.sis	bc, 150
	jp	p, .LBB31_66
; %bb.65:                               ;   in Loop: Header=BB31_47 Depth=1
	ld	c, iyl
	ld	b, iyh
	.local	.LBB31_66
.LBB31_66:                              ;   in Loop: Header=BB31_47 Depth=1
	ld	l, e
	ld	h, d
	ld.sis	de, -50
	or	a, a
	sbc.sis	hl, de
	call	pe, __setflag
	ld.sis	hl, 50
	jp	m, .LBB31_68
; %bb.67:                               ;   in Loop: Header=BB31_47 Depth=1
	ld	l, c
	ld	h, b
	.local	.LBB31_68
.LBB31_68:                              ;   in Loop: Header=BB31_47 Depth=1
	ld	iy, (ix - 108)
	ld	(iy + 28), l
	ld	(iy + 29), h
	ld	hl, (ix - 91)
	ld	de, 2
	add	hl, de
	ld	iy, (ix - 88)
	lea	iy, iy + 4
	ld	(ix - 88), iy
	ex	de, hl
	ld	iy, (ix - 85)
	ld	bc, 14
	jp	.LBB31_47
	.local	.LBB31_69
.LBB31_69:
	lea	hl, iy + 0
	ld	e, (ix - 105)                   ; 1-byte Folded Reload
	ld	bc, -25
	ld	a, b
	call	__lcmps
	call	pe, __setflag
	ld	d, 1
	ld	iyl, 0
	ld	a, d
	jp	m, .LBB31_71
; %bb.70:
	ld	a, iyl
	.local	.LBB31_71
.LBB31_71:
	ld	(ix - 88), a
	ld	hl, 25
	ld	e, h
	ld	bc, (ix - 85)
	ld	a, (ix - 105)                   ; 1-byte Folded Reload
	call	__lcmps
	call	pe, __setflag
	jp	m, .LBB31_73
; %bb.72:
	ld	d, iyl
	.local	.LBB31_73
.LBB31_73:
	ld.sis	bc, 100
	ld	iy, (ix - 85)
	add.sis	iy, bc
	bit	0, d
	ld.sis	hl, 125
	ld	a, (ix - 88)                    ; 1-byte Folded Reload
	jr	nz, .LBB31_75
; %bb.74:
	ex	de, hl
	ld	e, iyl
	ld	d, iyh
	ex	de, hl
	.local	.LBB31_75
.LBB31_75:
	bit	0, a
	ld.sis	de, 75
	jr	nz, .LBB31_77
; %bb.76:
	ex.sis	de, hl
	.local	.LBB31_77
.LBB31_77:
	ld	iy, (ix + 18)
	ld	(iy + 44), e
	ld	(iy + 45), d
	ld	hl, (ix - 94)
	ld	e, (ix - 104)                   ; 1-byte Folded Reload
	ld	bc, -25
	ld	a, b
	call	__lcmps
	call	pe, __setflag
	ld	d, 1
	ld	iyl, 0
	ld	a, d
	jp	m, .LBB31_79
; %bb.78:
	ld	a, iyl
	.local	.LBB31_79
.LBB31_79:
	ld	iyh, a
	ld	hl, 25
	ld	e, h
	ld	bc, (ix - 94)
	ld	a, (ix - 104)                   ; 1-byte Folded Reload
	call	__lcmps
	call	pe, __setflag
	jp	m, .LBB31_81
; %bb.80:
	ld	d, iyl
	.local	.LBB31_81
.LBB31_81:
	ld.sis	bc, 100
	ld	hl, (ix - 94)
	add.sis	hl, bc
	bit	0, d
	ld	a, iyh
	jp	nz, .LBB31_83
; %bb.82:
                                        ; kill: def $hl killed $hl killed $uhl
	ld	(ix - 118), l
	ld	(ix - 117), h
	.local	.LBB31_83
.LBB31_83:
	bit	0, a
	jr	nz, .LBB31_85
; %bb.84:
	ld	l, (ix - 118)
	ld	h, (ix - 117)
	ld	(ix - 116), l
	ld	(ix - 115), h
	.local	.LBB31_85
.LBB31_85:
	ld	iy, (ix + 18)
	ld	l, (ix - 116)
	ld	h, (ix - 115)
	ld	(iy + 42), l
	ld	(iy + 43), h
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end31
.Lfunc_end31:
	.size	_EventsApply, .Lfunc_end31-_EventsApply
	.section	.rodata._EventsApply,"a",@progbits
JTI31_0:
	d24	.LBB31_15
	d24	.LBB31_38
	d24	.LBB31_36
	d24	.LBB31_37
	d24	.LBB31_17
	d24	.LBB31_17
	d24	.LBB31_40
	d24	.LBB31_41
                                        ; -- End function
	.section	.text._EvolutionMenu,"ax",@progbits
	.globl	_EvolutionMenu                  ; -- Begin function EvolutionMenu
	.type	_EvolutionMenu,@function
_EvolutionMenu:                         ; @EvolutionMenu
; %bb.0:
	ld	hl, -444
	call	__frameset
	ld	de, -175
	lea	iy, ix + 0
	add	iy, de
	ld	bc, -332
	lea	hl, ix + 0
	add	hl, bc
	ex	de, hl
	lea	hl, ix - 88
	push	ix
	ld	bc, -351
	add	ix, bc
	ld	(ix + 0), hl
	pop	ix
	lea	hl, iy + 28
	push	ix
	ld	bc, -372
	add	ix, bc
	ld	(ix + 0), hl
	pop	ix
	ld	bc, -366
	lea	hl, ix + 0
	add	hl, bc
	ld	(hl), iy
	lea	hl, iy + 0
	ld	bc, -375
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), hl
	push	de
	pop	iy
	lea	hl, iy + 67
	push	ix
	ld	de, -378
	add	ix, de
	ld	(ix + 0), hl
	pop	ix
	lea	bc, iy + 64
	lea	de, iy + 0
	push	ix
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 85
	ld	(ix + 0), de
	pop	ix
	ld	hl, _first_node
	ld	a, (hl)
	push	bc
	pop	hl
	push	ix
	ld	de, -357
	add	ix, de
	ld	(ix + 0), hl
	pop	ix
	ld	(hl), a
	ld	a, (_first_node+1)
	ld	(iy + 65), a
	ld	a, (_first_node+2)
	ld	de, -381
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), iy
	ld	(iy + 66), a
	ld	e, 1
	xor	a, a
	ld	l, a
	ld	bc, -335
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), hl
	.local	.LBB32_1
.LBB32_1:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB32_21 Depth 2
                                        ;     Child Loop BB32_24 Depth 2
                                        ;       Child Loop BB32_27 Depth 3
                                        ;     Child Loop BB32_33 Depth 2
                                        ;     Child Loop BB32_49 Depth 2
                                        ;       Child Loop BB32_55 Depth 3
	bit	0, e
	jr	z, .LBB32_3
; %bb.2:                                ;   in Loop: Header=BB32_1 Depth=1
	ld	de, -335
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, 3
	push	hl
	ld	hl, _categories
	push	hl
	ld	hl, _.str.433
	push	hl
	call	_ChooseMenu
	ld	iy, _categories
	ld	e, a
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	cp	a, -1
	jp	z, .LBB32_117
	jr	.LBB32_4
	.local	.LBB32_3
.LBB32_3:                               ;   in Loop: Header=BB32_1 Depth=1
	ld	de, _categories
	push	de
	pop	iy
	ld	bc, -335
	lea	hl, ix + 0
	add	hl, bc
	ld	de, (hl)
	.local	.LBB32_4
.LBB32_4:                               ;   in Loop: Header=BB32_1 Depth=1
	ld	bc, -335
	lea	hl, ix + 0
	add	hl, bc
	ld	(hl), de
	ld	bc, 0
	ld	c, e
	push	ix
	ld	de, -357
	add	ix, de
	ld	hl, (ix + 0)
	pop	ix
	add	hl, bc
	ld	a, (hl)
	ld	de, -345
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), a
	ld	de, -348
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), bc
	push	bc
	pop	hl
	ld	bc, 3
	call	__imulu
	push	hl
	pop	bc
	lea	hl, iy + 0
	add	hl, bc
	ld	hl, (hl)
	push	hl
	call	_BeginScreen
	pop	hl
	ld	hl, _disease+20
	ld	hl, (hl)
	ld	de, 0
	ld	e, l
	ld	d, h
	push	de
	ld	hl, _.str.1.434
	push	hl
	ld	hl, 64
	push	hl
	ld	de, -341
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_snprintf
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 24
	push	hl
	ld	hl, 8
	push	hl
	ld	de, -341
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	bc, -335
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	ld	a, e
	or	a, a
	ld	l, -1
	jr	z, .LBB32_6
; %bb.5:                                ;   in Loop: Header=BB32_1 Depth=1
	ld	l, 0
	.local	.LBB32_6
.LBB32_6:                               ;   in Loop: Header=BB32_1 Depth=1
	ld	a, e
	cp	a, 1
	ld	a, -1
	jr	z, .LBB32_8
; %bb.7:                                ;   in Loop: Header=BB32_1 Depth=1
	ld	a, 0
	.local	.LBB32_8
.LBB32_8:                               ;   in Loop: Header=BB32_1 Depth=1
	bit	0, a
	ld	de, 3
	jr	nz, .LBB32_10
; %bb.9:                                ;   in Loop: Header=BB32_1 Depth=1
	ld	de, 5
	.local	.LBB32_10
.LBB32_10:                              ;   in Loop: Header=BB32_1 Depth=1
	bit	0, l
	ld	bc, 7
	jr	nz, .LBB32_12
; %bb.11:                               ;   in Loop: Header=BB32_1 Depth=1
	push	de
	pop	bc
	.local	.LBB32_12
.LBB32_12:                              ;   in Loop: Header=BB32_1 Depth=1
	ld	de, -344
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), bc
	bit	0, a
	ld	de, 105
	push	de
	pop	iy
	jr	nz, .LBB32_14
; %bb.13:                               ;   in Loop: Header=BB32_1 Depth=1
	ld	de, 63
	push	de
	pop	iy
	.local	.LBB32_14
.LBB32_14:                              ;   in Loop: Header=BB32_1 Depth=1
	bit	0, a
	ld	bc, 55
	jr	nz, .LBB32_16
; %bb.15:                               ;   in Loop: Header=BB32_1 Depth=1
	ld	bc, 32
	.local	.LBB32_16
.LBB32_16:                              ;   in Loop: Header=BB32_1 Depth=1
	bit	0, l
	ld	de, 45
	push	ix
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 98
	ld	(ix + 0), de
	pop	ix
	jr	nz, .LBB32_18
; %bb.17:                               ;   in Loop: Header=BB32_1 Depth=1
	push	ix
	ld	de, -354
	add	ix, de
	ld	(ix + 0), iy
	pop	ix
	.local	.LBB32_18
.LBB32_18:                              ;   in Loop: Header=BB32_1 Depth=1
	bit	0, l
	ld	hl, 22
	ld	de, -338
	lea	iy, ix + 0
	push	af
	add	iy, de
	pop	af
	ld	(iy + 0), hl
	jr	nz, .LBB32_20
; %bb.19:                               ;   in Loop: Header=BB32_1 Depth=1
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), bc
	.local	.LBB32_20
.LBB32_20:                              ;   in Loop: Header=BB32_1 Depth=1
	ld	de, -348
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	ld	bc, 21
	call	__imulu
	ex	de, hl
	ld	hl, _branch_labels
	push	hl
	pop	iy
	add	iy, de
	ld	bc, -344
	lea	hl, ix + 0
	add	hl, bc
	ld	de, (hl)
	.local	.LBB32_21
.LBB32_21:                              ;   Parent Loop BB32_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	sbc	hl, hl
	adc	hl, de
	jp	z, .LBB32_23
; %bb.22:                               ;   in Loop: Header=BB32_21 Depth=2
	ld	hl, (iy)
	push	ix
	ld	bc, -363
	add	ix, bc
	ld	(ix + 0), hl
	pop	ix
	push	hl
	ld	bc, -344
	lea	hl, ix + 0
	add	hl, bc
	ld	(hl), de
	ld	de, -360
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), iy
	call	_gfx_GetStringWidth
	pop	de
	call	__ishru_1
	ex	de, hl
	ld	bc, -338
	lea	iy, ix + 0
	add	iy, bc
	ld	hl, (iy + 0)
	or	a, a
	sbc	hl, de
	ld	de, 40
	push	de
	push	hl
	ld	de, -363
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_Text
	ld	de, -360
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	bc, -344
	lea	hl, ix + 0
	add	hl, bc
	ld	de, (hl)
	pop	hl
	pop	hl
	pop	hl
	dec	de
	lea	iy, iy + 3
	push	ix
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 98
	ld	bc, (ix + 0)
	pop	ix
	push	ix
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 82
	ld	hl, (ix + 0)
	pop	ix
	add	hl, bc
	push	ix
	ld	bc, -338
	add	ix, bc
	ld	(ix + 0), hl
	pop	ix
	jp	.LBB32_21
	.local	.LBB32_23
.LBB32_23:                              ;   in Loop: Header=BB32_1 Depth=1
	ld	hl, 181
	push	hl
	call	_gfx_SetColor
	pop	hl
	ld	hl, _traits+6
	push	hl
	pop	iy
	ld	bc, 0
	.local	.LBB32_24
.LBB32_24:                              ;   Parent Loop BB32_1 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB32_27 Depth 3
	push	bc
	pop	hl
	ld	de, 39
	or	a, a
	sbc	hl, de
	jp	z, .LBB32_32
; %bb.25:                               ;   in Loop: Header=BB32_24 Depth=2
	ld	de, -338
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), bc
	push	bc
	pop	hl
	ld	bc, 22
	call	__imulu
	ex	de, hl
	ld	hl, _traits
	lea	bc, iy + 0
	push	hl
	pop	iy
	add	iy, de
	ld	de, -344
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), iy
	ld	a, (iy + 9)
	push	bc
	pop	iy
	push	ix
	ld	de, -335
	add	ix, de
	ld	hl, (ix + 0)
	pop	ix
	cp	a, l
	jp	nz, .LBB32_31
; %bb.26:                               ;   in Loop: Header=BB32_24 Depth=2
	or	a, a
	sbc	hl, hl
	push	hl
	pop	bc
	.local	.LBB32_27
.LBB32_27:                              ;   Parent Loop BB32_1 Depth=1
                                        ;     Parent Loop BB32_24 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	push	bc
	pop	hl
	ld	de, 2
	or	a, a
	sbc	hl, de
	jp	z, .LBB32_31
; %bb.28:                               ;   in Loop: Header=BB32_27 Depth=3
	ld	de, -354
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), iy
	add	iy, bc
	ld	a, (iy)
	cp	a, -1
	jp	z, .LBB32_30
; %bb.29:                               ;   in Loop: Header=BB32_27 Depth=3
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	de, -360
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), bc
	ld	bc, 22
	call	__imulu
	ex	de, hl
	ld	iy, _traits
	add	iy, de
	ld	de, (iy + 14)
	ld	bc, 0
	push	bc
	pop	hl
	ld	l, e
	ld	h, d
	push	ix
	ld	de, -369
	add	ix, de
	ld	(ix + 0), hl
	pop	ix
	ld	a, (iy + 16)
	push	bc
	pop	de
	push	bc
	pop	hl
	ld	e, a
	push	ix
	ld	bc, -344
	add	ix, bc
	ld	iy, (ix + 0)
	pop	ix
	ld	bc, (iy + 14)
	push	ix
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 107
	ld	(ix + 0), bc
	pop	ix
	push	ix
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 107
	ld	bc, (ix + 0)
	pop	ix
	ld	l, c
	ld	h, b
	ld	a, (iy + 16)
	ld	iy, 0
	ld	iyl, a
	push	iy
	push	hl
	push	de
	ld	de, -369
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_gfx_Line
	ld	de, -360
	lea	iy, ix + 0
	add	iy, de
	ld	bc, (iy + 0)
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	.local	.LBB32_30
.LBB32_30:                              ;   in Loop: Header=BB32_27 Depth=3
	inc	bc
	ld	de, -354
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	jp	.LBB32_27
	.local	.LBB32_31
.LBB32_31:                              ; %.loopexit
                                        ;   in Loop: Header=BB32_24 Depth=2
	ld	de, -338
	lea	hl, ix + 0
	add	hl, de
	ld	bc, (hl)
	inc	bc
	lea	iy, iy + 22
	jp	.LBB32_24
	.local	.LBB32_32
.LBB32_32:                              ;   in Loop: Header=BB32_1 Depth=1
	or	a, a
	sbc	hl, hl
	ld	de, -345
	lea	iy, ix + 0
	add	iy, de
	ld	l, (iy + 0)                     ; 1-byte Folded Reload
	inc	de
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	ld	bc, 22
	call	__imulu
	ld	de, -363
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	xor	a, a
	ld	l, a
	ld	de, -338
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	or	a, a
	sbc	hl, hl
	push	ix
	ld	de, -335
	add	ix, de
	ld	iy, (ix + 0)
	.local	.LBB32_33
.LBB32_33:                              ;   Parent Loop BB32_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	pop	ix
	push	hl
	pop	bc
	ld	de, 858
	or	a, a
	sbc	hl, de
	jp	z, .LBB32_39
; %bb.34:                               ;   in Loop: Header=BB32_33 Depth=2
	ld	hl, _traits
	lea	de, iy + 0
	push	hl
	pop	iy
	add	iy, bc
	push	ix
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 104
	ld	(ix + 0), iy
	pop	ix
	ld	a, (iy + 9)
	push	de
	pop	iy
	cp	a, iyl
	jp	nz, .LBB32_38
; %bb.35:                               ;   in Loop: Header=BB32_33 Depth=2
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 82
	ld	de, (iy + 0)
	push	de
	ld	de, -369
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), bc
	call	_StateSymbol
	pop	hl
	ld	(ix - 88), a
	ld	(ix - 87), 0
	or	a, a
	sbc	hl, hl
	push	hl
	call	_gfx_SetColor
	pop	hl
	ld	de, -360
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	hl, (iy + 14)
	ld	de, 0
	ld	e, l
	ld	d, h
	ld	bc, -354
	lea	hl, ix + 0
	add	hl, bc
	ld	(hl), de
	ld	a, (iy + 16)
	ld	bc, 0
	ld	c, a
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 104
	ld	(iy + 0), bc
	ld	hl, 10
	push	hl
	push	bc
	push	de
	call	_gfx_FillCircle
	pop	hl
	pop	hl
	pop	hl
	ld	de, -338
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _disease
	push	hl
	call	_Owns
	pop	hl
	pop	hl
	ld	l, 1
	xor	a, l
	ld	l, a
	ld	b, 7
	call	__bshl
	rlc	a
	sbc	a, a
	ld	l, -32
	or	a, l
	ld	l, a
	push	hl
	call	_gfx_SetColor
	pop	hl
	ld	hl, 10
	push	hl
	ld	de, -360
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -354
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_gfx_Circle
	pop	hl
	pop	hl
	pop	hl
	ld	de, -363
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	ld	bc, -369
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	or	a, a
	sbc	hl, de
	jr	nz, .LBB32_37
; %bb.36:                               ;   in Loop: Header=BB32_33 Depth=2
	ld	de, -354
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	hl, -13
	ex	de, hl
	add	iy, de
	push	ix
	ld	bc, -360
	add	ix, bc
	ld	hl, (ix + 0)
	pop	ix
	add	hl, de
	ld	de, 27
	push	de
	push	de
	push	hl
	push	iy
	call	_gfx_Rectangle
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	.local	.LBB32_37
.LBB32_37:                              ;   in Loop: Header=BB32_33 Depth=2
	ld	de, -3
	ld	bc, -354
	lea	hl, ix + 0
	add	hl, bc
	ld	iy, (hl)
	add	iy, de
	dec	de
	push	ix
	ld	bc, -360
	add	ix, bc
	ld	hl, (ix + 0)
	pop	ix
	add	hl, de
	push	hl
	push	iy
	pea	ix - 88
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	de, -335
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	de, -369
	lea	hl, ix + 0
	add	hl, de
	ld	bc, (hl)
	.local	.LBB32_38
.LBB32_38:                              ;   in Loop: Header=BB32_33 Depth=2
	push	bc
	pop	hl
	ld	de, 22
	add	hl, de
	push	ix
	ld	bc, -338
	add	ix, bc
	ld	de, (ix + 0)
	pop	ix
	inc	e
	push	ix
	add	ix, bc
	ld	(ix + 0), de
	jp	.LBB32_33
	.local	.LBB32_39
.LBB32_39:                              ;   in Loop: Header=BB32_1 Depth=1
	ld	a, iyl
	or	a, a
	ld	iy, 8
	jr	nz, .LBB32_41
; %bb.40:                               ;   in Loop: Header=BB32_1 Depth=1
	ld	hl, 163
	push	hl
	ld	hl, 22
	push	hl
	ld	hl, _.str.2.435
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 163
	push	hl
	ld	hl, 105
	push	hl
	ld	hl, _.str.3.436
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 163
	push	hl
	ld	hl, 208
	push	hl
	ld	hl, _.str.4.437
	push	hl
	call	_Text
	ld	iy, 8
	pop	hl
	pop	hl
	pop	hl
	.local	.LBB32_41
.LBB32_41:                              ;   in Loop: Header=BB32_1 Depth=1
	push	ix
	ld	de, -344
	add	ix, de
	ld	hl, (ix + 0)
	pop	ix
	ld	bc, 22
	call	__imulu
	ex	de, hl
	ld	hl, _traits
	add	hl, de
	push	ix
	ld	de, -338
	add	ix, de
	ld	(ix + 0), hl
	pop	ix
	ld	de, (hl)
	ld	hl, 180
	push	hl
	push	iy
	ld	bc, -363
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), de
	push	de
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	de, -338
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	e, (iy + 8)
	or	a, a
	sbc	hl, hl
	ld	bc, -360
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), e
	ld	(iy + 1), d
	ld	l, e
	ld	de, -354
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	push	hl
	ld	hl, _.str.5.438
	push	hl
	ld	hl, 64
	push	hl
	ld	de, -341
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_snprintf
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 194
	push	hl
	ld	hl, 8
	push	hl
	ld	de, -341
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 211
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, _.str.6.439
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 226
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, _.str.7.440
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	call	_gfx_SwapDraw
	call	_WaitKey
	ld	l, a
	cp	a, 6
	ld	a, -1
	ld	e, a
	jr	z, .LBB32_43
; %bb.42:                               ;   in Loop: Header=BB32_1 Depth=1
	ld	a, 0
	ld	e, a
	.local	.LBB32_43
.LBB32_43:                              ;   in Loop: Header=BB32_1 Depth=1
	bit	0, e
	jr	z, .LBB32_45
	.local	.LBB32_44
.LBB32_44:                              ;   in Loop: Header=BB32_1 Depth=1
	ld	bc, -345
	lea	iy, ix + 0
	add	iy, bc
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	jp	.LBB32_115
	.local	.LBB32_45
.LBB32_45:                              ;   in Loop: Header=BB32_1 Depth=1
	ld	a, l
	dec	a
	cp	a, 4
	jr	nc, .LBB32_47
; %bb.46:                               ;   in Loop: Header=BB32_1 Depth=1
	ld	bc, 0
	ld	c, l
	push	ix
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 82
	ld	iy, (ix + 0)
	pop	ix
	add	iy, bc
	ld	a, (iy + 16)
	ld	bc, -357
	lea	iy, ix + 0
	add	iy, bc
	ld	hl, (iy + 0)
	ld	c, e
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 92
	ld	de, (iy + 0)
	add	hl, de
	ld	e, c
	ld	(hl), a
	jp	.LBB32_115
	.local	.LBB32_47
.LBB32_47:                              ;   in Loop: Header=BB32_1 Depth=1
	ld	a, l
	cp	a, 5
	jr	nz, .LBB32_44
; %bb.48:                               ;   in Loop: Header=BB32_1 Depth=1
	ld	bc, -399
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), e                     ; 1-byte Folded Spill
	ld	(ix - 8), 0
	ld	l, -17
	push	ix
	ld	de, -345
	add	ix, de
	push	af
	ld	a, (ix + 0)                     ; 1-byte Folded Reload
	ld	iyh, a
	pop	af
	pop	ix
	ld	a, iyh
	add	a, l
	ld	l, a
	push	ix
	ld	de, -369
	add	ix, de
	ld	(ix + 0), l
	pop	ix
	ld	l, 31
	ld	a, iyh
	and	a, l
	ld	l, a
	ld	de, 1
	push	de
	pop	bc
	ld	iyl, d
	ld	a, iyl
	call	__lshl
	ld	de, -402
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), bc
	dec	de
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), a                         ; 1-byte Folded Spill
	push	ix
	ld	de, -344
	add	ix, de
	ld	hl, (ix + 0)
	pop	ix
	ld	c, 5
	call	__ishru
	add	hl, hl
	add	hl, hl
	ex	de, hl
	push	ix
	ld	bc, -372
	add	ix, bc
	ld	hl, (ix + 0)
	pop	ix
	add	hl, de
	push	ix
	ld	de, -390
	add	ix, de
	ld	(ix + 0), hl
	pop	ix
	ld	bc, 1
	ld	a, iyl
	ex	de, hl
	ld	e, iyh
	ex	de, hl
	call	__lshl
	push	bc
	pop	hl
	ld	e, a
	call	__lnot
	push	ix
	ld	bc, -406
	add	ix, bc
	ld	(ix + 0), hl
	pop	ix
	dec	bc
	lea	hl, ix + 0
	add	hl, bc
	ld	(hl), e                         ; 1-byte Folded Spill
	ld	l, 62
	ld	a, iyh
	and	a, l
	ld	l, a
	push	ix
	ld	de, -426
	add	ix, de
	ld	(ix + 0), l
	pop	ix
	ld	de, -37
	push	ix
	ld	bc, -344
	add	ix, bc
	ld	hl, (ix + 0)
	pop	ix
	add	hl, de
	add	hl, hl
	ex	de, hl
	ld	hl, _reshuffle_reductions
	add	hl, de
	push	ix
	ld	de, -425
	add	ix, de
	ld	(ix + 0), hl
	pop	ix
	ld	de, -369
	lea	hl, ix + 0
	add	hl, de
	ld	a, (hl)                         ; 1-byte Folded Reload
	cp	a, 12
	ccf
                                        ; kill: def $a killed $a
	sbc	a, a
	inc	a
	ld	l, 2
	add	a, l
	ld	l, a
	push	ix
	ld	de, -410
	add	ix, de
	ld	(ix + 0), hl
	pop	ix
	ld	d, iyl
	push	ix
	ld	bc, -360
	add	ix, bc
	ld	l, (ix + 0)
	ld	h, (ix + 1)
	pop	ix
	push	ix
	ld	bc, -392
	add	ix, bc
	ld	(ix + 0), e
	ld	(ix + 1), d
	pop	ix
	ld	h, d
	push	ix
	ld	de, -360
	add	ix, de
	ld	(ix + 0), l
	ld	(ix + 1), h
	pop	ix
	ex	de, hl
	ld	e, iyh
	ex	de, hl
	push	ix
	ld	de, -395
	add	ix, de
	ld	(ix + 0), hl
	pop	ix
	push	ix
	ld	de, -413
	add	ix, de
	ld	(ix + 0), hl
	pop	ix
	push	ix
	ld	de, -398
	add	ix, de
	ld	(ix + 0), hl
	pop	ix
	push	ix
	ld	de, -416
	add	ix, de
	ld	(ix + 0), hl
	pop	ix
	push	ix
	ld	de, -429
	add	ix, de
	ld	(ix + 0), hl
	pop	ix
	push	ix
	ld	de, -435
	add	ix, de
	ld	(ix + 0), hl
	pop	ix
	push	ix
	ld	de, -441
	add	ix, de
	ld	(ix + 0), hl
	pop	ix
	push	ix
	ld	de, -432
	add	ix, de
	ld	(ix + 0), hl
	pop	ix
	push	ix
	ld	de, -438
	add	ix, de
	ld	(ix + 0), hl
	pop	ix
	push	ix
	ld	de, -419
	add	ix, de
	ld	(ix + 0), hl
	pop	ix
	ld	a, iyl
	ld	de, -372
	lea	iy, ix + 0
	add	iy, de
	ld	bc, (iy + 0)
	ld	hl, _.str.567
	.local	.LBB32_49
.LBB32_49:                              ;   Parent Loop BB32_1 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB32_55 Depth 3
	ld	de, -384
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	push	bc
	pop	de
	ld	hl, _disease
	ld	bc, 58
	ldir
	cp	a, 1
	ld	l, -1
	jr	z, .LBB32_51
; %bb.50:                               ;   in Loop: Header=BB32_49 Depth=2
	ld	l, 0
	.local	.LBB32_51
.LBB32_51:                              ;   in Loop: Header=BB32_49 Depth=2
	ld	de, -369
	lea	iy, ix + 0
	add	iy, de
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	cp	a, 12
                                        ; kill: def $a killed $a
	sbc	a, a
	and	a, l
	ld	l, a
	bit	0, l
	ld	de, -344
	lea	iy, ix + 0
	push	af
	add	iy, de
	pop	af
	ld	(iy + 0), l
	jr	z, .LBB32_53
; %bb.52:                               ;   in Loop: Header=BB32_49 Depth=2
	ld	de, -366
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	hl, (iy + 28)
	push	ix
	ld	de, -372
	add	ix, de
	ld	iy, (ix + 0)
	pop	ix
	lea	iy, iy + 3
	ld	e, (iy)
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 22
	ld	bc, (iy + 0)
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 23
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	call	__land
	push	ix
	ld	bc, -366
	add	ix, bc
	ld	iy, (ix + 0)
	pop	ix
	ld	(iy + 28), hl
	lea	hl, ix + 0
	add	hl, bc
	ld	iy, (hl)
	ld	(iy + 31), e
	jr	.LBB32_54
	.local	.LBB32_53
.LBB32_53:                              ;   in Loop: Header=BB32_49 Depth=2
	ld	de, -390
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	hl, (iy)
	lea	iy, iy + 3
	ld	e, (iy)
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 18
	ld	bc, (iy + 0)
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 19
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	call	__lor
	push	ix
	ld	bc, -390
	add	ix, bc
	ld	iy, (ix + 0)
	pop	ix
	ld	(iy), hl
	ld	(iy + 3), e
	.local	.LBB32_54
.LBB32_54:                              ;   in Loop: Header=BB32_49 Depth=2
	ld	bc, -372
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	ld	bc, -375
	lea	iy, ix + 0
	add	iy, bc
	ld	hl, (iy + 0)
	push	hl
	push	de
	call	_CalculateEffects
	pop	hl
	pop	hl
	ld	iy, _region+10
	or	a, a
	sbc	hl, hl
	.local	.LBB32_55
.LBB32_55:                              ;   Parent Loop BB32_1 Depth=1
                                        ;     Parent Loop BB32_49 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	push	hl
	pop	bc
	ld	de, 42
	or	a, a
	sbc	hl, de
	jr	z, .LBB32_57
; %bb.56:                               ;   in Loop: Header=BB32_55 Depth=3
	push	ix
	ld	de, -378
	add	ix, de
	ld	hl, (ix + 0)
	pop	ix
	add	hl, bc
	ex	de, hl
	lea	hl, iy + 0
	push	ix
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 3
	ld	(ix + 0), bc
	pop	ix
	ld	bc, 6
	ldir
	push	ix
	ld	de, -387
	add	ix, de
	ld	hl, (ix + 0)
	pop	ix
	ld	de, 6
	add	hl, de
	lea	iy, iy + 16
	jr	.LBB32_55
	.local	.LBB32_57
.LBB32_57:                              ;   in Loop: Header=BB32_49 Depth=2
	ld	de, -381
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	pea	iy + 109
	ld	de, -375
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -378
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -372
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _world_events
	push	hl
	call	_EventsApply
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, _.str.59.442
	push	hl
	call	_BeginScreen
	pop	hl
	ld	hl, 28
	push	hl
	ld	hl, 8
	push	hl
	ld	de, -363
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, _disease+20
	ld	hl, (hl)
	ld	de, 0
	ld	e, l
	ld	d, h
	ld	bc, -387
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), de
	ld	de, -395
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_StateSymbol
	pop	hl
	or	a, a
	sbc	hl, hl
	ld	l, a
	push	hl
	ld	de, -354
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -387
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _.str.60.443
	push	hl
	ld	hl, 80
	push	hl
	ld	de, -351
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_snprintf
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 42
	push	hl
	ld	hl, 8
	push	hl
	ld	de, -351
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 55
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, _.str.61.444
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	de, -338
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	a, (iy + 6)
	cp	a, -1
	ld	hl, _.str.62.445
	jr	z, .LBB32_59
; %bb.58:                               ;   in Loop: Header=BB32_49 Depth=2
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	bc, 22
	call	__imulu
	ex	de, hl
	ld	hl, _traits
	add	hl, de
	ld	hl, (hl)
	.local	.LBB32_59
.LBB32_59:                              ;   in Loop: Header=BB32_49 Depth=2
	ld	de, 55
	push	de
	ld	de, 80
	push	de
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	de, -338
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	a, (iy + 7)
	cp	a, -1
	jr	z, .LBB32_61
; %bb.60:                               ;   in Loop: Header=BB32_49 Depth=2
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	bc, 22
	call	__imulu
	ex	de, hl
	ld	hl, _traits
	add	hl, de
	ld	hl, (hl)
	ld	de, 67
	push	de
	ld	de, 80
	push	de
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	.local	.LBB32_61
.LBB32_61:                              ;   in Loop: Header=BB32_49 Depth=2
	ld	de, -345
	lea	iy, ix + 0
	add	iy, de
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	cp	a, 37
	ld	hl, 78
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, _.str.63.446
	push	hl
	call	nc, _Text
	pop	hl
	pop	hl
	pop	hl
	ld	de, -338
	lea	hl, ix + 0
	push	af
	add	hl, de
	pop	af
	ld	iy, (hl)
	ld	hl, (iy + 3)
	ld	de, 2
	push	de
	ld	de, 304
	push	de
	ld	de, 91
	push	de
	ld	de, 8
	push	de
	push	hl
	call	_WrapText
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	de, -344
	lea	iy, ix + 0
	push	af
	add	iy, de
	pop	af
	bit	0, (iy + 0)                     ; 1-byte Folded Reload
	ld	hl, _.str.64.447
	jr	nz, .LBB32_63
; %bb.62:                               ;   in Loop: Header=BB32_49 Depth=2
	ld	hl, _.str.65.448
	.local	.LBB32_63
.LBB32_63:                              ;   in Loop: Header=BB32_49 Depth=2
	ld	de, 116
	push	de
	ld	de, 8
	push	de
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, _effects+14
	ld	hl, (hl)
	ld	de, 0
	push	de
	pop	bc
	ld	c, l
	ld	b, h
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 88
	ld	(iy + 0), bc
	ld	bc, -366
	lea	hl, ix + 0
	add	hl, bc
	ld	iy, (hl)
	ld	bc, (iy + 14)
	push	de
	pop	hl
	ld	l, c
	ld	h, b
	ld	bc, -387
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), hl
	ld	hl, _effects+16
	ld	bc, (hl)
	ld	e, c
	ld	d, b
	ld	bc, -366
	lea	hl, ix + 0
	add	hl, bc
	ld	iy, (hl)
	ld	hl, (iy + 16)
	ld	bc, 0
	ld	c, l
	ld	b, h
	push	bc
	push	de
	ld	de, -387
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -344
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _.str.66.449
	push	hl
	ld	hl, 80
	push	hl
	ld	de, -351
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_snprintf
	ld	hl, 21
	add	hl, sp
	ld	sp, hl
	ld	hl, 128
	push	hl
	ld	hl, 8
	push	hl
	ld	de, -351
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, _effects+18
	ld	de, (hl)
	or	a, a
	sbc	hl, hl
	push	hl
	pop	bc
	ld	c, e
	ld	b, d
	ld	de, -344
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), bc
	push	ix
	ld	de, -366
	add	ix, de
	ld	iy, (ix + 0)
	pop	ix
	ld	iy, (iy + 18)
	push	hl
	pop	bc
	ex	de, hl
	ld	c, iyl
	ld	b, iyh
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 3
	ld	(iy + 0), bc
	ld	hl, _effects+20
	ld	bc, (hl)
	ld	e, c
	ld	d, b
	ld	bc, -366
	lea	hl, ix + 0
	add	hl, bc
	ld	iy, (hl)
	ld	hl, (iy + 20)
	ld	bc, 0
	ld	c, l
	ld	b, h
	push	bc
	push	de
	ld	de, -387
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -344
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _.str.67.450
	push	hl
	ld	hl, 80
	push	hl
	ld	de, -351
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_snprintf
	ld	hl, 21
	add	hl, sp
	ld	sp, hl
	ld	hl, 140
	push	hl
	ld	hl, 8
	push	hl
	ld	de, -351
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	de, -345
	lea	iy, ix + 0
	add	iy, de
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	cp	a, 37
	jr	c, .LBB32_66
; %bb.64:                               ;   in Loop: Header=BB32_49 Depth=2
	ld	de, -413
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _disease
	push	hl
	call	_Owns
	pop	hl
	pop	hl
	bit	0, a
	jp	z, .LBB32_72
; %bb.65:                               ;   in Loop: Header=BB32_49 Depth=2
	ld	de, -351
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	lea	de, iy + 0
	ld	hl, _.str.68.451
	ld	bc, 33
	ldir
	jp	.LBB32_77
	.local	.LBB32_66
.LBB32_66:                              ;   in Loop: Header=BB32_49 Depth=2
	cp	a, 15
	jp	nc, .LBB32_69
; %bb.67:                               ;   in Loop: Header=BB32_49 Depth=2
	ld	hl, 1
	lea	iy, ix + 0
	add	iy, de
	ld	c, (iy + 0)                     ; 1-byte Folded Reload
	call	__ishl
	ld	bc, 16399
	call	__iand
	add	hl, bc
	or	a, a
	sbc	hl, bc
	lea	iy, ix + 0
	push	af
	add	iy, de
	pop	af
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	jp	z, .LBB32_69
; %bb.68:                               ;   in Loop: Header=BB32_49 Depth=2
	ld	hl, _effects+22
	ld	hl, (hl)
                                        ; kill: def $hl killed $hl killed $uhl
	ld.sis	bc, 100
	call	__sdivu
	ld	de, 0
	ld	e, l
	ld	d, h
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 88
	ld	(iy + 0), de
	ld	de, -366
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	hl, (iy + 22)
                                        ; kill: def $hl killed $hl killed $uhl
	call	__sdivu
	ld	de, 0
	ld	e, l
	ld	d, h
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 3
	ld	(iy + 0), de
	ld	hl, _effects+24
	ld	hl, (hl)
                                        ; kill: def $hl killed $hl killed $uhl
	call	__sdivu
	ld	de, 0
	ld	e, l
	ld	d, h
	push	ix
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 110
	ld	iy, (ix + 0)
	pop	ix
	ld	hl, (iy + 24)
                                        ; kill: def $hl killed $hl killed $uhl
	call	__sdivu
	ld	bc, 0
	ld	c, l
	ld	b, h
	push	bc
	push	de
	ld	de, -387
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -344
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _.str.70.453
	jp	.LBB32_76
	.local	.LBB32_69
.LBB32_69:                              ;   in Loop: Header=BB32_49 Depth=2
	cp	a, 16
	jr	z, .LBB32_71
; %bb.70:                               ;   in Loop: Header=BB32_49 Depth=2
	ld	de, -426
	lea	iy, ix + 0
	add	iy, de
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	cp	a, 10
	jp	nz, .LBB32_75
	.local	.LBB32_71
.LBB32_71:                              ;   in Loop: Header=BB32_49 Depth=2
	ld	hl, _effects+26
	ld	hl, (hl)
                                        ; kill: def $hl killed $hl killed $uhl
	ld.sis	bc, 100
	call	__sdivu
	ld	de, 0
	ld	e, l
	ld	d, h
	push	ix
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 110
	ld	iy, (ix + 0)
	pop	ix
	ld	hl, (iy + 26)
                                        ; kill: def $hl killed $hl killed $uhl
	call	__sdivu
	ld	bc, 0
	ld	c, l
	ld	b, h
	push	bc
	push	de
	ld	hl, _.str.71.454
	push	hl
	ld	hl, 80
	push	hl
	ld	de, -351
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_snprintf
	ld	de, -351
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	jp	.LBB32_77
	.local	.LBB32_72
.LBB32_72:                              ;   in Loop: Header=BB32_49 Depth=2
	ld	de, -425
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	ld	hl, (hl)
	ld	de, -422
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	ld	hl, _disease+22
	ld	de, (hl)
	ld	iy, 0
	ld	iyl, e
	ld	iyh, d
	ld	l, e
	ld	h, d
	push	ix
	ld	bc, -444
	add	ix, bc
	ld	(ix + 0), de
	pop	ix
	ld.sis	bc, 100
	call	__sdivu
	ld	bc, 0
	ld	c, l
	ld	b, h
	push	ix
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 88
	ld	(ix + 0), bc
	pop	ix
	ld.sis	bc, -100
	call	__smulu
	add.sis	hl, de
	ld	de, 0
	push	de
	pop	bc
	ld	c, l
	ld	b, h
	push	ix
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 3
	ld	(ix + 0), bc
	pop	ix
	push	de
	pop	bc
	push	ix
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 38
	ld	de, (ix + 0)
	pop	ix
	ld	c, e
	ld	b, d
	lea	hl, iy + 0
	or	a, a
	sbc	hl, bc
	push	hl
	pop	bc
	ld	l, e
	ld	h, d
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 60
	ld	de, (iy + 0)
	or	a, a
	sbc.sis	hl, de
	jr	c, .LBB32_74
; %bb.73:                               ;   in Loop: Header=BB32_49 Depth=2
	ld	bc, 0
	.local	.LBB32_74
.LBB32_74:                              ;   in Loop: Header=BB32_49 Depth=2
	push	bc
	pop	hl
	push	bc
	pop	iy
	ld	bc, 100
	call	__idivs
	push	hl
	pop	de
	ld	bc, -100
	call	__imulu
	lea	bc, iy + 0
	add	hl, bc
	push	hl
	push	de
	ld	de, -387
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -344
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _.str.69.452
	jp	.LBB32_76
	.local	.LBB32_75
.LBB32_75:                              ;   in Loop: Header=BB32_49 Depth=2
	ld	a, (_session+4)
	or	a, a
	sbc	hl, hl
	push	hl
	pop	de
	push	de
	pop	iy
	ld	l, a
	add	hl, hl
	ex	de, hl
	ld	bc, -387
	lea	hl, ix + 0
	add	hl, bc
	ld	(hl), de
	ld	hl, _effects
	add	hl, de
	ld	de, (hl)
	ld	l, e
	ld	h, d
	ld.sis	bc, 100
	call	__sdivu
	lea	bc, iy + 0
	ld	c, l
	ld	b, h
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 88
	ld	(iy + 0), bc
	ld.sis	bc, -100
	call	__smulu
	add.sis	hl, de
	ld	iy, 0
	ex	de, hl
	ld	iyl, e
	ld	iyh, d
	ex	de, hl
	push	ix
	ld	de, -375
	add	ix, de
	ld	hl, (ix + 0)
	pop	ix
	push	ix
	ld	bc, -387
	add	ix, bc
	ld	de, (ix + 0)
	pop	ix
	add	hl, de
	ld	hl, (hl)
	push	ix
	ld	de, -387
	add	ix, de
	ld	(ix + 0), hl
	pop	ix
                                        ; kill: def $hl killed $hl killed $uhl
	ld.sis	bc, 100
	call	__sdivu
	ld	de, 0
	ld	e, l
	ld	d, h
	ld.sis	bc, -100
	call	__smulu
	push	ix
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 3
	ld	bc, (ix + 0)
	pop	ix
	add.sis	hl, bc
	ld	bc, 0
	ld	c, l
	ld	b, h
	push	bc
	push	de
	push	iy
	ld	de, -344
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _.str.72.455
	.local	.LBB32_76
.LBB32_76:                              ;   in Loop: Header=BB32_49 Depth=2
	push	hl
	ld	hl, 80
	push	hl
	ld	de, -351
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_snprintf
	ld	de, -351
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	hl, 21
	add	hl, sp
	ld	sp, hl
	.local	.LBB32_77
.LBB32_77:                              ;   in Loop: Header=BB32_49 Depth=2
	ld	hl, 152
	push	hl
	ld	hl, 8
	push	hl
	push	iy
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 164
	push	hl
	ld	hl, 8
	push	hl
	ld	de, -384
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	de, -398
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _disease
	push	hl
	call	_Owns
	pop	hl
	pop	hl
	bit	0, a
	ld	hl, _.str.74.457
	jp	nz, .LBB32_81
; %bb.78:                               ;   in Loop: Header=BB32_49 Depth=2
	ld	de, -419
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _disease
	push	hl
	call	_Eligible
	pop	hl
	pop	hl
	bit	0, a
	ld	hl, _.str.75.458
	jp	z, .LBB32_81
; %bb.79:                               ;   in Loop: Header=BB32_49 Depth=2
	ld	hl, _disease+20
	ld	hl, (hl)
                                        ; kill: def $hl killed $hl killed $uhl
	ld	bc, -360
	lea	iy, ix + 0
	add	iy, bc
	ld	e, (iy + 0)
	ld	d, (iy + 1)
	or	a, a
	sbc.sis	hl, de
	ld	hl, _.str.76.456
	jr	c, .LBB32_81
; %bb.80:                               ;   in Loop: Header=BB32_49 Depth=2
	ld	hl, _.str.567
	.local	.LBB32_81
.LBB32_81:                              ;   in Loop: Header=BB32_49 Depth=2
	push	hl
	ld	de, -354
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _.str.73.459
	push	hl
	ld	hl, 80
	push	hl
	ld	de, -351
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_snprintf
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	a, (ix - 8)
	ld	de, -344
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), a                     ; 1-byte Folded Spill
	or	a, a
	ld	hl, -1
	jr	z, .LBB32_83
; %bb.82:                               ;   in Loop: Header=BB32_49 Depth=2
	ld	hl, 0
	.local	.LBB32_83
.LBB32_83:                              ;   in Loop: Header=BB32_49 Depth=2
	push	hl
	ld	hl, 184
	push	hl
	ld	de, -351
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_MenuItem
	pop	hl
	pop	hl
	pop	hl
	ld	de, -369
	lea	iy, ix + 0
	add	iy, de
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	cp	a, 12
	ld	hl, 1
	jp	nc, .LBB32_93
; %bb.84:                               ;   in Loop: Header=BB32_49 Depth=2
	ld	a, (_disease+32)
	cp	a, 1
	ld	a, 7
	jr	z, .LBB32_86
; %bb.85:                               ;   in Loop: Header=BB32_49 Depth=2
	ld	a, 4
	.local	.LBB32_86
.LBB32_86:                              ;   in Loop: Header=BB32_49 Depth=2
	ld	de, -387
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), a
	ld	de, -416
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _disease
	push	hl
	call	_CanDevolve
	ld	de, -387
	lea	hl, ix + 0
	add	hl, de
	push	af
	ld	a, (hl)                         ; 1-byte Folded Reload
	ld	iyl, a
	pop	af
	pop	hl
	pop	hl
	ld	hl, _disease+20
	ld	hl, (hl)
	push	ix
	ld	bc, -392
	add	ix, bc
	ld	e, (ix + 0)
	ld	d, (ix + 1)
	pop	ix
	ld	e, iyl
                                        ; kill: def $hl killed $hl killed $uhl
	push	ix
	add	ix, bc
	ld	(ix + 0), e
	ld	(ix + 1), d
	pop	ix
	or	a, a
	sbc.sis	hl, de
	ld	hl, _.str.76.456
	jr	c, .LBB32_88
; %bb.87:                               ;   in Loop: Header=BB32_49 Depth=2
	ld	hl, _.str.567
	.local	.LBB32_88
.LBB32_88:                              ;   in Loop: Header=BB32_49 Depth=2
	ld	bc, 0
	ld	c, iyl
	bit	0, a
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 95
	ld	de, (iy + 0)
	jr	nz, .LBB32_90
; %bb.89:                               ;   in Loop: Header=BB32_49 Depth=2
	ld	hl, _.str.78.460
	.local	.LBB32_90
.LBB32_90:                              ;   in Loop: Header=BB32_49 Depth=2
	push	hl
	push	bc
	ld	hl, _.str.77.461
	push	hl
	ld	hl, 80
	push	hl
	push	de
	call	_snprintf
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	de, -344
	lea	iy, ix + 0
	add	iy, de
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	cp	a, 1
	ld	hl, -1
	jr	z, .LBB32_92
; %bb.91:                               ;   in Loop: Header=BB32_49 Depth=2
	ld	hl, 0
	.local	.LBB32_92
.LBB32_92:                              ;   in Loop: Header=BB32_49 Depth=2
	push	hl
	ld	hl, 204
	push	hl
	ld	de, -351
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_MenuItem
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 2
	.local	.LBB32_93
.LBB32_93:                              ;   in Loop: Header=BB32_49 Depth=2
	ld	de, -387
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	ld	a, l
	ld	de, -344
	lea	iy, ix + 0
	add	iy, de
	ld	l, (iy + 0)
	cp	a, l
	ld	hl, -1
	jr	z, .LBB32_95
; %bb.94:                               ;   in Loop: Header=BB32_49 Depth=2
	ld	hl, 0
	.local	.LBB32_95
.LBB32_95:                              ;   in Loop: Header=BB32_49 Depth=2
	push	hl
	ld	hl, 224
	push	hl
	ld	hl, _.str.79.462
	push	hl
	call	_MenuItem
	pop	hl
	pop	hl
	pop	hl
	call	_gfx_SwapDraw
	call	_WaitKey
	ld	e, a
	cp	a, 6
	jp	z, .LBB32_114
; %bb.96:                               ;   in Loop: Header=BB32_49 Depth=2
	ld	bc, -410
	lea	iy, ix + 0
	add	iy, bc
	ld	hl, (iy + 0)
	push	hl
	pea	ix - 8
	push	de
	ld	bc, -422
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), de
	call	_MenuMove
	ld	l, a
	pop	de
	pop	de
	pop	de
	ld	a, (ix - 8)
	ld	de, -344
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), a
	ld	bc, -422
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	ld	a, e
	cp	a, 5
	jr	z, .LBB32_98
; %bb.97:                               ;   in Loop: Header=BB32_49 Depth=2
	ld	de, -384
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	ld	de, -372
	lea	iy, ix + 0
	add	iy, de
	ld	bc, (iy + 0)
	jr	.LBB32_100
	.local	.LBB32_98
.LBB32_98:                              ;   in Loop: Header=BB32_49 Depth=2
	bit	0, l
	ld	de, -372
	lea	iy, ix + 0
	push	af
	add	iy, de
	pop	af
	ld	bc, (iy + 0)
	jr	z, .LBB32_101
; %bb.99:                               ;   in Loop: Header=BB32_49 Depth=2
	ld	de, -384
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	.local	.LBB32_100
.LBB32_100:                             ;   in Loop: Header=BB32_49 Depth=2
	ld	de, -344
	lea	iy, ix + 0
	add	iy, de
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	jp	.LBB32_49
	.local	.LBB32_101
.LBB32_101:                             ;   in Loop: Header=BB32_49 Depth=2
	ld	de, -387
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	ld	a, l
	ld	de, -344
	lea	iy, ix + 0
	add	iy, de
	ld	l, (iy + 0)                     ; 1-byte Folded Reload
	cp	a, l
	ld	a, l
	jp	z, .LBB32_114
; %bb.102:                              ;   in Loop: Header=BB32_49 Depth=2
	or	a, a
	jp	nz, .LBB32_107
; %bb.103:                              ;   in Loop: Header=BB32_49 Depth=2
	ld	de, -429
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _disease
	push	hl
	call	_Owns
	pop	hl
	pop	hl
	bit	0, a
	ld	hl, _.str.80.465
	ld	de, -372
	lea	iy, ix + 0
	push	af
	add	iy, de
	pop	af
	ld	bc, (iy + 0)
	ld	de, -344
	lea	iy, ix + 0
	push	af
	add	iy, de
	pop	af
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	jp	nz, .LBB32_49
; %bb.104:                              ;   in Loop: Header=BB32_49 Depth=2
	ld	de, -435
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _disease
	push	hl
	call	_Eligible
	ld	de, -372
	lea	iy, ix + 0
	add	iy, de
	ld	bc, (iy + 0)
	pop	hl
	pop	hl
	bit	0, a
	ld	de, -344
	lea	iy, ix + 0
	push	af
	add	iy, de
	pop	af
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	ld	hl, _.str.81.466
	jp	z, .LBB32_49
; %bb.105:                              ;   in Loop: Header=BB32_49 Depth=2
	ld	hl, _disease+20
	ld	hl, (hl)
                                        ; kill: def $hl killed $hl killed $uhl
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 104
	ld	e, (iy + 0)
	ld	d, (iy + 1)
	or	a, a
	sbc.sis	hl, de
	ld	hl, _.str.82.467
	jp	c, .LBB32_49
; %bb.106:                              ;   in Loop: Header=BB32_49 Depth=2
	ld	de, -441
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _disease
	push	hl
	call	_Purchase
	ld	de, -372
	lea	iy, ix + 0
	add	iy, de
	ld	bc, (iy + 0)
	pop	hl
	pop	hl
	bit	0, a
	ld	de, -344
	lea	iy, ix + 0
	push	af
	add	iy, de
	pop	af
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	ld	hl, _.str.83.463
	jp	.LBB32_112
	.local	.LBB32_107
.LBB32_107:                             ;   in Loop: Header=BB32_49 Depth=2
	ld	de, -432
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _disease
	push	hl
	call	_CanDevolve
	pop	hl
	pop	hl
	bit	0, a
	ld	hl, _.str.84.468
	ld	de, -372
	lea	iy, ix + 0
	push	af
	add	iy, de
	pop	af
	ld	bc, (iy + 0)
	ld	de, -344
	lea	iy, ix + 0
	push	af
	add	iy, de
	pop	af
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	jp	z, .LBB32_49
; %bb.108:                              ;   in Loop: Header=BB32_49 Depth=2
	ld	a, (_disease+32)
	cp	a, 1
	ld.sis	de, 7
	jr	z, .LBB32_110
; %bb.109:                              ;   in Loop: Header=BB32_49 Depth=2
	ld.sis	de, 4
	.local	.LBB32_110
.LBB32_110:                             ;   in Loop: Header=BB32_49 Depth=2
	ld	hl, _disease+20
	ld	hl, (hl)
                                        ; kill: def $hl killed $hl killed $uhl
	or	a, a
	sbc.sis	hl, de
	ld	hl, _.str.82.467
	ld	de, -344
	lea	iy, ix + 0
	push	af
	add	iy, de
	pop	af
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	jp	c, .LBB32_49
; %bb.111:                              ;   in Loop: Header=BB32_49 Depth=2
	ld	de, -438
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _disease
	push	hl
	call	_Devolve
	ld	de, -372
	lea	iy, ix + 0
	add	iy, de
	ld	bc, (iy + 0)
	pop	hl
	pop	hl
	bit	0, a
	ld	de, -344
	lea	iy, ix + 0
	push	af
	add	iy, de
	pop	af
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	ld	hl, _.str.85.464
	.local	.LBB32_112
.LBB32_112:                             ;   in Loop: Header=BB32_49 Depth=2
	ex	de, hl
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 128
	ld	hl, (iy + 0)
	jp	z, .LBB32_49
; %bb.113:                              ;   in Loop: Header=BB32_49 Depth=2
	ld	bc, -384
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), de
	call	_RefreshEffects
	ld	de, -344
	lea	iy, ix + 0
	add	iy, de
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	ld	de, -372
	lea	iy, ix + 0
	add	iy, de
	ld	bc, (iy + 0)
	ld	de, -384
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	jp	.LBB32_49
	.local	.LBB32_114
.LBB32_114:                             ;   in Loop: Header=BB32_1 Depth=1
	ld	de, -357
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	ld	bc, -348
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	add	hl, de
	ld	a, (hl)
	ld	bc, -399
	lea	iy, ix + 0
	add	iy, bc
	ld	e, (iy + 0)                     ; 1-byte Folded Reload
	.local	.LBB32_115
.LBB32_115:                             ;   in Loop: Header=BB32_1 Depth=1
	cp	a, 39
	jp	c, .LBB32_1
; %bb.116:                              ;   in Loop: Header=BB32_1 Depth=1
	ld	hl, _first_node
	ld	c, e
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 92
	ld	de, (iy + 0)
	add	hl, de
	ld	a, (hl)
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 101
	ld	hl, (iy + 0)
	add	hl, de
	ld	e, c
	ld	(hl), a
	jp	.LBB32_1
	.local	.LBB32_117
.LBB32_117:
	call	_ReleaseKeys
	or	a, a
	sbc	hl, hl
	ld	(-917504), hl
	xor	a, a
	ld	(-917501), a
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end32
.Lfunc_end32:
	.size	_EvolutionMenu, .Lfunc_end32-_EvolutionMenu
                                        ; -- End function
	.section	.text._StateSymbol,"ax",@progbits
	.type	_StateSymbol,@function          ; -- Begin function StateSymbol
_StateSymbol:                           ; @StateSymbol
; %bb.0:
	call	__frameset0
	ld	de, _disease
	ld	l, (ix + 6)
	push	hl
	push	de
	call	_Owns
	pop	hl
	pop	hl
	bit	0, a
	jr	z, .LBB33_2
; %bb.1:
	ld	a, 42
	jr	.LBB33_7
	.local	.LBB33_2
.LBB33_2:
	ld	l, (ix + 6)
	push	hl
	ld	hl, _disease
	push	hl
	call	_Eligible
	pop	hl
	pop	hl
	bit	0, a
	jr	z, .LBB33_5
; %bb.3:
	ld	hl, _disease+20
	ld	iy, _traits
	ld	de, (hl)
	or	a, a
	sbc	hl, hl
	ld	l, (ix + 6)
	ld	bc, 22
	call	__imulu
	push	hl
	pop	bc
	add	iy, bc
	ld	c, (iy + 8)
	ld	b, 0
	ld	l, e
	ld	h, d
	or	a, a
	sbc.sis	hl, bc
	jr	c, .LBB33_6
; %bb.4:
	ld	a, 43
	jr	.LBB33_7
	.local	.LBB33_5
.LBB33_5:
	ld	a, 76
	jr	.LBB33_7
	.local	.LBB33_6
.LBB33_6:
	ld	a, 36
	.local	.LBB33_7
.LBB33_7:
	pop	ix
	ret
	.local	.Lfunc_end33
.Lfunc_end33:
	.size	_StateSymbol, .Lfunc_end33-_StateSymbol
                                        ; -- End function
	.section	.text._RegionInfo,"ax",@progbits
	.globl	_RegionInfo                     ; -- Begin function RegionInfo
	.type	_RegionInfo,@function
_RegionInfo:                            ; @RegionInfo
; %bb.0:
	ld	hl, -92
	call	__frameset
	ld	iy, _region
	ld	hl, _environments
	ld	(ix - 86), hl
	lea	hl, ix - 80
	ld	(ix - 83), hl
	ld	a, (_session+4)
	ld	de, 0
	ld	e, a
	push	de
	pop	hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	push	hl
	pop	bc
	add	iy, bc
	ld	(ix - 89), iy
	ld	bc, 7
	ex	de, hl
	call	__imulu
	ex	de, hl
	ld	hl, (ix - 86)
	add	hl, de
	ld	(ix - 86), hl
	ld	hl, (ix - 89)
	ld	hl, (hl)
	push	hl
	call	_BeginScreen
	pop	hl
	ld	iy, (ix - 89)
	ld	de, (iy + 10)
	ld	bc, 0
	push	bc
	pop	hl
	ld	l, e
	ld	h, d
	ld	de, (iy + 12)
	ld	c, e
	ld	b, d
	ld	(ix - 92), bc
	ld	de, (iy + 14)
	ld	bc, 0
	ld	c, e
	ld	b, d
	push	bc
	ld	de, (ix - 92)
	push	de
	push	hl
	ld	hl, _.str.8.487
	push	hl
	ld	hl, 80
	push	hl
	ld	hl, (ix - 83)
	push	hl
	call	_snprintf
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 40
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, (ix - 83)
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	iy, (ix - 89)
	ld	hl, (iy + 12)
	ld	de, 0
	ld	e, l
	ld	d, h
	ld	bc, (iy + 14)
	or	a, a
	sbc	hl, hl
	ld	l, c
	ld	h, b
	add	hl, de
	push	hl
	ld	hl, _.str.9.488
	push	hl
	ld	hl, 80
	push	hl
	ld	hl, (ix - 83)
	push	hl
	call	_snprintf
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 58
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, (ix - 83)
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 85
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, _.str.10.489
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	iy, (ix - 86)
	ld	a, (iy)
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	a, (iy + 1)
	ld	de, 0
	ld	e, a
	ld	(ix - 89), de
	push	de
	push	hl
	ld	hl, _.str.11.490
	push	hl
	ld	hl, 80
	push	hl
	ld	hl, (ix - 83)
	push	hl
	call	_snprintf
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 106
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, (ix - 83)
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	iy, (ix - 86)
	ld	a, (iy + 2)
	ld	de, (ix - 89)
	ld	e, a
	ld	a, (iy + 3)
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	(ix - 89), hl
	push	hl
	push	de
	ld	hl, _.str.12.491
	push	hl
	ld	hl, 80
	push	hl
	ld	hl, (ix - 83)
	push	hl
	call	_snprintf
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 126
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, (ix - 83)
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	iy, (ix - 86)
	ld	a, (iy + 4)
	ld	de, (ix - 89)
	ld	e, a
	ld	a, (iy + 5)
	or	a, a
	sbc	hl, hl
	ld	l, a
	push	hl
	push	de
	ld	hl, _.str.13.492
	push	hl
	ld	hl, 80
	push	hl
	ld	hl, (ix - 83)
	push	hl
	call	_snprintf
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 146
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, (ix - 83)
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	iy, (ix - 86)
	ld	a, (iy + 6)
	or	a, a
	sbc	hl, hl
	ld	l, a
	push	hl
	ld	hl, _.str.14.493
	push	hl
	ld	hl, 80
	push	hl
	ld	hl, (ix - 83)
	push	hl
	call	_snprintf
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 166
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, (ix - 83)
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	a, (_session+4)
	or	a, a
	sbc	hl, hl
	ld	l, a
	add	hl, hl
	ex	de, hl
	ld	hl, _effects
	add	hl, de
	ld	de, (hl)
	ld	l, e
	ld	h, d
	ld.sis	bc, 100
	call	__sdivu
	ld	bc, 0
	ld	c, l
	ld	b, h
	push	bc
	pop	iy
	ld.sis	bc, -100
	call	__smulu
	add.sis	hl, de
	ld	de, 0
	ld	e, l
	ld	d, h
	push	de
	push	iy
	ld	hl, _.str.15.494
	push	hl
	ld	hl, 80
	push	hl
	ld	hl, (ix - 83)
	push	hl
	call	_snprintf
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 190
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, (ix - 83)
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	a, (_session+4)
	ld	(ix - 92), a                    ; 1-byte Folded Spill
	ld	iy, 132
	ld	bc, 0
	ld	d, b
	ld	(ix - 89), d                    ; 1-byte Folded Spill
	ld	(ix - 86), d                    ; 1-byte Folded Spill
	.local	.LBB34_1
.LBB34_1:                               ; =>This Inner Loop Header: Depth=1
	push	bc
	pop	hl
	lea	de, iy + 0
	or	a, a
	sbc	hl, de
	jr	z, .LBB34_5
; %bb.2:                                ;   in Loop: Header=BB34_1 Depth=1
	ld	iy, _port
	add	iy, bc
	ld	a, (iy + 2)
	ld	l, (ix - 92)
	cp	a, l
	jr	nz, .LBB34_4
; %bb.3:                                ;   in Loop: Header=BB34_1 Depth=1
	inc	(ix - 86)
	ld	a, (iy + 5)
	ld	l, (ix - 89)
	add	a, l
	ld	l, a
	ld	(ix - 89), l
	.local	.LBB34_4
.LBB34_4:                               ;   in Loop: Header=BB34_1 Depth=1
	push	bc
	pop	hl
	ld	bc, 6
	add	hl, bc
	push	hl
	pop	bc
	ld	iy, 132
	jr	.LBB34_1
	.local	.LBB34_5
.LBB34_5:
	or	a, a
	sbc	hl, hl
	push	hl
	pop	bc
	ld	c, (ix - 89)                    ; 1-byte Folded Reload
	ld	l, (ix - 86)                    ; 1-byte Folded Reload
	push	hl
	push	bc
	ld	hl, _.str.16.495
	push	hl
	ld	hl, 80
	push	hl
	ld	hl, (ix - 83)
	push	hl
	call	_snprintf
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 205
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, (ix - 83)
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 1
	push	hl
	ld	hl, 222
	push	hl
	ld	hl, _.str.4.682
	push	hl
	call	_MenuItem
	pop	hl
	pop	hl
	pop	hl
	call	_gfx_SwapDraw
	.local	.LBB34_6
.LBB34_6:                               ; =>This Inner Loop Header: Depth=1
	call	_WaitKey
	ld	l, -5
	add	a, l
	ld	l, a
	cp	a, 2
	jr	nc, .LBB34_6
; %bb.7:
	call	_ReleaseKeys
	or	a, a
	sbc	hl, hl
	ld	(-917504), hl
	xor	a, a
	ld	(-917501), a
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end34
.Lfunc_end34:
	.size	_RegionInfo, .Lfunc_end34-_RegionInfo
                                        ; -- End function
	.section	.text._SporeMenu,"ax",@progbits
	.globl	_SporeMenu                      ; -- Begin function SporeMenu
	.type	_SporeMenu,@function
_SporeMenu:                             ; @SporeMenu
; %bb.0:
	ld	hl, -104
	call	__frameset
	ld	hl, _.str.567
	ld	(ix - 101), hl
	lea	hl, ix - 80
	ld	(ix - 86), hl
	ld	a, (_session+4)
	ld	l, a
	.local	.LBB35_1
.LBB35_1:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB35_2 Depth 2
                                        ;       Child Loop BB35_5 Depth 3
	ld	(ix - 98), hl
	.local	.LBB35_2
.LBB35_2:                               ;   Parent Loop BB35_1 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB35_5 Depth 3
	ld	hl, _.str.19.497
	push	hl
	call	_BeginScreen
	pop	hl
	ld	a, (_disease+36)
	cp	a, 3
	ld	hl, _.str.20.499
	jr	nc, .LBB35_4
; %bb.3:                                ;   in Loop: Header=BB35_2 Depth=2
	ld	bc, 0
	push	bc
	pop	de
	ld	e, a
	ld	hl, _disease+20
	ld	hl, (hl)
	ld	c, l
	ld	b, h
	ld	hl, _spore_costs
	add	hl, de
	inc	de
	ld	a, (hl)
	or	a, a
	sbc	hl, hl
	ld	l, a
	push	hl
	push	de
	push	bc
	ld	hl, _.str.21.498
	push	hl
	ld	hl, 80
	push	hl
	ld	hl, (ix - 86)
	push	hl
	call	_snprintf
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (ix - 86)
	.local	.LBB35_4
.LBB35_4:                               ;   in Loop: Header=BB35_2 Depth=2
	ld	de, 28
	push	de
	ld	de, 8
	push	de
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 44
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, _.str.22.500
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	de, 0
	ld	hl, (ix - 98)
	ld	e, l
	ld	(ix - 104), de
	ex	de, hl
	ld	bc, 17
	call	__imulu
	ld	(ix - 89), hl
	ld	hl, _region
	push	hl
	pop	iy
	or	a, a
	sbc	hl, hl
	.local	.LBB35_5
.LBB35_5:                               ;   Parent Loop BB35_1 Depth=1
                                        ;     Parent Loop BB35_2 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	push	hl
	pop	bc
	ld	de, 119
	or	a, a
	sbc	hl, de
	jr	z, .LBB35_9
; %bb.6:                                ;   in Loop: Header=BB35_5 Depth=3
	ld	hl, (ix - 89)
	ld	(ix - 92), bc
	or	a, a
	sbc	hl, bc
	ld	hl, 62
	jr	z, .LBB35_8
; %bb.7:                                ;   in Loop: Header=BB35_5 Depth=3
	ld	hl, 32
	.local	.LBB35_8
.LBB35_8:                               ;   in Loop: Header=BB35_5 Depth=3
	ld	(ix - 95), hl
	ld	(ix - 83), iy
	ld	hl, (ix - 83)
	ld	hl, (hl)
	ld	iy, (ix - 83)
	ld	de, (iy + 10)
	ld	bc, 0
	ld	c, e
	ld	b, d
	push	bc
	push	hl
	ld	hl, (ix - 95)
	push	hl
	ld	hl, _.str.23.501
	push	hl
	ld	hl, 80
	push	hl
	ld	hl, (ix - 86)
	push	hl
	call	_snprintf
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (ix - 92)
	ld	de, 67
	add	hl, de
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, (ix - 86)
	push	hl
	call	_Text
	ld	iy, (ix - 83)
	pop	hl
	pop	hl
	pop	hl
	ld	de, 17
	ld	hl, (ix - 92)
	add	hl, de
	lea	iy, iy + 16
	jr	.LBB35_5
	.local	.LBB35_9
.LBB35_9:                               ;   in Loop: Header=BB35_2 Depth=2
	ld	hl, 193
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, (ix - 101)
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 212
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, _.str.24.502
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 226
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, _.str.25.503
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	call	_gfx_SwapDraw
	call	_WaitKey
	ld	l, -3
	add	a, l
	ld	l, a
	cp	a, 4
	jp	nc, .LBB35_2
; %bb.10:                               ;   in Loop: Header=BB35_2 Depth=2
	ld	de, 0
	ld	e, l
	ld	hl, JTI35_0
	add	hl, de
	add	hl, de
	add	hl, de
	ld	hl, (hl)
	jp	(hl)
	.local	.LBB35_11
.LBB35_11:                              ;   in Loop: Header=BB35_2 Depth=2
	ld	a, (_disease+36)
	cp	a, 3
	ld	hl, _.str.26.505
	ld	(ix - 101), hl
	jp	nc, .LBB35_2
; %bb.12:                               ;   in Loop: Header=BB35_2 Depth=2
	ld	hl, (ix - 104)
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de, hl
	ld	iy, _region
	add	iy, de
	ld	hl, (iy + 10)
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	ld	hl, _.str.27.506
	ld	(ix - 101), hl
	jp	z, .LBB35_2
; %bb.13:                               ;   in Loop: Header=BB35_2 Depth=2
	or	a, a
	sbc	hl, hl
	ex	de, hl
	ld	e, a
	ld	hl, _disease+20
	ld	hl, (hl)
	ld	iy, _spore_costs
	add	iy, de
	ld	e, (iy)
	ld	d, 0
                                        ; kill: def $hl killed $hl killed $uhl
	or	a, a
	sbc.sis	hl, de
	ld	hl, _.str.28.507
	ld	(ix - 101), hl
	jp	c, .LBB35_2
; %bb.14:                               ;   in Loop: Header=BB35_2 Depth=2
	ld	hl, _GameRandom
	push	hl
	ld	hl, (ix - 98)
	push	hl
	ld	hl, _disease
	push	hl
	ld	hl, _region
	push	hl
	call	_SporeBurst
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	bit	0, a
	ld	hl, _.str.30.508
	ld	(ix - 101), hl
	jp	z, .LBB35_2
; %bb.15:                               ;   in Loop: Header=BB35_2 Depth=2
	or	a, a
	sbc	hl, hl
	push	hl
	ld	hl, (ix - 98)
	push	hl
	ld	hl, 6
	push	hl
	call	_TickerPost
	pop	hl
	pop	hl
	pop	hl
	ld	hl, _.str.29.504
	ld	(ix - 101), hl
	jp	.LBB35_2
	.local	.LBB35_16
.LBB35_16:                              ;   in Loop: Header=BB35_1 Depth=1
	ld	hl, (ix - 98)
	ld	h, 0
	ld.sis	de, 6
	add.sis	hl, de
	jr	.LBB35_18
	.local	.LBB35_17
.LBB35_17:                              ;   in Loop: Header=BB35_1 Depth=1
	ld	hl, (ix - 98)
	ld	h, 0
	inc.sis	hl
	.local	.LBB35_18
.LBB35_18:                              ;   in Loop: Header=BB35_1 Depth=1
                                        ; kill: def $hl killed $hl killed $uhl
	ld.sis	bc, 7
	call	__sremu
                                        ; kill: def $hl killed $hl def $uhl
	jp	.LBB35_1
	.local	.LBB35_19
.LBB35_19:
	call	_EndModal
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end35
.Lfunc_end35:
	.size	_SporeMenu, .Lfunc_end35-_SporeMenu
	.section	.rodata._SporeMenu,"a",@progbits
JTI35_0:
	d24	.LBB35_16
	d24	.LBB35_17
	d24	.LBB35_11
	d24	.LBB35_19
                                        ; -- End function
	.section	.text._ResultScreen,"ax",@progbits
	.globl	_ResultScreen                   ; -- Begin function ResultScreen
	.type	_ResultScreen,@function
_ResultScreen:                          ; @ResultScreen
; %bb.0:
	ld	hl, -104
	call	__frameset
	ld	hl, _region
	lea	de, ix - 87
	ld	(ix - 90), de
	push	hl
	pea	ix - 7
	call	_CountWorld
	pop	hl
	pop	hl
	ld	bc, (ix - 7)
	ld	de, (ix - 5)
	ld	hl, (ix - 3)
	ld	(ix - 98), hl
                                        ; kill: def $hl killed $hl killed $uhl
	ld	(ix - 101), de
	add.sis	hl, de
	ld	(ix - 95), l
	ld	(ix - 94), h
	ld	(ix - 104), bc
	add.sis	hl, bc
	ld	(ix - 93), l
	ld	(ix - 92), h
	ld	a, (_disease+34)
	cp	a, 1
	jr	z, .LBB36_2
; %bb.1:
	ld	hl, _.str.32.510
	jr	.LBB36_3
	.local	.LBB36_2
.LBB36_2:
	ld	hl, _.str.31.509
	.local	.LBB36_3
.LBB36_3:
	push	hl
	call	_BeginScreen
	pop	hl
	ld	a, (_disease+32)
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	bc, 3
	call	__imulu
	ex	de, hl
	ld	hl, _disease_names
	add	hl, de
	ld	hl, (hl)
	ld	de, _disease+37
	push	de
	push	hl
	ld	hl, _.str.33.511
	push	hl
	ld	hl, 80
	push	hl
	ld	hl, (ix - 90)
	push	hl
	call	_snprintf
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 38
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, (ix - 90)
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (_disease+8)
	ld	a, (_disease+11)
	ld	e, a
	push	de
	push	hl
	ld	hl, _.str.34.512
	push	hl
	ld	hl, 80
	push	hl
	ld	hl, (ix - 90)
	push	hl
	call	_snprintf
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 63
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, (ix - 90)
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	e, (ix - 93)
	ld	d, (ix - 92)
	sbc.sis	hl, hl
	adc.sis	hl, de
	jr	nz, .LBB36_5
; %bb.4:                                ; %Percentage.exit3.critedge
	or	a, a
	sbc	hl, hl
	push	hl
	push	hl
	ld	(ix - 93), hl
	push	hl
	ld	hl, _.str.35.513
	push	hl
	ld	hl, 80
	push	hl
	ld	hl, (ix - 90)
	push	hl
	call	_snprintf
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 90
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, (ix - 90)
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	jp	.LBB36_6
	.local	.LBB36_5
.LBB36_5:                               ; %Percentage.exit2
	ld	bc, 100
	or	a, a
	sbc	hl, hl
	ld	iyl, e
	ld	iyh, d
	ld	de, (ix - 104)
	ld	l, e
	ld	h, d
	call	__imulu
	ld	de, 0
	push	de
	pop	bc
	ld	c, iyl
	ld	b, iyh
	ld	(ix - 93), bc
	call	__idivu
	ld	bc, 255
	call	__iand
	push	hl
	pop	iy
	or	a, a
	sbc	hl, hl
	ld	de, (ix - 101)
	ld	l, e
	ld	h, d
	ld	bc, 100
	call	__imulu
	ld	bc, (ix - 93)
	call	__idivu
	ld	bc, 255
	call	__iand
	ex	de, hl
	or	a, a
	sbc	hl, hl
	ld	bc, (ix - 98)
	ld	l, c
	ld	h, b
	ld	bc, 100
	call	__imulu
	ld	bc, (ix - 93)
	call	__idivu
	ld	bc, 255
	call	__iand
	push	hl
	push	de
	push	iy
	ld	hl, _.str.35.513
	push	hl
	ld	hl, 80
	push	hl
	ld	hl, (ix - 90)
	push	hl
	call	_snprintf
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 90
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, (ix - 90)
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	or	a, a
	sbc	hl, hl
	ld	e, (ix - 95)
	ld	d, (ix - 94)
	ld	l, e
	ld	h, d
	ld	bc, 100
	call	__imulu
	ld	bc, (ix - 93)
	call	__idivu
	ld	bc, 255
	call	__iand
	ld	(ix - 93), hl
	.local	.LBB36_6
.LBB36_6:                               ; %Percentage.exit3
	ld	iy, 0
	ld	hl, _disease+22
	ld	de, (hl)
	ld	l, e
	ld	h, d
	ld.sis	bc, 100
	call	__sdivu
	ex	de, hl
	ld	iyl, e
	ld	iyh, d
	ex	de, hl
	ld.sis	bc, -100
	call	__smulu
	add.sis	hl, de
	ld	de, 0
	ld	e, l
	ld	d, h
	push	de
	push	iy
	ld	hl, (ix - 93)
	push	hl
	ld	hl, _.str.36.514
	push	hl
	ld	hl, 80
	push	hl
	ld	hl, (ix - 90)
	push	hl
	call	_snprintf
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 114
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, (ix - 90)
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	a, (_disease+34)
	cp	a, 3
	jr	z, .LBB36_8
; %bb.7:                                ; %Percentage.exit3
	ld	hl, _.str.39.516
	jr	.LBB36_9
	.local	.LBB36_8
.LBB36_8:
	ld	hl, _.str.38.515
	.local	.LBB36_9
.LBB36_9:                               ; %Percentage.exit3
	ld	bc, 304
	cp	a, b
	ld	de, 8
	jr	nz, .LBB36_11
; %bb.10:
	ld	hl, _.str.37.517
	.local	.LBB36_11
.LBB36_11:                              ; %Percentage.exit3
	ld	iy, 3
	push	iy
	push	bc
	ld	bc, 148
	push	bc
	push	de
	push	hl
	call	_WrapText
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 1
	push	hl
	ld	hl, 221
	push	hl
	ld	hl, _.str.40.518
	push	hl
	call	_MenuItem
	pop	hl
	pop	hl
	pop	hl
	call	_gfx_SwapDraw
	.local	.LBB36_12
.LBB36_12:                              ; =>This Inner Loop Header: Depth=1
	call	_WaitKey
	ld	l, -5
	add	a, l
	ld	l, a
	cp	a, 2
	jr	nc, .LBB36_12
; %bb.13:
	call	_ReleaseKeys
	or	a, a
	sbc	hl, hl
	ld	(-917504), hl
	xor	a, a
	ld	(-917501), a
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end36
.Lfunc_end36:
	.size	_ResultScreen, .Lfunc_end36-_ResultScreen
                                        ; -- End function
	.section	.text._LoadData,"ax",@progbits
	.globl	_LoadData                       ; -- Begin function LoadData
	.type	_LoadData,@function
_LoadData:                              ; @LoadData
; %bb.0:
	ld	hl, -1
	call	__frameset
	ld	hl, _.str.72.749
	ld	de, 1
	push	de
	push	hl
	call	_ReadNamed
	pop	hl
	pop	hl
	bit	0, a
	jr	nz, .LBB37_2
; %bb.1:
	ld	hl, _.str.73.763
	ld	de, 1
	push	de
	push	hl
	call	_ReadNamed
	pop	hl
	pop	hl
	bit	0, a
	jr	z, .LBB37_3
	.local	.LBB37_2
.LBB37_2:
	ld	a, 1
	ld	(ix - 1), a
	call	_RefreshEffects
	jr	.LBB37_4
	.local	.LBB37_3
.LBB37_3:
	xor	a, a
	ld	(ix - 1), a
	call	_ResetGameState
	.local	.LBB37_4
.LBB37_4:
	ld	a, (ix - 1)                     ; 1-byte Folded Reload
	inc	sp
	pop	ix
	ret
	.local	.Lfunc_end37
.Lfunc_end37:
	.size	_LoadData, .Lfunc_end37-_LoadData
                                        ; -- End function
	.section	.text._ReadNamed,"ax",@progbits
	.type	_ReadNamed,@function            ; -- Begin function ReadNamed
_ReadNamed:                             ; @ReadNamed
; %bb.0:
	ld	hl, -24
	call	__frameset
	ld	hl, (ix + 6)
	ld	de, _.str.79.761
	push	de
	push	hl
	call	_ti_Open
	ld	l, a
	pop	de
	pop	de
	ld	(ix - 1), l
	or	a, a
	jr	nz, .LBB38_2
; %bb.1:
	xor	a, a
	jp	.LBB38_6
	.local	.LBB38_2
.LBB38_2:
	lea	de, ix - 1
	ld	(ix - 24), de
	lea	de, ix - 17
	ld	(ix - 21), de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	call	_ti_GetSize
	pop	de
	xor	a, a
	ld	(ix - 18), a
	ld	de, (ix - 20)
	ld	d, h
	ld	e, l
	sbc	hl, hl
	ld	a, l
	ld	hl, (ix - 24)
	ld	(ix - 17), hl
	ld	hl, _FileRead
	ld	(ix - 14), hl
	ld	hl, _FileWrite
	ld	(ix - 11), hl
	ld	hl, _FileSeek
	ld	(ix - 8), hl
	ld	(ix - 5), de
	ld	(ix - 2), a
	bit	0, (ix + 9)
	jr	z, .LBB38_4
; %bb.3:
	ld	iy, _disease
	ld	de, _session
	ld	bc, _port
	ld	hl, _world_events
	push	hl
	push	bc
	ld	hl, _region
	push	hl
	push	de
	push	iy
	ld	hl, (ix - 21)
	push	hl
	call	_DecodeSaveV3
	ld	(ix - 21), a                    ; 1-byte Folded Spill
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	jr	.LBB38_5
	.local	.LBB38_4
.LBB38_4:
	ld	hl, _region
	push	hl
	ld	hl, (ix - 21)
	push	hl
	call	_ValidateSaveV3
	ld	(ix - 21), a                    ; 1-byte Folded Spill
	.local	.LBB38_5
.LBB38_5:
	pop	hl
	pop	hl
	ld	a, (ix - 1)
	ld	l, a
	push	hl
	call	_ti_Close
	pop	hl
	ld	a, (ix - 21)                    ; 1-byte Folded Reload
	.local	.LBB38_6
.LBB38_6:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end38
.Lfunc_end38:
	.size	_ReadNamed, .Lfunc_end38-_ReadNamed
                                        ; -- End function
	.section	.text._FileRead,"ax",@progbits
	.type	_FileRead,@function             ; -- Begin function FileRead
_FileRead:                              ; @FileRead
; %bb.0:
	call	__frameset0
	ld	hl, (ix + 6)
	ld	iy, (ix + 9)
	ld	de, (ix + 12)
	ld	bc, 1
	ld	a, (hl)
	ld	l, a
	push	hl
	push	de
	push	bc
	push	iy
	call	_ti_Read
	pop	de
	pop	de
	pop	de
	pop	de
	ld	de, (ix + 12)
	or	a, a
	sbc	hl, de
	jr	z, .LBB39_2
; %bb.1:
	ld	a, 0
	jr	.LBB39_3
	.local	.LBB39_2
.LBB39_2:
	ld	a, -1
	.local	.LBB39_3
.LBB39_3:
	pop	ix
	ret
	.local	.Lfunc_end39
.Lfunc_end39:
	.size	_FileRead, .Lfunc_end39-_FileRead
                                        ; -- End function
	.section	.text._FileWrite,"ax",@progbits
	.type	_FileWrite,@function            ; -- Begin function FileWrite
_FileWrite:                             ; @FileWrite
; %bb.0:
	call	__frameset0
	ld	hl, (ix + 6)
	ld	iy, (ix + 9)
	ld	de, (ix + 12)
	ld	bc, 1
	ld	a, (hl)
	ld	l, a
	push	hl
	push	de
	push	bc
	push	iy
	call	_ti_Write
	pop	de
	pop	de
	pop	de
	pop	de
	ld	de, (ix + 12)
	or	a, a
	sbc	hl, de
	jr	z, .LBB40_2
; %bb.1:
	ld	a, 0
	jr	.LBB40_3
	.local	.LBB40_2
.LBB40_2:
	ld	a, -1
	.local	.LBB40_3
.LBB40_3:
	pop	ix
	ret
	.local	.Lfunc_end40
.Lfunc_end40:
	.size	_FileWrite, .Lfunc_end40-_FileWrite
                                        ; -- End function
	.section	.text._FileSeek,"ax",@progbits
	.type	_FileSeek,@function             ; -- Begin function FileSeek
_FileSeek:                              ; @FileSeek
; %bb.0:
	call	__frameset0
	ld	hl, (ix + 6)
	ld	de, (ix + 9)
	ld	bc, 0
	ld	a, (hl)
	ld	l, a
	push	hl
	push	bc
	push	de
	call	_ti_Seek
	pop	de
	pop	de
	pop	de
	ld	de, -1
	or	a, a
	sbc	hl, de
	jr	nz, .LBB41_2
; %bb.1:
	ld	a, 0
	jr	.LBB41_3
	.local	.LBB41_2
.LBB41_2:
	ld	a, -1
	.local	.LBB41_3
.LBB41_3:
	pop	ix
	ret
	.local	.Lfunc_end41
.Lfunc_end41:
	.size	_FileSeek, .Lfunc_end41-_FileSeek
                                        ; -- End function
	.section	.text._HasLegacySave,"ax",@progbits
	.globl	_HasLegacySave                  ; -- Begin function HasLegacySave
	.type	_HasLegacySave,@function
_HasLegacySave:                         ; @HasLegacySave
; %bb.0:
	ld	hl, _.str.77.751
	ld	de, 0
	push	de
	push	hl
	call	_ReadLegacyNamed
	pop	hl
	pop	hl
	bit	0, a
	jr	z, .LBB42_2
; %bb.1:
	ld	a, 1
	ret
	.local	.LBB42_2
.LBB42_2:
	ld	hl, _.str.78.752
	ld	de, 0
	push	de
	push	hl
	call	_ReadLegacyNamed
	pop	hl
	pop	hl
	ret
	.local	.Lfunc_end42
.Lfunc_end42:
	.size	_HasLegacySave, .Lfunc_end42-_HasLegacySave
                                        ; -- End function
	.section	.text._ReadLegacyNamed,"ax",@progbits
	.type	_ReadLegacyNamed,@function      ; -- Begin function ReadLegacyNamed
_ReadLegacyNamed:                       ; @ReadLegacyNamed
; %bb.0:
	ld	hl, -24
	call	__frameset
	ld	hl, (ix + 6)
	ld	de, _.str.79.761
	push	de
	push	hl
	call	_ti_Open
	ld	l, a
	pop	de
	pop	de
	ld	(ix - 1), l
	or	a, a
	jr	nz, .LBB43_2
; %bb.1:
	xor	a, a
	jp	.LBB43_6
	.local	.LBB43_2
.LBB43_2:
	lea	de, ix - 1
	ld	(ix - 24), de
	lea	de, ix - 17
	ld	(ix - 21), de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	call	_ti_GetSize
	pop	de
	xor	a, a
	ld	(ix - 18), a
	ld	de, (ix - 20)
	ld	d, h
	ld	e, l
	sbc	hl, hl
	ld	a, l
	ld	hl, (ix - 24)
	ld	(ix - 17), hl
	ld	hl, _FileRead
	ld	(ix - 14), hl
	ld	hl, _FileWrite
	ld	(ix - 11), hl
	ld	hl, _FileSeek
	ld	(ix - 8), hl
	ld	(ix - 5), de
	ld	(ix - 2), a
	bit	0, (ix + 9)
	jr	z, .LBB43_4
; %bb.3:
	ld	hl, _disease
	ld	de, _session
	ld	bc, _port
	push	bc
	ld	bc, _region
	push	bc
	push	de
	push	hl
	ld	hl, (ix - 21)
	push	hl
	call	_DecodeSave
	ld	(ix - 21), a                    ; 1-byte Folded Spill
	pop	hl
	pop	hl
	pop	hl
	jr	.LBB43_5
	.local	.LBB43_4
.LBB43_4:
	ld	hl, _region
	push	hl
	ld	hl, (ix - 21)
	push	hl
	call	_ValidateSave
	ld	(ix - 21), a                    ; 1-byte Folded Spill
	.local	.LBB43_5
.LBB43_5:
	pop	hl
	pop	hl
	ld	a, (ix - 1)
	ld	l, a
	push	hl
	call	_ti_Close
	pop	hl
	ld	a, (ix - 21)                    ; 1-byte Folded Reload
	.local	.LBB43_6
.LBB43_6:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end43
.Lfunc_end43:
	.size	_ReadLegacyNamed, .Lfunc_end43-_ReadLegacyNamed
                                        ; -- End function
	.section	.text._ImportLegacySave,"ax",@progbits
	.globl	_ImportLegacySave               ; -- Begin function ImportLegacySave
	.type	_ImportLegacySave,@function
_ImportLegacySave:                      ; @ImportLegacySave
; %bb.0:
	ld	hl, -11
	call	__frameset
	ld	hl, _.str.77.751
	ld	de, 1
	push	de
	push	hl
	call	_ReadLegacyNamed
	pop	hl
	pop	hl
	bit	0, a
	jr	nz, .LBB44_2
; %bb.1:
	ld	hl, _.str.78.752
	ld	de, 1
	push	de
	push	hl
	call	_ReadLegacyNamed
	pop	hl
	pop	hl
	bit	0, a
	jp	z, .LBB44_20
	.local	.LBB44_2
.LBB44_2:
	ld	a, 1
	ld	(ix - 6), a
	ld	hl, 1875397
	ld	(ix - 5), hl
	ld	a, -127
	ld	(ix - 2), a
	ld	bc, 0
	ld	hl, (_session)
	ld	(ix - 9), hl
	ld	a, (_session+3)
	ld	(ix - 10), a                    ; 1-byte Folded Spill
	ld	de, 32
	or	a, a
	sbc	hl, hl
	ld	a, l
	ld	(ix - 11), a
	push	bc
	pop	iy
	.local	.LBB44_3
.LBB44_3:                               ; =>This Inner Loop Header: Depth=1
	lea	hl, iy + 0
	or	a, a
	sbc	hl, de
	jr	nc, .LBB44_5
; %bb.4:                                ;   in Loop: Header=BB44_3 Depth=1
	ld	bc, (ix - 9)
	ld	a, (ix - 10)                    ; 1-byte Folded Reload
	ex	de, hl
	ld	e, iyl
	ex	de, hl
	call	__lshru
	push	bc
	pop	hl
	ld	e, a
	ld	bc, 255
	xor	a, a
	call	__land
	ld	bc, (ix - 5)
	ld	a, (ix - 2)                     ; 1-byte Folded Reload
	call	__lxor
	ld	bc, 403
	ld	a, b
	call	__lmulu
	ld	bc, 0
	ld	(ix - 5), hl
	ld	(ix - 2), e                     ; 1-byte Folded Spill
	ld	de, 8
	add	iy, de
	ld	de, 32
	jr	.LBB44_3
	.local	.LBB44_5
.LBB44_5:
	ld	hl, (_disease+8)
	ld	(ix - 9), hl
	ld	a, (_disease+11)
	ld	(ix - 10), a                    ; 1-byte Folded Spill
	push	bc
	pop	iy
	.local	.LBB44_6
.LBB44_6:                               ; =>This Inner Loop Header: Depth=1
	lea	hl, iy + 0
	ld	de, 32
	or	a, a
	sbc	hl, de
	jr	nc, .LBB44_8
; %bb.7:                                ;   in Loop: Header=BB44_6 Depth=1
	ld	bc, (ix - 9)
	ld	a, (ix - 10)                    ; 1-byte Folded Reload
	ex	de, hl
	ld	e, iyl
	ex	de, hl
	call	__lshru
	push	bc
	pop	hl
	ld	e, a
	ld	bc, 255
	xor	a, a
	call	__land
	ld	bc, (ix - 5)
	ld	a, (ix - 2)                     ; 1-byte Folded Reload
	call	__lxor
	ld	bc, 403
	ld	a, b
	call	__lmulu
	ld	bc, 0
	ld	(ix - 5), hl
	ld	(ix - 2), e                     ; 1-byte Folded Spill
	ld	de, 8
	add	iy, de
	jr	.LBB44_6
	.local	.LBB44_8
.LBB44_8:
	ld	de, 20
	ld	iy, (ix - 5)
	.local	.LBB44_9
.LBB44_9:                               ; %.preheader
                                        ; =>This Inner Loop Header: Depth=1
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	jr	z, .LBB44_12
; %bb.10:                               ;   in Loop: Header=BB44_9 Depth=1
	ld	hl, _disease+37
	add	hl, bc
	ld	l, (hl)
	ld	a, l
	or	a, a
	jr	z, .LBB44_12
; %bb.11:                               ;   in Loop: Header=BB44_9 Depth=1
	xor	a, a
	ld	(ix - 1), a
	ld	(ix - 5), bc
	ld	bc, (ix - 3)
	ld	b, a
	ld	c, l
	lea	hl, iy + 0
	ld	e, (ix - 2)                     ; 1-byte Folded Reload
	ld	a, (ix - 11)                    ; 1-byte Folded Reload
	call	__lxor
	ld	bc, 403
	ld	a, b
	call	__lmulu
	ld	bc, (ix - 5)
	push	hl
	pop	iy
	ld	(ix - 2), e                     ; 1-byte Folded Spill
	ld	de, 20
	inc	bc
	jr	.LBB44_9
	.local	.LBB44_12
.LBB44_12:
	lea	hl, iy + 0
	ld	e, (ix - 2)                     ; 1-byte Folded Reload
	call	__lcmpzero
	jr	z, .LBB44_14
; %bb.13:
	ld	a, 0
	jr	.LBB44_15
	.local	.LBB44_14
.LBB44_14:
	ld	a, 1
	.local	.LBB44_15
.LBB44_15:
	ld	hl, 3635641
	ld	c, -98
	bit	0, a
	jr	nz, .LBB44_17
; %bb.16:
	lea	hl, iy + 0
	.local	.LBB44_17
.LBB44_17:
	bit	0, a
	jr	nz, .LBB44_19
; %bb.18:
	ld	c, (ix - 2)                     ; 1-byte Folded Reload
	.local	.LBB44_19
.LBB44_19:
	push	bc
	push	hl
	ld	hl, _disease
	push	hl
	ld	hl, _world_events
	push	hl
	call	_EventsInit
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	call	_RefreshEffects
	jr	.LBB44_21
	.local	.LBB44_20
.LBB44_20:
	xor	a, a
	ld	(ix - 6), a                     ; 1-byte Folded Spill
	.local	.LBB44_21
.LBB44_21:
	ld	a, (ix - 6)                     ; 1-byte Folded Reload
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end44
.Lfunc_end44:
	.size	_ImportLegacySave, .Lfunc_end44-_ImportLegacySave
                                        ; -- End function
	.section	.text._SaveData,"ax",@progbits
	.globl	_SaveData                       ; -- Begin function SaveData
	.type	_SaveData,@function
_SaveData:                              ; @SaveData
; %bb.0:
	ld	hl, -22
	call	__frameset
	ld	de, _.str.74.764
	ld	hl, _.str.76.750
	push	hl
	push	de
	call	_ti_Open
	ld	l, a
	pop	de
	pop	de
	ld	(ix - 1), l
	or	a, a
	jr	nz, .LBB45_2
	.local	.LBB45_1
.LBB45_1:
	xor	a, a
	jp	.LBB45_9
	.local	.LBB45_2
.LBB45_2:
	xor	a, a
	ld	(ix - 22), a
	lea	de, ix - 1
	ld	(ix - 21), de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	call	_ti_GetSize
	pop	de
	xor	a, a
	ld	(ix - 18), a
	ld	de, (ix - 20)
	ld	d, h
	ld	e, l
	sbc	hl, hl
	ld	a, l
	ld	hl, (ix - 21)
	ld	(ix - 17), hl
	ld	hl, _FileRead
	ld	(ix - 14), hl
	ld	hl, _FileWrite
	ld	(ix - 11), hl
	ld	hl, _FileSeek
	ld	(ix - 8), hl
	ld	(ix - 5), de
	ld	(ix - 2), a
	ld	hl, _world_events
	push	hl
	ld	hl, _port
	push	hl
	ld	hl, _region
	push	hl
	ld	hl, _session
	push	hl
	ld	hl, _disease
	push	hl
	pea	ix - 17
	call	_EncodeSaveV3
	ld	(ix - 21), a                    ; 1-byte Folded Spill
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	a, (ix - 1)
	ld	l, a
	push	hl
	call	_ti_Close
	pop	hl
	bit	0, (ix - 21)                    ; 1-byte Folded Reload
	jr	z, .LBB45_8
; %bb.3:
	or	a, a
	sbc	hl, hl
	push	hl
	ld	hl, _.str.74.764
	push	hl
	call	_ReadNamed
	pop	hl
	pop	hl
	bit	0, a
	jr	z, .LBB45_8
; %bb.4:
	ld	de, _.str.72.749
	or	a, a
	sbc	hl, hl
	push	hl
	push	de
	call	_ReadNamed
	pop	hl
	pop	hl
	bit	0, a
	jr	z, .LBB45_6
; %bb.5:
	ld	hl, _.str.73.763
	push	hl
	ld	hl, _.str.72.749
	push	hl
	call	_CopyNamed
	pop	hl
	pop	hl
	bit	0, a
	jp	z, .LBB45_1
	.local	.LBB45_6
.LBB45_6:
	ld	hl, _.str.72.749
	push	hl
	ld	hl, _.str.74.764
	push	hl
	call	_CopyNamed
	pop	hl
	pop	hl
	bit	0, a
	ld	a, 0
	jr	z, .LBB45_9
; %bb.7:
	ld	a, 1
	ld	(ix - 22), a
	.local	.LBB45_8
.LBB45_8:
	ld	hl, _.str.74.764
	push	hl
	call	_ti_Delete
	pop	hl
	ld	a, (ix - 22)                    ; 1-byte Folded Reload
	.local	.LBB45_9
.LBB45_9:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end45
.Lfunc_end45:
	.size	_SaveData, .Lfunc_end45-_SaveData
                                        ; -- End function
	.section	.text._CopyNamed,"ax",@progbits
	.type	_CopyNamed,@function            ; -- Begin function CopyNamed
_CopyNamed:                             ; @CopyNamed
; %bb.0:
	ld	hl, -50
	call	__frameset
	ld	hl, (ix + 6)
	ld	de, _.str.79.761
	push	de
	push	hl
	call	_ti_Open
	ld	e, a
	pop	hl
	pop	hl
	or	a, a
	jp	z, .LBB46_11
; %bb.1:
	push	de
	ld	(ix - 35), de
	call	_ti_GetSize
	ld	(ix - 41), l
	ld	(ix - 40), h
	pop	hl
	ld	hl, _.str.76.750
	push	hl
	ld	hl, (ix + 9)
	push	hl
	call	_ti_Open
	ld	e, a
	pop	hl
	pop	hl
	ld	(ix - 38), de
	or	a, a
	jr	nz, .LBB46_3
; %bb.2:
	ld	hl, (ix - 35)
	jp	.LBB46_10
	.local	.LBB46_3
.LBB46_3:
	lea	iy, ix - 32
	ld	de, 0
	ld	l, (ix - 41)
	ld	h, (ix - 40)
	ld	e, l
	ld	d, h
	.local	.LBB46_4
.LBB46_4:                               ; =>This Inner Loop Header: Depth=1
	sbc	hl, hl
	adc	hl, de
	jp	z, .LBB46_13
; %bb.5:                                ;   in Loop: Header=BB46_4 Depth=1
	push	de
	pop	hl
	push	de
	pop	bc
	ld	de, 32
	or	a, a
	sbc	hl, de
	ld	(ix - 41), bc
	ld	hl, (ix - 35)
	jr	c, .LBB46_7
; %bb.6:                                ;   in Loop: Header=BB46_4 Depth=1
	ld	bc, 32
	.local	.LBB46_7
.LBB46_7:                               ;   in Loop: Header=BB46_4 Depth=1
	ld	(ix - 44), bc
	push	hl
	push	bc
	ld	hl, 1
	push	hl
	push	iy
	ld	(ix - 47), iy
	call	_ti_Read
	ld	bc, 1
	pop	de
	pop	de
	pop	de
	pop	de
	ld	de, (ix - 44)
	push	de
	pop	iy
	or	a, a
	sbc	hl, de
	ld	de, (ix - 41)
	jr	nz, .LBB46_9
; %bb.8:                                ;   in Loop: Header=BB46_4 Depth=1
	ld	hl, (ix - 38)
	push	hl
	push	iy
	push	bc
	ld	hl, (ix - 47)
	push	hl
	call	_ti_Write
	ld	iy, (ix - 47)
	ld	(ix - 50), hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (ix - 41)
	ld	bc, (ix - 44)
	or	a, a
	sbc	hl, bc
	ex	de, hl
	ld	hl, (ix - 50)
	or	a, a
	sbc	hl, bc
	jr	z, .LBB46_4
	.local	.LBB46_9
.LBB46_9:
	ld	hl, (ix - 35)
	push	hl
	call	_ti_Close
	pop	hl
	ld	hl, (ix - 38)
	.local	.LBB46_10
.LBB46_10:
	push	hl
	call	_ti_Close
	pop	hl
	.local	.LBB46_11
.LBB46_11:
	xor	a, a
	.local	.LBB46_12
.LBB46_12:
	ld	sp, ix
	pop	ix
	ret
	.local	.LBB46_13
.LBB46_13:
	ld	hl, (ix - 35)
	push	hl
	call	_ti_Close
	pop	hl
	ld	hl, (ix - 38)
	push	hl
	call	_ti_Close
	pop	hl
	or	a, a
	sbc	hl, hl
	push	hl
	ld	hl, (ix + 9)
	push	hl
	call	_ReadNamed
	pop	hl
	pop	hl
	jr	.LBB46_12
	.local	.Lfunc_end46
.Lfunc_end46:
	.size	_CopyNamed, .Lfunc_end46-_CopyNamed
                                        ; -- End function
	.section	.text._SaveSize,"ax",@progbits
	.globl	_SaveSize                       ; -- Begin function SaveSize
	.type	_SaveSize,@function
_SaveSize:                              ; @SaveSize
; %bb.0:
	ld	hl, -9
	call	__frameset
	ld	bc, 0
	ld	iy, 110
	xor	a, a
	ld	de, 112
	ld	(ix - 3), a                     ; 1-byte Folded Spill
	.local	.LBB47_1
.LBB47_1:                               ; =>This Inner Loop Header: Depth=1
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	jr	z, .LBB47_3
; %bb.2:                                ;   in Loop: Header=BB47_1 Depth=1
	ld	(ix - 9), iy
	ld	iy, (ix + 6)
	ld	(ix - 6), bc
	add	iy, bc
	ld	a, (iy + 6)
	ld	d, 0
	ld	(ix - 2), d
	ld	bc, (ix - 4)
	ld	b, d
	ld	c, a
	or	a, a
	sbc	hl, hl
	ld	a, l
	ld	e, (iy + 7)
	ld	(ix - 1), d
	ld	hl, (ix - 3)
	ld	h, d
	ld	l, e
	ld	e, a
	call	__lmulu
	ld	bc, (ix - 9)
	ld	a, (ix - 3)                     ; 1-byte Folded Reload
	call	__ladd
	push	hl
	pop	iy
	ld	(ix - 3), e                     ; 1-byte Folded Spill
	ld	hl, (ix - 6)
	ld	bc, 16
	add	hl, bc
	ld	de, 112
	push	hl
	pop	bc
	jr	.LBB47_1
	.local	.LBB47_3
.LBB47_3:
	lea	hl, iy + 0
	ld	e, (ix - 3)                     ; 1-byte Folded Reload
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end47
.Lfunc_end47:
	.size	_SaveSize, .Lfunc_end47-_SaveSize
                                        ; -- End function
	.section	.text._EncodeSave,"ax",@progbits
	.globl	_EncodeSave                     ; -- Begin function EncodeSave
	.type	_EncodeSave,@function
_EncodeSave:                            ; @EncodeSave
; %bb.0:
	ld	hl, -93
	call	__frameset
	ld	bc, 1875397
	xor	a, a
	lea	de, ix - 9
	ld	(ix - 82), de
	lea	de, ix - 67
	lea	iy, ix - 76
	lea	hl, ix - 79
	ld	(ix - 85), hl
	ld	hl, (ix + 6)
	ld	(ix - 9), hl
	ld	(ix - 6), bc
	ld	(ix - 3), -127
	ld	(ix - 2), 1
	ld	(ix - 1), 1
	ld	(ix - 88), de
	ld	hl, (ix + 9)
	ld	bc, 58
	ldir
	ld	(ix - 91), iy
	lea	de, iy + 0
	ld	hl, (ix + 12)
	ld	bc, 9
	ldir
	ld	de, 0
	ld	(ix - 79), a
	ld	(ix - 78), a
	ld	(ix - 77), a
	ld	iy, (ix + 18)
	lea	iy, iy + 5
	ld	bc, 22
	.local	.LBB48_1
.LBB48_1:                               ; =>This Inner Loop Header: Depth=1
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	jr	z, .LBB48_5
; %bb.2:                                ;   in Loop: Header=BB48_1 Depth=1
	lea	hl, iy + 0
	bit	0, (hl)
	jr	z, .LBB48_4
; %bb.3:                                ;   in Loop: Header=BB48_1 Depth=1
	ld	(ix - 92), a                    ; 1-byte Folded Spill
	ld	l, 7
	ld	a, (ix - 92)
	and	a, l
	ld	b, a
	ld	a, 1
	call	__bshl
	ld	(ix - 93), a                    ; 1-byte Folded Spill
	push	de
	pop	hl
	ld	c, 3
	call	__ishru
	push	de
	pop	bc
	ex	de, hl
	ld	hl, (ix - 85)
	add	hl, de
	ld	a, (hl)
	ld	e, (ix - 93)
	or	a, e
	ld	e, a
	ld	a, (ix - 92)                    ; 1-byte Folded Reload
	ld	(hl), e
	push	bc
	pop	de
	ld	bc, 22
	.local	.LBB48_4
.LBB48_4:                               ;   in Loop: Header=BB48_1 Depth=1
	inc	de
	lea	iy, iy + 6
	inc	a
	jr	.LBB48_1
	.local	.LBB48_5
.LBB48_5:
	ld	hl, (ix + 15)
	push	hl
	call	_SaveSize
                                        ; kill: def $e killed $e def $ude
	pop	bc
	push	de
	push	hl
	ld	hl, 2
	push	hl
	ld	hl, (ix - 82)
	push	hl
	call	_Header
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (ix - 85)
	push	hl
	ld	hl, (ix - 91)
	push	hl
	ld	hl, (ix - 88)
	push	hl
	ld	hl, (ix - 82)
	push	hl
	call	_State
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (ix + 15)
	push	hl
	ld	hl, (ix - 82)
	push	hl
	call	_WriteMap
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end48
.Lfunc_end48:
	.size	_EncodeSave, .Lfunc_end48-_EncodeSave
                                        ; -- End function
	.section	.text._Header,"ax",@progbits
	.type	_Header,@function               ; -- Begin function Header
_Header:                                ; @Header
; %bb.0:
	ld	hl, -15
	call	__frameset
	ld	c, (ix + 9)
	ld	a, (ix + 15)
	lea	de, ix - 4
	ld	(ix - 12), de
	lea	iy, ix - 9
	ld	(ix - 15), iy
	ld	hl, 5525059
	ld	(ix - 4), hl
	ld	(ix - 1), 71
	ld	(ix - 5), c
	ld	hl, (ix + 12)
	ld	(ix - 9), hl
	lea	hl, iy + 3
	ld	(hl), a
	ld	hl, 4
	push	hl
	push	de
	ld	hl, (ix + 6)
	push	hl
	call	_Bytes
	pop	hl
	pop	hl
	pop	hl
	pea	ix - 5
	ld	hl, (ix + 6)
	push	hl
	call	_U8
	pop	hl
	pop	hl
	ld	hl, (ix - 15)
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_U32
	pop	hl
	pop	hl
	ld	hl, 4
	push	hl
	ld	hl, _.str.526
	push	hl
	ld	hl, (ix - 12)
	push	hl
	call	_memcmp
	pop	de
	pop	de
	pop	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB49_3
; %bb.1:
	ld	a, (ix - 5)
	ld	l, (ix + 9)
	cp	a, l
	jr	nz, .LBB49_3
; %bb.2:
	ld	hl, (ix - 9)
	ld	e, (ix - 6)
	ld	bc, (ix + 12)
	ld	a, (ix + 15)
	call	__lcmpu
	jr	z, .LBB49_4
	.local	.LBB49_3
.LBB49_3:
	ld	iy, (ix + 6)
	ld	(iy + 7), 0
	.local	.LBB49_4
.LBB49_4:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end49
.Lfunc_end49:
	.size	_Header, .Lfunc_end49-_Header
                                        ; -- End function
	.section	.text._State,"ax",@progbits
	.type	_State,@function                ; -- Begin function State
_State:                                 ; @State
; %bb.0:
	call	__frameset0
	ld	de, (ix + 6)
	ld	hl, (ix + 9)
	push	hl
	push	de
	call	_U32
	pop	hl
	pop	hl
	ld	iy, (ix + 9)
	pea	iy + 4
	ld	hl, (ix + 6)
	push	hl
	call	_U32
	pop	hl
	pop	hl
	ld	iy, (ix + 9)
	pea	iy + 8
	ld	hl, (ix + 6)
	push	hl
	call	_U32
	pop	hl
	pop	hl
	ld	iy, (ix + 9)
	pea	iy + 12
	ld	hl, (ix + 6)
	push	hl
	call	_U32
	pop	hl
	pop	hl
	ld	iy, (ix + 9)
	pea	iy + 16
	ld	hl, (ix + 6)
	push	hl
	call	_U32
	pop	hl
	pop	hl
	ld	iy, (ix + 9)
	pea	iy + 20
	ld	hl, (ix + 6)
	push	hl
	call	_U16
	pop	hl
	pop	hl
	ld	iy, (ix + 9)
	pea	iy + 22
	ld	hl, (ix + 6)
	push	hl
	call	_U16
	pop	hl
	pop	hl
	ld	iy, (ix + 9)
	pea	iy + 24
	ld	hl, (ix + 6)
	push	hl
	call	_U16
	pop	hl
	pop	hl
	ld	iy, (ix + 9)
	pea	iy + 26
	ld	hl, (ix + 6)
	push	hl
	call	_U16
	pop	hl
	pop	hl
	ld	iy, (ix + 9)
	pea	iy + 28
	ld	hl, (ix + 6)
	push	hl
	call	_U8
	pop	hl
	pop	hl
	ld	iy, (ix + 9)
	pea	iy + 29
	ld	hl, (ix + 6)
	push	hl
	call	_U8
	pop	hl
	pop	hl
	ld	iy, (ix + 9)
	pea	iy + 30
	ld	hl, (ix + 6)
	push	hl
	call	_U8
	pop	hl
	pop	hl
	ld	iy, (ix + 9)
	pea	iy + 31
	ld	hl, (ix + 6)
	push	hl
	call	_U8
	pop	hl
	pop	hl
	ld	iy, (ix + 9)
	pea	iy + 32
	ld	hl, (ix + 6)
	push	hl
	call	_U8
	pop	hl
	pop	hl
	ld	iy, (ix + 9)
	pea	iy + 33
	ld	hl, (ix + 6)
	push	hl
	call	_U8
	pop	hl
	pop	hl
	ld	iy, (ix + 9)
	pea	iy + 34
	ld	hl, (ix + 6)
	push	hl
	call	_U8
	pop	hl
	pop	hl
	ld	iy, (ix + 9)
	pea	iy + 35
	ld	hl, (ix + 6)
	push	hl
	call	_U8
	pop	hl
	pop	hl
	ld	iy, (ix + 9)
	pea	iy + 36
	ld	hl, (ix + 6)
	push	hl
	call	_U8
	pop	hl
	pop	hl
	ld	hl, 20
	push	hl
	ld	iy, (ix + 9)
	pea	iy + 37
	ld	hl, (ix + 6)
	push	hl
	call	_Bytes
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (ix + 12)
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_U32
	pop	hl
	pop	hl
	ld	iy, (ix + 12)
	pea	iy + 4
	ld	hl, (ix + 6)
	push	hl
	call	_U8
	pop	hl
	pop	hl
	ld	iy, (ix + 12)
	pea	iy + 5
	ld	hl, (ix + 6)
	push	hl
	call	_U8
	pop	hl
	pop	hl
	ld	iy, (ix + 12)
	pea	iy + 6
	ld	hl, (ix + 6)
	push	hl
	call	_U8
	pop	hl
	pop	hl
	ld	iy, (ix + 12)
	pea	iy + 7
	ld	hl, (ix + 6)
	push	hl
	call	_U8
	pop	hl
	pop	hl
	ld	iy, (ix + 12)
	pea	iy + 8
	ld	hl, (ix + 6)
	push	hl
	call	_U8
	pop	hl
	pop	hl
	ld	hl, 3
	push	hl
	ld	hl, (ix + 15)
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_Bytes
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (ix + 9)
	push	hl
	call	_ValidateDisease
	pop	hl
	bit	0, a
	jr	z, .LBB50_7
; %bb.1:
	ld	iy, (ix + 12)
	ld	a, (iy + 4)
	cp	a, 7
	jr	nc, .LBB50_7
; %bb.2:
	ld	a, (iy + 5)
	cp	a, 7
	jr	nc, .LBB50_7
; %bb.3:
	ld	a, (iy + 6)
	cp	a, -96
	jr	nc, .LBB50_7
; %bb.4:
	ld	a, (iy + 7)
	cp	a, 120
	jr	nc, .LBB50_7
; %bb.5:
	ld	a, (iy + 8)
	cp	a, 2
	jr	nc, .LBB50_7
; %bb.6:
	ld	iy, (ix + 15)
	ld	e, (iy + 2)
	ld	a, e
	cp	a, 64
	jr	c, .LBB50_9
	.local	.LBB50_7
.LBB50_7:
	ld	iy, (ix + 6)
	ld	(iy + 7), 0
	.local	.LBB50_8
.LBB50_8:
	pop	ix
	ret
	.local	.LBB50_9
.LBB50_9:
	ld	iy, (ix + 9)
	ld	a, (iy + 35)
	or	a, a
	jr	nz, .LBB50_8
; %bb.10:
	ld	hl, (ix + 15)
	ld	a, (hl)
	or	a, a
	jr	nz, .LBB50_7
; %bb.11:
	ld	iy, (ix + 15)
	ld	a, (iy + 1)
	or	a, e
	ld	l, a
	or	a, a
	jr	nz, .LBB50_7
	jr	.LBB50_8
	.local	.Lfunc_end50
.Lfunc_end50:
	.size	_State, .Lfunc_end50-_State
                                        ; -- End function
	.section	.text._WriteMap,"ax",@progbits
	.type	_WriteMap,@function             ; -- Begin function WriteMap
_WriteMap:                              ; @WriteMap
; %bb.0:
	ld	hl, -6
	call	__frameset
	ld	bc, 0
	ld	de, 112
	.local	.LBB51_1
.LBB51_1:                               ; =>This Inner Loop Header: Depth=1
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	jr	z, .LBB51_3
; %bb.2:                                ;   in Loop: Header=BB51_1 Depth=1
	ld	hl, (ix + 9)
	add	hl, bc
	ld	(ix - 6), hl
	push	hl
	ld	hl, (ix + 6)
	push	hl
	ld	(ix - 3), bc
	call	_Geometry
	pop	hl
	pop	hl
	ld	iy, (ix - 6)
	ld	de, (iy + 3)
	ld	a, (iy + 6)
	or	a, a
	sbc	hl, hl
	push	hl
	pop	bc
	ld	c, a
	ld	a, (iy + 7)
	ld	l, a
	call	__imulu
	push	hl
	push	de
	ld	hl, (ix + 6)
	push	hl
	call	_Bytes
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (ix - 3)
	ld	de, 16
	add	hl, de
	ld	de, 112
	push	hl
	pop	bc
	jr	.LBB51_1
	.local	.LBB51_3
.LBB51_3:
	ld	hl, (ix + 6)
	push	hl
	call	_Checksum
	pop	hl
	ld	iy, (ix + 6)
	ld	a, (iy + 7)
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end51
.Lfunc_end51:
	.size	_WriteMap, .Lfunc_end51-_WriteMap
                                        ; -- End function
	.section	.text._Geometry,"ax",@progbits
	.type	_Geometry,@function             ; -- Begin function Geometry
_Geometry:                              ; @Geometry
; %bb.0:
	ld	hl, -4
	call	__frameset
	ld	de, (ix + 6)
	ld	iy, (ix + 9)
	ld	hl, 4
	ld	a, (iy + 6)
	ld	(ix - 4), a
	ld	a, (iy + 7)
	ld	(ix - 3), a
	ld	a, (iy + 8)
	ld	(ix - 2), a
	ld	a, (iy + 9)
	ld	(ix - 1), a
	push	hl
	pea	ix - 4
	push	de
	call	_Bytes
	ld	iy, (ix + 9)
	pop	hl
	pop	hl
	pop	hl
	ld	a, (ix - 4)
	ld	l, (iy + 6)
	cp	a, l
	jr	nz, .LBB52_4
; %bb.1:
	ld	l, (iy + 7)
	ld	a, (ix - 3)
	cp	a, l
	jr	nz, .LBB52_4
; %bb.2:
	ld	l, (iy + 8)
	ld	a, (ix - 2)
	cp	a, l
	jr	nz, .LBB52_4
; %bb.3:
	ld	l, (iy + 9)
	ld	a, (ix - 1)
	cp	a, l
	jr	z, .LBB52_5
	.local	.LBB52_4
.LBB52_4:
	ld	iy, (ix + 6)
	ld	(iy + 7), 0
	.local	.LBB52_5
.LBB52_5:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end52
.Lfunc_end52:
	.size	_Geometry, .Lfunc_end52-_Geometry
                                        ; -- End function
	.section	.text._Bytes,"ax",@progbits
	.type	_Bytes,@function                ; -- Begin function Bytes
_Bytes:                                 ; @Bytes
; %bb.0:
	ld	hl, -11
	call	__frameset
	ld	iy, (ix + 6)
	bit	0, (iy + 7)
	jp	z, .LBB53_8
; %bb.1:
	lea	hl, iy + 0
	ld	iy, (hl)
	lea	bc, iy + 0
	ld	de, (iy)
	push	hl
	pop	iy
	bit	0, (iy + 8)
	jr	z, .LBB53_3
; %bb.2:
	push	bc
	pop	iy
	ld	iy, (iy + 6)
	jr	.LBB53_4
	.local	.LBB53_3
.LBB53_3:
	push	bc
	pop	iy
	ld	iy, (iy + 3)
	.local	.LBB53_4
.LBB53_4:
	ld	hl, (ix + 12)
	push	hl
	ld	hl, (ix + 9)
	ld	(ix - 4), hl
	push	hl
	push	de
	call	__indcall
	ld	l, a
	pop	de
	pop	de
	pop	de
	ld	d, 1
	ld	a, l
	and	a, d
	ld	e, a
	ld	iy, (ix + 6)
	ld	(iy + 7), e
	bit	0, l
	jr	z, .LBB53_8
; %bb.5:
	ld	e, 0
	or	a, a
	sbc	hl, hl
	ld	a, l
	ld	(ix - 5), a
	lea	iy, iy + 3
	lea	hl, iy + 3
	ld	(ix - 8), hl
	ld	hl, (ix + 12)
	.local	.LBB53_6
.LBB53_6:                               ; =>This Inner Loop Header: Depth=1
	push	hl
	pop	bc
	sbc	hl, hl
	adc	hl, bc
	ld	iy, (ix + 6)
	jr	z, .LBB53_8
; %bb.7:                                ;   in Loop: Header=BB53_6 Depth=1
	ld	hl, (ix - 4)
	ld	a, (hl)
	ld	(ix - 1), e
	ld	(ix - 11), bc
	ld	bc, (ix - 3)
	ld	b, e
	ld	c, a
	ld	hl, (iy + 3)
	ld	iy, (ix - 8)
	ld	e, (iy)
	ld	a, (ix - 5)                     ; 1-byte Folded Reload
	call	__lxor
	ld	bc, 403
	ld	a, d
	call	__lmulu
	ld	iy, (ix + 6)
	ld	(iy + 3), hl
	ld	(iy + 6), e
	ld	e, 0
	ld	hl, (ix - 4)
	inc	hl
	ld	(ix - 4), hl
	ld	hl, (ix - 11)
	dec	hl
	jr	.LBB53_6
	.local	.LBB53_8
.LBB53_8:                               ; %.loopexit
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end53
.Lfunc_end53:
	.size	_Bytes, .Lfunc_end53-_Bytes
                                        ; -- End function
	.section	.text._Checksum,"ax",@progbits
	.type	_Checksum,@function             ; -- Begin function Checksum
_Checksum:                              ; @Checksum
; %bb.0:
	ld	hl, -8
	call	__frameset
	ld	de, (ix + 6)
	lea	bc, ix - 4
	push	de
	pop	iy
	ld	hl, (iy + 3)
	ld	(ix - 7), hl
	ld	a, (iy + 6)
	ld	(ix - 8), a
	ld	(ix - 4), hl
	push	bc
	pop	iy
	lea	hl, iy + 3
	ld	(hl), a
	push	iy
	push	de
	call	_U32
	pop	hl
	pop	hl
	ld	hl, (ix - 4)
	ld	e, (ix - 1)
	ld	bc, (ix - 7)
	ld	a, (ix - 8)                     ; 1-byte Folded Reload
	call	__lcmpu
	jr	z, .LBB54_2
; %bb.1:
	ld	iy, (ix + 6)
	ld	(iy + 7), 0
	.local	.LBB54_2
.LBB54_2:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end54
.Lfunc_end54:
	.size	_Checksum, .Lfunc_end54-_Checksum
                                        ; -- End function
	.section	.text._U32,"ax",@progbits
	.type	_U32,@function                  ; -- Begin function U32
_U32:                                   ; @U32
; %bb.0:
	ld	hl, -8
	call	__frameset
	ld	iy, (ix + 9)
	ld	de, (iy)
	ld	h, (iy + 3)
	ld	a, e
	ld	(ix - 4), a
	ld	a, d
	ld	(ix - 3), a
	ld	l, 16
	push	de
	pop	bc
	ld	a, h
	call	__lshru
	ld	a, c
	ld	(ix - 2), a
	ld	l, 24
	push	de
	pop	bc
	ld	a, h
	call	__lshru
	ld	a, c
	ld	(ix - 1), a
	ld	hl, 4
	push	hl
	pea	ix - 4
	ld	hl, (ix + 6)
	push	hl
	call	_Bytes
	ld	iy, (ix + 6)
	pop	hl
	pop	hl
	pop	hl
	bit	0, (iy + 8)
	jr	nz, .LBB55_3
; %bb.1:
	bit	0, (iy + 7)
	jr	z, .LBB55_3
; %bb.2:
	ld	a, (ix - 4)
	ld	e, 0
	ld	(ix - 8), e
	ld	iy, (ix - 10)
	ld	iyh, e
	ld	iyl, a
	or	a, a
	sbc	hl, hl
	ld	d, l
	ld	a, (ix - 3)
	ld	(ix - 7), e
	ld	bc, (ix - 9)
	ld	b, e
	ld	c, a
	ld	l, 8
	ld	a, d
	call	__lshl
	push	bc
	pop	hl
	ld	e, a
	lea	bc, iy + 0
	ld	a, d
	call	__ladd
	push	hl
	pop	iy
	ld	a, (ix - 2)
	ld	l, 0
	ld	(ix - 6), l
	ld	bc, (ix - 8)
	ld	b, l
	ld	c, a
	ld	l, 16
	ld	a, d
	call	__lshl
	lea	hl, iy + 0
	call	__ladd
	push	hl
	pop	iy
	ld	a, (ix - 1)
	ld	l, 0
	ld	(ix - 5), l
	ld	bc, (ix - 7)
	ld	b, l
	ld	c, a
	ld	l, 24
	ld	a, d
	call	__lshl
	lea	hl, iy + 0
	call	__ladd
	ld	bc, (ix + 9)
	push	bc
	pop	iy
	ld	(iy), hl
	ld	(iy + 3), e
	.local	.LBB55_3
.LBB55_3:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end55
.Lfunc_end55:
	.size	_U32, .Lfunc_end55-_U32
                                        ; -- End function
	.section	.text._U16,"ax",@progbits
	.type	_U16,@function                  ; -- Begin function U16
_U16:                                   ; @U16
; %bb.0:
	ld	hl, -2
	call	__frameset
	ld	bc, (ix + 6)
	ld	hl, (ix + 9)
	ld	iy, 2
	ld	de, (hl)
	ld	a, e
	ld	(ix - 2), a
	ld	a, d
	ld	(ix - 1), a
	push	iy
	pea	ix - 2
	push	bc
	call	_Bytes
	ld	iy, (ix + 6)
	pop	hl
	pop	hl
	pop	hl
	bit	0, (iy + 8)
	jr	nz, .LBB56_3
; %bb.1:
	bit	0, (iy + 7)
	jr	z, .LBB56_3
; %bb.2:
	ld	e, (ix - 2)
	ld	d, 0
	ld	a, (ix - 1)
	ld	h, d
	ld	l, a
	ld	h, l
	ld	l, d
	add.sis	hl, de
	ld	iy, (ix + 9)
	ld	(iy), l
	ld	(iy + 1), h
	.local	.LBB56_3
.LBB56_3:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end56
.Lfunc_end56:
	.size	_U16, .Lfunc_end56-_U16
                                        ; -- End function
	.section	.text._U8,"ax",@progbits
	.type	_U8,@function                   ; -- Begin function U8
_U8:                                    ; @U8
; %bb.0:
	call	__frameset0
	ld	hl, (ix + 6)
	ld	de, (ix + 9)
	ld	bc, 1
	push	bc
	push	de
	push	hl
	call	_Bytes
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end57
.Lfunc_end57:
	.size	_U8, .Lfunc_end57-_U8
                                        ; -- End function
	.section	.text._ValidateSave,"ax",@progbits
	.globl	_ValidateSave                   ; -- Begin function ValidateSave
	.type	_ValidateSave,@function
_ValidateSave:                          ; @ValidateSave
; %bb.0:
	call	__frameset0
	ld	hl, (ix + 6)
	ld	de, (ix + 9)
	ld	bc, 0
	push	bc
	push	bc
	push	de
	push	bc
	push	bc
	push	hl
	call	_ReadSave
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end58
.Lfunc_end58:
	.size	_ValidateSave, .Lfunc_end58-_ValidateSave
                                        ; -- End function
	.section	.text._ReadSave,"ax",@progbits
	.type	_ReadSave,@function             ; -- Begin function ReadSave
_ReadSave:                              ; @ReadSave
; %bb.0:
	ld	hl, -91
	call	__frameset
	ld	de, (ix + 6)
	ld	bc, 1875397
	lea	hl, ix - 67
	lea	iy, ix - 76
	ld	(ix - 9), de
	ld	(ix - 6), bc
	ld	(ix - 3), -127
	ld	(ix - 2), 1
	ld	(ix - 1), 0
	ld	(ix - 67), 0
	push	hl
	pop	de
	inc	de
	ld	bc, 57
	ld	(ix - 91), hl
	ldir
	ld	(ix - 76), 0
	lea	de, iy + 0
	inc	de
	ld	(ix - 88), iy
	lea	hl, iy + 0
	ld	bc, 8
	ldir
	ld	(ix - 79), 0
	ld	(ix - 78), 0
	ld	(ix - 77), 0
	ld	iy, (ix + 6)
	ld	hl, (iy + 12)
	ld	(ix - 82), hl
	ld	a, (iy + 15)
	ld	(ix - 85), a
	ld	hl, (ix + 15)
	push	hl
	call	_SaveSize
	push	hl
	pop	bc
	ld	a, e
	pop	hl
	ld	hl, (ix - 82)
	ld	e, (ix - 85)                    ; 1-byte Folded Reload
	call	__lcmpu
	jp	nz, .LBB59_9
; %bb.1:
	ld	bc, 0
	ld	hl, (ix + 6)
	push	hl
	pop	iy
	ld	hl, (iy + 9)
	ld	de, (iy)
	push	bc
	push	bc
	push	de
	call	__indcallhl
	pop	hl
	pop	hl
	pop	hl
	bit	0, a
	ld	a, 0
	jp	z, .LBB59_10
; %bb.2:
	lea	hl, ix - 9
	ld	(ix - 82), hl
	lea	hl, ix - 79
	ld	(ix - 85), hl
	ld	hl, (ix + 15)
	push	hl
	call	_SaveSize
                                        ; kill: def $e killed $e def $ude
	pop	bc
	push	de
	push	hl
	ld	hl, 2
	push	hl
	ld	hl, (ix - 82)
	push	hl
	call	_Header
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (ix - 85)
	push	hl
	ld	hl, (ix - 88)
	push	hl
	ld	hl, (ix - 91)
	push	hl
	ld	hl, (ix - 82)
	push	hl
	call	_State
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	l, (ix + 21)
	push	hl
	ld	hl, (ix + 15)
	push	hl
	ld	hl, (ix - 88)
	push	hl
	ld	hl, (ix - 91)
	push	hl
	ld	hl, (ix - 82)
	push	hl
	call	_ReadMap
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	bit	0, a
	jp	z, .LBB59_10
; %bb.3:
	bit	0, (ix + 21)
	jp	z, .LBB59_10
; %bb.4:
	ld	de, (ix + 9)
	ld	bc, 58
	ld	iy, 9
	ld	a, 1
	ld	hl, (ix - 91)
	ldir
	ld	de, (ix + 12)
	ld	hl, (ix - 88)
	lea	bc, iy + 0
	ldir
	ld	iy, (ix + 18)
	lea	iy, iy + 5
	ld	bc, 22
	ld	de, 0
	.local	.LBB59_5
.LBB59_5:                               ; =>This Inner Loop Header: Depth=1
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	jp	z, .LBB59_11
; %bb.6:                                ;   in Loop: Header=BB59_5 Depth=1
	push	de
	pop	hl
	ld	c, 3
	call	__ishru
	push	hl
	pop	bc
	ld	hl, (ix - 85)
	add	hl, bc
	ld	a, (hl)
	ld	(ix - 82), de
	ex	de, hl
	ld	bc, 7
	call	__iand
	push	hl
	pop	bc
	ld	hl, 1
                                        ; kill: def $c killed $c killed $ubc
	call	__ishl
	ld	e, a
	ld	a, l
	and	a, e
	ld	l, a
	or	a, a
	ld	a, 1
	jr	nz, .LBB59_8
; %bb.7:                                ;   in Loop: Header=BB59_5 Depth=1
	ld	a, 0
	.local	.LBB59_8
.LBB59_8:                               ;   in Loop: Header=BB59_5 Depth=1
	ld	(iy), a
	ld	de, (ix - 82)
	inc	de
	lea	iy, iy + 6
	ld	a, 1
	ld	bc, 22
	jp	.LBB59_5
	.local	.LBB59_9
.LBB59_9:
	xor	a, a
	.local	.LBB59_10
.LBB59_10:                              ; %.loopexit
	ld	sp, ix
	pop	ix
	ret
	.local	.LBB59_11
.LBB59_11:
	ld	bc, 112
	ld	de, 0
	.local	.LBB59_12
.LBB59_12:                              ; %.preheader
                                        ; =>This Inner Loop Header: Depth=1
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	jr	z, .LBB59_10
; %bb.13:                               ;   in Loop: Header=BB59_12 Depth=1
	ld	hl, (ix + 15)
	add	hl, de
	push	hl
	ld	(ix - 82), de
	call	_RecountRegion
	ld	bc, 112
	ld	a, 1
	pop	hl
	ld	hl, (ix - 82)
	ld	de, 16
	add	hl, de
	ex	de, hl
	jr	.LBB59_12
	.local	.Lfunc_end59
.Lfunc_end59:
	.size	_ReadSave, .Lfunc_end59-_ReadSave
                                        ; -- End function
	.section	.text._ReadMap,"ax",@progbits
	.type	_ReadMap,@function              ; -- Begin function ReadMap
_ReadMap:                               ; @ReadMap
; %bb.0:
	ld	hl, -136
	call	__frameset
	xor	a, a
	ld.sis	de, 0
	ld	iy, 0
	lea	hl, ix - 38
	ld	(ix - 120), hl
	lea	hl, ix - 45
	ld	(ix - 117), hl
	lea	hl, ix - 103
	ld	(ix - 114), hl
	ld	bc, 7
	ld	(ix - 109), e
	ld	(ix - 108), d
	ld	(ix - 111), e
	ld	(ix - 110), d
	lea	hl, iy + 0
	ld	(ix - 107), a                   ; 1-byte Folded Spill
	.local	.LBB60_1
.LBB60_1:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB60_4 Depth 2
                                        ;       Child Loop BB60_10 Depth 3
	ld	(ix - 106), hl
	or	a, a
	sbc	hl, bc
	jp	z, .LBB60_32
; %bb.2:                                ;   in Loop: Header=BB60_1 Depth=1
	ld	iy, (ix + 6)
	bit	0, (iy + 7)
	jp	z, .LBB60_32
; %bb.3:                                ;   in Loop: Header=BB60_1 Depth=1
	ld	(ix - 125), e
	ld	(ix - 124), d
	ld	hl, (ix - 106)
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de, hl
	ld	iy, (ix + 15)
	add	iy, de
	ld	a, (iy + 6)
	or	a, a
	sbc	hl, hl
	push	hl
	pop	bc
	ld	c, a
	ld	a, (iy + 7)
	ld	l, a
	call	__imulu
	ld	(ix - 123), hl
	ld	de, -131
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), iy
	push	iy
	ld	hl, (ix + 6)
	push	hl
	call	_Geometry
	ld	de, (ix - 123)
	pop	hl
	pop	hl
	ld	hl, 1
	ld	bc, (ix - 106)
                                        ; kill: def $c killed $c killed $ubc
	call	__ishl
	ld	bc, 32
	ld	a, l
	or	a, a
	sbc	hl, hl
	.local	.LBB60_4
.LBB60_4:                               ;   Parent Loop BB60_1 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB60_10 Depth 3
	ld	(ix - 128), hl
	or	a, a
	sbc	hl, de
	jp	nc, .LBB60_31
; %bb.5:                                ;   in Loop: Header=BB60_4 Depth=2
	ld	iy, (ix + 6)
	bit	0, (iy + 7)
	jp	z, .LBB60_31
; %bb.6:                                ;   in Loop: Header=BB60_4 Depth=2
	ld	de, -135
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), a                     ; 1-byte Folded Spill
	ld	hl, (ix - 123)
	ld	de, (ix - 128)
	or	a, a
	sbc	hl, de
	push	hl
	pop	de
	or	a, a
	sbc	hl, bc
	jr	c, .LBB60_8
; %bb.7:                                ;   in Loop: Header=BB60_4 Depth=2
	push	bc
	pop	de
	.local	.LBB60_8
.LBB60_8:                               ;   in Loop: Header=BB60_4 Depth=2
	ld	bc, -134
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), de
	push	de
	ld	hl, (ix - 120)
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_Bytes
	ld	bc, 32
	ld	iy, (ix + 6)
	pop	hl
	pop	hl
	pop	hl
	ld	a, (iy + 7)
	bit	0, a
	jp	z, .LBB60_31
; %bb.9:                                ; %.preheader.preheader
                                        ;   in Loop: Header=BB60_4 Depth=2
	ld	de, 0
	push	ix
	lea	ix, ix - 128
	ld	iy, (ix - 6)
	.local	.LBB60_10
.LBB60_10:                              ; %.preheader
                                        ;   Parent Loop BB60_1 Depth=1
                                        ;     Parent Loop BB60_4 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	pop	ix
	lea	hl, iy + 0
	or	a, a
	sbc	hl, de
	jp	z, .LBB60_25
; %bb.11:                               ;   in Loop: Header=BB60_10 Depth=3
	ld	bc, -136
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), a                     ; 1-byte Folded Spill
	ld	hl, (ix - 120)
	add	hl, de
	ld	a, (hl)
	ld	bc, -131
	lea	hl, ix + 0
	add	hl, bc
	ld	iy, (hl)
	ld	hl, (iy + 3)
	ld	bc, (ix - 128)
	add	hl, bc
	ld	c, a
	add	hl, de
	ld	l, (hl)
	ld	a, l
	or	a, a
	jr	nz, .LBB60_13
; %bb.12:                               ;   in Loop: Header=BB60_10 Depth=3
	ld	a, c
	or	a, a
	jp	nz, .LBB60_26
	.local	.LBB60_13
.LBB60_13:                              ;   in Loop: Header=BB60_10 Depth=3
	ld	a, l
	or	a, a
	jr	z, .LBB60_17
; %bb.14:                               ;   in Loop: Header=BB60_10 Depth=3
	ld	a, c
	cp	a, 64
	jr	z, .LBB60_17
; %bb.15:                               ;   in Loop: Header=BB60_10 Depth=3
	ld	a, c
	cp	a, -1
	jr	z, .LBB60_17
; %bb.16:                               ;   in Loop: Header=BB60_10 Depth=3
	ld	a, c
	cp	a, -32
	jp	nz, .LBB60_26
	.local	.LBB60_17
.LBB60_17:                              ;   in Loop: Header=BB60_10 Depth=3
	ld	a, c
	cp	a, -32
	jr	nz, .LBB60_19
; %bb.18:                               ;   in Loop: Header=BB60_10 Depth=3
	ld	l, (ix - 109)
	ld	h, (ix - 108)
	inc.sis	hl
	ld	(ix - 109), l
	ld	(ix - 108), h
	ld	l, (ix - 107)
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 7
	ld	c, (iy + 0)
	ld	a, l
	or	a, c
	ld	l, a
	ld	(ix - 107), l
	ld	bc, 32
	push	ix
	lea	ix, ix - 128
	ld	iy, (ix - 6)
	pop	ix
	jr	.LBB60_24
	.local	.LBB60_19
.LBB60_19:                              ;   in Loop: Header=BB60_10 Depth=3
	ld	a, c
	cp	a, -1
	push	ix
	lea	ix, ix - 128
	ld	iy, (ix - 6)
	pop	ix
	jr	nz, .LBB60_21
; %bb.20:                               ;   in Loop: Header=BB60_10 Depth=3
	ld	l, (ix - 125)
	ld	h, (ix - 124)
	inc.sis	hl
	ld	(ix - 125), l
	ld	(ix - 124), h
	jr	.LBB60_23
	.local	.LBB60_21
.LBB60_21:                              ;   in Loop: Header=BB60_10 Depth=3
	ld	a, c
	cp	a, 64
	jr	nz, .LBB60_23
; %bb.22:                               ;   in Loop: Header=BB60_10 Depth=3
	ld	l, (ix - 111)
	ld	h, (ix - 110)
	inc.sis	hl
	ld	(ix - 111), l
	ld	(ix - 110), h
	ld	l, (ix - 107)
	push	ix
	lea	ix, ix - 128
	ld	c, (ix - 7)
	pop	ix
	ld	a, l
	or	a, c
	ld	l, a
	ld	(ix - 107), l
	.local	.LBB60_23
.LBB60_23:                              ;   in Loop: Header=BB60_10 Depth=3
	ld	bc, 32
	.local	.LBB60_24
.LBB60_24:                              ;   in Loop: Header=BB60_10 Depth=3
	inc	de
	push	ix
	lea	ix, ix - 128
	ld	a, (ix - 8)                     ; 1-byte Folded Reload
	jp	.LBB60_10
	.local	.LBB60_25
.LBB60_25:                              ;   in Loop: Header=BB60_4 Depth=2
	push	ix
	lea	ix, ix - 128
	ld	e, (ix - 7)                     ; 1-byte Folded Reload
	jr	.LBB60_27
	.local	.LBB60_26
.LBB60_26:                              ;   in Loop: Header=BB60_4 Depth=2
	ld	iy, (ix + 6)
	ld	(iy + 7), 0
	ld	d, 0
	ld	a, d
	ld	bc, 32
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 7
	ld	e, (iy + 0)                     ; 1-byte Folded Reload
	push	ix
	lea	ix, ix - 128
	ld	iy, (ix - 6)
	.local	.LBB60_27
.LBB60_27:                              ; %.loopexit
                                        ;   in Loop: Header=BB60_4 Depth=2
	pop	ix
	bit	0, (ix + 18)
	jr	z, .LBB60_30
; %bb.28:                               ;   in Loop: Header=BB60_4 Depth=2
	bit	0, a
	jr	z, .LBB60_30
; %bb.29:                               ;   in Loop: Header=BB60_4 Depth=2
	ld	de, -131
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	hl, (iy + 3)
	ld	de, (ix - 128)
	add	hl, de
	ld	bc, -134
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	push	de
	ld	de, (ix - 120)
	push	de
	push	hl
	call	_memcpy
	ld	de, -134
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	bc, -135
	lea	hl, ix + 0
	add	hl, bc
	ld	e, (hl)                         ; 1-byte Folded Reload
	ld	bc, 32
	pop	hl
	pop	hl
	pop	hl
	.local	.LBB60_30
.LBB60_30:                              ;   in Loop: Header=BB60_4 Depth=2
	ld	a, e
	ld	de, (ix - 128)
	add	iy, de
	lea	hl, iy + 0
	ld	de, (ix - 123)
	jp	.LBB60_4
	.local	.LBB60_31
.LBB60_31:                              ;   in Loop: Header=BB60_1 Depth=1
	ld	hl, (ix - 106)
	inc	hl
	ld	e, (ix - 125)
	ld	d, (ix - 124)
	ld	bc, 7
	jp	.LBB60_1
	.local	.LBB60_32
.LBB60_32:
	ld	l, (ix - 111)
	ld	h, (ix - 110)
	ld	(ix - 41), l
	ld	(ix - 40), h
	ld	l, (ix - 109)
	ld	h, (ix - 108)
	ld	(ix - 43), l
	ld	(ix - 42), h
	ld	(ix - 45), e
	ld	(ix - 44), d
	ld	hl, (ix + 6)
	push	hl
	call	_Checksum
	ld	bc, (ix + 6)
	pop	hl
	ld	iy, (ix + 9)
	ld	l, (iy + 30)
	ld	a, (ix - 107)                   ; 1-byte Folded Reload
	cp	a, l
	jr	nz, .LBB60_38
; %bb.33:
	or	a, a
	ld	l, -1
	ld	h, 0
	ld	e, l
	jr	nz, .LBB60_35
; %bb.34:
	ld	e, h
	.local	.LBB60_35
.LBB60_35:
	ld	a, (iy + 33)
	or	a, a
	jr	z, .LBB60_37
; %bb.36:
	ld	l, h
	.local	.LBB60_37
.LBB60_37:
	ld	a, e
	xor	a, l
	ld	l, a
	bit	0, l
	jr	nz, .LBB60_39
	.local	.LBB60_38
.LBB60_38:
	lea	hl, iy + 0
	push	bc
	pop	iy
	ld	(iy + 7), 0
	push	hl
	pop	iy
	.local	.LBB60_39
.LBB60_39:
	ld	l, (iy + 34)
	ld	a, l
	or	a, a
	jr	z, .LBB60_43
; %bb.40:
	ld	(ix - 106), l                   ; 1-byte Folded Spill
	lea	hl, iy + 0
	ld	iy, (ix - 114)
	lea	de, iy + 0
	ld	bc, 58
	ldir
	ld	(ix - 69), 0
	push	hl
	push	hl
	dec	sp
	ex	de, hl
	ld	hl, 0
	add	hl, sp
	ex	de, hl
	inc	de
	ld	bc, 6
	ld	hl, (ix - 117)
	ldir
	push	iy
	call	_EvaluateOutcome
	ld	bc, (ix + 6)
	pop	hl
	pop	hl
	pop	hl
	inc	sp
	ld	a, (ix - 69)
	ld	l, (ix - 106)
	cp	a, l
	jr	nz, .LBB60_42
; %bb.41:
	ld	iy, (ix + 12)
	ld	a, (iy + 5)
	or	a, a
	jr	z, .LBB60_43
	.local	.LBB60_42
.LBB60_42:
	push	bc
	pop	iy
	ld	(iy + 7), 0
	.local	.LBB60_43
.LBB60_43:
	push	bc
	pop	iy
	ld	a, (iy + 7)
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end60
.Lfunc_end60:
	.size	_ReadMap, .Lfunc_end60-_ReadMap
                                        ; -- End function
	.section	.text._DecodeSave,"ax",@progbits
	.globl	_DecodeSave                     ; -- Begin function DecodeSave
	.type	_DecodeSave,@function
_DecodeSave:                            ; @DecodeSave
; %bb.0:
	call	__frameset0
	ld	hl, (ix + 6)
	ld	de, (ix + 15)
	push	de
	push	hl
	call	_ValidateSave
	pop	hl
	pop	hl
	bit	0, a
	jr	z, .LBB61_2
; %bb.1:
	ld	iy, (ix + 9)
	ld	de, (ix + 12)
	ld	bc, (ix + 18)
	ld	hl, 1
	push	hl
	push	bc
	ld	hl, (ix + 15)
	push	hl
	push	de
	push	iy
	ld	hl, (ix + 6)
	push	hl
	call	_ReadSave
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	jr	.LBB61_3
	.local	.LBB61_2
.LBB61_2:
	xor	a, a
	.local	.LBB61_3
.LBB61_3:
	pop	ix
	ret
	.local	.Lfunc_end61
.Lfunc_end61:
	.size	_DecodeSave, .Lfunc_end61-_DecodeSave
                                        ; -- End function
	.section	.text._SaveSizeV3,"ax",@progbits
	.globl	_SaveSizeV3                     ; -- Begin function SaveSizeV3
	.type	_SaveSizeV3,@function
_SaveSizeV3:                            ; @SaveSizeV3
; %bb.0:
	call	__frameset0
	ld	hl, (ix + 6)
	push	hl
	call	_SaveSize
	pop	bc
	ld	bc, 50
	xor	a, a
	call	__ladd
	pop	ix
	ret
	.local	.Lfunc_end62
.Lfunc_end62:
	.size	_SaveSizeV3, .Lfunc_end62-_SaveSizeV3
                                        ; -- End function
	.section	.text._EncodeSaveV3,"ax",@progbits
	.globl	_EncodeSaveV3                   ; -- Begin function EncodeSaveV3
	.type	_EncodeSaveV3,@function
_EncodeSaveV3:                          ; @EncodeSaveV3
; %bb.0:
	ld	hl, -154
	call	__frameset
	ld	de, -137
	lea	iy, ix + 0
	add	iy, de
	ld	bc, 1875397
	xor	a, a
	lea	de, ix - 16
	push	ix
	lea	ix, ix - 128
	ld	(ix - 12), de
	pop	ix
	lea	de, ix - 75
	lea	hl, ix - 84
	push	ix
	lea	ix, ix - 128
	ld	(ix - 21), hl
	pop	ix
	push	de
	ld	de, -134
	lea	hl, ix + 0
	add	hl, de
	pop	de
	push	ix
	lea	ix, ix - 128
	ld	(ix - 18), hl
	pop	ix
	lea	hl, iy + 0
	push	ix
	lea	ix, ix - 128
	ld	(ix - 24), hl
	pop	ix
	ld	hl, (ix + 6)
	ld	(ix - 16), hl
	ld	(ix - 13), bc
	ld	(ix - 10), -127
	ld	(ix - 9), 1
	ld	(ix - 8), 1
	ld	bc, -143
	lea	hl, ix + 0
	add	hl, bc
	ld	(hl), de
	ld	hl, (ix + 9)
	ld	bc, 58
	ldir
	ld	bc, -149
	lea	hl, ix + 0
	add	hl, bc
	ld	de, (hl)
	ld	hl, (ix + 12)
	ld	bc, 9
	ldir
	ld	bc, -146
	lea	hl, ix + 0
	add	hl, bc
	ld	de, (hl)
	ld	hl, (ix + 21)
	ld	bc, 50
	ldir
	ld	de, 0
	ld	(iy + 0), a
	ld	(iy + 1), a
	ld	bc, -135
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), a
	ld	iy, (ix + 18)
	lea	iy, iy + 5
	ld	bc, 22
	.local	.LBB63_1
.LBB63_1:                               ; =>This Inner Loop Header: Depth=1
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	jr	z, .LBB63_5
; %bb.2:                                ;   in Loop: Header=BB63_1 Depth=1
	lea	hl, iy + 0
	bit	0, (hl)
	jr	z, .LBB63_4
; %bb.3:                                ;   in Loop: Header=BB63_1 Depth=1
	ld	bc, -153
	lea	hl, ix + 0
	add	hl, bc
	ld	(hl), a                         ; 1-byte Folded Spill
	ld	l, 7
	push	ix
	lea	ix, ix - 128
	ld	a, (ix - 25)
	pop	ix
	and	a, l
	ld	b, a
	ld	a, 1
	call	__bshl
	ld	bc, -154
	lea	hl, ix + 0
	add	hl, bc
	ld	(hl), a                         ; 1-byte Folded Spill
	push	de
	pop	hl
	ld	c, 3
	call	__ishru
	push	de
	pop	bc
	ex	de, hl
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 24)
	pop	ix
	add	hl, de
	ld	a, (hl)
	push	ix
	lea	ix, ix - 128
	ld	e, (ix - 26)
	pop	ix
	or	a, e
	ld	e, a
	push	ix
	lea	ix, ix - 128
	ld	a, (ix - 25)                    ; 1-byte Folded Reload
	pop	ix
	ld	(hl), e
	push	bc
	pop	de
	ld	bc, 22
	.local	.LBB63_4
.LBB63_4:                               ;   in Loop: Header=BB63_1 Depth=1
	inc	de
	lea	iy, iy + 6
	inc	a
	jr	.LBB63_1
	.local	.LBB63_5
.LBB63_5:
	ld	hl, (ix + 15)
	push	hl
	call	_SaveSizeV3
                                        ; kill: def $e killed $e def $ude
	pop	bc
	push	de
	push	hl
	ld	hl, 3
	push	hl
	ld	de, -140
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_Header
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	de, -152
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -149
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -143
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -140
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_State
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	de, -143
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -146
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -140
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_EventState
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (ix + 15)
	push	hl
	ld	de, -140
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_WriteMap
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end63
.Lfunc_end63:
	.size	_EncodeSaveV3, .Lfunc_end63-_EncodeSaveV3
                                        ; -- End function
	.section	.text._EventState,"ax",@progbits
	.type	_EventState,@function           ; -- Begin function EventState
_EventState:                            ; @EventState
; %bb.0:
	ld	hl, -6
	call	__frameset
	ld	hl, (ix + 6)
	ld	de, (ix + 9)
	push	de
	push	hl
	call	_U32
	pop	hl
	pop	hl
	ld	iy, (ix + 9)
	pea	iy + 4
	ld	hl, (ix + 6)
	push	hl
	call	_U32
	pop	hl
	pop	hl
	ld	iy, (ix + 9)
	pea	iy + 8
	ld	hl, (ix + 6)
	push	hl
	call	_U32
	pop	hl
	pop	hl
	ld	hl, 25
	push	hl
	ld	iy, (ix + 9)
	pea	iy + 12
	ld	hl, (ix + 6)
	push	hl
	call	_Bytes
	pop	hl
	pop	hl
	pop	hl
	ld	iy, (ix + 9)
	pea	iy + 37
	ld	hl, (ix + 6)
	push	hl
	call	_U8
	ld	de, -12
	pop	hl
	pop	hl
	.local	.LBB64_1
.LBB64_1:                               ; =>This Inner Loop Header: Depth=1
	sbc	hl, hl
	adc	hl, de
	jr	z, .LBB64_3
; %bb.2:                                ;   in Loop: Header=BB64_1 Depth=1
	ld	hl, (ix + 9)
	push	hl
	pop	iy
	add	iy, de
	ld	(ix - 3), iy
	pea	iy + 50
	ld	hl, (ix + 6)
	push	hl
	ld	(ix - 6), de
	call	_U8
	pop	hl
	pop	hl
	ld	iy, (ix - 3)
	pea	iy + 51
	ld	hl, (ix + 6)
	push	hl
	call	_U8
	pop	hl
	pop	hl
	ld	iy, (ix - 3)
	pea	iy + 52
	ld	hl, (ix + 6)
	push	hl
	call	_U8
	pop	hl
	pop	hl
	ld	hl, (ix - 6)
	ld	de, 3
	add	hl, de
	ex	de, hl
	jr	.LBB64_1
	.local	.LBB64_3
.LBB64_3:
	ld	iy, (ix + 6)
	bit	0, (iy + 7)
	jr	z, .LBB64_6
; %bb.4:
	ld	hl, (ix + 12)
	push	hl
	ld	hl, (ix + 9)
	push	hl
	call	_EventsValidate
	pop	hl
	pop	hl
	bit	0, a
	jr	nz, .LBB64_6
; %bb.5:
	ld	iy, (ix + 6)
	ld	(iy + 7), 0
	.local	.LBB64_6
.LBB64_6:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end64
.Lfunc_end64:
	.size	_EventState, .Lfunc_end64-_EventState
                                        ; -- End function
	.section	.text._ValidateSaveV3,"ax",@progbits
	.globl	_ValidateSaveV3                 ; -- Begin function ValidateSaveV3
	.type	_ValidateSaveV3,@function
_ValidateSaveV3:                        ; @ValidateSaveV3
; %bb.0:
	call	__frameset0
	ld	hl, (ix + 6)
	ld	de, (ix + 9)
	ld	bc, 0
	push	bc
	push	bc
	push	bc
	push	de
	push	bc
	push	bc
	push	hl
	call	_ReadSaveV3
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end65
.Lfunc_end65:
	.size	_ValidateSaveV3, .Lfunc_end65-_ValidateSaveV3
                                        ; -- End function
	.section	.text._ReadSaveV3,"ax",@progbits
	.type	_ReadSaveV3,@function           ; -- Begin function ReadSaveV3
_ReadSaveV3:                            ; @ReadSaveV3
; %bb.0:
	ld	hl, -153
	call	__frameset
	ld	de, -137
	lea	hl, ix + 0
	add	hl, de
	ld	de, -143
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	ld	de, (ix + 6)
	lea	hl, ix - 75
	lea	iy, ix - 84
	push	ix
	lea	ix, ix - 128
	lea	bc, ix - 6
	pop	ix
	push	ix
	lea	ix, ix - 128
	ld	(ix - 12), bc
	pop	ix
	ld	(ix - 16), de
	ld	de, 1875397
	ld	(ix - 13), de
	ld	(ix - 10), -127
	ld	(ix - 9), 1
	ld	(ix - 8), 0
	ld	(ix - 75), 0
	push	hl
	pop	de
	inc	de
	ld	bc, 57
	push	ix
	lea	ix, ix - 128
	ld	(ix - 22), hl
	pop	ix
	ldir
	ld	(ix - 84), 0
	lea	de, iy + 0
	inc	de
	ld	bc, -153
	lea	hl, ix + 0
	add	hl, bc
	ld	(hl), iy
	lea	hl, iy + 0
	ld	bc, 8
	ldir
	ld	de, -134
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), 0
	ld	de, -140
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	pop	de
	inc	de
	ld	bc, 49
	ldir
	ld	de, -143
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	(iy + 0), 0
	ld	(iy + 1), 0
	ld	de, -135
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), 0
	ld	iy, (ix + 6)
	ld	hl, (iy + 12)
	push	ix
	lea	ix, ix - 128
	ld	(ix - 18), hl
	pop	ix
	ld	a, (iy + 15)
	ld	de, -147
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), a
	ld	hl, (ix + 15)
	push	hl
	call	_SaveSizeV3
	push	hl
	pop	bc
	ld	a, e
	pop	hl
	ld	de, -146
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 19
	ld	e, (iy + 0)                     ; 1-byte Folded Reload
	call	__lcmpu
	jp	nz, .LBB66_9
; %bb.1:
	ld	bc, 0
	ld	hl, (ix + 6)
	push	hl
	pop	iy
	ld	hl, (iy + 9)
	ld	de, (iy)
	push	bc
	push	bc
	push	de
	call	__indcallhl
	pop	hl
	pop	hl
	pop	hl
	bit	0, a
	ld	a, 0
	jp	z, .LBB66_10
; %bb.2:
	lea	hl, ix - 16
	ld	de, -146
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	ld	de, -143
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	lea	hl, iy + 0
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	ld	hl, (ix + 15)
	push	hl
	call	_SaveSizeV3
                                        ; kill: def $e killed $e def $ude
	pop	bc
	push	de
	push	hl
	ld	hl, 3
	push	hl
	ld	de, -146
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_Header
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	de, -143
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -153
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -150
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -146
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_State
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	de, -150
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -140
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -146
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_EventState
	pop	hl
	pop	hl
	pop	hl
	ld	l, (ix + 24)
	push	hl
	ld	hl, (ix + 15)
	push	hl
	ld	de, -153
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -150
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -146
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_ReadMap
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	bit	0, a
	jp	z, .LBB66_10
; %bb.3:
	bit	0, (ix + 24)
	jp	z, .LBB66_10
; %bb.4:
	ld	de, (ix + 9)
	ld	bc, 58
	ld	iy, 9
	ld	a, 1
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 22)
	pop	ix
	ldir
	ld	de, (ix + 12)
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 25)
	pop	ix
	lea	bc, iy + 0
	ldir
	ld	de, (ix + 21)
	ld	bc, -140
	lea	iy, ix + 0
	add	iy, bc
	ld	hl, (iy + 0)
	ld	bc, 50
	ldir
	ld	iy, (ix + 18)
	lea	iy, iy + 5
	ld	bc, 22
	ld	de, 0
	.local	.LBB66_5
.LBB66_5:                               ; =>This Inner Loop Header: Depth=1
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	jp	z, .LBB66_11
; %bb.6:                                ;   in Loop: Header=BB66_5 Depth=1
	push	de
	pop	hl
	ld	c, 3
	call	__ishru
	push	hl
	pop	bc
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 15)
	pop	ix
	add	hl, bc
	ld	a, (hl)
	ld	bc, -140
	lea	hl, ix + 0
	add	hl, bc
	ld	(hl), de
	ex	de, hl
	ld	bc, 7
	call	__iand
	push	hl
	pop	bc
	ld	hl, 1
                                        ; kill: def $c killed $c killed $ubc
	call	__ishl
	ld	e, a
	ld	a, l
	and	a, e
	ld	l, a
	or	a, a
	ld	a, 1
	jr	nz, .LBB66_8
; %bb.7:                                ;   in Loop: Header=BB66_5 Depth=1
	ld	a, 0
	.local	.LBB66_8
.LBB66_8:                               ;   in Loop: Header=BB66_5 Depth=1
	ld	(iy), a
	ld	bc, -140
	lea	hl, ix + 0
	add	hl, bc
	ld	de, (hl)
	inc	de
	lea	iy, iy + 6
	ld	a, 1
	ld	bc, 22
	jp	.LBB66_5
	.local	.LBB66_9
.LBB66_9:
	xor	a, a
	.local	.LBB66_10
.LBB66_10:                              ; %.loopexit
	ld	sp, ix
	pop	ix
	ret
	.local	.LBB66_11
.LBB66_11:
	ld	bc, 112
	ld	de, 0
	.local	.LBB66_12
.LBB66_12:                              ; %.preheader
                                        ; =>This Inner Loop Header: Depth=1
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	jr	z, .LBB66_10
; %bb.13:                               ;   in Loop: Header=BB66_12 Depth=1
	ld	hl, (ix + 15)
	add	hl, de
	push	hl
	ld	bc, -140
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), de
	call	_RecountRegion
	ld	bc, 112
	ld	a, 1
	pop	hl
	ld	de, -140
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	ld	de, 16
	add	hl, de
	ex	de, hl
	jr	.LBB66_12
	.local	.Lfunc_end66
.Lfunc_end66:
	.size	_ReadSaveV3, .Lfunc_end66-_ReadSaveV3
                                        ; -- End function
	.section	.text._DecodeSaveV3,"ax",@progbits
	.globl	_DecodeSaveV3                   ; -- Begin function DecodeSaveV3
	.type	_DecodeSaveV3,@function
_DecodeSaveV3:                          ; @DecodeSaveV3
; %bb.0:
	call	__frameset0
	ld	hl, (ix + 6)
	ld	de, (ix + 15)
	push	de
	push	hl
	call	_ValidateSaveV3
	pop	hl
	pop	hl
	bit	0, a
	jr	z, .LBB67_2
; %bb.1:
	ld	de, (ix + 12)
	ld	bc, (ix + 18)
	ld	hl, (ix + 21)
	ld	iy, 1
	push	iy
	push	hl
	push	bc
	ld	hl, (ix + 15)
	push	hl
	push	de
	ld	hl, (ix + 9)
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_ReadSaveV3
	ld	hl, 21
	add	hl, sp
	ld	sp, hl
	jr	.LBB67_3
	.local	.LBB67_2
.LBB67_2:
	xor	a, a
	.local	.LBB67_3
.LBB67_3:
	pop	ix
	ret
	.local	.Lfunc_end67
.Lfunc_end67:
	.size	_DecodeSaveV3, .Lfunc_end67-_DecodeSaveV3
                                        ; -- End function
	.section	.text._optix_HandleGUI,"ax",@progbits
	.globl	_optix_HandleGUI                ; -- Begin function optix_HandleGUI
	.type	_optix_HandleGUI,@function
_optix_HandleGUI:                       ; @optix_HandleGUI
; %bb.0:
	call	_kb_Scan
	call	_os_GetCSC
	ld	(_optix_guidata+3), a
	call	_kb_AnyKey
	or	a, a
	jr	nz, .LBB68_2
; %bb.1:
	ld	a, 1
	ld	(_optix_guidata+2), a
	.local	.LBB68_2
.LBB68_2:
	ld	a, (_optix_guicolors)
	ld	l, a
	push	hl
	call	_gfx_FillScreen
	pop	hl
	call	_optix_RenderButtons
	call	_optix_HandleCursor
	jp	_optix_CheckForAltKey
	.local	.Lfunc_end68
.Lfunc_end68:
	.size	_optix_HandleGUI, .Lfunc_end68-_optix_HandleGUI
                                        ; -- End function
	.section	.text._optix_RenderButtons,"ax",@progbits
	.globl	_optix_RenderButtons            ; -- Begin function optix_RenderButtons
	.type	_optix_RenderButtons,@function
_optix_RenderButtons:                   ; @optix_RenderButtons
; %bb.0:
	ld	hl, -18
	call	__frameset
	or	a, a
	sbc	hl, hl
	push	hl
	call	_optix_CusText
	ld	de, 0
	pop	hl
	or	a, a
	sbc	hl, hl
	ld	(ix - 6), hl
	ld	iy, 0
	.local	.LBB69_1
.LBB69_1:                               ; =>This Inner Loop Header: Depth=1
	ld	a, (_optix_buttoninfo)
	ld	e, a
	lea	hl, iy + 0
	or	a, a
	sbc	hl, de
	jp	nc, .LBB69_8
; %bb.2:                                ;   in Loop: Header=BB69_1 Depth=1
	ld	hl, (_optix_button)
	ld	(ix - 3), hl
	ld	a, (_optix_guicolors+1)
	ld	l, a
	push	hl
	ld	(ix - 9), iy
	call	_gfx_SetColor
	pop	hl
	ld	a, (_optix_buttoninfo+1)
	ld	de, 0
	ld	e, a
	ld	hl, (ix - 9)
	or	a, a
	sbc	hl, de
	jp	nz, .LBB69_7
; %bb.3:                                ;   in Loop: Header=BB69_1 Depth=1
	ld	iy, (ix - 3)
	ld	de, (ix - 6)
	add	iy, de
	ld	hl, (iy + 22)
	ld	de, (iy)
	ld	bc, 0
	ld	c, e
	ld	b, d
	ld	(ix - 12), bc
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB69_5
; %bb.4:                                ;   in Loop: Header=BB69_1 Depth=1
	ld	a, (iy + 2)
	ld	bc, 0
	push	bc
	pop	hl
	ld	l, a
	ld	de, (iy + 4)
	ld	c, e
	ld	b, d
	ld	a, (iy + 6)
	ld	de, 0
	ld	e, a
	push	de
	push	bc
	push	hl
	ld	hl, (ix - 12)
	push	hl
	call	_gfx_FillRectangle
	pop	hl
	jr	.LBB69_6
	.local	.LBB69_5
.LBB69_5:                               ;   in Loop: Header=BB69_1 Depth=1
	ld	de, -2
	ld	hl, (ix - 12)
	add	hl, de
	ld	(ix - 12), hl
	ld	a, (iy + 2)
	ld	bc, 0
	push	bc
	pop	hl
	ld	l, a
	add	hl, de
	ld	(ix - 15), hl
	ld	de, (iy + 4)
	push	bc
	pop	hl
	ld	l, e
	ld	h, d
	ld	de, 4
	add	hl, de
	ld	a, (iy + 6)
	ld	(ix - 18), iy
	push	bc
	pop	iy
	ld	iyl, a
	add	iy, de
	push	iy
	push	hl
	ld	hl, (ix - 15)
	push	hl
	ld	hl, (ix - 12)
	push	hl
	call	_gfx_FillRectangle
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	iy, (ix - 18)
	ld	hl, (iy + 22)
	ld	de, (iy)
	ld	bc, 0
	ld	c, e
	ld	b, d
	ld	a, (iy + 2)
	ld	de, 0
	ld	e, a
	push	de
	push	bc
	push	hl
	call	_gfx_TransparentSprite
	.local	.LBB69_6
.LBB69_6:                               ;   in Loop: Header=BB69_1 Depth=1
	pop	hl
	pop	hl
	pop	hl
	.local	.LBB69_7
.LBB69_7:                               ;   in Loop: Header=BB69_1 Depth=1
	ld	iy, (ix - 3)
	ld	de, (ix - 6)
	add	iy, de
	ld	(ix - 3), iy
	lea	hl, iy + 7
	ld	(ix - 12), hl
	ld	hl, (iy)
	ld	de, 0
	ld	e, l
	ld	d, h
	ld	hl, (iy + 4)
	ld	a, h
                                        ; kill: def $l killed $l killed $uhl
	srl	a
	rr	l
	ex	de, hl
	ld	iyl, e
	ex	de, hl
	ld	iyh, a
	ld	bc, 0
	push	bc
	pop	hl
	ex	de, hl
	ld	e, iyl
	ld	d, iyh
	ex	de, hl
	add	hl, de
	ld	(ix - 15), hl
	ld	hl, (ix - 12)
	push	hl
	call	_gfx_GetStringWidth
	pop	de
	call	__ishru_1
	ex	de, hl
	ld	hl, (ix - 15)
	or	a, a
	sbc	hl, de
	push	hl
	pop	bc
	ld	iy, (ix - 3)
	ld	a, (iy + 2)
	ld	de, 0
	push	de
	pop	hl
	ld	l, a
	ld	iy, (ix - 3)
	ld	e, (iy + 6)
	srl	e
	add	hl, de
	ld	de, -4
	add	hl, de
	push	hl
	push	bc
	ld	hl, (ix - 12)
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	iy, (ix - 9)
	inc	iy
	ld	hl, (ix - 6)
	ld	de, 30
	add	hl, de
	ld	(ix - 6), hl
	or	a, a
	sbc	hl, hl
	ex	de, hl
	jp	.LBB69_1
	.local	.LBB69_8
.LBB69_8:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end69
.Lfunc_end69:
	.size	_optix_RenderButtons, .Lfunc_end69-_optix_RenderButtons
                                        ; -- End function
	.section	.text._optix_HandleCursor,"ax",@progbits
	.globl	_optix_HandleCursor             ; -- Begin function optix_HandleCursor
	.type	_optix_HandleCursor,@function
_optix_HandleCursor:                    ; @optix_HandleCursor
; %bb.0:
	call	_optix_HandleTrackPad
	ld	a, (_optix_cursor+3)
	bit	0, a
	jr	z, .LBB70_2
; %bb.1:
	call	_optix_UpdateCursor
	call	_optix_ClickCursor
	call	_optix_RenderCursor
	ret
	.local	.LBB70_2
.LBB70_2:
	call	_optix_UpdateSelectedButton
	call	_optix_ClickButton
	ret
	.local	.Lfunc_end70
.Lfunc_end70:
	.size	_optix_HandleCursor, .Lfunc_end70-_optix_HandleCursor
                                        ; -- End function
	.section	.text._optix_CheckForAltKey,"ax",@progbits
	.globl	_optix_CheckForAltKey           ; -- Begin function optix_CheckForAltKey
	.type	_optix_CheckForAltKey,@function
_optix_CheckForAltKey:                  ; @optix_CheckForAltKey
; %bb.0:
	ld	hl, -6
	call	__frameset
	ld	bc, 0
	ld	a, (_optix_buttoninfo)
	ld	(ix - 3), bc
	push	bc
	pop	de
	.local	.LBB71_1
.LBB71_1:                               ; =>This Inner Loop Header: Depth=1
	ld	c, a
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	jr	nc, .LBB71_7
; %bb.2:                                ;   in Loop: Header=BB71_1 Depth=1
	ld	h, a
	ld	iy, (_optix_button)
	ld	bc, (ix - 3)
	add	iy, bc
	ld	l, (iy + 28)
	ld	a, (_optix_guidata+3)
	ld	c, a
	ld	a, l
	or	a, a
	jr	nz, .LBB71_4
; %bb.3:                                ;   in Loop: Header=BB71_1 Depth=1
	ld	a, h
	jr	.LBB71_6
	.local	.LBB71_4
.LBB71_4:                               ;   in Loop: Header=BB71_1 Depth=1
	ld	a, l
	cp	a, c
	ld	a, h
	jr	nz, .LBB71_6
; %bb.5:                                ;   in Loop: Header=BB71_1 Depth=1
	ld	hl, (iy + 25)
	ld	(ix - 6), de
	call	__indcallhl
	ld	de, (ix - 6)
	ld	a, (_optix_buttoninfo)
	.local	.LBB71_6
.LBB71_6:                               ;   in Loop: Header=BB71_1 Depth=1
	inc	de
	ld	hl, (ix - 3)
	ld	bc, 30
	add	hl, bc
	ld	(ix - 3), hl
	ld	bc, 0
	jr	.LBB71_1
	.local	.LBB71_7
.LBB71_7:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end71
.Lfunc_end71:
	.size	_optix_CheckForAltKey, .Lfunc_end71-_optix_CheckForAltKey
                                        ; -- End function
	.section	.text._optix_HandleTrackPad,"ax",@progbits
	.globl	_optix_HandleTrackPad           ; -- Begin function optix_HandleTrackPad
	.type	_optix_HandleTrackPad,@function
_optix_HandleTrackPad:                  ; @optix_HandleTrackPad
; %bb.0:
	ld	hl, -11
	call	__frameset
	ld	hl, -720876
	ld.sis	bc, 255
	ld	iyh, -68
	ld	iyl, b
	ld	a, -102
	ld	(ix - 6), a
	ld	a, 120
	ld	(ix - 5), a
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	hl
	ld	a, e
	or	a, a
	jr	nz, .LBB72_2
; %bb.1:
	ld.sis	de, 0
	push	af
	ld	a, iyl
	ld	(ix - 3), a                     ; 1-byte Folded Spill
	pop	af
	ld	a, 51
	ld	(ix - 8), a
	ld	a, 85
	ld	(ix - 11), a
	jr	.LBB72_15
	.local	.LBB72_2
.LBB72_2:
	push	de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, e
	ld	h, d
	pop	de
	call	__sand
	ld	a, l
	cp	a, 2
	jr	z, .LBB72_4
; %bb.3:
	ld	iyh, 0
	.local	.LBB72_4
.LBB72_4:
	ld	a, l
	cp	a, 4
	ld	c, -102
	ld	a, 51
	ld	(ix - 8), a
	jr	z, .LBB72_6
; %bb.5:
	ld	c, iyh
	.local	.LBB72_6
.LBB72_6:
	ld	a, l
	cp	a, 8
	ld	e, 120
	ld	a, 85
	ld	(ix - 11), a
	jr	z, .LBB72_8
; %bb.7:
	ld	e, c
	.local	.LBB72_8
.LBB72_8:
	ld	a, l
	cp	a, 16
	ld	c, 85
	jr	z, .LBB72_10
; %bb.9:
	ld	c, e
	.local	.LBB72_10
.LBB72_10:
	ld	a, l
	cp	a, 32
	ld	e, 51
	jr	z, .LBB72_12
; %bb.11:
	ld	e, c
	.local	.LBB72_12
.LBB72_12:
	ld	a, l
	cp	a, 64
	ld	l, 17
	ld	a, l
	jr	z, .LBB72_14
; %bb.13:
	ld	a, e
	.local	.LBB72_14
.LBB72_14:
	ld	(ix - 3), a
	ld.sis	de, 32
	ld.sis	bc, 255
	.local	.LBB72_15
.LBB72_15:
	ld	iy, -720874
	ld	l, (iy)
	ld	h, (iy + 1)
	ld	a, l
	or	a, a
	jr	z, .LBB72_31
; %bb.16:
	ld	l, (iy)
	ld	h, (iy + 1)
	call	__sand
	ld	a, l
	cp	a, 1
	ld	c, -34
	jr	z, .LBB72_18
; %bb.17:
	ld	c, (ix - 3)                     ; 1-byte Folded Reload
	.local	.LBB72_18
.LBB72_18:
	ld	a, l
	cp	a, 2
	ld	d, -68
	jr	z, .LBB72_20
; %bb.19:
	ld	d, c
	.local	.LBB72_20
.LBB72_20:
	ld	a, l
	cp	a, 4
	ld	c, -102
	jr	z, .LBB72_22
; %bb.21:
	ld	c, d
	.local	.LBB72_22
.LBB72_22:
	ld	a, l
	cp	a, 8
	ld	d, 120
	jr	z, .LBB72_24
; %bb.23:
	ld	d, c
	.local	.LBB72_24
.LBB72_24:
	ld	a, l
	cp	a, 16
	ld	c, 85
	jr	z, .LBB72_26
; %bb.25:
	ld	c, d
	.local	.LBB72_26
.LBB72_26:
	ld	a, l
	cp	a, 32
	ld	b, 51
	jr	z, .LBB72_28
; %bb.27:
	ld	b, c
	.local	.LBB72_28
.LBB72_28:
	ld	a, l
	cp	a, 64
	ld	l, 17
	ld	a, l
	jr	z, .LBB72_30
; %bb.29:
	ld	a, b
	.local	.LBB72_30
.LBB72_30:
	ld	(ix - 3), a
	ld.sis	de, 96
	ld.sis	bc, 255
	.local	.LBB72_31
.LBB72_31:
	ld	iy, -720872
	ld	l, (iy)
	ld	h, (iy + 1)
	ld	a, l
	or	a, a
	jr	z, .LBB72_47
; %bb.32:
	ld	l, (iy)
	ld	h, (iy + 1)
	call	__sand
	ld	a, l
	cp	a, 1
	ld	c, -34
	jr	z, .LBB72_34
; %bb.33:
	ld	c, (ix - 3)                     ; 1-byte Folded Reload
	.local	.LBB72_34
.LBB72_34:
	ld	a, l
	cp	a, 2
	ld	d, -68
	jr	z, .LBB72_36
; %bb.35:
	ld	d, c
	.local	.LBB72_36
.LBB72_36:
	ld	a, l
	cp	a, 4
	ld	c, -102
	jr	z, .LBB72_38
; %bb.37:
	ld	c, d
	.local	.LBB72_38
.LBB72_38:
	ld	a, l
	cp	a, 8
	ld	d, 120
	jr	z, .LBB72_40
; %bb.39:
	ld	d, c
	.local	.LBB72_40
.LBB72_40:
	ld	a, l
	cp	a, 16
	ld	c, 85
	jr	z, .LBB72_42
; %bb.41:
	ld	c, d
	.local	.LBB72_42
.LBB72_42:
	ld	a, l
	cp	a, 32
	ld	b, 51
	jr	z, .LBB72_44
; %bb.43:
	ld	b, c
	.local	.LBB72_44
.LBB72_44:
	ld	a, l
	cp	a, 64
	ld	l, 17
	ld	a, l
	jr	z, .LBB72_46
; %bb.45:
	ld	a, b
	.local	.LBB72_46
.LBB72_46:
	ld	(ix - 3), a
	ld.sis	de, 160
	ld.sis	bc, 255
	.local	.LBB72_47
.LBB72_47:
	ld	iy, -720870
	ld	l, (iy)
	ld	h, (iy + 1)
	ld	a, l
	or	a, a
	jr	nz, .LBB72_49
; %bb.48:
	ld	iy, -720868
	jr	.LBB72_64
	.local	.LBB72_49
.LBB72_49:
	ld	l, (iy)
	ld	h, (iy + 1)
	call	__sand
	ld	a, l
	cp	a, 1
	ld	c, -34
	jr	z, .LBB72_51
; %bb.50:
	ld	c, (ix - 3)                     ; 1-byte Folded Reload
	.local	.LBB72_51
.LBB72_51:
	ld	a, l
	cp	a, 2
	ld	d, -68
	jr	z, .LBB72_53
; %bb.52:
	ld	d, c
	.local	.LBB72_53
.LBB72_53:
	ld	a, l
	cp	a, 4
	ld	c, -102
	ld	iy, -720868
	jr	z, .LBB72_55
; %bb.54:
	ld	c, d
	.local	.LBB72_55
.LBB72_55:
	ld	a, l
	cp	a, 8
	ld	d, 120
	jr	z, .LBB72_57
; %bb.56:
	ld	d, c
	.local	.LBB72_57
.LBB72_57:
	ld	a, l
	cp	a, 16
	ld	c, 85
	jr	z, .LBB72_59
; %bb.58:
	ld	c, d
	.local	.LBB72_59
.LBB72_59:
	ld	a, l
	cp	a, 32
	ld	b, 51
	jr	z, .LBB72_61
; %bb.60:
	ld	b, c
	.local	.LBB72_61
.LBB72_61:
	ld	a, l
	cp	a, 64
	ld	l, 17
	ld	(ix - 3), l                     ; 1-byte Folded Spill
	jr	z, .LBB72_63
; %bb.62:
	ld	(ix - 3), b                     ; 1-byte Folded Spill
	.local	.LBB72_63
.LBB72_63:
	ld.sis	de, 224
	ld.sis	bc, 255
	.local	.LBB72_64
.LBB72_64:
	ld	l, (iy)
	ld	h, (iy + 1)
	ld	a, l
	or	a, a
	jr	nz, .LBB72_66
; %bb.65:
	ld	c, (ix - 3)                     ; 1-byte Folded Reload
	ex.sis	de, hl
	jr	.LBB72_81
	.local	.LBB72_66
.LBB72_66:
	ld	l, (iy)
	ld	h, (iy + 1)
	call	__sand
	ld	a, l
	cp	a, 1
	ld	e, -34
	jr	z, .LBB72_68
; %bb.67:
	ld	e, (ix - 3)                     ; 1-byte Folded Reload
	.local	.LBB72_68
.LBB72_68:
	ld	a, l
	cp	a, 2
	ld	c, -68
	jr	z, .LBB72_70
; %bb.69:
	ld	c, e
	.local	.LBB72_70
.LBB72_70:
	ld	a, l
	cp	a, 4
	jr	z, .LBB72_72
; %bb.71:
	ld	(ix - 6), c                     ; 1-byte Folded Spill
	.local	.LBB72_72
.LBB72_72:
	ld	a, l
	cp	a, 8
	jr	z, .LBB72_74
; %bb.73:
	ld	a, (ix - 6)
	ld	(ix - 5), a                     ; 1-byte Folded Spill
	.local	.LBB72_74
.LBB72_74:
	ld	a, l
	cp	a, 16
	ld	c, 17
	jr	z, .LBB72_76
; %bb.75:
	ld	a, (ix - 5)                     ; 1-byte Folded Reload
	ld	(ix - 11), a
	.local	.LBB72_76
.LBB72_76:
	ld	a, l
	cp	a, 32
	jr	z, .LBB72_78
; %bb.77:
	ld	a, (ix - 11)
	ld	(ix - 8), a                     ; 1-byte Folded Spill
	.local	.LBB72_78
.LBB72_78:
	ld	a, l
	cp	a, 64
	jr	z, .LBB72_80
; %bb.79:
	ld	c, (ix - 8)                     ; 1-byte Folded Reload
	.local	.LBB72_80
.LBB72_80:
	ld.sis	hl, 288
	.local	.LBB72_81
.LBB72_81:
	ld	b, 0
	ld	a, (_optix_guidata+13)
	ld	e, a
	ex	de, hl
	ld	iyl, e
	ld	iyh, d
	ex	de, hl
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	jr	z, .LBB72_85
; %bb.82:
	ld	a, c
	or	a, a
	jr	z, .LBB72_85
; %bb.83:
	ld	(ix - 5), c
	ld	(ix - 4), b
	or	a, a
	sbc	hl, hl
	push	hl
	pop	bc
	ld	c, iyl
	ld	b, iyh
	ld	a, e
	cp	a, 3
	jr	c, .LBB72_86
; %bb.84:
	ld	e, iyl
	ld	d, iyh
	ld	iy, _optix_cursor
	ld	iy, (iy)
	ld	hl, _optix_guidata+10
	push	de
	ld	e, iyl
	ld	d, iyh
	ld	(hl), e
	inc	hl
	ld	(hl), d
	pop	de
	ld	a, (_optix_cursor+2)
	ld	(ix - 6), a                     ; 1-byte Folded Spill
	ld	(_optix_guidata+12), a
	ld	hl, _optix_guidata+6
	ld	(hl), e
	inc	hl
	ld	(hl), d
	ld	e, (ix - 5)
	ld	d, (ix - 4)
	ld	a, e
	ld	(_optix_guidata+8), a
	ld	(ix - 8), e
	ld	(ix - 7), d
	ld	(ix - 3), bc
	jr	.LBB72_87
	.local	.LBB72_85
.LBB72_85:
	inc	e
	ld	a, e
	jp	.LBB72_88
	.local	.LBB72_86
.LBB72_86:
	ld	iy, _optix_guidata+10
	ld	de, (iy)
	ld	(ix - 11), de
	ld	(ix - 3), hl
	ld	hl, _optix_guidata+6
	ld	de, (hl)
	ld	a, (_optix_guidata+12)
	ld	(ix - 6), a                     ; 1-byte Folded Spill
	ld	a, (_optix_guidata+8)
	ld	iyl, a
	ld	hl, (ix - 3)
	ld	l, e
	ld	h, d
	ld	(ix - 3), hl
	ld	iyh, 0
	push	iy
	ex	(sp), hl
	ld	(ix - 8), l
	ld	(ix - 7), h
	pop	hl
	ld	iy, (ix - 11)
	ld	e, (ix - 5)
	ld	d, (ix - 4)
	.local	.LBB72_87
.LBB72_87:
	push	bc
	pop	hl
	ld	bc, (ix - 3)
	or	a, a
	sbc	hl, bc
	ld	bc, 3
	call	__idivs
	push	hl
	pop	bc
	add.sis	iy, bc
	ld	hl, _optix_cursor
	push	de
	ld	e, iyl
	ld	d, iyh
	ld	(hl), e
	inc	hl
	ld	(hl), d
	pop	de
	ex.sis	de, hl
	ld	e, (ix - 8)
	ld	d, (ix - 7)
	or	a, a
	sbc.sis	hl, de
	ld.sis	bc, 3
	call	__sdivs
                                        ; kill: def $l killed $l killed $hl
	ld	a, (ix - 6)
	add	a, l
	ld	l, a
	ld	(_optix_cursor+2), a
	xor	a, a
	.local	.LBB72_88
.LBB72_88:
	ld	(_optix_guidata+13), a
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end72
.Lfunc_end72:
	.size	_optix_HandleTrackPad, .Lfunc_end72-_optix_HandleTrackPad
                                        ; -- End function
	.section	.text._optix_UpdateCursor,"ax",@progbits
	.globl	_optix_UpdateCursor             ; -- Begin function optix_UpdateCursor
	.type	_optix_UpdateCursor,@function
_optix_UpdateCursor:                    ; @optix_UpdateCursor
; %bb.0:
	ld	hl, -3
	call	__frameset
	call	_kb_Scan
	ld	hl, -720866
	push	hl
	pop	bc
	push	de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, e
	ld	h, d
	pop	de
	ld	a, l
	ld	hl, _optix_cursor
	ld	hl, (hl)
	bit	1, a
	jr	z, .LBB73_3
; %bb.1:
	push	hl
	pop	iy
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	jr	z, .LBB73_4
; %bb.2:
	ld.sis	de, -2
	add.sis	iy, de
	ld	(ix - 3), iy
	ld	hl, _optix_cursor
	push	de
	ld	e, iyl
	ld	d, iyh
	ld	(hl), e
	inc	hl
	ld	(hl), d
	pop	de
	jr	.LBB73_5
	.local	.LBB73_3
.LBB73_3:
	ld	(ix - 3), hl
	jr	.LBB73_5
	.local	.LBB73_4
.LBB73_4:
	ld	(ix - 3), iy
	.local	.LBB73_5
.LBB73_5:
	push	bc
	pop	iy
	ld.sis	de, 320
	ld	l, (iy)
	ld	h, (iy + 1)
	ld	a, l
	bit	2, a
	jr	z, .LBB73_9
; %bb.6:
	ld	iy, (ix - 3)
	ex	de, hl
	ld	e, iyl
	ld	d, iyh
	ex	de, hl
	or	a, a
	sbc.sis	hl, de
	jr	nc, .LBB73_8
; %bb.7:
	ld.sis	de, 2
	add.sis	iy, de
	ld	(ix - 3), iy
	ld	hl, _optix_cursor
	push	de
	ld	e, iyl
	ld	d, iyh
	ld	(hl), e
	inc	hl
	ld	(hl), d
	pop	de
	.local	.LBB73_8
.LBB73_8:
	push	bc
	pop	iy
	.local	.LBB73_9
.LBB73_9:
	ld.sis	bc, 1
	ld	l, (iy)
	ld	h, (iy + 1)
                                        ; kill: def $l killed $l killed $hl
	ld	a, (_optix_cursor+2)
	ld	e, a
	bit	3, l
	jr	z, .LBB73_12
; %bb.10:
	ld	a, e
	or	a, a
	jr	z, .LBB73_12
; %bb.11:
	ld	l, -2
	ld	a, e
	add	a, l
	ld	e, a
	ld	(_optix_cursor+2), a
	.local	.LBB73_12
.LBB73_12:
	ld	l, (iy)
	ld	h, (iy + 1)
	call	__sand
	bit	0, l
	jr	z, .LBB73_15
; %bb.13:
	ld	a, e
	cp	a, -16
	jr	nc, .LBB73_15
; %bb.14:
	ld	l, 2
	ld	a, e
	add	a, l
	ld	e, a
	ld	(_optix_cursor+2), a
	.local	.LBB73_15
.LBB73_15:
	ld	hl, (ix - 3)
	ld.sis	bc, 321
                                        ; kill: def $hl killed $hl killed $uhl
	or	a, a
	sbc.sis	hl, bc
	jr	c, .LBB73_17
; %bb.16:
	ld	hl, _optix_cursor
	ld.sis	bc, 320
	ld	(hl), c
	inc	hl
	ld	(hl), b
	.local	.LBB73_17
.LBB73_17:
	ld	a, e
	cp	a, -15
	jr	c, .LBB73_19
; %bb.18:
	ld	a, -16
	ld	(_optix_cursor+2), a
	.local	.LBB73_19
.LBB73_19:
	pop	hl
	pop	ix
	ret
	.local	.Lfunc_end73
.Lfunc_end73:
	.size	_optix_UpdateCursor, .Lfunc_end73-_optix_UpdateCursor
                                        ; -- End function
	.section	.text._optix_ClickCursor,"ax",@progbits
	.globl	_optix_ClickCursor              ; -- Begin function optix_ClickCursor
	.type	_optix_ClickCursor,@function
_optix_ClickCursor:                     ; @optix_ClickCursor
; %bb.0:
	ld	hl, -18
	call	__frameset
	ld	hl, -720868
	ld.sis	bc, 1
	ld	iy, _optix_cursor
	ld	e, b
	push	de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, e
	ld	h, d
	pop	de
	call	__sand
	bit	0, l
	jp	z, .LBB74_9
; %bb.1:
	ld	a, (_optix_guidata+2)
	bit	0, a
	jp	z, .LBB74_9
; %bb.2:
	ld	a, (_optix_buttoninfo)
	ld	(ix - 3), a                     ; 1-byte Folded Spill
	lea	hl, iy + 0
	ld	iy, (_optix_button)
	ld	hl, (hl)
	ld	bc, 0
	push	bc
	pop	de
	ld	e, l
	ld	d, h
	ld	(ix - 6), de
	ld	a, (_optix_cursor+2)
	push	bc
	pop	hl
	ld	l, a
	ld	(ix - 12), hl
	push	bc
	pop	de
	ld	e, (ix - 3)                     ; 1-byte Folded Reload
	.local	.LBB74_3
.LBB74_3:                               ; =>This Inner Loop Header: Depth=1
	sbc	hl, hl
	adc	hl, de
	jp	z, .LBB74_18
; %bb.4:                                ;   in Loop: Header=BB74_3 Depth=1
	ld	(ix - 9), de
	ld	hl, (iy)
	ld	bc, 0
	ld	c, l
	ld	b, h
	ld	hl, (ix - 6)
	or	a, a
	sbc	hl, bc
	ld	bc, (iy + 4)
	ld	(ix - 3), bc
	ld	de, 0
	ld	bc, (ix - 3)
	ld	e, c
	ld	d, b
	ld	(ix - 3), hl
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	p, .LBB74_8
; %bb.5:                                ;   in Loop: Header=BB74_3 Depth=1
	ld	a, (iy + 2)
	ld	bc, 0
	ld	c, a
	ld	hl, (ix - 12)
	or	a, a
	sbc	hl, bc
	ld	a, (iy + 6)
	ld	(ix - 15), hl
	ld	bc, 1
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	jp	m, .LBB74_8
; %bb.6:                                ;   in Loop: Header=BB74_3 Depth=1
	ld	hl, (ix - 3)
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	jp	m, .LBB74_8
; %bb.7:                                ;   in Loop: Header=BB74_3 Depth=1
	ld	bc, 0
	ld	c, a
	ld	hl, (ix - 15)
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	jp	m, .LBB74_17
	.local	.LBB74_8
.LBB74_8:                               ;   in Loop: Header=BB74_3 Depth=1
	lea	iy, iy + 30
	ld	de, (ix - 9)
	dec	de
	jp	.LBB74_3
	.local	.LBB74_9
.LBB74_9:
	ld	a, (_optix_buttoninfo)
	ld	d, a
	ld	hl, (_optix_button)
	ld	(ix - 3), hl
	ld	iy, (iy)
	ld	bc, 0
	push	bc
	pop	hl
	ex	de, hl
	ld	e, iyl
	ld	d, iyh
	ex	de, hl
	ld	(ix - 6), hl
	ld	a, (_optix_cursor+2)
	ld	c, a
	ld	(ix - 15), bc
	ld	bc, 0
	ld	c, d
	inc	d
	ld	iy, (ix - 3)
	lea	iy, iy + 4
	.local	.LBB74_10
.LBB74_10:                              ; =>This Inner Loop Header: Depth=1
	sbc	hl, hl
	adc	hl, bc
	jp	z, .LBB74_19
; %bb.11:                               ;   in Loop: Header=BB74_10 Depth=1
	ld	(ix - 12), bc
	ld	(ix - 9), d                     ; 1-byte Folded Spill
	ld	(ix - 3), e                     ; 1-byte Folded Spill
	ld	hl, (iy - 4)
	ld	de, 0
	ld	e, l
	ld	d, h
	ld	hl, (ix - 6)
	or	a, a
	sbc	hl, de
	push	hl
	pop	bc
	lea	hl, iy + 0
	ld	iy, (hl)
	ld	de, 0
	ld	e, iyl
	ld	d, iyh
	push	hl
	pop	iy
	ld	(ix - 18), bc
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	p, .LBB74_15
; %bb.12:                               ;   in Loop: Header=BB74_10 Depth=1
	ld	a, (iy - 2)
	ld	de, 0
	ld	e, a
	ld	hl, (ix - 15)
	or	a, a
	sbc	hl, de
	push	hl
	pop	bc
	ld	a, (iy + 2)
	ld	de, 1
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	m, .LBB74_15
; %bb.13:                               ;   in Loop: Header=BB74_10 Depth=1
	ld	hl, (ix - 18)
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	m, .LBB74_15
; %bb.14:                               ;   in Loop: Header=BB74_10 Depth=1
	ld	de, 0
	ld	e, a
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	m, .LBB74_16
	.local	.LBB74_15
.LBB74_15:                              ;   in Loop: Header=BB74_10 Depth=1
	ld	d, (ix - 9)                     ; 1-byte Folded Reload
	ld	a, d
	ld	(_optix_buttoninfo+1), a
	ld	e, (ix - 3)                     ; 1-byte Folded Reload
	inc	e
	lea	iy, iy + 30
	ld	bc, (ix - 12)
	dec	bc
	jp	.LBB74_10
	.local	.LBB74_16
.LBB74_16:
	ld	a, (ix - 3)                     ; 1-byte Folded Reload
	ld	(_optix_buttoninfo+1), a
	jr	.LBB74_19
	.local	.LBB74_17
.LBB74_17:
	ld	hl, (iy + 25)
	call	__indcallhl
	.local	.LBB74_18
.LBB74_18:                              ; %.loopexit4
	xor	a, a
	ld	(_optix_guidata+2), a
	.local	.LBB74_19
.LBB74_19:                              ; %.loopexit
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end74
.Lfunc_end74:
	.size	_optix_ClickCursor, .Lfunc_end74-_optix_ClickCursor
                                        ; -- End function
	.section	.text._optix_RenderCursor,"ax",@progbits
	.globl	_optix_RenderCursor             ; -- Begin function optix_RenderCursor
	.type	_optix_RenderCursor,@function
_optix_RenderCursor:                    ; @optix_RenderCursor
; %bb.0:
	ld	hl, -3
	call	__frameset
	ld	a, (_optix_guicolors+1)
	ld	l, a
	push	hl
	call	_gfx_SetColor
	pop	hl
	ld	hl, _optix_cursor
	ld	de, (hl)
	ld	bc, 0
	push	bc
	pop	hl
	ld	l, e
	ld	h, d
	ld	a, (_optix_cursor+2)
	ld	c, a
	ld	(ix - 3), bc
	ld	de, 5
	push	de
	push	bc
	push	hl
	call	_gfx_Circle
	pop	hl
	pop	hl
	pop	hl
	ld	hl, _optix_cursor
	ld	hl, (hl)
	ld	bc, (ix - 3)
	ld	c, l
	ld	b, h
	ld	a, (_optix_cursor+2)
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	de, 4
	push	de
	push	hl
	push	bc
	call	_gfx_Circle
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end75
.Lfunc_end75:
	.size	_optix_RenderCursor, .Lfunc_end75-_optix_RenderCursor
                                        ; -- End function
	.section	.text._optix_UpdateSelectedButton,"ax",@progbits
	.globl	_optix_UpdateSelectedButton     ; -- Begin function optix_UpdateSelectedButton
	.type	_optix_UpdateSelectedButton,@function
_optix_UpdateSelectedButton:            ; @optix_UpdateSelectedButton
; %bb.0:
	ld	hl, -29
	call	__frameset
	ld	a, (_optix_guidata+2)
	bit	0, a
	jp	z, .LBB76_35
; %bb.1:
	call	_kb_Scan
	ld	hl, -720866
	push	de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, e
	ld	h, d
	pop	de
	ld	c, 14
	call	__sshl
	add.sis	hl, hl
	sbc.sis	hl, hl
	ex.sis	de, hl
	ld	a, d
	rlc	a
	sbc	hl, hl
	ld	l, e
	ld	h, d
	ld	(ix - 3), hl
	ld	hl, -720866
	push	de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, e
	ld	h, d
	pop	de
	ld	c, 2
	call	__sshru
	ld.sis	bc, 1
	call	__sand
	ld	de, 0
	push	de
	pop	iy
	ex	de, hl
	ld	iyl, e
	ld	iyh, d
	ex	de, hl
	ld	de, (ix - 3)
	add	iy, de
	ld	(ix - 6), iy
	ld	hl, -720866
	push	de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, e
	ld	h, d
	pop	de
	ld	c, 12
	call	__sshl
	add.sis	hl, hl
	sbc.sis	hl, hl
	ex.sis	de, hl
	ld	a, d
	rlc	a
	sbc	hl, hl
	push	hl
	pop	iy
	ld	iyl, e
	ld	iyh, d
	ld	hl, -720866
	push	de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, e
	ld	h, d
	pop	de
	ld.sis	bc, 1
	call	__sand
	ld	de, 0
	ld	e, l
	ld	d, h
	add	iy, de
	ld	(ix - 9), iy
	ld	hl, (ix - 6)
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB76_6
; %bb.2:
	ld	hl, (ix - 9)
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	z, .LBB76_4
; %bb.3:
	ld	a, 0
	jr	.LBB76_5
	.local	.LBB76_4
.LBB76_4:
	ld	a, -1
	.local	.LBB76_5
.LBB76_5:
	bit	0, a
	jp	nz, .LBB76_35
	.local	.LBB76_6
.LBB76_6:
	or	a, a
	sbc	hl, hl
	ld	(ix - 12), hl
	ld	iy, (_optix_button)
	ld	a, (_optix_buttoninfo+1)
	ld	de, 0
	ld	e, a
	ld	bc, 30
	push	de
	pop	hl
	call	__imulu
	push	hl
	pop	bc
	lea	hl, iy + 0
	add	hl, bc
	ld	(ix - 15), hl
	ld	a, (_optix_buttoninfo)
	ld	l, a
	ld	a, (_optix_guisettings+2)
	ld	e, a
	ld	(ix - 19), de
	ld	de, 0
	ld	e, l
	ld	b, d
	ld	c, b
	ld	hl, 10000
	ld	(ix - 3), hl
	.local	.LBB76_7
.LBB76_7:                               ; =>This Inner Loop Header: Depth=1
	sbc	hl, hl
	adc	hl, de
	jp	z, .LBB76_32
; %bb.8:                                ;   in Loop: Header=BB76_7 Depth=1
	ld	a, (iy + 28)
	or	a, a
	jp	nz, .LBB76_31
; %bb.9:                                ;   in Loop: Header=BB76_7 Depth=1
	ld	(ix - 26), b                    ; 1-byte Folded Spill
	ld	(ix - 16), c                    ; 1-byte Folded Spill
	ld	(ix - 25), de
	ld	bc, (ix - 6)
	push	bc
	pop	hl
	ld	de, -1
	or	a, a
	sbc	hl, de
	ld	(ix - 22), iy
	jr	nz, .LBB76_12
; %bb.10:                               ;   in Loop: Header=BB76_7 Depth=1
	ld	de, (iy)
	ld	hl, (ix - 15)
	ld	bc, (hl)
	ld	l, e
	ld	h, d
	or	a, a
	sbc.sis	hl, bc
	jp	nc, .LBB76_15
; %bb.11:                               ;   in Loop: Header=BB76_7 Depth=1
	or	a, a
	sbc	hl, hl
	ld	(ix - 12), de
	push	hl
	pop	de
	ld	l, c
	ld	h, b
	push	de
	pop	bc
	ld	de, (ix - 12)
	ld	c, e
	ld	b, d
	sbc	hl, bc
	ex	de, hl
	ld	a, (iy + 2)
	ld	bc, 0
	push	bc
	pop	hl
	ld	l, a
	ld	iy, (ix - 15)
	ld	a, (iy + 2)
	ld	c, a
	or	a, a
	sbc	hl, bc
	push	hl
	pop	iy
	add	hl, hl
	sbc	hl, hl
	push	hl
	pop	bc
	add	iy, bc
	lea	hl, iy + 0
	push	de
	pop	iy
	call	__ixor
	ld	bc, (ix - 19)
	call	__imulu
	push	hl
	pop	bc
	add	iy, bc
	ld	bc, (ix - 3)
	jr	.LBB76_16
	.local	.LBB76_12
.LBB76_12:                              ;   in Loop: Header=BB76_7 Depth=1
	push	bc
	pop	hl
	ld	de, 1
	or	a, a
	sbc	hl, de
	jr	nz, .LBB76_17
; %bb.13:                               ;   in Loop: Header=BB76_7 Depth=1
	ld	de, (iy)
	ld	hl, (ix - 15)
	ld	bc, (hl)
	ld	l, c
	ld	h, b
	ld	(ix - 29), de
	or	a, a
	sbc.sis	hl, de
	ld	de, (ix - 25)
	jp	nc, .LBB76_25
; %bb.14:                               ;   in Loop: Header=BB76_7 Depth=1
	or	a, a
	sbc	hl, hl
	ld	(ix - 12), hl
	push	bc
	pop	hl
	ld	bc, (ix - 12)
	ld	c, l
	ld	b, h
	ld	(ix - 12), bc
	sbc	hl, hl
	ld	bc, (ix - 29)
	ld	l, c
	ld	h, b
	ld	bc, (ix - 12)
	sbc	hl, bc
	ld	(ix - 12), hl
	ld	a, (iy + 2)
	ld	bc, 0
	push	bc
	pop	hl
	ld	l, a
	ld	iy, (ix - 15)
	ld	a, (iy + 2)
	ld	c, a
	jp	.LBB76_24
	.local	.LBB76_15
.LBB76_15:                              ;   in Loop: Header=BB76_7 Depth=1
	ld	bc, (ix - 3)
	ld	iy, 10000
	.local	.LBB76_16
.LBB76_16:                              ;   in Loop: Header=BB76_7 Depth=1
	ld	de, (ix - 25)
	jp	.LBB76_26
	.local	.LBB76_17
.LBB76_17:                              ;   in Loop: Header=BB76_7 Depth=1
	ld	bc, (ix - 9)
	push	bc
	pop	hl
	ld	de, -1
	or	a, a
	sbc	hl, de
	jr	nz, .LBB76_20
; %bb.18:                               ;   in Loop: Header=BB76_7 Depth=1
	ld	a, (iy + 2)
	lea	hl, iy + 0
	ld	iy, (ix - 15)
	ld	c, (iy + 2)
	cp	a, c
	ld	de, (ix - 25)
	jp	nc, .LBB76_25
; %bb.19:                               ;   in Loop: Header=BB76_7 Depth=1
	push	hl
	pop	iy
	or	a, a
	sbc	hl, hl
	ld	l, c
	ld	bc, 0
	ld	c, a
	or	a, a
	sbc	hl, bc
	ld	(ix - 12), hl
	ld	bc, (iy)
	jr	.LBB76_23
	.local	.LBB76_20
.LBB76_20:                              ;   in Loop: Header=BB76_7 Depth=1
	push	bc
	pop	hl
	ld	de, 1
	or	a, a
	sbc	hl, de
	ld	bc, 10000
	ld	de, (ix - 25)
	ld	iy, (ix - 12)
	jr	nz, .LBB76_26
; %bb.21:                               ;   in Loop: Header=BB76_7 Depth=1
	ld	iy, (ix - 22)
	ld	c, (iy + 2)
	ld	iy, (ix - 15)
	ld	a, (iy + 2)
	cp	a, c
	jr	nc, .LBB76_25
; %bb.22:                               ;   in Loop: Header=BB76_7 Depth=1
	ld	iy, 0
	ld	iyl, a
	or	a, a
	sbc	hl, hl
	ld	l, c
	lea	bc, iy + 0
	sbc	hl, bc
	ld	(ix - 12), hl
	ld	hl, (ix - 22)
	ld	bc, (hl)
	.local	.LBB76_23
.LBB76_23:                              ;   in Loop: Header=BB76_7 Depth=1
	ld	iy, 0
	lea	hl, iy + 0
	ld	l, c
	ld	h, b
	ld	iy, (ix - 15)
	ld	iy, (iy)
	ld	bc, 0
	ld	c, iyl
	ld	b, iyh
	.local	.LBB76_24
.LBB76_24:                              ;   in Loop: Header=BB76_7 Depth=1
	or	a, a
	sbc	hl, bc
	push	hl
	pop	iy
	add	hl, hl
	sbc	hl, hl
	push	hl
	pop	bc
	add	iy, bc
	lea	hl, iy + 0
	ld	iy, (ix - 12)
	call	__ixor
	ld	bc, (ix - 19)
	call	__imulu
	push	hl
	pop	bc
	add	iy, bc
	ld	bc, (ix - 3)
	jr	.LBB76_26
	.local	.LBB76_25
.LBB76_25:                              ;   in Loop: Header=BB76_7 Depth=1
	ld	bc, (ix - 3)
	ld	iy, 10000
	.local	.LBB76_26
.LBB76_26:                              ;   in Loop: Header=BB76_7 Depth=1
	lea	hl, iy + 0
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	ld	a, (ix - 16)                    ; 1-byte Folded Reload
	jp	m, .LBB76_28
; %bb.27:                               ;   in Loop: Header=BB76_7 Depth=1
	ld	a, (ix - 26)                    ; 1-byte Folded Reload
	.local	.LBB76_28
.LBB76_28:                              ;   in Loop: Header=BB76_7 Depth=1
	lea	hl, iy + 0
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	ld	(ix - 12), iy
	ld	(ix - 3), iy
	ld	iy, (ix - 22)
	jp	m, .LBB76_30
; %bb.29:                               ;   in Loop: Header=BB76_7 Depth=1
	ld	(ix - 3), bc
	.local	.LBB76_30
.LBB76_30:                              ;   in Loop: Header=BB76_7 Depth=1
	ld	b, a
	ld	c, (ix - 16)                    ; 1-byte Folded Reload
	.local	.LBB76_31
.LBB76_31:                              ;   in Loop: Header=BB76_7 Depth=1
	lea	iy, iy + 30
	inc	c
	dec	de
	jp	.LBB76_7
	.local	.LBB76_32
.LBB76_32:
	ld	de, 5000
	ld	hl, (ix - 3)
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	p, .LBB76_34
; %bb.33:
	ld	a, b
	ld	(_optix_buttoninfo+1), a
	.local	.LBB76_34
.LBB76_34:
	xor	a, a
	ld	(_optix_guidata+2), a
	.local	.LBB76_35
.LBB76_35:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end76
.Lfunc_end76:
	.size	_optix_UpdateSelectedButton, .Lfunc_end76-_optix_UpdateSelectedButton
                                        ; -- End function
	.section	.text._optix_ClickButton,"ax",@progbits
	.globl	_optix_ClickButton              ; -- Begin function optix_ClickButton
	.type	_optix_ClickButton,@function
_optix_ClickButton:                     ; @optix_ClickButton
; %bb.0:
	ld	hl, -720868
	ld.sis	bc, 1
	ld	iy, (_optix_button)
	ld	a, (_optix_buttoninfo+1)
	ld	de, 0
	push	de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, e
	ld	h, d
	pop	de
	call	__sand
	bit	0, l
	jr	z, .LBB77_3
; %bb.1:
	ld	l, a
	ld	a, (_optix_guidata+2)
	bit	0, a
	ld	a, l
	jr	z, .LBB77_3
; %bb.2:
	ld	e, a
	ld	bc, 30
	ex	de, hl
	call	__imulu
	ex	de, hl
	add	iy, de
	ld	hl, (iy + 25)
	call	__indcallhl
	xor	a, a
	ld	(_optix_guidata+2), a
	.local	.LBB77_3
.LBB77_3:
	ret
	.local	.Lfunc_end77
.Lfunc_end77:
	.size	_optix_ClickButton, .Lfunc_end77-_optix_ClickButton
                                        ; -- End function
	.section	.text._optix_CusText,"ax",@progbits
	.globl	_optix_CusText                  ; -- Begin function optix_CusText
	.type	_optix_CusText,@function
_optix_CusText:                         ; @optix_CusText
; %bb.0:
	ld	hl, -4
	call	__frameset
	ld	a, (ix + 6)
	ld	hl, _optix_guicolors
	ld	(ix - 4), a                     ; 1-byte Folded Spill
	bit	0, a
	jr	nz, .LBB78_2
; %bb.1:
	ld	de, 5
	jr	.LBB78_3
	.local	.LBB78_2
.LBB78_2:
	ld	de, 7
	.local	.LBB78_3
.LBB78_3:
	add	hl, de
	ld	(ix - 3), hl
	ld	a, (hl)
	ld	l, a
	push	hl
	call	_gfx_SetTextBGColor
	pop	hl
	ld	a, (_optix_guicolors+6)
	ld	l, a
	ld	a, (_optix_guicolors+4)
	bit	0, (ix - 4)                     ; 1-byte Folded Reload
	jr	nz, .LBB78_5
; %bb.4:
	ld	l, a
	.local	.LBB78_5
.LBB78_5:
	push	hl
	call	_gfx_SetTextFGColor
	pop	hl
	ld	hl, (ix - 3)
	ld	a, (hl)
	ld	(ix + 6), a
	ld	sp, ix
	pop	ix
	jp	_gfx_SetTextTransparentColor
	.local	.Lfunc_end78
.Lfunc_end78:
	.size	_optix_CusText, .Lfunc_end78-_optix_CusText
                                        ; -- End function
	.section	.text._optix_WhiText,"ax",@progbits
	.globl	_optix_WhiText                  ; -- Begin function optix_WhiText
	.type	_optix_WhiText,@function
_optix_WhiText:                         ; @optix_WhiText
; %bb.0:
	or	a, a
	sbc	hl, hl
	push	hl
	call	_gfx_SetTextBGColor
	pop	hl
	ld	hl, 255
	push	hl
	call	_gfx_SetTextFGColor
	pop	hl
	or	a, a
	sbc	hl, hl
	push	hl
	call	_gfx_SetTextTransparentColor
	pop	hl
	ret
	.local	.Lfunc_end79
.Lfunc_end79:
	.size	_optix_WhiText, .Lfunc_end79-_optix_WhiText
                                        ; -- End function
	.section	.text._optix_BlaText,"ax",@progbits
	.globl	_optix_BlaText                  ; -- Begin function optix_BlaText
	.type	_optix_BlaText,@function
_optix_BlaText:                         ; @optix_BlaText
; %bb.0:
	ld	hl, 255
	push	hl
	call	_gfx_SetTextBGColor
	pop	hl
	or	a, a
	sbc	hl, hl
	push	hl
	call	_gfx_SetTextFGColor
	pop	hl
	ld	hl, 255
	push	hl
	call	_gfx_SetTextTransparentColor
	pop	hl
	ret
	.local	.Lfunc_end80
.Lfunc_end80:
	.size	_optix_BlaText, .Lfunc_end80-_optix_BlaText
                                        ; -- End function
	.section	.text._optix_SetDefaultColors,"ax",@progbits
	.globl	_optix_SetDefaultColors         ; -- Begin function optix_SetDefaultColors
	.type	_optix_SetDefaultColors,@function
_optix_SetDefaultColors:                ; @optix_SetDefaultColors
; %bb.0:
	ld	l, 0
	ld	e, -1
	ld	c, -32
	ld	h, 74
	ld	a, l
	ld	(_optix_guicolors), a
	ld	(_optix_guicolors+1), a
	ld	a, e
	ld	(_optix_guicolors+2), a
	ld	(_optix_guicolors+4), a
	ld	a, l
	ld	(_optix_guicolors+5), a
	ld	(_optix_guicolors+6), a
	ld	a, e
	ld	(_optix_guicolors+7), a
	ld	a, c
	ld	(_optix_guicolors+3), a
	ld	a, h
	ld	(_optix_guicolors+8), a
	ret
	.local	.Lfunc_end81
.Lfunc_end81:
	.size	_optix_SetDefaultColors, .Lfunc_end81-_optix_SetDefaultColors
                                        ; -- End function
	.section	.text._optix_SetDefaultSettings,"ax",@progbits
	.globl	_optix_SetDefaultSettings       ; -- Begin function optix_SetDefaultSettings
	.type	_optix_SetDefaultSettings,@function
_optix_SetDefaultSettings:              ; @optix_SetDefaultSettings
; %bb.0:
	ld	iy, 0
	xor	a, a
	ld.sis	bc, 0
	ld	hl, _optix_guidata+6
	ld	d, 10
	ld	e, 1
	ld	(_optix_cursor), iy
	ld	(_optix_cursor+3), a
	ld	(hl), c
	inc	hl
	ld	(hl), b
	ld	(_optix_guidata+8), a
	ld	hl, _optix_guidata+10
	ld	(hl), c
	inc	hl
	ld	(hl), b
	ld	(_optix_guidata+12), a
	ld	a, d
	ld	(_optix_guisettings+2), a
	ld	a, e
	ld	(_optix_buttoninfo+1), a
	ld	(_optix_guidata+2), a
	ret
	.local	.Lfunc_end82
.Lfunc_end82:
	.size	_optix_SetDefaultSettings, .Lfunc_end82-_optix_SetDefaultSettings
                                        ; -- End function
	.section	.text._optix_VertScrollbar,"ax",@progbits
	.globl	_optix_VertScrollbar            ; -- Begin function optix_VertScrollbar
	.type	_optix_VertScrollbar,@function
_optix_VertScrollbar:                   ; @optix_VertScrollbar
; %bb.0:
	call	__frameset0
	ld	c, (ix + 15)
	ld	d, (ix + 18)
	ld	b, (ix + 21)
	ld	a, (ix + 24)
	or	a, a
	sbc	hl, hl
	ld	l, d
	ld	iy, 1
	push	iy
	ld	e, a
	push	de
	ld	e, b
	push	de
	push	hl
	ld	l, c
	push	hl
	ld	l, (ix + 12)
	push	hl
	ld	l, (ix + 9)
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_optix_Scrollbar
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end83
.Lfunc_end83:
	.size	_optix_VertScrollbar, .Lfunc_end83-_optix_VertScrollbar
                                        ; -- End function
	.section	.text._optix_Scrollbar,"ax",@progbits
	.globl	_optix_Scrollbar                ; -- Begin function optix_Scrollbar
	.type	_optix_Scrollbar,@function
_optix_Scrollbar:                       ; @optix_Scrollbar
; %bb.0:
	ld	hl, -21
	call	__frameset
	ld	a, (ix + 15)
	inc	a
	ld	(ix - 9), a
	ld	a, (_optix_guicolors+1)
	ld	l, a
	push	hl
	call	_gfx_SetColor
	pop	hl
	or	a, a
	sbc	hl, hl
	push	hl
	pop	de
	ld	e, (ix + 9)
	ld	(ix - 3), de
	ld	l, (ix + 21)
	ld	(ix - 6), hl
	push	hl
	ld	hl, (ix + 18)
	push	hl
	push	de
	ld	hl, (ix + 6)
	push	hl
	call	_gfx_FillRectangle
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	a, (_optix_guicolors+2)
	ld	l, a
	push	hl
	call	_gfx_SetColor
	pop	hl
	ld	hl, (ix - 6)
	push	hl
	ld	hl, (ix + 18)
	push	hl
	ld	hl, (ix - 3)
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_gfx_Rectangle
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	bit	0, (ix + 24)
	jr	z, .LBB84_2
; %bb.1:
	ld	a, (_optix_guicolors+3)
	ld	l, a
	push	hl
	call	_gfx_SetColor
	pop	hl
	.local	.LBB84_2
.LBB84_2:
	ld	a, (ix + 27)
	ld	bc, 2
	ld	iy, 0
	lea	hl, iy + 0
	ld	l, (ix + 12)
	push	af
	ld	a, (ix - 9)                     ; 1-byte Folded Reload
	ld	iyl, a
	pop	af
	lea	de, iy + 0
	dec	de
	ld	(ix - 12), hl
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	ld	(ix - 15), iy
	jp	p, .LBB84_5
; %bb.3:
	ld	hl, (ix + 6)
	add	hl, bc
	ld	(ix - 18), hl
	bit	0, a
	jp	z, .LBB84_7
; %bb.4:
	ld	b, 0
	ld	c, (ix + 21)
	ld	l, c
	ld	h, b
	ld.sis	de, -4
	add.sis	hl, de
	ld	c, (ix - 9)                     ; 1-byte Folded Reload
	call	__sdivs
	ld	c, l
	ld	b, h
	ld	a, b
	rlc	a
	sbc	hl, hl
	ex	de, hl
	ld	e, c
	ld	d, b
	push	de
	pop	hl
	ld	bc, (ix - 12)
	call	__imulu
	push	hl
	pop	bc
	ld	hl, (ix - 3)
	add	hl, bc
	ld	bc, 2
	add	hl, bc
	ld	iy, (ix + 18)
	ld	bc, -4
	add	iy, bc
	push	de
	push	iy
	push	hl
	ld	hl, (ix - 18)
	jp	.LBB84_8
	.local	.LBB84_5
.LBB84_5:
	bit	0, a
	jp	z, .LBB84_10
; %bb.6:
	ld	iy, (ix + 6)
	add	iy, bc
	ld	b, 0
	ld	c, (ix + 21)
	ld	l, c
	ld	h, b
	ld.sis	de, -4
	add.sis	hl, de
	ld	c, (ix - 9)                     ; 1-byte Folded Reload
	call	__sdivs
	ex.sis	de, hl
	ld	a, d
	rlc	a
	sbc	hl, hl
	push	hl
	pop	bc
	ld	c, e
	ld	b, d
	ld	hl, (ix - 3)
	ld	de, (ix - 6)
	add	hl, de
	ld	de, -2
	add	hl, de
	or	a, a
	sbc	hl, bc
	ld	(ix - 12), hl
	ld	hl, (ix + 18)
	ld	de, -4
	add	hl, de
	push	bc
	push	hl
	ld	hl, (ix - 12)
	push	hl
	push	iy
	jp	.LBB84_11
	.local	.LBB84_7
.LBB84_7:
	ld	hl, (ix + 18)
	ld	de, -4
	add	hl, de
	lea	bc, iy + 0
	call	__idivu
	push	hl
	pop	de
	ld	bc, (ix - 12)
	call	__imulu
	ld	bc, (ix - 18)
	add	hl, bc
	ld	(ix - 21), hl
	ld	iy, (ix - 3)
	ld	bc, 2
	add	iy, bc
	ld	hl, (ix - 6)
	ld	bc, -4
	add	hl, bc
	push	hl
	push	de
	push	iy
	ld	hl, (ix - 21)
	.local	.LBB84_8
.LBB84_8:
	push	hl
	call	_gfx_FillRectangle
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	a, (_optix_guicolors+8)
	ld	l, a
	push	hl
	call	_gfx_SetColor
	pop	hl
	bit	0, (ix + 27)
	jp	z, .LBB84_13
; %bb.9:
	ld	b, 0
	ld	c, (ix + 21)
	ld	l, c
	ld	h, b
	ld.sis	de, -4
	add.sis	hl, de
	ld	c, (ix - 9)                     ; 1-byte Folded Reload
	call	__sdivs
	ld	c, l
	ld	b, h
	ld	a, b
	rlc	a
	sbc	hl, hl
	ex	de, hl
	ld	e, c
	ld	d, b
	push	de
	pop	hl
	ld	bc, (ix - 12)
	call	__imulu
	push	hl
	pop	bc
	ld	hl, (ix - 3)
	add	hl, bc
	ld	bc, 2
	add	hl, bc
	ld	iy, (ix + 18)
	ld	bc, -4
	add	iy, bc
	push	de
	push	iy
	push	hl
	ld	hl, (ix - 18)
	jp	.LBB84_16
	.local	.LBB84_10
.LBB84_10:
	ld	de, (ix + 18)
	push	de
	pop	hl
	ld	bc, -4
	add	hl, bc
	lea	bc, iy + 0
	call	__idivu
	push	hl
	pop	bc
	ld	hl, (ix + 6)
	add	hl, de
	ld	de, -2
	add	hl, de
	or	a, a
	sbc	hl, bc
	ld	(ix - 12), hl
	ld	iy, (ix - 3)
	ld	de, 2
	add	iy, de
	ld	hl, (ix - 6)
	ld	de, -4
	add	hl, de
	push	hl
	push	bc
	push	iy
	ld	hl, (ix - 12)
	push	hl
	.local	.LBB84_11
.LBB84_11:
	call	_gfx_FillRectangle
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	a, (_optix_guicolors+8)
	ld	l, a
	push	hl
	call	_gfx_SetColor
	pop	hl
	bit	0, (ix + 27)
	jr	z, .LBB84_14
; %bb.12:
	ld	de, 2
	ld	hl, (ix + 6)
	add	hl, de
	ld	(ix - 12), hl
	ld	b, d
	ld	c, (ix + 21)
	ld	l, c
	ld	h, b
	ld.sis	de, -4
	add.sis	hl, de
	ld	c, (ix - 9)                     ; 1-byte Folded Reload
	call	__sdivs
	ex.sis	de, hl
	ld	a, d
	rlc	a
	sbc	hl, hl
	push	hl
	pop	bc
	ld	c, e
	ld	b, d
	ld	hl, (ix - 3)
	ld	de, (ix - 6)
	add	hl, de
	ld	de, -2
	add	hl, de
	or	a, a
	sbc	hl, bc
	ld	iy, (ix + 18)
	ld	de, -4
	add	iy, de
	push	bc
	push	iy
	push	hl
	ld	hl, (ix - 12)
	jr	.LBB84_16
	.local	.LBB84_13
.LBB84_13:
	ld	hl, (ix + 18)
	ld	de, -4
	add	hl, de
	ld	bc, (ix - 15)
	call	__idivu
	push	hl
	pop	de
	ld	bc, (ix - 12)
	call	__imulu
	ld	bc, (ix - 18)
	add	hl, bc
	jr	.LBB84_15
	.local	.LBB84_14
.LBB84_14:
	ld	hl, (ix + 18)
	push	hl
	pop	de
	push	de
	pop	iy
	ld	de, -4
	add	hl, de
	ld	bc, (ix - 15)
	call	__idivu
	ex	de, hl
	ld	hl, (ix + 6)
	lea	bc, iy + 0
	add	hl, bc
	ld	bc, -2
	add	hl, bc
	or	a, a
	sbc	hl, de
	.local	.LBB84_15
.LBB84_15:
	ld	(ix - 9), hl
	ld	hl, (ix - 3)
	ld	bc, 2
	add	hl, bc
	ld	iy, (ix - 6)
	ld	bc, -4
	add	iy, bc
	push	iy
	push	de
	push	hl
	ld	hl, (ix - 9)
	.local	.LBB84_16
.LBB84_16:
	push	hl
	call	_gfx_Rectangle
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end84
.Lfunc_end84:
	.size	_optix_Scrollbar, .Lfunc_end84-_optix_Scrollbar
                                        ; -- End function
	.section	.text._optix_HorizScrollbar,"ax",@progbits
	.globl	_optix_HorizScrollbar           ; -- Begin function optix_HorizScrollbar
	.type	_optix_HorizScrollbar,@function
_optix_HorizScrollbar:                  ; @optix_HorizScrollbar
; %bb.0:
	call	__frameset0
	ld	a, (ix + 15)
	ld	bc, (ix + 18)
	ld	l, (ix + 21)
	ld	h, (ix + 24)
	ld	iy, 0
	push	iy
	ld	e, h
	push	de
                                        ; kill: def $l killed $l def $uhl
	push	hl
	push	bc
	ld	l, a
	push	hl
	ld	l, (ix + 12)
	push	hl
	ld	l, (ix + 9)
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_optix_Scrollbar
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end85
.Lfunc_end85:
	.size	_optix_HorizScrollbar, .Lfunc_end85-_optix_HorizScrollbar
                                        ; -- End function
	.section	.text._optix_RenderWindow,"ax",@progbits
	.globl	_optix_RenderWindow             ; -- Begin function optix_RenderWindow
	.type	_optix_RenderWindow,@function
_optix_RenderWindow:                    ; @optix_RenderWindow
; %bb.0:
	ld	hl, -18
	call	__frameset
	ld	hl, (ix + 6)
	ld	(ix - 9), hl
	ld	de, (ix + 9)
	ld	a, (ix + 12)
	ld	iy, 12
	ld	bc, 0
	push	bc
	pop	hl
	ld	(ix - 3), bc
	ld	l, e
	ld	h, d
	ld	(ix - 6), hl
	srl	h
	rr	l
	ld	(ix - 15), l
	ld	(ix - 14), h
	ld	c, a
	ld	(ix - 12), bc
	push	bc
	pop	hl
	lea	de, iy + 0
	add	hl, de
	call	__ishru_1
	push	hl
	pop	bc
	ld	hl, 120
	or	a, a
	sbc	hl, bc
	ld	(ix - 18), hl
	ld	a, (_optix_guicolors+1)
	ld	l, a
	push	hl
	call	_gfx_SetColor
	pop	hl
	ld.sis	hl, 160
	ld	e, (ix - 15)
	ld	d, (ix - 14)
	or	a, a
	sbc.sis	hl, de
	ld.sis	bc, 255
	call	__sand
	ld	de, (ix - 3)
	ld	e, l
	ld	d, h
	ld	(ix - 3), de
	ld	hl, (ix - 18)
	ld	bc, 255
	call	__iand
	ld	(ix - 15), hl
	push	hl
	pop	iy
	ld	de, 12
	add	iy, de
	ld	(ix - 18), iy
	ld	hl, (ix - 12)
	push	hl
	ld	hl, (ix - 6)
	push	hl
	push	iy
	ld	hl, (ix - 3)
	push	hl
	call	_gfx_FillRectangle
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	a, (_optix_guicolors+2)
	ld	l, a
	push	hl
	call	_gfx_SetColor
	pop	hl
	ld	hl, (ix - 12)
	push	hl
	ld	hl, (ix - 6)
	push	hl
	ld	hl, (ix - 18)
	push	hl
	ld	hl, (ix - 3)
	push	hl
	call	_gfx_Rectangle
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 12
	push	hl
	ld	hl, (ix - 6)
	push	hl
	ld	hl, (ix - 15)
	push	hl
	ld	hl, (ix - 3)
	push	hl
	call	_gfx_FillRectangle
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 1
	push	hl
	call	_optix_CusText
	pop	hl
	ld	hl, (ix - 9)
	push	hl
	call	_gfx_GetStringWidth
	pop	de
	call	__ishru_1
	ex	de, hl
	ld	hl, 160
	or	a, a
	sbc	hl, de
	ld	de, 3
	ld	iy, (ix - 15)
	add	iy, de
	ld	de, (ix - 9)
	ld	(ix + 6), de
	ld	(ix + 9), hl
	ld	(ix + 12), iy
	ld	sp, ix
	pop	ix
	jp	_gfx_PrintStringXY
	.local	.Lfunc_end86
.Lfunc_end86:
	.size	_optix_RenderWindow, .Lfunc_end86-_optix_RenderWindow
                                        ; -- End function
	.section	.text._optix_WordWrap,"ax",@progbits
	.globl	_optix_WordWrap                 ; -- Begin function optix_WordWrap
	.type	_optix_WordWrap,@function
_optix_WordWrap:                        ; @optix_WordWrap
; %bb.0:
	ld	hl, -236
	call	__frameset
	ld	de, -207
	lea	iy, ix + 0
	add	iy, de
	ld	de, -230
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), iy
	lea	hl, ix - 7
	push	ix
	lea	ix, ix - 128
	ld	(ix - 96), hl
	pop	ix
	lea	hl, ix - 107
	lea	de, iy + 0
	ld	bc, -210
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), de
	ld	de, -213
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	inc	hl
	ld	(ix - 106), 0
	push	hl
	pop	iy
	inc	iy
	ld	bc, 98
	lea	de, iy + 0
	ldir
	ld	de, -230
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	(iy + 0), 0
	ld	de, -210
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	pop	de
	inc	de
	ld	bc, 99
	ldir
	ld	(ix - 7), 0
	ld	hl, (ix + 6)
	push	hl
	call	_optix_GetStringLength
	ld.sis	bc, 0
	ld	de, -227
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	pop	hl
	ld	iy, 0
	lea	hl, iy + 0
	ld	de, (ix + 9)
	ld	l, e
	ld	h, d
	push	ix
	lea	ix, ix - 128
	ld	(ix - 93), hl
	pop	ix
	.local	.LBB87_1
.LBB87_1:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB87_2 Depth 2
	ld	(ix - 107), 0
	xor	a, a
	ld	de, -218
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), a                         ; 1-byte Folded Spill
	.local	.LBB87_2
.LBB87_2:                               ;   Parent Loop BB87_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lea	de, iy + 0
	ld	e, c
	ld	d, b
	ld	hl, (ix + 6)
	add	hl, de
	ld	a, (hl)
	cp	a, 32
	jp	z, .LBB87_9
; %bb.3:                                ;   in Loop: Header=BB87_2 Depth=2
	ld	de, -215
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), c
	inc	hl
	ld	(hl), b
	dec	hl
	cp	a, 96
	jr	nz, .LBB87_5
; %bb.4:                                ;   in Loop: Header=BB87_2 Depth=2
	ld	de, -233
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), a                     ; 1-byte Folded Spill
	ld	de, -213
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_gfx_GetStringWidth
	ld	de, -236
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	pop	hl
	ld	de, -210
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_gfx_GetStringWidth
	ld	iy, 0
	pop	de
	push	ix
	lea	ix, ix - 128
	ld	de, (ix - 108)
	pop	ix
	add	hl, de
	ex	de, hl
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 93)
	pop	ix
	or	a, a
	sbc	hl, de
	ld	de, -233
	lea	hl, ix + 0
	push	af
	add	hl, de
	pop	af
	ld	a, (hl)                         ; 1-byte Folded Reload
	jp	nc, .LBB87_8
	.local	.LBB87_5
.LBB87_5:                               ;   in Loop: Header=BB87_2 Depth=2
	lea	de, iy + 0
	ld	bc, -218
	lea	iy, ix + 0
	add	iy, bc
	ld	e, (iy + 0)                     ; 1-byte Folded Reload
	ld	bc, -213
	lea	iy, ix + 0
	add	iy, bc
	ld	hl, (iy + 0)
	push	hl
	pop	iy
	push	ix
	lea	ix, ix - 128
	ld	(ix - 105), de
	pop	ix
	add	iy, de
	ld	(iy), a
	ld	(iy + 1), 0
	push	hl
	call	_gfx_GetStringWidth
	pop	de
	ld	bc, -221
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	or	a, a
	sbc	hl, de
	jr	nc, .LBB87_7
; %bb.6:                                ;   in Loop: Header=BB87_2 Depth=2
	ld	de, -218
	lea	iy, ix + 0
	add	iy, de
	ld	a, (iy + 0)
	inc	a
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), a
	ld	de, -215
	lea	iy, ix + 0
	add	iy, de
	ld	c, (iy + 0)
	ld	b, (iy + 1)
	inc.sis	bc
	ld	iy, 0
	lea	hl, iy + 0
	ld	l, c
	ld	h, b
	push	ix
	lea	ix, ix - 128
	ld	de, (ix - 99)
	pop	ix
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	m, .LBB87_2
	jp	.LBB87_9
	.local	.LBB87_7
.LBB87_7:                               ;   in Loop: Header=BB87_1 Depth=1
	ld	bc, -213
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	push	de
	pop	hl
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 105
	ld	bc, (iy + 0)
	add	hl, bc
	ld	(hl), 0
	ld	bc, -215
	lea	iy, ix + 0
	add	iy, bc
	ld	l, (iy + 0)
	ld	h, (iy + 1)
	dec.sis	hl
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), l
	ld	(iy + 1), h
	ld	bc, -224
	lea	iy, ix + 0
	add	iy, bc
	ld	hl, (iy + 0)
	push	hl
	push	de
	call	_optix_AddWordWrapLine
	ld	de, -215
	lea	iy, ix + 0
	add	iy, de
	ld	c, (iy + 0)
	ld	b, (iy + 1)
	pop	hl
	pop	hl
	ld	de, -230
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	(iy + 0), 0
	ld	(ix - 107), 0
	ld	iy, 0
	jr	.LBB87_9
	.local	.LBB87_8
.LBB87_8:                               ;   in Loop: Header=BB87_1 Depth=1
	lea	de, iy + 0
	ld	bc, -218
	lea	iy, ix + 0
	add	iy, bc
	ld	e, (iy + 0)                     ; 1-byte Folded Reload
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 85
	ld	bc, (iy + 0)
	push	bc
	pop	hl
	add	hl, de
	ld	(hl), 0
	push	bc
	ld	de, -210
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_strcat
	pop	hl
	pop	hl
	ld	de, -224
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -210
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_optix_AddWordWrapLine
	pop	hl
	pop	hl
	ld	de, -230
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	(iy + 0), 0
	ld	iy, 0
	ld	(ix - 107), 0
	ld	de, -215
	lea	hl, ix + 0
	add	hl, de
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	dec	hl
	.local	.LBB87_9
.LBB87_9:                               ; %.loopexit
                                        ;   in Loop: Header=BB87_1 Depth=1
	lea	de, iy + 0
	ld	e, c
	ld	d, b
	ld	hl, (ix + 6)
	add	hl, de
	ld	a, (hl)
	cp	a, 96
	ld	de, -215
	lea	hl, ix + 0
	push	af
	add	hl, de
	pop	af
	ld	(hl), c
	inc	hl
	ld	(hl), b
	dec	hl
	jr	nz, .LBB87_11
; %bb.10:                               ;   in Loop: Header=BB87_1 Depth=1
	ld	de, -213
	lea	hl, ix + 0
	add	hl, de
	ld	bc, (hl)
	ld	de, -218
	lea	hl, ix + 0
	add	hl, de
	ld	a, (hl)                         ; 1-byte Folded Reload
	jr	.LBB87_12
	.local	.LBB87_11
.LBB87_11:                              ;   in Loop: Header=BB87_1 Depth=1
	lea	de, iy + 0
	ld	bc, -218
	lea	hl, ix + 0
	add	hl, bc
	ld	a, (hl)                         ; 1-byte Folded Reload
	ld	e, a
	inc	a
	push	ix
	lea	ix, ix - 128
	ld	bc, (ix - 85)
	pop	ix
	push	bc
	pop	hl
	add	hl, de
	ld	(hl), 32
	.local	.LBB87_12
.LBB87_12:                              ;   in Loop: Header=BB87_1 Depth=1
	lea	de, iy + 0
	ld	e, a
	push	bc
	pop	hl
	add	hl, de
	ld	(hl), 0
	push	bc
	call	_gfx_GetStringWidth
	ld	de, -218
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	pop	hl
	ld	de, -210
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_gfx_GetStringWidth
	pop	de
	ld	bc, -218
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	add	hl, de
	ex	de, hl
	ld	bc, -221
	lea	iy, ix + 0
	add	iy, bc
	ld	hl, (iy + 0)
	or	a, a
	sbc	hl, de
	jr	nc, .LBB87_14
; %bb.13:                               ;   in Loop: Header=BB87_1 Depth=1
	ld	de, -224
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -210
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_optix_AddWordWrapLine
	pop	hl
	pop	hl
	ld	de, -213
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -210
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_strcpy
	jr	.LBB87_15
	.local	.LBB87_14
.LBB87_14:                              ;   in Loop: Header=BB87_1 Depth=1
	ld	de, -213
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -210
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_strcat
	.local	.LBB87_15
.LBB87_15:                              ;   in Loop: Header=BB87_1 Depth=1
	pop	hl
	pop	hl
	ld	de, -215
	lea	iy, ix + 0
	add	iy, de
	ld	c, (iy + 0)
	ld	b, (iy + 1)
	inc.sis	bc
	ld	iy, 0
	lea	hl, iy + 0
	ld	l, c
	ld	h, b
	push	ix
	lea	ix, ix - 128
	ld	de, (ix - 99)
	pop	ix
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	m, .LBB87_1
; %bb.16:
	ld	de, -224
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -210
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_optix_AddWordWrapLine
	pop	hl
	pop	hl
	ld	a, (ix - 7)
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end87
.Lfunc_end87:
	.size	_optix_WordWrap, .Lfunc_end87-_optix_WordWrap
                                        ; -- End function
	.section	.text._optix_GetStringLength,"ax",@progbits
	.globl	_optix_GetStringLength          ; -- Begin function optix_GetStringLength
	.type	_optix_GetStringLength,@function
_optix_GetStringLength:                 ; @optix_GetStringLength
; %bb.0:
	call	__frameset0
	ld	iy, (ix + 6)
	ld	bc, 0
	.local	.LBB88_1
.LBB88_1:                               ; =>This Inner Loop Header: Depth=1
	push	bc
	pop	de
	lea	hl, iy + 0
	add	hl, de
	inc	bc
	ld	a, (hl)
	or	a, a
	jr	nz, .LBB88_1
; %bb.2:
	ex	de, hl
	pop	ix
	ret
	.local	.Lfunc_end88
.Lfunc_end88:
	.size	_optix_GetStringLength, .Lfunc_end88-_optix_GetStringLength
                                        ; -- End function
	.section	.text._optix_AddWordWrapLine,"ax",@progbits
	.globl	_optix_AddWordWrapLine          ; -- Begin function optix_AddWordWrapLine
	.type	_optix_AddWordWrapLine,@function
_optix_AddWordWrapLine:                 ; @optix_AddWordWrapLine
; %bb.0:
	ld	hl, -1
	call	__frameset
	ld	hl, (ix + 9)
	ld	bc, 201
	ld	de, (_optix_wordwraptext)
	ld	a, (hl)
	or	a, a
	sbc	hl, hl
	ld	l, a
	call	__imulu
	add	hl, bc
	push	hl
	push	de
	call	_realloc
	ex	de, hl
	pop	hl
	pop	hl
	ld	(_optix_wordwraptext), de
	push	de
	pop	iy
	sbc	hl, hl
	adc	hl, de
	jr	z, .LBB89_2
; %bb.1:
	ld	de, (ix + 6)
	ld	hl, (ix + 9)
	ld	a, (hl)
	ld	(ix - 1), a
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	bc, 201
	call	__imulu
	push	hl
	pop	bc
	lea	hl, iy + 0
	add	hl, bc
	push	de
	push	hl
	call	_strcpy
	pop	hl
	pop	hl
	ld	a, (ix - 1)                     ; 1-byte Folded Reload
	inc	a
	ld	hl, (ix + 9)
	ld	(hl), a
	.local	.LBB89_2
.LBB89_2:
	inc	sp
	pop	ix
	ret
	.local	.Lfunc_end89
.Lfunc_end89:
	.size	_optix_AddWordWrapLine, .Lfunc_end89-_optix_AddWordWrapLine
                                        ; -- End function
	.section	.text._optix_PrintWordWrap,"ax",@progbits
	.globl	_optix_PrintWordWrap            ; -- Begin function optix_PrintWordWrap
	.type	_optix_PrintWordWrap,@function
_optix_PrintWordWrap:                   ; @optix_PrintWordWrap
; %bb.0:
	ld	hl, -240
	call	__frameset
	ld	de, -206
	lea	iy, ix + 0
	add	iy, de
	ld	de, -221
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), iy
	lea	hl, iy + 0
	ld	de, -218
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	or	a, a
	sbc	hl, hl
	push	hl
	call	_optix_CusText
	pop	hl
	ld	de, 0
	push	de
	pop	hl
	ld	l, (ix + 21)
	ld	bc, -209
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), hl
	dec	hl
	ld	bc, -224
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), hl
	push	de
	pop	hl
	ld	l, (ix + 18)
	ld	bc, -215
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), hl
	push	de
	pop	hl
	ld	l, (ix + 9)
	push	de
	pop	iy
	push	af
	ld	a, (ix + 12)
	ld	iyl, a
	pop	af
	push	de
	pop	bc
	ld	c, (ix + 15)
	push	ix
	lea	ix, ix - 128
	ld	(ix - 84), bc
	pop	ix
	ld	de, (ix + 6)
	ld	a, d
                                        ; kill: def $e killed $e killed $ude
	srl	a
	rr	e
	ld	c, e
	ld	b, a
	ld	de, 0
	ld	e, c
	ld	d, b
	push	ix
	lea	ix, ix - 128
	ld	(ix - 99), hl
	pop	ix
	add	hl, de
	push	ix
	lea	ix, ix - 128
	ld	(ix - 105), hl
	pop	ix
	ld	bc, -209
	lea	hl, ix + 0
	add	hl, bc
	ld	de, (hl)
	ld	bc, -230
	lea	hl, ix + 0
	add	hl, bc
	ld	(hl), iy
	push	ix
	lea	ix, ix - 128
	ld	bc, (ix - 84)
	pop	ix
	add	iy, bc
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 87)
	pop	ix
	ld	bc, 201
	call	__imulu
	xor	a, a
	.local	.LBB90_1
.LBB90_1:                               ; =>This Inner Loop Header: Depth=1
	push	hl
	pop	bc
	sbc	hl, hl
	adc	hl, de
	jp	z, .LBB90_9
; %bb.2:                                ;   in Loop: Header=BB90_1 Depth=1
	ld	l, (ix + 21)
	cp	a, l
	jp	nc, .LBB90_9
; %bb.3:                                ;   in Loop: Header=BB90_1 Depth=1
	push	ix
	lea	ix, ix - 128
	ld	(ix - 108), iy
	pop	ix
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 81
	ld	(iy + 0), de
	or	a, a
	sbc	hl, hl
	ld	de, -237
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), a                     ; 1-byte Folded Spill
	ld	l, a
	ld	de, -215
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	ld	hl, (_optix_wordwraptext)
	ld	de, -240
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), bc
	add	hl, bc
	push	hl
	ld	de, -218
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_strcpy
	pop	hl
	pop	hl
	ld	de, -221
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	a, (iy + 0)
	ld	de, -215
	lea	iy, ix + 0
	add	iy, de
	cp	a, 126
	jp	nz, .LBB90_6
; %bb.4:                                ;   in Loop: Header=BB90_1 Depth=1
	ld	hl, (iy + 0)
	ld	bc, -224
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	p, .LBB90_7
; %bb.5:                                ;   in Loop: Header=BB90_1 Depth=1
	ld	de, -221
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	(iy + 0), 32
	ld	hl, 2
	push	hl
	push	hl
	call	_gfx_SetTextScale
	pop	hl
	pop	hl
	ld	de, -218
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_gfx_GetStringWidth
	pop	de
	ld	de, 4
	add	hl, de
	call	__ishru_1
	ex	de, hl
	ld	bc, -233
	lea	iy, ix + 0
	add	iy, bc
	ld	hl, (iy + 0)
	or	a, a
	sbc	hl, de
	push	hl
	pop	iy
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 87)
	pop	ix
	push	ix
	lea	ix, ix - 128
	ld	bc, (ix - 84)
	pop	ix
	call	__imulu
	push	hl
	pop	bc
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 108)
	pop	ix
	add	hl, bc
	ld	bc, -9
	add	hl, bc
	push	hl
	push	iy
	ld	de, -218
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 1
	push	hl
	push	hl
	call	_gfx_SetTextScale
	ld	de, -236
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	pop	hl
	pop	hl
	dec	de
	lea	hl, ix + 0
	add	hl, de
	ld	a, (hl)                         ; 1-byte Folded Reload
	inc	a
	jr	.LBB90_8
	.local	.LBB90_6
.LBB90_6:                               ;   in Loop: Header=BB90_1 Depth=1
	ld	hl, (iy + 0)
	ld	de, -212
	lea	iy, ix + 0
	add	iy, de
	ld	bc, (iy + 0)
	call	__imulu
	ld	bc, -230
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	add	hl, de
	push	hl
	ld	de, -227
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -218
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	.local	.LBB90_7
.LBB90_7:                               ;   in Loop: Header=BB90_1 Depth=1
	ld	de, -237
	lea	iy, ix + 0
	add	iy, de
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	inc	de
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	.local	.LBB90_8
.LBB90_8:                               ;   in Loop: Header=BB90_1 Depth=1
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 112)
	pop	ix
	inc	a
	ld	de, 201
	add	hl, de
	push	ix
	lea	ix, ix - 128
	ld	de, (ix - 81)
	pop	ix
	dec	de
	jp	.LBB90_1
	.local	.LBB90_9
.LBB90_9:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end90
.Lfunc_end90:
	.size	_optix_PrintWordWrap, .Lfunc_end90-_optix_PrintWordWrap
                                        ; -- End function
	.section	.text._optix_Message,"ax",@progbits
	.globl	_optix_Message                  ; -- Begin function optix_Message
	.type	_optix_Message,@function
_optix_Message:                         ; @optix_Message
; %bb.0:
	ld	hl, -48
	call	__frameset
	ld	hl, (ix + 9)
	ld	bc, (ix + 15)
	ld.sis	de, 32
	ld	(ix - 2), e
	ld	(ix - 1), d
	push	bc
	push	hl
	call	_optix_WordWrap
	pop	hl
	pop	hl
	ld	l, (ix + 18)
	cp	a, l
	ld	(ix - 12), a                    ; 1-byte Folded Spill
	ld	iyl, a
	jr	c, .LBB91_2
; %bb.1:
	push	af
	ld	a, (ix + 18)
	ld	iyl, a
	pop	af
	.local	.LBB91_2
.LBB91_2:
	lea	hl, ix - 2
	ld	(ix - 33), hl
	ld	de, 0
	push	de
	pop	bc
	ld	hl, (ix + 15)
	ld	c, l
	ld	b, h
	ld	(ix - 15), bc
	push	bc
	pop	hl
	ld	bc, 6
	add	hl, bc
	ld	(ix - 5), hl
	push	de
	pop	hl
	ld	(ix - 30), iy
	ex	de, hl
	ld	e, iyl
	ex	de, hl
	push	de
	pop	bc
	ld	c, (ix + 12)
	ld	(ix - 11), hl
	call	__imulu
	ld	(ix - 8), hl
	ld	de, 18
	add	hl, de
	ld	(ix - 21), hl
	.local	.LBB91_3
.LBB91_3:                               ; =>This Inner Loop Header: Depth=1
	call	_kb_AnyKey
	or	a, a
	jr	z, .LBB91_5
; %bb.4:                                ;   in Loop: Header=BB91_3 Depth=1
	call	_kb_Scan
	jr	.LBB91_3
	.local	.LBB91_5
.LBB91_5:
	ld	hl, (ix - 5)
	call	__ishru_1
	ld	(ix - 18), hl
	ld	hl, (ix - 21)
	call	__ishru_1
	push	hl
	pop	iy
	ld	(ix - 24), iy
	ld	bc, 0
	ld	c, (ix - 12)                    ; 1-byte Folded Reload
	ld	hl, 160
	ld	de, (ix - 18)
	or	a, a
	sbc	hl, de
	ld	(ix - 21), hl
	ld	hl, 120
	lea	de, iy + 0
	or	a, a
	sbc	hl, de
	push	hl
	pop	iy
	push	bc
	pop	hl
	ld	bc, (ix - 11)
	or	a, a
	sbc	hl, bc
	ld	(ix - 48), hl
	ld	hl, (ix - 21)
	ld	bc, 255
	call	__iand
	ld	(ix - 11), hl
	lea	hl, iy + 0
	call	__iand
	push	hl
	pop	bc
	ld	de, 12
	add	hl, de
	ld	(ix - 21), hl
	ld	hl, (ix - 8)
	ld	de, 6
	add	hl, de
	ld	(ix - 8), hl
	ld	(ix - 36), bc
	push	bc
	pop	hl
	ld	de, 3
	add	hl, de
	ld	(ix - 27), hl
	ld	hl, (ix - 15)
	ld	bc, (ix - 11)
	add	hl, bc
	add	hl, de
	ld	(ix - 15), hl
	ld	a, -90
	ld	hl, (ix - 18)
	sub	a, l
	ld	l, a
	ld	(ix - 39), hl
	ld	a, -120
	ld	hl, (ix - 24)
	sub	a, l
	ld	l, a
	ld	(ix - 42), hl
	ld	l, (ix + 12)
	ld	(ix - 45), hl
	xor	a, a
	ld	l, a
	ld	(ix - 18), hl
	inc	a
	ld	(ix - 24), a                    ; 1-byte Folded Spill
	.local	.LBB91_6
.LBB91_6:                               ; =>This Inner Loop Header: Depth=1
	ld	hl, -720868
	push	de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, e
	ld	h, d
	pop	de
	ld.sis	bc, 1
	call	__sand
	bit	0, l
	jp	nz, .LBB91_33
; %bb.7:                                ;   in Loop: Header=BB91_6 Depth=1
	call	_kb_Scan
	ld	a, (ix + 18)
	ld	l, (ix - 12)
	cp	a, l
	jp	nc, .LBB91_23
; %bb.8:                                ;   in Loop: Header=BB91_6 Depth=1
	ld	hl, -720866
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	iy, (ix - 18)
	ld	a, iyl
	or	a, a
	ld	l, -1
	jr	nz, .LBB91_10
; %bb.9:                                ;   in Loop: Header=BB91_6 Depth=1
	ld	l, 0
	.local	.LBB91_10
.LBB91_10:                              ;   in Loop: Header=BB91_6 Depth=1
	ld	a, e
	bit	3, a
	ld	a, -1
	ld	c, 0
	jr	nz, .LBB91_12
; %bb.11:                               ;   in Loop: Header=BB91_6 Depth=1
	ld	a, 0
	.local	.LBB91_12
.LBB91_12:                              ;   in Loop: Header=BB91_6 Depth=1
	and	a, l
	ld	e, a
	bit	0, e
	ld	h, (ix - 24)                    ; 1-byte Folded Reload
	jr	nz, .LBB91_14
; %bb.13:                               ;   in Loop: Header=BB91_6 Depth=1
	ld	l, c
	jr	.LBB91_15
	.local	.LBB91_14
.LBB91_14:                              ;   in Loop: Header=BB91_6 Depth=1
	ld	l, 1
	ld	a, h
	and	a, l
	ld	l, a
	.local	.LBB91_15
.LBB91_15:                              ;   in Loop: Header=BB91_6 Depth=1
	ld	a, e
	and	a, h
	ld	e, a
	bit	0, e
	ld	e, c
	jr	nz, .LBB91_17
; %bb.16:                               ;   in Loop: Header=BB91_6 Depth=1
	ld	e, h
	.local	.LBB91_17
.LBB91_17:                              ;   in Loop: Header=BB91_6 Depth=1
	ld	a, iyl
	sub	a, l
	ld	d, a
	ld	hl, -720866
	push	de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, e
	ld	h, d
	pop	de
	ld.sis	bc, 1
	call	__sand
	bit	0, l
	jr	z, .LBB91_22
; %bb.18:                               ;   in Loop: Header=BB91_6 Depth=1
	or	a, a
	sbc	hl, hl
	ld	l, d
	ld	bc, (ix - 48)
	sbc	hl, bc
	call	pe, __setflag
	jp	p, .LBB91_22
; %bb.19:                               ;   in Loop: Header=BB91_6 Depth=1
	bit	0, e
	ld	a, 0
	jr	nz, .LBB91_21
; %bb.20:                               ;   in Loop: Header=BB91_6 Depth=1
	ld	a, e
	.local	.LBB91_21
.LBB91_21:                              ;   in Loop: Header=BB91_6 Depth=1
	ld	(ix - 24), a
	ld	l, 1
	ld	a, e
	and	a, l
	ld	l, a
	ld	a, l
	add	a, d
	ld	l, a
	ld	(ix - 18), hl
	jr	.LBB91_23
	.local	.LBB91_22
.LBB91_22:                              ;   in Loop: Header=BB91_6 Depth=1
	ld	l, d
	ld	(ix - 18), hl
	ld	(ix - 24), e                    ; 1-byte Folded Spill
	.local	.LBB91_23
.LBB91_23:                              ;   in Loop: Header=BB91_6 Depth=1
	call	_kb_AnyKey
	or	a, a
	ld	a, 1
	jr	z, .LBB91_25
; %bb.24:                               ;   in Loop: Header=BB91_6 Depth=1
	ld	a, (ix - 24)                    ; 1-byte Folded Reload
	.local	.LBB91_25
.LBB91_25:                              ;   in Loop: Header=BB91_6 Depth=1
	ld	(ix - 24), a
	ld	a, (_optix_guicolors+1)
	ld	l, a
	push	hl
	call	_gfx_SetColor
	pop	hl
	ld	hl, (ix - 8)
	push	hl
	ld	hl, (ix - 5)
	push	hl
	ld	hl, (ix - 21)
	push	hl
	ld	hl, (ix - 11)
	push	hl
	call	_gfx_FillRectangle
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	a, (_optix_guicolors+2)
	ld	l, a
	push	hl
	call	_gfx_SetColor
	pop	hl
	ld	hl, (ix - 8)
	push	hl
	ld	hl, (ix - 5)
	push	hl
	ld	hl, (ix - 21)
	push	hl
	ld	hl, (ix - 11)
	push	hl
	call	_gfx_Rectangle
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 12
	push	hl
	ld	hl, (ix - 5)
	push	hl
	ld	hl, (ix - 36)
	push	hl
	ld	hl, (ix - 11)
	push	hl
	call	_gfx_FillRectangle
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 1
	push	hl
	call	_optix_CusText
	pop	hl
	ld	hl, (ix + 6)
	push	hl
	call	_gfx_GetStringWidth
	pop	de
	call	__ishru_1
	ex	de, hl
	ld	hl, 160
	or	a, a
	sbc	hl, de
	ld	de, (ix - 27)
	push	de
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	a, (ix + 18)
	ld	l, (ix - 12)
	cp	a, l
	jr	nc, .LBB91_32
; %bb.26:                               ;   in Loop: Header=BB91_6 Depth=1
	ld	de, (ix - 18)
	ld	a, e
	or	a, a
	jr	nz, .LBB91_28
; %bb.27:                               ;   in Loop: Header=BB91_6 Depth=1
	ld	(ix - 2), 25
	jr	.LBB91_31
	.local	.LBB91_28
.LBB91_28:                              ;   in Loop: Header=BB91_6 Depth=1
	or	a, a
	sbc	hl, hl
	ld	l, e
	ld	de, (ix - 48)
	sbc	hl, de
	call	pe, __setflag
	jp	p, .LBB91_30
; %bb.29:                               ;   in Loop: Header=BB91_6 Depth=1
	ld	(ix - 2), 18
	jr	.LBB91_31
	.local	.LBB91_30
.LBB91_30:                              ;   in Loop: Header=BB91_6 Depth=1
	ld	(ix - 2), 24
	.local	.LBB91_31
.LBB91_31:                              ;   in Loop: Header=BB91_6 Depth=1
	ld	hl, (ix - 33)
	push	hl
	call	_gfx_GetStringWidth
	ex	de, hl
	pop	hl
	ld	hl, (ix - 15)
	or	a, a
	sbc	hl, de
	ld	de, (ix - 27)
	push	de
	push	hl
	ld	hl, (ix - 33)
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	.local	.LBB91_32
.LBB91_32:                              ;   in Loop: Header=BB91_6 Depth=1
	ld	hl, (ix - 30)
	push	hl
	ld	hl, (ix - 18)
	push	hl
	ld	hl, (ix - 45)
	push	hl
	ld	hl, (ix - 42)
	push	hl
	ld	hl, (ix - 39)
	push	hl
	ld	hl, (ix + 15)
	push	hl
	call	_optix_PrintWordWrap
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	call	_gfx_SwapDraw
	jp	.LBB91_6
	.local	.LBB91_33
.LBB91_33:                              ; %.preheader
                                        ; =>This Inner Loop Header: Depth=1
	call	_kb_AnyKey
	or	a, a
	jr	z, .LBB91_35
; %bb.34:                               ;   in Loop: Header=BB91_33 Depth=1
	call	_kb_Scan
	jr	.LBB91_33
	.local	.LBB91_35
.LBB91_35:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end91
.Lfunc_end91:
	.size	_optix_Message, .Lfunc_end91-_optix_Message
                                        ; -- End function
	.section	.text._optix_Menu,"ax",@progbits
	.globl	_optix_Menu                     ; -- Begin function optix_Menu
	.type	_optix_Menu,@function
_optix_Menu:                            ; @optix_Menu
; %bb.0:
	ld	hl, -39
	call	__frameset
	ld	de, (ix + 9)
	ld.sis	hl, 32
	ld	(ix - 2), l
	ld	(ix - 1), h
	push	hl
	push	de
	or	a, a
	sbc	hl, hl
	push	hl
	push	hl
	push	hl
	push	hl
	push	hl
	push	hl
	push	hl
	push	hl
	call	_optix_AddMenu
	ld	hl, 30
	add	hl, sp
	ld	sp, hl
	ld	l, (ix + 18)
	cp	a, l
	ld	(ix - 21), a                    ; 1-byte Folded Spill
	ld	l, a
	jr	c, .LBB92_2
; %bb.1:
	ld	l, (ix + 18)
	.local	.LBB92_2
.LBB92_2:
	ld	(ix - 33), hl
	lea	de, ix - 2
	ld	(ix - 24), de
	call	_optix_DeleteLastMenu
	ld	iy, (ix + 15)
	ld	a, iyh
	ex	de, hl
	ld	e, iyl
	ex	de, hl
	srl	a
	rr	l
                                        ; kill: def $l killed $l def $hl
	ld	h, a
                                        ; kill: def $l killed $l killed $hl
	ld	a, -96
	sub	a, l
	ld	iyh, a
	ld	de, 0
	push	de
	pop	hl
	ld	bc, (ix - 33)
	ld	l, c
	push	de
	pop	bc
	push	af
	ld	a, (ix + 12)
	ld	iyl, a
	pop	af
	ld	c, iyl
	ld	(ix - 39), hl
	call	__imulu
	ld	(ix - 11), hl
	ld	bc, 12
	add	hl, bc
	call	__ishru_1
	ld	a, -124
	ld	(ix - 5), hl
	sub	a, l
	ld	l, a
	push	hl
	ld	bc, (ix + 9)
	push	bc
	ld	c, iyl
	push	bc
	ld	bc, (ix + 15)
	push	bc
	ld	bc, (ix - 33)
	push	bc
	ld	bc, 1
	push	bc
	push	de
	push	de
	push	hl
	ld	e, iyh
	ld	(ix - 30), de
	push	de
	call	_optix_AddMenu
	ld	hl, 30
	add	hl, sp
	ld	sp, hl
	ld	a, (_optix_guidata+1)
	dec	a
	ld	(ix - 8), a                     ; 1-byte Folded Spill
	ld	(_optix_guidata), a
	ld	hl, (_optix_menu)
	ld	(ix - 17), hl
	.local	.LBB92_3
.LBB92_3:                               ; =>This Inner Loop Header: Depth=1
	call	_kb_AnyKey
	or	a, a
	jr	z, .LBB92_5
; %bb.4:                                ;   in Loop: Header=BB92_3 Depth=1
	call	_kb_Scan
	jr	.LBB92_3
	.local	.LBB92_5
.LBB92_5:
	or	a, a
	sbc	hl, hl
	push	hl
	pop	de
	ld	e, (ix - 8)                     ; 1-byte Folded Reload
	push	hl
	pop	bc
	ld	hl, (ix + 15)
	ld	c, l
	ld	b, h
	ld	(ix - 36), bc
	ld	hl, 120
	ld	bc, (ix - 5)
	sbc	hl, bc
	ld	bc, 255
	call	__iand
	ld	(ix - 20), hl
	ld	bc, 20
	ex	de, hl
	call	__imulu
	ex	de, hl
	ld	hl, (ix - 17)
	add	hl, de
	ld	(ix - 17), hl
	ld	iy, (ix - 30)
	lea	hl, iy + 0
	dec	hl
	ld	(ix - 5), hl
	ld	bc, (ix - 20)
	push	bc
	pop	hl
	ld	de, 11
	add	hl, de
	ld	(ix - 14), hl
	ld	hl, (ix - 36)
	ld	de, 2
	add	hl, de
	ld	(ix - 8), hl
	ld	hl, (ix - 11)
	add	hl, de
	ld	(ix - 11), hl
	push	bc
	pop	hl
	dec	hl
	ld	(ix - 27), hl
	push	bc
	pop	hl
	add	hl, de
	ld	(ix - 20), hl
	ld	de, (ix - 36)
	add	iy, de
	ld	(ix - 30), iy
	.local	.LBB92_6
.LBB92_6:                               ; =>This Inner Loop Header: Depth=1
	ld	iy, (ix - 17)
	bit	0, (iy + 15)
	jr	z, .LBB92_9
; %bb.7:                                ;   in Loop: Header=BB92_6 Depth=1
	ld	hl, -720868
	push	de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, e
	ld	h, d
	pop	de
	ld.sis	bc, 1
	call	__sand
	bit	0, l
	jr	nz, .LBB92_9
; %bb.8:                                ;   in Loop: Header=BB92_6 Depth=1
	ld	hl, -720878
	push	de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, e
	ld	h, d
	pop	de
	ld	a, l
	bit	5, a
	jp	z, .LBB92_18
	.local	.LBB92_9
.LBB92_9:                               ;   in Loop: Header=BB92_6 Depth=1
	call	_optix_UpdateCurrMenu
	ld	a, (_optix_guicolors+1)
	ld	l, a
	push	hl
	call	_gfx_SetColor
	pop	hl
	ld	hl, (ix - 11)
	push	hl
	ld	hl, (ix - 8)
	push	hl
	ld	hl, (ix - 14)
	push	hl
	ld	hl, (ix - 5)
	push	hl
	call	_gfx_FillRectangle
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	a, (_optix_guicolors+2)
	ld	l, a
	push	hl
	call	_gfx_SetColor
	pop	hl
	ld	hl, (ix - 11)
	push	hl
	ld	hl, (ix - 8)
	push	hl
	ld	hl, (ix - 14)
	push	hl
	ld	hl, (ix - 5)
	push	hl
	call	_gfx_Rectangle
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 12
	push	hl
	ld	hl, (ix - 8)
	push	hl
	ld	hl, (ix - 27)
	push	hl
	ld	hl, (ix - 5)
	push	hl
	call	_gfx_FillRectangle
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 1
	push	hl
	call	_optix_CusText
	pop	hl
	ld	hl, (ix + 6)
	push	hl
	call	_gfx_GetStringWidth
	pop	de
	call	__ishru_1
	ex	de, hl
	ld	hl, 160
	or	a, a
	sbc	hl, de
	ld	de, (ix - 20)
	push	de
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	a, (ix + 18)
	ld	l, (ix - 21)
	cp	a, l
	jr	nc, .LBB92_17
; %bb.10:                               ;   in Loop: Header=BB92_6 Depth=1
	ld	iy, (ix - 17)
	ld	l, (iy + 16)
	ld	a, l
	or	a, a
	jr	nz, .LBB92_13
; %bb.11:                               ;   in Loop: Header=BB92_6 Depth=1
	ld	l, (iy + 14)
	ld	de, (ix - 33)
	ld	a, e
	cp	a, l
	jr	nc, .LBB92_16
; %bb.12:                               ;   in Loop: Header=BB92_6 Depth=1
	ld	(ix - 2), 25
	jr	.LBB92_16
	.local	.LBB92_13
.LBB92_13:                              ;   in Loop: Header=BB92_6 Depth=1
	ld	bc, 0
	push	bc
	pop	de
	ld	e, l
	ld	a, (iy + 14)
	push	bc
	pop	hl
	ld	l, a
	ld	bc, (ix - 39)
	or	a, a
	sbc	hl, bc
	push	hl
	pop	bc
	ex	de, hl
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	jp	p, .LBB92_15
; %bb.14:                               ;   in Loop: Header=BB92_6 Depth=1
	ld	(ix - 2), 18
	jr	.LBB92_16
	.local	.LBB92_15
.LBB92_15:                              ;   in Loop: Header=BB92_6 Depth=1
	ld	(ix - 2), 24
	.local	.LBB92_16
.LBB92_16:                              ;   in Loop: Header=BB92_6 Depth=1
	ld	hl, (ix - 24)
	push	hl
	call	_gfx_GetStringWidth
	ex	de, hl
	pop	hl
	ld	hl, (ix - 30)
	or	a, a
	sbc	hl, de
	ld	de, (ix - 20)
	push	de
	push	hl
	ld	hl, (ix - 24)
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	.local	.LBB92_17
.LBB92_17:                              ;   in Loop: Header=BB92_6 Depth=1
	ld	a, (_optix_guidata)
	ld	l, a
	push	hl
	call	_optix_RenderMenu
	pop	hl
	call	_gfx_SwapDraw
	jp	.LBB92_6
	.local	.LBB92_18
.LBB92_18:
	ld	a, (iy + 12)
	ld	(ix - 5), a
	call	_optix_DeleteLastMenu
	ld	a, (ix - 5)                     ; 1-byte Folded Reload
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end92
.Lfunc_end92:
	.size	_optix_Menu, .Lfunc_end92-_optix_Menu
                                        ; -- End function
	.section	.text._optix_AddMenu,"ax",@progbits
	.globl	_optix_AddMenu                  ; -- Begin function optix_AddMenu
	.type	_optix_AddMenu,@function
_optix_AddMenu:                         ; @optix_AddMenu
; %bb.0:
	ld	hl, -121
	call	__frameset
	ld.sis	hl, 0
	ld	(ix - 102), l
	ld	(ix - 101), h
	lea	iy, ix - 100
	ld	(ix - 109), iy
	lea	hl, iy + 2
	ld	(ix - 98), 0
	push	hl
	pop	de
	inc	de
	ld	bc, 97
	ldir
	ld	de, (_optix_menu)
	ld	hl, _optix_guidata+1
	inc	(hl)
	ld	a, (hl)
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	bc, 20
	call	__imulu
	push	hl
	push	de
	call	_realloc
	push	hl
	pop	iy
	pop	hl
	pop	hl
	ld	(_optix_menu), iy
	ld	a, (_optix_guidata+1)
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	bc, 20
	call	__imulu
	ex	de, hl
	add	iy, de
	ld	a, (ix + 18)
	ld	(iy - 15), a
	ld	a, (ix + 21)
	ld	(iy - 14), a
	ld	a, (ix + 24)
	ld	(iy - 13), a
	ld	a, (ix + 27)
	ld	(iy - 12), a
	ld	(iy - 4), b
	ld	hl, (ix + 6)
	ld	(iy - 20), l
	ld	(iy - 19), h
	ld	a, (ix + 9)
	ld	(iy - 18), a
	ld	a, (ix + 12)
	ld	(iy - 17), a
	ld	a, (ix + 15)
	ld	(iy - 16), a
	ld	(iy - 5), b
	ld	(iy - 8), b
	or	a, a
	sbc	hl, hl
	ld	(ix - 105), hl
	ld	(ix - 112), iy
	ld	(iy - 11), hl
	ld	hl, (ix + 30)
	push	hl
	call	_optix_GetStringLength
	ex	de, hl
	pop	hl
	xor	a, a
	ld	(ix - 106), a                   ; 1-byte Folded Spill
	.local	.LBB93_1
.LBB93_1:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB93_3 Depth 2
	ld	iy, 0
	lea	hl, iy + 0
	ld	c, (ix - 102)
	ld	b, (ix - 101)
	ld	l, c
	ld	h, b
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	p, .LBB93_7
; %bb.2:                                ;   in Loop: Header=BB93_1 Depth=1
	ld	(ix - 115), de
	ld.sis	hl, 32
	ld	(ix - 100), l
	ld	(ix - 99), h
	ld	e, h
	ld	a, e
	.local	.LBB93_3
.LBB93_3:                               ;   Parent Loop BB93_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ld	(ix - 118), a
	lea	de, iy + 0
	ld	e, c
	ld	d, b
	ld	hl, (ix + 30)
	add	hl, de
	ld	a, (hl)
	cp	a, 96
	jr	z, .LBB93_5
; %bb.4:                                ;   in Loop: Header=BB93_3 Depth=2
	lea	de, iy + 0
	ld	l, (ix - 118)                   ; 1-byte Folded Reload
	ld	e, l
	ld	(ix - 102), c
	ld	(ix - 101), b
	lea	bc, iy + 0
	ld	iy, (ix - 109)
	add	iy, de
	ld	(iy), a
	ld	a, l
	push	bc
	pop	iy
	ld	c, (ix - 102)
	ld	b, (ix - 101)
	inc	a
	inc.sis	bc
	lea	de, iy + 0
	ld	e, c
	ld	d, b
	ld	hl, (ix - 115)
	or	a, a
	sbc	hl, de
	jr	nc, .LBB93_3
	jr	.LBB93_6
	.local	.LBB93_5
.LBB93_5:                               ;   in Loop: Header=BB93_1 Depth=1
	ld	a, (ix - 118)                   ; 1-byte Folded Reload
	.local	.LBB93_6
.LBB93_6:                               ;   in Loop: Header=BB93_1 Depth=1
	inc.sis	bc
	ld	(ix - 102), c
	ld	(ix - 101), b
	lea	de, iy + 0
	ld	e, a
	ld	(ix - 121), de
	lea	hl, iy + 0
	ld	iy, (ix - 109)
	add	iy, de
	ld	(iy), 0
	ld	a, (ix - 106)                   ; 1-byte Folded Reload
	inc	a
	ld	(ix - 106), a                   ; 1-byte Folded Spill
	ld	l, a
	ld	(ix - 118), hl
	ld	de, 3
	push	de
	pop	bc
	call	__imulu
	push	hl
	ld	hl, (ix - 105)
	push	hl
	call	_realloc
	ld	(ix - 105), hl
	pop	de
	pop	de
	ld	iy, (ix - 112)
	ld	(iy - 11), hl
	ld	hl, (ix - 121)
	inc	hl
	push	hl
	call	_malloc
	ex	de, hl
	pop	hl
	ld	hl, (ix - 118)
	ld	bc, 3
	call	__imulu
	push	hl
	pop	bc
	ld	iy, (ix - 105)
	add	iy, bc
	ld	(iy - 3), de
	ld	hl, (ix - 109)
	push	hl
	push	de
	call	_strcpy
	pop	hl
	pop	hl
	ld	de, (ix - 115)
	jp	.LBB93_1
	.local	.LBB93_7
.LBB93_7:
	ld	iy, (ix - 112)
	ld	a, (ix - 106)                   ; 1-byte Folded Reload
	ld	(iy - 6), a
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end93
.Lfunc_end93:
	.size	_optix_AddMenu, .Lfunc_end93-_optix_AddMenu
                                        ; -- End function
	.section	.text._optix_DeleteLastMenu,"ax",@progbits
	.globl	_optix_DeleteLastMenu           ; -- Begin function optix_DeleteLastMenu
	.type	_optix_DeleteLastMenu,@function
_optix_DeleteLastMenu:                  ; @optix_DeleteLastMenu
; %bb.0:
	ld	hl, -9
	call	__frameset
	ld	a, (_optix_guidata+1)
	ld	e, a
	or	a, a
	jp	z, .LBB94_5
; %bb.1:
	ld	iy, (_optix_menu)
	dec	e
	ld	a, e
	ld	(_optix_guidata+1), a
	or	a, a
	sbc	hl, hl
	ld	l, e
	ld	bc, 20
	call	__imulu
	ld	bc, 0
	ex	de, hl
	add	iy, de
	ld	de, 0
	ld	(ix - 3), bc
	ld	(ix - 6), iy
	.local	.LBB94_2
.LBB94_2:                               ; =>This Inner Loop Header: Depth=1
	ld	a, (iy + 14)
	ld	e, a
	ld	iy, (iy + 9)
	ld	hl, (ix - 3)
	or	a, a
	sbc	hl, de
	jr	nc, .LBB94_4
; %bb.3:                                ;   in Loop: Header=BB94_2 Depth=1
	add	iy, bc
	ld	hl, (iy)
	push	hl
	ld	(ix - 9), bc
	call	_free
	pop	hl
	ld	hl, (ix - 3)
	inc	hl
	ld	(ix - 3), hl
	ld	hl, (ix - 9)
	ld	de, 3
	add	hl, de
	push	hl
	pop	bc
	or	a, a
	sbc	hl, hl
	ex	de, hl
	ld	iy, (ix - 6)
	jr	.LBB94_2
	.local	.LBB94_4
.LBB94_4:
	push	iy
	call	_free
	pop	hl
	ld	de, (_optix_menu)
	ld	a, (_optix_guidata+1)
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	bc, 20
	call	__imulu
	push	hl
	push	de
	call	_realloc
	pop	de
	pop	de
	ld	(_optix_menu), hl
	.local	.LBB94_5
.LBB94_5:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end94
.Lfunc_end94:
	.size	_optix_DeleteLastMenu, .Lfunc_end94-_optix_DeleteLastMenu
                                        ; -- End function
	.section	.text._optix_UpdateCurrMenu,"ax",@progbits
	.globl	_optix_UpdateCurrMenu           ; -- Begin function optix_UpdateCurrMenu
	.type	_optix_UpdateCurrMenu,@function
_optix_UpdateCurrMenu:                  ; @optix_UpdateCurrMenu
; %bb.0:
	ld	hl, -12
	call	__frameset
	ld	iy, (_optix_menu)
	ld	a, (_optix_guidata)
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	bc, 20
	call	__imulu
	ex	de, hl
	add	iy, de
	ld	(ix - 3), iy
	call	_kb_Scan
	call	_kb_AnyKey
	or	a, a
	jr	nz, .LBB95_2
; %bb.1:
	ld	a, 1
	ld	(_optix_guidata+2), a
	.local	.LBB95_2
.LBB95_2:
	ld	e, 0
	scf
	sbc	hl, hl
	ld	(ix - 6), hl
	ld	hl, -720866
	push	de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, e
	ld	h, d
	pop	de
	ld	a, l
	bit	3, a
	jr	z, .LBB95_6
; %bb.3:
	ld	a, (_optix_guidata+2)
	bit	0, a
	jr	z, .LBB95_6
; %bb.4:
	ld	iy, (ix - 3)
	ld	a, (iy + 6)
	cp	a, 2
	jr	c, .LBB95_6
; %bb.5:
	ld	iy, (ix - 3)
	ld	a, (iy + 12)
	ld	c, e
	ld	de, 0
	push	de
	pop	hl
	ld	l, a
	ld	a, (iy + 5)
	ld	e, a
	or	a, a
	sbc	hl, de
	ld	e, c
	ld	(ix - 6), hl
	ld	(_optix_guidata+2), a
	.local	.LBB95_6
.LBB95_6:
	ld	hl, -720866
	push	de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, e
	ld	h, d
	pop	de
	ld.sis	bc, 1
	call	__sand
	bit	0, l
	jr	z, .LBB95_10
; %bb.7:
	ld	a, (_optix_guidata+2)
	bit	0, a
	jr	z, .LBB95_10
; %bb.8:
	ld	iy, (ix - 3)
	ld	a, (iy + 6)
	cp	a, 2
	jr	c, .LBB95_10
; %bb.9:
	ld	iy, (ix - 3)
	ld	a, (iy + 12)
	or	a, a
	sbc	hl, hl
	ld	c, e
	push	hl
	pop	de
	ld	e, a
	ld	a, (iy + 5)
	ld	l, a
	add	hl, de
	ld	(ix - 6), hl
	ld	e, c
	ld	a, e
	ld	(_optix_guidata+2), a
	.local	.LBB95_10
.LBB95_10:
	ld	hl, -720866
	push	de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, e
	ld	h, d
	pop	de
	ld	a, l
	bit	1, a
	jr	z, .LBB95_13
; %bb.11:
	ld	a, (_optix_guidata+2)
	bit	0, a
	jr	z, .LBB95_13
; %bb.12:
	ld	iy, (ix - 3)
	ld	a, (iy + 12)
	ld	c, e
	ld	de, 0
	push	de
	pop	hl
	ld	l, a
	ld	a, (iy + 6)
	ld	e, a
	or	a, a
	sbc	hl, de
	ld	e, c
	ld	(ix - 6), hl
	ld	(_optix_guidata+2), a
	.local	.LBB95_13
.LBB95_13:
	ld	hl, -720866
	push	de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, e
	ld	h, d
	pop	de
	ld	a, l
	bit	2, a
	jr	z, .LBB95_16
; %bb.14:
	ld	a, (_optix_guidata+2)
	bit	0, a
	jr	z, .LBB95_16
; %bb.15:
	ld	iy, (ix - 3)
	ld	a, (iy + 12)
	or	a, a
	sbc	hl, hl
	ld	c, e
	push	hl
	pop	de
	ld	e, a
	ld	a, (iy + 6)
	ld	l, a
	add	hl, de
	ld	(ix - 6), hl
	ld	a, c
	ld	(_optix_guidata+2), a
	.local	.LBB95_16
.LBB95_16:
	ld	hl, -720868
	push	de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, e
	ld	h, d
	pop	de
	ld.sis	bc, 1
	call	__sand
	bit	0, l
	jr	nz, .LBB95_18
; %bb.17:
	ld	hl, -720878
	push	de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, e
	ld	h, d
	pop	de
	ld	a, l
	bit	5, a
	jr	z, .LBB95_19
	.local	.LBB95_18
.LBB95_18:
	ld	iy, (ix - 3)
	ld	(iy + 15), 1
	.local	.LBB95_19
.LBB95_19:
	ld	de, 0
	ld	hl, (ix - 6)
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	ld	bc, (ix - 3)
	jp	m, .LBB95_22
; %bb.20:
	push	bc
	pop	iy
	ld	a, (iy + 14)
	ld	de, 0
	ld	e, a
	ld	hl, (ix - 6)
	or	a, a
	sbc	hl, de
	jr	nc, .LBB95_22
; %bb.21:
	ld	hl, (ix - 6)
	ld	a, l
	push	bc
	pop	iy
	ld	(iy + 12), a
	.local	.LBB95_22
.LBB95_22:
	push	bc
	pop	iy
	ld	a, (iy + 12)
	or	a, a
	sbc	hl, hl
	push	hl
	pop	de
	ld	(ix - 11), a                    ; 1-byte Folded Spill
	ld	e, a
	ld	(ix - 10), de
	ld	a, (iy + 16)
	push	hl
	pop	de
	ld	(ix - 6), a                     ; 1-byte Folded Spill
	ld	e, a
	ld	iy, (ix - 3)
	ld	a, (iy + 5)
	push	hl
	pop	bc
	ld	(ix - 7), a                     ; 1-byte Folded Spill
	ld	c, a
	ld	iy, (ix - 3)
	ld	a, (iy + 6)
	ld	(ix - 12), a                    ; 1-byte Folded Spill
	ld	l, a
	call	__imulu
	push	hl
	pop	bc
	ex	de, hl
	add	hl, bc
	dec	hl
	ld	de, (ix - 10)
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	p, .LBB95_26
; %bb.23:
	ld	l, (ix - 6)                     ; 1-byte Folded Reload
	ld	a, (ix - 7)                     ; 1-byte Folded Reload
	cp	a, 1
	ld	e, a
	jr	z, .LBB95_25
; %bb.24:
	ld	a, (ix - 12)                    ; 1-byte Folded Reload
	cp	a, 1
	jr	nz, .LBB95_30
	.local	.LBB95_25
.LBB95_25:
	inc	l
	jr	.LBB95_33
	.local	.LBB95_26
.LBB95_26:
	ld	e, (ix - 7)                     ; 1-byte Folded Reload
	ld	a, (ix - 11)                    ; 1-byte Folded Reload
	ld	l, (ix - 6)                     ; 1-byte Folded Reload
	cp	a, l
	jr	nc, .LBB95_34
; %bb.27:
	ld	a, e
	cp	a, 1
	jr	z, .LBB95_29
; %bb.28:
	ld	a, (ix - 12)                    ; 1-byte Folded Reload
	cp	a, 1
	jr	nz, .LBB95_31
	.local	.LBB95_29
.LBB95_29:
	dec	l
	jr	.LBB95_33
	.local	.LBB95_30
.LBB95_30:
	ld	a, e
	add	a, l
	jr	.LBB95_32
	.local	.LBB95_31
.LBB95_31:
	ld	a, l
	sub	a, e
	.local	.LBB95_32
.LBB95_32:
	ld	l, a
	.local	.LBB95_33
.LBB95_33:
	ld	iy, (ix - 3)
	ld	(iy + 16), l
	.local	.LBB95_34
.LBB95_34:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end95
.Lfunc_end95:
	.size	_optix_UpdateCurrMenu, .Lfunc_end95-_optix_UpdateCurrMenu
                                        ; -- End function
	.section	.text._optix_RenderMenu,"ax",@progbits
	.globl	_optix_RenderMenu               ; -- Begin function optix_RenderMenu
	.type	_optix_RenderMenu,@function
_optix_RenderMenu:                      ; @optix_RenderMenu
; %bb.0:
	ld	hl, -25
	call	__frameset
	ld	iy, (_optix_menu)
	ld	de, 0
	push	de
	pop	hl
	ld	l, (ix + 6)
	ld	bc, 20
	call	__imulu
	push	de
	pop	bc
	ex	de, hl
	add	iy, de
	ld	a, (iy + 16)
	ld	(ix - 7), a
	or	a, a
	sbc	hl, hl
	ld	(ix - 3), iy
	.local	.LBB96_1
.LBB96_1:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB96_3 Depth 2
	ld	a, (iy + 6)
	push	bc
	pop	de
	ld	e, a
	ld	(ix - 6), hl
	or	a, a
	sbc	hl, de
	jp	nc, .LBB96_12
; %bb.2:                                ; %.preheader.preheader
                                        ;   in Loop: Header=BB96_1 Depth=1
	or	a, a
	sbc	hl, hl
	.local	.LBB96_3
.LBB96_3:                               ; %.preheader
                                        ;   Parent Loop BB96_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ld	iy, (ix - 3)
	ld	a, (iy + 5)
	push	bc
	pop	de
	ld	e, a
	ld	(ix - 10), hl
	or	a, a
	sbc	hl, de
	jp	nc, .LBB96_11
; %bb.4:                                ;   in Loop: Header=BB96_3 Depth=2
	or	a, a
	sbc	hl, hl
	ld	c, (ix - 7)                     ; 1-byte Folded Reload
	ld	l, c
	ld	(ix - 13), hl
	ld	e, (iy + 12)
	ld	a, (_optix_guidata)
	ld	l, a
	ld	a, c
	cp	a, e
	jp	nz, .LBB96_9
; %bb.5:                                ;   in Loop: Header=BB96_3 Depth=2
	ld	a, l
	ld	l, (ix + 6)
	cp	a, l
	jp	nz, .LBB96_9
; %bb.6:                                ;   in Loop: Header=BB96_3 Depth=2
	ld	iy, (ix - 3)
	ld	e, (iy + 15)
	ld	l, 1
	ld	a, e
	xor	a, l
	ld	l, a
	ld	(ix - 16), hl
	ld	a, (_optix_guicolors+3)
	ld	l, a
	ld	a, (_optix_guicolors+2)
	bit	0, e
	jr	nz, .LBB96_8
; %bb.7:                                ;   in Loop: Header=BB96_3 Depth=2
	ld	l, a
	.local	.LBB96_8
.LBB96_8:                               ;   in Loop: Header=BB96_3 Depth=2
	push	hl
	call	_gfx_SetColor
	pop	hl
	ld	hl, (ix - 16)
	push	hl
	call	_optix_CusText
	pop	hl
	ld	iy, (ix - 3)
	ld	a, (iy + 7)
	or	a, a
	sbc	hl, hl
	push	hl
	pop	bc
	ld	c, a
	ld	(ix - 16), bc
	ld	hl, (ix - 10)
	call	__imulu
	ld	de, (iy)
	ld	bc, 0
	ld	c, e
	ld	b, d
	add	hl, bc
	ld	a, (iy + 3)
	ld	de, 0
	push	de
	pop	bc
	ld	c, a
	ld	(ix - 22), bc
	add	hl, bc
	ld	(ix - 19), hl
	ld	a, (iy + 8)
	push	de
	pop	bc
	ld	c, a
	ld	hl, (ix - 6)
	call	__imulu
	ld	a, (iy + 2)
	ld	e, a
	add	hl, de
	ld	a, (iy + 4)
	ld	iy, 0
	ld	iyl, a
	lea	de, iy + 0
	add	hl, de
	ld	(ix - 25), hl
	ld	hl, (ix - 22)
	add	hl, hl
	ex	de, hl
	ld	hl, (ix - 16)
	or	a, a
	sbc	hl, de
	ld	(ix - 16), hl
	add	iy, iy
	lea	de, iy + 0
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	push	hl
	ld	hl, (ix - 16)
	push	hl
	ld	hl, (ix - 25)
	push	hl
	ld	hl, (ix - 19)
	push	hl
	call	_gfx_FillRectangle
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	a, (_optix_guicolors+8)
	ld	l, a
	push	hl
	call	_gfx_SetColor
	pop	hl
	ld	iy, (ix - 3)
	ld	a, (iy + 7)
	ld	bc, 0
	ld	c, a
	ld	(ix - 16), bc
	ld	hl, (ix - 10)
	call	__imulu
	ld	iy, (ix - 3)
	ld	de, (iy)
	ld	bc, 0
	ld	c, e
	ld	b, d
	add	hl, bc
	ld	a, (iy + 3)
	ld	de, 0
	push	de
	pop	bc
	ld	c, a
	ld	(ix - 22), bc
	add	hl, bc
	ld	(ix - 19), hl
	ld	a, (iy + 8)
	push	de
	pop	bc
	ld	c, a
	ld	hl, (ix - 6)
	call	__imulu
	ld	a, (iy + 2)
	ld	e, a
	add	hl, de
	ld	a, (iy + 4)
	ld	iy, 0
	ld	iyl, a
	lea	de, iy + 0
	add	hl, de
	ld	(ix - 25), hl
	ld	hl, (ix - 22)
	add	hl, hl
	ex	de, hl
	ld	hl, (ix - 16)
	or	a, a
	sbc	hl, de
	ld	(ix - 16), hl
	add	iy, iy
	lea	de, iy + 0
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	push	hl
	ld	hl, (ix - 16)
	push	hl
	ld	hl, (ix - 25)
	push	hl
	ld	hl, (ix - 19)
	push	hl
	call	_gfx_Rectangle
	pop	hl
	pop	hl
	pop	hl
	jr	.LBB96_10
	.local	.LBB96_9
.LBB96_9:                               ;   in Loop: Header=BB96_3 Depth=2
	or	a, a
	sbc	hl, hl
	push	hl
	call	_optix_CusText
	.local	.LBB96_10
.LBB96_10:                              ;   in Loop: Header=BB96_3 Depth=2
	pop	hl
	ld	de, (ix - 3)
	push	de
	pop	iy
	ld	iy, (iy + 9)
	ld	hl, (ix - 13)
	ld	bc, 3
	call	__imulu
	push	hl
	pop	bc
	add	iy, bc
	ld	hl, (iy)
	ld	(ix - 13), hl
	push	de
	pop	iy
	ld	hl, (iy)
	ld	de, 0
	push	de
	pop	bc
	ld	e, l
	ld	d, h
	ld	(ix - 16), de
	ld	a, (iy + 7)
	ld	c, a
	ld	hl, (ix - 10)
	call	__imulu
	ld	(ix - 19), hl
	push	bc
	pop	hl
	call	__ishru_1
	ld	(ix - 22), hl
	ld	hl, (ix - 13)
	push	hl
	call	_gfx_GetStringWidth
	pop	de
	call	__ishru_1
	ex	de, hl
	ld	bc, (ix - 16)
	ld	hl, (ix - 22)
	add	hl, bc
	ld	bc, (ix - 19)
	add	hl, bc
	or	a, a
	sbc	hl, de
	ld	(ix - 16), hl
	ld	iy, (ix - 3)
	ld	a, (iy + 2)
	ld	bc, 0
	push	bc
	pop	de
	ld	e, a
	ld	iy, (ix - 3)
	ld	a, (iy + 8)
	ld	c, a
	ld	hl, (ix - 6)
	push	bc
	pop	iy
	call	__imulu
	ld	(ix - 19), hl
	lea	hl, iy + 0
	call	__ishru_1
	push	hl
	pop	bc
	ex	de, hl
	ld	de, (ix - 19)
	add	hl, de
	add	hl, bc
	ld	de, -4
	add	hl, de
	push	hl
	ld	hl, (ix - 16)
	push	hl
	ld	hl, (ix - 13)
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	a, (ix - 7)                     ; 1-byte Folded Reload
	inc	a
	ld	iy, (ix - 3)
	ld	l, (iy + 14)
	ld	de, (ix - 10)
	inc	de
	ld	(ix - 7), a                     ; 1-byte Folded Spill
	cp	a, l
	ex	de, hl
	ld	bc, 0
	jp	nz, .LBB96_3
	.local	.LBB96_11
.LBB96_11:                              ;   in Loop: Header=BB96_1 Depth=1
	ld	hl, (ix - 6)
	inc	hl
	ld	iy, (ix - 3)
	jp	.LBB96_1
	.local	.LBB96_12
.LBB96_12:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end96
.Lfunc_end96:
	.size	_optix_RenderMenu, .Lfunc_end96-_optix_RenderMenu
                                        ; -- End function
	.section	.text._optix_InsertSpecialCharacter,"ax",@progbits
	.globl	_optix_InsertSpecialCharacter   ; -- Begin function optix_InsertSpecialCharacter
	.type	_optix_InsertSpecialCharacter,@function
_optix_InsertSpecialCharacter:          ; @optix_InsertSpecialCharacter
; %bb.0:
	ld	hl, -29
	call	__frameset
	or	a, a
	sbc	hl, hl
	push	hl
	call	_optix_CusText
	pop	hl
	or	a, a
	sbc	hl, hl
	push	hl
	call	_gfx_Blit
	ld.sis	bc, 1
	ld	iy, -720868
	pop	hl
	xor	a, a
	ld	l, a
	ld	(ix - 3), hl
	ld	e, a
                                        ; implicit-def: $l
                                        ; kill: killed $l
	.local	.LBB97_1
.LBB97_1:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB97_24 Depth 2
                                        ;       Child Loop BB97_26 Depth 3
	ld	l, (iy)
	ld	h, (iy + 1)
	call	__sand
	bit	0, l
	jp	nz, .LBB97_34
; %bb.2:                                ;   in Loop: Header=BB97_1 Depth=1
	ld	(ix - 6), a                     ; 1-byte Folded Spill
	ld	hl, -720878
	push	de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, e
	ld	h, d
	pop	de
	ld	a, l
	bit	5, a
	jp	nz, .LBB97_33
; %bb.3:                                ;   in Loop: Header=BB97_1 Depth=1
	ld	(ix - 9), e                     ; 1-byte Folded Spill
	ld	a, (_optix_guicolors)
	ld	l, a
	push	hl
	call	_gfx_FillScreen
	pop	hl
	call	_kb_Scan
	ld	iyh, 0
	ld	iyl, -1
	ld	hl, -720866
	push	de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, e
	ld	h, d
	pop	de
	ld	a, l
	bit	3, a
	ex	de, hl
	ld	e, iyl
	ex	de, hl
	jr	nz, .LBB97_5
; %bb.4:                                ;   in Loop: Header=BB97_1 Depth=1
	ex	de, hl
	ld	e, iyh
	ex	de, hl
	.local	.LBB97_5
.LBB97_5:                               ;   in Loop: Header=BB97_1 Depth=1
	ld	a, (ix - 6)                     ; 1-byte Folded Reload
	or	a, a
	ld	e, iyl
	ld	c, (ix - 12)                    ; 1-byte Folded Reload
	jr	nz, .LBB97_7
; %bb.6:                                ;   in Loop: Header=BB97_1 Depth=1
	ld	e, iyh
	.local	.LBB97_7
.LBB97_7:                               ;   in Loop: Header=BB97_1 Depth=1
	ld	a, l
	and	a, c
	ld	l, a
	ld	a, l
	and	a, e
	ld	l, a
	ld	b, 7
	call	__bshl
	rlc	a
	sbc	a, a
	ld	e, a
	bit	0, l
	ld	d, 0
	jr	nz, .LBB97_9
; %bb.8:                                ;   in Loop: Header=BB97_1 Depth=1
	ld	d, c
	.local	.LBB97_9
.LBB97_9:                               ;   in Loop: Header=BB97_1 Depth=1
	ld	a, (ix - 6)
	add	a, e
	ld	e, a
	ld	hl, -720866
	push	de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, e
	ld	h, d
	pop	de
	ld.sis	bc, 1
	call	__sand
	ld	a, l
	and	a, d
	ld	l, a
	ld	(ix - 3), e                     ; 1-byte Folded Spill
	ld	a, e
	cp	a, 7
                                        ; kill: def $a killed $a
	sbc	a, a
	ld	c, a
	ld	a, l
	and	a, c
	ld	l, a
	ld	(ix - 6), l                     ; 1-byte Folded Spill
	bit	0, l
	ld	c, b
	jr	nz, .LBB97_11
; %bb.10:                               ;   in Loop: Header=BB97_1 Depth=1
	ld	c, d
	.local	.LBB97_11
.LBB97_11:                              ;   in Loop: Header=BB97_1 Depth=1
	ld	hl, -720866
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, e
	bit	1, a
	ex	de, hl
	ld	e, iyl
	ex	de, hl
	jr	nz, .LBB97_13
; %bb.12:                               ;   in Loop: Header=BB97_1 Depth=1
	ex	de, hl
	ld	e, iyh
	ex	de, hl
	.local	.LBB97_13
.LBB97_13:                              ;   in Loop: Header=BB97_1 Depth=1
	ld	e, (ix - 9)                     ; 1-byte Folded Reload
	ld	a, e
	or	a, a
	ld	d, iyl
	jr	nz, .LBB97_15
; %bb.14:                               ;   in Loop: Header=BB97_1 Depth=1
	ld	d, iyh
	.local	.LBB97_15
.LBB97_15:                              ;   in Loop: Header=BB97_1 Depth=1
	ld	a, l
	and	a, c
	ld	l, a
	ld	a, l
	and	a, d
	ld	l, a
	ld	b, 7
	call	__bshl
	rlc	a
	sbc	a, a
	ld	b, a
	bit	0, l
	ld	d, 0
	jr	nz, .LBB97_17
; %bb.16:                               ;   in Loop: Header=BB97_1 Depth=1
	ld	d, c
	.local	.LBB97_17
.LBB97_17:                              ;   in Loop: Header=BB97_1 Depth=1
	ld	hl, -720866
	push	de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, e
	ld	h, d
	pop	de
	ld	a, l
	bit	2, a
	ex	de, hl
	ld	d, iyl
	ex	de, hl
	jr	nz, .LBB97_19
; %bb.18:                               ;   in Loop: Header=BB97_1 Depth=1
	ex	de, hl
	ld	d, iyh
	ex	de, hl
	.local	.LBB97_19
.LBB97_19:                              ;   in Loop: Header=BB97_1 Depth=1
	ld	a, e
	add	a, b
	ld	l, a
	ld	a, h
	and	a, d
	ld	e, a
	ld	a, l
	cp	a, 15
                                        ; kill: def $a killed $a
	sbc	a, a
	ld	h, a
	ld	a, e
	and	a, h
	ld	h, a
	bit	0, h
	ld	a, 0
	ld	(ix - 12), a                    ; 1-byte Folded Spill
	jr	nz, .LBB97_21
; %bb.20:                               ;   in Loop: Header=BB97_1 Depth=1
	ld	(ix - 12), d                    ; 1-byte Folded Spill
	.local	.LBB97_21
.LBB97_21:                              ;   in Loop: Header=BB97_1 Depth=1
	ld	a, 1
	ld	c, a
	ld	a, (ix - 6)
	and	a, c
	ld	e, a
	ld	a, (ix - 3)
	add	a, e
	ld	e, a
	ld	(ix - 6), e
	ld	a, h
	and	a, c
	ld	e, a
	ld	a, l
	add	a, e
	ld	e, a
	ld	iy, -720868
	ld	l, (iy)
	ld	h, (iy + 1)
	ld	a, l
	bit	6, a
	jr	z, .LBB97_23
; %bb.22:                               ;   in Loop: Header=BB97_1 Depth=1
	bit	0, (ix - 12)                    ; 1-byte Folded Reload
	jp	nz, .LBB97_32
	.local	.LBB97_23
.LBB97_23:                              ;   in Loop: Header=BB97_1 Depth=1
	ld	(ix - 9), e                     ; 1-byte Folded Spill
	call	_kb_AnyKey
	ld	(ix - 19), a                    ; 1-byte Folded Spill
	ld	a, (_optix_guicolors+1)
	ld	l, a
	push	hl
	call	_gfx_SetColor
	pop	hl
	ld	hl, 86
	push	hl
	ld	hl, 166
	push	hl
	ld	hl, 83
	push	hl
	ld	hl, 77
	push	hl
	call	_gfx_FillRectangle
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	a, (_optix_guicolors+2)
	ld	l, a
	push	hl
	call	_gfx_SetColor
	pop	hl
	ld	hl, 86
	push	hl
	ld	hl, 166
	push	hl
	ld	hl, 83
	push	hl
	ld	hl, 77
	push	hl
	call	_gfx_Rectangle
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	or	a, a
	sbc	hl, hl
	ld	l, (ix - 9)                     ; 1-byte Folded Reload
	ld	bc, 10
	call	__imulu
	ld	(ix - 15), hl
	push	hl
	pop	iy
	ld	de, 79
	add	iy, de
	or	a, a
	sbc	hl, hl
	ld	l, (ix - 6)                     ; 1-byte Folded Reload
	call	__imulu
	ld	(ix - 18), hl
	ld	de, 85
	add	hl, de
	ld	de, 12
	push	de
	push	de
	push	hl
	push	iy
	call	_gfx_Rectangle
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 12
	push	hl
	ld	hl, 166
	push	hl
	ld	hl, 71
	push	hl
	ld	hl, 77
	push	hl
	call	_gfx_FillRectangle
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	or	a, a
	sbc	hl, hl
	push	hl
	call	_optix_CusText
	pop	hl
	xor	a, a
	ld	iyl, a
	ld	bc, 0
	.local	.LBB97_24
.LBB97_24:                              ;   Parent Loop BB97_1 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB97_26 Depth 3
	push	bc
	pop	hl
	ld	de, 8
	or	a, a
	sbc	hl, de
	jr	z, .LBB97_29
; %bb.25:                               ;   in Loop: Header=BB97_24 Depth=2
	ld	(ix - 23), bc
	push	bc
	pop	hl
	ld	bc, 10
	call	__imulu
	ld	de, 87
	add	hl, de
	ld	(ix - 26), hl
	ld	hl, 81
	ld	e, iyl
	ld	(ix - 3), de
	.local	.LBB97_26
.LBB97_26:                              ;   Parent Loop BB97_1 Depth=1
                                        ;     Parent Loop BB97_24 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	push	hl
	pop	bc
	ld	de, 241
	or	a, a
	sbc	hl, de
	jr	z, .LBB97_28
; %bb.27:                               ;   in Loop: Header=BB97_26 Depth=3
	ld	hl, (ix - 26)
	push	hl
	ld	(ix - 29), bc
	push	bc
	push	af
	ld	a, iyl
	ld	(ix - 20), a                    ; 1-byte Folded Spill
	pop	af
	call	_gfx_SetTextXY
	pop	hl
	pop	hl
	ld	hl, (ix - 3)
	push	hl
	call	_gfx_PrintChar
	push	af
	ld	a, (ix - 20)                    ; 1-byte Folded Reload
	ld	iyl, a
	pop	af
	pop	hl
	ld	hl, (ix - 29)
	ld	de, (ix - 3)
	inc	e
	ld	(ix - 3), de
	ld	de, 10
	add	hl, de
	jr	.LBB97_26
	.local	.LBB97_28
.LBB97_28:                              ;   in Loop: Header=BB97_24 Depth=2
	ld	bc, (ix - 23)
	inc	bc
	ld	l, 16
	ld	a, iyl
	add	a, l
	ld	iyl, a
	jr	.LBB97_24
	.local	.LBB97_29
.LBB97_29:                              ;   in Loop: Header=BB97_1 Depth=1
	ld	a, (ix - 19)                    ; 1-byte Folded Reload
	or	a, a
	ld	a, 1
	jr	z, .LBB97_31
; %bb.30:                               ;   in Loop: Header=BB97_1 Depth=1
	ld	a, (ix - 12)                    ; 1-byte Folded Reload
	.local	.LBB97_31
.LBB97_31:                              ;   in Loop: Header=BB97_1 Depth=1
	ld	(ix - 12), a
	ld	a, (_optix_guicolors+2)
	ld	l, a
	push	hl
	call	_gfx_SetColor
	pop	hl
	ld	iy, (ix - 15)
	ld	de, 80
	add	iy, de
	ld	hl, (ix - 18)
	ld	de, 86
	add	hl, de
	ld	de, 10
	push	de
	push	de
	push	hl
	push	iy
	call	_gfx_FillRectangle
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 1
	push	hl
	call	_optix_CusText
	pop	hl
	ld	hl, _.str.4.537
	push	hl
	call	_gfx_GetStringWidth
	pop	de
	call	__ishru_1
	ex	de, hl
	ld	hl, 160
	or	a, a
	sbc	hl, de
	ld	de, 74
	push	de
	push	hl
	ld	hl, _.str.4.537
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	de, 81
	ld	iy, (ix - 15)
	add	iy, de
	ld	de, 87
	ld	hl, (ix - 18)
	add	hl, de
	push	hl
	push	iy
	call	_gfx_SetTextXY
	pop	hl
	pop	hl
	ld	a, (ix - 6)                     ; 1-byte Folded Reload
	ld	b, 4
	call	__bshl
	ld	l, a
	ld	a, (ix - 9)
	add	a, l
	ld	l, a
	ld	(ix - 3), hl
	push	hl
	call	_gfx_PrintChar
	pop	hl
	call	_gfx_SwapDraw
	ld	a, (ix - 6)                     ; 1-byte Folded Reload
	ld	e, (ix - 9)                     ; 1-byte Folded Reload
	ld	hl, -720868
	push	hl
	pop	iy
	ld.sis	hl, 1
	ld	c, l
	ld	b, h
	jp	.LBB97_1
	.local	.LBB97_32
.LBB97_32:
	xor	a, a
	ld	l, a
	ld	(ix - 3), hl
	.local	.LBB97_33
.LBB97_33:
	ld	a, (ix - 6)                     ; 1-byte Folded Reload
	.local	.LBB97_34
.LBB97_34:
	ld	(ix - 9), e
	ld	iy, 0
	ld	iyl, e
	lea	hl, iy + 0
	ld	bc, 10
	call	__imulu
	ld	(ix - 6), hl
	ld	de, 80
	add	hl, de
	ld	(ix - 12), hl
	ld	iyl, a
	lea	hl, iy + 0
	call	__imulu
	push	hl
	pop	iy
	ld	de, 86
	add	iy, de
	ld	(ix - 18), iy
	ld	de, 81
	ld	iy, (ix - 6)
	add	iy, de
	ld	(ix - 6), iy
	ld	de, 87
	add	hl, de
	ld	(ix - 15), hl
	ld	b, 4
	call	__bshl
	ld	l, (ix - 9)
	add	a, l
	ld	l, a
	ld	(ix - 9), hl
	ld	de, (ix - 3)
	ld	iy, -720868
	.local	.LBB97_35
.LBB97_35:                              ; =>This Inner Loop Header: Depth=1
	ld	l, (iy)
	ld	h, (iy + 1)
	ld.sis	bc, 1
	call	__sand
	bit	0, l
	jp	z, .LBB97_37
; %bb.36:                               ;   in Loop: Header=BB97_35 Depth=1
	call	_kb_Scan
	ld	a, (_optix_guicolors+3)
	ld	l, a
	push	hl
	call	_gfx_SetColor
	pop	hl
	ld	hl, 10
	push	hl
	push	hl
	ld	hl, (ix - 18)
	push	hl
	ld	hl, (ix - 12)
	push	hl
	call	_gfx_FillRectangle
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 1
	push	hl
	call	_optix_CusText
	pop	hl
	ld	hl, (ix - 15)
	push	hl
	ld	hl, (ix - 6)
	push	hl
	call	_gfx_SetTextXY
	pop	hl
	pop	hl
	ld	hl, (ix - 9)
	push	hl
	call	_gfx_PrintChar
	pop	hl
	call	_gfx_SwapDraw
	ld	iy, -720868
	ld	de, (ix - 9)
                                        ; kill: def $e killed $e killed $ude def $ude
	jp	.LBB97_35
	.local	.LBB97_37
.LBB97_37:
	ld	a, e
	cp	a, 96
	jr	z, .LBB97_39
; %bb.38:
	ld	a, e
	cp	a, 126
	jr	nz, .LBB97_40
	.local	.LBB97_39
.LBB97_39:
	ld	hl, 10
	ex	de, hl
	push	de
	ld	hl, 150
	push	hl
	push	de
	ld	hl, _.str.6.539
	push	hl
	ld	hl, _.str.5.538
	push	hl
	call	_optix_Message
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	xor	a, a
	ld	e, a
	.local	.LBB97_40
.LBB97_40:
	ld	(ix - 3), de
	ld	hl, 1
	push	hl
	call	_gfx_Blit
	pop	hl
	ld	hl, (ix - 3)
	ld	a, l
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end97
.Lfunc_end97:
	.size	_optix_InsertSpecialCharacter, .Lfunc_end97-_optix_InsertSpecialCharacter
                                        ; -- End function
	.section	.text._optix_GetStringInput,"ax",@progbits
	.globl	_optix_GetStringInput           ; -- Begin function optix_GetStringInput
	.type	_optix_GetStringInput,@function
_optix_GetStringInput:                  ; @optix_GetStringInput
; %bb.0:
	ld	hl, -75
	call	__frameset
	ld	iy, (ix + 15)
	ld.sis	de, 0
	lea	hl, ix - 22
	ld	(ix - 2), e
	ld	(ix - 1), d
	ld	(ix - 22), d
	push	hl
	pop	de
	inc	de
	ld	bc, 19
	ld	(ix - 35), hl
	ldir
	ld	hl, (_optix_stringinput)
	lea	de, iy + 0
	inc	de
	push	de
	push	hl
	call	_realloc
	ex	de, hl
	pop	hl
	pop	hl
	ld	(_optix_stringinput), de
	push	de
	pop	bc
	sbc	hl, hl
	adc	hl, de
	ld	hl, 0
	jp	z, .LBB98_37
; %bb.1:
	ld	iy, (ix + 12)
	ld	e, 1
	ld	(ix - 44), de
	lea	de, ix - 2
	ld	(ix - 47), de
	ld	de, (ix + 15)
	push	bc
	pop	hl
	add	hl, de
	ld	(hl), 0
	push	iy
	ld	hl, _.str.567
	push	hl
	call	_optix_WordWrap
	pop	hl
	pop	hl
	ld	bc, 0
	push	bc
	pop	de
	ld	hl, (ix + 12)
	ld	e, l
	ld	d, h
	ld	(ix - 38), de
	ex	de, hl
	ld	de, 6
	add	hl, de
	ld	(ix - 31), hl
	ld	c, (ix + 9)
	ld	(ix - 57), bc
	push	bc
	pop	hl
	ld	de, 18
	add	hl, de
	ld	(ix - 25), hl
	.local	.LBB98_2
.LBB98_2:                               ; =>This Inner Loop Header: Depth=1
	call	_kb_AnyKey
	or	a, a
	jr	z, .LBB98_4
; %bb.3:                                ;   in Loop: Header=BB98_2 Depth=1
	call	_kb_Scan
	jr	.LBB98_2
	.local	.LBB98_4
.LBB98_4:
	ld	hl, (ix - 31)
	call	__ishru_1
	ex	de, hl
	ld	hl, (ix - 25)
	call	__ishru_1
	push	hl
	pop	bc
	ld	(ix - 25), bc
	ld	hl, 160
	or	a, a
	sbc	hl, de
	ex	de, hl
	ld	hl, 120
	or	a, a
	sbc	hl, bc
	push	hl
	pop	iy
	ex	de, hl
	ld	bc, 255
	call	__iand
	ld	(ix - 28), hl
	lea	hl, iy + 0
	call	__iand
	push	hl
	pop	iy
	ld	de, 12
	add	iy, de
	ld	(ix - 50), iy
	ld	(ix - 60), hl
	ld	bc, 3
	add	hl, bc
	ld	(ix - 41), hl
	ld	iy, (ix - 28)
	lea	hl, iy + 0
	ld	de, 6
	add	hl, de
	ld	(ix - 53), hl
	ld	hl, (ix - 38)
	lea	de, iy + 0
	add	hl, de
	add	hl, bc
	ld	(ix - 38), hl
	ld	a, -120
	ld	hl, (ix - 25)
	sub	a, l
	ld	l, a
	ld	(ix - 66), hl
	ld	l, (ix + 9)
	ld	(ix - 69), hl
	or	a, a
	sbc	hl, hl
	ld	(ix - 25), hl
	xor	a, a
	ld	(ix - 32), a                    ; 1-byte Folded Spill
	ld	(ix - 54), a                    ; 1-byte Folded Spill
	.local	.LBB98_5
.LBB98_5:                               ; =>This Inner Loop Header: Depth=1
	call	_os_GetCSC
	ld	iyh, a
	cp	a, 9
	jp	z, .LBB98_34
; %bb.6:                                ;   in Loop: Header=BB98_5 Depth=1
	or	a, a
	sbc	hl, hl
	push	hl
	pop	de
	ld	e, iyh
	push	af
	ld	a, (ix - 32)                    ; 1-byte Folded Reload
	ld	iyl, a
	pop	af
	ex	de, hl
	ld	e, iyl
	ex	de, hl
	ld	bc, 3
	call	__imulu
	push	hl
	pop	bc
	ld	hl, ___const.optix_GetStringInput.keys
	add	hl, bc
	ld	hl, (hl)
	add	hl, de
	ld	e, (hl)
	ld	hl, (ix - 25)
	ld	bc, (ix + 15)
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	push	af
	ld	a, iyh
	ld	(ix - 63), a
	pop	af
	jp	p, .LBB98_9
; %bb.7:                                ;   in Loop: Header=BB98_5 Depth=1
	ld	a, e
	or	a, a
	jr	z, .LBB98_9
; %bb.8:                                ;   in Loop: Header=BB98_5 Depth=1
	ld	hl, (_optix_stringinput)
	ld	bc, (ix - 25)
	add	hl, bc
	inc	bc
	ld	(ix - 25), bc
	ld	(hl), e
	ld	hl, (_optix_stringinput)
	ld	de, (ix + 12)
	push	de
	push	hl
	call	_optix_WordWrap
	push	af
	ld	a, (ix - 63)                    ; 1-byte Folded Reload
	ld	iyh, a
	pop	af
	push	af
	ld	a, (ix - 32)                    ; 1-byte Folded Reload
	ld	iyl, a
	pop	af
	ld	bc, (ix + 15)
	ld	l, a
	ld	(ix - 44), hl
	pop	hl
	pop	hl
	xor	a, a
	ld	(ix - 54), a                    ; 1-byte Folded Spill
	.local	.LBB98_9
.LBB98_9:                               ;   in Loop: Header=BB98_5 Depth=1
	ld	a, iyh
	cp	a, 56
	jr	nz, .LBB98_12
; %bb.10:                               ;   in Loop: Header=BB98_5 Depth=1
	ld	hl, (ix - 25)
	ld	de, 1
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	m, .LBB98_12
; %bb.11:                               ;   in Loop: Header=BB98_5 Depth=1
	ld	iy, (_optix_stringinput)
	ld	de, (ix - 25)
	add	iy, de
	dec	de
	ld	(ix - 25), de
	ld	(iy - 1), 0
	jr	.LBB98_14
	.local	.LBB98_12
.LBB98_12:                              ;   in Loop: Header=BB98_5 Depth=1
	ld	a, iyh
	cp	a, 15
	jr	nz, .LBB98_15
; %bb.13:                               ;   in Loop: Header=BB98_5 Depth=1
	ld	hl, (_optix_stringinput)
	ld.sis	de, 32
	ld	(hl), e
	inc	hl
	ld	(hl), d
	ld	hl, (_optix_wordwraptext)
	ld	(hl), e
	inc	hl
	ld	(hl), d
	or	a, a
	sbc	hl, hl
	ld	(ix - 25), hl
	.local	.LBB98_14
.LBB98_14:                              ;   in Loop: Header=BB98_5 Depth=1
	ld	hl, (_optix_stringinput)
	ld	de, (ix + 12)
	push	de
	push	hl
	call	_optix_WordWrap
	ld	l, a
	ld	(ix - 44), hl
	pop	hl
	pop	hl
	push	af
	ld	a, (ix - 32)                    ; 1-byte Folded Reload
	ld	iyl, a
	pop	af
	push	af
	ld	a, (ix - 63)                    ; 1-byte Folded Reload
	ld	iyh, a
	pop	af
	jr	.LBB98_18
	.local	.LBB98_15
.LBB98_15:                              ;   in Loop: Header=BB98_5 Depth=1
	ld	a, iyh
	cp	a, 10
	jr	nz, .LBB98_18
; %bb.16:                               ;   in Loop: Header=BB98_5 Depth=1
	ld	de, (ix - 25)
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	jp	p, .LBB98_18
; %bb.17:                               ;   in Loop: Header=BB98_5 Depth=1
	ld	(ix - 25), de
	call	_optix_InsertSpecialCharacter
	ld	hl, (_optix_stringinput)
	ld	de, (ix - 25)
	add	hl, de
	inc	de
	ld	(ix - 25), de
	ld	(hl), a
	jr	.LBB98_14
	.local	.LBB98_18
.LBB98_18:                              ;   in Loop: Header=BB98_5 Depth=1
	ld	a, iyh
	cp	a, 48
	ld	l, 1
	jr	z, .LBB98_20
; %bb.19:                               ;   in Loop: Header=BB98_5 Depth=1
	ld	l, 0
	.local	.LBB98_20
.LBB98_20:                              ;   in Loop: Header=BB98_5 Depth=1
	ld	a, iyl
	add	a, l
	ld	l, a
	cp	a, 3
	ld	a, 0
	ld	de, (ix - 25)
	jr	nc, .LBB98_22
; %bb.21:                               ;   in Loop: Header=BB98_5 Depth=1
	ld	a, l
	.local	.LBB98_22
.LBB98_22:                              ;   in Loop: Header=BB98_5 Depth=1
	ld	(ix - 32), a
	ld	iy, (_optix_stringinput)
	add	iy, de
	ld	(iy + 1), 0
	ld	a, (_optix_guicolors+1)
	ld	l, a
	push	hl
	call	_gfx_SetColor
	pop	hl
	ld	de, 0
	ld	hl, (ix - 44)
	ld	e, l
	ld	(ix - 63), de
	ex	de, hl
	ld	bc, (ix - 57)
	call	__imulu
	ld	de, 6
	add	hl, de
	ld	(ix - 72), hl
	push	hl
	ld	hl, (ix - 31)
	push	hl
	ld	hl, (ix - 50)
	push	hl
	ld	hl, (ix - 28)
	push	hl
	call	_gfx_FillRectangle
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	a, (_optix_guicolors+2)
	ld	l, a
	push	hl
	call	_gfx_SetColor
	pop	hl
	ld	hl, (ix - 72)
	push	hl
	ld	hl, (ix - 31)
	push	hl
	ld	hl, (ix - 50)
	push	hl
	ld	hl, (ix - 28)
	push	hl
	call	_gfx_Rectangle
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 12
	push	hl
	ld	hl, (ix - 31)
	push	hl
	ld	hl, (ix - 60)
	push	hl
	ld	hl, (ix - 28)
	push	hl
	call	_gfx_FillRectangle
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	e, (ix - 54)                    ; 1-byte Folded Reload
	ld	a, e
	cp	a, 10
	jp	nc, .LBB98_24
; %bb.23:                               ;   in Loop: Header=BB98_5 Depth=1
	ld	iy, (_optix_wordwraptext)
	ld	hl, (ix - 63)
	dec	hl
	ld	(ix - 63), hl
	ld	bc, 201
	call	__imulu
	ex	de, hl
	ld	(ix - 72), de
	add	iy, de
	push	iy
	call	_gfx_GetStringWidth
	ex	de, hl
	pop	hl
	ld	iy, (ix - 28)
	ld	(ix - 75), iy
	add	iy, de
	ld	de, 4
	add	iy, de
	ld	hl, (ix - 63)
	ld	bc, (ix - 57)
	call	__imulu
	ex	de, hl
	ld	hl, (ix - 60)
	add	hl, de
	ld	de, 14
	add	hl, de
	ex	de, hl
	ld	(ix - 63), de
	ld	hl, 11
	push	hl
	push	de
	push	iy
	call	_gfx_VertLine
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (_optix_wordwraptext)
	ld	de, (ix - 72)
	add	hl, de
	push	hl
	call	_gfx_GetStringWidth
	ex	de, hl
	pop	hl
	ld	hl, (ix - 75)
	add	hl, de
	ld	de, 5
	add	hl, de
	ld	de, 11
	push	de
	ld	de, (ix - 63)
	push	de
	push	hl
	call	_gfx_VertLine
	ld	e, (ix - 54)                    ; 1-byte Folded Reload
	pop	hl
	pop	hl
	pop	hl
	.local	.LBB98_24
.LBB98_24:                              ;   in Loop: Header=BB98_5 Depth=1
	inc	e
	ld	a, e
	cp	a, 21
	ld	a, 0
	jr	nc, .LBB98_26
; %bb.25:                               ;   in Loop: Header=BB98_5 Depth=1
	ld	a, e
	.local	.LBB98_26
.LBB98_26:                              ;   in Loop: Header=BB98_5 Depth=1
	ld	(ix - 54), a
	ld	hl, 1
	push	hl
	call	_optix_CusText
	pop	hl
	ld	hl, (ix + 6)
	push	hl
	call	_gfx_GetStringWidth
	pop	de
	call	__ishru_1
	ex	de, hl
	ld	hl, 160
	or	a, a
	sbc	hl, de
	ld	de, (ix - 41)
	push	de
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (ix + 15)
	push	hl
	ld	hl, (ix - 25)
	push	hl
	ld	hl, _.str.10.541
	push	hl
	ld	hl, (ix - 35)
	push	hl
	call	_sprintf
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	l, (ix - 32)                    ; 1-byte Folded Reload
	ld	a, l
	or	a, a
	jr	nz, .LBB98_28
; %bb.27:                               ;   in Loop: Header=BB98_5 Depth=1
	ld	(ix - 2), 65
	jr	.LBB98_33
	.local	.LBB98_28
.LBB98_28:                              ;   in Loop: Header=BB98_5 Depth=1
	ld	a, l
	cp	a, 1
	jr	nz, .LBB98_30
; %bb.29:                               ;   in Loop: Header=BB98_5 Depth=1
	ld	(ix - 2), 97
	jr	.LBB98_33
	.local	.LBB98_30
.LBB98_30:                              ;   in Loop: Header=BB98_5 Depth=1
	ld	a, l
	cp	a, 2
	jr	nz, .LBB98_32
; %bb.31:                               ;   in Loop: Header=BB98_5 Depth=1
	ld	(ix - 2), 49
	jr	.LBB98_33
	.local	.LBB98_32
.LBB98_32:                              ;   in Loop: Header=BB98_5 Depth=1
	ld	(ix - 2), 63
	.local	.LBB98_33
.LBB98_33:                              ;   in Loop: Header=BB98_5 Depth=1
	ld	hl, (ix - 41)
	push	hl
	ld	hl, (ix - 53)
	push	hl
	ld	hl, (ix - 35)
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (ix - 47)
	push	hl
	call	_gfx_GetStringWidth
	ex	de, hl
	pop	hl
	ld	hl, (ix - 38)
	or	a, a
	sbc	hl, de
	ld	de, (ix - 41)
	push	de
	push	hl
	ld	hl, (ix - 47)
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (ix - 44)
	push	hl
	or	a, a
	sbc	hl, hl
	push	hl
	ld	hl, (ix - 69)
	push	hl
	ld	hl, (ix - 66)
	push	hl
	ld	hl, (ix - 53)
	push	hl
	ld	hl, (ix + 12)
	push	hl
	call	_optix_PrintWordWrap
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	call	_gfx_SwapDraw
	jp	.LBB98_5
	.local	.LBB98_34
.LBB98_34:                              ; %.preheader
                                        ; =>This Inner Loop Header: Depth=1
	call	_kb_AnyKey
	or	a, a
	jr	z, .LBB98_36
; %bb.35:                               ;   in Loop: Header=BB98_34 Depth=1
	call	_kb_Scan
	jr	.LBB98_34
	.local	.LBB98_36
.LBB98_36:
	ld	hl, (_optix_stringinput)
	.local	.LBB98_37
.LBB98_37:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end98
.Lfunc_end98:
	.size	_optix_GetStringInput, .Lfunc_end98-_optix_GetStringInput
                                        ; -- End function
	.section	.text._optix_InitializeButtons,"ax",@progbits
	.globl	_optix_InitializeButtons        ; -- Begin function optix_InitializeButtons
	.type	_optix_InitializeButtons,@function
_optix_InitializeButtons:               ; @optix_InitializeButtons
; %bb.0:
	or	a, a
	sbc	hl, hl
	push	hl
	call	_malloc
	pop	de
	ld	(_optix_button), hl
	ret
	.local	.Lfunc_end99
.Lfunc_end99:
	.size	_optix_InitializeButtons, .Lfunc_end99-_optix_InitializeButtons
                                        ; -- End function
	.section	.text._optix_AddButton,"ax",@progbits
	.globl	_optix_AddButton                ; -- Begin function optix_AddButton
	.type	_optix_AddButton,@function
_optix_AddButton:                       ; @optix_AddButton
; %bb.0:
	ld	hl, -4
	call	__frameset
	ld	bc, 30
	ld	de, (_optix_button)
	ld	a, (_optix_buttoninfo)
	or	a, a
	sbc	hl, hl
	ld	l, a
	call	__imulu
	add	hl, bc
	push	hl
	push	de
	call	_realloc
	pop	de
	pop	de
	ld	(_optix_button), hl
	push	hl
	pop	iy
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB100_2
; %bb.1:
	ld	hl, _.str.11.545
	ld	de, _.str.12.546
	ld	bc, 3
	push	bc
	ld	bc, 150
	push	bc
	ld	bc, 10
	push	bc
	push	de
	push	hl
	call	_optix_Message
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	jr	.LBB100_3
	.local	.LBB100_2
.LBB100_2:
	ld	d, (ix + 9)
	ld	e, (ix + 15)
	ld	a, (_optix_buttoninfo)
	ld	(ix - 1), a
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	bc, 30
	call	__imulu
	push	hl
	pop	bc
	add	iy, bc
	ld	(ix - 4), iy
	ld	hl, (ix + 6)
	ld	(iy), l
	ld	(iy + 1), h
	ld	(iy + 2), d
	ld	hl, (ix + 12)
	ld	(iy + 4), l
	ld	(iy + 5), h
	ld	(iy + 6), e
	ld	hl, (ix + 18)
	push	hl
	pea	iy + 7
	call	_strcpy
	pop	hl
	pop	hl
	ld	hl, (ix + 21)
	ld	iy, (ix - 4)
	ld	(iy + 22), hl
	ld	hl, (ix + 24)
	ld	(iy + 25), hl
	ld	a, (ix + 27)
	ld	(iy + 28), a
	ld	a, (ix - 1)                     ; 1-byte Folded Reload
	inc	a
	ld	(_optix_buttoninfo), a
	.local	.LBB100_3
.LBB100_3:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end100
.Lfunc_end100:
	.size	_optix_AddButton, .Lfunc_end100-_optix_AddButton
                                        ; -- End function
	.section	.text._optix_DeleteButton,"ax",@progbits
	.globl	_optix_DeleteButton             ; -- Begin function optix_DeleteButton
	.type	_optix_DeleteButton,@function
_optix_DeleteButton:                    ; @optix_DeleteButton
; %bb.0:
	ld	hl, -12
	call	__frameset
	ld	bc, 30
	ld	a, (_optix_buttoninfo)
	ld	hl, (_optix_button)
	ld	(ix - 3), hl
	ld	iy, 0
	lea	de, iy + 0
	ld	e, a
	push	af
	ld	a, (ix + 6)
	ld	iyl, a
	pop	af
	push	de
	pop	hl
	call	__imulu
	push	hl
	pop	bc
	ld	hl, (ix - 3)
	add	hl, bc
	.local	.LBB101_1
.LBB101_1:                              ; =>This Inner Loop Header: Depth=1
	ld	(ix - 6), hl
	lea	hl, iy + 0
	or	a, a
	sbc	hl, de
	lea	bc, iy + 0
	jr	nc, .LBB101_3
; %bb.2:                                ;   in Loop: Header=BB101_1 Depth=1
	ld	hl, (ix - 6)
	push	hl
	pop	iy
	lea	iy, iy - 30
	ld	(ix - 12), iy
	ld	(ix - 9), de
	lea	de, iy + 0
	push	bc
	pop	iy
	ld	bc, 30
	ldir
	ld	de, (ix - 9)
	dec	de
	ld	hl, (ix - 12)
	jr	.LBB101_1
	.local	.LBB101_3
.LBB101_3:
	dec	a
	ld	(_optix_buttoninfo), a
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	bc, 30
	call	__imulu
	push	hl
	ld	hl, (ix - 3)
	push	hl
	call	_realloc
	pop	de
	pop	de
	ld	(_optix_button), hl
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end101
.Lfunc_end101:
	.size	_optix_DeleteButton, .Lfunc_end101-_optix_DeleteButton
                                        ; -- End function
	.section	.text._TickerPriority,"ax",@progbits
	.globl	_TickerPriority                 ; -- Begin function TickerPriority
	.type	_TickerPriority,@function
_TickerPriority:                        ; @TickerPriority
; %bb.0:
	call	__frameset0
	ld	a, (ix + 6)
	cp	a, 16
	jr	nc, .LBB102_3
; %bb.1:
	ld.sis	hl, -15841
	ld	c, a
	call	__sshru
	bit	0, l
	jr	z, .LBB102_3
; %bb.2:
	ld	hl, _switch.table.TickerUpdate.27
	ld	de, 0
	ld	e, a
	add	hl, de
	ld	a, (hl)
	jp	.LBB102_4
	.local	.LBB102_3
.LBB102_3:
	cp	a, 10
	ccf
                                        ; kill: def $a killed $a
	sbc	a, a
	inc	a
	.local	.LBB102_4
.LBB102_4:
	pop	ix
	ret
	.local	.Lfunc_end102
.Lfunc_end102:
	.size	_TickerPriority, .Lfunc_end102-_TickerPriority
                                        ; -- End function
	.section	.text._TickerInit,"ax",@progbits
	.globl	_TickerInit                     ; -- Begin function TickerInit
	.type	_TickerInit,@function
_TickerInit:                            ; @TickerInit
; %bb.0:
	call	__frameset0
	ld	iy, (ix + 6)
	ld	hl, _ticker
	xor	a, a
	ld	(_ticker), a
	push	hl
	pop	de
	inc	de
	ld	bc, 133
	ldir
	ld	a, (iy + 30)
	ld	(_ticker+49), a
	ld	hl, (iy + 26)
	lea	de, iy + 0
	ld	iy, _ticker+46
	ld	(iy), l
	ld	(iy + 1), h
	push	de
	pop	iy
	ld	a, (iy + 28)
	ld	(_ticker+50), a
	ld	a, 16
	ld	(_ticker+32), a
	pop	ix
	ret
	.local	.Lfunc_end103
.Lfunc_end103:
	.size	_TickerInit, .Lfunc_end103-_TickerInit
                                        ; -- End function
	.section	.text._TickerPost,"ax",@progbits
	.globl	_TickerPost                     ; -- Begin function TickerPost
	.type	_TickerPost,@function
_TickerPost:                            ; @TickerPost
; %bb.0:
	ld	hl, -11
	call	__frameset
	ld	bc, (ix + 6)
	ld	iyl, 0
	ld	de, 16
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	jr	c, .LBB104_3
	.local	.LBB104_1
.LBB104_1:
	ld	a, iyl
	.local	.LBB104_2
.LBB104_2:                              ; %.loopexit
	ld	sp, ix
	pop	ix
	ret
	.local	.LBB104_3
.LBB104_3:
	push	bc
	pop	de
	ld	bc, 14
	push	de
	pop	hl
	call	__iand
	push	hl
	pop	bc
	ld	a, c
	cp	a, 14
	jp	nz, .LBB104_6
; %bb.4:
	ld	a, (ix + 9)
	cp	a, -56
	jr	nc, .LBB104_1
; %bb.5:
	ld.sis	de, 7
	ld	hl, (ix + 12)
                                        ; kill: def $hl killed $hl killed $uhl
	or	a, a
	sbc.sis	hl, de
	ld	de, (ix + 6)
	jp	nc, .LBB104_1
	.local	.LBB104_6
.LBB104_6:
	ld	iy, 11
	ex	de, hl
	lea	de, iy + 0
	or	a, a
	sbc	hl, de
	jr	z, .LBB104_8
; %bb.7:
	ld	a, c
	cp	a, 6
	jr	nz, .LBB104_9
	.local	.LBB104_8
.LBB104_8:
	ld	a, (ix + 9)
	cp	a, 7
	ld	a, 0
	jp	nc, .LBB104_2
	jp	.LBB104_14
	.local	.LBB104_9
.LBB104_9:
	ld	a, (ix + 9)
	cp	a, 7
	ld	bc, (ix + 6)
	ld	iyl, 0
	jp	c, .LBB104_12
; %bb.10:
	ld	de, 4
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	jp	nz, .LBB104_12
; %bb.11:
	ld.sis	de, 1
	ld	hl, (ix + 12)
                                        ; kill: def $hl killed $hl killed $uhl
	or	a, a
	sbc.sis	hl, de
	jp	z, .LBB104_1
	.local	.LBB104_12
.LBB104_12:
	ld	de, 5
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	jr	nz, .LBB104_14
; %bb.13:
	cp	a, 39
	jp	nc, .LBB104_1
	.local	.LBB104_14
.LBB104_14:
	ld	iyl, 0
	ld	l, 1
	ld	(ix - 7), hl
	ld	a, (_ticker+48)
	ld	b, a
	.local	.LBB104_15
.LBB104_15:                             ; =>This Inner Loop Header: Depth=1
	ld	c, iyl
	ld	a, b
	cp	a, c
	jp	z, .LBB104_24
; %bb.16:                               ;   in Loop: Header=BB104_15 Depth=1
	or	a, a
	sbc	hl, hl
	ld	l, c
	add	hl, hl
	add	hl, hl
	ex	de, hl
	ld	iy, _ticker
	add	iy, de
	ld	a, (iy)
	ld	(ix - 8), a                     ; 1-byte Folded Spill
	ld	hl, (ix + 6)
	cp	a, l
	jp	nz, .LBB104_19
; %bb.17:                               ;   in Loop: Header=BB104_15 Depth=1
	ld	a, (iy + 1)
	ld	l, (ix + 9)
	cp	a, l
	jp	nz, .LBB104_19
; %bb.18:                               ;   in Loop: Header=BB104_15 Depth=1
	ld	hl, (iy + 2)
                                        ; kill: def $hl killed $hl killed $uhl
	ld	de, (ix + 12)
	or	a, a
	sbc.sis	hl, de
	jp	z, .LBB104_40
	.local	.LBB104_19
.LBB104_19:                             ;   in Loop: Header=BB104_15 Depth=1
	ld	(ix - 11), iy
	ld	iyl, c
	inc	iyl
	ld	hl, (ix + 6)
	ld	de, 3
	or	a, a
	sbc	hl, de
	jp	nz, .LBB104_15
; %bb.20:                               ;   in Loop: Header=BB104_15 Depth=1
	ld	a, c
	or	a, a
	jp	z, .LBB104_15
; %bb.21:                               ;   in Loop: Header=BB104_15 Depth=1
	ld	a, (ix - 8)                     ; 1-byte Folded Reload
	cp	a, 3
	jp	nz, .LBB104_15
; %bb.22:
	ld	iy, (ix - 11)
	ld	hl, (iy + 2)
                                        ; kill: def $hl killed $hl killed $uhl
	ld	bc, (ix + 12)
	or	a, a
	sbc.sis	hl, bc
	jp	nc, .LBB104_39
; %bb.23:
	ld	d, 0
	ld	(ix - 4), d
	push	bc
	pop	hl
	ld	bc, (ix - 6)
	ld	b, h
	ld	c, l
	or	a, a
	sbc	hl, hl
	ld	h, l
	ld	l, 16
	ld	a, h
	call	__lshl
	ld	(ix - 7), bc
	ld	e, a
	ld	(ix - 3), d
	ld	bc, (ix - 5)
	ld	b, d
	ld	c, (ix + 9)
	ld	l, 8
	ld	a, h
	call	__lshl
	ld	hl, (ix - 7)
	call	__ladd
	ld	bc, 3
	xor	a, a
	call	__ladd
	jp	.LBB104_38
	.local	.LBB104_24
.LBB104_24:
	ld	a, b
	cp	a, 8
	jp	nz, .LBB104_37
; %bb.25:
	ld	bc, (ix + 6)
	ld	a, c
	cp	a, 10
	ccf
                                        ; kill: def $a killed $a
	sbc	a, a
	ld	iyh, a
	inc	iyh
	ld.sis	hl, -15841
                                        ; kill: def $c killed $c killed $ubc
	call	__sshru
	ld	(ix - 8), l                     ; 1-byte Folded Spill
	ld	bc, 32
	ld	de, 4
	ld	iyl, b
	.local	.LBB104_26
.LBB104_26:                             ; =>This Inner Loop Header: Depth=1
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	jp	z, .LBB104_1
; %bb.27:                               ;   in Loop: Header=BB104_26 Depth=1
	ld	hl, _ticker
	add	hl, de
	ld	a, (hl)
	cp	a, 16
	jr	nc, .LBB104_30
; %bb.28:                               ;   in Loop: Header=BB104_26 Depth=1
	ld.sis	hl, -15841
	ld	c, a
	call	__sshru
	bit	0, l
	jr	z, .LBB104_30
; %bb.29:                               ;   in Loop: Header=BB104_26 Depth=1
	ld	bc, 0
	ld	c, a
	ld	hl, _switch.table.TickerUpdate.27
	add	hl, bc
	ld	l, (hl)
	jp	.LBB104_31
	.local	.LBB104_30
.LBB104_30:                             ;   in Loop: Header=BB104_26 Depth=1
	cp	a, 10
	ccf
                                        ; kill: def $a killed $a
	sbc	a, a
	ld	l, a
	inc	l
	.local	.LBB104_31
.LBB104_31:                             ;   in Loop: Header=BB104_26 Depth=1
	ld	bc, (ix + 6)
	ld	a, c
	cp	a, 16
	ld	c, iyh
	jr	nc, .LBB104_34
; %bb.32:                               ;   in Loop: Header=BB104_26 Depth=1
	bit	0, (ix - 8)                     ; 1-byte Folded Reload
	ld	c, iyh
	jr	z, .LBB104_34
; %bb.33:                               ;   in Loop: Header=BB104_26 Depth=1
	ld	a, iyh
	ld	iy, _switch.table.TickerUpdate.27
	ld	bc, (ix + 6)
	add	iy, bc
	ld	c, (iy)
	ld	iyh, a
	ld	iyl, 0
	.local	.LBB104_34
.LBB104_34:                             ;   in Loop: Header=BB104_26 Depth=1
	ld	a, l
	cp	a, c
	jr	c, .LBB104_36
; %bb.35:                               ;   in Loop: Header=BB104_26 Depth=1
	inc	(ix - 7)
	ex	de, hl
	ld	de, 4
	add	hl, de
	ex	de, hl
	ld	bc, 32
	jp	.LBB104_26
	.local	.LBB104_36
.LBB104_36:
	ld	hl, (ix - 7)
	push	hl
	call	_Remove
	pop	hl
	ld	a, (_ticker+48)
	ld	b, a
	.local	.LBB104_37
.LBB104_37:
	ld	a, b
	inc	a
	ld	(_ticker+48), a
	or	a, a
	sbc	hl, hl
	ld	l, b
	add	hl, hl
	add	hl, hl
	ex	de, hl
	ld	iy, _ticker
	add	iy, de
	ld	h, 0
	ld	(ix - 2), h
	ld	bc, (ix - 4)
	ld	de, (ix + 12)
	ld	b, d
	ld	c, e
	ld	de, 0
	ld	d, e
	ld	l, 16
	ld	a, d
	call	__lshl
	ld	(ix - 7), bc
	ld	e, a
	ld	(ix - 1), h
	ld	bc, (ix - 3)
	ld	b, h
	ld	c, (ix + 9)
	ld	l, 8
	ld	a, d
	call	__lshl
	ld	hl, (ix - 7)
	call	__ladd
	ld	bc, (ix + 6)
	ld	a, d
	call	__lor
	.local	.LBB104_38
.LBB104_38:                             ; %.loopexit
	ld	(iy), hl
	ld	(iy + 3), e
	.local	.LBB104_39
.LBB104_39:                             ; %.loopexit
	ld	a, 1
	jp	.LBB104_2
	.local	.LBB104_40
.LBB104_40:
	xor	a, a
	jp	.LBB104_2
	.local	.Lfunc_end104
.Lfunc_end104:
	.size	_TickerPost, .Lfunc_end104-_TickerPost
                                        ; -- End function
	.section	.text._Remove,"ax",@progbits
	.type	_Remove,@function               ; -- Begin function Remove
_Remove:                                ; @Remove
; %bb.0:
	call	__frameset0
	ld	a, (ix + 6)
	ld	iy, _ticker
	ld	de, 0
	ld	e, a
	push	de
	pop	hl
	add	hl, hl
	add	hl, hl
	push	hl
	pop	bc
	add	iy, bc
	.local	.LBB105_1
.LBB105_1:                              ; =>This Inner Loop Header: Depth=1
	lea	iy, iy + 4
	inc	de
	ld	a, (_ticker+48)
	ld	bc, 0
	ld	c, a
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	jr	nc, .LBB105_3
; %bb.2:                                ;   in Loop: Header=BB105_1 Depth=1
	ld	hl, (iy)
	ld	a, (iy + 3)
	ld	(iy - 4), hl
	ld	(iy - 1), a
	jr	.LBB105_1
	.local	.LBB105_3
.LBB105_3:
	dec	a
	ld	(_ticker+48), a
	pop	ix
	ret
	.local	.Lfunc_end105
.Lfunc_end105:
	.size	_Remove, .Lfunc_end105-_Remove
                                        ; -- End function
	.section	.text._TickerText,"ax",@progbits
	.globl	_TickerText                     ; -- Begin function TickerText
	.type	_TickerText,@function
_TickerText:                            ; @TickerText
; %bb.0:
	ld	hl, -3
	call	__frameset
	ld	a, (_ticker+48)
	or	a, a
	jr	nz, .LBB106_2
; %bb.1:
	ld	de, _.str.567
	jp	.LBB106_33
	.local	.LBB106_2
.LBB106_2:
	ld	de, _ticker+53
	ld	a, (_ticker+52)
	bit	0, a
	jp	nz, .LBB106_33
; %bb.3:
	ld	a, (_ticker)
	ld	l, a
	ld	a, (_ticker+1)
	ld	h, a
	ld	bc, 0
	ld	a, l
	cp	a, 16
	jr	c, .LBB106_5
; %bb.4:
	xor	a, a
	ld	(_ticker+53), a
	jp	.LBB106_33
	.local	.LBB106_5
.LBB106_5:
	ld	a, h
	ld	iy, _ticker+2
	ld	de, (iy)
	push	bc
	pop	iy
	ld	(ix - 3), de
	lea	de, iy + 0
	ld	e, l
	ld	hl, JTI106_0
	add	hl, de
	add	hl, de
	add	hl, de
	ld	hl, (hl)
	jp	(hl)
	.local	.LBB106_6
.LBB106_6:
	ld	hl, _.str.3.551
	ld	bc, 28
	jp	.LBB106_32
	.local	.LBB106_7
.LBB106_7:
	ld	iy, _.str.1.549
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	bc, 28
	call	__imulu
	ex	de, hl
	ld	hl, _event_catalog
	add	hl, de
	ld	de, (hl)
	or	a, a
	sbc	hl, hl
	ld	bc, (ix - 3)
	ld	l, c
	ld	h, b
	ld	bc, 3
	call	__imulu
	push	hl
	pop	bc
	ld	hl, _InitializeMap.names
	add	hl, bc
	ld	hl, (hl)
	push	hl
	push	de
	push	iy
	jp	.LBB106_12
	.local	.LBB106_8
.LBB106_8:
	ld	de, _.str.16.564
	jp	.LBB106_22
	.local	.LBB106_9
.LBB106_9:
	ld	iy, 80
	ld.sis	de, 1
	ld	hl, (ix - 3)
                                        ; kill: def $hl killed $hl killed $uhl
	or	a, a
	sbc.sis	hl, de
	jp	nz, .LBB106_34
; %bb.10:
	ld	de, _.str.7.555
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	bc, 3
	call	__imulu
	push	hl
	pop	bc
	ld	hl, _InitializeMap.names
	add	hl, bc
	ld	hl, (hl)
	push	hl
	push	de
	jp	.LBB106_35
	.local	.LBB106_11
.LBB106_11:
	ld.sis	bc, 100
	ld	de, (ix - 3)
	ld	l, e
	ld	h, d
	call	__sdivu
	ex	de, hl
	ld	iyl, e
	ld	iyh, d
	ex	de, hl
	ld.sis	bc, -100
	call	__smulu
	add.sis	hl, de
	ld	de, 0
	ld	e, l
	ld	d, h
	push	de
	push	iy
	ld	hl, _.str.17.565
	push	hl
	.local	.LBB106_12
.LBB106_12:
	ld	hl, 80
	push	hl
	ld	hl, _ticker+53
	push	hl
	call	_snprintf
	ld	de, _ticker+53
	pop	hl
	jp	.LBB106_29
	.local	.LBB106_13
.LBB106_13:
	ld	hl, _.str.14.562
	jp	.LBB106_26
	.local	.LBB106_14
.LBB106_14:
	ld	hl, _.str.5.553
	ld	bc, 38
	jp	.LBB106_32
	.local	.LBB106_15
.LBB106_15:
	ld	de, _.str.2.550
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	bc, 28
	call	__imulu
	push	hl
	pop	bc
	ld	hl, _event_catalog
	jr	.LBB106_23
	.local	.LBB106_16
.LBB106_16:
	ld	hl, _.str.6.554
	jr	.LBB106_26
	.local	.LBB106_17
.LBB106_17:
	ld	de, _.str.11.559
	jr	.LBB106_22
	.local	.LBB106_18
.LBB106_18:
	ld	hl, _.str.4.552
	ld	bc, 32
	jp	.LBB106_32
	.local	.LBB106_19
.LBB106_19:
	ld	iy, _traits
	ld	de, _.str.9.557
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	bc, 22
	call	__imulu
	push	hl
	pop	bc
	add	iy, bc
	ld	hl, (iy)
	jr	.LBB106_24
	.local	.LBB106_20
.LBB106_20:
	ld	hl, _.str.18.566
	jr	.LBB106_26
	.local	.LBB106_21
.LBB106_21:
	ld	de, _.str.10.558
	.local	.LBB106_22
.LBB106_22:
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	bc, 3
	call	__imulu
	push	hl
	pop	bc
	ld	hl, _InitializeMap.names
	.local	.LBB106_23
.LBB106_23:
	add	hl, bc
	ld	hl, (hl)
	.local	.LBB106_24
.LBB106_24:
	push	hl
	push	de
	jr	.LBB106_27
	.local	.LBB106_25
.LBB106_25:
	ld	hl, _.str.15.563
	.local	.LBB106_26
.LBB106_26:
	ld	de, 0
	ld	bc, (ix - 3)
	ld	e, c
	ld	d, b
	push	de
	push	hl
	.local	.LBB106_27
.LBB106_27:
	ld	hl, 80
	push	hl
	.local	.LBB106_28
.LBB106_28:
	ld	hl, _ticker+53
	push	hl
	call	_snprintf
	ld	de, _ticker+53
	.local	.LBB106_29
.LBB106_29:
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	jp	.LBB106_33
	.local	.LBB106_30
.LBB106_30:
	ld	bc, 80
	ld.sis	de, 50
	ld	hl, (ix - 3)
                                        ; kill: def $hl killed $hl killed $uhl
	or	a, a
	sbc.sis	hl, de
	jr	nz, .LBB106_36
; %bb.31:
	ld	hl, _.str.12.560
	ld	bc, 34
	.local	.LBB106_32
.LBB106_32:
	ld	iy, _ticker+53
	lea	de, iy + 0
	ldir
	lea	de, iy + 0
	.local	.LBB106_33
.LBB106_33:
	ex	de, hl
	ld	sp, ix
	pop	ix
	ret
	.local	.LBB106_34
.LBB106_34:
	ld	hl, _.str.8.556
	ld	de, 0
	ld	bc, (ix - 3)
	ld	e, c
	ld	d, b
	push	de
	push	hl
	.local	.LBB106_35
.LBB106_35:
	push	iy
	jp	.LBB106_28
	.local	.LBB106_36
.LBB106_36:
	ld	iy, _.str.13.561
	or	a, a
	sbc	hl, hl
	ld	de, (ix - 3)
	ld	l, e
	ld	h, d
	push	hl
	push	iy
	push	bc
	jp	.LBB106_28
	.local	.Lfunc_end106
.Lfunc_end106:
	.size	_TickerText, .Lfunc_end106-_TickerText
	.section	.rodata._TickerText,"a",@progbits
JTI106_0:
	d24	.LBB106_6
	d24	.LBB106_18
	d24	.LBB106_14
	d24	.LBB106_16
	d24	.LBB106_9
	d24	.LBB106_19
	d24	.LBB106_21
	d24	.LBB106_17
	d24	.LBB106_30
	d24	.LBB106_13
	d24	.LBB106_25
	d24	.LBB106_8
	d24	.LBB106_11
	d24	.LBB106_20
	d24	.LBB106_7
	d24	.LBB106_15
                                        ; -- End function
	.section	.text._TickerPrepare,"ax",@progbits
	.globl	_TickerPrepare                  ; -- Begin function TickerPrepare
	.type	_TickerPrepare,@function
_TickerPrepare:                         ; @TickerPrepare
; %bb.0:
	call	__frameset0
	ld	bc, 0
	ld	a, (_ticker+48)
	or	a, a
	jp	z, .LBB107_6
; %bb.1:
	ld	a, (_ticker+52)
	bit	0, a
	jp	nz, .LBB107_6
; %bb.2:
	ld	hl, (ix + 6)
	ld	d, 0
	ld	iy, _ticker+44
	ld	e, 1
	ld	(iy), l
	ld	(iy + 1), h
	push	bc
	pop	iy
	ld	(_ticker+36), iy
	ld	a, d
	ld	(_ticker+39), a
	ld.sis	bc, 313
                                        ; kill: def $hl killed $hl killed $uhl
	or	a, a
	sbc.sis	hl, bc
	jr	nc, .LBB107_4
; %bb.3:
	ld	hl, 163840
	jr	.LBB107_5
	.local	.LBB107_4
.LBB107_4:
	ld	hl, 130760
	ld	a, iyl
	ld	bc, (ix + 6)
	ld	iyl, c
	ld	iyh, b
	push	hl
	pop	bc
	add	iy, bc
	ld	l, 15
	lea	bc, iy + 0
	call	__lshl
	push	bc
	pop	hl
	ld	iyl, e
	ld	e, a
	ld	bc, 16
	ld	a, d
	call	__ladd
	ld	bc, 24
	call	__ldivu
	ld	bc, 65536
	call	__ladd
	ld	d, e
	ld	e, iyl
	.local	.LBB107_5
.LBB107_5:
	ld	(_ticker+40), hl
	ld	a, d
	ld	(_ticker+43), a
	ld	a, e
	ld	(_ticker+52), a
	.local	.LBB107_6
.LBB107_6:
	pop	ix
	ret
	.local	.Lfunc_end107
.Lfunc_end107:
	.size	_TickerPrepare, .Lfunc_end107-_TickerPrepare
                                        ; -- End function
	.section	.text._TickerUpdate,"ax",@progbits
	.globl	_TickerUpdate                   ; -- Begin function TickerUpdate
	.type	_TickerUpdate,@function
_TickerUpdate:                          ; @TickerUpdate
; %bb.0:
	ld	hl, -5
	call	__frameset
	ld	a, (_ticker+48)
	or	a, a
	jp	z, .LBB108_25
; %bb.1:
	ld	a, (_ticker+52)
	bit	0, a
	jp	z, .LBB108_25
; %bb.2:
	ld	hl, (_ticker+40)
	ld	a, (_ticker+43)
	ld	e, a
	ld	iy, (_ticker+36)
	ld	a, (_ticker+39)
	ld	d, a
	lea	bc, iy + 0
	call	__lsub
	push	hl
	pop	bc
	ld	a, e
	ld	hl, (ix + 6)
	ld	e, (ix + 9)
	call	__lcmpu
	jr	nc, .LBB108_4
; %bb.3:
	lea	hl, iy + 0
	ld	e, d
	ld	bc, (ix + 6)
	ld	a, (ix + 9)
	call	__ladd
	ld	a, e
	ld	(_ticker+36), hl
	ld	(_ticker+39), a
	jp	.LBB108_25
	.local	.LBB108_4
.LBB108_4:
	or	a, a
	sbc	hl, hl
	ld	a, 1
	ld	(ix - 4), a
	push	hl
	call	_Remove
	ld	b, 0
	pop	hl
	ld	a, b
	ld	(_ticker+52), a
	or	a, a
	sbc	hl, hl
	ld	(_ticker+36), hl
	ld	(_ticker+39), a
	ld	a, (_ticker+48)
	cp	a, 2
	ld	l, a
	jr	nc, .LBB108_6
; %bb.5:
	ld	l, 1
	.local	.LBB108_6
.LBB108_6:
	ld	de, _ticker+4
	ld	(ix - 3), de
	ld	de, 0
	ld	e, l
	.local	.LBB108_7
.LBB108_7:                              ; =>This Inner Loop Header: Depth=1
	dec	de
	sbc	hl, hl
	adc	hl, de
	jp	z, .LBB108_19
; %bb.8:                                ;   in Loop: Header=BB108_7 Depth=1
	ld	(ix - 5), a                     ; 1-byte Folded Spill
	ld	hl, (ix - 3)
	ld	a, (hl)
	cp	a, 16
	jr	nc, .LBB108_11
; %bb.9:                                ;   in Loop: Header=BB108_7 Depth=1
	ld.sis	hl, -15841
	ld	c, a
	call	__sshru
	bit	0, l
	jr	z, .LBB108_11
; %bb.10:                               ;   in Loop: Header=BB108_7 Depth=1
	ld	iyl, b
	ld	bc, 0
	ld	c, a
	ld	hl, _switch.table.TickerUpdate.27
	add	hl, bc
	ld	b, iyl
	ld	a, (hl)
	jp	.LBB108_12
	.local	.LBB108_11
.LBB108_11:                             ;   in Loop: Header=BB108_7 Depth=1
	cp	a, 10
	ccf
                                        ; kill: def $a killed $a
	sbc	a, a
	inc	a
	.local	.LBB108_12
.LBB108_12:                             ;   in Loop: Header=BB108_7 Depth=1
	ld	iyh, a
	or	a, a
	sbc	hl, hl
	ld	iyl, b
	ld	l, b
	add	hl, hl
	add	hl, hl
	push	hl
	pop	bc
	ld	hl, _ticker
	add	hl, bc
	ld	a, (hl)
	cp	a, 16
	jr	nc, .LBB108_15
; %bb.13:                               ;   in Loop: Header=BB108_7 Depth=1
	ld.sis	hl, -15841
	ld	c, a
	call	__sshru
	bit	0, l
	jr	z, .LBB108_15
; %bb.14:                               ;   in Loop: Header=BB108_7 Depth=1
	ld	bc, 0
	ld	c, a
	ld	hl, _switch.table.TickerUpdate.27
	add	hl, bc
	ld	a, (hl)
	jp	.LBB108_16
	.local	.LBB108_15
.LBB108_15:                             ;   in Loop: Header=BB108_7 Depth=1
	cp	a, 10
	ccf
                                        ; kill: def $a killed $a
	sbc	a, a
	inc	a
	.local	.LBB108_16
.LBB108_16:                             ;   in Loop: Header=BB108_7 Depth=1
	cp	a, iyh
	ld	b, (ix - 4)                     ; 1-byte Folded Reload
	ld	a, (ix - 5)                     ; 1-byte Folded Reload
	jr	c, .LBB108_18
; %bb.17:                               ;   in Loop: Header=BB108_7 Depth=1
	ld	b, iyl
	.local	.LBB108_18
.LBB108_18:                             ;   in Loop: Header=BB108_7 Depth=1
	ld	iy, (ix - 3)
	lea	iy, iy + 4
	ld	(ix - 3), iy
	inc	(ix - 4)
	jp	.LBB108_7
	.local	.LBB108_19
.LBB108_19:
	or	a, a
	jr	z, .LBB108_25
; %bb.20:
	ld	a, b
	or	a, a
	jr	z, .LBB108_25
; %bb.21:
	ld	de, 0
	ld	e, b
	push	de
	pop	hl
	add	hl, hl
	add	hl, hl
	push	hl
	pop	bc
	ld	iy, _ticker
	add	iy, bc
	ld	bc, (iy)
	ld	a, (iy + 3)
	ex	de, hl
	add	hl, hl
	add	hl, hl
	.local	.LBB108_22
.LBB108_22:                             ; =>This Inner Loop Header: Depth=1
	ex	de, hl
	sbc	hl, hl
	adc	hl, de
	jr	z, .LBB108_24
; %bb.23:                               ;   in Loop: Header=BB108_22 Depth=1
	ld	iy, _ticker
	add	iy, de
	ld	hl, (iy - 4)
	ld	(ix - 3), bc
	ld	c, (iy - 1)
	ld	(iy), hl
	ld	(iy + 3), c
	ld	bc, (ix - 3)
	ex	de, hl
	ld	de, -4
	add	hl, de
	jr	.LBB108_22
	.local	.LBB108_24
.LBB108_24:
	ld	(_ticker), bc
	ld	(_ticker+3), a
	.local	.LBB108_25
.LBB108_25:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end108
.Lfunc_end108:
	.size	_TickerUpdate, .Lfunc_end108-_TickerUpdate
                                        ; -- End function
	.section	.text._TickerOffset,"ax",@progbits
	.globl	_TickerOffset                   ; -- Begin function TickerOffset
	.type	_TickerOffset,@function
_TickerOffset:                          ; @TickerOffset
; %bb.0:
	ld	hl, -3
	call	__frameset
	ld.sis	iy, 0
	ld	a, (_ticker+52)
	ld	l, a
	ld	a, (_ticker+39)
	ld	e, a
	bit	0, l
	jp	z, .LBB109_5
; %bb.1:
	ld	hl, _ticker+44
	ld	hl, (hl)
	ld.sis	bc, 313
	ld	(ix - 3), hl
                                        ; kill: def $hl killed $hl killed $uhl
	or	a, a
	sbc.sis	hl, bc
	jr	c, .LBB109_5
; %bb.2:
	ld	bc, 32769
	xor	a, a
	ld	hl, (_ticker+36)
	call	__lcmpu
	jr	c, .LBB109_5
; %bb.3:
	ld	d, -1
	ld	iy, 0
	ld	bc, (ix - 3)
	ld	iyl, c
	ld	iyh, b
	ld	bc, 24
	call	__lmulu
	ld	bc, -786432
	ld	a, d
	call	__ladd
	push	hl
	pop	bc
	ld	a, e
	ld	l, 15
	call	__lshru
	ld	de, -312
	add	iy, de
	or	a, a
	sbc	hl, hl
	ld	e, l
	lea	hl, iy + 0
	call	__lcmpu
	jr	c, .LBB109_5
; %bb.4:
	push	bc
	pop	iy
	.local	.LBB109_5
.LBB109_5:
	ex	de, hl
	ld	e, iyl
	ld	d, iyh
	ex	de, hl
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end109
.Lfunc_end109:
	.size	_TickerOffset, .Lfunc_end109-_TickerOffset
                                        ; -- End function
	.section	.text._TickerObserve,"ax",@progbits
	.globl	_TickerObserve                  ; -- Begin function TickerObserve
	.type	_TickerObserve,@function
_TickerObserve:                         ; @TickerObserve
; %bb.0:
	ld	hl, -22
	call	__frameset
	ld	iy, (ix + 6)
	ld	hl, _ticker+46
	ld	a, 9
	ld	de, 6
	ld	(ix - 6), de
	ld	de, (iy + 26)
	ld	hl, (hl)
                                        ; kill: def $hl killed $hl killed $uhl
	call	__snot
	ld	c, l
	ld	b, h
	ld	l, e
	ld	h, d
	call	__sand
	ld	iy, 0
	ex	de, hl
	ld	iyl, e
	ld	iyh, d
	ex	de, hl
	.local	.LBB110_1
.LBB110_1:                              ; =>This Inner Loop Header: Depth=1
	ld	e, a
	or	a, a
	jr	z, .LBB110_4
; %bb.2:                                ;   in Loop: Header=BB110_1 Depth=1
	ld	a, e
	dec	a
	ld	hl, 1
	ld	c, a
	call	__ishl
	lea	bc, iy + 0
	call	__iand
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	z, .LBB110_1
; %bb.3:
	ld	iy, 0
	lea	bc, iy + 0
	ld	c, e
	ld	iy, _TickerObserve.affected
	add	iy, bc
	ld	a, (iy - 1)
	ld	de, 0
	push	de
	pop	hl
	ld	l, a
	push	hl
	push	de
	ld	hl, 8
	push	hl
	call	_TickerPost
	pop	hl
	pop	hl
	pop	hl
	.local	.LBB110_4
.LBB110_4:                              ; %.loopexit5
	ld	iy, (ix + 6)
	ld	l, (iy + 28)
	ld	a, (_ticker+50)
	ld	e, -1
	xor	a, e
	ld	e, a
	ld	a, e
	and	a, l
	ld	b, a
	.local	.LBB110_5
.LBB110_5:                              ; =>This Inner Loop Header: Depth=1
	ld	de, (ix - 6)
	sbc	hl, hl
	adc	hl, de
	jp	z, .LBB110_8
; %bb.6:                                ;   in Loop: Header=BB110_5 Depth=1
	push	de
	pop	hl
	dec	hl
	ld	(ix - 6), hl
	ld	c, e
	dec	c
	ld	hl, 1
	call	__ishl
                                        ; kill: def $l killed $l killed $uhl
	ld	a, b
	and	a, l
	ld	l, a
	or	a, a
	jp	z, .LBB110_5
; %bb.7:
	ld	hl, _TickerObserve.deaths
	push	hl
	pop	iy
	add	iy, de
	ld	a, (iy - 1)
	ld	de, 0
	push	de
	pop	hl
	ld	l, a
	push	hl
	push	de
	ld	hl, 9
	push	hl
	call	_TickerPost
	ld	iy, (ix + 6)
	pop	hl
	pop	hl
	pop	hl
	.local	.LBB110_8
.LBB110_8:                              ; %.loopexit4
	ld	a, (iy + 30)
	ld	(ix - 9), a
	ld	hl, (ix + 9)
	ld	(ix - 6), hl
	xor	a, a
	ld	l, a
	ld	(ix - 12), hl
	ld	(ix - 14), l
	ld	(ix - 13), h
	ld	de, 0
	.local	.LBB110_9
.LBB110_9:                              ; =>This Inner Loop Header: Depth=1
	ld	(ix - 15), l
	push	de
	pop	hl
	ld	bc, 7
	or	a, a
	sbc	hl, bc
	jp	z, .LBB110_17
; %bb.10:                               ;   in Loop: Header=BB110_9 Depth=1
	ld	a, (_ticker+49)
	push	de
	pop	bc
	ld	l, -1
	xor	a, l
	ld	e, a
	ld	hl, 1
	ld	(ix - 18), bc
                                        ; kill: def $c killed $c killed $ubc
	call	__ishl
	push	hl
	pop	iy
	ld	c, (ix - 9)                     ; 1-byte Folded Reload
	ld	a, c
	and	a, e
	ld	l, a
	ld	e, iyl
	ld	a, l
	and	a, e
	ld	l, a
	or	a, a
	jr	z, .LBB110_12
; %bb.11:                               ;   in Loop: Header=BB110_9 Depth=1
	or	a, a
	sbc	hl, hl
	push	hl
	ld	hl, (ix - 12)
	push	hl
	ld	hl, 7
	push	hl
	ld	(ix - 9), iy
	call	_TickerPost
	ld	iy, (ix + 6)
	pop	hl
	pop	hl
	pop	hl
	ld	c, (iy + 30)
	ld	iy, (ix - 9)
	.local	.LBB110_12
.LBB110_12:                             ;   in Loop: Header=BB110_9 Depth=1
	or	a, a
	sbc	hl, hl
	ld	l, c
	ld	(ix - 9), c
	ld	e, iyl
	ld	a, l
	and	a, e
	ld	l, a
	or	a, a
	ld	a, 1
	jr	nz, .LBB110_14
; %bb.13:                               ;   in Loop: Header=BB110_9 Depth=1
	ld	a, 0
	.local	.LBB110_14
.LBB110_14:                             ;   in Loop: Header=BB110_9 Depth=1
	ld	iyl, a
	ld	hl, (ix - 6)
	ld	de, (hl)
	or	a, a
	sbc	hl, hl
	ld	a, (ix - 15)                    ; 1-byte Folded Reload
	ld	l, a
	ld	bc, 6
	call	__imulu
	push	hl
	pop	bc
	ld	hl, (ix + 9)
	add	hl, bc
	ld	hl, (hl)
                                        ; kill: def $hl killed $hl killed $uhl
	or	a, a
	sbc.sis	hl, de
	ld	bc, (ix - 12)
	ld	l, c
	jr	c, .LBB110_16
; %bb.15:                               ;   in Loop: Header=BB110_9 Depth=1
	ld	l, a
	.local	.LBB110_16
.LBB110_16:                             ;   in Loop: Header=BB110_9 Depth=1
	ld	e, (ix - 14)
	ld	d, (ix - 13)
	ex	de, hl
	ld	d, iyl
	ex	de, hl
	ld	a, e
	add	a, h
	ld	e, a
	ld	(ix - 14), e
	ld	(ix - 13), d
	ld	de, (ix - 18)
	inc	de
	inc	c
	ld	(ix - 12), bc
	ld	iy, (ix - 6)
	lea	iy, iy + 6
	ld	(ix - 6), iy
	ld	iy, (ix + 6)
	jp	.LBB110_9
	.local	.LBB110_17
.LBB110_17:
	ld	a, (ix - 9)                     ; 1-byte Folded Reload
	ld	(_ticker+49), a
	ld	hl, (iy + 26)
	lea	de, iy + 0
	ld	iy, _ticker+46
	ld	(iy), l
	ld	(iy + 1), h
	push	de
	pop	iy
	ld	a, (iy + 28)
	ld	(_ticker+50), a
	ld	a, (_ticker+48)
	or	a, a
	jp	nz, .LBB110_39
; %bb.18:
	ld	a, (iy + 33)
	or	a, a
	jp	z, .LBB110_39
; %bb.19:
	ld	a, (iy + 34)
	or	a, a
	jp	nz, .LBB110_39
; %bb.20:
	ld	hl, (iy + 8)
	ld	e, (iy + 11)
	call	__lcmpzero
	jp	z, .LBB110_39
; %bb.21:
	ld	e, 7
	ld	a, l
	and	a, e
	ld	l, a
	or	a, a
	jp	nz, .LBB110_39
; %bb.22:
	or	a, a
	sbc	hl, hl
	ld	l, (ix - 15)                    ; 1-byte Folded Reload
	ld	bc, 6
	call	__imulu
	ld	c, (ix - 14)
	ld	b, (ix - 13)
	ex	de, hl
	ld	hl, (ix + 9)
	add	hl, de
	ld	(ix - 21), hl
	ld	h, 0
	ld	(ix - 18), l
	ld	(ix - 17), h
	ld	b, h
	ld	a, 4
	.local	.LBB110_23
.LBB110_23:                             ; =>This Inner Loop Header: Depth=1
	ld	(ix - 6), a                     ; 1-byte Folded Spill
	or	a, a
	jp	z, .LBB110_39
; %bb.24:                               ;   in Loop: Header=BB110_23 Depth=1
	ld	a, (_ticker+51)
	ld	l, a
	inc	a
	ld	e, 3
	and	a, e
	ld	e, a
	ld	(_ticker+51), a
	ld	a, l
	or	a, a
	jr	nz, .LBB110_26
; %bb.25:                               ;   in Loop: Header=BB110_23 Depth=1
	ld	a, c
	or	a, a
	ld	l, c
	ld	h, b
	ld	(ix - 12), hl
	ld	a, 0
	ld	l, a
	ld	(ix - 9), hl
	ld	d, 10
	jp	nz, .LBB110_33
	jp	.LBB110_37
	.local	.LBB110_26
.LBB110_26:                             ;   in Loop: Header=BB110_23 Depth=1
	ld	a, l
	cp	a, 1
	jp	nz, .LBB110_28
; %bb.27:                               ;   in Loop: Header=BB110_23 Depth=1
	ld	hl, (ix - 21)
	ld	hl, (hl)
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	ld.sis	hl, 0
                                        ; kill: def $hl killed $hl def $uhl
	ld	(ix - 12), hl
	ld	l, (ix - 15)                    ; 1-byte Folded Reload
	ld	(ix - 9), hl
	ld	d, 11
	jp	nz, .LBB110_33
	jp	.LBB110_37
	.local	.LBB110_28
.LBB110_28:                             ;   in Loop: Header=BB110_23 Depth=1
	ld	a, l
	cp	a, 2
	jr	nz, .LBB110_31
; %bb.29:                               ;   in Loop: Header=BB110_23 Depth=1
	ld	a, (iy + 35)
	cp	a, 2
	jp	c, .LBB110_37
; %bb.30:                               ;   in Loop: Header=BB110_23 Depth=1
	ld	hl, (iy + 22)
	ld	(ix - 12), hl
	xor	a, a
	ld	l, a
	ld	(ix - 9), hl
	ld	d, 12
	jp	.LBB110_33
	.local	.LBB110_31
.LBB110_31:                             ;   in Loop: Header=BB110_23 Depth=1
	ld	a, (iy + 32)
	cp	a, 2
	jp	nz, .LBB110_37
; %bb.32:                               ;   in Loop: Header=BB110_23 Depth=1
	ld	e, (ix - 18)
	ld	d, (ix - 17)
	ld	e, (iy + 36)
	ld.sis	hl, 3
	ld	(ix - 18), e
	ld	(ix - 17), d
	or	a, a
	sbc.sis	hl, de
                                        ; kill: def $hl killed $hl def $uhl
	ld	(ix - 12), hl
	xor	a, a
	ld	l, a
	ld	(ix - 9), hl
	ld	d, 13
	.local	.LBB110_33
.LBB110_33:                             ;   in Loop: Header=BB110_23 Depth=1
	ld	a, (_ticker+32)
	ld	e, a
	ld	a, (_ticker+33)
	ld	l, a
	ld	a, d
	cp	a, e
	jp	nz, .LBB110_36
; %bb.34:                               ;   in Loop: Header=BB110_23 Depth=1
	ld	e, l
	ld	hl, (ix - 9)
	ld	a, l
	cp	a, e
	jp	nz, .LBB110_36
; %bb.35:                               ;   in Loop: Header=BB110_23 Depth=1
	ld	hl, _ticker+34
	ld	a, d
	ld	de, (hl)
	ld	hl, (ix - 12)
                                        ; kill: def $hl killed $hl killed $uhl
	or	a, a
	sbc.sis	hl, de
	ld	d, a
	jr	z, .LBB110_37
	.local	.LBB110_36
.LBB110_36:                             ;   in Loop: Header=BB110_23 Depth=1
	ld	(ix - 22), d
	or	a, a
	sbc	hl, hl
	ld	l, d
	ld	de, (ix - 12)
	push	de
	ld	de, (ix - 9)
	push	de
	push	hl
	ld	(ix - 14), c
	ld	(ix - 13), b
	call	_TickerPost
	ld	c, (ix - 14)
	ld	b, (ix - 13)
	ld	iy, (ix + 6)
	pop	hl
	pop	hl
	pop	hl
	bit	0, a
	jr	nz, .LBB110_38
	.local	.LBB110_37
.LBB110_37:                             ;   in Loop: Header=BB110_23 Depth=1
	ld	a, (ix - 6)                     ; 1-byte Folded Reload
	dec	a
	jp	.LBB110_23
	.local	.LBB110_38
.LBB110_38:
	push	hl
	ld	l, (ix - 18)
	ld	h, (ix - 17)
	ex	(sp), hl
	pop	iy
	push	af
	ld	a, iyh
	ld	(ix - 3), a
	pop	af
	ld	bc, (ix - 5)
	ld	hl, (ix - 12)
	ld	b, h
	ld	c, l
	or	a, a
	sbc	hl, hl
	ld	d, l
	ld	l, 16
	ld	a, d
	call	__lshl
	ld	(ix - 6), bc
	ld	(ix - 12), a                    ; 1-byte Folded Spill
	push	af
	ld	a, iyh
	ld	(ix - 2), a
	pop	af
	ld	bc, (ix - 4)
	ld	b, iyh
	ld	hl, (ix - 9)
	ld	c, l
	ld	l, 8
	ld	a, d
	call	__lshl
	push	bc
	pop	hl
	ld	e, a
	ld	bc, (ix - 6)
	ld	a, (ix - 12)                    ; 1-byte Folded Reload
	call	__ladd
	push	af
	ld	a, iyh
	ld	(ix - 1), a
	pop	af
	ld	bc, (ix - 3)
	ld	b, iyh
	ld	c, (ix - 22)                    ; 1-byte Folded Reload
	ld	a, d
	call	__ladd
	ld	a, e
	ld	(_ticker+32), hl
	ld	(_ticker+35), a
	.local	.LBB110_39
.LBB110_39:                             ; %.loopexit
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end110
.Lfunc_end110:
	.size	_TickerObserve, .Lfunc_end110-_TickerObserve
                                        ; -- End function
	.section	.text._TickerRender,"ax",@progbits
	.globl	_TickerRender                   ; -- Begin function TickerRender
	.type	_TickerRender,@function
_TickerRender:                          ; @TickerRender
; %bb.0:
	ld	hl, -3
	call	__frameset
	call	_TickerText
	ld	a, (_ticker+48)
	or	a, a
	jp	z, .LBB111_10
; %bb.1:
	ld	(ix - 3), hl
	ld	hl, 316
	ld	de, 29
	ld	a, (_ticker+52)
	bit	0, a
	jr	nz, .LBB111_3
; %bb.2:
	ld	hl, (ix - 3)
	push	hl
	call	_gfx_GetStringWidth
	pop	de
	push	hl
	call	_TickerPrepare
	ld	de, 29
	pop	hl
	ld	hl, 316
	.local	.LBB111_3
.LBB111_3:
	push	de
	push	hl
	ld	hl, 20
	push	hl
	ld	hl, 4
	push	hl
	call	_gfx_SetClipRegion
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 1
	push	hl
	call	_gfx_SetTextConfig
	ld	de, 255
	pop	hl
	ld	a, (_ticker)
	cp	a, 16
	push	de
	pop	hl
	jr	nc, .LBB111_9
; %bb.4:
	ld.sis	hl, -15841
	ld	c, a
	call	__sshru
	bit	0, l
	ex	de, hl
	jr	z, .LBB111_9
; %bb.5:
	ld	l, -32
	cp	a, 15
	jr	z, .LBB111_7
; %bb.6:
	ld	a, 0
	jr	.LBB111_8
	.local	.LBB111_7
.LBB111_7:
	ld	a, -1
	.local	.LBB111_8
.LBB111_8:
	or	a, l
	ld	l, a
	.local	.LBB111_9
.LBB111_9:                              ; %TickerPriority.exit
	push	hl
	call	_gfx_SetTextFGColor
	pop	hl
	call	_TickerOffset
	ld	de, 0
	ld	e, l
	ld	d, h
	ld	hl, 4
	or	a, a
	sbc	hl, de
	ld	de, 20
	push	de
	push	hl
	ld	hl, (ix - 3)
	push	hl
	call	_gfx_PrintStringXY
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 2
	push	hl
	call	_gfx_SetTextConfig
	pop	hl
	ld	hl, 240
	push	hl
	ld	hl, 320
	push	hl
	or	a, a
	sbc	hl, hl
	push	hl
	push	hl
	call	_gfx_SetClipRegion
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 255
	push	hl
	call	_gfx_SetTextFGColor
	pop	hl
	.local	.LBB111_10
.LBB111_10:
	pop	hl
	pop	ix
	ret
	.local	.Lfunc_end111
.Lfunc_end111:
	.size	_TickerRender, .Lfunc_end111-_TickerRender
                                        ; -- End function
	.section	.text._RecountRegion,"ax",@progbits
	.globl	_RecountRegion                  ; -- Begin function RecountRegion
	.type	_RecountRegion,@function
_RecountRegion:                         ; @RecountRegion
; %bb.0:
	ld	hl, -9
	call	__frameset
	ld	iy, (ix + 6)
	ld	a, (iy + 6)
	or	a, a
	sbc	hl, hl
	push	hl
	pop	bc
	ld	c, a
	ld	a, (iy + 7)
	ld	l, a
	call	__imulu
	push	hl
	pop	bc
	lea	hl, iy + 10
	ld	(iy + 10), 0
	push	bc
	pop	iy
	push	hl
	pop	de
	inc	de
	ld	bc, 5
	ldir
	ld	bc, 0
	ld.sis	hl, 0
	ld	(ix - 5), l
	ld	(ix - 4), h
	ld	(ix - 7), l
	ld	(ix - 6), h
	ld	(ix - 9), l
	ld	(ix - 8), h
	.local	.LBB112_1
.LBB112_1:                              ; =>This Inner Loop Header: Depth=1
	lea	hl, iy + 0
	or	a, a
	sbc	hl, bc
	jr	z, .LBB112_9
; %bb.2:                                ;   in Loop: Header=BB112_1 Depth=1
	ld	(ix - 3), iy
	ld	iy, (ix + 6)
	ld	hl, (iy + 3)
	push	bc
	pop	de
	add	hl, bc
	ld	a, (hl)
	cp	a, -32
	jr	nz, .LBB112_4
; %bb.3:                                ;   in Loop: Header=BB112_1 Depth=1
	ld	l, (ix - 5)
	ld	h, (ix - 4)
	inc.sis	hl
	ld	(ix - 5), l
	ld	(ix - 4), h
	ld	(iy + 12), l
	ld	(iy + 13), h
	jr	.LBB112_8
	.local	.LBB112_4
.LBB112_4:                              ;   in Loop: Header=BB112_1 Depth=1
	cp	a, -1
	jr	nz, .LBB112_6
; %bb.5:                                ;   in Loop: Header=BB112_1 Depth=1
	ld	l, (ix - 7)
	ld	h, (ix - 6)
	inc.sis	hl
	ld	(ix - 7), l
	ld	(ix - 6), h
	ld	(iy + 10), l
	ld	(iy + 11), h
	jr	.LBB112_8
	.local	.LBB112_6
.LBB112_6:                              ;   in Loop: Header=BB112_1 Depth=1
	cp	a, 64
	jr	nz, .LBB112_8
; %bb.7:                                ;   in Loop: Header=BB112_1 Depth=1
	ld	l, (ix - 9)
	ld	h, (ix - 8)
	inc.sis	hl
	ld	(ix - 9), l
	ld	(ix - 8), h
	ld	(iy + 14), l
	ld	(iy + 15), h
	.local	.LBB112_8
.LBB112_8:                              ;   in Loop: Header=BB112_1 Depth=1
	push	de
	pop	bc
	inc	bc
	ld	iy, (ix - 3)
	jr	.LBB112_1
	.local	.LBB112_9
.LBB112_9:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end112
.Lfunc_end112:
	.size	_RecountRegion, .Lfunc_end112-_RecountRegion
                                        ; -- End function
	.section	.text._CountWorld,"ax",@progbits
	.globl	_CountWorld                     ; -- Begin function CountWorld
	.type	_CountWorld,@function
_CountWorld:                            ; @CountWorld
; %bb.0:
	ld	hl, -11
	call	__frameset
	or	a, a
	sbc	hl, hl
	ld	(ix - 3), hl
	ld	de, 112
	ld	(ix - 8), l
	ld	(ix - 7), h
	ld	(ix - 5), l
	ld	(ix - 4), h
	ld	(ix - 11), l
	ld	(ix - 10), h
	.local	.LBB113_1
.LBB113_1:                              ; =>This Inner Loop Header: Depth=1
	ld	hl, (ix - 3)
	push	de
	pop	bc
	or	a, a
	sbc	hl, de
	jp	z, .LBB113_3
; %bb.2:                                ;   in Loop: Header=BB113_1 Depth=1
	ld	iy, (ix + 9)
	ld	de, (ix - 3)
	add	iy, de
	ld	hl, (iy + 10)
	ld	e, (ix - 11)
	ld	d, (ix - 10)
	add.sis	hl, de
	ld	(ix - 11), hl
	ld	hl, (iy + 12)
	ld	e, (ix - 8)
	ld	d, (ix - 7)
	add.sis	hl, de
	ld	(ix - 8), hl
	ld	hl, (iy + 14)
	ld	e, (ix - 5)
	ld	d, (ix - 4)
	add.sis	hl, de
	ld	iy, (ix - 3)
	ld	de, 16
	add	iy, de
	ld	(ix - 3), iy
                                        ; kill: def $hl killed $hl killed $uhl
	ld	(ix - 5), l
	ld	(ix - 4), h
	ld	hl, (ix - 8)
                                        ; kill: def $hl killed $hl killed $uhl
	ld	(ix - 8), l
	ld	(ix - 7), h
	ld	hl, (ix - 11)
                                        ; kill: def $hl killed $hl killed $uhl
	ld	(ix - 11), l
	ld	(ix - 10), h
	push	bc
	pop	de
	jp	.LBB113_1
	.local	.LBB113_3
.LBB113_3:
	ld	iy, (ix + 6)
	ld	l, (ix - 11)
	ld	h, (ix - 10)
	ld	(iy), l
	ld	(iy + 1), h
	ld	l, (ix - 8)
	ld	h, (ix - 7)
	ld	(iy + 2), l
	ld	(iy + 3), h
	ld	l, (ix - 5)
	ld	h, (ix - 4)
	ld	(iy + 4), l
	ld	(iy + 5), h
	lea	hl, iy + 0
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end113
.Lfunc_end113:
	.size	_CountWorld, .Lfunc_end113-_CountWorld
                                        ; -- End function
	.section	.text._SetCell,"ax",@progbits
	.globl	_SetCell                        ; -- Begin function SetCell
	.type	_SetCell,@function
_SetCell:                               ; @SetCell
; %bb.0:
	ld	hl, -3
	call	__frameset
	ld	iy, (ix + 6)
	ld	de, (ix + 9)
	ld	a, (iy + 6)
	or	a, a
	sbc	hl, hl
	push	hl
	pop	bc
	ld	c, a
	ld	a, (iy + 7)
	ld	l, a
	call	__imulu
	push	hl
	pop	bc
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	jr	nc, .LBB114_8
; %bb.1:
	ld	b, (ix + 12)
	ld	hl, (iy + 3)
	ld	(ix - 3), hl
	add	hl, de
	ld	c, (hl)
	ld	a, b
	cp	a, -32
	jr	nz, .LBB114_4
; %bb.2:
	ld	a, c
	cp	a, -1
	jr	nz, .LBB114_4
; %bb.3:
	ld	bc, 10
	ld	de, 12
	jr	.LBB114_7
	.local	.LBB114_4
.LBB114_4:
	ld	a, b
	cp	a, 64
	jr	nz, .LBB114_8
; %bb.5:
	ld	a, c
	cp	a, -32
	ld	a, 0
	jr	nz, .LBB114_9
; %bb.6:
	ld	hl, 14
	ld	bc, 12
	ex	de, hl
	.local	.LBB114_7
.LBB114_7:
	ld	a, 1
	lea	hl, iy + 0
	add	hl, bc
	lea	bc, iy + 0
	push	hl
	pop	iy
	ld	hl, (hl)
	dec.sis	hl
	ld	(iy), l
	ld	(iy + 1), h
	push	bc
	pop	iy
	add	iy, de
	ld	hl, (iy)
	inc.sis	hl
	ld	(iy), l
	ld	(iy + 1), h
	ld	de, (ix + 9)
	ld	iy, (ix - 3)
	add	iy, de
	ld	l, (ix + 12)
	ld	(iy), l
	jr	.LBB114_9
	.local	.LBB114_8
.LBB114_8:
	xor	a, a
	.local	.LBB114_9
.LBB114_9:
	pop	hl
	pop	ix
	ret
	.local	.Lfunc_end114
.Lfunc_end114:
	.size	_SetCell, .Lfunc_end114-_SetCell
                                        ; -- End function
	.section	.text._InfectCoordinate,"ax",@progbits
	.globl	_InfectCoordinate               ; -- Begin function InfectCoordinate
	.type	_InfectCoordinate,@function
_InfectCoordinate:                      ; @InfectCoordinate
; %bb.0:
	ld	hl, -12
	call	__frameset
	ld	iy, (ix + 6)
	xor	a, a
	ld	de, 0
	ld	bc, 7
	.local	.LBB115_1
.LBB115_1:                              ; =>This Inner Loop Header: Depth=1
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	jp	z, .LBB115_9
; %bb.2:                                ;   in Loop: Header=BB115_1 Depth=1
	ld	(ix - 6), de
	ld	a, (iy + 8)
	ld	bc, 0
	push	bc
	pop	de
	ld	e, a
	ld	hl, (ix + 12)
	or	a, a
	sbc	hl, de
	ex	de, hl
	ld	a, (iy + 9)
	ld	c, a
	ld	hl, (ix + 15)
	or	a, a
	sbc	hl, bc
	ld	(ix - 3), iy
	push	hl
	pop	iy
	ld	(ix - 9), de
	ex	de, hl
	ld	bc, 0
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	jp	m, .LBB115_7
; %bb.3:                                ;   in Loop: Header=BB115_1 Depth=1
	lea	hl, iy + 0
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	jp	m, .LBB115_7
; %bb.4:                                ;   in Loop: Header=BB115_1 Depth=1
	lea	de, iy + 0
	ld	iy, (ix - 3)
	ld	a, (iy + 6)
	or	a, a
	sbc	hl, hl
	push	hl
	pop	bc
	ld	c, a
	ld	hl, (ix - 9)
	sbc	hl, bc
	jr	nc, .LBB115_7
; %bb.5:                                ;   in Loop: Header=BB115_1 Depth=1
	ld	iy, (ix - 3)
	or	a, a
	sbc	hl, hl
	ld	(ix - 12), bc
	push	hl
	pop	bc
	ld	c, (iy + 7)
	push	de
	pop	hl
	sbc	hl, bc
	ld	bc, (ix - 12)
	jr	nc, .LBB115_7
; %bb.6:                                ;   in Loop: Header=BB115_1 Depth=1
	ex	de, hl
	call	__imulu
	ld	de, (ix - 9)
	add	hl, de
	ld	de, 224
	push	de
	push	hl
	ld	hl, (ix - 3)
	push	hl
	call	_SetCell
	pop	hl
	pop	hl
	pop	hl
	bit	0, a
	jr	nz, .LBB115_8
	.local	.LBB115_7
.LBB115_7:                              ;   in Loop: Header=BB115_1 Depth=1
	ld	de, (ix - 6)
	inc	de
	ld	iy, (ix - 3)
	lea	iy, iy + 16
	ld	bc, 7
	xor	a, a
	jp	.LBB115_1
	.local	.LBB115_8
.LBB115_8:
	ld	hl, 1
	ld	bc, (ix - 6)
	call	__ishl
	ld	iy, (ix + 9)
	ld	a, (iy + 30)
                                        ; kill: def $l killed $l killed $uhl
	or	a, l
	ld	l, a
	ld	(iy + 30), l
	push	bc
	pop	hl
	ld	de, 7
	or	a, a
	sbc	hl, de
                                        ; kill: def $a killed $a
	sbc	a, a
	.local	.LBB115_9
.LBB115_9:                              ; %.loopexit
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end115
.Lfunc_end115:
	.size	_InfectCoordinate, .Lfunc_end115-_InfectCoordinate
                                        ; -- End function
	.section	.text._SeedRegion,"ax",@progbits
	.globl	_SeedRegion                     ; -- Begin function SeedRegion
	.type	_SeedRegion,@function
_SeedRegion:                            ; @SeedRegion
; %bb.0:
	ld	hl, -12
	call	__frameset
	ld	a, (ix + 12)
	ld	l, 0
	ld	de, 0
	cp	a, 7
	jr	c, .LBB116_2
; %bb.1:
	ld	a, l
	jr	.LBB116_5
	.local	.LBB116_2
.LBB116_2:
	ld	iy, (ix + 6)
	push	de
	pop	hl
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	push	hl
	pop	bc
	add	iy, bc
	ld	hl, (iy + 10)
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	jr	z, .LBB116_4
; %bb.3:
	ld	a, (iy + 6)
	push	de
	pop	bc
	ld	c, a
	ld	(ix - 3), iy
	ld	a, (iy + 7)
	ld	e, a
	ex	de, hl
	call	__imulu
	ex	de, hl
	sbc	hl, hl
	adc	hl, de
	jr	nz, .LBB116_6
	.local	.LBB116_4
.LBB116_4:
	xor	a, a
	.local	.LBB116_5
.LBB116_5:                              ; %.loopexit
	ld	sp, ix
	pop	ix
	ret
	.local	.LBB116_6
.LBB116_6:
	ld	hl, (ix + 15)
	push	de
	ld	(ix - 6), de
	call	__indcallhl
	pop	de
	ld	bc, (ix - 6)
	ld	de, 0
	ld	e, l
	ld	d, h
	ld	iy, 224
	push	bc
	pop	hl
	.local	.LBB116_7
.LBB116_7:                              ; =>This Inner Loop Header: Depth=1
	ld	(ix - 9), hl
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	z, .LBB116_4
; %bb.8:                                ;   in Loop: Header=BB116_7 Depth=1
	push	de
	pop	hl
	call	__iremu
	push	iy
	push	hl
	ld	hl, (ix - 3)
	push	hl
	ld	(ix - 12), de
	call	_SetCell
	ld	iy, 224
	ld	de, (ix - 12)
	ld	bc, (ix - 6)
	pop	hl
	pop	hl
	pop	hl
	inc	de
	ld	hl, (ix - 9)
	dec	hl
	bit	0, a
	jr	z, .LBB116_7
; %bb.9:
	ld	hl, 1
	ld	c, (ix + 12)
	call	__ishl
	ld	iy, (ix + 9)
	ld	a, (iy + 30)
                                        ; kill: def $l killed $l killed $uhl
	or	a, l
	ld	l, a
	ld	(iy + 30), l
	ld	a, 1
	jp	.LBB116_5
	.local	.Lfunc_end116
.Lfunc_end116:
	.size	_SeedRegion, .Lfunc_end116-_SeedRegion
                                        ; -- End function
	.section	.text._StepRegion,"ax",@progbits
	.globl	_StepRegion                     ; -- Begin function StepRegion
	.type	_StepRegion,@function
_StepRegion:                            ; @StepRegion
; %bb.0:
	ld	hl, -18
	call	__frameset
	ld	iy, (ix + 6)
	ld	de, 0
	push	de
	pop	hl
	.local	.LBB117_1
.LBB117_1:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB117_3 Depth 2
	ld	a, (iy + 6)
	push	de
	pop	bc
	ld	e, a
	ld	(ix - 3), hl
	or	a, a
	sbc	hl, de
	jp	nc, .LBB117_19
; %bb.2:                                ; %.preheader.preheader
                                        ;   in Loop: Header=BB117_1 Depth=1
	push	bc
	pop	hl
	.local	.LBB117_3
.LBB117_3:                              ; %.preheader
                                        ;   Parent Loop BB117_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	push	bc
	pop	de
	ld	a, (iy + 7)
	ld	e, a
	push	hl
	pop	bc
	or	a, a
	sbc	hl, de
	jp	nc, .LBB117_18
; %bb.4:                                ;   in Loop: Header=BB117_3 Depth=2
	ld	iy, (ix + 6)
	ld	a, (iy + 6)
	ld	de, 0
	ld	e, a
	ld	(ix - 6), bc
	push	bc
	pop	hl
	push	de
	pop	bc
	call	__imulu
	ld	de, (ix - 3)
	add	hl, de
	ex	de, hl
	ld	hl, (iy + 3)
	ld	(ix - 9), de
	add	hl, de
	ld	a, (hl)
	cp	a, -32
	jp	nz, .LBB117_17
; %bb.5:                                ;   in Loop: Header=BB117_3 Depth=2
	ld	hl, (ix + 9)
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	jp	z, .LBB117_13
; %bb.6:                                ;   in Loop: Header=BB117_3 Depth=2
	ld	hl, (ix + 9)
                                        ; kill: def $hl killed $hl killed $uhl
	ld.sis	de, 10000
	or	a, a
	sbc.sis	hl, de
	jr	nc, .LBB117_8
; %bb.7:                                ; %Roll.exit
                                        ;   in Loop: Header=BB117_3 Depth=2
	ld	hl, 10000
	push	hl
	ld	hl, (ix + 15)
	call	__indcallhl
	pop	de
	ld	de, (ix + 9)
	or	a, a
	sbc.sis	hl, de
	jp	nc, .LBB117_13
	.local	.LBB117_8
.LBB117_8:                              ; %Roll.exit.thread
                                        ;   in Loop: Header=BB117_3 Depth=2
	ld	hl, 3
	push	hl
	ld	hl, (ix + 15)
	call	__indcallhl
	pop	de
	ld	de, 0
	ld	e, l
	ld	d, h
	ld	hl, (ix - 3)
	add	hl, de
	ld	(ix - 12), hl
	ld	(ix - 15), hl
	ld	hl, 3
	push	hl
	ld	hl, (ix + 15)
	call	__indcallhl
	pop	de
	ld	de, 0
	ld	e, l
	ld	d, h
	ld	iy, (ix - 6)
	add	iy, de
	lea	de, iy + 0
	ld	bc, -1
	add	iy, bc
                                        ; kill: def $a killed $a
	sbc	a, a
	ld	hl, (ix - 12)
	add	hl, bc
	ld	(ix - 12), hl
	jr	nc, .LBB117_13
; %bb.9:                                ; %Roll.exit.thread
                                        ;   in Loop: Header=BB117_3 Depth=2
	bit	0, a
	jr	z, .LBB117_13
; %bb.10:                               ;   in Loop: Header=BB117_3 Depth=2
	lea	hl, iy + 0
	ld	iy, (ix + 6)
	ld	a, (iy + 6)
	ld	bc, 0
	ld	c, a
	ld	(ix - 18), hl
	push	bc
	pop	hl
	push	de
	pop	iy
	ld	de, (ix - 15)
	or	a, a
	sbc	hl, de
	lea	de, iy + 0
	jr	c, .LBB117_13
; %bb.11:                               ;   in Loop: Header=BB117_3 Depth=2
	ld	iy, (ix + 6)
	ld	a, (iy + 7)
	or	a, a
	sbc	hl, hl
	ld	l, a
	sbc	hl, de
	ld	hl, (ix - 18)
	jr	c, .LBB117_13
; %bb.12:                               ;   in Loop: Header=BB117_3 Depth=2
	call	__imulu
	ex	de, hl
	ld	iy, (ix - 12)
	add	iy, de
	ld	hl, 224
	push	hl
	push	iy
	ld	hl, (ix + 6)
	push	hl
	call	_SetCell
	pop	hl
	pop	hl
	pop	hl
	.local	.LBB117_13
.LBB117_13:                             ; %Roll.exit.thread5
                                        ;   in Loop: Header=BB117_3 Depth=2
	ld	hl, (ix + 12)
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	ld	iy, (ix + 6)
	jp	z, .LBB117_17
; %bb.14:                               ;   in Loop: Header=BB117_3 Depth=2
	ld	hl, (ix + 12)
                                        ; kill: def $hl killed $hl killed $uhl
	ld.sis	de, 10000
	or	a, a
	sbc.sis	hl, de
	jr	nc, .LBB117_16
; %bb.15:                               ; %Roll.exit4
                                        ;   in Loop: Header=BB117_3 Depth=2
	ld	hl, 10000
	push	hl
	ld	hl, (ix + 15)
	call	__indcallhl
	ld	iy, (ix + 6)
	pop	de
	ld	de, (ix + 12)
	or	a, a
	sbc.sis	hl, de
	jr	nc, .LBB117_17
	.local	.LBB117_16
.LBB117_16:                             ; %Roll.exit4.thread
                                        ;   in Loop: Header=BB117_3 Depth=2
	ld	hl, 64
	push	hl
	ld	hl, (ix - 9)
	push	hl
	push	iy
	call	_SetCell
	ld	iy, (ix + 6)
	pop	hl
	pop	hl
	pop	hl
	.local	.LBB117_17
.LBB117_17:                             ; %Roll.exit4.thread6
                                        ;   in Loop: Header=BB117_3 Depth=2
	ld	hl, (ix - 6)
	inc	hl
	ld	bc, 0
	jp	.LBB117_3
	.local	.LBB117_18
.LBB117_18:                             ;   in Loop: Header=BB117_1 Depth=1
	ld	hl, (ix - 3)
	inc	hl
	ld	iy, (ix + 6)
	ld	de, 0
	jp	.LBB117_1
	.local	.LBB117_19
.LBB117_19:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end117
.Lfunc_end117:
	.size	_StepRegion, .Lfunc_end117-_StepRegion
                                        ; -- End function
	.section	.text._StepWorldRegion,"ax",@progbits
	.globl	_StepWorldRegion                ; -- Begin function StepWorldRegion
	.type	_StepWorldRegion,@function
_StepWorldRegion:                       ; @StepWorldRegion
; %bb.0:
	ld	hl, -7
	call	__frameset
	ld	hl, (ix + 6)
	ld	(ix - 4), hl
	ld	hl, (ix + 9)
	ld	bc, (ix + 12)
	xor	a, a
	ld	l, (hl)
	ld	iy, 0
	ex	de, hl
	ld	iyl, e
	ex	de, hl
	lea	hl, iy + 0
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de, hl
	ld	hl, (ix - 4)
	add	hl, de
	ld	(ix - 4), hl
	add	iy, iy
	lea	de, iy + 0
	push	bc
	pop	iy
	add	iy, de
	ld	hl, (iy)
	ld	(ix - 7), hl
	push	bc
	pop	iy
	ld	de, (iy + 18)
	ld	(ix - 1), a
	ld	hl, (ix - 3)
	ld	h, d
	ld	l, e
	ld	de, 0
	ld	bc, 100
	call	__lmulu
	ld	bc, 10000
	call	__lcmpu
	jr	c, .LBB118_2
; %bb.1:
	ld	hl, 10000
	.local	.LBB118_2
.LBB118_2:
	ld	de, (ix + 15)
	push	de
	push	hl
	ld	hl, (ix - 7)
	push	hl
	ld	hl, (ix - 4)
	push	hl
	call	_StepRegion
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	iy, (ix + 9)
	ld	a, (iy)
	ld	h, 0
	ld	l, a
	inc.sis	hl
	ld.sis	bc, 7
	call	__sremu
	ld	(iy), l
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	jr	z, .LBB118_4
; %bb.3:
	ld	a, 0
	jr	.LBB118_5
	.local	.LBB118_4
.LBB118_4:
	ld	a, -1
	.local	.LBB118_5
.LBB118_5:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end118
.Lfunc_end118:
	.size	_StepWorldRegion, .Lfunc_end118-_StepWorldRegion
                                        ; -- End function
	.section	.text._ValidPort,"ax",@progbits
	.globl	_ValidPort                      ; -- Begin function ValidPort
	.type	_ValidPort,@function
_ValidPort:                             ; @ValidPort
; %bb.0:
	ld	hl, -12
	call	__frameset
	ld	iy, (ix + 9)
	ld	l, 0
	ld	c, (iy + 2)
	ld	de, 0
	ld	a, c
	cp	a, 7
	jp	nc, .LBB119_8
; %bb.1:
	ld	a, (iy + 3)
	dec	a
	cp	a, 3
	jp	nc, .LBB119_8
; %bb.2:
	push	de
	pop	hl
	ld	l, c
	ld	a, (iy)
	push	de
	pop	bc
	ld	c, a
	ld	(ix - 6), bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	push	hl
	pop	bc
	ld	iy, (ix + 6)
	add	iy, bc
	ld	(ix - 3), iy
	ld	a, (iy + 8)
	push	de
	pop	bc
	ld	c, a
	ld	hl, (ix - 6)
	or	a, a
	sbc	hl, bc
	ld	(ix - 6), hl
	ld	iy, (ix + 9)
	ld	a, (iy + 1)
	push	de
	pop	hl
	ld	l, a
	ld	iy, (ix - 3)
	ld	a, (iy + 9)
	push	de
	pop	bc
	ld	c, a
	or	a, a
	sbc	hl, bc
	push	hl
	pop	iy
	ld	bc, 0
	ld	hl, (ix - 6)
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	jp	m, .LBB119_7
; %bb.3:
	lea	hl, iy + 0
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	jp	m, .LBB119_7
; %bb.4:
	ld	(ix - 9), iy
	ld	iy, (ix - 3)
	ld	a, (iy + 6)
	push	de
	pop	bc
	ld	c, a
	ld	hl, (ix - 6)
	ld	(ix - 12), bc
	or	a, a
	sbc	hl, bc
	jr	nc, .LBB119_7
; %bb.5:
	ld	iy, (ix - 3)
	ld	e, (iy + 7)
	ld	bc, (ix - 9)
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	ld	l, 0
	jr	nc, .LBB119_8
; %bb.6:
	ld	iy, (ix - 3)
	ld	iy, (iy + 3)
	push	bc
	pop	hl
	ld	bc, (ix - 12)
	call	__imulu
	ex	de, hl
	add	iy, de
	ld	de, (ix - 6)
	add	iy, de
	ld	a, (iy)
	or	a, a
	jr	nz, .LBB119_9
	.local	.LBB119_7
.LBB119_7:
	ld	l, 0
	.local	.LBB119_8
.LBB119_8:
	ld	a, l
	ld	sp, ix
	pop	ix
	ret
	.local	.LBB119_9
.LBB119_9:
	ld	l, -1
	jr	.LBB119_8
	.local	.Lfunc_end119
.Lfunc_end119:
	.size	_ValidPort, .Lfunc_end119-_ValidPort
                                        ; -- End function
	.section	.text._Transport,"ax",@progbits
	.globl	_Transport                      ; -- Begin function Transport
	.type	_Transport,@function
_Transport:                             ; @Transport
; %bb.0:
	call	__frameset0
	ld	iy, (ix + 18)
	ld	bc, (ix + 21)
	ld	de, (ix + 24)
	or	a, a
	sbc	hl, hl
	push	hl
	push	de
	push	bc
	push	iy
	ld	hl, (ix + 15)
	push	hl
	ld	hl, (ix + 12)
	push	hl
	ld	hl, (ix + 9)
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_TransportEvents
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end120
.Lfunc_end120:
	.size	_Transport, .Lfunc_end120-_Transport
                                        ; -- End function
	.section	.text._TransportEvents,"ax",@progbits
	.globl	_TransportEvents                ; -- Begin function TransportEvents
	.type	_TransportEvents,@function
_TransportEvents:                       ; @TransportEvents
; %bb.0:
	ld	hl, -44
	call	__frameset
	ld	iy, (ix + 18)
	ld	hl, 2
	push	hl
	call	__indcall
	pop	de
	ld	(ix - 12), l
	ld	(ix - 11), h
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	jr	z, .LBB121_2
; %bb.1:
	ld	c, 0
	jr	.LBB121_3
	.local	.LBB121_2
.LBB121_2:
	ld	c, 1
	.local	.LBB121_3
.LBB121_3:
	ld	e, 0
	ld	hl, (ix + 27)
	add	hl, bc
	or	a, a
	sbc	hl, bc
	ld	a, e
	jr	z, .LBB121_7
; %bb.4:
	ld	l, (ix - 12)
	ld	h, (ix - 11)
	ld	iy, (ix + 27)
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	jr	nz, .LBB121_6
; %bb.5:
	ld	a, (iy + 47)
	jr	.LBB121_7
	.local	.LBB121_6
.LBB121_6:
	ld	a, (iy + 46)
	.local	.LBB121_7
.LBB121_7:
	ld	(ix - 24), a
	ld	iy, 0
	ld	d, -1
	ld	hl, 24
	ld	(ix - 18), hl
	ld	hl, 14
	ld	(ix - 27), hl
	xor	a, a
	ld	(ix - 9), a
	inc	c
	ld	(ix - 21), c
	ld	hl, (ix + 24)
	ld	(hl), a
	ld	hl, (ix + 21)
	ld	(hl), a
	ld	bc, 132
	ld	a, e
	ld	(ix - 8), d                     ; 1-byte Folded Spill
	ld	(ix - 15), e                    ; 1-byte Folded Spill
	lea	de, iy + 0
	.local	.LBB121_8
.LBB121_8:                              ; =>This Inner Loop Header: Depth=1
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	jp	z, .LBB121_19
; %bb.9:                                ;   in Loop: Header=BB121_8 Depth=1
	ld	hl, (ix + 9)
	push	hl
	pop	iy
	add	iy, de
	bit	0, (iy + 5)
	jp	nz, .LBB121_18
; %bb.10:                               ;   in Loop: Header=BB121_8 Depth=1
	ld	(ix - 31), de
	ld	(ix - 28), a                    ; 1-byte Folded Spill
	ld	(ix - 34), iy
	push	iy
	ld	hl, (ix + 6)
	push	hl
	call	_ValidPort
	pop	hl
	pop	hl
	bit	0, a
	jr	z, .LBB121_17
; %bb.11:                               ;   in Loop: Header=BB121_8 Depth=1
	ld	iy, (ix - 34)
	ld	c, (iy + 2)
	ld	de, 0
	ld	hl, 1
	call	__ishl
	ld	b, (ix - 24)
	ld	a, l
	and	a, b
	ld	l, a
	or	a, a
	ld	l, (ix - 21)                    ; 1-byte Folded Reload
	jr	nz, .LBB121_17
; %bb.12:                               ;   in Loop: Header=BB121_8 Depth=1
	ld	a, (iy + 3)
	and	a, l
	ld	l, a
	or	a, a
	jr	z, .LBB121_17
; %bb.13:                               ;   in Loop: Header=BB121_8 Depth=1
	push	de
	pop	hl
	ld	l, c
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	push	hl
	pop	bc
	ld	iy, (ix + 6)
	add	iy, bc
	ld	hl, (iy + 12)
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	jr	z, .LBB121_17
; %bb.14:                               ;   in Loop: Header=BB121_8 Depth=1
	ld	a, (ix - 15)                    ; 1-byte Folded Reload
	inc	a
	ld	(ix - 15), a                    ; 1-byte Folded Spill
	ld	e, a
	push	de
	ld	hl, (ix + 18)
	call	__indcallhl
	pop	de
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	ld	a, (ix - 28)                    ; 1-byte Folded Reload
	jr	z, .LBB121_16
; %bb.15:                               ;   in Loop: Header=BB121_8 Depth=1
	ld	a, (ix - 8)                     ; 1-byte Folded Reload
	.local	.LBB121_16
.LBB121_16:                             ;   in Loop: Header=BB121_8 Depth=1
	ld	(ix - 8), a                     ; 1-byte Folded Spill
	.local	.LBB121_17
.LBB121_17:                             ;   in Loop: Header=BB121_8 Depth=1
	ld	bc, 132
	ld	a, (ix - 28)                    ; 1-byte Folded Reload
	ld	de, (ix - 31)
	.local	.LBB121_18
.LBB121_18:                             ;   in Loop: Header=BB121_8 Depth=1
	ex	de, hl
	ld	de, 6
	add	hl, de
	inc	a
	ex	de, hl
	jp	.LBB121_8
	.local	.LBB121_19
.LBB121_19:
	ld	de, 0
	ld	a, (ix - 8)                     ; 1-byte Folded Reload
	cp	a, -1
	jp	z, .LBB121_53
; %bb.20:
	ld	e, a
	ld	bc, 6
	push	de
	pop	hl
	call	__imulu
	push	hl
	pop	bc
	ld	hl, (ix + 9)
	add	hl, bc
	ld	(ix - 31), hl
	ex	de, hl
	ld	bc, 6
	call	__imulu
	xor	a, a
	push	hl
	pop	iy
	ld	(ix - 15), a                    ; 1-byte Folded Spill
	sbc	hl, hl
	ld	(ix - 34), a                    ; 1-byte Folded Spill
	dec	a
	ld	(ix - 28), a
	.local	.LBB121_21
.LBB121_21:                             ; =>This Inner Loop Header: Depth=1
	push	hl
	pop	de
	ld	bc, 132
	or	a, a
	sbc	hl, bc
	jp	z, .LBB121_34
; %bb.22:                               ;   in Loop: Header=BB121_21 Depth=1
	lea	hl, iy + 0
	or	a, a
	sbc	hl, de
	push	de
	pop	bc
	jp	z, .LBB121_33
; %bb.23:                               ;   in Loop: Header=BB121_21 Depth=1
	ld	(ix - 37), iy
	ld	hl, (ix + 9)
	push	hl
	pop	iy
	add	iy, bc
	lea	de, iy + 0
	ld	a, (iy + 2)
	ld	iy, (ix - 31)
	ld	l, (iy + 2)
	cp	a, l
	jr	z, .LBB121_25
; %bb.24:                               ;   in Loop: Header=BB121_21 Depth=1
	push	de
	pop	iy
	bit	0, (iy + 5)
	lea	hl, iy + 0
	jr	z, .LBB121_26
	.local	.LBB121_25
.LBB121_25:                             ;   in Loop: Header=BB121_21 Depth=1
	ld	iy, (ix - 37)
	jr	.LBB121_33
	.local	.LBB121_26
.LBB121_26:                             ;   in Loop: Header=BB121_21 Depth=1
	ld	(ix - 41), a                    ; 1-byte Folded Spill
	ld	(ix - 40), bc
	ld	(ix - 44), hl
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_ValidPort
	pop	hl
	pop	hl
	bit	0, a
	jr	z, .LBB121_32
; %bb.27:                               ;   in Loop: Header=BB121_21 Depth=1
	ld	hl, 1
	ld	c, (ix - 41)                    ; 1-byte Folded Reload
	call	__ishl
	ld	e, (ix - 24)
	ld	a, l
	and	a, e
	ld	l, a
	or	a, a
	ld	l, (ix - 21)                    ; 1-byte Folded Reload
	jr	nz, .LBB121_32
; %bb.28:                               ;   in Loop: Header=BB121_21 Depth=1
	ld	iy, (ix - 44)
	ld	a, (iy + 3)
	and	a, l
	ld	l, a
	or	a, a
	ld	iy, 0
	jr	z, .LBB121_32
; %bb.29:                               ;   in Loop: Header=BB121_21 Depth=1
	ld	a, (ix - 34)                    ; 1-byte Folded Reload
	inc	a
	lea	hl, iy + 0
	ld	(ix - 34), a                    ; 1-byte Folded Spill
	ld	l, a
	push	hl
	ld	hl, (ix + 18)
	call	__indcallhl
	pop	de
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	ld	a, (ix - 15)                    ; 1-byte Folded Reload
	jr	z, .LBB121_31
; %bb.30:                               ;   in Loop: Header=BB121_21 Depth=1
	ld	a, (ix - 28)                    ; 1-byte Folded Reload
	.local	.LBB121_31
.LBB121_31:                             ;   in Loop: Header=BB121_21 Depth=1
	ld	(ix - 28), a                    ; 1-byte Folded Spill
	.local	.LBB121_32
.LBB121_32:                             ;   in Loop: Header=BB121_21 Depth=1
	ld	iy, (ix - 37)
	ld	bc, (ix - 40)
	.local	.LBB121_33
.LBB121_33:                             ;   in Loop: Header=BB121_21 Depth=1
	push	bc
	pop	hl
	ld	bc, 6
	add	hl, bc
	inc	(ix - 15)
	jp	.LBB121_21
	.local	.LBB121_34
.LBB121_34:
	ld	e, (ix - 28)                    ; 1-byte Folded Reload
	ld	a, e
	cp	a, -1
	jp	z, .LBB121_53
; %bb.35:
	ld	hl, (ix + 21)
	ld	a, (ix - 8)
	ld	(hl), a
	ld	hl, (ix + 24)
	ld	(hl), e
	ld	l, (ix - 12)
	ld	h, (ix - 11)
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	jr	z, .LBB121_37
; %bb.36:
	ld	hl, 22
	ld	(ix - 18), hl
	.local	.LBB121_37
.LBB121_37:
	ld	bc, 0
	push	bc
	pop	hl
	ld	l, e
	ld	(ix - 24), hl
	ld	hl, (ix + 15)
	ld	de, (ix - 18)
	add	hl, de
	ld	hl, (hl)
	ld	(ix - 15), hl
	xor	a, a
	ld	(ix - 5), a
	push	bc
	pop	hl
	ld	de, (ix - 7)
	ld	c, l
	ld	iy, (ix - 31)
	ld	a, (iy + 2)
	ld	hl, (ix + 27)
	add	hl, bc
	or	a, a
	sbc	hl, bc
	ld	(ix - 8), c
	jr	nz, .LBB121_39
; %bb.38:                               ; %._crit_edge
	ld	hl, (ix - 15)
	ld	d, h
	ld	e, l
	ld	(ix - 15), de
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	(ix - 18), c                    ; 1-byte Folded Spill
	jp	.LBB121_49
	.local	.LBB121_39
.LBB121_39:
	ld	l, (ix - 12)
	ld	h, (ix - 11)
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	jr	z, .LBB121_41
; %bb.40:
	or	a, a
	sbc	hl, hl
	ld	(ix - 27), hl
	.local	.LBB121_41
.LBB121_41:
	ld	hl, (ix + 27)
	push	hl
	pop	iy
	ld	bc, (ix - 27)
	add	iy, bc
	ld	(ix - 18), iy
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	(ix - 12), hl
	add	hl, hl
	push	hl
	pop	bc
	lea	hl, iy + 0
	add	hl, bc
	ld	de, (hl)
	ld	bc, 6
	ld	hl, (ix - 24)
	call	__imulu
	push	hl
	pop	bc
	ld	iy, (ix + 9)
	add	iy, bc
	ld	a, (iy + 2)
	push	de
	pop	iy
	or	a, a
	sbc	hl, hl
	ld	l, a
	add	hl, hl
	push	hl
	pop	bc
	ld	hl, (ix - 18)
	add	hl, bc
	ld	bc, (hl)
	add.sis	iy, bc
	ld.sis	bc, -100
	add.sis	iy, bc
	ld.sis	bc, 51
	ex	de, hl
	ld	e, iyl
	ld	d, iyh
	ex	de, hl
	or	a, a
	sbc.sis	hl, bc
	call	pe, __setflag
	jp	p, .LBB121_43
; %bb.42:
	ld.sis	hl, 50
	ex	de, hl
	ld	iyl, e
	ld	iyh, d
	ex	de, hl
	.local	.LBB121_43
.LBB121_43:
	ld.sis	bc, 150
	ex	de, hl
	ld	e, iyl
	ld	d, iyh
	ex	de, hl
	or	a, a
	sbc.sis	hl, bc
	ld	de, (ix - 15)
	jr	c, .LBB121_45
; %bb.44:
	ld.sis	hl, 150
	ex	de, hl
	ld	iyl, e
	ld	iyh, d
	ex	de, hl
	.local	.LBB121_45
.LBB121_45:
	xor	a, a
	ld	(ix - 4), a
	ld	bc, (ix - 6)
	ld	b, d
	ld	c, e
	ld	(ix - 3), a
	ld	hl, (ix - 5)
	ex	de, hl
	ld	d, iyh
	ld	e, iyl
	ex	de, hl
	ld	a, (ix - 8)                     ; 1-byte Folded Reload
	ld	e, a
	call	__lmulu
	ld	bc, 100
	xor	a, a
	call	__ldivu
	ld	(ix - 15), hl
	ld	(ix - 18), e                    ; 1-byte Folded Spill
	ld	bc, 10000
	call	__lcmpu
	ccf
                                        ; kill: def $a killed $a
	sbc	a, a
	inc	a
	bit	0, a
	jr	nz, .LBB121_47
; %bb.46:
	ld	(ix - 15), bc
	.local	.LBB121_47
.LBB121_47:
	bit	0, a
	ld	hl, (ix - 12)
	jr	nz, .LBB121_49
; %bb.48:
	ld	d, 0
	ld	(ix - 18), d                    ; 1-byte Folded Spill
	.local	.LBB121_49
.LBB121_49:
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	push	hl
	pop	bc
	ld	iy, (ix + 6)
	add	iy, bc
	ld	(ix - 12), iy
	ld	de, (iy + 12)
	ld	(ix - 21), de
	xor	a, a
	ld	(ix - 2), a
	ld	hl, (ix - 4)
	ld	h, d
	ld	l, e
	ld	e, (ix - 8)                     ; 1-byte Folded Reload
	ld	bc, (ix - 15)
	ld	a, (ix - 18)                    ; 1-byte Folded Reload
	call	__lmulu
	ld	(ix - 15), hl
	ld	(ix - 18), e                    ; 1-byte Folded Spill
	ld	iy, (ix - 12)
	ld	hl, (iy + 10)
	ld	iy, (ix - 12)
	ld	de, (iy + 14)
	ld	bc, (ix - 21)
	add.sis	hl, bc
	add.sis	hl, de
	xor	a, a
	ld	(ix - 1), a
	ld	bc, (ix - 3)
	ld	b, h
	ld	c, l
	ld	hl, (ix - 15)
	ld	e, (ix - 18)                    ; 1-byte Folded Reload
	ld	a, (ix - 8)                     ; 1-byte Folded Reload
	call	__ldivu
	push	hl
	pop	bc
	sbc.sis	hl, hl
	adc.sis	hl, bc
	jr	z, .LBB121_53
; %bb.50:
	ld.sis	de, 10000
	ld	l, c
	ld	h, b
	or	a, a
	sbc.sis	hl, de
	jr	nc, .LBB121_52
; %bb.51:                               ; %Roll.exit
	ld	hl, 10000
	push	hl
	ld	hl, (ix + 18)
	ld	(ix - 8), bc
	call	__indcallhl
	pop	de
	ld	de, (ix - 8)
	or	a, a
	sbc.sis	hl, de
	jr	nc, .LBB121_53
	.local	.LBB121_52
.LBB121_52:                             ; %Roll.exit.thread
	ld	bc, 6
	ld	hl, (ix - 24)
	call	__imulu
	ex	de, hl
	ld	hl, (ix + 9)
	push	hl
	pop	iy
	add	iy, de
	ld	a, (iy + 2)
	ld	hl, (ix + 18)
	push	hl
	ld	l, a
	push	hl
	ld	hl, (ix + 12)
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_SeedRegion
	ld	(ix - 9), a                     ; 1-byte Folded Spill
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	.local	.LBB121_53
.LBB121_53:                             ; %Roll.exit.thread6
	ld	a, (ix - 9)                     ; 1-byte Folded Reload
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end121
.Lfunc_end121:
	.size	_TransportEvents, .Lfunc_end121-_TransportEvents
                                        ; -- End function
	.section	.text._Migrate,"ax",@progbits
	.globl	_Migrate                        ; -- Begin function Migrate
	.type	_Migrate,@function
_Migrate:                               ; @Migrate
; %bb.0:
	call	__frameset0
	ld	iy, (ix + 9)
	ld	bc, (ix + 12)
	ld	de, (ix + 15)
	or	a, a
	sbc	hl, hl
	push	hl
	push	de
	push	bc
	push	iy
	ld	hl, (ix + 6)
	push	hl
	call	_MigrateEvents
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end122
.Lfunc_end122:
	.size	_Migrate, .Lfunc_end122-_Migrate
                                        ; -- End function
	.section	.text._MigrateEvents,"ax",@progbits
	.globl	_MigrateEvents                  ; -- Begin function MigrateEvents
	.type	_MigrateEvents,@function
_MigrateEvents:                         ; @MigrateEvents
; %bb.0:
	ld	hl, -25
	call	__frameset
	ld	iy, (ix + 9)
	ld	e, 0
	ld	a, (iy + 33)
	or	a, a
	jp	z, .LBB123_19
; %bb.1:
	ld	a, (iy + 34)
	or	a, a
	jp	nz, .LBB123_19
; %bb.2:
	ld	a, (iy + 8)
	inc	a
	ld	l, 7
	and	a, l
	ld	l, a
	or	a, a
	jp	nz, .LBB123_19
; %bb.3:
	ld	iy, (ix + 12)
	ld	hl, (iy + 26)
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	jp	z, .LBB123_19
; %bb.4:                                ; %.preheader.preheader
	ld	d, 0
	ld	l, -1
	ld	iy, 12
	ld	bc, 10
	ld	(ix - 10), bc
	ld	bc, 124
	ld	a, d
	ld	(ix - 14), hl
	ld	(ix - 7), l                     ; 1-byte Folded Spill
	ld	(ix - 11), d                    ; 1-byte Folded Spill
	.local	.LBB123_5
.LBB123_5:                              ; %.preheader
                                        ; =>This Inner Loop Header: Depth=1
	lea	hl, iy + 0
	or	a, a
	sbc	hl, bc
	jr	z, .LBB123_11
; %bb.6:                                ;   in Loop: Header=BB123_5 Depth=1
	ld	hl, (ix + 6)
	lea	bc, iy + 0
	add	hl, bc
	ld	hl, (hl)
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	jr	z, .LBB123_10
; %bb.7:                                ;   in Loop: Header=BB123_5 Depth=1
	ld	(ix - 20), iy
	inc	d
	or	a, a
	sbc	hl, hl
	ld	(ix - 23), d                    ; 1-byte Folded Spill
	ld	l, d
	push	hl
	ld	hl, (ix + 15)
	ld	(ix - 17), a                    ; 1-byte Folded Spill
	call	__indcallhl
	ld	a, (ix - 17)                    ; 1-byte Folded Reload
	pop	de
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	ld	l, a
	jr	z, .LBB123_9
; %bb.8:                                ;   in Loop: Header=BB123_5 Depth=1
	ld	l, (ix - 7)                     ; 1-byte Folded Reload
	.local	.LBB123_9
.LBB123_9:                              ;   in Loop: Header=BB123_5 Depth=1
	ld	(ix - 7), l                     ; 1-byte Folded Spill
	ld	e, 0
	ld	iy, (ix - 20)
	ld	d, (ix - 23)                    ; 1-byte Folded Reload
	.local	.LBB123_10
.LBB123_10:                             ;   in Loop: Header=BB123_5 Depth=1
	ld	bc, 16
	add	iy, bc
	inc	a
	ld	bc, 124
	jr	.LBB123_5
	.local	.LBB123_11
.LBB123_11:
	ld	bc, 0
	ld	a, (ix - 7)                     ; 1-byte Folded Reload
	cp	a, -1
	jp	z, .LBB123_19
; %bb.12:
	ld	c, a
	ld	iy, (ix + 12)
	ld	iy, (iy + 26)
	ld	hl, (ix + 18)
	add	hl, bc
	or	a, a
	sbc	hl, bc
	ld	hl, 100
	ld	e, h
	jr	z, .LBB123_14
; %bb.13:
	push	bc
	pop	hl
	add	hl, hl
	ex	de, hl
	lea	hl, iy + 0
	ld	iy, (ix + 18)
	add	iy, de
	ld	de, (iy + 28)
	push	hl
	pop	iy
	xor	a, a
	ld	(ix - 4), a
	ld	hl, (ix - 6)
	ld	h, d
	ld	l, e
	ld	de, 0
	.local	.LBB123_14
.LBB123_14:
	xor	a, a
	ld	(ix - 3), a
	ld	(ix - 17), bc
	ld	bc, (ix - 5)
	ld	b, iyh
	ld	c, iyl
	ld	iy, 0
	ld	d, iyl
	ld	a, d
	ld	(ix - 24), d
	call	__lmulu
	ld	bc, 100
	xor	a, a
	call	__ldivu
	ld	(ix - 20), hl
	ld	hl, (ix - 17)
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	push	hl
	pop	bc
	ld	iy, (ix + 6)
	add	iy, bc
	ld	(ix - 7), iy
	ld	hl, (iy + 12)
	ld	(ix - 23), hl
	ld	(ix - 2), a
	ld	bc, (ix - 4)
	ld	b, h
	ld	c, l
	ld	hl, (ix - 20)
	ld	a, d
	call	__lmulu
	ld	(ix - 20), hl
	ld	(ix - 25), e                    ; 1-byte Folded Spill
	ld	iy, (ix - 7)
	ld	hl, (iy + 10)
	ld	iy, (ix - 7)
	ld	de, (iy + 14)
	ld	bc, (ix - 23)
	add.sis	hl, bc
	add.sis	hl, de
	xor	a, a
	ld	(ix - 1), a
	ld	bc, (ix - 3)
	ld	b, h
	ld	c, l
	ld	hl, (ix - 20)
	ld	e, (ix - 25)                    ; 1-byte Folded Reload
	ld	a, (ix - 24)                    ; 1-byte Folded Reload
	call	__ldivu
	ld	bc, 10000
	xor	a, a
	call	__lcmpu
	push	hl
	pop	iy
	jr	c, .LBB123_16
; %bb.15:
	push	bc
	pop	iy
	.local	.LBB123_16
.LBB123_16:
	call	__lcmpzero
	jp	m, .LBB123_18
; %bb.17:
	lea	bc, iy + 0
	sbc.sis	hl, hl
	adc.sis	hl, bc
	jr	nz, .LBB123_20
	.local	.LBB123_18
.LBB123_18:
	ld	e, 0
	.local	.LBB123_19
.LBB123_19:                             ; %Roll.exit.thread4
	ld	a, e
	ld	sp, ix
	pop	ix
	ret
	.local	.LBB123_20
.LBB123_20:
	ld.sis	de, 10000
	ld	l, c
	ld	h, b
	or	a, a
	sbc.sis	hl, de
	jr	nc, .LBB123_22
; %bb.21:                               ; %Roll.exit
	ld	hl, 10000
	push	hl
	ld	hl, (ix + 15)
	ld	(ix - 7), bc
	call	__indcallhl
	pop	de
	ld	de, (ix - 7)
	or	a, a
	sbc.sis	hl, de
	jr	nc, .LBB123_18
	.local	.LBB123_22
.LBB123_22:                             ; %Roll.exit.thread
	ld	hl, _neighbors
	ld	de, (ix - 17)
	add	hl, de
	ld	d, (hl)
	ld	bc, 7
	xor	a, a
	ld	(ix - 17), a                    ; 1-byte Folded Spill
	ld	e, a
	ld	iy, 0
	.local	.LBB123_23
.LBB123_23:                             ; =>This Inner Loop Header: Depth=1
	lea	hl, iy + 0
	or	a, a
	sbc	hl, bc
	jr	z, .LBB123_30
; %bb.24:                               ;   in Loop: Header=BB123_23 Depth=1
	ld	hl, 1
	ld	(ix - 7), iy
	ld	c, iyl
	call	__ishl
	ld	a, l
	and	a, d
	ld	l, a
	or	a, a
	jr	z, .LBB123_29
; %bb.25:                               ;   in Loop: Header=BB123_23 Depth=1
	ld	hl, (ix + 6)
	ld	bc, (ix - 10)
	add	hl, bc
	ld	hl, (hl)
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	jr	z, .LBB123_29
; %bb.26:                               ;   in Loop: Header=BB123_23 Depth=1
	ld	(ix - 20), d                    ; 1-byte Folded Spill
	ld	a, (ix - 17)                    ; 1-byte Folded Reload
	inc	a
	or	a, a
	sbc	hl, hl
	ld	(ix - 17), a                    ; 1-byte Folded Spill
	ld	l, a
	push	hl
	ld	hl, (ix + 15)
	call	__indcallhl
	pop	de
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	ld	a, (ix - 11)                    ; 1-byte Folded Reload
	jr	z, .LBB123_28
; %bb.27:                               ;   in Loop: Header=BB123_23 Depth=1
	ld	hl, (ix - 14)
	ld	a, l
	.local	.LBB123_28
.LBB123_28:                             ;   in Loop: Header=BB123_23 Depth=1
	ld	l, a
	ld	(ix - 14), hl
	ld	e, 0
	ld	d, (ix - 20)                    ; 1-byte Folded Reload
	.local	.LBB123_29
.LBB123_29:                             ;   in Loop: Header=BB123_23 Depth=1
	ld	iy, (ix - 7)
	inc	iy
	ld	hl, (ix - 10)
	ld	bc, 16
	add	hl, bc
	inc	(ix - 11)
	ld	(ix - 10), hl
	ld	bc, 7
	jr	.LBB123_23
	.local	.LBB123_30
.LBB123_30:
	ld	hl, (ix - 14)
	ld	a, l
	cp	a, -1
	jp	z, .LBB123_19
; %bb.31:
	ex	de, hl
	ld	hl, (ix + 15)
	push	hl
	push	de
	ld	hl, (ix + 9)
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_SeedRegion
	ld	e, a
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	jp	.LBB123_19
	.local	.Lfunc_end123
.Lfunc_end123:
	.size	_MigrateEvents, .Lfunc_end123-_MigrateEvents
                                        ; -- End function
	.section	.text._SporeBurst,"ax",@progbits
	.globl	_SporeBurst                     ; -- Begin function SporeBurst
	.type	_SporeBurst,@function
_SporeBurst:                            ; @SporeBurst
; %bb.0:
	ld	hl, -2
	call	__frameset
	ld	iy, (ix + 9)
	ld	c, 0
	ld	a, (iy + 33)
	or	a, a
	jp	z, .LBB124_7
; %bb.1:
	ld	a, (iy + 34)
	or	a, a
	jp	nz, .LBB124_7
; %bb.2:
	ld	a, (iy + 32)
	cp	a, 2
	jp	nz, .LBB124_7
; %bb.3:
	ld	a, (iy + 36)
	cp	a, 3
	jp	nc, .LBB124_7
; %bb.4:
	ld	de, 0
	ld	e, a
	ld	hl, (iy + 20)
	ld	iy, _spore_costs
	add	iy, de
	ld	e, (iy)
                                        ; kill: def $hl killed $hl killed $uhl
	or	a, a
	sbc.sis	hl, de
	jp	c, .LBB124_7
; %bb.5:
	ld	(ix - 2), e
	ld	(ix - 1), d
	ld	hl, (ix + 6)
	ld	a, (ix + 12)
	ld	de, (ix + 15)
	push	de
	ld	e, a
	push	de
	ld	de, (ix + 9)
	push	de
	push	hl
	call	_SeedRegion
	ld	c, 0
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	bit	0, a
	jp	z, .LBB124_7
; %bb.6:
	ld	c, 1
	ld	iy, (ix + 9)
	ld	de, 0
	ld	e, (iy + 36)
	inc	(iy + 36)
	ld	hl, _spore_costs
	add	hl, de
	ld	e, (ix - 2)
	ld	d, (ix - 1)
	ld	e, (hl)
	ld	hl, (iy + 20)
                                        ; kill: def $hl killed $hl killed $uhl
	or	a, a
	sbc.sis	hl, de
	ld	(iy + 20), l
	ld	(iy + 21), h
	.local	.LBB124_7
.LBB124_7:
	ld	a, c
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end124
.Lfunc_end124:
	.size	_SporeBurst, .Lfunc_end124-_SporeBurst
                                        ; -- End function
	.section	.text._ClosePorts,"ax",@progbits
	.globl	_ClosePorts                     ; -- Begin function ClosePorts
	.type	_ClosePorts,@function
_ClosePorts:                            ; @ClosePorts
; %bb.0:
	ld	hl, -13
	call	__frameset
	ld	iy, (ix + 12)
	ld	l, 0
	ld	a, (iy + 35)
	or	a, a
	jp	z, .LBB125_16
; %bb.1:
	ld	a, l
	ld	de, 0
	.local	.LBB125_2
.LBB125_2:                              ; =>This Inner Loop Header: Depth=1
	ld	bc, 132
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	jp	z, .LBB125_15
; %bb.3:                                ;   in Loop: Header=BB125_2 Depth=1
	ld	iy, (ix + 9)
	add	iy, de
	bit	0, (iy + 5)
	jr	z, .LBB125_5
; %bb.4:                                ;   in Loop: Header=BB125_2 Depth=1
	ld	bc, 6
	jp	.LBB125_14
	.local	.LBB125_5
.LBB125_5:                              ;   in Loop: Header=BB125_2 Depth=1
	ld	(ix - 7), de
	ld	(ix - 4), a                     ; 1-byte Folded Spill
	ld	(ix - 3), iy
	ld	a, (iy + 2)
	or	a, a
	sbc	hl, hl
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de, hl
	ld	iy, (ix + 6)
	add	iy, de
	ld	bc, (iy + 10)
	ld	hl, (iy + 12)
	ld	de, (iy + 14)
	push	hl
	pop	iy
	add.sis	hl, bc
	ld	(ix - 10), de
	add.sis	hl, de
	ld	(ix - 13), l
	ld	(ix - 12), h
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	ld.sis	hl, 0
	ld	e, l
	ld	d, h
                                        ; kill: def $hl killed $hl def $uhl
	jr	z, .LBB125_7
; %bb.6:                                ;   in Loop: Header=BB125_2 Depth=1
	or	a, a
	sbc	hl, hl
	push	hl
	pop	de
	ex	de, hl
	ld	e, iyl
	ld	d, iyh
	ex	de, hl
	ld	iy, 100
	lea	bc, iy + 0
	call	__imulu
	push	de
	pop	bc
	push	de
	pop	iy
	ld	e, (ix - 13)
	ld	d, (ix - 12)
	ld	c, e
	ld	b, d
	ld	(ix - 13), bc
	call	__idivu
	ld	b, l
	ld	c, 10
	call	__bdivu
	ld	e, a
	ld	d, 0
	ld	hl, (ix - 10)
	ex	de, hl
	ld	iyl, e
	ld	iyh, d
	ex	de, hl
	lea	hl, iy + 0
	ld	bc, 100
	call	__imulu
	ld	bc, (ix - 13)
	call	__idivu
	.local	.LBB125_7
.LBB125_7:                              ; %Percentage.exit1
                                        ;   in Loop: Header=BB125_2 Depth=1
                                        ; kill: def $hl killed $hl killed $uhl
	ld.sis	bc, 255
	call	__sand
	add.sis	hl, de
	ld	iy, (ix + 15)
	ld	de, (iy + 16)
	add.sis	hl, de
	ld	de, (ix + 12)
	push	de
	pop	iy
	ld	a, (iy + 35)
	cp	a, 3
	ld.sis	de, 10
	jr	z, .LBB125_9
; %bb.8:                                ; %Percentage.exit1
                                        ;   in Loop: Header=BB125_2 Depth=1
	ld.sis	de, 0
	.local	.LBB125_9
.LBB125_9:                              ; %Percentage.exit1
                                        ;   in Loop: Header=BB125_2 Depth=1
	add.sis	hl, de
	ld	iy, (ix - 3)
	ld	e, (iy + 4)
	ld	d, 0
	or	a, a
	sbc.sis	hl, de
	jp	c, .LBB125_12
; %bb.10:                               ;   in Loop: Header=BB125_2 Depth=1
	ld	hl, 10000
	push	hl
	ld	hl, (ix + 18)
	call	__indcallhl
	pop	de
	ld.sis	de, 800
	or	a, a
	sbc.sis	hl, de
	jp	nc, .LBB125_12
; %bb.11:                               ;   in Loop: Header=BB125_2 Depth=1
	ld	iy, (ix - 3)
	ld	(iy + 5), 1
	ld	hl, 1
	ld	c, (iy + 2)
	call	__ishl
                                        ; kill: def $l killed $l killed $uhl
	ld	e, (ix - 4)                     ; 1-byte Folded Reload
	ld	a, e
	or	a, l
	ld	e, a
	jr	.LBB125_13
	.local	.LBB125_12
.LBB125_12:                             ;   in Loop: Header=BB125_2 Depth=1
	ld	a, (ix - 4)                     ; 1-byte Folded Reload
	.local	.LBB125_13
.LBB125_13:                             ;   in Loop: Header=BB125_2 Depth=1
	ld	bc, 6
	ld	de, (ix - 7)
	.local	.LBB125_14
.LBB125_14:                             ;   in Loop: Header=BB125_2 Depth=1
	ex	de, hl
	add	hl, bc
	ex	de, hl
	jp	.LBB125_2
	.local	.LBB125_15
.LBB125_15:
	ld	l, a
	.local	.LBB125_16
.LBB125_16:                             ; %.loopexit
	ld	a, l
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end125
.Lfunc_end125:
	.size	_ClosePorts, .Lfunc_end125-_ClosePorts
                                        ; -- End function
	.section	.text._GameRandom,"ax",@progbits
	.globl	_GameRandom                     ; -- Begin function GameRandom
	.type	_GameRandom,@function
_GameRandom:                            ; @GameRandom
; %bb.0:
	ld	hl, -3
	call	__frameset
	ld	de, (ix + 6)
	sbc.sis	hl, hl
	adc.sis	hl, de
	jr	nz, .LBB126_2
; %bb.1:
	ld.sis	hl, 0
	jr	.LBB126_3
	.local	.LBB126_2
.LBB126_2:
	or	a, a
	sbc	hl, hl
	ld	l, e
	ld	h, d
	ld	(ix - 3), hl
	call	_random
	ld	bc, (ix - 3)
	call	__iremu
	.local	.LBB126_3
.LBB126_3:
                                        ; kill: def $hl killed $hl killed $uhl
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end126
.Lfunc_end126:
	.size	_GameRandom, .Lfunc_end126-_GameRandom
                                        ; -- End function
	.section	.text._ReadKey,"ax",@progbits
	.globl	_ReadKey                        ; -- Begin function ReadKey
	.type	_ReadKey,@function
_ReadKey:                               ; @ReadKey
; %bb.0:
	call	_kb_Scan
	ld	hl, -720868
	push	hl
	pop	de
	push	de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, e
	ld	h, d
	pop	de
	ld	a, l
	bit	6, a
	jp	nz, .LBB127_14
; %bb.1:
	ld	iy, -720878
	ld.sis	bc, 1
	ld	l, (iy)
	ld	h, (iy + 1)
	call	__sand
	bit	0, l
	jp	nz, .LBB127_15
; %bb.2:
	ex	de, hl
	push	de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, e
	ld	h, d
	pop	de
	call	__sand
	bit	0, l
	jr	nz, .LBB127_16
; %bb.3:
	ld	l, (iy)
	ld	h, (iy + 1)
	ld	a, l
	bit	4, a
	jr	nz, .LBB127_17
; %bb.4:
	ld	l, (iy)
	ld	h, (iy + 1)
	ld	a, l
	bit	3, a
	jr	nz, .LBB127_18
; %bb.5:
	ld	l, (iy)
	ld	h, (iy + 1)
	ld	a, l
	bit	2, a
	jr	nz, .LBB127_19
; %bb.6:
	ld	l, (iy)
	ld	h, (iy + 1)
	ld	e, -128
	ld	a, l
	and	a, e
	ld	l, a
	or	a, a
	jr	nz, .LBB127_20
; %bb.7:
	ld	l, (iy)
	ld	h, (iy + 1)
	ld	a, l
	bit	6, a
	jr	nz, .LBB127_21
; %bb.8:
	ld	hl, -720866
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	hl
	ld	a, e
	bit	1, a
	jr	nz, .LBB127_22
; %bb.9:
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	hl
	ld	a, e
	bit	2, a
	jr	nz, .LBB127_23
; %bb.10:
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	hl
	ld	a, e
	bit	3, a
	jr	nz, .LBB127_24
; %bb.11:
	push	de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, e
	ld	h, d
	pop	de
	call	__sand
	bit	0, l
	jr	nz, .LBB127_25
; %bb.12:
	call	_ScannedKeyDown
	bit	0, a
	jr	nz, .LBB127_26
; %bb.13:
	xor	a, a
	ret
	.local	.LBB127_14
.LBB127_14:
	ld	a, 6
	ret
	.local	.LBB127_15
.LBB127_15:
	ld	a, 7
	ret
	.local	.LBB127_16
.LBB127_16:
	ld	a, 5
	ret
	.local	.LBB127_17
.LBB127_17:
	ld	a, 8
	ret
	.local	.LBB127_18
.LBB127_18:
	ld	a, 9
	ret
	.local	.LBB127_19
.LBB127_19:
	ld	a, 11
	ret
	.local	.LBB127_20
.LBB127_20:
	ld	a, 10
	ret
	.local	.LBB127_21
.LBB127_21:
	ld	a, 12
	ret
	.local	.LBB127_22
.LBB127_22:
	ld	a, 1
	ret
	.local	.LBB127_23
.LBB127_23:
	ld	a, 2
	ret
	.local	.LBB127_24
.LBB127_24:
	ld	a, 3
	ret
	.local	.LBB127_25
.LBB127_25:
	ld	a, 4
	ret
	.local	.LBB127_26
.LBB127_26:
	ld	a, 13
	ret
	.local	.Lfunc_end127
.Lfunc_end127:
	.size	_ReadKey, .Lfunc_end127-_ReadKey
                                        ; -- End function
	.section	.text._ScannedKeyDown,"ax",@progbits
	.type	_ScannedKeyDown,@function       ; -- Begin function ScannedKeyDown
_ScannedKeyDown:                        ; @ScannedKeyDown
; %bb.0:
	ld	hl, 1
	ld	iy, -720878
	ld	bc, 8
	.local	.LBB128_1
.LBB128_1:                              ; =>This Inner Loop Header: Depth=1
	push	hl
	pop	de
	or	a, a
	sbc	hl, bc
	jr	z, .LBB128_3
; %bb.2:                                ;   in Loop: Header=BB128_1 Depth=1
	ld	c, (iy)
	ld	b, (iy + 1)
	push	de
	pop	hl
	inc	hl
	lea	iy, iy + 2
	ld	a, c
	ld	bc, 8
	or	a, a
	jr	z, .LBB128_1
	.local	.LBB128_3
.LBB128_3:
	ex	de, hl
	or	a, a
	sbc	hl, bc
                                        ; kill: def $a killed $a
	sbc	a, a
	ret
	.local	.Lfunc_end128
.Lfunc_end128:
	.size	_ScannedKeyDown, .Lfunc_end128-_ScannedKeyDown
                                        ; -- End function
	.section	.text._ReleaseKeys,"ax",@progbits
	.globl	_ReleaseKeys                    ; -- Begin function ReleaseKeys
	.type	_ReleaseKeys,@function
_ReleaseKeys:                           ; @ReleaseKeys
; %bb.0:
	.local	.LBB129_1
.LBB129_1:                              ; =>This Inner Loop Header: Depth=1
	call	_kb_Scan
	call	_ScannedKeyDown
	bit	0, a
	jr	nz, .LBB129_1
; %bb.2:
	ld	a, 1
	ld	(_canpress), a
	ret
	.local	.Lfunc_end129
.Lfunc_end129:
	.size	_ReleaseKeys, .Lfunc_end129-_ReleaseKeys
                                        ; -- End function
	.section	.text._WaitKey,"ax",@progbits
	.globl	_WaitKey                        ; -- Begin function WaitKey
	.type	_WaitKey,@function
_WaitKey:                               ; @WaitKey
; %bb.0:
	call	_ReleaseKeys
	.local	.LBB130_1
.LBB130_1:                              ; =>This Inner Loop Header: Depth=1
	call	_ReadKey
	ld	l, a
	or	a, a
	jr	z, .LBB130_1
; %bb.2:
	ld	a, l
	ret
	.local	.Lfunc_end130
.Lfunc_end130:
	.size	_WaitKey, .Lfunc_end130-_WaitKey
                                        ; -- End function
	.section	.text._EndModal,"ax",@progbits
	.globl	_EndModal                       ; -- Begin function EndModal
	.type	_EndModal,@function
_EndModal:                              ; @EndModal
; %bb.0:
	call	_ReleaseKeys
	or	a, a
	sbc	hl, hl
	ld	(-917504), hl
	xor	a, a
	ld	(-917501), a
	ret
	.local	.Lfunc_end131
.Lfunc_end131:
	.size	_EndModal, .Lfunc_end131-_EndModal
                                        ; -- End function
	.section	.text._MenuMove,"ax",@progbits
	.globl	_MenuMove                       ; -- Begin function MenuMove
	.type	_MenuMove,@function
_MenuMove:                              ; @MenuMove
; %bb.0:
	call	__frameset0
	ld	a, (ix + 6)
	ld	iy, (ix + 9)
	ld	l, (ix + 12)
	cp	a, 3
	jr	nz, .LBB132_2
; %bb.1:
	ld	e, (iy)
	ld	d, 0
	ld	iyh, d
	ex	de, hl
	ld	iyl, e
	ld	e, iyl
	ld	d, iyh
	ex	de, hl
	add.sis	hl, de
	dec.sis	hl
	ld	c, iyl
	ld	b, iyh
	ld	iy, (ix + 9)
	call	__srems
	jr	.LBB132_4
	.local	.LBB132_2
.LBB132_2:
	cp	a, 4
	jp	nz, .LBB132_5
; %bb.3:
	ld	a, (iy)
	ld	b, 0
	ld	c, a
	ld	a, l
	ld	l, c
	ld	h, b
	inc.sis	hl
	ld	c, a
	call	__sremu
	.local	.LBB132_4
.LBB132_4:
	ld	a, 1
                                        ; kill: def $l killed $l killed $hl
	ld	(iy), l
	jr	.LBB132_6
	.local	.LBB132_5
.LBB132_5:
	xor	a, a
	.local	.LBB132_6
.LBB132_6:
	pop	ix
	ret
	.local	.Lfunc_end132
.Lfunc_end132:
	.size	_MenuMove, .Lfunc_end132-_MenuMove
                                        ; -- End function
	.section	.text._MenuItem,"ax",@progbits
	.globl	_MenuItem                       ; -- Begin function MenuItem
	.type	_MenuItem,@function
_MenuItem:                              ; @MenuItem
; %bb.0:
	ld	hl, -6
	call	__frameset
	ld	hl, (ix + 6)
	ld	(ix - 6), hl
	ld	hl, (ix + 9)
	ld	de, 10
	bit	0, (ix + 12)
	ld	(ix - 3), hl
	jr	z, .LBB133_2
; %bb.1:
	ld	hl, 224
	push	hl
	call	_gfx_SetColor
	pop	hl
	ld	hl, (ix - 3)
	ld	de, -4
	add	hl, de
	ld	de, 19
	push	de
	ld	de, 308
	push	de
	push	hl
	ld	hl, 6
	push	hl
	call	_gfx_Rectangle
	ld	bc, _.str.670
	ld	de, 10
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (ix - 3)
	jr	.LBB133_3
	.local	.LBB133_2
.LBB133_2:
	ld	bc, _.str.1.671
	.local	.LBB133_3
.LBB133_3:
	push	hl
	push	de
	push	bc
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (ix - 6)
	ld	(ix + 6), hl
	ld	hl, 24
	ld	(ix + 9), hl
	ld	hl, (ix - 3)
	ld	(ix + 12), hl
	ld	sp, ix
	pop	ix
	jp	_Text
	.local	.Lfunc_end133
.Lfunc_end133:
	.size	_MenuItem, .Lfunc_end133-_MenuItem
                                        ; -- End function
	.section	.text._Text,"ax",@progbits
	.globl	_Text                           ; -- Begin function Text
	.type	_Text,@function
_Text:                                  ; @Text
; %bb.0:
	ld	hl, -9
	call	__frameset
	ld	hl, (ix + 6)
	ld	(ix - 3), hl
	ld	hl, (ix + 9)
	ld	(ix - 6), hl
	ld	hl, (ix + 12)
	ld	(ix - 9), hl
	ld	hl, 255
	push	hl
	call	_gfx_SetTextFGColor
	pop	hl
	ld	hl, (ix - 3)
	ld	(ix + 6), hl
	ld	hl, (ix - 6)
	ld	(ix + 9), hl
	ld	hl, (ix - 9)
	ld	(ix + 12), hl
	ld	sp, ix
	pop	ix
	jp	_gfx_PrintStringXY
	.local	.Lfunc_end134
.Lfunc_end134:
	.size	_Text, .Lfunc_end134-_Text
                                        ; -- End function
	.section	.text._ChooseMenu,"ax",@progbits
	.globl	_ChooseMenu                     ; -- Begin function ChooseMenu
	.type	_ChooseMenu,@function
_ChooseMenu:                            ; @ChooseMenu
; %bb.0:
	ld	hl, -17
	call	__frameset
	ld	de, (ix + 6)
	ld	l, (ix + 15)
	ld	iy, 24
	ld	a, l
	ld	(ix - 1), l
	or	a, a
	sbc	hl, hl
	ld	l, (ix + 12)
	lea	bc, iy + 0
	call	__imulu
	ld	(ix - 8), hl
	ld	l, (ix + 12)
	ld	(ix - 17), hl
	.local	.LBB135_1
.LBB135_1:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB135_2 Depth 2
	ld	(ix - 2), a
	push	de
	call	_BeginScreen
	pop	hl
	or	a, a
	sbc	hl, hl
	ld	l, (ix - 2)                     ; 1-byte Folded Reload
	ld	bc, 24
	call	__imulu
	ld	(ix - 11), hl
	ld	bc, 0
	ld	hl, (ix + 9)
	ex	de, hl
	.local	.LBB135_2
.LBB135_2:                              ;   Parent Loop BB135_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ld	hl, (ix - 8)
	or	a, a
	sbc	hl, bc
	jr	z, .LBB135_6
; %bb.3:                                ;   in Loop: Header=BB135_2 Depth=2
	ld	(ix - 5), de
	push	bc
	pop	iy
	ld	de, 42
	add	iy, de
	ld	hl, (ix - 11)
	ld	(ix - 14), bc
	or	a, a
	sbc	hl, bc
	ld	hl, -1
	push	hl
	pop	bc
	jr	z, .LBB135_5
; %bb.4:                                ;   in Loop: Header=BB135_2 Depth=2
	ld	hl, 0
	push	hl
	pop	bc
	.local	.LBB135_5
.LBB135_5:                              ;   in Loop: Header=BB135_2 Depth=2
	ld	hl, (ix - 5)
	ld	de, (hl)
	push	bc
	push	iy
	push	de
	call	_MenuItem
	pop	hl
	pop	hl
	pop	hl
	ld	iy, (ix - 5)
	lea	iy, iy + 3
	ld	hl, (ix - 14)
	ld	de, 24
	add	hl, de
	push	hl
	pop	bc
	lea	de, iy + 0
	jr	.LBB135_2
	.local	.LBB135_6
.LBB135_6:                              ;   in Loop: Header=BB135_1 Depth=1
	ld	hl, 211
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, _.str.2.678
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 226
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, _.str.3.679
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	call	_gfx_SwapDraw
	call	_WaitKey
	ld	l, a
	cp	a, 5
	jr	z, .LBB135_10
; %bb.7:                                ;   in Loop: Header=BB135_1 Depth=1
	ld	a, l
	cp	a, 6
	jr	z, .LBB135_9
; %bb.8:                                ;   in Loop: Header=BB135_1 Depth=1
	ld	de, (ix - 17)
	push	de
	pea	ix - 1
	push	hl
	call	_MenuMove
	pop	hl
	pop	hl
	pop	hl
	ld	a, (ix - 1)
	ld	de, (ix + 6)
	jp	.LBB135_1
	.local	.LBB135_9
.LBB135_9:
	ld	a, -1
	ld	(ix - 2), a                     ; 1-byte Folded Spill
	.local	.LBB135_10
.LBB135_10:                             ; %.loopexit
	call	_EndModal
	ld	a, (ix - 2)                     ; 1-byte Folded Reload
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end135
.Lfunc_end135:
	.size	_ChooseMenu, .Lfunc_end135-_ChooseMenu
                                        ; -- End function
	.section	.text._BeginScreen,"ax",@progbits
	.globl	_BeginScreen                    ; -- Begin function BeginScreen
	.type	_BeginScreen,@function
_BeginScreen:                           ; @BeginScreen
; %bb.0:
	call	__frameset0
	ld	hl, 1
	push	hl
	call	_gfx_SetDraw
	pop	hl
	or	a, a
	sbc	hl, hl
	push	hl
	call	_gfx_FillScreen
	pop	hl
	ld	hl, 1
	push	hl
	push	hl
	call	_gfx_SetTextScale
	pop	hl
	pop	hl
	or	a, a
	sbc	hl, hl
	push	hl
	call	_gfx_SetTextBGColor
	pop	hl
	or	a, a
	sbc	hl, hl
	push	hl
	call	_gfx_SetTextTransparentColor
	pop	hl
	ld	hl, 224
	push	hl
	call	_gfx_SetColor
	pop	hl
	ld	hl, 19
	push	hl
	ld	hl, 320
	push	hl
	or	a, a
	sbc	hl, hl
	push	hl
	push	hl
	call	_gfx_FillRectangle
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 5
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_Text
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end136
.Lfunc_end136:
	.size	_BeginScreen, .Lfunc_end136-_BeginScreen
                                        ; -- End function
	.section	.text._WrapText,"ax",@progbits
	.globl	_WrapText                       ; -- Begin function WrapText
	.type	_WrapText,@function
_WrapText:                              ; @WrapText
; %bb.0:
	ld	hl, -67
	call	__frameset
	ld	iy, (ix + 6)
	ld	hl, (ix + 12)
	ld	d, (ix + 18)
	lea	bc, ix - 48
	ld	(ix - 54), bc
	ld	e, (iy)
	.local	.LBB137_1
.LBB137_1:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB137_4 Depth 2
                                        ;     Child Loop BB137_20 Depth 2
	ld	a, e
	or	a, a
	jp	z, .LBB137_22
; %bb.2:                                ;   in Loop: Header=BB137_1 Depth=1
	ld	a, d
	or	a, a
	jp	z, .LBB137_22
; %bb.3:                                ; %.preheader.preheader
                                        ;   in Loop: Header=BB137_1 Depth=1
	dec	d
	ld	(ix - 64), d
	ld	bc, 0
	ld	(ix - 60), bc
	ld	(ix - 63), iy
	ld	(ix - 57), hl
	.local	.LBB137_4
.LBB137_4:                              ; %.preheader
                                        ;   Parent Loop BB137_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ld	(ix - 51), bc
	ld	a, e
	or	a, a
	jr	z, .LBB137_11
; %bb.5:                                ; %.preheader
                                        ;   in Loop: Header=BB137_4 Depth=2
	ld	hl, (ix - 60)
	ld	bc, 47
	or	a, a
	sbc	hl, bc
	jr	nc, .LBB137_11
; %bb.6:                                ;   in Loop: Header=BB137_4 Depth=2
	ld	bc, (ix - 60)
	add	iy, bc
	ld	(ix - 67), iy
	ld	hl, (ix - 54)
	push	hl
	pop	iy
	add	iy, bc
	ld	(iy), e
	ld	(iy + 1), 0
	push	hl
	call	_gfx_GetStringWidth
	push	hl
	pop	bc
	pop	hl
	ld	hl, (ix - 67)
	ld	e, (hl)
	ld	hl, (ix + 15)
	or	a, a
	sbc	hl, bc
	jr	c, .LBB137_10
; %bb.7:                                ;   in Loop: Header=BB137_4 Depth=2
	ld	a, e
	cp	a, 32
	ld	de, (ix - 60)
	push	de
	pop	hl
	jr	z, .LBB137_9
; %bb.8:                                ;   in Loop: Header=BB137_4 Depth=2
	ld	hl, (ix - 51)
	.local	.LBB137_9
.LBB137_9:                              ;   in Loop: Header=BB137_4 Depth=2
	ld	(ix - 51), hl
	ld	bc, (ix - 63)
	push	bc
	pop	iy
	add	iy, de
	ex	de, hl
	ld	e, (iy + 1)
	push	bc
	pop	iy
	inc	hl
	ld	(ix - 60), hl
	ld	bc, (ix - 51)
	ld	hl, (ix - 57)
	jr	.LBB137_4
	.local	.LBB137_10
.LBB137_10:                             ;   in Loop: Header=BB137_1 Depth=1
	ld	iy, (ix - 63)
	.local	.LBB137_11
.LBB137_11:                             ;   in Loop: Header=BB137_1 Depth=1
	ld	c, -1
	ld	d, 0
	ld	hl, (ix - 51)
	add	hl, bc
	or	a, a
	sbc	hl, bc
	ld	l, c
	jr	nz, .LBB137_13
; %bb.12:                               ;   in Loop: Header=BB137_1 Depth=1
	ld	l, d
	.local	.LBB137_13
.LBB137_13:                             ;   in Loop: Header=BB137_1 Depth=1
	ld	a, e
	or	a, a
	ld	a, c
	jr	nz, .LBB137_15
; %bb.14:                               ;   in Loop: Header=BB137_1 Depth=1
	ld	a, d
	.local	.LBB137_15
.LBB137_15:                             ;   in Loop: Header=BB137_1 Depth=1
	and	a, l
	ld	l, a
	bit	0, l
	ld	bc, (ix - 51)
	jr	nz, .LBB137_17
; %bb.16:                               ;   in Loop: Header=BB137_1 Depth=1
	ld	bc, (ix - 60)
	.local	.LBB137_17
.LBB137_17:                             ;   in Loop: Header=BB137_1 Depth=1
	push	bc
	pop	hl
	ld	de, 2
	or	a, a
	sbc	hl, de
	jr	nc, .LBB137_19
; %bb.18:                               ;   in Loop: Header=BB137_1 Depth=1
	ld	bc, 1
	.local	.LBB137_19
.LBB137_19:                             ;   in Loop: Header=BB137_1 Depth=1
	ld	(ix - 51), bc
	push	bc
	push	iy
	ld	hl, (ix - 54)
	push	hl
	call	_memcpy
	pop	hl
	pop	hl
	pop	hl
	ld	bc, (ix - 54)
	push	bc
	pop	hl
	ld	de, (ix - 51)
	add	hl, de
	ld	(hl), 0
	ld	hl, (ix - 57)
	push	hl
	ld	hl, (ix + 9)
	push	hl
	push	bc
	call	_Text
	ld	iy, (ix - 63)
	pop	hl
	pop	hl
	pop	hl
	ld	de, (ix - 51)
	add	iy, de
	dec	iy
	.local	.LBB137_20
.LBB137_20:                             ;   Parent Loop BB137_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ld	e, (iy + 1)
	inc	iy
	ld	a, e
	cp	a, 32
	jr	z, .LBB137_20
; %bb.21:                               ;   in Loop: Header=BB137_1 Depth=1
	ld	hl, (ix - 57)
	ld	bc, 12
	add	hl, bc
	ld	d, (ix - 64)                    ; 1-byte Folded Reload
	jp	.LBB137_1
	.local	.LBB137_22
.LBB137_22:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end137
.Lfunc_end137:
	.size	_WrapText, .Lfunc_end137-_WrapText
                                        ; -- End function
	.section	.text._Message,"ax",@progbits
	.globl	_Message                        ; -- Begin function Message
	.type	_Message,@function
_Message:                               ; @Message
; %bb.0:
	call	__frameset0
	ld	hl, (ix + 6)
	push	hl
	call	_BeginScreen
	pop	hl
	ld	hl, 10
	push	hl
	ld	hl, 304
	push	hl
	ld	hl, 48
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, (ix + 9)
	push	hl
	call	_WrapText
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 1
	push	hl
	ld	hl, 222
	push	hl
	ld	hl, _.str.4.682
	push	hl
	call	_MenuItem
	pop	hl
	pop	hl
	pop	hl
	call	_gfx_SwapDraw
	.local	.LBB138_1
.LBB138_1:                              ; =>This Inner Loop Header: Depth=1
	call	_WaitKey
	ld	l, -5
	add	a, l
	ld	l, a
	cp	a, 2
	jr	nc, .LBB138_1
; %bb.2:
	call	_ReleaseKeys
	or	a, a
	sbc	hl, hl
	ld	(-917504), hl
	xor	a, a
	ld	(-917501), a
	pop	ix
	ret
	.local	.Lfunc_end138
.Lfunc_end138:
	.size	_Message, .Lfunc_end138-_Message
                                        ; -- End function
	.section	.text._RefreshEffects,"ax",@progbits
	.globl	_RefreshEffects                 ; -- Begin function RefreshEffects
	.type	_RefreshEffects,@function
_RefreshEffects:                        ; @RefreshEffects
; %bb.0:
	ld	hl, -49
	call	__frameset
	ld	iy, _region+10
	ld	bc, 0
	lea	hl, ix - 43
	ld	(ix - 46), hl
	ld	de, 42
	.local	.LBB139_1
.LBB139_1:                              ; =>This Inner Loop Header: Depth=1
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	jr	z, .LBB139_3
; %bb.2:                                ;   in Loop: Header=BB139_1 Depth=1
	ld	hl, (ix - 46)
	add	hl, bc
	ex	de, hl
	lea	hl, iy + 0
	ld	(ix - 49), bc
	ld	bc, 6
	ldir
	ld	de, 42
	ld	hl, (ix - 49)
	ld	bc, 6
	add	hl, bc
	lea	iy, iy + 16
	push	hl
	pop	bc
	jr	.LBB139_1
	.local	.LBB139_3
.LBB139_3:
	ld	hl, _disease
	push	hl
	ld	hl, _world_events
	push	hl
	call	_EventsRefreshTraits
	pop	hl
	pop	hl
	ld	hl, _effects
	push	hl
	ld	hl, _disease
	push	hl
	call	_CalculateEffects
	pop	hl
	pop	hl
	ld	hl, _event_modifiers
	push	hl
	ld	hl, _effects
	push	hl
	ld	hl, (ix - 46)
	push	hl
	ld	hl, _disease
	push	hl
	ld	hl, _world_events
	push	hl
	call	_EventsApply
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end139
.Lfunc_end139:
	.size	_RefreshEffects, .Lfunc_end139-_RefreshEffects
                                        ; -- End function
	.section	.text._ResetGameState,"ax",@progbits
	.globl	_ResetGameState                 ; -- Begin function ResetGameState
	.type	_ResetGameState,@function
_ResetGameState:                        ; @ResetGameState
; %bb.0:
	ld	hl, -3
	call	__frameset
	ld	bc, 0
	.local	.LBB140_1
.LBB140_1:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB140_3 Depth 2
	ld	de, 7
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	jr	z, .LBB140_8
; %bb.2:                                ;   in Loop: Header=BB140_1 Depth=1
	ld	(ix - 3), bc
	push	bc
	pop	hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de, hl
	ld	iy, _region
	add	iy, de
	or	a, a
	sbc	hl, hl
	push	hl
	pop	de
	.local	.LBB140_3
.LBB140_3:                              ;   Parent Loop BB140_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ld	a, (iy + 6)
	push	hl
	pop	bc
	ld	c, a
	ld	a, (iy + 7)
	ld	l, a
	call	__imulu
	push	hl
	pop	bc
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	jr	nc, .LBB140_7
; %bb.4:                                ;   in Loop: Header=BB140_3 Depth=2
	ld	hl, (iy + 3)
	push	hl
	pop	bc
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	z, .LBB140_6
; %bb.5:                                ;   in Loop: Header=BB140_3 Depth=2
	push	bc
	pop	hl
	add	hl, de
	ld	(hl), -1
	.local	.LBB140_6
.LBB140_6:                              ;   in Loop: Header=BB140_3 Depth=2
	inc	de
	or	a, a
	sbc	hl, hl
	jr	.LBB140_3
	.local	.LBB140_7
.LBB140_7:                              ;   in Loop: Header=BB140_1 Depth=1
	push	iy
	call	_RecountRegion
	pop	hl
	ld	bc, (ix - 3)
	inc	bc
	jr	.LBB140_1
	.local	.LBB140_8
.LBB140_8:
	xor	a, a
	ld	(_disease), a
	ld	hl, _disease
	push	hl
	pop	de
	inc	de
	ld	bc, 57
	ldir
	ld.sis	hl, 12
	ld	iy, _disease+20
	ld	(iy), l
	ld	(iy + 1), h
	ld	de, _disease+37
	ld	hl, _.str.61.724
	ld	bc, 9
	ldir
	ld	(_session), a
	ld	hl, _session
	push	hl
	pop	de
	inc	de
	ld	bc, 8
	ldir
	ld	de, _port
	ld	hl, _port_definitions
	ld	bc, 132
	ldir
	ld	hl, (-851900)
	ld	a, (-851897)
	ld	e, a
	ld	bc, -5531699
	ld	a, 67
	call	__lxor
                                        ; kill: def $e killed $e def $ude
	push	de
	push	hl
	ld	hl, _disease
	push	hl
	ld	hl, _world_events
	push	hl
	call	_EventsInit
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	call	_RefreshEffects
	xor	a, a
	ld	(_connection), a
	ld	(_destination_port), a
	ld	(_source_port), a
	ld	(_canpress), a
	ld	hl, _disease
	push	hl
	call	_TickerInit
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end140
.Lfunc_end140:
	.size	_ResetGameState, .Lfunc_end140-_ResetGameState
                                        ; -- End function
	.section	.text._UpdateSelectedRegion,"ax",@progbits
	.globl	_UpdateSelectedRegion           ; -- Begin function UpdateSelectedRegion
	.type	_UpdateSelectedRegion,@function
_UpdateSelectedRegion:                  ; @UpdateSelectedRegion
; %bb.0:
	ld	hl, -20
	call	__frameset
	ld	a, (_canpress)
	bit	0, a
	jp	z, .LBB141_33
; %bb.1:
	call	_kb_Scan
	ld	hl, -720866
	push	de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, e
	ld	h, d
	pop	de
	ld	c, 14
	call	__sshl
	add.sis	hl, hl
	sbc.sis	hl, hl
	ex.sis	de, hl
	ld	a, d
	rlc	a
	sbc	hl, hl
	ld	l, e
	ld	h, d
	ex	de, hl
	ld	hl, -720866
	push	de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, e
	ld	h, d
	pop	de
	ld	c, 2
	call	__sshru
	ld.sis	bc, 1
	call	__sand
	ld	iy, 0
	ex	de, hl
	ld	iyl, e
	ld	iyh, d
	ex	de, hl
	add	iy, de
	ld	(ix - 9), iy
	ld	hl, -720866
	push	de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, e
	ld	h, d
	pop	de
	ld	c, 12
	call	__sshl
	add.sis	hl, hl
	sbc.sis	hl, hl
	ex.sis	de, hl
	ld	a, d
	rlc	a
	sbc	hl, hl
	push	hl
	pop	iy
	ld	iyl, e
	ld	iyh, d
	ld	hl, -720866
	push	de
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, e
	ld	h, d
	pop	de
	ld.sis	bc, 1
	call	__sand
	ld	de, 0
	ld	e, l
	ld	d, h
	add	iy, de
	ld	(ix - 18), iy
	ld	hl, (ix - 9)
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB141_6
; %bb.2:
	ld	hl, (ix - 18)
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	z, .LBB141_4
; %bb.3:
	ld	a, 0
	jr	.LBB141_5
	.local	.LBB141_4
.LBB141_4:
	ld	a, -1
	.local	.LBB141_5
.LBB141_5:
	bit	0, a
	jp	nz, .LBB141_33
	.local	.LBB141_6
.LBB141_6:
	ld	iyl, 0
	ld	de, _region
	ld	a, (_session+4)
	or	a, a
	sbc	hl, hl
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	push	hl
	pop	bc
	ex	de, hl
	add	hl, bc
	ld	(ix - 15), hl
	ld	bc, 0
	ld	de, 112
	ld	iyh, iyl
	ld	hl, 10000
	ld	(ix - 6), hl
	ld	(ix - 3), bc
	ld	a, iyl
	.local	.LBB141_7
.LBB141_7:                              ; =>This Inner Loop Header: Depth=1
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	jp	z, .LBB141_30
; %bb.8:                                ;   in Loop: Header=BB141_7 Depth=1
	ld	(ix - 12), bc
	ld	bc, (ix - 9)
	push	bc
	pop	hl
	ld	de, -1
	or	a, a
	sbc	hl, de
	ld	(ix - 20), a
	push	af
	ld	a, iyh
	ld	(ix - 19), a
	pop	af
	jr	nz, .LBB141_11
; %bb.9:                                ;   in Loop: Header=BB141_7 Depth=1
	ld	iy, _region
	ld	bc, (ix - 12)
	add	iy, bc
	lea	de, iy + 0
	ld	a, (iy + 8)
	ld	iy, (ix - 15)
	ld	c, (iy + 8)
	cp	a, c
	jp	nc, .LBB141_23
; %bb.10:                               ;   in Loop: Header=BB141_7 Depth=1
	or	a, a
	sbc	hl, hl
	push	hl
	pop	iy
	ld	l, c
	lea	bc, iy + 0
	ld	c, a
	jr	.LBB141_14
	.local	.LBB141_11
.LBB141_11:                             ;   in Loop: Header=BB141_7 Depth=1
	push	bc
	pop	hl
	ld	de, 1
	or	a, a
	sbc	hl, de
	jr	nz, .LBB141_16
; %bb.12:                               ;   in Loop: Header=BB141_7 Depth=1
	ld	iy, _region
	ld	bc, (ix - 12)
	add	iy, bc
	lea	de, iy + 0
	ld	c, (iy + 8)
	ld	iy, (ix - 15)
	ld	a, (iy + 8)
	cp	a, c
	jp	nc, .LBB141_23
; %bb.13:                               ;   in Loop: Header=BB141_7 Depth=1
	ld	iy, 0
	ld	iyl, a
	or	a, a
	sbc	hl, hl
	ld	l, c
	lea	bc, iy + 0
	.local	.LBB141_14
.LBB141_14:                             ;   in Loop: Header=BB141_7 Depth=1
	or	a, a
	sbc	hl, bc
	ld	(ix - 3), hl
	push	de
	pop	iy
	ld	a, (iy + 9)
	ld	bc, 0
	push	bc
	pop	hl
	ld	l, a
	ld	iy, (ix - 15)
	ld	a, (iy + 9)
	.local	.LBB141_15
.LBB141_15:                             ;   in Loop: Header=BB141_7 Depth=1
	ld	c, a
	or	a, a
	sbc	hl, bc
	push	hl
	pop	iy
	add	hl, hl
	sbc	hl, hl
	push	hl
	pop	bc
	add	iy, bc
	lea	hl, iy + 0
	call	__ixor
	ld	bc, 3
	call	__imulu
	push	hl
	pop	bc
	ld	hl, (ix - 3)
	add	hl, bc
	ld	bc, (ix - 6)
	jp	.LBB141_24
	.local	.LBB141_16
.LBB141_16:                             ;   in Loop: Header=BB141_7 Depth=1
	ld	bc, (ix - 18)
	push	bc
	pop	hl
	ld	de, -1
	or	a, a
	sbc	hl, de
	jr	nz, .LBB141_19
; %bb.17:                               ;   in Loop: Header=BB141_7 Depth=1
	ld	iy, _region
	ld	bc, (ix - 12)
	add	iy, bc
	lea	de, iy + 0
	ld	a, (iy + 9)
	ld	iy, (ix - 15)
	ld	c, (iy + 9)
	cp	a, c
	jr	nc, .LBB141_23
; %bb.18:                               ;   in Loop: Header=BB141_7 Depth=1
	or	a, a
	sbc	hl, hl
	push	hl
	pop	iy
	ld	l, c
	lea	bc, iy + 0
	ld	c, a
	jr	.LBB141_22
	.local	.LBB141_19
.LBB141_19:                             ;   in Loop: Header=BB141_7 Depth=1
	push	bc
	pop	hl
	ld	de, 1
	or	a, a
	sbc	hl, de
	ld	bc, 10000
	ld	hl, (ix - 3)
	jr	nz, .LBB141_25
; %bb.20:                               ;   in Loop: Header=BB141_7 Depth=1
	ld	iy, _region
	ld	bc, (ix - 12)
	add	iy, bc
	lea	de, iy + 0
	ld	c, (iy + 9)
	ld	iy, (ix - 15)
	ld	a, (iy + 9)
	cp	a, c
	jr	nc, .LBB141_23
; %bb.21:                               ;   in Loop: Header=BB141_7 Depth=1
	ld	iy, 0
	ld	iyl, a
	or	a, a
	sbc	hl, hl
	ld	l, c
	lea	bc, iy + 0
	.local	.LBB141_22
.LBB141_22:                             ;   in Loop: Header=BB141_7 Depth=1
	or	a, a
	sbc	hl, bc
	ld	(ix - 3), hl
	push	de
	pop	iy
	ld	a, (iy + 8)
	ld	bc, 0
	push	bc
	pop	hl
	ld	l, a
	ld	iy, (ix - 15)
	ld	a, (iy + 8)
	jp	.LBB141_15
	.local	.LBB141_23
.LBB141_23:                             ;   in Loop: Header=BB141_7 Depth=1
	ld	bc, (ix - 6)
	ld	hl, 10000
	.local	.LBB141_24
.LBB141_24:                             ;   in Loop: Header=BB141_7 Depth=1
	push	af
	ld	a, (ix - 19)                    ; 1-byte Folded Reload
	ld	iyh, a
	pop	af
	.local	.LBB141_25
.LBB141_25:                             ;   in Loop: Header=BB141_7 Depth=1
	push	hl
	pop	de
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	ld	(ix - 3), de
	jp	m, .LBB141_27
; %bb.26:                               ;   in Loop: Header=BB141_7 Depth=1
	push	bc
	pop	de
	.local	.LBB141_27
.LBB141_27:                             ;   in Loop: Header=BB141_7 Depth=1
	ld	(ix - 6), de
	ld	hl, (ix - 3)
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	ld	a, iyh
	jp	m, .LBB141_29
; %bb.28:                               ;   in Loop: Header=BB141_7 Depth=1
	ld	a, (ix - 20)                    ; 1-byte Folded Reload
	.local	.LBB141_29
.LBB141_29:                             ;   in Loop: Header=BB141_7 Depth=1
	ld	hl, (ix - 12)
	ld	bc, 16
	add	hl, bc
	inc	iyh
	push	hl
	pop	bc
	ld	de, 112
	jp	.LBB141_7
	.local	.LBB141_30
.LBB141_30:
	ld	bc, 5000
	ld	hl, (ix - 6)
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	jp	p, .LBB141_32
; %bb.31:
	ld	(_session+4), a
	.local	.LBB141_32
.LBB141_32:
	xor	a, a
	ld	(_canpress), a
	.local	.LBB141_33
.LBB141_33:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end141
.Lfunc_end141:
	.size	_UpdateSelectedRegion, .Lfunc_end141-_UpdateSelectedRegion
                                        ; -- End function
	.section	.text._ActionsMenu,"ax",@progbits
	.globl	_ActionsMenu                    ; -- Begin function ActionsMenu
	.type	_ActionsMenu,@function
_ActionsMenu:                           ; @ActionsMenu
; %bb.0:
	ld	hl, -135
	call	__frameset
	ld	l, 7
	ld	iy, -2
	ld	c, 1
	lea	de, ix - 95
	ld	(ix - 110), de
	ld	(ix - 7), 0
	ld	a, (_disease+32)
	cp	a, 2
	ld	e, 0
	ld	a, c
	jr	z, .LBB142_2
; %bb.1:
	ld	a, e
	.local	.LBB142_2
.LBB142_2:
	lea	de, ix - 71
	ld	(ix - 113), de
	add	a, l
	ld	l, a
	ld	de, 0
	push	ix
	lea	ix, ix - 128
	ld	(ix - 4), hl
	pop	ix
	ld	e, l
	push	de
	pop	hl
	lea	bc, iy + 0
	add	hl, bc
	ld	bc, 3
	call	__imulu
	push	hl
	pop	bc
	ld	iy, (ix - 110)
	lea	hl, iy + 0
	add	hl, bc
	ld	(ix - 125), hl
	ld	(ix - 101), de
	dec	de
	ld	bc, -135
	lea	hl, ix + 0
	add	hl, bc
	ld	(hl), de
	ex	de, hl
	ld	bc, 3
	call	__imulu
	ex	de, hl
	add	iy, de
	ld	(ix - 128), iy
	ld	e, b
	.local	.LBB142_3
.LBB142_3:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB142_19 Depth 2
	ld	hl, _.str.5.687
	ld	(ix - 95), hl
	ld	hl, _.str.6.688
	ld	(ix - 92), hl
	ld	hl, _.str.7.689
	ld	(ix - 89), hl
	ld	a, (_session+8)
	or	a, a
	ld	hl, _.str.9.690
	jr	z, .LBB142_5
; %bb.4:                                ;   in Loop: Header=BB142_3 Depth=1
	ld	hl, _.str.8.691
	.local	.LBB142_5
.LBB142_5:                              ;   in Loop: Header=BB142_3 Depth=1
	ld	(ix - 98), e                    ; 1-byte Folded Spill
	ld	(ix - 86), hl
	ld	hl, _.str.10.692
	ld	(ix - 83), hl
	ld	a, (_disease+36)
	cp	a, 3
	jr	nc, .LBB142_7
; %bb.6:                                ;   in Loop: Header=BB142_3 Depth=1
	ld	de, 0
	ld	e, a
	ld	hl, 3
	or	a, a
	sbc	hl, de
	ld	iy, _spore_costs
	add	iy, de
	ld	a, (iy)
	ld	de, 0
	ld	e, a
	push	de
	push	hl
	ld	hl, _.str.11.693
	push	hl
	ld	hl, 64
	push	hl
	ld	hl, (ix - 113)
	push	hl
	call	_snprintf
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	jr	.LBB142_8
	.local	.LBB142_7
.LBB142_7:                              ;   in Loop: Header=BB142_3 Depth=1
	ld	de, (ix - 113)
	ld	hl, _.str.12.694
	ld	bc, 29
	ldir
	.local	.LBB142_8
.LBB142_8:                              ;   in Loop: Header=BB142_3 Depth=1
	ld	a, (_disease+32)
	cp	a, 2
	jr	nz, .LBB142_10
; %bb.9:                                ;   in Loop: Header=BB142_3 Depth=1
	ld	hl, (ix - 113)
	ld	(ix - 80), hl
	.local	.LBB142_10
.LBB142_10:                             ;   in Loop: Header=BB142_3 Depth=1
	ld	hl, _.str.13.695
	ld	iy, (ix - 125)
	ld	(iy), hl
	ld	hl, _.str.14.696
	ld	iy, (ix - 128)
	ld	(iy), hl
	ld	hl, _.str.15.697
	push	hl
	call	_BeginScreen
	pop	hl
	ld	c, (ix - 7)
	ld	a, c
	ld	l, (ix - 98)                    ; 1-byte Folded Reload
	cp	a, l
	jr	c, .LBB142_12
; %bb.11:                               ;   in Loop: Header=BB142_3 Depth=1
	ld	a, l
	.local	.LBB142_12
.LBB142_12:                             ;   in Loop: Header=BB142_3 Depth=1
	or	a, a
	sbc	hl, hl
	push	hl
	pop	iy
	ld	l, c
	ld	iyl, a
	ld	de, 6
	add	iy, de
	lea	de, iy + 0
	ld	(ix - 107), hl
	or	a, a
	sbc	hl, de
	jr	c, .LBB142_14
; %bb.13:                               ;   in Loop: Header=BB142_3 Depth=1
	ld	l, -5
	ld	a, c
	add	a, l
	ld	l, a
	.local	.LBB142_14
.LBB142_14:                             ;   in Loop: Header=BB142_3 Depth=1
	ld	de, -129
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), c                     ; 1-byte Folded Spill
	ld	de, 0
	ld	e, a
	push	de
	pop	hl
	ld	bc, 6
	add	hl, bc
	push	hl
	pop	bc
	ld	iy, (ix - 101)
	lea	hl, iy + 0
	ld	(ix - 104), bc
	or	a, a
	sbc	hl, bc
	lea	bc, iy + 0
	jr	c, .LBB142_16
; %bb.15:                               ;   in Loop: Header=BB142_3 Depth=1
	ld	bc, (ix - 104)
	.local	.LBB142_16
.LBB142_16:                             ;   in Loop: Header=BB142_3 Depth=1
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	jr	c, .LBB142_18
; %bb.17:                               ;   in Loop: Header=BB142_3 Depth=1
	push	de
	pop	bc
	.local	.LBB142_18
.LBB142_18:                             ;   in Loop: Header=BB142_3 Depth=1
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	push	hl
	pop	iy
	push	de
	pop	hl
	ld	bc, 3
	call	__imulu
	lea	bc, iy + 0
	ld	(ix - 98), hl
	ld	hl, (ix - 107)
	or	a, a
	sbc	hl, de
	ex	de, hl
	ld	hl, 38
	push	hl
	pop	iy
	ld	(ix - 107), a                   ; 1-byte Folded Spill
	.local	.LBB142_19
.LBB142_19:                             ;   Parent Loop BB142_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	sbc	hl, hl
	adc	hl, bc
	jr	z, .LBB142_23
; %bb.20:                               ;   in Loop: Header=BB142_19 Depth=2
	ld	(ix - 116), bc
	ld	hl, (ix - 110)
	ld	bc, (ix - 98)
	add	hl, bc
	push	de
	pop	bc
	ld	de, (hl)
	ld	(ix - 119), bc
	sbc	hl, hl
	adc	hl, bc
	ld	hl, -1
	jr	z, .LBB142_22
; %bb.21:                               ;   in Loop: Header=BB142_19 Depth=2
	ld	hl, 0
	.local	.LBB142_22
.LBB142_22:                             ;   in Loop: Header=BB142_19 Depth=2
	push	hl
	push	iy
	push	de
	ld	(ix - 122), iy
	call	_MenuItem
	ld	iy, (ix - 122)
	pop	hl
	pop	hl
	pop	hl
	ld	bc, (ix - 116)
	dec	bc
	ld	hl, (ix - 98)
	ld	de, 3
	add	hl, de
	ld	de, 24
	add	iy, de
	ld	de, (ix - 119)
	dec	de
	ld	(ix - 98), hl
	ld	a, (ix - 107)                   ; 1-byte Folded Reload
	jr	.LBB142_19
	.local	.LBB142_23
.LBB142_23:                             ;   in Loop: Header=BB142_3 Depth=1
	or	a, a
	ld	hl, 24
	push	hl
	ld	hl, 250
	push	hl
	ld	hl, _.str.16.698
	push	hl
	call	nz, _Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (ix - 104)
	ld	de, (ix - 101)
	or	a, a
	sbc	hl, de
	ld	hl, 185
	push	hl
	ld	hl, 250
	push	hl
	ld	hl, _.str.17.699
	push	hl
	call	c, _Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 211
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, _.str.2.678
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 226
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, _.str.18.700
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	call	_gfx_SwapDraw
	call	_WaitKey
	ld	e, a
	cp	a, 6
	jp	z, .LBB142_40
; %bb.24:                               ;   in Loop: Header=BB142_3 Depth=1
	ld	a, e
	cp	a, 5
	jr	nz, .LBB142_26
; %bb.25:                               ;   in Loop: Header=BB142_3 Depth=1
	ld	bc, -129
	lea	iy, ix + 0
	add	iy, bc
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	or	a, a
	jp	z, .LBB142_40
	.local	.LBB142_26
.LBB142_26:                             ;   in Loop: Header=BB142_3 Depth=1
	ld	bc, -132
	lea	iy, ix + 0
	add	iy, bc
	ld	hl, (iy + 0)
	push	hl
	pea	ix - 7
	push	de
	ld	(ix - 98), de
	call	_MenuMove
	ld	l, a
	pop	de
	pop	de
	pop	de
	ld	de, (ix - 98)
	ld	a, e
	cp	a, 5
	ld	a, (ix - 107)                   ; 1-byte Folded Reload
	ld	e, a
	jp	nz, .LBB142_3
; %bb.27:                               ;   in Loop: Header=BB142_3 Depth=1
	bit	0, l
	ld	e, a
	jp	nz, .LBB142_3
; %bb.28:                               ;   in Loop: Header=BB142_3 Depth=1
	ld	l, (ix - 7)
	ld	a, l
	dec	a
	cp	a, 4
	jr	c, .LBB142_32
; %bb.29:                               ;   in Loop: Header=BB142_3 Depth=1
	ld	a, (_disease+32)
	ld	e, a
	ld	a, l
	cp	a, 5
	jr	nz, .LBB142_34
; %bb.30:                               ;   in Loop: Header=BB142_3 Depth=1
	ld	a, e
	cp	a, 2
	jr	nz, .LBB142_34
; %bb.31:                               ;   in Loop: Header=BB142_3 Depth=1
	call	_SporeMenu
	ld	e, (ix - 107)                   ; 1-byte Folded Reload
	jp	.LBB142_3
	.local	.LBB142_32
.LBB142_32:                             ;   in Loop: Header=BB142_3 Depth=1
	ld	de, 0
	ld	e, a
	ld	hl, JTI142_0
	add	hl, de
	add	hl, de
	add	hl, de
	ld	hl, (hl)
	jp	(hl)
	.local	.LBB142_33
.LBB142_33:                             ;   in Loop: Header=BB142_3 Depth=1
	call	_EvolutionMenu
	ld	e, (ix - 107)                   ; 1-byte Folded Reload
	jp	.LBB142_3
	.local	.LBB142_34
.LBB142_34:                             ;   in Loop: Header=BB142_3 Depth=1
	ld	de, 0
	ld	e, l
	ld	bc, -135
	lea	iy, ix + 0
	add	iy, bc
	ld	hl, (iy + 0)
	or	a, a
	sbc	hl, de
	ld	a, 1
	ld	l, a
	jr	z, .LBB142_36
; %bb.35:                               ;   in Loop: Header=BB142_3 Depth=1
	ld	a, 0
	ld	l, a
	.local	.LBB142_36
.LBB142_36:                             ;   in Loop: Header=BB142_3 Depth=1
	inc	l
	push	hl
	call	_SaveExit
	ld	c, a
	pop	hl
	or	a, a
	ld	e, (ix - 107)                   ; 1-byte Folded Reload
	jp	z, .LBB142_3
	jr	.LBB142_41
	.local	.LBB142_37
.LBB142_37:                             ;   in Loop: Header=BB142_3 Depth=1
	ld	a, (_session+8)
	ld	l, 1
	xor	a, l
	ld	l, a
	ld	(_session+8), a
	ld	e, (ix - 107)                   ; 1-byte Folded Reload
	jp	.LBB142_3
	.local	.LBB142_38
.LBB142_38:                             ;   in Loop: Header=BB142_3 Depth=1
	call	_WorldEventsMenu
	ld	e, (ix - 107)                   ; 1-byte Folded Reload
	jp	.LBB142_3
	.local	.LBB142_39
.LBB142_39:                             ;   in Loop: Header=BB142_3 Depth=1
	call	_RegionInfo
	ld	e, (ix - 107)                   ; 1-byte Folded Reload
	jp	.LBB142_3
	.local	.LBB142_40
.LBB142_40:
	ld	c, 0
	.local	.LBB142_41
.LBB142_41:
	ld	(ix - 98), c
	call	_EndModal
	ld	a, (ix - 98)                    ; 1-byte Folded Reload
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end142
.Lfunc_end142:
	.size	_ActionsMenu, .Lfunc_end142-_ActionsMenu
	.section	.rodata._ActionsMenu,"a",@progbits
JTI142_0:
	d24	.LBB142_33
	d24	.LBB142_39
	d24	.LBB142_37
	d24	.LBB142_38
                                        ; -- End function
	.section	.text._SaveExit,"ax",@progbits
	.type	_SaveExit,@function             ; -- Begin function SaveExit
_SaveExit:                              ; @SaveExit
; %bb.0:
	call	__frameset0
	call	_SaveData
	bit	0, a
	jr	z, .LBB143_2
	.local	.LBB143_1
.LBB143_1:
	ld	a, (ix + 6)
	jp	.LBB143_10
	.local	.LBB143_2
.LBB143_2:                              ; %.preheader.preheader
	ld	hl, _.str.39.701
	ld	de, _SaveExit.choices
	ld	bc, 0
	ld	iy, 3
	.local	.LBB143_3
.LBB143_3:                              ; %.preheader
                                        ; =>This Inner Loop Header: Depth=1
	push	bc
	push	iy
	push	de
	push	hl
	call	_ChooseMenu
	ld	l, a
	pop	de
	pop	de
	pop	de
	pop	de
	inc	a
	cp	a, 2
	jr	c, .LBB143_9
; %bb.4:                                ;   in Loop: Header=BB143_3 Depth=1
	ld	a, l
	cp	a, 1
	jr	nz, .LBB143_6
; %bb.5:                                ;   in Loop: Header=BB143_3 Depth=1
	call	_SaveData
	bit	0, a
	ld	hl, _.str.39.701
	ld	de, _SaveExit.choices
	ld	bc, 0
	ld	iy, 3
	jr	nz, .LBB143_1
	jr	.LBB143_3
	.local	.LBB143_6
.LBB143_6:                              ;   in Loop: Header=BB143_3 Depth=1
	ld	a, l
	cp	a, 2
	ld	hl, _.str.39.701
	ld	de, _SaveExit.choices
	ld	bc, 0
	ld	iy, 3
	jr	nz, .LBB143_3
; %bb.7:                                ;   in Loop: Header=BB143_3 Depth=1
	push	bc
	ld	hl, 2
	push	hl
	ld	hl, _SaveExit.confirm
	push	hl
	ld	hl, _.str.41.702
	push	hl
	call	_ChooseMenu
	ld	iy, 3
	ld	bc, 0
	ld	de, _SaveExit.choices
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, _.str.39.701
	cp	a, 1
	jr	nz, .LBB143_3
; %bb.8:
	ld	a, 2
	jr	.LBB143_10
	.local	.LBB143_9
.LBB143_9:
	xor	a, a
	.local	.LBB143_10
.LBB143_10:                             ; %.loopexit
	pop	ix
	ret
	.local	.Lfunc_end143
.Lfunc_end143:
	.size	_SaveExit, .Lfunc_end143-_SaveExit
                                        ; -- End function
	.section	.text._contagion_game_main,"ax",@progbits
	.globl	_contagion_game_main            ; -- Begin function contagion_game_main
	.type	_contagion_game_main,@function
_contagion_game_main:                   ; @contagion_game_main
; %bb.0:
	ld	hl, -91
	call	__frameset
	ld	(ix - 43), 0
	ld	hl, (-851900)
	ld	a, (-851897)
	push	hl
	call	_srand
	pop	hl
	call	_gfx_Begin
	ld	hl, 1
	push	hl
	call	_gfx_SetDraw
	pop	hl
	or	a, a
	sbc	hl, hl
	push	hl
	call	_gfx_SetTransparentColor
	pop	hl
	or	a, a
	sbc	hl, hl
	push	hl
	call	_gfx_SetTextTransparentColor
	pop	hl
	call	_InitializeMap
	call	_ResetGameState
	call	_LoadData
	bit	0, a
	jr	nz, .LBB144_5
; %bb.1:
	call	_HasLegacySave
	bit	0, a
	jr	z, .LBB144_5
; %bb.2:
	ld	hl, _.str.21.707
	ld	de, _contagion_game_main.choices
	ld	bc, 0
	push	bc
	ld	bc, 2
	push	bc
	push	de
	push	hl
	call	_ChooseMenu
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	or	a, a
	jr	nz, .LBB144_5
; %bb.3:
	call	_ImportLegacySave
	bit	0, a
	jr	nz, .LBB144_5
; %bb.4:
	ld	hl, _.str.22.708
	ld	de, _.str.23.709
	push	de
	push	hl
	call	_Message
	pop	hl
	pop	hl
	.local	.LBB144_5
.LBB144_5:
	ld	l, 28
	ld	(ix - 75), l
	ld	(ix - 74), h
	lea	hl, ix - 40
	ld	(ix - 78), hl
	lea	hl, ix - 52
	ld	(ix - 55), hl
	ld	hl, _disease
	push	hl
	call	_TickerInit
	pop	hl
	ld.sis	hl, 515
	ld	iy, -917456
	ld	(iy), l
	ld	(iy + 1), h
	.local	.LBB144_6
.LBB144_6:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB144_15 Depth 2
                                        ;     Child Loop BB144_26 Depth 2
                                        ;       Child Loop BB144_27 Depth 3
                                        ;     Child Loop BB144_42 Depth 2
                                        ;       Child Loop BB144_43 Depth 3
                                        ;         Child Loop BB144_44 Depth 4
                                        ;     Child Loop BB144_92 Depth 2
                                        ;       Child Loop BB144_93 Depth 3
                                        ;     Child Loop BB144_112 Depth 2
	ld	hl, _.str.24.710
	push	hl
	call	_BeginScreen
	pop	hl
	ld	hl, 42
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, _.str.25.711
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 4
	push	hl
	ld	hl, 304
	push	hl
	ld	hl, 69
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, _.str.26.712
	push	hl
	call	_WrapText
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	a, (_disease+33)
	or	a, a
	ld	e, -1
	jr	z, .LBB144_8
; %bb.7:                                ;   in Loop: Header=BB144_6 Depth=1
	ld	e, 0
	.local	.LBB144_8
.LBB144_8:                              ;   in Loop: Header=BB144_6 Depth=1
	ld	a, e
	rrc	a
	sbc	a, a
	ld	l, a
	ld	bc, _.str.27.713
	ld	(ix - 52), bc
	bit	0, e
	jr	nz, .LBB144_12
; %bb.9:                                ;   in Loop: Header=BB144_6 Depth=1
	ld	a, (_disease+34)
	or	a, a
	ld	de, _.str.28.714
	jr	z, .LBB144_11
; %bb.10:                               ;   in Loop: Header=BB144_6 Depth=1
	ld	de, _.str.29.715
	.local	.LBB144_11
.LBB144_11:                             ;   in Loop: Header=BB144_6 Depth=1
	ld	(ix - 49), de
	.local	.LBB144_12
.LBB144_12:                             ;   in Loop: Header=BB144_6 Depth=1
	ld	e, 3
	ld	a, l
	add	a, e
	ld	iyl, a
	ld	de, 0
	ld	e, iyl
	push	de
	pop	hl
	dec	hl
	ld	(ix - 70), hl
	ld	bc, 3
	call	__imulu
	push	hl
	pop	bc
	ld	hl, (ix - 55)
	add	hl, bc
	ld	bc, _.str.14.696
	ld	(hl), bc
	ld	a, (ix - 43)
	ld	(ix - 73), iy
	cp	a, iyl
	jr	c, .LBB144_14
; %bb.13:                               ;   in Loop: Header=BB144_6 Depth=1
	xor	a, a
	.local	.LBB144_14
.LBB144_14:                             ;   in Loop: Header=BB144_6 Depth=1
	ld	(ix - 43), a
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	bc, 3
	call	__imulu
	ld	(ix - 58), hl
	ex	de, hl
	call	__imulu
	ex	de, hl
	ld	hl, 130
	push	hl
	pop	iy
	or	a, a
	sbc	hl, hl
	push	hl
	pop	bc
	.local	.LBB144_15
.LBB144_15:                             ;   Parent Loop BB144_6 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	jr	z, .LBB144_19
; %bb.16:                               ;   in Loop: Header=BB144_15 Depth=2
	ld	(ix - 61), de
	ld	hl, (ix - 55)
	add	hl, bc
	ld	de, (hl)
	ld	hl, (ix - 58)
	ld	(ix - 67), bc
	or	a, a
	sbc	hl, bc
	ld	hl, -1
	jr	z, .LBB144_18
; %bb.17:                               ;   in Loop: Header=BB144_15 Depth=2
	ld	hl, 0
	.local	.LBB144_18
.LBB144_18:                             ;   in Loop: Header=BB144_15 Depth=2
	push	hl
	push	iy
	push	de
	ld	(ix - 64), iy
	call	_MenuItem
	ld	iy, (ix - 64)
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (ix - 67)
	ld	de, 3
	add	hl, de
	ld	de, 24
	add	iy, de
	push	hl
	pop	bc
	ld	de, (ix - 61)
	jr	.LBB144_15
	.local	.LBB144_19
.LBB144_19:                             ;   in Loop: Header=BB144_6 Depth=1
	ld	hl, 207
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, _.str.2.678
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 224
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, _.str.30.716
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	call	_gfx_SwapDraw
	call	_WaitKey
	ld	e, a
	cp	a, 6
	jr	nz, .LBB144_22
; %bb.20:                               ;   in Loop: Header=BB144_6 Depth=1
	ld	hl, (ix - 70)
	ld	a, l
	.local	.LBB144_21
.LBB144_21:                             ; %.loopexit
                                        ;   in Loop: Header=BB144_6 Depth=1
	ld	(ix - 43), a
	jp	.LBB144_6
	.local	.LBB144_22
.LBB144_22:                             ;   in Loop: Header=BB144_6 Depth=1
	ld	hl, (ix - 73)
	push	hl
	pea	ix - 43
	push	de
	ld	(ix - 58), de
	call	_MenuMove
	ld	l, a
	pop	de
	pop	de
	pop	de
	ld	de, (ix - 58)
	ld	a, e
	cp	a, 5
	jp	nz, .LBB144_6
; %bb.23:                               ;   in Loop: Header=BB144_6 Depth=1
	bit	0, l
	jp	nz, .LBB144_6
; %bb.24:                               ;   in Loop: Header=BB144_6 Depth=1
	ld	l, (ix - 43)
	ld	a, l
	or	a, a
	jp	nz, .LBB144_38
; %bb.25:                               ; %.preheader.preheader
                                        ;   in Loop: Header=BB144_6 Depth=1
	xor	a, a
	ld	(ix - 58), a                    ; 1-byte Folded Spill
	.local	.LBB144_26
.LBB144_26:                             ; %.preheader
                                        ;   Parent Loop BB144_6 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB144_27 Depth 3
	ld	hl, _.str.52.717
	push	hl
	call	_BeginScreen
	pop	hl
	or	a, a
	sbc	hl, hl
	ld	l, (ix - 58)                    ; 1-byte Folded Reload
	ld	(ix - 64), hl
	ld	bc, 24
	call	__imulu
	ld	(ix - 67), hl
	ld	de, 35
	add	hl, de
	ld	(ix - 73), hl
	ld	hl, _disease_names
	push	hl
	pop	iy
	or	a, a
	sbc	hl, hl
	.local	.LBB144_27
.LBB144_27:                             ;   Parent Loop BB144_6 Depth=1
                                        ;     Parent Loop BB144_26 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	push	hl
	pop	bc
	ld	de, 72
	or	a, a
	sbc	hl, de
	jr	z, .LBB144_31
; %bb.28:                               ;   in Loop: Header=BB144_27 Depth=3
	ld	hl, (ix - 67)
	or	a, a
	sbc	hl, bc
	ld	(ix - 61), iy
	jr	nz, .LBB144_30
; %bb.29:                               ;   in Loop: Header=BB144_27 Depth=3
	ld	hl, 224
	push	hl
	ld	(ix - 70), bc
	call	_gfx_SetColor
	pop	hl
	ld	hl, 20
	push	hl
	ld	hl, 304
	push	hl
	ld	hl, (ix - 73)
	push	hl
	ld	hl, 6
	push	hl
	call	_gfx_Rectangle
	ld	bc, (ix - 70)
	ld	iy, (ix - 61)
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	.local	.LBB144_30
.LBB144_30:                             ;   in Loop: Header=BB144_27 Depth=3
	ld	de, (iy)
	push	bc
	pop	hl
	ld	(ix - 70), hl
	ld	bc, 41
	add	hl, bc
	push	hl
	ld	hl, 14
	push	hl
	push	de
	call	_Text
	ld	iy, (ix - 61)
	pop	hl
	pop	hl
	pop	hl
	ld	de, 24
	ld	hl, (ix - 70)
	add	hl, de
	lea	iy, iy + 3
	jr	.LBB144_27
	.local	.LBB144_31
.LBB144_31:                             ;   in Loop: Header=BB144_26 Depth=2
	ld	hl, (ix - 64)
	ld	bc, 3
	call	__imulu
	ex	de, hl
	ld	hl, ___const.StartGame.descriptions
	add	hl, de
	ld	hl, (hl)
	ld	de, 5
	push	de
	ld	de, 304
	push	de
	ld	de, 122
	push	de
	ld	de, 8
	push	de
	push	hl
	call	_WrapText
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 209
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, _.str.53.718
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 225
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, _.str.54.719
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	call	_gfx_SwapDraw
	call	_WaitKey
	ld	l, a
	cp	a, 3
	jr	nz, .LBB144_33
; %bb.32:                               ;   in Loop: Header=BB144_26 Depth=2
	ld	e, 2
	ld	a, (ix - 58)
	add	a, e
	ld	e, a
	jr	.LBB144_35
	.local	.LBB144_33
.LBB144_33:                             ;   in Loop: Header=BB144_26 Depth=2
	ld	a, l
	cp	a, 4
	ld	e, (ix - 58)                    ; 1-byte Folded Reload
	jr	nz, .LBB144_37
; %bb.34:                               ;   in Loop: Header=BB144_26 Depth=2
	inc	e
	.local	.LBB144_35
.LBB144_35:                             ;   in Loop: Header=BB144_26 Depth=2
	ld	a, e
	ld	c, 3
	call	__bremu
	ld	e, a
	.local	.LBB144_36
.LBB144_36:                             ;   in Loop: Header=BB144_26 Depth=2
	ld	(ix - 58), e
	ld	a, l
	cp	a, 5
	jp	nz, .LBB144_26
	jr	.LBB144_41
	.local	.LBB144_37
.LBB144_37:                             ;   in Loop: Header=BB144_26 Depth=2
	ld	a, l
	cp	a, 6
	jp	z, .LBB144_109
	jr	.LBB144_36
	.local	.LBB144_38
.LBB144_38:                             ;   in Loop: Header=BB144_6 Depth=1
	ld	de, 0
	ld	e, l
	ld	hl, (ix - 70)
	or	a, a
	sbc	hl, de
	jp	nz, .LBB144_83
; %bb.39:                               ;   in Loop: Header=BB144_6 Depth=1
	ld	hl, 2
	push	hl
	call	_SaveExit
	pop	hl
	cp	a, 2
	ld	l, -1
	jp	z, .LBB144_85
; %bb.40:                               ;   in Loop: Header=BB144_6 Depth=1
	ld	l, 0
	jp	.LBB144_85
	.local	.LBB144_41
.LBB144_41:                             ;   in Loop: Header=BB144_6 Depth=1
	call	_ResetGameState
	ld	a, (ix - 58)                    ; 1-byte Folded Reload
	ld	(_disease+32), a
	call	_RefreshEffects
	xor	a, a
	ld	(_disease+37), a
	ld	hl, _disease+37
	push	hl
	pop	iy
	inc	iy
	lea	de, iy + 0
	ld	bc, 19
	ldir
	ld	d, a
	ld	(ix - 61), a                    ; 1-byte Folded Spill
	.local	.LBB144_42
.LBB144_42:                             ;   Parent Loop BB144_6 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB144_43 Depth 3
                                        ;         Child Loop BB144_44 Depth 4
	or	a, a
	sbc	hl, hl
	ld	l, d
	ld	(ix - 84), hl
	ld	(ix - 88), d
	.local	.LBB144_43
.LBB144_43:                             ;   Parent Loop BB144_6 Depth=1
                                        ;     Parent Loop BB144_42 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB144_44 Depth 4
	ld	hl, _.str.57.720
	push	hl
	call	_BeginScreen
	pop	hl
	ld	hl, 35
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, _disease+37
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	or	a, a
	sbc	hl, hl
	ld	l, (ix - 61)                    ; 1-byte Folded Reload
	ld	(ix - 70), hl
	xor	a, a
	sbc	hl, hl
	push	hl
	pop	iy
	.local	.LBB144_44
.LBB144_44:                             ;   Parent Loop BB144_6 Depth=1
                                        ;     Parent Loop BB144_42 Depth=2
                                        ;       Parent Loop BB144_43 Depth=3
                                        ; =>      This Inner Loop Header: Depth=4
	ld	(ix - 58), hl
	ld	bc, 10
	call	__idivu
	ld	bc, 300
	call	__imulu
	ld	bc, (ix - 58)
	ex	de, hl
	ld	(ix - 67), iy
	lea	hl, iy + 0
	or	a, a
	sbc	hl, de
	ld	(ix - 64), hl
	push	bc
	pop	hl
	ld	de, 38
	or	a, a
	sbc	hl, de
	jp	z, .LBB144_48
; %bb.45:                               ;   in Loop: Header=BB144_44 Depth=4
	ld	hl, _NameDisease.alphabet
	add	hl, bc
	ld	b, a
	ld	a, (hl)
	ld	(ix - 42), a
	ld	(ix - 41), 0
	ld	(ix - 73), b                    ; 1-byte Folded Spill
	ld	c, 10
	call	__bdivu
	ld	l, (ix - 75)
	ld	h, (ix - 74)
	ld	h, a
	ld	iy, (ix - 64)
	ld	de, 15
	add	iy, de
	ld	(ix - 81), iy
	ld	(ix - 75), l
	ld	(ix - 74), h
	mlt	hl
	ld	de, 0
	ld	e, l
	ld	(ix - 87), de
	push	de
	pop	iy
	ld	de, 70
	add	iy, de
	ld	hl, (ix - 70)
	ld	de, (ix - 58)
	or	a, a
	sbc	hl, de
	jr	nz, .LBB144_47
; %bb.46:                               ;   in Loop: Header=BB144_44 Depth=4
	ld	hl, 224
	push	hl
	ld	(ix - 91), iy
	call	_gfx_SetColor
	pop	hl
	ld	de, 11
	ld	hl, (ix - 64)
	add	hl, de
	push	hl
	pop	bc
	ld	de, 66
	ld	iy, (ix - 87)
	add	iy, de
	ld	hl, 18
	push	hl
	inc	hl
	push	hl
	push	iy
	push	bc
	call	_gfx_Rectangle
	ld	iy, (ix - 91)
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	.local	.LBB144_47
.LBB144_47:                             ;   in Loop: Header=BB144_44 Depth=4
	push	iy
	ld	hl, (ix - 81)
	push	hl
	pea	ix - 42
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (ix - 58)
	inc	hl
	ld	de, 30
	ld	iy, (ix - 67)
	add	iy, de
	ld	a, (ix - 73)                    ; 1-byte Folded Reload
	inc	a
	jp	.LBB144_44
	.local	.LBB144_48
.LBB144_48:                             ;   in Loop: Header=BB144_43 Depth=3
	ld	a, (ix - 61)                    ; 1-byte Folded Reload
	cp	a, 38
	ld	hl, -1
	jr	z, .LBB144_50
; %bb.49:                               ;   in Loop: Header=BB144_43 Depth=3
	ld	hl, 0
	.local	.LBB144_50
.LBB144_50:                             ;   in Loop: Header=BB144_43 Depth=3
	push	hl
	ld	hl, 181
	push	hl
	ld	hl, _.str.58.721
	push	hl
	call	_MenuItem
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (ix - 84)
	push	hl
	ld	hl, _.str.59.722
	push	hl
	ld	hl, 40
	push	hl
	ld	hl, (ix - 78)
	push	hl
	call	_snprintf
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 199
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, (ix - 78)
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 215
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, _.str.60.723
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 229
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, _.str.54.719
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	call	_gfx_SwapDraw
	call	_WaitKey
	ld	l, a
	cp	a, 6
	jp	z, .LBB144_108
; %bb.51:                               ;   in Loop: Header=BB144_43 Depth=3
	ld	a, (ix - 61)                    ; 1-byte Folded Reload
	cp	a, 38
                                        ; kill: def $a killed $a
	sbc	a, a
	ld	e, a
	ld	a, l
	cp	a, 1
	ld	h, -1
	jr	z, .LBB144_53
; %bb.52:                               ;   in Loop: Header=BB144_43 Depth=3
	ld	h, 0
	.local	.LBB144_53
.LBB144_53:                             ;   in Loop: Header=BB144_43 Depth=3
	ld	a, (ix - 61)                    ; 1-byte Folded Reload
	or	a, a
	ld	c, 37
	ld	iy, _disease+37
	jr	z, .LBB144_55
; %bb.54:                               ;   in Loop: Header=BB144_43 Depth=3
	ld	c, (ix - 61)                    ; 1-byte Folded Reload
	dec	c
	.local	.LBB144_55
.LBB144_55:                             ;   in Loop: Header=BB144_43 Depth=3
	ld	a, h
	and	a, e
	ld	e, a
	bit	0, e
	jr	nz, .LBB144_57
; %bb.56:                               ;   in Loop: Header=BB144_43 Depth=3
	ld	c, (ix - 61)                    ; 1-byte Folded Reload
	.local	.LBB144_57
.LBB144_57:                             ;   in Loop: Header=BB144_43 Depth=3
	ld	a, l
	cp	a, 2
	ld	h, -1
	jr	z, .LBB144_59
; %bb.58:                               ;   in Loop: Header=BB144_43 Depth=3
	ld	h, 0
	.local	.LBB144_59
.LBB144_59:                             ;   in Loop: Header=BB144_43 Depth=3
	ld	a, c
	cp	a, 38
                                        ; kill: def $a killed $a
	sbc	a, a
	ld	d, a
	ld	a, c
	inc	a
	cp	a, 38
	ld	e, 0
	jr	z, .LBB144_61
; %bb.60:                               ;   in Loop: Header=BB144_43 Depth=3
	ld	e, a
	.local	.LBB144_61
.LBB144_61:                             ;   in Loop: Header=BB144_43 Depth=3
	ld	a, h
	and	a, d
	ld	h, a
	bit	0, h
	jr	nz, .LBB144_63
; %bb.62:                               ;   in Loop: Header=BB144_43 Depth=3
	ld	e, c
	.local	.LBB144_63
.LBB144_63:                             ;   in Loop: Header=BB144_43 Depth=3
	ld	a, l
	cp	a, 3
	ld	d, (ix - 88)                    ; 1-byte Folded Reload
	jr	nz, .LBB144_69
; %bb.64:                               ;   in Loop: Header=BB144_43 Depth=3
	ld	a, e
	cp	a, 10
	jr	nc, .LBB144_66
; %bb.65:                               ;   in Loop: Header=BB144_43 Depth=3
	ld	c, e
	jr	.LBB144_67
	.local	.LBB144_66
.LBB144_66:                             ;   in Loop: Header=BB144_43 Depth=3
	ld	c, -10
	ld	a, e
	add	a, c
	ld	c, a
	.local	.LBB144_67
.LBB144_67:                             ;   in Loop: Header=BB144_43 Depth=3
	ld	a, e
	cp	a, 38
	ld	e, 30
	jr	z, .LBB144_69
; %bb.68:                               ;   in Loop: Header=BB144_43 Depth=3
	ld	e, c
	.local	.LBB144_69
.LBB144_69:                             ;   in Loop: Header=BB144_43 Depth=3
	ld	a, e
	cp	a, 28
	ld	c, e
	jp	c, .LBB144_71
; %bb.70:                               ;   in Loop: Header=BB144_43 Depth=3
	ld	c, (ix - 75)
	ld	b, (ix - 74)
                                        ; kill: def $c killed $c killed $bc
	.local	.LBB144_71
.LBB144_71:                             ;   in Loop: Header=BB144_43 Depth=3
	ld	a, l
	cp	a, 4
	jr	z, .LBB144_73
; %bb.72:                               ;   in Loop: Header=BB144_43 Depth=3
	ld	(ix - 61), e                    ; 1-byte Folded Spill
	jr	.LBB144_74
	.local	.LBB144_73
.LBB144_73:                             ;   in Loop: Header=BB144_43 Depth=3
	ld	h, 10
	ld	a, c
	add	a, h
	ld	c, a
	ld	(ix - 61), c
	.local	.LBB144_74
.LBB144_74:                             ;   in Loop: Header=BB144_43 Depth=3
	ld	bc, 0
	ld	a, l
	cp	a, 5
	jr	nz, .LBB144_76
; %bb.75:                               ;   in Loop: Header=BB144_43 Depth=3
	ld	a, (ix - 61)                    ; 1-byte Folded Reload
	cp	a, 38
	jr	z, .LBB144_89
	.local	.LBB144_76
.LBB144_76:                             ;   in Loop: Header=BB144_43 Depth=3
	ld	a, d
	cp	a, 19
	jr	nc, .LBB144_78
; %bb.77:                               ;   in Loop: Header=BB144_43 Depth=3
	ld	a, l
	cp	a, 5
	jr	z, .LBB144_81
	.local	.LBB144_78
.LBB144_78:                             ;   in Loop: Header=BB144_43 Depth=3
	ld	a, d
	or	a, a
	jp	z, .LBB144_43
; %bb.79:                               ;   in Loop: Header=BB144_43 Depth=3
	ld	a, l
	cp	a, 10
	jp	nz, .LBB144_43
; %bb.80:                               ;   in Loop: Header=BB144_42 Depth=2
	dec	d
	jr	.LBB144_82
	.local	.LBB144_81
.LBB144_81:                             ;   in Loop: Header=BB144_42 Depth=2
	ld	bc, 0
	ld	c, e
	ld	hl, _NameDisease.alphabet
	add	hl, bc
	ld	a, (hl)
	inc	d
	lea	hl, iy + 0
	ld	bc, (ix - 84)
	add	hl, bc
	ld	bc, 0
	ld	(hl), a
	.local	.LBB144_82
.LBB144_82:                             ;   in Loop: Header=BB144_42 Depth=2
	ld	c, d
	lea	hl, iy + 0
	add	hl, bc
	ld	(hl), 0
	jp	.LBB144_42
	.local	.LBB144_83
.LBB144_83:                             ;   in Loop: Header=BB144_6 Depth=1
	ld	a, (_disease+34)
	or	a, a
	jr	nz, .LBB144_88
	.local	.LBB144_84
.LBB144_84:                             ;   in Loop: Header=BB144_6 Depth=1
	call	_Play
	ld	l, a
	.local	.LBB144_85
.LBB144_85:                             ;   in Loop: Header=BB144_6 Depth=1
	ld	a, (_disease+33)
	or	a, a
	ld	a, 1
	jr	nz, .LBB144_87
; %bb.86:                               ;   in Loop: Header=BB144_6 Depth=1
	ld	a, 0
	.local	.LBB144_87
.LBB144_87:                             ;   in Loop: Header=BB144_6 Depth=1
	ld	(ix - 43), a
	bit	0, l
	jp	z, .LBB144_6
	jp	.LBB144_117
	.local	.LBB144_88
.LBB144_88:                             ;   in Loop: Header=BB144_6 Depth=1
	call	_ResultScreen
	jp	.LBB144_109
	.local	.LBB144_89
.LBB144_89:                             ;   in Loop: Header=BB144_6 Depth=1
	ld	a, d
	or	a, a
	jr	nz, .LBB144_91
; %bb.90:                               ;   in Loop: Header=BB144_6 Depth=1
	lea	de, iy + 0
	ld	hl, _.str.61.724
	ld	bc, 9
	ldir
	.local	.LBB144_91
.LBB144_91:                             ;   in Loop: Header=BB144_6 Depth=1
	ld	a, 80
	ld	(_session+6), a
	ld	l, 60
	.local	.LBB144_92
.LBB144_92:                             ;   Parent Loop BB144_6 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB144_93 Depth 3
	ld	a, l
	ld	(_session+7), a
	.local	.LBB144_93
.LBB144_93:                             ;   Parent Loop BB144_6 Depth=1
                                        ;     Parent Loop BB144_92 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	call	_DrawMap
	or	a, a
	sbc	hl, hl
	push	hl
	call	_gfx_SetColor
	pop	hl
	ld	hl, 32
	push	hl
	ld	hl, 320
	push	hl
	or	a, a
	sbc	hl, hl
	push	hl
	push	hl
	call	_gfx_FillRectangle
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 25
	push	hl
	ld	hl, 320
	push	hl
	ld	hl, 215
	push	hl
	or	a, a
	sbc	hl, hl
	push	hl
	call	_gfx_FillRectangle
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 5
	push	hl
	dec	hl
	push	hl
	ld	hl, _.str.55.725
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 219
	push	hl
	ld	hl, 4
	push	hl
	ld	hl, _.str.56.726
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 224
	push	hl
	call	_gfx_SetColor
	pop	hl
	ld	a, (_session+6)
	or	a, a
	sbc	hl, hl
	push	hl
	pop	iy
	ld	iyl, a
	add	iy, iy
	ld	a, (_session+7)
	ld	l, a
	add	hl, hl
	ld	de, 4
	push	de
	push	hl
	push	iy
	call	_gfx_Circle
	pop	hl
	pop	hl
	pop	hl
	call	_gfx_SwapDraw
	call	_WaitKey
	ld	l, a
	cp	a, 6
	jr	z, .LBB144_108
; %bb.94:                               ;   in Loop: Header=BB144_93 Depth=3
	ld	a, (_session+6)
	ld	e, a
	ld	a, l
	cp	a, 1
	jr	nz, .LBB144_96
; %bb.95:                               ;   in Loop: Header=BB144_93 Depth=3
	ld	a, e
	or	a, a
	ld	a, -1
	jr	nz, .LBB144_98
	.local	.LBB144_96
.LBB144_96:                             ;   in Loop: Header=BB144_93 Depth=3
	ld	a, l
	cp	a, 2
	jr	nz, .LBB144_99
; %bb.97:                               ;   in Loop: Header=BB144_93 Depth=3
	ld	a, e
	cp	a, -97
	ld	a, 1
	jr	nc, .LBB144_99
	.local	.LBB144_98
.LBB144_98:                             ;   in Loop: Header=BB144_93 Depth=3
	add	a, e
	ld	e, a
	ld	(_session+6), a
	.local	.LBB144_99
.LBB144_99:                             ;   in Loop: Header=BB144_93 Depth=3
	ld	a, (_session+7)
	ld	c, a
	ld	a, l
	cp	a, 3
	jr	nz, .LBB144_101
; %bb.100:                              ;   in Loop: Header=BB144_93 Depth=3
	ld	a, c
	or	a, a
	jr	nz, .LBB144_105
	.local	.LBB144_101
.LBB144_101:                            ;   in Loop: Header=BB144_93 Depth=3
	ld	a, l
	cp	a, 4
	jr	nz, .LBB144_103
; %bb.102:                              ;   in Loop: Header=BB144_93 Depth=3
	ld	a, c
	cp	a, 119
	jr	c, .LBB144_106
	.local	.LBB144_103
.LBB144_103:                            ;   in Loop: Header=BB144_93 Depth=3
	ld	a, l
	cp	a, 5
	jp	nz, .LBB144_93
; %bb.104:                              ;   in Loop: Header=BB144_93 Depth=3
	or	a, a
	sbc	hl, hl
	ld	l, e
	ld	de, 0
	ld	e, c
	push	de
	push	hl
	ld	hl, _disease
	push	hl
	ld	hl, _region
	push	hl
	call	_InfectCoordinate
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	bit	0, a
	jp	z, .LBB144_93
	jr	.LBB144_111
	.local	.LBB144_105
.LBB144_105:                            ;   in Loop: Header=BB144_92 Depth=2
	ld	a, -1
	jr	.LBB144_107
	.local	.LBB144_106
.LBB144_106:                            ;   in Loop: Header=BB144_92 Depth=2
	ld	a, 1
	.local	.LBB144_107
.LBB144_107:                            ;   in Loop: Header=BB144_92 Depth=2
	add	a, c
	ld	l, a
	jp	.LBB144_92
	.local	.LBB144_108
.LBB144_108:                            ;   in Loop: Header=BB144_6 Depth=1
	call	_ResetGameState
	.local	.LBB144_109
.LBB144_109:                            ; %.loopexit
                                        ;   in Loop: Header=BB144_6 Depth=1
	ld	a, (_disease+33)
	or	a, a
	ld	a, 1
	jp	nz, .LBB144_21
; %bb.110:                              ; %.loopexit
                                        ;   in Loop: Header=BB144_6 Depth=1
	ld	a, 0
	jp	.LBB144_21
	.local	.LBB144_111
.LBB144_111:                            ;   in Loop: Header=BB144_6 Depth=1
	ld	a, (_disease+30)
	ld	iyh, a
	ld	iyl, 0
	ld	bc, 0
	.local	.LBB144_112
.LBB144_112:                            ;   Parent Loop BB144_6 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	push	bc
	pop	hl
	ld	de, 7
	or	a, a
	sbc	hl, de
	jr	z, .LBB144_116
; %bb.113:                              ;   in Loop: Header=BB144_112 Depth=2
	ld	hl, 1
	call	__ishl
	ld	e, iyh
	ld	a, l
	and	a, e
	ld	l, a
	or	a, a
	jr	z, .LBB144_115
; %bb.114:                              ;   in Loop: Header=BB144_112 Depth=2
	ld	a, iyl
	ld	(_session+4), a
	.local	.LBB144_115
.LBB144_115:                            ;   in Loop: Header=BB144_112 Depth=2
	inc	bc
	inc	iyl
	jr	.LBB144_112
	.local	.LBB144_116
.LBB144_116:                            ;   in Loop: Header=BB144_6 Depth=1
	ld	a, 1
	ld	(_disease+33), a
	call	_ReleaseKeys
	or	a, a
	sbc	hl, hl
	ld	(-917504), hl
	xor	a, a
	ld	(-917501), a
	jp	.LBB144_84
	.local	.LBB144_117
.LBB144_117:
	call	_gfx_End
	or	a, a
	sbc	hl, hl
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end144
.Lfunc_end144:
	.size	_contagion_game_main, .Lfunc_end144-_contagion_game_main
                                        ; -- End function
	.section	.text._InitializeMap,"ax",@progbits
	.type	_InitializeMap,@function        ; -- Begin function InitializeMap
_InitializeMap:                         ; @InitializeMap
; %bb.0:
	ld	hl, -12
	call	__frameset
	ld	iy, _region+9
	ld	hl, _map_sprites
	ld	(ix - 9), hl
	ld	hl, _InitializeMap.names
	ld	(ix - 12), hl
	or	a, a
	sbc	hl, hl
	ld	(ix - 3), hl
	ld	bc, 7
	.local	.LBB145_1
.LBB145_1:                              ; =>This Inner Loop Header: Depth=1
	ld	hl, (ix - 3)
	push	bc
	pop	de
	or	a, a
	sbc	hl, bc
	jr	z, .LBB145_3
; %bb.2:                                ;   in Loop: Header=BB145_1 Depth=1
	ld	hl, (ix - 12)
	ld	hl, (hl)
	ld	(iy - 9), hl
	ld	hl, _InitializeMap.x
	ld	bc, (ix - 3)
	add	hl, bc
	ld	a, (hl)
	ld	(iy - 1), a
	ld	hl, _InitializeMap.y
	add	hl, bc
	ld	a, (hl)
	ld	(iy), a
	ld	(ix - 6), iy
	ld	hl, (ix - 9)
	ld	hl, (hl)
	ld	a, (hl)
	ld	iy, (ix - 6)
	ld	(iy - 3), a
	push	hl
	pop	iy
	ld	a, (iy + 1)
	ld	iy, (ix - 6)
	ld	(iy - 2), a
	push	hl
	pop	iy
	lea	hl, iy + 2
	ld	iy, (ix - 6)
	ld	(iy - 6), hl
	lea	hl, iy + 0
	inc	bc
	ld	(ix - 3), bc
	ld	iy, (ix - 12)
	lea	iy, iy + 3
	ld	(ix - 12), iy
	ld	iy, (ix - 9)
	lea	iy, iy + 3
	ld	(ix - 9), iy
	push	hl
	pop	iy
	lea	iy, iy + 16
	push	de
	pop	bc
	jr	.LBB145_1
	.local	.LBB145_3
.LBB145_3:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end145
.Lfunc_end145:
	.size	_InitializeMap, .Lfunc_end145-_InitializeMap
                                        ; -- End function
	.section	.text._DrawMap,"ax",@progbits
	.type	_DrawMap,@function              ; -- Begin function DrawMap
_DrawMap:                               ; @DrawMap
; %bb.0:
	ld	hl, -6
	call	__frameset
	ld	hl, _region+9
	ld	(ix - 3), hl
	ld	hl, 18
	push	hl
	call	_gfx_FillScreen
	ld	de, 0
	pop	hl
	ld	bc, 21
	.local	.LBB146_1
.LBB146_1:                              ; =>This Inner Loop Header: Depth=1
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	jr	z, .LBB146_3
; %bb.2:                                ;   in Loop: Header=BB146_1 Depth=1
	ld	hl, _map_sprites
	add	hl, de
	ld	(ix - 6), de
	ld	de, (hl)
	ld	iy, (ix - 3)
	ld	(ix - 3), iy
	ld	a, (iy - 1)
	or	a, a
	sbc	hl, hl
	ld	l, a
	add	hl, hl
	ld	a, (iy)
	add	a, a
	ld	bc, 2
	push	bc
	push	bc
	ld	c, a
	push	bc
	push	hl
	push	de
	call	_gfx_ScaledTransparentSprite_NoClip
	ld	bc, 21
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (ix - 6)
	ld	de, 3
	add	hl, de
	ld	iy, (ix - 3)
	lea	iy, iy + 16
	ld	(ix - 3), iy
	ex	de, hl
	jr	.LBB146_1
	.local	.LBB146_3
.LBB146_3:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end146
.Lfunc_end146:
	.size	_DrawMap, .Lfunc_end146-_DrawMap
                                        ; -- End function
	.section	.text._Play,"ax",@progbits
	.type	_Play,@function                 ; -- Begin function Play
_Play:                                  ; @Play
; %bb.0:
	ld	hl, -114
	call	__frameset
	lea	hl, ix - 81
	ld	(ix - 90), hl
	call	_ReleaseKeys
	or	a, a
	sbc	hl, hl
	ld	(-917504), hl
	xor	a, a
	ld	(ix - 94), a                    ; 1-byte Folded Spill
	ld	(-917501), a
	ld	iy, -917504
	lea	hl, iy + 3
	ld	(ix - 97), hl
	.local	.LBB147_1
.LBB147_1:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB147_13 Depth 2
                                        ;     Child Loop BB147_16 Depth 2
                                        ;     Child Loop BB147_21 Depth 2
                                        ;     Child Loop BB147_39 Depth 2
	ld	a, (_disease+34)
	or	a, a
	jp	nz, .LBB147_60
; %bb.2:                                ;   in Loop: Header=BB147_1 Depth=1
	call	_ReadKey
	ld	e, a
	or	a, a
	jr	nz, .LBB147_6
	.local	.LBB147_3
.LBB147_3:                              ;   in Loop: Header=BB147_1 Depth=1
	ld	a, e
	or	a, a
	ld	a, 1
	jr	z, .LBB147_5
; %bb.4:                                ;   in Loop: Header=BB147_1 Depth=1
	ld	a, 0
	.local	.LBB147_5
.LBB147_5:                              ;   in Loop: Header=BB147_1 Depth=1
	ld	(_canpress), a
	jr	.LBB147_9
	.local	.LBB147_6
.LBB147_6:                              ;   in Loop: Header=BB147_1 Depth=1
	ld	a, (_canpress)
	bit	0, a
	jr	z, .LBB147_9
; %bb.7:                                ;   in Loop: Header=BB147_1 Depth=1
	ld	l, -5
	ld	a, e
	add	a, l
	ld	l, a
	cp	a, 2
	ld	(ix - 93), e
	jp	nc, .LBB147_59
; %bb.8:                                ;   in Loop: Header=BB147_1 Depth=1
	call	_ActionsMenu
	ld	e, (ix - 93)                    ; 1-byte Folded Reload
	ld	l, a
	or	a, a
	jp	nz, .LBB147_62
	jr	.LBB147_3
	.local	.LBB147_9
.LBB147_9:                              ;   in Loop: Header=BB147_1 Depth=1
	ld	hl, _GameRandom
	push	hl
	ld	hl, _effects
	push	hl
	ld	hl, _session+5
	push	hl
	ld	hl, _region
	push	hl
	call	_StepWorldRegion
	ld	(ix - 93), a                    ; 1-byte Folded Spill
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, _event_modifiers
	push	hl
	ld	hl, _destination_port
	push	hl
	ld	hl, _source_port
	push	hl
	ld	hl, _GameRandom
	push	hl
	ld	hl, _effects
	push	hl
	ld	hl, _disease
	push	hl
	ld	hl, _port
	push	hl
	ld	hl, _region
	push	hl
	call	_TransportEvents
	ld	hl, 24
	add	hl, sp
	ld	sp, hl
	ld	l, 1
	and	a, l
	ld	l, a
	ld	(_connection), a
	bit	0, (ix - 93)                    ; 1-byte Folded Reload
	jp	z, .LBB147_32
; %bb.10:                               ;   in Loop: Header=BB147_1 Depth=1
	ld	hl, _event_modifiers
	push	hl
	ld	hl, _GameRandom
	push	hl
	ld	hl, _effects
	push	hl
	ld	hl, _disease
	push	hl
	ld	hl, _region
	push	hl
	call	_MigrateEvents
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, _GameRandom
	push	hl
	ld	hl, _disease
	push	hl
	call	_Mutate
	ld	e, a
	pop	hl
	pop	hl
	cp	a, -1
	jr	z, .LBB147_12
; %bb.11:                               ;   in Loop: Header=BB147_1 Depth=1
	ld	(ix - 93), de
	call	_RefreshEffects
	or	a, a
	sbc	hl, hl
	push	hl
	ld	hl, (ix - 93)
	push	hl
	ld	hl, 5
	push	hl
	call	_TickerPost
	pop	hl
	pop	hl
	pop	hl
	.local	.LBB147_12
.LBB147_12:                             ; %.preheader24
                                        ;   in Loop: Header=BB147_1 Depth=1
	ld	iy, _region+10
	or	a, a
	sbc	hl, hl
	.local	.LBB147_13
.LBB147_13:                             ;   Parent Loop BB147_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	push	hl
	pop	bc
	ld	de, 42
	or	a, a
	sbc	hl, de
	jr	z, .LBB147_15
; %bb.14:                               ;   in Loop: Header=BB147_13 Depth=2
	ld	hl, (ix - 90)
	add	hl, bc
	ex	de, hl
	lea	hl, iy + 0
	ld	(ix - 93), bc
	ld	bc, 6
	ldir
	ld	hl, (ix - 93)
	ld	de, 6
	add	hl, de
	lea	iy, iy + 16
	jr	.LBB147_13
	.local	.LBB147_15
.LBB147_15:                             ;   in Loop: Header=BB147_1 Depth=1
	ld	hl, _event_modifiers+42
	ld	bc, (hl)
	ld	hl, _event_modifiers+44
	ld	de, (hl)
	push	de
	push	bc
	ld	hl, _effects
	push	hl
	ld	hl, (ix - 90)
	push	hl
	ld	hl, _disease
	push	hl
	call	_AdvanceDiseaseEvents
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	l, 1
	ld	(ix - 93), a                    ; 1-byte Folded Spill
	and	a, l
	ld	l, a
	bit	0, l
	ld	hl, 0
	push	hl
	push	hl
	push	hl
	call	nz, _TickerPost
	pop	hl
	pop	hl
	pop	hl
	bit	1, (ix - 93)                    ; 1-byte Folded Reload
	ld	hl, 0
	push	hl
	push	hl
	inc	hl
	push	hl
	call	nz, _TickerPost
	pop	hl
	pop	hl
	pop	hl
	bit	2, (ix - 93)                    ; 1-byte Folded Reload
	ld	hl, 0
	push	hl
	push	hl
	ld	hl, 2
	push	hl
	call	nz, _TickerPost
	pop	hl
	pop	hl
	pop	hl
	bit	3, (ix - 93)                    ; 1-byte Folded Reload
	ld	hl, 25
	push	hl
	ld	hl, 0
	push	hl
	ld	hl, 3
	push	hl
	call	nz, _TickerPost
	pop	hl
	pop	hl
	pop	hl
	bit	4, (ix - 93)                    ; 1-byte Folded Reload
	ld	hl, 50
	push	hl
	ld	hl, 0
	push	hl
	ld	hl, 3
	push	hl
	call	nz, _TickerPost
	pop	hl
	pop	hl
	pop	hl
	bit	5, (ix - 93)                    ; 1-byte Folded Reload
	ld	hl, 75
	push	hl
	ld	hl, 0
	push	hl
	ld	hl, 3
	push	hl
	call	nz, _TickerPost
	pop	hl
	pop	hl
	pop	hl
	bit	6, (ix - 93)                    ; 1-byte Folded Reload
	ld	hl, 90
	push	hl
	ld	hl, 0
	push	hl
	ld	hl, 3
	push	hl
	call	nz, _TickerPost
	pop	hl
	pop	hl
	pop	hl
	ld	de, 0
	xor	a, a
	ld	(ix - 93), a                    ; 1-byte Folded Spill
	.local	.LBB147_16
.LBB147_16:                             ;   Parent Loop BB147_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	push	de
	pop	hl
	ld	bc, 132
	or	a, a
	sbc	hl, bc
	jp	z, .LBB147_20
; %bb.17:                               ;   in Loop: Header=BB147_16 Depth=2
	ld	iy, _port
	add	iy, de
	bit	0, (iy + 5)
	jp	z, .LBB147_19
; %bb.18:                               ;   in Loop: Header=BB147_16 Depth=2
	ld	hl, 1
	ld	c, (iy + 2)
	call	__ishl
                                        ; kill: def $l killed $l killed $uhl
	ld	c, (ix - 93)
	ld	a, c
	or	a, l
	ld	c, a
	ld	(ix - 93), c
	.local	.LBB147_19
.LBB147_19:                             ;   in Loop: Header=BB147_16 Depth=2
	ex	de, hl
	ld	de, 6
	add	hl, de
	ex	de, hl
	jp	.LBB147_16
	.local	.LBB147_20
.LBB147_20:                             ;   in Loop: Header=BB147_1 Depth=1
	ld	hl, _GameRandom
	push	hl
	ld	hl, _effects
	push	hl
	ld	hl, _disease
	push	hl
	ld	hl, _port
	push	hl
	ld	hl, _region
	push	hl
	call	_ClosePorts
	ld	l, a
	pop	de
	pop	de
	pop	de
	pop	de
	pop	de
	ld	e, -1
	ld	a, (ix - 93)
	xor	a, e
	ld	e, a
	ld	a, l
	and	a, e
	ld	l, a
	ld	(ix - 100), l
	xor	a, a
	ld	iyh, a
	ld	bc, 0
	ld	iyl, a
	ld	l, a
	.local	.LBB147_21
.LBB147_21:                             ;   Parent Loop BB147_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ld	(ix - 93), hl
	push	bc
	pop	hl
	ld	de, 7
	or	a, a
	sbc	hl, de
	jp	z, .LBB147_27
; %bb.22:                               ;   in Loop: Header=BB147_21 Depth=2
	ld	hl, 1
	call	__ishl
	ld	e, (ix - 100)
	ld	a, l
	and	a, e
	ld	l, a
	or	a, a
	ld	l, -1
	jr	nz, .LBB147_24
; %bb.23:                               ;   in Loop: Header=BB147_21 Depth=2
	ld	l, 0
	.local	.LBB147_24
.LBB147_24:                             ;   in Loop: Header=BB147_21 Depth=2
	ld	a, l
	and	a, 1
	ld	h, a
	bit	0, l
	ex	de, hl
	ld	e, iyh
	ex	de, hl
	jr	nz, .LBB147_26
; %bb.25:                               ;   in Loop: Header=BB147_21 Depth=2
	ld	de, (ix - 93)
	ld	l, e
	.local	.LBB147_26
.LBB147_26:                             ;   in Loop: Header=BB147_21 Depth=2
	ld	a, iyl
	add	a, h
	ld	iyl, a
	inc	bc
	inc	iyh
                                        ; kill: def $l killed $l def $uhl
	jp	.LBB147_21
	.local	.LBB147_27
.LBB147_27:                             ;   in Loop: Header=BB147_1 Depth=1
	ld	a, iyl
	or	a, a
	jr	z, .LBB147_29
; %bb.28:                               ;   in Loop: Header=BB147_1 Depth=1
	or	a, a
	sbc	hl, hl
	ex	de, hl
	ld	e, iyl
	ex	de, hl
	push	hl
	ld	hl, (ix - 93)
	push	hl
	ld	hl, 4
	push	hl
	call	_TickerPost
	pop	hl
	pop	hl
	pop	hl
	.local	.LBB147_29
.LBB147_29:                             ;   in Loop: Header=BB147_1 Depth=1
	ld	a, (_disease+34)
	or	a, a
	jr	nz, .LBB147_31
; %bb.30:                               ;   in Loop: Header=BB147_1 Depth=1
	ld	hl, _EventNotice
	push	hl
	ld	hl, (ix - 90)
	push	hl
	ld	hl, _disease
	push	hl
	ld	hl, _world_events
	push	hl
	call	_EventsAdvance
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	call	_RefreshEffects
	.local	.LBB147_31
.LBB147_31:                             ;   in Loop: Header=BB147_1 Depth=1
	ld	hl, (ix - 90)
	push	hl
	ld	hl, _disease
	push	hl
	call	_TickerObserve
	pop	hl
	pop	hl
	.local	.LBB147_32
.LBB147_32:                             ;   in Loop: Header=BB147_1 Depth=1
	call	_DrawMap
	ld	a, (_session+8)
	or	a, a
	jp	nz, .LBB147_36
; %bb.33:                               ;   in Loop: Header=BB147_1 Depth=1
	ld	hl, 224
	push	hl
	call	_gfx_SetColor
	pop	hl
	ld	a, (_session+4)
	or	a, a
	sbc	hl, hl
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de, hl
	ld	hl, _region
	add	hl, de
	push	hl
	pop	bc
	push	bc
	pop	iy
	ld	a, (iy + 8)
	or	a, a
	sbc	hl, hl
	ld	l, a
	add	hl, hl
	ld	(ix - 93), hl
	ld	a, (iy + 9)
	or	a, a
	sbc	hl, hl
	push	hl
	pop	de
	ld	l, a
	add	hl, hl
	ld	(ix - 100), hl
	ld	a, (iy + 6)
	push	de
	pop	iy
	ex	de, hl
	ld	iyl, a
	add	iy, iy
	lea	de, iy + 0
	push	bc
	pop	iy
	ld	a, (iy + 7)
	ld	l, a
	add	hl, hl
	push	hl
	push	de
	ld	hl, (ix - 100)
	push	hl
	ld	hl, (ix - 93)
	push	hl
	call	_gfx_Rectangle
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	.local	.LBB147_34
.LBB147_34:                             ; %.loopexit
                                        ;   in Loop: Header=BB147_1 Depth=1
	ld	hl, _region
	push	hl
	pea	ix - 87
	call	_CountWorld
	pop	hl
	pop	hl
	ld	de, (ix - 87)
	ld	bc, (ix - 85)
	ld	hl, (ix - 83)
	ld	(ix - 112), hl
                                        ; kill: def $hl killed $hl killed $uhl
	add.sis	hl, bc
	ld	(ix - 114), l
	ld	(ix - 113), h
	add.sis	hl, de
	ld	(ix - 93), l
	ld	(ix - 92), h
	or	a, a
	sbc	hl, hl
	push	hl
	call	_gfx_SetColor
	pop	hl
	ld	hl, 34
	push	hl
	ld	hl, 320
	push	hl
	or	a, a
	sbc	hl, hl
	push	hl
	push	hl
	call	_gfx_FillRectangle
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 36
	push	hl
	ld	hl, 320
	push	hl
	ld	hl, 204
	push	hl
	or	a, a
	sbc	hl, hl
	push	hl
	call	_gfx_FillRectangle
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, _disease+20
	ld	hl, (hl)
	ld	de, 0
	ld	e, l
	ld	d, h
	ld	hl, _disease+22
	ld	hl, (hl)
                                        ; kill: def $hl killed $hl killed $uhl
	ld.sis	bc, 100
	call	__sdivu
	ld	bc, 0
	ld	c, l
	ld	b, h
	ld	iy, (_disease+8)
	ld	a, (_disease+11)
	ld	l, a
	push	hl
	push	iy
	push	bc
	push	de
	ld	hl, _.str.64.727
	push	hl
	ld	hl, 80
	push	hl
	ld	hl, (ix - 90)
	push	hl
	call	_snprintf
	ld	hl, 21
	add	hl, sp
	ld	sp, hl
	ld	hl, 4
	push	hl
	push	hl
	ld	hl, (ix - 90)
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	a, (_ticker+48)
	or	a, a
	jp	nz, .LBB147_49
; %bb.35:                               ;   in Loop: Header=BB147_1 Depth=1
	ld	a, (_disease+35)
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	bc, 3
	call	__imulu
	ex	de, hl
	ld	hl, _responses
	add	hl, de
	ld	hl, (hl)
	ld	de, 20
	push	de
	ld	de, 4
	push	de
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	jp	.LBB147_50
	.local	.LBB147_36
.LBB147_36:                             ;   in Loop: Header=BB147_1 Depth=1
	ld	hl, 7
	push	hl
	call	_gfx_SetColor
	pop	hl
	ld	a, (_connection)
	bit	0, a
	jr	z, .LBB147_38
; %bb.37:                               ;   in Loop: Header=BB147_1 Depth=1
	ld	a, (_source_port)
	ld	de, 0
	push	de
	pop	hl
	push	de
	pop	iy
	ld	l, a
	ld	bc, 6
	call	__imulu
	ex	de, hl
	ld	hl, _port
	add	hl, de
	push	hl
	pop	de
	ld	a, (hl)
	lea	hl, iy + 0
	lea	bc, iy + 0
	ld	l, a
	add	hl, hl
	ld	(ix - 93), hl
	push	de
	pop	iy
	ld	a, (iy + 1)
	push	bc
	pop	hl
	ld	l, a
	add	hl, hl
	ld	(ix - 100), hl
	ld	a, (_destination_port)
	ld	c, a
	push	bc
	pop	hl
	ld	bc, 6
	call	__imulu
	ex	de, hl
	ld	iy, _port
	add	iy, de
	lea	hl, iy + 0
	ld	a, (hl)
	or	a, a
	sbc	hl, hl
	ld	l, a
	add	hl, hl
	push	hl
	pop	bc
	ld	a, (iy + 1)
	or	a, a
	sbc	hl, hl
	ld	l, a
	add	hl, hl
	push	hl
	push	bc
	ld	hl, (ix - 100)
	push	hl
	ld	hl, (ix - 93)
	push	hl
	call	_gfx_Line
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	.local	.LBB147_38
.LBB147_38:                             ; %.preheader
                                        ;   in Loop: Header=BB147_1 Depth=1
	or	a, a
	sbc	hl, hl
	.local	.LBB147_39
.LBB147_39:                             ;   Parent Loop BB147_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	push	hl
	pop	bc
	ld	de, 132
	or	a, a
	sbc	hl, de
	jp	z, .LBB147_34
; %bb.40:                               ;   in Loop: Header=BB147_39 Depth=2
	ld	hl, _port
	push	hl
	pop	iy
	ld	(ix - 100), bc
	add	iy, bc
	ld	(ix - 93), iy
	bit	0, (iy + 5)
	ld	a, 64
	ld	l, a
	jr	nz, .LBB147_42
; %bb.41:                               ;   in Loop: Header=BB147_39 Depth=2
	ld	a, 7
	ld	l, a
	.local	.LBB147_42
.LBB147_42:                             ;   in Loop: Header=BB147_39 Depth=2
	push	hl
	call	_gfx_SetColor
	pop	hl
	ld	iy, (ix - 93)
	ld	l, (iy + 3)
	ld	e, 1
	ld	a, l
	and	a, e
	ld	e, a
	bit	0, e
	jr	z, .LBB147_44
; %bb.43:                               ;   in Loop: Header=BB147_39 Depth=2
	ld	a, (iy)
	ld	de, 0
	push	de
	pop	hl
	ld	l, a
	add	hl, hl
	push	hl
	pop	bc
	ld	(ix - 109), bc
	ld	iy, (ix - 93)
	ld	a, (iy + 1)
	push	de
	pop	iy
	ld	iyl, a
	add	iy, iy
	lea	hl, iy + 0
	ld	de, -3
	add	hl, de
	ld	(ix - 103), hl
	push	bc
	pop	hl
	add	hl, de
	ld	(ix - 106), hl
	ld	de, 3
	add	iy, de
	lea	de, iy + 0
	push	bc
	pop	iy
	ld	bc, 3
	add	iy, bc
	push	de
	push	iy
	push	de
	ld	hl, (ix - 106)
	push	hl
	ld	hl, (ix - 103)
	push	hl
	ld	hl, (ix - 109)
	push	hl
	call	_gfx_FillTriangle
	ld	iy, (ix - 93)
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	l, (iy + 3)
	.local	.LBB147_44
.LBB147_44:                             ;   in Loop: Header=BB147_39 Depth=2
	bit	1, l
	jr	z, .LBB147_46
; %bb.45:                               ;   in Loop: Header=BB147_39 Depth=2
	ld	a, (iy)
	or	a, a
	sbc	hl, hl
	push	hl
	pop	iy
	ld	iyl, a
	add	iy, iy
	ld	de, -3
	add	iy, de
	lea	bc, iy + 0
	ld	iy, (ix - 93)
	ld	a, (iy + 1)
	ld	l, a
	add	hl, hl
	add	hl, de
	ld	de, 7
	push	de
	push	de
	push	hl
	push	bc
	call	_gfx_Rectangle
	ld	iy, (ix - 93)
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	.local	.LBB147_46
.LBB147_46:                             ;   in Loop: Header=BB147_39 Depth=2
	bit	0, (iy + 5)
	jr	z, .LBB147_48
; %bb.47:                               ;   in Loop: Header=BB147_39 Depth=2
	ld	hl, 255
	push	hl
	call	_gfx_SetColor
	pop	hl
	ld	hl, (ix - 93)
	ld	a, (hl)
	or	a, a
	sbc	hl, hl
	ld	l, a
	add	hl, hl
	ld	(ix - 103), hl
	ld	de, -3
	add	hl, de
	ld	(ix - 106), hl
	ld	iy, (ix - 93)
	ld	a, (iy + 1)
	ld	iy, 0
	ld	iyl, a
	add	iy, iy
	lea	hl, iy + 0
	lea	bc, iy + 0
	add	hl, de
	ld	(ix - 93), hl
	ld	de, 3
	ld	iy, (ix - 103)
	add	iy, de
	push	bc
	pop	hl
	add	hl, de
	push	hl
	push	iy
	ld	hl, (ix - 93)
	push	hl
	ld	hl, (ix - 106)
	push	hl
	call	_gfx_Line
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	.local	.LBB147_48
.LBB147_48:                             ;   in Loop: Header=BB147_39 Depth=2
	ld	hl, (ix - 100)
	ld	de, 6
	add	hl, de
	jp	.LBB147_39
	.local	.LBB147_49
.LBB147_49:                             ;   in Loop: Header=BB147_1 Depth=1
	call	_TickerRender
	.local	.LBB147_50
.LBB147_50:                             ;   in Loop: Header=BB147_1 Depth=1
	ld	a, (_session+4)
	or	a, a
	sbc	hl, hl
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de, hl
	ld	iy, _region
	add	iy, de
	ld	hl, (iy)
	ld	(ix - 100), hl
	ld	bc, (iy + 10)
	ld	de, (iy + 12)
	ld	l, e
	ld	h, d
	ld	(ix - 106), bc
	add.sis	hl, bc
	ld	bc, (iy + 14)
	ld	(ix - 103), bc
	add.sis	hl, bc
	ld	(ix - 109), l
	ld	(ix - 108), h
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	ld	hl, 0
	jr	z, .LBB147_52
; %bb.51:                               ;   in Loop: Header=BB147_1 Depth=1
	ld	iy, 0
	lea	hl, iy + 0
	ld	l, e
	ld	h, d
	ld	bc, 100
	call	__imulu
	lea	bc, iy + 0
	push	de
	pop	iy
	ld	e, (ix - 109)
	ld	d, (ix - 108)
	ld	c, e
	ld	b, d
	lea	de, iy + 0
	call	__idivu
	.local	.LBB147_52
.LBB147_52:                             ; %Percentage.exit
                                        ;   in Loop: Header=BB147_1 Depth=1
	ld	bc, 255
	call	__iand
	ld	(ix - 109), hl
	ld	hl, (ix - 106)
                                        ; kill: def $hl killed $hl killed $uhl
	ld	bc, (ix - 103)
	add.sis	hl, bc
	add.sis	hl, de
	ex	de, hl
	ld	iyl, e
	ld	iyh, d
	ex	de, hl
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	ld	hl, 0
	jr	z, .LBB147_54
; %bb.53:                               ;   in Loop: Header=BB147_1 Depth=1
	ld	de, 0
	push	de
	pop	hl
	ld	l, c
	ld	h, b
	ld	bc, 100
	call	__imulu
	push	de
	pop	bc
	ld	c, iyl
	ld	b, iyh
	call	__idivu
	.local	.LBB147_54
.LBB147_54:                             ; %Percentage.exit8
                                        ;   in Loop: Header=BB147_1 Depth=1
	ld	de, 255
	push	de
	pop	bc
	call	__iand
	push	hl
	ld	hl, (ix - 109)
	push	hl
	ld	hl, (ix - 100)
	push	hl
	ld	hl, _.str.65.728
	push	hl
	ld	hl, 80
	push	hl
	ld	hl, (ix - 90)
	push	hl
	call	_snprintf
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 207
	push	hl
	ld	hl, 4
	push	hl
	ld	hl, (ix - 90)
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	c, (ix - 93)
	ld	b, (ix - 92)
	sbc.sis	hl, hl
	adc.sis	hl, bc
	ld	hl, 0
	push	hl
	pop	de
	jr	z, .LBB147_56
; %bb.55:                               ;   in Loop: Header=BB147_1 Depth=1
	ld	iy, 0
	lea	hl, iy + 0
	ld	e, (ix - 114)
	ld	d, (ix - 113)
	ld	l, e
	ld	h, d
	ld	de, 100
	push	de
	pop	bc
	call	__imulu
	lea	de, iy + 0
	ld	c, (ix - 93)
	ld	b, (ix - 92)
	ld	e, c
	ld	d, b
	push	de
	pop	bc
	call	__idivu
	ld	bc, 255
	call	__iand
	ld	(ix - 93), hl
	ld	hl, (ix - 112)
	ex	de, hl
	ld	iyl, e
	ld	iyh, d
	ex	de, hl
	lea	hl, iy + 0
	ld	bc, 100
	call	__imulu
	push	de
	pop	bc
	ld	de, (ix - 93)
	call	__idivu
	.local	.LBB147_56
.LBB147_56:                             ; %Percentage.exit10
                                        ;   in Loop: Header=BB147_1 Depth=1
	ld	bc, 255
	call	__iand
	push	hl
	push	de
	ld	hl, _.str.66.729
	push	hl
	ld	hl, 80
	push	hl
	ld	hl, (ix - 90)
	push	hl
	call	_snprintf
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 219
	push	hl
	ld	hl, 4
	push	hl
	ld	hl, (ix - 90)
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 231
	push	hl
	ld	hl, 4
	push	hl
	ld	hl, _.str.67.730
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	call	_gfx_SwapDraw
	ld	bc, (-917504)
	ld	hl, (ix - 97)
	ld	a, (hl)
	ld	e, a
	push	de
	push	bc
	call	_TickerUpdate
	pop	hl
	pop	hl
	ld	hl, (_session)
	ld	a, (_session+3)
	ld	d, a
	ld	(ix - 93), hl
	ld	e, d
	call	__lnot
	push	hl
	pop	bc
	ld	iyl, e
	ld	hl, (-917504)
	ld	a, (-917501)
	ld	e, a
	ld	a, iyl
	call	__lcmpu
	ld	hl, -1
	ld	a, h
	jr	nc, .LBB147_58
; %bb.57:                               ;   in Loop: Header=BB147_1 Depth=1
	ld	hl, (-917504)
	ld	a, (-917501)
	ld	e, a
	ld	bc, (ix - 93)
	ld	a, d
	call	__ladd
	ld	a, e
	.local	.LBB147_58
.LBB147_58:                             ;   in Loop: Header=BB147_1 Depth=1
	ld	(_session), hl
	ld	(_session+3), a
	or	a, a
	sbc	hl, hl
	ld	(-917504), hl
	xor	a, a
	ld	(-917501), a
	jp	.LBB147_1
	.local	.LBB147_59
.LBB147_59:                             ;   in Loop: Header=BB147_1 Depth=1
	ld	a, e
	cp	a, 5
	call	c, _UpdateSelectedRegion
	ld	e, (ix - 93)                    ; 1-byte Folded Reload
	jp	.LBB147_3
	.local	.LBB147_60
.LBB147_60:
	call	_SaveData
	bit	0, a
	ld	hl, _.str.63.732
	push	hl
	ld	hl, _.str.62.731
	push	hl
	call	z, _Message
	pop	hl
	pop	hl
	ld	a, (_disease+34)
	or	a, a
	call	nz, _ResultScreen
	call	_ReleaseKeys
	.local	.LBB147_61
.LBB147_61:
	ld	a, (ix - 94)                    ; 1-byte Folded Reload
	ld	sp, ix
	pop	ix
	ret
	.local	.LBB147_62
.LBB147_62:
	ld	a, l
	cp	a, 2
	jr	z, .LBB147_64
; %bb.63:
	ld	a, 0
	jr	.LBB147_65
	.local	.LBB147_64
.LBB147_64:
	ld	a, -1
	.local	.LBB147_65
.LBB147_65:
	ld	(ix - 94), a
	jr	.LBB147_61
	.local	.Lfunc_end147
.Lfunc_end147:
	.size	_Play, .Lfunc_end147-_Play
                                        ; -- End function
	.section	.text._EventNotice,"ax",@progbits
	.type	_EventNotice,@function          ; -- Begin function EventNotice
_EventNotice:                           ; @EventNotice
; %bb.0:
	call	__frameset0
	ld	a, (ix + 6)
	ld	iyl, a
	ld	e, (ix + 9)
	ld	a, (ix + 12)
	ld	l, 1
	and	a, l
	ld	b, a
	or	a, a
	sbc	hl, hl
	ld	l, b
	ld	bc, 14
	add	hl, bc
	ld	d, b
	ld	(ix + 6), hl
	ld	a, iyl
	ld	(ix + 9), a
	ld	(ix + 12), e
	ld	(ix + 13), d
	pop	ix
	jp	_TickerPost
	.local	.Lfunc_end148
.Lfunc_end148:
	.size	_EventNotice, .Lfunc_end148-_EventNotice
                                        ; -- End function
	.section	.text._main,"ax",@progbits
	.globl	_main                           ; -- Begin function main
	.type	_main,@function
_main:                                  ; @main
; %bb.0:
	ld	hl, -170
	call	__frameset
	ld	de, -142
	lea	iy, ix + 0
	add	iy, de
	ld	a, d
	ld	de, -155
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), a
	ld	hl, _region+10
	push	ix
	lea	ix, ix - 128
	ld	(ix - 30), hl
	pop	ix
	lea	hl, ix - 83
	push	ix
	lea	ix, ix - 128
	ld	(ix - 17), hl
	pop	ix
	lea	hl, ix - 24
	push	ix
	lea	ix, ix - 128
	ld	(ix - 42), hl
	pop	ix
	lea	hl, ix - 92
	push	ix
	lea	ix, ix - 128
	ld	(ix - 26), hl
	pop	ix
	lea	hl, iy + 0
	ld	de, -151
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	lea	hl, ix - 23
	ld	de, -161
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	call	_gfx_Begin
	ld	hl, 1
	push	hl
	call	_gfx_SetDraw
	pop	hl
	or	a, a
	sbc	hl, hl
	push	hl
	call	_gfx_SetTransparentColor
	pop	hl
	or	a, a
	sbc	hl, hl
	push	hl
	call	_gfx_SetTextTransparentColor
	pop	hl
	call	_InitializeMap
	call	_ResetGameState
	ld	hl, 1
	push	hl
	call	_srand
	pop	hl
	call	_RemoveSaves
	or	a, a
	sbc	hl, hl
	push	hl
	ld	hl, 40
	push	hl
	call	_StartRun
	pop	hl
	pop	hl
	call	_DiscoveredWithClosures
	ld	de, 16
	ld	a, 3
	ld	(_session+5), a
	ld	hl, 245
	ld	(_session), hl
	ld	l, d
	ld	a, l
	ld	(_session+3), a
	ld	bc, 128
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 20
	ld	(iy + 0), hl
	ex	de, hl
	ld	iyl, e
	ex	de, hl
	.local	.LBB149_1
.LBB149_1:                              ; =>This Inner Loop Header: Depth=1
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	jr	z, .LBB149_3
; %bb.2:                                ;   in Loop: Header=BB149_1 Depth=1
	ld	hl, _event_catalog
	add	hl, de
	ld	a, (hl)
	ld	l, a
	push	hl
	push	iy
	push	iy
	push	iy
	ld	bc, -167
	lea	hl, ix + 0
	add	hl, bc
	ld	(hl), de
	ld	de, -164
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), iy
	call	_SetActive
	ld	de, -164
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	bc, 128
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 39)
	pop	ix
	ld	de, 28
	add	hl, de
	inc	iyl
	ex	de, hl
	jr	.LBB149_1
	.local	.LBB149_3
.LBB149_3:
	call	_RefreshEffects
	ld	hl, _disease
	push	hl
	ld	hl, _world_events
	push	hl
	call	_EventsValidate
	ld	l, a
	pop	de
	pop	de
	ld	de, 10
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	call	_SaveData
	ld	l, a
	ld	de, 11
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	bc, -145
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	ld	hl, _disease
	ld	bc, 58
	ldir
	ld	bc, -161
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	ld	iy, _session
	lea	hl, iy + 0
	ld	bc, 9
	ldir
	ld	bc, -151
	lea	hl, ix + 0
	add	hl, bc
	ld	de, (hl)
	ld	hl, _world_events
	ld	bc, 50
	ldir
	ld	hl, (_session)
	lea	iy, iy + 3
	push	ix
	lea	ix, ix - 128
	ld	(ix - 36), iy
	pop	ix
	ld	e, (iy)
	ld	bc, 1
	ld	iyl, b
	ld	a, iyl
	call	__ladd
	ld	(_session), hl
	ld	bc, -164
	lea	iy, ix + 0
	add	iy, bc
	ld	hl, (iy + 0)
	ld	(hl), e
	call	_SaveData
	ld	l, a
	ld	de, 12
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	hl, _.str.76.750
	push	hl
	ld	hl, _.str.72.749
	push	hl
	call	_ti_Open
	ld	e, a
	pop	hl
	pop	hl
	ld	(ix - 92), 0
	ld	hl, 20
	push	hl
	ld	bc, -164
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), de
	or	a, a
	ld	hl, -1
	ld	de, -167
	lea	iy, ix + 0
	push	af
	add	iy, de
	pop	af
	ld	(iy + 0), hl
	jr	nz, .LBB149_5
; %bb.4:
	ld	hl, 0
	.local	.LBB149_5
.LBB149_5:
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	de, -164
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, 1
	push	hl
	push	hl
	pea	ix - 92
	call	_ti_Write
	pop	de
	pop	de
	pop	de
	pop	de
	ld	de, 21
	push	de
	ld	de, 1
	or	a, a
	sbc	hl, de
	ld	hl, -1
	jr	z, .LBB149_7
; %bb.6:
	ld	hl, 0
	.local	.LBB149_7
.LBB149_7:
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	de, -164
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_ti_Close
	pop	hl
	call	_ResetGameState
	call	_LoadData
	ld	l, a
	ld	de, 13
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	hl, 58
	push	hl
	ld	de, -145
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _disease
	push	hl
	call	_memcmp
	pop	de
	pop	de
	pop	de
	ld	de, 14
	push	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	ld	hl, -1
	jr	z, .LBB149_9
; %bb.8:
	ld	hl, 0
	.local	.LBB149_9
.LBB149_9:
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	hl, 9
	push	hl
	ld	de, -161
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _session
	push	hl
	call	_memcmp
	pop	de
	pop	de
	pop	de
	ld	de, 15
	push	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	ld	hl, -1
	jr	z, .LBB149_11
; %bb.10:
	ld	hl, 0
	.local	.LBB149_11
.LBB149_11:
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	de, -151
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_SameEvents
	ld	l, a
	pop	de
	ld	de, 16
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	a, (_port+5)
	ld	l, a
	ld	a, (_port+53)
	ld	e, a
	ld	a, l
	and	a, e
	ld	l, a
	ld	de, 17
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	call	_RemoveSaves
	ld	hl, _.str.77.751
	push	hl
	call	_ti_Delete
	pop	hl
	ld	hl, _.str.78.752
	push	hl
	call	_ti_Delete
	pop	hl
	or	a, a
	sbc	hl, hl
	push	hl
	ld	hl, 37
	push	hl
	call	_StartRun
	pop	hl
	pop	hl
	ld	a, 3
	ld	(_session+5), a
	ld	hl, 987
	ld	(_session), hl
	ld	l, 0
	ld	a, l
	ld	(_session+3), a
	ld	hl, _.str.76.750
	push	hl
	ld	hl, _.str.77.751
	push	hl
	call	_ti_Open
	pop	hl
	pop	hl
	ld	(ix - 24), a
	ld	hl, 31
	push	hl
	or	a, a
	jr	nz, .LBB149_13
; %bb.12:
	ld	hl, 0
	ld	de, -167
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	.local	.LBB149_13
.LBB149_13:
	ld	de, -167
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	de, -170
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	ld	(ix - 23), hl
	ld	hl, _FileRead.753
	ld	(ix - 20), hl
	ld	hl, _FileWrite.754
	ld	(ix - 17), hl
	ld	hl, _FileSeek.755
	ld	(ix - 14), hl
	or	a, a
	sbc	hl, hl
	ld	(ix - 11), hl
	ld	(ix - 8), h
	ld	hl, _port
	push	hl
	ld	hl, _region
	push	hl
	ld	hl, _session
	push	hl
	ld	hl, _disease
	push	hl
	pea	ix - 23
	call	_EncodeSave
	ld	l, a
	pop	de
	pop	de
	pop	de
	pop	de
	pop	de
	ld	de, 32
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	a, (ix - 24)
	ld	l, a
	push	hl
	call	_ti_Close
	pop	hl
	call	_HashVar
	ld	bc, -161
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), hl
	ld	bc, -164
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), e                     ; 1-byte Folded Spill
	call	__lcmpzero
	ld	a, 1
	ld	l, a
	jr	nz, .LBB149_15
; %bb.14:
	ld	l, 0
	.local	.LBB149_15
.LBB149_15:
	ld	de, 33
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	bc, -145
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	ld	hl, _disease
	ld	bc, 58
	ldir
	ld	bc, -154
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	ld	hl, _session
	ld	bc, 9
	ldir
	call	_ResetGameState
	call	_HasLegacySave
	ld	l, a
	ld	de, 34
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	call	_ImportLegacySave
	ld	l, a
	ld	de, 35
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	hl, 58
	push	hl
	ld	de, -145
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _disease
	push	hl
	call	_memcmp
	pop	de
	pop	de
	pop	de
	ld	de, 36
	push	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	ld	hl, -1
	ld	de, 0
	jr	z, .LBB149_17
; %bb.16:
	ex	de, hl
	.local	.LBB149_17
.LBB149_17:
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	hl, 9
	push	hl
	ld	de, -154
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _session
	push	hl
	call	_memcmp
	pop	de
	pop	de
	pop	de
	ld	de, 37
	push	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	ld	hl, -1
	jr	z, .LBB149_19
; %bb.18:
	ld	hl, 0
	.local	.LBB149_19
.LBB149_19:
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	hl, (_world_events)
	ld	a, (_world_events+3)
	ld	e, a
	call	__lcmpzero
	ld	de, 0
	jr	z, .LBB149_23
; %bb.20:
	ld	hl, (_world_events+8)
	ld	de, -167
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	ld	a, (_world_events+11)
	ld	d, a
	ld	hl, (_disease+8)
	ld	a, (_disease+11)
	ld	e, a
	ld	bc, 24
	ld	iyl, b
	ld	a, iyl
	call	__ladd
	push	hl
	pop	bc
	ld	a, e
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 39
	ld	hl, (iy + 0)
	ld	e, d
	call	__lcmpu
	jr	z, .LBB149_22
; %bb.21:
	ld	de, 0
	jr	.LBB149_23
	.local	.LBB149_22
.LBB149_22:
	ld	de, -1
	.local	.LBB149_23
.LBB149_23:
	ld	hl, 38
	push	hl
	push	de
	call	_Check
	pop	hl
	pop	hl
	call	_SaveData
	ld	l, a
	ld	de, 39
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	call	_HashVar
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 33
	ld	bc, (iy + 0)
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 36
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	call	__lcmpu
	jr	z, .LBB149_25
; %bb.24:
	ld	l, 0
	jr	.LBB149_26
	.local	.LBB149_25
.LBB149_25:
	ld	l, 1
	.local	.LBB149_26
.LBB149_26:
	ld	de, 40
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	bc, -145
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	ld	hl, _disease
	ld	bc, 58
	ldir
	ld	bc, -154
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	ld	hl, _session
	ld	bc, 9
	ldir
	ld	bc, -151
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	ld	hl, _world_events
	ld	bc, 50
	ldir
	call	_ResetGameState
	call	_LoadData
	ld	l, a
	ld	de, 41
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	hl, 58
	push	hl
	ld	de, -145
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _disease
	push	hl
	call	_memcmp
	pop	de
	pop	de
	pop	de
	ld	de, 42
	push	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	ld	hl, -1
	ld	de, 0
	jr	z, .LBB149_28
; %bb.27:
	ex	de, hl
	.local	.LBB149_28
.LBB149_28:
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	hl, 9
	push	hl
	ld	de, -154
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _session
	push	hl
	call	_memcmp
	pop	de
	pop	de
	pop	de
	ld	de, 43
	push	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	ld	hl, -1
	jr	z, .LBB149_30
; %bb.29:
	ld	hl, 0
	.local	.LBB149_30
.LBB149_30:
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	de, -151
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_SameEvents
	ld	l, a
	pop	de
	ld	de, 44
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	or	a, a
	sbc	hl, hl
	push	hl
	call	_CheckChainBranch
	pop	hl
	ld	hl, 1
	push	hl
	call	_CheckChainBranch
	pop	hl
	call	_RemoveSaves
	or	a, a
	sbc	hl, hl
	push	hl
	ld	hl, 60
	push	hl
	call	_StartRun
	pop	hl
	pop	hl
	call	_DiscoveredWithClosures
	ld	l, 0
	ld	a, l
	ld	(_world_events+38), a
	ld	(_world_events+39), a
	ld	a, 1
	ld	(_world_events+40), a
	ld	hl, _world_events+12
	set	0, (hl)
	call	_RefreshEffects
	ld	hl, _disease
	push	hl
	ld	hl, _world_events
	push	hl
	call	_EventsValidate
	ld	l, a
	pop	de
	pop	de
	ld	de, 65
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	call	_SaveData
	ld	l, a
	ld	de, 66
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	call	_ResetGameState
	call	_LoadData
	ld	l, a
	ld	de, 67
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	hl, (_disease+8)
	ld	iy, _disease+8
	lea	iy, iy + 3
	push	ix
	lea	ix, ix - 128
	ld	(ix - 26), iy
	pop	ix
	ld	e, (iy)
	ld	bc, 1
	ld	iyl, b
	ld	a, iyl
	call	__ladd
	ld	a, e
	ld	(_disease+8), hl
	ld	(_disease+11), a
	ld	iy, _region+10
	or	a, a
	sbc	hl, hl
	.local	.LBB149_31
.LBB149_31:                             ; =>This Inner Loop Header: Depth=1
	push	hl
	pop	bc
	ld	de, 42
	or	a, a
	sbc	hl, de
	jr	z, .LBB149_33
; %bb.32:                               ;   in Loop: Header=BB149_31 Depth=1
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 17)
	pop	ix
	add	hl, bc
	ex	de, hl
	lea	hl, iy + 0
	push	ix
	lea	ix, ix - 128
	ld	(ix - 23), bc
	pop	ix
	ld	bc, 6
	ldir
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 23)
	pop	ix
	ld	de, 6
	add	hl, de
	lea	iy, iy + 16
	jr	.LBB149_31
	.local	.LBB149_33
.LBB149_33:
	or	a, a
	sbc	hl, hl
	push	hl
	ld	de, -145
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _disease
	push	hl
	ld	hl, _world_events
	push	hl
	call	_EventsAdvance
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	a, (_world_events+38)
	ld	l, a
	ld	a, (_world_events+12)
	ld	e, 1
	and	a, e
	ld	e, a
	ld	a, l
	cp	a, -1
	jr	z, .LBB149_35
; %bb.34:
	ld	a, 0
	jr	.LBB149_36
	.local	.LBB149_35
.LBB149_35:
	ld	a, -1
	.local	.LBB149_36
.LBB149_36:
	and	a, e
	ld	l, a
	ld	de, 68
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	call	_SaveData
	ld	l, a
	ld	de, 69
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	call	_ResetGameState
	call	_LoadData
	ld	l, a
	ld	de, 70
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	hl, _disease
	push	hl
	ld	hl, _world_events
	push	hl
	call	_EventsValidate
	ld	l, a
	pop	de
	pop	de
	ld	de, 71
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	hl, _native_check
	ld.sis	de, 72
	ld	(hl), e
	inc	hl
	ld	(hl), d
	call	_RemoveSaves
	or	a, a
	sbc	hl, hl
	push	hl
	ld	hl, 64
	push	hl
	call	_StartRun
	pop	hl
	pop	hl
	call	_DiscoveredWithClosures
	ld	bc, 0
	ld	a, (_region+6)
	ld	iyl, a
	ld	a, (_region+7)
	ld	de, 0
	.local	.LBB149_37
.LBB149_37:                             ; =>This Inner Loop Header: Depth=1
	push	bc
	pop	hl
	ex	de, hl
	ld	e, iyl
	ex	de, hl
	ld	c, a
	call	__imulu
	push	hl
	pop	bc
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	jr	nc, .LBB149_41
; %bb.38:                               ;   in Loop: Header=BB149_37 Depth=1
	ld	bc, -151
	lea	hl, ix + 0
	add	hl, bc
	push	af
	ld	a, iyl
	ld	(hl), a                         ; 1-byte Folded Spill
	pop	af
	ld	iy, (_region+3)
	lea	hl, iy + 0
	add	hl, de
	ld	c, a
	ld	a, (hl)
	or	a, a
	ld	a, c
	jr	z, .LBB149_40
; %bb.39:                               ;   in Loop: Header=BB149_37 Depth=1
	add	iy, de
	ld	(iy), 64
	ld	a, (_region+6)
	ld	bc, -151
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), a                     ; 1-byte Folded Spill
	ld	a, (_region+7)
	.local	.LBB149_40
.LBB149_40:                             ;   in Loop: Header=BB149_37 Depth=1
	inc	de
	ld	bc, 0
	push	ix
	lea	ix, ix - 128
	push	af
	ld	a, (ix - 23)                    ; 1-byte Folded Reload
	ld	iyl, a
	pop	af
	pop	ix
	jr	.LBB149_37
	.local	.LBB149_41
.LBB149_41:
	ld	hl, _region
	push	hl
	call	_RecountRegion
	pop	hl
	ld	hl, _GameRandom
	push	hl
	ld	hl, 1
	push	hl
	ld	hl, _disease
	push	hl
	ld	hl, _region
	push	hl
	call	_SeedRegion
	ld	l, a
	pop	de
	pop	de
	pop	de
	pop	de
	ld	de, 70
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	hl, _disease+30
	set	1, (hl)
	ld	a, (_world_events+24)
	ld	l, a
	ld	a, 101
	ld	(_world_events+38), a
	ld	e, 0
	ld	a, e
	ld	(_world_events+39), a
	ld	a, 16
	ld	(_world_events+40), a
	ld	e, 48
	ld	a, l
	or	a, e
	ld	l, a
	ld	(_world_events+24), a
	call	_RefreshEffects
	ld	hl, _disease
	push	hl
	ld	hl, _world_events
	push	hl
	call	_EventsValidate
	ld	l, a
	pop	de
	pop	de
	ld	de, 73
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	call	_SaveData
	ld	l, a
	ld	de, 74
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	call	_ResetGameState
	call	_LoadData
	ld	l, a
	ld	de, 75
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	hl, (_disease+8)
	push	ix
	lea	ix, ix - 128
	ld	iy, (ix - 26)
	pop	ix
	ld	e, (iy)
	ld	bc, 1
	ld	iyl, b
	ld	a, iyl
	call	__ladd
	ld	a, e
	ld	(_disease+8), hl
	ld	(_disease+11), a
	or	a, a
	sbc	hl, hl
	.local	.LBB149_42
.LBB149_42:                             ; =>This Inner Loop Header: Depth=1
	push	hl
	pop	bc
	ld	de, 42
	or	a, a
	sbc	hl, de
	jr	z, .LBB149_44
; %bb.43:                               ;   in Loop: Header=BB149_42 Depth=1
	ld	de, -145
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	add	hl, bc
	ex	de, hl
	push	ix
	lea	ix, ix - 128
	ld	iy, (ix - 30)
	pop	ix
	lea	hl, iy + 0
	push	ix
	lea	ix, ix - 128
	ld	(ix - 23), bc
	pop	ix
	ld	bc, 6
	ldir
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 23)
	pop	ix
	ld	de, 6
	add	hl, de
	lea	iy, iy + 16
	push	ix
	lea	ix, ix - 128
	ld	(ix - 30), iy
	pop	ix
	jr	.LBB149_42
	.local	.LBB149_44
.LBB149_44:
	or	a, a
	sbc	hl, hl
	push	hl
	ld	de, -145
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _disease
	push	hl
	ld	hl, _world_events
	push	hl
	call	_EventsAdvance
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	a, (_world_events+38)
	ld	l, a
	ld	a, (_world_events+24)
	bit	5, a
	ld	e, -1
	ld	h, 0
	ld	c, e
	jr	nz, .LBB149_46
; %bb.45:
	ld	c, h
	.local	.LBB149_46
.LBB149_46:
	ld	a, l
	cp	a, -1
	jr	z, .LBB149_48
; %bb.47:
	ld	e, h
	.local	.LBB149_48
.LBB149_48:
	ld	a, e
	and	a, c
	ld	l, a
	ld	de, 76
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	a, (_port+5)
	ld	l, a
	ld	a, (_port+53)
	ld	e, a
	ld	a, l
	and	a, e
	ld	l, a
	ld	de, 77
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	call	_SaveData
	ld	l, a
	ld	de, 78
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	call	_ResetGameState
	call	_LoadData
	ld	l, a
	ld	de, 79
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	a, (_port+5)
	ld	l, a
	ld	a, (_port+53)
	ld	e, a
	ld	a, l
	and	a, e
	ld	l, a
	ld	de, 80
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	hl, _disease
	push	hl
	ld	hl, _world_events
	push	hl
	call	_EventsValidate
	ld	l, a
	pop	de
	pop	de
	ld	de, 81
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	or	a, a
	sbc	hl, hl
	push	hl
	ld	hl, 80
	push	hl
	call	_StartRun
	pop	hl
	pop	hl
	ld	a, 3
	ld	(_session+5), a
	ld	hl, 321
	ld	(_session), hl
	ld	l, 0
	ld	a, l
	ld	(_session+3), a
	ld	bc, 2800
	ex	de, hl
	ld	iyl, e
	ex	de, hl
	ld	de, 0
	push	de
	pop	hl
	push	ix
	lea	ix, ix - 128
	ld	(ix - 30), hl
	pop	ix
	ld	a, -1
	push	ix
	lea	ix, ix - 128
	ld	(ix - 23), a                    ; 1-byte Folded Spill
	pop	ix
	.local	.LBB149_49
.LBB149_49:                             ; =>This Inner Loop Header: Depth=1
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	jp	z, .LBB149_58
; %bb.50:                               ;   in Loop: Header=BB149_49 Depth=1
	ld	bc, -154
	lea	hl, ix + 0
	add	hl, bc
	push	af
	ld	a, iyl
	ld	(hl), a                         ; 1-byte Folded Spill
	pop	af
	ld	iy, _event_catalog
	add	iy, de
	ld	a, (iy + 15)
	cp	a, b
	jp	nz, .LBB149_56
; %bb.51:                               ;   in Loop: Header=BB149_49 Depth=1
	ld	bc, -161
	lea	hl, ix + 0
	add	hl, bc
	ld	(hl), de
	ld	hl, (iy + 3)
	push	hl
	call	_strlen
	ex	de, hl
	pop	hl
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 30
	ld	bc, (iy + 0)
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	push	de
	pop	hl
	jr	c, .LBB149_53
; %bb.52:                               ;   in Loop: Header=BB149_49 Depth=1
	push	bc
	pop	hl
	.local	.LBB149_53
.LBB149_53:                             ;   in Loop: Header=BB149_49 Depth=1
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 36
	ld	(iy + 0), hl
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	ld	de, -154
	lea	hl, ix + 0
	push	af
	add	hl, de
	pop	af
	push	af
	ld	a, (hl)                         ; 1-byte Folded Reload
	ld	iyl, a
	pop	af
	ld	a, iyl
	jr	c, .LBB149_55
; %bb.54:                               ;   in Loop: Header=BB149_49 Depth=1
	ld	de, -151
	lea	hl, ix + 0
	add	hl, de
	ld	a, (hl)                         ; 1-byte Folded Reload
	.local	.LBB149_55
.LBB149_55:                             ;   in Loop: Header=BB149_49 Depth=1
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 36)
	pop	ix
	push	ix
	lea	ix, ix - 128
	ld	(ix - 30), hl
	pop	ix
	ld	de, -151
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), a                         ; 1-byte Folded Spill
	ld	bc, -161
	lea	hl, ix + 0
	add	hl, bc
	ld	de, (hl)
	jr	.LBB149_57
	.local	.LBB149_56
.LBB149_56:                             ;   in Loop: Header=BB149_49 Depth=1
	lea	hl, ix + 0
	add	hl, bc
	push	af
	ld	a, (hl)                         ; 1-byte Folded Reload
	ld	iyl, a
	pop	af
	.local	.LBB149_57
.LBB149_57:                             ;   in Loop: Header=BB149_49 Depth=1
	ex	de, hl
	ld	bc, 28
	add	hl, bc
	inc	iyl
	ex	de, hl
	ld	bc, 2800
	jp	.LBB149_49
	.local	.LBB149_58
.LBB149_58:
	or	a, a
	sbc	hl, hl
	ld	de, -151
	lea	iy, ix + 0
	add	iy, de
	ld	l, (iy + 0)                     ; 1-byte Folded Reload
	ld	de, -167
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	ld	bc, 28
	call	__imulu
	ld	de, -161
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	ld	de, 0
	ld	l, b
	ex	de, hl
	ld	iyl, e
	ex	de, hl
	ld	a, -1
	ld	bc, -154
	lea	hl, ix + 0
	add	hl, bc
	ld	(hl), a                         ; 1-byte Folded Spill
	ld	bc, -164
	lea	hl, ix + 0
	add	hl, bc
	ld	(hl), de
	ld	bc, 2800
	.local	.LBB149_59
.LBB149_59:                             ; =>This Inner Loop Header: Depth=1
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	jp	z, .LBB149_69
; %bb.60:                               ;   in Loop: Header=BB149_59 Depth=1
	push	ix
	lea	ix, ix - 128
	push	af
	ld	a, iyl
	ld	(ix - 30), a                    ; 1-byte Folded Spill
	pop	af
	pop	ix
	ld	iy, _event_catalog
	add	iy, de
	ld	a, (iy + 15)
	cp	a, -1
	jr	nz, .LBB149_62
; %bb.61:                               ;   in Loop: Header=BB149_59 Depth=1
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 33)
	pop	ix
	or	a, a
	sbc	hl, de
	jr	nz, .LBB149_63
	.local	.LBB149_62
.LBB149_62:                             ;   in Loop: Header=BB149_59 Depth=1
	push	ix
	lea	ix, ix - 128
	push	af
	ld	a, (ix - 30)                    ; 1-byte Folded Reload
	ld	iyl, a
	pop	af
	jr	.LBB149_68
	.local	.LBB149_63
.LBB149_63:                             ;   in Loop: Header=BB149_59 Depth=1
	ld	bc, -170
	lea	hl, ix + 0
	add	hl, bc
	ld	(hl), de
	ld	hl, (iy)
	push	hl
	call	_strlen
	ex	de, hl
	pop	hl
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 36
	ld	bc, (iy + 0)
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	push	ix
	lea	ix, ix - 128
	push	af
	ld	a, (ix - 30)                    ; 1-byte Folded Reload
	ld	iyl, a
	pop	af
	pop	ix
	ld	a, iyl
	jr	c, .LBB149_65
; %bb.64:                               ;   in Loop: Header=BB149_59 Depth=1
	push	ix
	lea	ix, ix - 128
	ld	a, (ix - 26)                    ; 1-byte Folded Reload
	pop	ix
	.local	.LBB149_65
.LBB149_65:                             ;   in Loop: Header=BB149_59 Depth=1
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	push	bc
	pop	hl
	ld	bc, 2800
	jr	c, .LBB149_67
; %bb.66:                               ;   in Loop: Header=BB149_59 Depth=1
	ex	de, hl
	.local	.LBB149_67
.LBB149_67:                             ;   in Loop: Header=BB149_59 Depth=1
	push	ix
	lea	ix, ix - 128
	ld	(ix - 26), a                    ; 1-byte Folded Spill
	pop	ix
	push	ix
	lea	ix, ix - 128
	ld	(ix - 36), de
	pop	ix
	push	ix
	lea	ix, ix - 128
	ld	de, (ix - 42)
	.local	.LBB149_68
.LBB149_68:                             ;   in Loop: Header=BB149_59 Depth=1
	pop	ix
	inc	iyl
	ex	de, hl
	ld	de, 28
	add	hl, de
	ex	de, hl
	jp	.LBB149_59
	.local	.LBB149_69
.LBB149_69:
	ld	de, -154
	lea	iy, ix + 0
	add	iy, de
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	cp	a, d
	ld	l, d
	ld	c, 0
	ld	e, l
	jr	nz, .LBB149_71
; %bb.70:
	ld	e, c
	.local	.LBB149_71
.LBB149_71:
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 23
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	cp	a, -1
	jr	nz, .LBB149_73
; %bb.72:
	ld	l, c
	.local	.LBB149_73
.LBB149_73:
	ld	a, l
	and	a, e
	ld	l, a
	ld	de, 90
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	de, -151
	lea	iy, ix + 0
	add	iy, de
	ld	a, (iy + 0)
	ld	(ix - 83), a
	ld	de, -154
	lea	iy, ix + 0
	add	iy, de
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	ld	(ix - 82), a
	ld	(ix - 80), d
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	de, -158
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	ld	iy, 100
	ld	l, h
                                        ; kill: def $l killed $l killed $uhl
	ld	de, 0
	push	ix
	lea	ix, ix - 128
	ld	(ix - 23), de
	pop	ix
	.local	.LBB149_74
.LBB149_74:                             ; =>This Inner Loop Header: Depth=1
	push	ix
	lea	ix, ix - 128
	ld	a, (ix - 27)                    ; 1-byte Folded Reload
	pop	ix
	lea	de, iy + 0
	ld	bc, -1
	add	iy, bc
	jp	nc, .LBB149_82
; %bb.75:                               ;   in Loop: Header=BB149_74 Depth=1
	push	ix
	lea	ix, ix - 128
	ld	(ix - 26), l                    ; 1-byte Folded Spill
	pop	ix
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 23)
	pop	ix
	ld	bc, -100
	add	hl, bc
	ld	bc, 100
	or	a, a
	sbc	hl, bc
	jr	c, .LBB149_78
; %bb.76:                               ;   in Loop: Header=BB149_74 Depth=1
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 23)
	pop	ix
	push	ix
	lea	ix, ix - 128
	ld	bc, (ix - 39)
	pop	ix
	or	a, a
	sbc	hl, bc
	jr	z, .LBB149_78
; %bb.77:                               ;   in Loop: Header=BB149_74 Depth=1
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 23)
	pop	ix
	push	ix
	lea	ix, ix - 128
	ld	bc, (ix - 30)
	pop	ix
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB149_80
	.local	.LBB149_78
.LBB149_78:                             ;   in Loop: Header=BB149_74 Depth=1
	ld	de, -155
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), a                         ; 1-byte Folded Spill
	push	ix
	lea	ix, ix - 128
	ld	l, (ix - 26)                    ; 1-byte Folded Reload
	pop	ix
	.local	.LBB149_79
.LBB149_79:                             ;   in Loop: Header=BB149_74 Depth=1
	push	ix
	lea	ix, ix - 128
	ld	de, (ix - 23)
	pop	ix
	inc	de
	push	ix
	lea	ix, ix - 128
	ld	(ix - 23), de
	pop	ix
	inc	l
	jp	.LBB149_74
	.local	.LBB149_80
.LBB149_80:                             ;   in Loop: Header=BB149_74 Depth=1
	cp	a, -1
	push	ix
	lea	ix, ix - 128
	ld	l, (ix - 26)                    ; 1-byte Folded Reload
	pop	ix
	push	ix
	lea	ix, ix - 128
	ld	(ix - 27), l                    ; 1-byte Folded Spill
	pop	ix
	jr	z, .LBB149_79
; %bb.81:
	ld	(ix - 81), a
	ld	(ix - 80), l
	jr	.LBB149_83
	.local	.LBB149_82
.LBB149_82:
	ld	(ix - 81), a
	.local	.LBB149_83
.LBB149_83:
	sbc	hl, hl
	adc	hl, de
	ld	l, -1
	ld	c, 0
	ld	e, l
	jr	nz, .LBB149_85
; %bb.84:
	ld	e, c
	.local	.LBB149_85
.LBB149_85:
	cp	a, -1
	jr	nz, .LBB149_87
; %bb.86:
	ld	l, c
	.local	.LBB149_87
.LBB149_87:
	ld	a, e
	and	a, l
	ld	l, a
	ld	de, 91
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	bc, 4
	ld	iy, 28
	ld	de, 0
	.local	.LBB149_88
.LBB149_88:                             ; =>This Inner Loop Header: Depth=1
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	jp	z, .LBB149_90
; %bb.89:                               ;   in Loop: Header=BB149_88 Depth=1
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 17)
	pop	ix
	add	hl, de
	ld	a, (hl)
	or	a, a
	sbc	hl, hl
	ld	l, a
	lea	bc, iy + 0
	call	__imulu
	ld	bc, -151
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), de
	ex	de, hl
	ld	iy, _event_catalog
	add	iy, de
	ld	l, (iy + 16)
                                        ; kill: def $l killed $l def $uhl
	push	hl
	ld	bc, -148
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	push	de
	ld	l, a
	push	hl
	push	de
	call	_SetActive
	ld	iy, 28
	ld	bc, 4
	push	ix
	lea	ix, ix - 128
	ld	de, (ix - 23)
	pop	ix
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	inc	de
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 20)
	pop	ix
	inc	l
	push	ix
	lea	ix, ix - 128
	ld	(ix - 20), hl
	pop	ix
	jp	.LBB149_88
	.local	.LBB149_90
.LBB149_90:
	call	_RefreshEffects
	ld	hl, _disease
	push	hl
	ld	hl, _world_events
	push	hl
	call	_EventsValidate
	ld	l, a
	pop	de
	pop	de
	ld	de, 95
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	hl, _native_check
	push	hl
	pop	iy
	ld.sis	hl, 1000
	ld	(iy), l
	ld	(iy + 1), h
	ld	hl, _.str.31.756
	push	hl
	call	_BeginScreen
	pop	hl
	ld	hl, 52
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, _.str.32.757
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 76
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, _.str.33.758
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 100
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, _.str.34.759
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	call	_gfx_SwapDraw
	call	_WaitKey
	call	_ActionsMenu
	ld.sis	hl, 2000
	ld	iy, _native_check
	ld	(iy), l
	ld	(iy + 1), h
	ld	hl, _.str.35.760
	push	hl
	call	_BeginScreen
	pop	hl
	call	_gfx_SwapDraw
	.local	.LBB149_91
.LBB149_91:                             ; =>This Inner Loop Header: Depth=1
	call	_kb_Scan
	jr	.LBB149_91
	.local	.Lfunc_end149
.Lfunc_end149:
	.size	_main, .Lfunc_end149-_main
                                        ; -- End function
	.section	.text._RemoveSaves,"ax",@progbits
	.type	_RemoveSaves,@function          ; -- Begin function RemoveSaves
_RemoveSaves:                           ; @RemoveSaves
; %bb.0:
	ld	hl, _.str.72.749
	push	hl
	call	_ti_Delete
	pop	hl
	ld	hl, _.str.73.763
	push	hl
	call	_ti_Delete
	pop	hl
	ld	hl, _.str.74.764
	push	hl
	call	_ti_Delete
	pop	hl
	ret
	.local	.Lfunc_end150
.Lfunc_end150:
	.size	_RemoveSaves, .Lfunc_end150-_RemoveSaves
                                        ; -- End function
	.section	.text._StartRun,"ax",@progbits
	.type	_StartRun,@function             ; -- Begin function StartRun
_StartRun:                              ; @StartRun
; %bb.0:
	call	__frameset0
	call	_ResetGameState
	ld	a, 2
	ld	(_disease+32), a
	dec	a
	ld	(_disease+33), a
	ld	hl, (ix + 6)
	ld	(_disease+8), hl
	ld	iy, _disease+8
	lea	hl, iy + 3
	ld	a, (ix + 9)
	ld	(hl), a
	ld	de, _disease+37
	ld	hl, _.str.61.724
	ld	bc, 9
	ldir
	ld	hl, 18
	push	hl
	ld	hl, 3430008
	push	hl
	ld	hl, _disease
	push	hl
	ld	hl, _world_events
	push	hl
	call	_EventsInit
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, _GameRandom
	push	hl
	or	a, a
	sbc	hl, hl
	push	hl
	ld	hl, _disease
	push	hl
	ld	hl, _region
	push	hl
	call	_SeedRegion
	ld	l, a
	pop	de
	pop	de
	pop	de
	pop	de
	ld	de, 1
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	hl, (ix + 6)
	ld	(_disease+8), hl
	ld	a, (ix + 9)
	ld	(_disease+11), a
	ld	hl, 18
	push	hl
	ld	hl, 3430008
	push	hl
	ld	hl, _disease
	push	hl
	ld	hl, _world_events
	push	hl
	call	_EventsInit
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end151
.Lfunc_end151:
	.size	_StartRun, .Lfunc_end151-_StartRun
                                        ; -- End function
	.section	.text._DiscoveredWithClosures,"ax",@progbits
	.type	_DiscoveredWithClosures,@function ; -- Begin function DiscoveredWithClosures
_DiscoveredWithClosures:                ; @DiscoveredWithClosures
; %bb.0:
	ld	c, 1
	ld	d, 0
	ld	a, c
	ld	(_disease+35), a
	ld	hl, (_disease+8)
	ld	a, (_disease+11)
	ld	e, a
	call	__lcmpzero
	jr	nz, .LBB152_2
; %bb.1:
	ld	hl, 0
	jr	.LBB152_3
	.local	.LBB152_2
.LBB152_2:
	ld	hl, 1
	.local	.LBB152_3
.LBB152_3:
	ld	iy, 0
	ld	a, iyl
	ld	(_disease+12), hl
	ld	(_disease+15), a
	ld	hl, 12000
	ld	(_disease+16), hl
	ld	a, d
	ld	(_disease+19), a
	ld	a, c
	ld	(_port+5), a
	ld	(_port+53), a
	ret
	.local	.Lfunc_end152
.Lfunc_end152:
	.size	_DiscoveredWithClosures, .Lfunc_end152-_DiscoveredWithClosures
                                        ; -- End function
	.section	.text._SetActive,"ax",@progbits
	.type	_SetActive,@function            ; -- Begin function SetActive
_SetActive:                             ; @SetActive
; %bb.0:
	call	__frameset0
	ld	c, (ix + 6)
	ld	d, (ix + 9)
	ld	e, (ix + 12)
	ld	a, (ix + 15)
	ld	iy, _world_events+38
	or	a, a
	sbc	hl, hl
	ld	l, c
	ld	bc, 3
	call	__imulu
	push	hl
	pop	bc
	add	iy, bc
	ld	(iy), d
	ld	(iy + 1), e
	ld	(iy + 2), a
	ld	l, 7
	ld	a, d
	and	a, l
	ld	b, a
	ld	a, 1
	call	__bshl
	ld	e, a
	or	a, a
	sbc	hl, hl
	ld	l, d
	ld	c, 3
	call	__ishru
	push	hl
	pop	bc
	ld	hl, _world_events+12
	add	hl, bc
	ld	a, (hl)
	push	hl
	pop	iy
	or	a, e
	ld	l, a
	ld	(iy), l
	pop	ix
	ret
	.local	.Lfunc_end153
.Lfunc_end153:
	.size	_SetActive, .Lfunc_end153-_SetActive
                                        ; -- End function
	.section	.text._Check,"ax",@progbits
	.type	_Check,@function                ; -- Begin function Check
_Check:                                 ; @Check
; %bb.0:
	ld	hl, -43
	call	__frameset
	ld	a, (ix + 6)
	ld	hl, (ix + 9)
	ld	iy, _native_check
	ld	(iy), l
	ld	(iy + 1), h
	bit	0, a
	jr	z, .LBB154_2
; %bb.1:
	ld	sp, ix
	pop	ix
	ret
	.local	.LBB154_2
.LBB154_2:
	ld.sis	bc, -32768
	lea	de, ix - 40
	ld	(ix - 43), de
	ld	de, 0
	ld	e, l
	ld	d, h
                                        ; kill: def $hl killed $hl killed $uhl
	call	__sor
	ld	(iy), l
	ld	(iy + 1), h
	push	de
	ld	hl, _.str.75.762
	push	hl
	ld	hl, 40
	push	hl
	ld	hl, (ix - 43)
	push	hl
	call	_snprintf
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (ix - 43)
	push	hl
	call	_BeginScreen
	pop	hl
	call	_gfx_SwapDraw
	.local	.LBB154_3
.LBB154_3:                              ; =>This Inner Loop Header: Depth=1
	call	_kb_Scan
	jr	.LBB154_3
	.local	.Lfunc_end154
.Lfunc_end154:
	.size	_Check, .Lfunc_end154-_Check
                                        ; -- End function
	.section	.text._SameEvents,"ax",@progbits
	.type	_SameEvents,@function           ; -- Begin function SameEvents
_SameEvents:                            ; @SameEvents
; %bb.0:
	call	__frameset0
	ld	hl, (ix + 6)
	ld	de, _world_events
	ld	bc, 50
	push	bc
	push	hl
	push	de
	call	_memcmp
	pop	de
	pop	de
	pop	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	z, .LBB155_2
; %bb.1:
	ld	a, 0
	jr	.LBB155_3
	.local	.LBB155_2
.LBB155_2:
	ld	a, -1
	.local	.LBB155_3
.LBB155_3:
	pop	ix
	ret
	.local	.Lfunc_end155
.Lfunc_end155:
	.size	_SameEvents, .Lfunc_end155-_SameEvents
                                        ; -- End function
	.section	.text._FileRead.753,"ax",@progbits
	.type	_FileRead.753,@function         ; -- Begin function FileRead.753
_FileRead.753:                          ; @FileRead.753
; %bb.0:
	call	__frameset0
	ld	hl, (ix + 6)
	ld	iy, (ix + 9)
	ld	de, (ix + 12)
	ld	bc, 1
	ld	a, (hl)
	ld	l, a
	push	hl
	push	de
	push	bc
	push	iy
	call	_ti_Read
	pop	de
	pop	de
	pop	de
	pop	de
	ld	de, (ix + 12)
	or	a, a
	sbc	hl, de
	jr	z, .LBB156_2
; %bb.1:
	ld	a, 0
	jr	.LBB156_3
	.local	.LBB156_2
.LBB156_2:
	ld	a, -1
	.local	.LBB156_3
.LBB156_3:
	pop	ix
	ret
	.local	.Lfunc_end156
.Lfunc_end156:
	.size	_FileRead.753, .Lfunc_end156-_FileRead.753
                                        ; -- End function
	.section	.text._FileWrite.754,"ax",@progbits
	.type	_FileWrite.754,@function        ; -- Begin function FileWrite.754
_FileWrite.754:                         ; @FileWrite.754
; %bb.0:
	call	__frameset0
	ld	hl, (ix + 6)
	ld	iy, (ix + 9)
	ld	de, (ix + 12)
	ld	bc, 1
	ld	a, (hl)
	ld	l, a
	push	hl
	push	de
	push	bc
	push	iy
	call	_ti_Write
	pop	de
	pop	de
	pop	de
	pop	de
	ld	de, (ix + 12)
	or	a, a
	sbc	hl, de
	jr	z, .LBB157_2
; %bb.1:
	ld	a, 0
	jr	.LBB157_3
	.local	.LBB157_2
.LBB157_2:
	ld	a, -1
	.local	.LBB157_3
.LBB157_3:
	pop	ix
	ret
	.local	.Lfunc_end157
.Lfunc_end157:
	.size	_FileWrite.754, .Lfunc_end157-_FileWrite.754
                                        ; -- End function
	.section	.text._FileSeek.755,"ax",@progbits
	.type	_FileSeek.755,@function         ; -- Begin function FileSeek.755
_FileSeek.755:                          ; @FileSeek.755
; %bb.0:
	call	__frameset0
	ld	hl, (ix + 6)
	ld	de, (ix + 9)
	ld	bc, 0
	ld	a, (hl)
	ld	l, a
	push	hl
	push	bc
	push	de
	call	_ti_Seek
	pop	de
	pop	de
	pop	de
	ld	de, -1
	or	a, a
	sbc	hl, de
	jr	nz, .LBB158_2
; %bb.1:
	ld	a, 0
	jr	.LBB158_3
	.local	.LBB158_2
.LBB158_2:
	ld	a, -1
	.local	.LBB158_3
.LBB158_3:
	pop	ix
	ret
	.local	.Lfunc_end158
.Lfunc_end158:
	.size	_FileSeek.755, .Lfunc_end158-_FileSeek.755
                                        ; -- End function
	.section	.text._HashVar,"ax",@progbits
	.type	_HashVar,@function              ; -- Begin function HashVar
_HashVar:                               ; @HashVar
; %bb.0:
	ld	hl, -60
	call	__frameset
	ld	hl, _.str.77.751
	ld	de, _.str.79.761
	xor	a, a
	ld	(ix - 35), a
	ld	bc, 0
	ld	(ix - 38), bc
	push	de
	push	hl
	call	_ti_Open
	ld	e, a
	pop	hl
	pop	hl
	or	a, a
	jp	z, .LBB159_14
; %bb.1:
	ld	hl, 1875397
	ld	(ix - 44), hl
	ld	a, -127
	ld	(ix - 45), a
	lea	hl, ix - 32
	ld	(ix - 48), hl
	ld	(ix - 41), de
	push	de
	call	_ti_GetSize
	pop	de
	xor	a, a
	ld	(ix - 34), a
	ld	iy, (ix - 36)
	ex	de, hl
	ld	iyh, d
	ld	iyl, e
	ex	de, hl
	sbc	hl, hl
	ld	a, l
	ld	(ix - 52), a                    ; 1-byte Folded Spill
	ld	e, a
	.local	.LBB159_2
.LBB159_2:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB159_9 Depth 2
	lea	hl, iy + 0
	call	__lcmpzero
	jp	z, .LBB159_12
; %bb.3:                                ;   in Loop: Header=BB159_2 Depth=1
	lea	hl, iy + 0
	ld	bc, 32
	xor	a, a
	call	__lcmpu
	ccf
                                        ; kill: def $a killed $a
	sbc	a, a
	inc	a
	bit	0, a
	lea	bc, iy + 0
	jr	nz, .LBB159_5
; %bb.4:                                ;   in Loop: Header=BB159_2 Depth=1
	ld	hl, 32
	push	hl
	pop	bc
	.local	.LBB159_5
.LBB159_5:                              ;   in Loop: Header=BB159_2 Depth=1
	ld	(ix - 58), iy
	bit	0, a
	ld	(ix - 59), e                    ; 1-byte Folded Spill
	ld	a, e
	ld	hl, (ix - 41)
	ld	de, (ix - 48)
	jr	nz, .LBB159_7
; %bb.6:                                ;   in Loop: Header=BB159_2 Depth=1
	xor	a, a
	.local	.LBB159_7
.LBB159_7:                              ;   in Loop: Header=BB159_2 Depth=1
	ld	(ix - 60), a
	push	hl
	push	bc
	ld	hl, 1
	push	hl
	push	de
	ld	(ix - 51), bc
	call	_ti_Read
	ld	bc, (ix - 51)
	pop	de
	pop	de
	pop	de
	pop	de
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB159_13
; %bb.8:                                ; %.preheader.preheader
                                        ;   in Loop: Header=BB159_2 Depth=1
	push	bc
	pop	hl
	ld	de, (ix - 48)
	ld	(ix - 55), de
	ld	d, 0
	.local	.LBB159_9
.LBB159_9:                              ; %.preheader
                                        ;   Parent Loop BB159_2 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	push	hl
	pop	iy
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	z, .LBB159_11
; %bb.10:                               ;   in Loop: Header=BB159_9 Depth=2
	ld	hl, (ix - 55)
	ld	a, (hl)
	ld	(ix - 33), d
	ld	bc, (ix - 35)
	ld	b, d
	ld	c, a
	ld	hl, (ix - 44)
	ld	e, (ix - 45)                    ; 1-byte Folded Reload
	ld	a, (ix - 52)                    ; 1-byte Folded Reload
	call	__lxor
	ld	bc, 403
	ld	a, b
	call	__lmulu
	ld	bc, (ix - 51)
	ld	(ix - 44), hl
	ld	(ix - 45), e                    ; 1-byte Folded Spill
	ld	hl, (ix - 55)
	inc	hl
	ld	(ix - 55), hl
	lea	hl, iy + 0
	dec	hl
	jr	.LBB159_9
	.local	.LBB159_11
.LBB159_11:                             ;   in Loop: Header=BB159_2 Depth=1
	ld	hl, (ix - 58)
	ld	e, (ix - 59)                    ; 1-byte Folded Reload
	ld	a, (ix - 60)                    ; 1-byte Folded Reload
	call	__lsub
	push	hl
	pop	iy
	jp	.LBB159_2
	.local	.LBB159_12
.LBB159_12:
	ld	hl, (ix - 44)
	ld	(ix - 38), hl
	ld	a, (ix - 45)
	ld	(ix - 35), a                    ; 1-byte Folded Spill
	.local	.LBB159_13
.LBB159_13:
	ld	hl, (ix - 41)
	push	hl
	call	_ti_Close
	pop	hl
	.local	.LBB159_14
.LBB159_14:
	ld	hl, (ix - 38)
	ld	e, (ix - 35)                    ; 1-byte Folded Reload
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end159
.Lfunc_end159:
	.size	_HashVar, .Lfunc_end159-_HashVar
                                        ; -- End function
	.section	.text._CheckChainBranch,"ax",@progbits
	.type	_CheckChainBranch,@function     ; -- Begin function CheckChainBranch
_CheckChainBranch:                      ; @CheckChainBranch
; %bb.0:
	ld	hl, -179
	call	__frameset
	ld.sis	de, 49
	ld	hl, _native_check
	lea	bc, ix - 65
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 48
	ld	(iy + 0), bc
	lea	bc, ix - 74
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 45
	ld	(iy + 0), bc
	lea	bc, ix - 124
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 42
	ld	(iy + 0), bc
	ld	(hl), e
	inc	hl
	ld	(hl), d
	call	_RemoveSaves
	or	a, a
	sbc	hl, hl
	push	hl
	ld	hl, 48
	push	hl
	call	_StartRun
	pop	hl
	pop	hl
	call	_DiscoveredWithClosures
	ld	d, 0
	bit	0, (ix + 6)
	jr	z, .LBB160_2
; %bb.1:
	ld	bc, 1966080
	ld	hl, (_disease)
	ld	iy, _disease
	lea	iy, iy + 3
	ld	e, (iy)
	ld	a, d
	call	__lor
	ld	a, e
	ld	(_disease), hl
	ld	(_disease+3), a
	.local	.LBB160_2
.LBB160_2:
	ld	a, (_world_events+24)
	ld	l, a
	ld	a, 101
	ld	(_world_events+38), a
	ld	a, d
	ld	(_world_events+39), a
	ld	a, 1
	ld	(_world_events+40), a
	ld	e, 48
	ld	a, l
	or	a, e
	ld	l, a
	ld	(_world_events+24), a
	call	_RefreshEffects
	ld	hl, _disease
	push	hl
	ld	hl, _world_events
	push	hl
	call	_EventsValidate
	ld	l, a
	pop	de
	pop	de
	ld	de, 50
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	call	_SaveData
	ld	l, a
	ld	de, 51
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	bc, -176
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	ld	hl, _disease
	ld	bc, 58
	ldir
	ld	bc, -173
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	ld	hl, _session
	ld	bc, 9
	ldir
	ld	bc, -170
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	ld	hl, _world_events
	ld	bc, 50
	ldir
	call	_ResetGameState
	call	_LoadData
	ld	l, a
	ld	de, 52
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	hl, 58
	push	hl
	ld	de, -176
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _disease
	push	hl
	call	_memcmp
	pop	de
	pop	de
	pop	de
	ld	de, 53
	push	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	ld	hl, -1
	ld	de, 0
	jr	z, .LBB160_4
; %bb.3:
	ex	de, hl
	.local	.LBB160_4
.LBB160_4:
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	hl, 9
	push	hl
	ld	de, -173
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _session
	push	hl
	call	_memcmp
	pop	de
	pop	de
	pop	de
	ld	de, 54
	push	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	ld	de, -1
	jr	z, .LBB160_6
; %bb.5:
	ld	de, 0
	.local	.LBB160_6
.LBB160_6:
	ld	hl, _region+10
	ld	bc, -176
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), hl
	ld	bc, -167
	lea	hl, ix + 0
	add	hl, bc
	ld	bc, -173
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), hl
	push	de
	call	_Check
	pop	hl
	pop	hl
	ld	de, -170
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_SameEvents
	ld	l, a
	pop	de
	ld	de, 55
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	hl, (_disease+8)
	ld	iy, _disease+8
	lea	iy, iy + 3
	ld	e, (iy)
	ld	bc, 1
	xor	a, a
	call	__ladd
	ld	a, e
	ld	de, 0
	ld	(_disease+8), hl
	ld	(_disease+11), a
	ld	bc, 42
	.local	.LBB160_7
.LBB160_7:                              ; =>This Inner Loop Header: Depth=1
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	jr	z, .LBB160_9
; %bb.8:                                ;   in Loop: Header=BB160_7 Depth=1
	ld	bc, -173
	lea	iy, ix + 0
	add	iy, bc
	ld	hl, (iy + 0)
	add	hl, de
	ld	bc, -179
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), de
	ex	de, hl
	ld	bc, -176
	lea	hl, ix + 0
	add	hl, bc
	ld	iy, (hl)
	lea	hl, iy + 0
	ld	bc, 6
	ldir
	ld	bc, 42
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 51)
	pop	ix
	ld	de, 6
	add	hl, de
	lea	iy, iy + 16
	push	ix
	lea	ix, ix - 128
	ld	(ix - 48), iy
	pop	ix
	ex	de, hl
	jr	.LBB160_7
	.local	.LBB160_9
.LBB160_9:
	or	a, a
	sbc	hl, hl
	push	hl
	ld	de, -173
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _disease
	push	hl
	ld	hl, _world_events
	push	hl
	call	_EventsAdvance
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	a, (_world_events+38)
	ld	e, a
	ld	a, (ix + 6)
	ld	l, a
	ld	c, 15
	call	__sshl
	add.sis	hl, hl
	sbc.sis	hl, hl
                                        ; kill: def $hl killed $hl def $uhl
	ld.sis	bc, 57
	add.sis	hl, bc
	ld	b, 7
	call	__bshl
	rlc	a
	sbc	a, a
	ld	c, 103
	add	a, c
	ld	c, a
	push	hl
	ld	a, e
	cp	a, c
	jr	z, .LBB160_11
; %bb.10:
	ld	hl, 0
	jr	.LBB160_12
	.local	.LBB160_11
.LBB160_11:
	ld	hl, -1
	.local	.LBB160_12
.LBB160_12:
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	hl, _disease
	push	hl
	ld	hl, _world_events
	push	hl
	call	_EventsValidate
	ld	l, a
	pop	de
	pop	de
	ld	de, 58
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	a, (_port+5)
	ld	l, a
	ld	a, (_port+53)
	ld	e, a
	ld	a, l
	and	a, e
	ld	l, a
	ld	de, 59
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	call	_SaveData
	ld	l, a
	ld	de, 60
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	bc, -170
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	ld	hl, _world_events
	ld	bc, 50
	ldir
	call	_ResetGameState
	call	_LoadData
	ld	l, a
	ld	de, 61
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	de, -170
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_SameEvents
	ld	l, a
	pop	de
	ld	de, 62
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	a, (_port+5)
	ld	l, a
	ld	a, (_port+53)
	ld	e, a
	ld	a, l
	and	a, e
	ld	l, a
	ld	de, 63
	push	de
	push	hl
	call	_Check
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end160
.Lfunc_end160:
	.size	_CheckChainBranch, .Lfunc_end160-_CheckChainBranch
                                        ; -- End function
	.section	.rodata._.str,"a",@progbits
	.balign	1
	.local	_.str
_.str:
	.asciz	"Bacteria"

	.section	.rodata._.str.1,"a",@progbits
	.balign	1
	.local	_.str.1
_.str.1:
	.asciz	"Virus"

	.section	.rodata._.str.2,"a",@progbits
	.balign	1
	.local	_.str.2
_.str.2:
	.asciz	"Fungus"

	.section	.rodata._cure_thresholds,"a",@progbits
	.balign	1
	.local	_cure_thresholds
_cure_thresholds:
	.ascii	"\0312KZ"

	.section	.rodata._.str.4,"a",@progbits
	.balign	1
	.local	_.str.4
_.str.4:
	.asciz	"Emergency Blood Donor Rally"

	.section	.rodata._.str.1.5,"a",@progbits
	.balign	1
	.local	_.str.1.5
_.str.1.5:
	.asciz	"Walk-in donors raise blood-route spread by 15% for 16 cycles."

	.section	.rodata._.str.2.6,"a",@progbits
	.balign	1
	.local	_.str.2.6
_.str.2.6:
	.asciz	"Convention Hall Vent Fault"

	.section	.rodata._.str.3.7,"a",@progbits
	.balign	1
	.local	_.str.3.7
_.str.3.7:
	.asciz	"Stale air adds 15% to air travel and 10% to aerosol spread for 8 cycles."

	.section	.rodata._.str.4.8,"a",@progbits
	.balign	1
	.local	_.str.4.8
_.str.4.8:
	.asciz	"Choir Tour Rehearsals"

	.section	.rodata._.str.5,"a",@progbits
	.balign	1
	.local	_.str.5
_.str.5:
	.asciz	"Shared warm-up rooms raise air travel by 20% and Air I spread by 15% for 16 cycles."

	.section	.rodata._.str.6,"a",@progbits
	.balign	1
	.local	_.str.6
_.str.6:
	.asciz	"University Welcome Week"

	.section	.rodata._.str.7,"a",@progbits
	.balign	1
	.local	_.str.7
_.str.7:
	.asciz	"Dormitory mixers add 15% to general spread in urban regions for 16 cycles."

	.section	.rodata._.str.8,"a",@progbits
	.balign	1
	.local	_.str.8
_.str.8:
	.asciz	"Faith Hall Meal Line"

	.section	.rodata._.str.9,"a",@progbits
	.balign	1
	.local	_.str.9
_.str.9:
	.asciz	"A shared meal queue raises Water I spread by 15% for 8 cycles in humid regions."

	.section	.rodata._.str.10,"a",@progbits
	.balign	1
	.local	_.str.10
_.str.10:
	.asciz	"Marathon Aid Stations"

	.section	.rodata._.str.11,"a",@progbits
	.balign	1
	.local	_.str.11
_.str.11:
	.asciz	"Repeated handoffs add 10% to blood-route spread and 10% to air travel for 16 cycles."

	.section	.rodata._.str.12,"a",@progbits
	.balign	1
	.local	_.str.12
_.str.12:
	.asciz	"Night Market Opening"

	.section	.rodata._.str.13,"a",@progbits
	.balign	1
	.local	_.str.13
_.str.13:
	.asciz	"Open produce stalls raise Insects I spread by 15% and air travel by 10% for 16 cycles."

	.section	.rodata._.str.14,"a",@progbits
	.balign	1
	.local	_.str.14
_.str.14:
	.asciz	"School Exam Assembly"

	.section	.rodata._.str.15,"a",@progbits
	.balign	1
	.local	_.str.15
_.str.15:
	.asciz	"Packed examination rooms add 10% to blood-route spread and 10% to discovery for 8 cycles."

	.section	.rodata._.str.16,"a",@progbits
	.balign	1
	.local	_.str.16
_.str.16:
	.asciz	"Transit Union Rally"

	.section	.rodata._.str.17,"a",@progbits
	.balign	1
	.local	_.str.17
_.str.17:
	.asciz	"An indoor rally raises blood-route spread by 15% and air travel by 10% for 16 cycles."

	.section	.rodata._.str.18,"a",@progbits
	.balign	1
	.local	_.str.18
_.str.18:
	.asciz	"Indoor Esports Final"

	.section	.rodata._.str.19,"a",@progbits
	.balign	1
	.local	_.str.19
_.str.19:
	.asciz	"A packed arena adds 20% to air travel and 15% to Air I spread for 8 cycles."

	.section	.rodata._.str.20,"a",@progbits
	.balign	1
	.local	_.str.20
_.str.20:
	.asciz	"New Regional Air Link"

	.section	.rodata._.str.21,"a",@progbits
	.balign	1
	.local	_.str.21
_.str.21:
	.asciz	"A new route raises air travel by 15% and air travel by 10% for 16 cycles."

	.section	.rodata._.str.22,"a",@progbits
	.balign	1
	.local	_.str.22
_.str.22:
	.asciz	"Red-Eye Cabin Recirculation"

	.section	.rodata._.str.23,"a",@progbits
	.balign	1
	.local	_.str.23
_.str.23:
	.asciz	"Long recirculation raises air travel by 20% and discovery by 10% for 16 cycles."

	.section	.rodata._.str.24,"a",@progbits
	.balign	1
	.local	_.str.24
_.str.24:
	.asciz	"Sleeper Rail Through-Service"

	.section	.rodata._.str.25,"a",@progbits
	.balign	1
	.local	_.str.25
_.str.25:
	.asciz	"Overnight rail links add 15% to blood-route spread and 10% to air travel for 16 cycles."

	.section	.rodata._.str.26,"a",@progbits
	.balign	1
	.local	_.str.26
_.str.26:
	.asciz	"Coach Border Screening"

	.section	.rodata._.str.27,"a",@progbits
	.balign	1
	.local	_.str.27
_.str.27:
	.asciz	"A health checkpoint cuts air travel by 15% and adds 10% to discovery for 8 cycles."

	.section	.rodata._.str.28,"a",@progbits
	.balign	1
	.local	_.str.28
_.str.28:
	.asciz	"Crew Sick-Leave Roster"

	.section	.rodata._.str.29,"a",@progbits
	.balign	1
	.local	_.str.29
_.str.29:
	.asciz	"Fewer available crew cut air travel by 15% for 16 cycles in active regions."

	.section	.rodata._.str.30,"a",@progbits
	.balign	1
	.local	_.str.30
_.str.30:
	.asciz	"Rural Mail Flight"

	.section	.rodata._.str.31,"a",@progbits
	.balign	1
	.local	_.str.31
_.str.31:
	.asciz	"A chartered mail flight adds 15% to air travel and 10% to air travel for 8 cycles."

	.section	.rodata._.str.32,"a",@progbits
	.balign	1
	.local	_.str.32
_.str.32:
	.asciz	"Student Exchange Charter"

	.section	.rodata._.str.33,"a",@progbits
	.balign	1
	.local	_.str.33
_.str.33:
	.asciz	"An exchange charter raises air travel by 15% and blood-route spread by 10% for 16 cycles."

	.section	.rodata._.str.34,"a",@progbits
	.balign	1
	.local	_.str.34
_.str.34:
	.asciz	"Relief Bus Convoy"

	.section	.rodata._.str.35,"a",@progbits
	.balign	1
	.local	_.str.35
_.str.35:
	.asciz	"Displaced passengers raise air travel by 20% and blood-route spread by 10% for 16 cycles."

	.section	.rodata._.str.36,"a",@progbits
	.balign	1
	.local	_.str.36
_.str.36:
	.asciz	"Overnight Ferry Surge"

	.section	.rodata._.str.37,"a",@progbits
	.balign	1
	.local	_.str.37
_.str.37:
	.asciz	"An overnight ferry raises sea travel by 20% and Water I spread by 15% for 16 cycles."

	.section	.rodata._.str.38,"a",@progbits
	.balign	1
	.local	_.str.38
_.str.38:
	.asciz	"Airport Slot Pause"

	.section	.rodata._.str.39,"a",@progbits
	.balign	1
	.local	_.str.39
_.str.39:
	.asciz	"A temporary slot freeze blocks air travel for 8 cycles and slows air travel by 10%."

	.section	.rodata._.str.40,"a",@progbits
	.balign	1
	.local	_.str.40
_.str.40:
	.asciz	"Container Hub Shift"

	.section	.rodata._.str.41,"a",@progbits
	.balign	1
	.local	_.str.41
_.str.41:
	.asciz	"A new transshipment shift raises sea travel by 20% and Water I spread by 15% for 16 cycles."

	.section	.rodata._.str.42,"a",@progbits
	.balign	1
	.local	_.str.42
_.str.42:
	.asciz	"Reefer Door Failure"

	.section	.rodata._.str.43,"a",@progbits
	.balign	1
	.local	_.str.43
_.str.43:
	.asciz	"A spoiled cargo transfer adds 10% to sea travel and Livestock I spread for 16 cycles."

	.section	.rodata._.str.44,"a",@progbits
	.balign	1
	.local	_.str.44
_.str.44:
	.asciz	"Port Health Quarantine"

	.section	.rodata._.str.45,"a",@progbits
	.balign	1
	.local	_.str.45
_.str.45:
	.asciz	"A dockside quarantine blocks sea travel for 8 cycles and lifts discovery by 15%."

	.section	.rodata._.str.46,"a",@progbits
	.balign	1
	.local	_.str.46
_.str.46:
	.asciz	"Ballast Water Audit"

	.section	.rodata._.str.47,"a",@progbits
	.balign	1
	.local	_.str.47
_.str.47:
	.asciz	"Sampling delays ships by 10% but improves discovery by 20% for 16 cycles."

	.section	.rodata._.str.48,"a",@progbits
	.balign	1
	.local	_.str.48
_.str.48:
	.asciz	"Cold-Chain Fish Auction"

	.section	.rodata._.str.49,"a",@progbits
	.balign	1
	.local	_.str.49
_.str.49:
	.asciz	"A busy auction adds 15% to Water I spread and 10% to general spread for 8 cycles."

	.section	.rodata._.str.50,"a",@progbits
	.balign	1
	.local	_.str.50
_.str.50:
	.asciz	"Deckhand Sick Roster"

	.section	.rodata._.str.51,"a",@progbits
	.balign	1
	.local	_.str.51
_.str.51:
	.asciz	"Crew shortages reduce sea travel by 15% while blood-route spread rises 10% for 8 cycles."

	.section	.rodata._.str.52,"a",@progbits
	.balign	1
	.local	_.str.52
_.str.52:
	.asciz	"Canal Lock Closure"

	.section	.rodata._.str.53,"a",@progbits
	.balign	1
	.local	_.str.53
_.str.53:
	.asciz	"A damaged lock blocks sea travel for 16 cycles and reduces local spread by 10%."

	.section	.rodata._.str.54,"a",@progbits
	.balign	1
	.local	_.str.54
_.str.54:
	.asciz	"Grain Hold Rodents"

	.section	.rodata._.str.55,"a",@progbits
	.balign	1
	.local	_.str.55
_.str.55:
	.asciz	"Rodent sightings raise Rodents I spread by 20% and sea travel by 10% for 16 cycles."

	.section	.rodata._.str.56,"a",@progbits
	.balign	1
	.local	_.str.56
_.str.56:
	.asciz	"Inland Barge Relay"

	.section	.rodata._.str.57,"a",@progbits
	.balign	1
	.local	_.str.57
_.str.57:
	.asciz	"A river-to-port relay raises sea travel by 10% and local spread by 15% for 16 cycles."

	.section	.rodata._.str.58,"a",@progbits
	.balign	1
	.local	_.str.58
_.str.58:
	.asciz	"Customs Scanner Outage"

	.section	.rodata._.str.59,"a",@progbits
	.balign	1
	.local	_.str.59
_.str.59:
	.asciz	"A scanner outage raises sea travel by 15% and reduces discovery by 10% for 8 cycles."

	.section	.rodata._.str.60,"a",@progbits
	.balign	1
	.local	_.str.60
_.str.60:
	.asciz	"Monsoon Humidity Belt"

	.section	.rodata._.str.61,"a",@progbits
	.balign	1
	.local	_.str.61
_.str.61:
	.asciz	"Persistent rain raises Water I spread by 20% and local spread by 10% for 16 cycles."

	.section	.rodata._.str.62,"a",@progbits
	.balign	1
	.local	_.str.62
_.str.62:
	.asciz	"Desert Dust Front"

	.section	.rodata._.str.63,"a",@progbits
	.balign	1
	.local	_.str.63
_.str.63:
	.asciz	"Dust cuts air travel by 15% but raises Insects I spread by 15% for 8 cycles."

	.section	.rodata._.str.64,"a",@progbits
	.balign	1
	.local	_.str.64
_.str.64:
	.asciz	"Heat Haze Corridor"

	.section	.rodata._.str.65,"a",@progbits
	.balign	1
	.local	_.str.65
_.str.65:
	.asciz	"Hot, dry conditions raise Insects I spread by 20% and lower air travel by 10% for 16 cycles."

	.section	.rodata._.str.66,"a",@progbits
	.balign	1
	.local	_.str.66
_.str.66:
	.asciz	"Highland Cold Snap"

	.section	.rodata._.str.67,"a",@progbits
	.balign	1
	.local	_.str.67
_.str.67:
	.asciz	"A sudden cold snap cuts local spread by 15% and Livestock I spread by 10% for 8 cycles."

	.section	.rodata._.str.68,"a",@progbits
	.balign	1
	.local	_.str.68
_.str.68:
	.asciz	"Coastal Fog Bank"

	.section	.rodata._.str.69,"a",@progbits
	.balign	1
	.local	_.str.69
_.str.69:
	.asciz	"Low visibility cuts air travel by 20% and blocks it for 8 cycles."

	.section	.rodata._.str.70,"a",@progbits
	.balign	1
	.local	_.str.70
_.str.70:
	.asciz	"Freeze-Thaw Runoff"

	.section	.rodata._.str.71,"a",@progbits
	.balign	1
	.local	_.str.71
_.str.71:
	.asciz	"Runoff raises Water I spread by 15% and sea travel by 10% for 16 cycles."

	.section	.rodata._.str.72,"a",@progbits
	.balign	1
	.local	_.str.72
_.str.72:
	.asciz	"Dry-Season Wind Shift"

	.section	.rodata._.str.73,"a",@progbits
	.balign	1
	.local	_.str.73
_.str.73:
	.asciz	"Trade winds raise air travel by 10% and Air I spread by 15% for 16 cycles."

	.section	.rodata._.str.74,"a",@progbits
	.balign	1
	.local	_.str.74
_.str.74:
	.asciz	"Warm Wet Nights"

	.section	.rodata._.str.75,"a",@progbits
	.balign	1
	.local	_.str.75
_.str.75:
	.asciz	"Warm nights raise Insects I spread by 20% and local spread by 10% for 16 cycles."

	.section	.rodata._.str.76,"a",@progbits
	.balign	1
	.local	_.str.76
_.str.76:
	.asciz	"Snowbound Mountain Pass"

	.section	.rodata._.str.77,"a",@progbits
	.balign	1
	.local	_.str.77
_.str.77:
	.asciz	"Deep snow cuts local spread by 20% and general spread by 10% for 8 cycles."

	.section	.rodata._.str.78,"a",@progbits
	.balign	1
	.local	_.str.78
_.str.78:
	.asciz	"Wildfire Smoke Plume"

	.section	.rodata._.str.79,"a",@progbits
	.balign	1
	.local	_.str.79
_.str.79:
	.asciz	"Where Air I is evolved, smoke raises aerosol spread by 10% and discovery by 10% for 8 cycles."

	.section	.rodata._.str.80,"a",@progbits
	.balign	1
	.local	_.str.80
_.str.80:
	.asciz	"Chlorination Pump Failure"

	.section	.rodata._.str.81,"a",@progbits
	.balign	1
	.local	_.str.81
_.str.81:
	.asciz	"Untreated mains raise Water I spread by 20% and discovery by 10% for 16 cycles."

	.section	.rodata._.str.82,"a",@progbits
	.balign	1
	.local	_.str.82
_.str.82:
	.asciz	"Boil-Water Broadcast"

	.section	.rodata._.str.83,"a",@progbits
	.balign	1
	.local	_.str.83
_.str.83:
	.asciz	"Household boiling cuts Water I spread by 20% and adds 10% to discovery for 8 cycles."

	.section	.rodata._.str.84,"a",@progbits
	.balign	1
	.local	_.str.84
_.str.84:
	.asciz	"Leaking Neighborhood Main"

	.section	.rodata._.str.85,"a",@progbits
	.balign	1
	.local	_.str.85
_.str.85:
	.asciz	"Pressure loss raises Water I and blood-route spread by 10% for 16 cycles."

	.section	.rodata._.str.86,"a",@progbits
	.balign	1
	.local	_.str.86
_.str.86:
	.asciz	"Wastewater Bypass Release"

	.section	.rodata._.str.87,"a",@progbits
	.balign	1
	.local	_.str.87
_.str.87:
	.asciz	"A bypass adds 15% to Water I spread while sewage sampling lifts discovery 10% for 8 cycles."

	.section	.rodata._.str.88,"a",@progbits
	.balign	1
	.local	_.str.88
_.str.88:
	.asciz	"Mobile Test-Strip Drive"

	.section	.rodata._.str.89,"a",@progbits
	.balign	1
	.local	_.str.89
_.str.89:
	.asciz	"Field water tests reduce Water I spread by 10% and increase discovery by 15% for 16 cycles."

	.section	.rodata._.str.90,"a",@progbits
	.balign	1
	.local	_.str.90
_.str.90:
	.asciz	"Rural Wellhead Repair"

	.section	.rodata._.str.91,"a",@progbits
	.balign	1
	.local	_.str.91
_.str.91:
	.asciz	"A sealed well cuts Livestock I spread by 10% and Water I spread by 15% for 16 cycles."

	.section	.rodata._.str.92,"a",@progbits
	.balign	1
	.local	_.str.92
_.str.92:
	.asciz	"Flooded Sewage Lift Station"

	.section	.rodata._.str.93,"a",@progbits
	.balign	1
	.local	_.str.93
_.str.93:
	.asciz	"Overflow raises Water I spread by 15% and sea travel by 10% for 8 cycles."

	.section	.rodata._.str.94,"a",@progbits
	.balign	1
	.local	_.str.94
_.str.94:
	.asciz	"Shared Tanker Contamination"

	.section	.rodata._.str.95,"a",@progbits
	.balign	1
	.local	_.str.95
_.str.95:
	.asciz	"A contaminated tanker route raises Water I spread by 25% for 16 cycles."

	.section	.rodata._.str.96,"a",@progbits
	.balign	1
	.local	_.str.96
_.str.96:
	.asciz	"Chlorine Delivery Strike"

	.section	.rodata._.str.97,"a",@progbits
	.balign	1
	.local	_.str.97
_.str.97:
	.asciz	"A supply stoppage raises Water I spread by 15% and lowers research by 10% for 16 cycles."

	.section	.rodata._.str.98,"a",@progbits
	.balign	1
	.local	_.str.98
_.str.98:
	.asciz	"Aquifer Lab Consortium"

	.section	.rodata._.str.99,"a",@progbits
	.balign	1
	.local	_.str.99
_.str.99:
	.asciz	"Well sampling boosts discovery before detection and improves cure research after trials begin for 16 cycles."

	.section	.rodata._.str.100,"a",@progbits
	.balign	1
	.local	_.str.100
_.str.100:
	.asciz	"Mixed Herd Market Day"

	.section	.rodata._.str.101,"a",@progbits
	.balign	1
	.local	_.str.101
_.str.101:
	.asciz	"Animal mixing raises Livestock I spread by 20% and local spread by 10% for 16 cycles."

	.section	.rodata._.str.102,"a",@progbits
	.balign	1
	.local	_.str.102
_.str.102:
	.asciz	"Rookery Roost Expansion"

	.section	.rodata._.str.103,"a",@progbits
	.balign	1
	.local	_.str.103
_.str.103:
	.asciz	"A larger seasonal roost adds 25% to bird migration for 16 cycles when Birds I is evolved."

	.section	.rodata._.str.104,"a",@progbits
	.balign	1
	.local	_.str.104
_.str.104:
	.asciz	"Pig Barn Fan Failure"

	.section	.rodata._.str.105,"a",@progbits
	.balign	1
	.local	_.str.105
_.str.105:
	.asciz	"Poor ventilation raises Livestock I spread by 20% and air travel by 10% for 8 cycles."

	.section	.rodata._.str.106,"a",@progbits
	.balign	1
	.local	_.str.106
_.str.106:
	.asciz	"Vector Hatch Cycle"

	.section	.rodata._.str.107,"a",@progbits
	.balign	1
	.local	_.str.107
_.str.107:
	.asciz	"A warm hatch raises Insects I spread by 20% and local spread by 10% for 16 cycles."

	.section	.rodata._.str.108,"a",@progbits
	.balign	1
	.local	_.str.108
_.str.108:
	.asciz	"Urban Rat Feeding Ban"

	.section	.rodata._.str.109,"a",@progbits
	.balign	1
	.local	_.str.109
_.str.109:
	.asciz	"Sealed refuse cuts Rodents I spread by 20% and discovery rises 10% for 8 cycles."

	.section	.rodata._.str.110,"a",@progbits
	.balign	1
	.local	_.str.110
_.str.110:
	.asciz	"Wildlife Corridor Reopens"

	.section	.rodata._.str.111,"a",@progbits
	.balign	1
	.local	_.str.111
_.str.111:
	.asciz	"A reopened corridor adds 15% to bird migration and 10% to Livestock I spread for 16 cycles."

	.section	.rodata._.str.112,"a",@progbits
	.balign	1
	.local	_.str.112
_.str.112:
	.asciz	"Veterinary Vaccine Sweep"

	.section	.rodata._.str.113,"a",@progbits
	.balign	1
	.local	_.str.113
_.str.113:
	.asciz	"Animal testing cuts Livestock I spread by 15% and lifts discovery by 10% for 16 cycles."

	.section	.rodata._.str.114,"a",@progbits
	.balign	1
	.local	_.str.114
_.str.114:
	.asciz	"Poultry Transfer Pause"

	.section	.rodata._.str.115,"a",@progbits
	.balign	1
	.local	_.str.115
_.str.115:
	.asciz	"A veterinary hold reduces local spread by 15% and blocks sea traffic for 8 cycles."

	.section	.rodata._.str.116,"a",@progbits
	.balign	1
	.local	_.str.116
_.str.116:
	.asciz	"Mosquito Net Rollout"

	.section	.rodata._.str.117,"a",@progbits
	.balign	1
	.local	_.str.117
_.str.117:
	.asciz	"Net distribution cuts Insects I spread by 20% and raises discovery by 10% for 16 cycles."

	.section	.rodata._.str.118,"a",@progbits
	.balign	1
	.local	_.str.118
_.str.118:
	.asciz	"Grain Store Ratproofing"

	.section	.rodata._.str.119,"a",@progbits
	.balign	1
	.local	_.str.119
_.str.119:
	.asciz	"Sealed feed cuts Rodents I spread by 20% and general spread by 10% for 16 cycles."

	.section	.rodata._.str.120,"a",@progbits
	.balign	1
	.local	_.str.120
_.str.120:
	.asciz	"Clinic Triage Queue"

	.section	.rodata._.str.121,"a",@progbits
	.balign	1
	.local	_.str.121
_.str.121:
	.asciz	"Crowded intake raises blood-route spread by 15% and discovery by 10% for 8 cycles."

	.section	.rodata._.str.122,"a",@progbits
	.balign	1
	.local	_.str.122
_.str.122:
	.asciz	"Sterile Pack Delay"

	.section	.rodata._.str.123,"a",@progbits
	.balign	1
	.local	_.str.123
_.str.123:
	.asciz	"A delayed supply raises blood-route spread by 20% for 16 cycles in strained care regions."

	.section	.rodata._.str.124,"a",@progbits
	.balign	1
	.local	_.str.124
_.str.124:
	.asciz	"Lab Reagent Shortage"

	.section	.rodata._.str.125,"a",@progbits
	.balign	1
	.local	_.str.125
_.str.125:
	.asciz	"Missing reagents slow discovery before detection and cure research once laboratory trials begin for 16 cycles."

	.section	.rodata._.str.126,"a",@progbits
	.balign	1
	.local	_.str.126
_.str.126:
	.asciz	"Mobile Clinic Circuit"

	.section	.rodata._.str.127,"a",@progbits
	.balign	1
	.local	_.str.127
_.str.127:
	.asciz	"A traveling clinic lowers blood-route spread by 10% and raises discovery by 15% for 16 cycles."

	.section	.rodata._.str.128,"a",@progbits
	.balign	1
	.local	_.str.128
_.str.128:
	.asciz	"Ward Cohorting Protocol"

	.section	.rodata._.str.129,"a",@progbits
	.balign	1
	.local	_.str.129
_.str.129:
	.asciz	"Separating patients cuts blood-route spread by 15% and adds 10% to research for 16 cycles."

	.section	.rodata._.str.130,"a",@progbits
	.balign	1
	.local	_.str.130
_.str.130:
	.asciz	"Oxygen Hub Overload"

	.section	.rodata._.str.131,"a",@progbits
	.balign	1
	.local	_.str.131
_.str.131:
	.asciz	"Overfilled treatment raises blood-route spread by 10% and discovery by 15% for 8 cycles."

	.section	.rodata._.str.132,"a",@progbits
	.balign	1
	.local	_.str.132
_.str.132:
	.asciz	"Nurse Cross-Training"

	.section	.rodata._.str.133,"a",@progbits
	.balign	1
	.local	_.str.133
_.str.133:
	.asciz	"Cross-trained teams cut blood-route spread by 10% and add 15% to research for 16 cycles."

	.section	.rodata._.str.134,"a",@progbits
	.balign	1
	.local	_.str.134
_.str.134:
	.asciz	"Rural Ambulance Gap"

	.section	.rodata._.str.135,"a",@progbits
	.balign	1
	.local	_.str.135
_.str.135:
	.asciz	"Long transfers raise blood-route spread by 15% and local spread by 10% for 16 cycles."

	.section	.rodata._.str.136,"a",@progbits
	.balign	1
	.local	_.str.136
_.str.136:
	.asciz	"Protective Kit Shipment"

	.section	.rodata._.str.137,"a",@progbits
	.balign	1
	.local	_.str.137
_.str.137:
	.asciz	"A new protective-kit stock cuts blood-route spread by 20% for 16 cycles."

	.section	.rodata._.str.138,"a",@progbits
	.balign	1
	.local	_.str.138
_.str.138:
	.asciz	"Transfusion Trace Audit"

	.section	.rodata._.str.139,"a",@progbits
	.balign	1
	.local	_.str.139
_.str.139:
	.asciz	"Donor tracing cuts blood-route spread by 15% and boosts discovery by 15% for 16 cycles."

	.section	.rodata._.str.140,"a",@progbits
	.balign	1
	.local	_.str.140
_.str.140:
	.asciz	"Bacterial Culture Exchange"

	.section	.rodata._.str.141,"a",@progbits
	.balign	1
	.local	_.str.141
_.str.141:
	.asciz	"Shared bacterial cultures accelerate regional cure research."

	.section	.rodata._.str.142,"a",@progbits
	.balign	1
	.local	_.str.142
_.str.142:
	.asciz	"Viral Genome Review"

	.section	.rodata._.str.143,"a",@progbits
	.balign	1
	.local	_.str.143
_.str.143:
	.asciz	"New viral genome comparisons accelerate regional cure research."

	.section	.rodata._.str.144,"a",@progbits
	.balign	1
	.local	_.str.144
_.str.144:
	.asciz	"Fungal Sample Backlog"

	.section	.rodata._.str.145,"a",@progbits
	.balign	1
	.local	_.str.145
_.str.145:
	.asciz	"Slow fungal sample processing temporarily delays regional cure research."

	.section	.rodata._.str.146,"a",@progbits
	.balign	1
	.local	_.str.146
_.str.146:
	.asciz	"Field Cohort Consent"

	.section	.rodata._.str.147,"a",@progbits
	.balign	1
	.local	_.str.147
_.str.147:
	.asciz	"A consenting study cohort raises blood-route spread by 10% and cure research by 15% once trials begin, for 8 cycles."

	.section	.rodata._.str.148,"a",@progbits
	.balign	1
	.local	_.str.148
_.str.148:
	.asciz	"Assay Contamination Review"

	.section	.rodata._.str.149,"a",@progbits
	.balign	1
	.local	_.str.149
_.str.149:
	.asciz	"Recalled assays slow discovery before detection and cure research after laboratory trials begin for 8 cycles."

	.section	.rodata._.str.150,"a",@progbits
	.balign	1
	.local	_.str.150
_.str.150:
	.asciz	"Replication Protocol Release"

	.section	.rodata._.str.151,"a",@progbits
	.balign	1
	.local	_.str.151
_.str.151:
	.asciz	"A replicated protocol speeds discovery before detection and cure research after trials begin for 16 cycles."

	.section	.rodata._.str.152,"a",@progbits
	.balign	1
	.local	_.str.152
_.str.152:
	.asciz	"Sensitive Data Embargo"

	.section	.rodata._.str.153,"a",@progbits
	.balign	1
	.local	_.str.153
_.str.153:
	.asciz	"An embargo slows discovery before detection and cure research after trials begin for 16 cycles."

	.section	.rodata._.str.154,"a",@progbits
	.balign	1
	.local	_.str.154
_.str.154:
	.asciz	"Cross-Lab Proficiency Panel"

	.section	.rodata._.str.155,"a",@progbits
	.balign	1
	.local	_.str.155
_.str.155:
	.asciz	"Common reference samples raise research by 20% for 16 cycles."

	.section	.rodata._.str.156,"a",@progbits
	.balign	1
	.local	_.str.156
_.str.156:
	.asciz	"Research Server Outage"

	.section	.rodata._.str.157,"a",@progbits
	.balign	1
	.local	_.str.157
_.str.157:
	.asciz	"A server outage slows cure research after trials begin and discovery before detection for 8 cycles."

	.section	.rodata._.str.158,"a",@progbits
	.balign	1
	.local	_.str.158
_.str.158:
	.asciz	"Negative-Control Audit"

	.section	.rodata._.str.159,"a",@progbits
	.balign	1
	.local	_.str.159
_.str.159:
	.asciz	"Control audits speed discovery before detection and cure research after trials begin for 16 cycles."

	.section	.rodata._.str.160,"a",@progbits
	.balign	1
	.local	_.str.160
_.str.160:
	.asciz	"Mask Fit Campaign"

	.section	.rodata._.str.161,"a",@progbits
	.balign	1
	.local	_.str.161
_.str.161:
	.asciz	"Fit checks reduce Air I spread by 15% and discovery by 10% for 16 cycles."

	.section	.rodata._.str.162,"a",@progbits
	.balign	1
	.local	_.str.162
_.str.162:
	.asciz	"Asymptomatic Rumor Wave"

	.section	.rodata._.str.163,"a",@progbits
	.balign	1
	.local	_.str.163
_.str.163:
	.asciz	"A rumor suppresses discovery by 15% while general spread rises 10% for 8 cycles."

	.section	.rodata._.str.164,"a",@progbits
	.balign	1
	.local	_.str.164
_.str.164:
	.asciz	"Work-From-Home Week"

	.section	.rodata._.str.165,"a",@progbits
	.balign	1
	.local	_.str.165
_.str.165:
	.asciz	"Remote schedules lower general spread by 15% and local spread by 10% for 16 cycles."

	.section	.rodata._.str.166,"a",@progbits
	.balign	1
	.local	_.str.166
_.str.166:
	.asciz	"Handwashing Pledge Drive"

	.section	.rodata._.str.167,"a",@progbits
	.balign	1
	.local	_.str.167
_.str.167:
	.asciz	"A public pledge cuts blood-route spread by 15% and raises discovery by 10% for 8 cycles."

	.section	.rodata._.str.168,"a",@progbits
	.balign	1
	.local	_.str.168
_.str.168:
	.asciz	"Funeral Attendance Surge"

	.section	.rodata._.str.169,"a",@progbits
	.balign	1
	.local	_.str.169
_.str.169:
	.asciz	"Large memorial services raise general spread by 15% and discovery by 10% for 8 cycles."

	.section	.rodata._.str.170,"a",@progbits
	.balign	1
	.local	_.str.170
_.str.170:
	.asciz	"Community Testing Week"

	.section	.rodata._.str.171,"a",@progbits
	.balign	1
	.local	_.str.171
_.str.171:
	.asciz	"More voluntary testing raises discovery by 15% and lowers general spread by 10% for 16 cycles."

	.section	.rodata._.str.172,"a",@progbits
	.balign	1
	.local	_.str.172
_.str.172:
	.asciz	"School Door Closure"

	.section	.rodata._.str.173,"a",@progbits
	.balign	1
	.local	_.str.173
_.str.173:
	.asciz	"A temporary closure lowers general spread by 15% and adds 10% to discovery for 16 cycles."

	.section	.rodata._.str.174,"a",@progbits
	.balign	1
	.local	_.str.174
_.str.174:
	.asciz	"Cure Rumor Reversal"

	.section	.rodata._.str.175,"a",@progbits
	.balign	1
	.local	_.str.175
_.str.175:
	.asciz	"A corrected rumor raises general spread by 10% and cure research by 10% once trials begin, for 8 cycles."

	.section	.rodata._.str.176,"a",@progbits
	.balign	1
	.local	_.str.176
_.str.176:
	.asciz	"Volunteer Supply Drops"

	.section	.rodata._.str.177,"a",@progbits
	.balign	1
	.local	_.str.177
_.str.177:
	.asciz	"Doorstep deliveries cut general spread by 10% and local spread by 10% for 16 cycles."

	.section	.rodata._.str.178,"a",@progbits
	.balign	1
	.local	_.str.178
_.str.178:
	.asciz	"Compliance Fatigue Break"

	.section	.rodata._.str.179,"a",@progbits
	.balign	1
	.local	_.str.179
_.str.179:
	.asciz	"A lull in precautions raises general spread by 15% and lowers research by 10% for 8 cycles."

	.section	.rodata._.str.180,"a",@progbits
	.balign	1
	.local	_.str.180
_.str.180:
	.asciz	"Regional Grid Brownout"

	.section	.rodata._.str.181,"a",@progbits
	.balign	1
	.local	_.str.181
_.str.181:
	.asciz	"A brownout slows air travel by 10% and research by 15% for 8 cycles."

	.section	.rodata._.str.182,"a",@progbits
	.balign	1
	.local	_.str.182
_.str.182:
	.asciz	"Telecom Backbone Cut"

	.section	.rodata._.str.183,"a",@progbits
	.balign	1
	.local	_.str.183
_.str.183:
	.asciz	"A severed network slows discovery before detection and cure research after trials begin for 16 cycles."

	.section	.rodata._.str.184,"a",@progbits
	.balign	1
	.local	_.str.184
_.str.184:
	.asciz	"Cold-Store Warehouse Fault"

	.section	.rodata._.str.185,"a",@progbits
	.balign	1
	.local	_.str.185
_.str.185:
	.asciz	"A failed cold store raises Livestock I spread by 15% and sea travel by 10% for 16 cycles."

	.section	.rodata._.str.186,"a",@progbits
	.balign	1
	.local	_.str.186
_.str.186:
	.asciz	"Water Pumping Blackout"

	.section	.rodata._.str.187,"a",@progbits
	.balign	1
	.local	_.str.187
_.str.187:
	.asciz	"A power cut raises Water I spread by 15% and lowers research by 10% for 8 cycles."

	.section	.rodata._.str.188,"a",@progbits
	.balign	1
	.local	_.str.188
_.str.188:
	.asciz	"Runway Resurfacing Window"

	.section	.rodata._.str.189,"a",@progbits
	.balign	1
	.local	_.str.189
_.str.189:
	.asciz	"Runway works block air travel for 8 cycles and lower air travel by 10%."

	.section	.rodata._.str.190,"a",@progbits
	.balign	1
	.local	_.str.190
_.str.190:
	.asciz	"Bridge Washout Detour"

	.section	.rodata._.str.191,"a",@progbits
	.balign	1
	.local	_.str.191
_.str.191:
	.asciz	"A washed-out bridge cuts local spread by 20% and general spread by 10% for 8 cycles."

	.section	.rodata._.str.192,"a",@progbits
	.balign	1
	.local	_.str.192
_.str.192:
	.asciz	"Port Crane Labor Strike"

	.section	.rodata._.str.193,"a",@progbits
	.balign	1
	.local	_.str.193
_.str.193:
	.asciz	"Idle cranes block sea travel for 8 cycles and lower local spread by 10%."

	.section	.rodata._.str.194,"a",@progbits
	.balign	1
	.local	_.str.194
_.str.194:
	.asciz	"Cell Broadcast Alert"

	.section	.rodata._.str.195,"a",@progbits
	.balign	1
	.local	_.str.195
_.str.195:
	.asciz	"A reliable emergency alert raises discovery by 20% and lowers general spread by 10% for 16 cycles."

	.section	.rodata._.str.196,"a",@progbits
	.balign	1
	.local	_.str.196
_.str.196:
	.asciz	"Grid Backup Generator"

	.section	.rodata._.str.197,"a",@progbits
	.balign	1
	.local	_.str.197
_.str.197:
	.asciz	"Backup power improves cure research after trials begin and discovery before detection for 16 cycles."

	.section	.rodata._.str.198,"a",@progbits
	.balign	1
	.local	_.str.198
_.str.198:
	.asciz	"Municipal Pressure Restore"

	.section	.rodata._.str.199,"a",@progbits
	.balign	1
	.local	_.str.199
_.str.199:
	.asciz	"Stable mains cut Water I spread by 15% and lift discovery by 10% for 16 cycles."

	.section	.rodata._.str.200,"a",@progbits
	.balign	1
	.local	_.str.200
_.str.200:
	.asciz	"Games Delegations Arrive"

	.section	.rodata._.str.201,"a",@progbits
	.balign	1
	.local	_.str.201
_.str.201:
	.asciz	"International teams raise air travel by 15% and air travel by 10% for 16 cycles."

	.section	.rodata._.str.202,"a",@progbits
	.balign	1
	.local	_.str.202
_.str.202:
	.asciz	"Games Entry Plan"

	.section	.rodata._.str.203,"a",@progbits
	.balign	1
	.local	_.str.203
_.str.203:
	.asciz	"Entry checks lower air travel by 10% while arena crowd plans are reviewed."

	.section	.rodata._.str.204,"a",@progbits
	.balign	1
	.local	_.str.204
_.str.204:
	.asciz	"Venue Air Plan"

	.section	.rodata._.str.205,"a",@progbits
	.balign	1
	.local	_.str.205
_.str.205:
	.asciz	"Distributed events cut Air I spread by 20% and air travel by 10% for 16 cycles."

	.section	.rodata._.str.206,"a",@progbits
	.balign	1
	.local	_.str.206
_.str.206:
	.asciz	"Finals Crowd Surge"

	.section	.rodata._.str.207,"a",@progbits
	.balign	1
	.local	_.str.207
_.str.207:
	.asciz	"Sold-out finals raise blood-route spread by 15% and discovery by 10% for 16 cycles."

	.section	.rodata._.str.208,"a",@progbits
	.balign	1
	.local	_.str.208
_.str.208:
	.asciz	"Athlete Village Dispersal"

	.section	.rodata._.str.209,"a",@progbits
	.balign	1
	.local	_.str.209
_.str.209:
	.asciz	"Departing teams raise air travel by 10% for 16 cycles."

	.section	.rodata._.str.210,"a",@progbits
	.balign	1
	.local	_.str.210
_.str.210:
	.asciz	"Festival Campgrounds Open"

	.section	.rodata._.str.211,"a",@progbits
	.balign	1
	.local	_.str.211
_.str.211:
	.asciz	"Shared campground taps raise Water I spread by 15% and general spread by 10% for 16 cycles."

	.section	.rodata._.str.212,"a",@progbits
	.balign	1
	.local	_.str.212
_.str.212:
	.asciz	"Festival Hygiene Drive"

	.section	.rodata._.str.213,"a",@progbits
	.balign	1
	.local	_.str.213
_.str.213:
	.asciz	"Handwashing stations at food stalls cut general spread by 10% during the festival."

	.section	.rodata._.str.214,"a",@progbits
	.balign	1
	.local	_.str.214
_.str.214:
	.asciz	"Vector Screens Hold"

	.section	.rodata._.str.215,"a",@progbits
	.balign	1
	.local	_.str.215
_.str.215:
	.asciz	"Larval screening cuts Insects I spread by 20% and air travel by 10% for 16 cycles."

	.section	.rodata._.str.216,"a",@progbits
	.balign	1
	.local	_.str.216
_.str.216:
	.asciz	"Late-Night Stalls Expand"

	.section	.rodata._.str.217,"a",@progbits
	.balign	1
	.local	_.str.217
_.str.217:
	.asciz	"Unscreened stalls raise Insects I spread by 20% and general spread by 10% for 16 cycles."

	.section	.rodata._.str.218,"a",@progbits
	.balign	1
	.local	_.str.218
_.str.218:
	.asciz	"Festival Routes Clear"

	.section	.rodata._.str.219,"a",@progbits
	.balign	1
	.local	_.str.219
_.str.219:
	.asciz	"Crowd dispersal adds 10% to air travel for 16 cycles."

	.section	.rodata._.str.220,"a",@progbits
	.balign	1
	.local	_.str.220
_.str.220:
	.asciz	"Open Cure Notebook"

	.section	.rodata._.str.221,"a",@progbits
	.balign	1
	.local	_.str.221
_.str.221:
	.asciz	"Shared case notes speed discovery before detection and cure research once trials begin for 16 cycles."

	.section	.rodata._.str.222,"a",@progbits
	.balign	1
	.local	_.str.222
_.str.222:
	.asciz	"Shared Cure Data Review"

	.section	.rodata._.str.223,"a",@progbits
	.balign	1
	.local	_.str.223
_.str.223:
	.asciz	"Researchers compare case notes, raising cure research by 10% once research is active."

	.section	.rodata._.str.224,"a",@progbits
	.balign	1
	.local	_.str.224
_.str.224:
	.asciz	"Replicated Cure Leads"

	.section	.rodata._.str.225,"a",@progbits
	.balign	1
	.local	_.str.225
_.str.225:
	.asciz	"Replicated findings raise research by 20% for 16 cycles."

	.section	.rodata._.str.226,"a",@progbits
	.balign	1
	.local	_.str.226
_.str.226:
	.asciz	"Unvetted Cure Recipes"

	.section	.rodata._.str.227,"a",@progbits
	.balign	1
	.local	_.str.227
_.str.227:
	.asciz	"Unverified recipes slow discovery before detection and cure research after trials begin for 16 cycles."

	.section	.rodata._.str.228,"a",@progbits
	.balign	1
	.local	_.str.228
_.str.228:
	.asciz	"Clinical Notes Consolidated"

	.section	.rodata._.str.229,"a",@progbits
	.balign	1
	.local	_.str.229
_.str.229:
	.asciz	"A consolidated protocol raises research by 10% for 16 cycles."

	.section	.rodata._.str.230,"a",@progbits
	.balign	1
	.local	_.str.230
_.str.230:
	.asciz	"First Clinic Cluster"

	.section	.rodata._.str.231,"a",@progbits
	.balign	1
	.local	_.str.231
_.str.231:
	.asciz	"A traceable clinic cluster raises discovery by 20% and blood-route spread by 10% for 16 cycles."

	.section	.rodata._.str.232,"a",@progbits
	.balign	1
	.local	_.str.232
_.str.232:
	.asciz	"Spaced Contact Interviews"

	.section	.rodata._.str.233,"a",@progbits
	.balign	1
	.local	_.str.233
_.str.233:
	.asciz	"Separated interview rooms cut general spread by 10% while contact tracing expands."

	.section	.rodata._.str.234,"a",@progbits
	.balign	1
	.local	_.str.234
_.str.234:
	.asciz	"Contact Trace Starts Early"

	.section	.rodata._.str.235,"a",@progbits
	.balign	1
	.local	_.str.235
_.str.235:
	.asciz	"Confirmed contacts focus regional research and reduce local spread while clinics trace the first infection."

	.section	.rodata._.str.236,"a",@progbits
	.balign	1
	.local	_.str.236
_.str.236:
	.asciz	"Contact Trace Arrives Late"

	.section	.rodata._.str.237,"a",@progbits
	.balign	1
	.local	_.str.237
_.str.237:
	.asciz	"Delayed contact tracing allows local spread; investigators still contribute to regional cure research."

	.section	.rodata._.str.238,"a",@progbits
	.balign	1
	.local	_.str.238
_.str.238:
	.asciz	"Clinic Register Reconciled"

	.section	.rodata._.str.239,"a",@progbits
	.balign	1
	.local	_.str.239
_.str.239:
	.asciz	"Updated records help trace infections and support regional cure research while this response is active."

	.section	.rodata._.str.240,"a",@progbits
	.balign	1
	.local	_.str.240
_.str.240:
	.asciz	"Terminal Filter Inspection"

	.section	.rodata._.str.241,"a",@progbits
	.balign	1
	.local	_.str.241
_.str.241:
	.asciz	"A filter inspection raises discovery by 10% and cuts air travel by 10% for 16 cycles."

	.section	.rodata._.str.242,"a",@progbits
	.balign	1
	.local	_.str.242
_.str.242:
	.asciz	"Terminal Filter Sweep"

	.section	.rodata._.str.243,"a",@progbits
	.balign	1
	.local	_.str.243
_.str.243:
	.asciz	"The airport filter sweep cuts air travel by 10% during the sanitation check."

	.section	.rodata._.str.244,"a",@progbits
	.balign	1
	.local	_.str.244
_.str.244:
	.asciz	"Filter Stock Reaches Hubs"

	.section	.rodata._.str.245,"a",@progbits
	.balign	1
	.local	_.str.245
_.str.245:
	.asciz	"Working filters cut Air I spread by 20% and air travel by 10% for 16 cycles."

	.section	.rodata._.str.246,"a",@progbits
	.balign	1
	.local	_.str.246
_.str.246:
	.asciz	"Ventilation Ducts Stay Open"

	.section	.rodata._.str.247,"a",@progbits
	.balign	1
	.local	_.str.247
_.str.247:
	.asciz	"Unfiltered ducts raise Air I spread by 15% and air travel by 10% for 16 cycles."

	.section	.rodata._.str.248,"a",@progbits
	.balign	1
	.local	_.str.248
_.str.248:
	.asciz	"Airflow Audit Closes"

	.section	.rodata._.str.249,"a",@progbits
	.balign	1
	.local	_.str.249
_.str.249:
	.asciz	"Harbor Discharge Sampling"

	.section	.rodata._.str.250,"a",@progbits
	.balign	1
	.local	_.str.250
_.str.250:
	.asciz	"Harbor sampling raises discovery by 10% and Water I spread by 10% for 16 cycles."

	.section	.rodata._.str.251,"a",@progbits
	.balign	1
	.local	_.str.251
_.str.251:
	.asciz	"Ballast Sample Hold"

	.section	.rodata._.str.252,"a",@progbits
	.balign	1
	.local	_.str.252
_.str.252:
	.asciz	"Sampling delays lower sea travel by 10% while untreated ballast is checked."

	.section	.rodata._.str.253,"a",@progbits
	.balign	1
	.local	_.str.253
_.str.253:
	.asciz	"Ballast Treatment Holds"

	.section	.rodata._.str.254,"a",@progbits
	.balign	1
	.local	_.str.254
_.str.254:
	.asciz	"Treatment cuts Water I spread by 20% and sea travel by 10% for 16 cycles."

	.section	.rodata._.str.255,"a",@progbits
	.balign	1
	.local	_.str.255
_.str.255:
	.asciz	"Untreated Ballast Release"

	.section	.rodata._.str.256,"a",@progbits
	.balign	1
	.local	_.str.256
_.str.256:
	.asciz	"Untreated discharge raises Water I spread by 20% and sea travel by 10% for 16 cycles."

	.section	.rodata._.str.257,"a",@progbits
	.balign	1
	.local	_.str.257
_.str.257:
	.asciz	"Harbor Water Recheck"

	.section	.rodata._.str.258,"a",@progbits
	.balign	1
	.local	_.str.258
_.str.258:
	.asciz	"Seasonal Flyway Opens"

	.section	.rodata._.str.259,"a",@progbits
	.balign	1
	.local	_.str.259
_.str.259:
	.asciz	"A seasonal flyway raises bird migration by 20% for 16 cycles when Birds I is evolved."

	.section	.rodata._.str.260,"a",@progbits
	.balign	1
	.local	_.str.260
_.str.260:
	.asciz	"Flyway Watch Teams"

	.section	.rodata._.str.261,"a",@progbits
	.balign	1
	.local	_.str.261
_.str.261:
	.asciz	"Watch teams cut bird bird migration by 10% as seasonal counts are compared."

	.section	.rodata._.str.262,"a",@progbits
	.balign	1
	.local	_.str.262
_.str.262:
	.asciz	"Rest Stop Route Thins"

	.section	.rodata._.str.263,"a",@progbits
	.balign	1
	.local	_.str.263
_.str.263:
	.asciz	"Loss of a roost cuts bird migration by 25% for 16 cycles when Birds I is evolved."

	.section	.rodata._.str.264,"a",@progbits
	.balign	1
	.local	_.str.264
_.str.264:
	.asciz	"Wetland Rest Stops Fill"

	.section	.rodata._.str.265,"a",@progbits
	.balign	1
	.local	_.str.265
_.str.265:
	.asciz	"Busy roosts raise bird migration by 25% for 16 cycles when Birds I is evolved."

	.section	.rodata._.str.266,"a",@progbits
	.balign	1
	.local	_.str.266
_.str.266:
	.asciz	"Flyway Traffic Settles"

	.section	.rodata._.str.267,"a",@progbits
	.balign	1
	.local	_.str.267
_.str.267:
	.asciz	"Migration remains 10% higher as seasonal bird routes finish for 16 cycles."

	.section	.rodata._.str.268,"a",@progbits
	.balign	1
	.local	_.str.268
_.str.268:
	.asciz	"Mixed Herd Auction"

	.section	.rodata._.str.269,"a",@progbits
	.balign	1
	.local	_.str.269
_.str.269:
	.asciz	"Mixed pens raise Livestock I spread by 20% and local spread by 10% for 16 cycles."

	.section	.rodata._.str.270,"a",@progbits
	.balign	1
	.local	_.str.270
_.str.270:
	.asciz	"Livestock Gate Checks"

	.section	.rodata._.str.271,"a",@progbits
	.balign	1
	.local	_.str.271
_.str.271:
	.asciz	"Gate checks cut Livestock I spread by 10% before herd movement is reviewed."

	.section	.rodata._.str.272,"a",@progbits
	.balign	1
	.local	_.str.272
_.str.272:
	.asciz	"Farm Gate Biosecurity"

	.section	.rodata._.str.273,"a",@progbits
	.balign	1
	.local	_.str.273
_.str.273:
	.asciz	"Owned livestock controls cut Livestock I spread by 20% and raise discovery by 10% for 16 cycles."

	.section	.rodata._.str.274,"a",@progbits
	.balign	1
	.local	_.str.274
_.str.274:
	.asciz	"Auction Pens Remain Mixed"

	.section	.rodata._.str.275,"a",@progbits
	.balign	1
	.local	_.str.275
_.str.275:
	.asciz	"Unscreened pens raise Livestock I spread by 20% and local spread by 10% for 16 cycles."

	.section	.rodata._.str.276,"a",@progbits
	.balign	1
	.local	_.str.276
_.str.276:
	.asciz	"Herd Movement Register"

	.section	.rodata._.str.277,"a",@progbits
	.balign	1
	.local	_.str.277
_.str.277:
	.asciz	"Warm-Season Hatch"

	.section	.rodata._.str.278,"a",@progbits
	.balign	1
	.local	_.str.278
_.str.278:
	.asciz	"Vector Mapping Sweep"

	.section	.rodata._.str.279,"a",@progbits
	.balign	1
	.local	_.str.279
_.str.279:
	.asciz	"Mapped breeding sites cut Insects I spread by 10% during the survey."

	.section	.rodata._.str.280,"a",@progbits
	.balign	1
	.local	_.str.280
_.str.280:
	.asciz	"Larvicide Grid Covers Town"

	.section	.rodata._.str.281,"a",@progbits
	.balign	1
	.local	_.str.281
_.str.281:
	.asciz	"Owned insect controls cut Insects I spread by 20% and local spread by 10% for 16 cycles."

	.section	.rodata._.str.282,"a",@progbits
	.balign	1
	.local	_.str.282
_.str.282:
	.asciz	"Unmapped Ponds Breed Vectors"

	.section	.rodata._.str.283,"a",@progbits
	.balign	1
	.local	_.str.283
_.str.283:
	.asciz	"Untreated ponds raise Insects I spread by 20% and general spread by 10% for 16 cycles."

	.section	.rodata._.str.284,"a",@progbits
	.balign	1
	.local	_.str.284
_.str.284:
	.asciz	"Vector Survey Repeats"

	.section	.rodata._.str.285,"a",@progbits
	.balign	1
	.local	_.str.285
_.str.285:
	.asciz	"Market Grain Spill"

	.section	.rodata._.str.286,"a",@progbits
	.balign	1
	.local	_.str.286
_.str.286:
	.asciz	"Loose grain raises Rodents I spread by 20% and general spread by 10% for 16 cycles."

	.section	.rodata._.str.287,"a",@progbits
	.balign	1
	.local	_.str.287
_.str.287:
	.asciz	"Night Refuse Pickup"

	.section	.rodata._.str.288,"a",@progbits
	.balign	1
	.local	_.str.288
_.str.288:
	.asciz	"Night refuse pickup cuts general spread by 10% while rodent access is assessed."

	.section	.rodata._.str.289,"a",@progbits
	.balign	1
	.local	_.str.289
_.str.289:
	.asciz	"Waste Bins Seal"

	.section	.rodata._.str.290,"a",@progbits
	.balign	1
	.local	_.str.290
_.str.290:
	.asciz	"A well-adopted cleanup cuts Rodents I spread by 20% and general spread by 10% for 16 cycles."

	.section	.rodata._.str.291,"a",@progbits
	.balign	1
	.local	_.str.291
_.str.291:
	.asciz	"Alleys Stay Accessible"

	.section	.rodata._.str.292,"a",@progbits
	.balign	1
	.local	_.str.292
_.str.292:
	.asciz	"Dense activity leaves Rodents I spread 20% higher and discovery 10% lower for 16 cycles."

	.section	.rodata._.str.293,"a",@progbits
	.balign	1
	.local	_.str.293
_.str.293:
	.asciz	"Night Traps Reset"

	.section	.rodata._.str.294,"a",@progbits
	.balign	1
	.local	_.str.294
_.str.294:
	.asciz	"Continued trapping cuts Rodents I spread by 10% for 16 cycles."

	.section	.rodata._.str.295,"a",@progbits
	.balign	1
	.local	_.str.295
_.str.295:
	.asciz	"River Gauge Overtops"

	.section	.rodata._.str.296,"a",@progbits
	.balign	1
	.local	_.str.296
_.str.296:
	.asciz	"Flooded wells strengthen Water transmission while damaged laboratories slow regional cure research."

	.section	.rodata._.str.297,"a",@progbits
	.balign	1
	.local	_.str.297
_.str.297:
	.asciz	"Floodwater Intake Watch"

	.section	.rodata._.str.298,"a",@progbits
	.balign	1
	.local	_.str.298
_.str.298:
	.asciz	"Temporary intake controls cut sea travel by 10% while floodwater is sampled."

	.section	.rodata._.str.299,"a",@progbits
	.balign	1
	.local	_.str.299
_.str.299:
	.asciz	"Water Test Teams Arrive"

	.section	.rodata._.str.300,"a",@progbits
	.balign	1
	.local	_.str.300
_.str.300:
	.asciz	"A high death toll brings tests that cut Water I spread by 20% and lift discovery by 15% for 16 cycles."

	.section	.rodata._.str.301,"a",@progbits
	.balign	1
	.local	_.str.301
_.str.301:
	.asciz	"Lowland Wells Stay Submerged"

	.section	.rodata._.str.302,"a",@progbits
	.balign	1
	.local	_.str.302
_.str.302:
	.asciz	"Submerged wells raise Water I spread by 25% and lower discovery by 10% for 16 cycles."

	.section	.rodata._.str.303,"a",@progbits
	.balign	1
	.local	_.str.303
_.str.303:
	.asciz	"Pumps Drain Floodplain"

	.section	.rodata._.str.304,"a",@progbits
	.balign	1
	.local	_.str.304
_.str.304:
	.asciz	"Recovery pumping cuts Water I spread by 10% and raises research by 10% for 16 cycles."

	.section	.rodata._.str.305,"a",@progbits
	.balign	1
	.local	_.str.305
_.str.305:
	.asciz	"Seismic Lab Shutdown"

	.section	.rodata._.str.306,"a",@progbits
	.balign	1
	.local	_.str.306
_.str.306:
	.asciz	"Shaken labs lower research by 15% while local spread rises 10% for 16 cycles."

	.section	.rodata._.str.307,"a",@progbits
	.balign	1
	.local	_.str.307
_.str.307:
	.asciz	"Emergency Lab Relay"

	.section	.rodata._.str.308,"a",@progbits
	.balign	1
	.local	_.str.308
_.str.308:
	.asciz	"A portable lab relay raises cure research by 10% once research is active."

	.section	.rodata._.str.309,"a",@progbits
	.balign	1
	.local	_.str.309
_.str.309:
	.asciz	"Backup Lab Network Restored"

	.section	.rodata._.str.310,"a",@progbits
	.balign	1
	.local	_.str.310
_.str.310:
	.asciz	"A coordinated rebuild speeds cure research after trials begin and discovery before detection for 16 cycles."

	.section	.rodata._.str.311,"a",@progbits
	.balign	1
	.local	_.str.311
_.str.311:
	.asciz	"Power Relays Remain Damaged"

	.section	.rodata._.str.312,"a",@progbits
	.balign	1
	.local	_.str.312
_.str.312:
	.asciz	"Ongoing outages slow cure research after trials begin and discovery before detection for 16 cycles."

	.section	.rodata._.str.313,"a",@progbits
	.balign	1
	.local	_.str.313
_.str.313:
	.asciz	"Sample Freezers Rechecked"

	.section	.rodata._.str.314,"a",@progbits
	.balign	1
	.local	_.str.314
_.str.314:
	.asciz	"Storm Surge Reaches Docks"

	.section	.rodata._.str.315,"a",@progbits
	.balign	1
	.local	_.str.315
_.str.315:
	.asciz	"Surge water raises Water I spread by 15% and cuts sea travel by 10% for 16 cycles."

	.section	.rodata._.str.316,"a",@progbits
	.balign	1
	.local	_.str.316
_.str.316:
	.asciz	"Harbor Closure Review"

	.section	.rodata._.str.317,"a",@progbits
	.balign	1
	.local	_.str.317
_.str.317:
	.asciz	"A harbor review cuts sea travel by 10% as crews test the disinfection plan."

	.section	.rodata._.str.318,"a",@progbits
	.balign	1
	.local	_.str.318
_.str.318:
	.asciz	"Harbor Disinfection Crews"

	.section	.rodata._.str.319,"a",@progbits
	.balign	1
	.local	_.str.319
_.str.319:
	.asciz	"Treatment cuts Water I spread by 20% and restores sea travel by 10% for 16 cycles."

	.section	.rodata._.str.320,"a",@progbits
	.balign	1
	.local	_.str.320
_.str.320:
	.asciz	"Harbor Closure Persists"

	.section	.rodata._.str.321,"a",@progbits
	.balign	1
	.local	_.str.321
_.str.321:
	.asciz	"An unsafe harbor blocks sea travel for 16 cycles and raises discovery by 10%."

	.section	.rodata._.str.322,"a",@progbits
	.balign	1
	.local	_.str.322
_.str.322:
	.asciz	"Coastal Intake Reopens"

	.section	.rodata._.str.323,"a",@progbits
	.balign	1
	.local	_.str.323
_.str.323:
	.asciz	"Follow-up samples cut Water I spread by 10% and raise discovery by 10% for 16 cycles."

	.section	.rodata._.str.324,"a",@progbits
	.balign	1
	.local	_.str.324
_.str.324:
	.asciz	"Heatwave Shelter Demand"

	.section	.rodata._.str.325,"a",@progbits
	.balign	1
	.local	_.str.325
_.str.325:
	.asciz	"Heat conditions reduce local spread by 20%. Matching adaptation halves this temporary penalty."

	.section	.rodata._.str.326,"a",@progbits
	.balign	1
	.local	_.str.326
_.str.326:
	.asciz	"Cooling Center Check-In"

	.section	.rodata._.str.327,"a",@progbits
	.balign	1
	.local	_.str.327
_.str.327:
	.asciz	"Heat conditions reduce local spread by 25%. Matching adaptation halves this temporary penalty."

	.section	.rodata._.str.328,"a",@progbits
	.balign	1
	.local	_.str.328
_.str.328:
	.asciz	"Cooling Halls Relieve Crowding"

	.section	.rodata._.str.329,"a",@progbits
	.balign	1
	.local	_.str.329
_.str.329:
	.asciz	"Heat conditions reduce local spread by 10%. Matching adaptation halves this temporary penalty."

	.section	.rodata._.str.330,"a",@progbits
	.balign	1
	.local	_.str.330
_.str.330:
	.asciz	"Night Cooling Fails"

	.section	.rodata._.str.331,"a",@progbits
	.balign	1
	.local	_.str.331
_.str.331:
	.asciz	"Heat conditions reduce local spread by 30%. Matching adaptation halves this temporary penalty."

	.section	.rodata._.str.332,"a",@progbits
	.balign	1
	.local	_.str.332
_.str.332:
	.asciz	"Heat Clinics Keep Hours"

	.section	.rodata._.str.333,"a",@progbits
	.balign	1
	.local	_.str.333
_.str.333:
	.asciz	"Winter Shelter Census"

	.section	.rodata._.str.334,"a",@progbits
	.balign	1
	.local	_.str.334
_.str.334:
	.asciz	"Cold conditions reduce local spread by 20%. Matching adaptation halves this temporary penalty."

	.section	.rodata._.str.335,"a",@progbits
	.balign	1
	.local	_.str.335
_.str.335:
	.asciz	"Winter Shelter Roster"

	.section	.rodata._.str.336,"a",@progbits
	.balign	1
	.local	_.str.336
_.str.336:
	.asciz	"Cold conditions reduce local spread by 25%. Matching adaptation halves this temporary penalty."

	.section	.rodata._.str.337,"a",@progbits
	.balign	1
	.local	_.str.337
_.str.337:
	.asciz	"Cold-Weather Clinics Open"

	.section	.rodata._.str.338,"a",@progbits
	.balign	1
	.local	_.str.338
_.str.338:
	.asciz	"Cold conditions reduce local spread by 10%. Matching adaptation halves this temporary penalty."

	.section	.rodata._.str.339,"a",@progbits
	.balign	1
	.local	_.str.339
_.str.339:
	.asciz	"Shelter Intake Overflows"

	.section	.rodata._.str.340,"a",@progbits
	.balign	1
	.local	_.str.340
_.str.340:
	.asciz	"Cold conditions reduce local spread by 30%. Matching adaptation halves this temporary penalty."

	.section	.rodata._.str.341,"a",@progbits
	.balign	1
	.local	_.str.341
_.str.341:
	.asciz	"Spring Ventilation Checks"

	.section	.rodata._.str.342,"a",@progbits
	.balign	1
	.local	_.str.342
_.str.342:
	.asciz	"Reservoir Allocation Tightens"

	.section	.rodata._.str.343,"a",@progbits
	.balign	1
	.local	_.str.343
_.str.343:
	.asciz	"Water shortages raise Water I spread by 10% and lower discovery by 10% for 16 cycles."

	.section	.rodata._.str.344,"a",@progbits
	.balign	1
	.local	_.str.344
_.str.344:
	.asciz	"Water Queue Testing"

	.section	.rodata._.str.345,"a",@progbits
	.balign	1
	.local	_.str.345
_.str.345:
	.asciz	"Shared tanker queues raise general spread by 10% before drought water tests begin."

	.section	.rodata._.str.346,"a",@progbits
	.balign	1
	.local	_.str.346
_.str.346:
	.asciz	"Rural Tankers Are Tested"

	.section	.rodata._.str.347,"a",@progbits
	.balign	1
	.local	_.str.347
_.str.347:
	.asciz	"Testing cuts Water I spread by 15% and lifts discovery by 15% for 16 cycles."

	.section	.rodata._.str.348,"a",@progbits
	.balign	1
	.local	_.str.348
_.str.348:
	.asciz	"Unsealed Tanker Stops"

	.section	.rodata._.str.349,"a",@progbits
	.balign	1
	.local	_.str.349
_.str.349:
	.asciz	"Untested deliveries raise Water I spread by 20% and general spread by 10% for 16 cycles."

	.section	.rodata._.str.350,"a",@progbits
	.balign	1
	.local	_.str.350
_.str.350:
	.asciz	"Reservoir Sampling Resumes"

	.section	.rodata._.str.351,"a",@progbits
	.balign	1
	.local	_.str.351
_.str.351:
	.asciz	"Ward Beds Reach Capacity"

	.section	.rodata._.str.352,"a",@progbits
	.balign	1
	.local	_.str.352
_.str.352:
	.asciz	"Overfull wards raise blood-route spread by 15% and discovery by 10% for 16 cycles."

	.section	.rodata._.str.353,"a",@progbits
	.balign	1
	.local	_.str.353
_.str.353:
	.asciz	"Overflow Ward Cohorting"

	.section	.rodata._.str.354,"a",@progbits
	.balign	1
	.local	_.str.354
_.str.354:
	.asciz	"Ward cohorting cuts blood-route spread by 10% during the capacity review."

	.section	.rodata._.str.355,"a",@progbits
	.balign	1
	.local	_.str.355
_.str.355:
	.asciz	"Regional Staff Pool Arrives"

	.section	.rodata._.str.356,"a",@progbits
	.balign	1
	.local	_.str.356
_.str.356:
	.asciz	"Staffing support cuts blood-route spread by 20% and boosts research by 10% for 16 cycles."

	.section	.rodata._.str.357,"a",@progbits
	.balign	1
	.local	_.str.357
_.str.357:
	.asciz	"Transfers Queue at Triage"

	.section	.rodata._.str.358,"a",@progbits
	.balign	1
	.local	_.str.358
_.str.358:
	.asciz	"Transfer queues raise blood-route spread by 20% and lower research by 10% for 16 cycles."

	.section	.rodata._.str.359,"a",@progbits
	.balign	1
	.local	_.str.359
_.str.359:
	.asciz	"Discharge Reviews Resume"

	.section	.rodata._.str.360,"a",@progbits
	.balign	1
	.local	_.str.360
_.str.360:
	.asciz	"Care reviews cut blood-route spread by 10% and raise discovery by 10% for 16 cycles."

	.section	.rodata._.str.361,"a",@progbits
	.balign	1
	.local	_.str.361
_.str.361:
	.asciz	"Joint Genome Desk Opens"

	.section	.rodata._.str.362,"a",@progbits
	.balign	1
	.local	_.str.362
_.str.362:
	.asciz	"A shared genome desk speeds discovery before detection and cure research after trials begin for 16 cycles."

	.section	.rodata._.str.363,"a",@progbits
	.balign	1
	.local	_.str.363
_.str.363:
	.asciz	"Coalition Assay Exchange"

	.section	.rodata._.str.364,"a",@progbits
	.balign	1
	.local	_.str.364
_.str.364:
	.asciz	"Shared assay notes raise cure research by 10% as laboratories align results."

	.section	.rodata._.str.365,"a",@progbits
	.balign	1
	.local	_.str.365
_.str.365:
	.asciz	"Hardening Data Is Shared"

	.section	.rodata._.str.366,"a",@progbits
	.balign	1
	.local	_.str.366
_.str.366:
	.asciz	"A coalition overcomes hardening, lifting research by 20% for 16 cycles."

	.section	.rodata._.str.367,"a",@progbits
	.balign	1
	.local	_.str.367
_.str.367:
	.asciz	"Separate Assay Queues Persist"

	.section	.rodata._.str.368,"a",@progbits
	.balign	1
	.local	_.str.368
_.str.368:
	.asciz	"Separate assay queues slow cure research after trials begin and discovery before detection for 16 cycles."

	.section	.rodata._.str.369,"a",@progbits
	.balign	1
	.local	_.str.369
_.str.369:
	.asciz	"Shared Reagent Ledger"

	.section	.rodata._.str.370,"a",@progbits
	.balign	1
	.local	_.str.370
_.str.370:
	.asciz	"Joint procurement raises research by 10% for 16 cycles."

	.section	.rodata._.str.371,"a",@progbits
	.balign	1
	.local	_.str.371
_.str.371:
	.asciz	"Daily Case Board Launches"

	.section	.rodata._.str.372,"a",@progbits
	.balign	1
	.local	_.str.372
_.str.372:
	.asciz	"Clear case counts improve discovery before detection and cure research once trials begin for 16 cycles."

	.section	.rodata._.str.373,"a",@progbits
	.balign	1
	.local	_.str.373
_.str.373:
	.asciz	"Daily Briefing Schedule"

	.section	.rodata._.str.374,"a",@progbits
	.balign	1
	.local	_.str.374
_.str.374:
	.asciz	"Regular briefings cut general spread by 10% as case information is checked."

	.section	.rodata._.str.375,"a",@progbits
	.balign	1
	.local	_.str.375
_.str.375:
	.asciz	"Trusted Briefings Continue"

	.section	.rodata._.str.376,"a",@progbits
	.balign	1
	.local	_.str.376
_.str.376:
	.asciz	"Credible progress raises research by 15% and lowers general spread by 10% for 16 cycles."

	.section	.rodata._.str.377,"a",@progbits
	.balign	1
	.local	_.str.377
_.str.377:
	.asciz	"Unclear Results Erode Trust"

	.section	.rodata._.str.378,"a",@progbits
	.balign	1
	.local	_.str.378
_.str.378:
	.asciz	"Mixed results lower research by 15% and raise general spread by 10% for 16 cycles."

	.section	.rodata._.str.379,"a",@progbits
	.balign	1
	.local	_.str.379
_.str.379:
	.asciz	"Community Questions Answered"

	.section	.rodata._.str.380,"a",@progbits
	.balign	1
	.local	_.str.380
_.str.380:
	.asciz	"National Response Desk Opens"

	.section	.rodata._.str.381,"a",@progbits
	.balign	1
	.local	_.str.381
_.str.381:
	.asciz	"A central desk improves discovery before detection and cure research after trials begin for 16 cycles."

	.section	.rodata._.str.382,"a",@progbits
	.balign	1
	.local	_.str.382
_.str.382:
	.asciz	"Emergency Air Order"

	.section	.rodata._.str.383,"a",@progbits
	.balign	1
	.local	_.str.383
_.str.383:
	.asciz	"A temporary air order lowers air travel by 10% while national rules are coordinated."

	.section	.rodata._.str.384,"a",@progbits
	.balign	1
	.local	_.str.384
_.str.384:
	.asciz	"Escalated Travel Order"

	.section	.rodata._.str.385,"a",@progbits
	.balign	1
	.local	_.str.385
_.str.385:
	.asciz	"A coordinated order blocks air travel for 16 cycles and cuts general spread by 15%."

	.section	.rodata._.str.386,"a",@progbits
	.balign	1
	.local	_.str.386
_.str.386:
	.asciz	"Local Rules Conflict"

	.section	.rodata._.str.387,"a",@progbits
	.balign	1
	.local	_.str.387
_.str.387:
	.asciz	"Conflicting orders raise general spread by 15% and lower discovery by 10% for 16 cycles."

	.section	.rodata._.str.388,"a",@progbits
	.balign	1
	.local	_.str.388
_.str.388:
	.asciz	"Emergency Powers Reviewed"

	.section	.rodata._.str.389,"a",@progbits
	.balign	1
	.local	_.str.389
_.str.389:
	.asciz	"A review raises research by 10% and lowers general spread by 10% for 16 cycles."

	.section	.rodata._.str.390,"a",@progbits
	.balign	1
	.local	_.str.390
_.str.390:
	.asciz	"WORLD EVENTS: PAUSED"

	.section	.rodata._.str.1.391,"a",@progbits
	.balign	1
	.local	_.str.1.391
_.str.1.391:
	.asciz	"No active world events."

	.section	.rodata._.str.2.392,"a",@progbits
	.balign	1
	.local	_.str.2.392
_.str.2.392:
	.asciz	"%s / %u cycles"

	.section	.rodata._.str.4.394,"a",@progbits
	.balign	1
	.local	_.str.4.394
_.str.4.394:
	.asciz	"Arrows: select  Enter: details"

	.section	.rodata._.str.6.396,"a",@progbits
	.balign	1
	.local	_.str.6.396
_.str.6.396:
	.asciz	"WORLD EVENT DETAILS"

	.section	.rodata._.str.7.397,"a",@progbits
	.balign	1
	.local	_.str.7.397
_.str.7.397:
	.asciz	"%s: %u cycles left"

	.section	.rodata._.str.8.398,"a",@progbits
	.balign	1
	.local	_.str.8.398
_.str.8.398:
	.asciz	"%s"

	.section	.rodata._effect_names,"a",@progbits
	.balign	1
	.local	_effect_names
_effect_names:
	d24	_.str.62.445
	d24	_.str.29.419
	d24	_.str.30.420
	d24	_.str.31.421
	d24	_.str.32.422
	d24	_.str.33.423
	d24	_.str.34.424
	d24	_.str.35.425
	d24	_.str.36.426

	.section	.rodata._.str.9.399,"a",@progbits
	.balign	1
	.local	_.str.9.399
_.str.9.399:
	.asciz	"%s spread bonus: %+d%%"

	.section	.rodata._.str.10.400,"a",@progbits
	.balign	1
	.local	_.str.10.400
_.str.10.400:
	.asciz	"%s: %+d%%"

	.section	.rodata._.str.11.403,"a",@progbits
	.balign	1
	.local	_.str.11.403
_.str.11.403:
	.asciz	"Counter: %s%s"

	.section	.rodata._.str.12.401,"a",@progbits
	.balign	1
	.local	_.str.12.401
_.str.12.401:
	.asciz	" (active)"

	.section	.rodata._.str.14.404,"a",@progbits
	.balign	1
	.local	_.str.14.404
_.str.14.404:
	.asciz	"New Reshuffle: investigation delayed 16 cycles."

	.section	.rodata._.str.15.405,"a",@progbits
	.balign	1
	.local	_.str.15.405
_.str.15.405:
	.asciz	"Next stage checks: %s"

	.section	.rodata._.str.16.406,"a",@progbits
	.balign	1
	.local	_.str.16.406
_.str.16.406:
	.asciz	"Temporary effect; ends automatically."

	.section	.rodata._.str.17.407,"a",@progbits
	.balign	1
	.local	_.str.17.407
_.str.17.407:
	.asciz	"Next stage when the timer expires."

	.section	.rodata._EventDetail.checks,"a",@progbits
	.balign	1
	.local	_EventDetail.checks
_EventDetail.checks:
	d24	_.str.567
	d24	_.str.567
	d24	_.str.18.413
	d24	_.str.19.414
	d24	_.str.20.415
	d24	_.str.21.416
	d24	_.str.22.417

	.section	.rodata._.str.18.413,"a",@progbits
	.balign	1
	.local	_.str.18.413
_.str.18.413:
	.asciz	"Severity at least 20"

	.section	.rodata._.str.19.414,"a",@progbits
	.balign	1
	.local	_.str.19.414
_.str.19.414:
	.asciz	"Regional deaths at least 25%"

	.section	.rodata._.str.20.415,"a",@progbits
	.balign	1
	.local	_.str.20.415
_.str.20.415:
	.asciz	"Regional active infection at least 50%"

	.section	.rodata._.str.21.416,"a",@progbits
	.balign	1
	.local	_.str.21.416
_.str.21.416:
	.asciz	"Cure progress at least 50%"

	.section	.rodata._.str.22.417,"a",@progbits
	.balign	1
	.local	_.str.22.417
_.str.22.417:
	.asciz	"Escalating public response"

	.section	.rodata._.str.23.408,"a",@progbits
	.balign	1
	.local	_.str.23.408
_.str.23.408:
	.asciz	"Next stage: %s"

	.section	.rodata._.str.24.409,"a",@progbits
	.balign	1
	.local	_.str.24.409
_.str.24.409:
	.asciz	"Effective local spread: %u.%02u%%"

	.section	.rodata._.str.25.410,"a",@progbits
	.balign	1
	.local	_.str.25.410
_.str.25.410:
	.asciz	"Air %u%%  Sea %u%%  Birds %u%%"

	.section	.rodata._.str.26.411,"a",@progbits
	.balign	1
	.local	_.str.26.411
_.str.26.411:
	.asciz	"Cure speed %u%% / discovery %u%%"

	.section	.rodata._.str.29.419,"a",@progbits
	.balign	1
	.local	_.str.29.419
_.str.29.419:
	.asciz	"Local spread"

	.section	.rodata._.str.30.420,"a",@progbits
	.balign	1
	.local	_.str.30.420
_.str.30.420:
	.asciz	"Air travel"

	.section	.rodata._.str.31.421,"a",@progbits
	.balign	1
	.local	_.str.31.421
_.str.31.421:
	.asciz	"Sea travel"

	.section	.rodata._.str.32.422,"a",@progbits
	.balign	1
	.local	_.str.32.422
_.str.32.422:
	.asciz	"Bird migration"

	.section	.rodata._.str.33.423,"a",@progbits
	.balign	1
	.local	_.str.33.423
_.str.33.423:
	.asciz	"Regional discovery"

	.section	.rodata._.str.34.424,"a",@progbits
	.balign	1
	.local	_.str.34.424
_.str.34.424:
	.asciz	"Regional research"

	.section	.rodata._.str.35.425,"a",@progbits
	.balign	1
	.local	_.str.35.425
_.str.35.425:
	.asciz	"Air travel blocked"

	.section	.rodata._.str.36.426,"a",@progbits
	.balign	1
	.local	_.str.36.426
_.str.36.426:
	.asciz	"Sea travel blocked"

	.section	.rodata._.str.433,"a",@progbits
	.balign	1
	.local	_.str.433
_.str.433:
	.asciz	"EVOLUTION: CHOOSE CATEGORY"

	.section	.rodata._categories,"a",@progbits
	.balign	1
	.local	_categories
_categories:
	d24	_.str.41.484
	d24	_.str.42.485
	d24	_.str.43.486

	.section	.rodata._.str.1.434,"a",@progbits
	.balign	1
	.local	_.str.1.434
_.str.1.434:
	.asciz	"DNA %u"

	.section	.rodata._branch_labels,"a",@progbits
	.balign	1
	.local	_branch_labels
_branch_labels:
	d24	_.str.44.469
	d24	_.str.45.470
	d24	_.str.46.471
	d24	_.str.47.472
	d24	_.str.48.473
	d24	_.str.49.474
	d24	_.str.50.475
	d24	_.str.51.476
	d24	_.str.52.477
	d24	_.str.53.478
	d24	0
	d24	0
	d24	0
	d24	0
	d24	_.str.54.479
	d24	_.str.55.480
	d24	_.str.56.481
	d24	_.str.57.482
	d24	_.str.58.483
	d24	0
	d24	0

	.section	.rodata._.str.2.435,"a",@progbits
	.balign	1
	.local	_.str.2.435
_.str.2.435:
	.asciz	"Aerosol"

	.section	.rodata._.str.3.436,"a",@progbits
	.balign	1
	.local	_.str.3.436
_.str.3.436:
	.asciz	"Reservoirs"

	.section	.rodata._.str.4.437,"a",@progbits
	.balign	1
	.local	_.str.4.437
_.str.4.437:
	.asciz	"Vector"

	.section	.rodata._.str.5.438,"a",@progbits
	.balign	1
	.local	_.str.5.438
_.str.5.438:
	.asciz	"Cost %u  * owned  + ready  L lock  $ DNA"

	.section	.rodata._.str.6.439,"a",@progbits
	.balign	1
	.local	_.str.6.439
_.str.6.439:
	.asciz	"Arrows: move   Enter: details"

	.section	.rodata._.str.7.440,"a",@progbits
	.balign	1
	.local	_.str.7.440
_.str.7.440:
	.asciz	"Clear: categories"

	.section	.rodata._first_node,"a",@progbits
	.balign	1
	.local	_first_node
_first_node:
	.ascii	"\000\021\035"

	.section	.rodata._environments,"a",@progbits
	.balign	1
	.globl	_environments
_environments:
	db	4                               ; 0x4
	db	0                               ; 0x0
	db	2                               ; 0x2
	db	3                               ; 0x3
	db	2                               ; 0x2
	db	4                               ; 0x4
	db	1                               ; 0x1
	db	3                               ; 0x3
	db	3                               ; 0x3
	db	3                               ; 0x3
	db	3                               ; 0x3
	db	4                               ; 0x4
	db	3                               ; 0x3
	db	3                               ; 0x3
	db	1                               ; 0x1
	db	3                               ; 0x3
	db	2                               ; 0x2
	db	1                               ; 0x1
	db	4                               ; 0x4
	db	2                               ; 0x2
	db	4                               ; 0x4
	db	0                               ; 0x0
	db	4                               ; 0x4
	db	1                               ; 0x1
	db	3                               ; 0x3
	db	1                               ; 0x1
	db	1                               ; 0x1
	db	3                               ; 0x3
	db	2                               ; 0x2
	db	3                               ; 0x3
	db	2                               ; 0x2
	db	3                               ; 0x3
	db	4                               ; 0x4
	db	3                               ; 0x3
	db	4                               ; 0x4
	db	3                               ; 0x3
	db	1                               ; 0x1
	db	4                               ; 0x4
	db	1                               ; 0x1
	db	2                               ; 0x2
	db	4                               ; 0x4
	db	2                               ; 0x2
	db	3                               ; 0x3
	db	1                               ; 0x1
	db	3                               ; 0x3
	db	4                               ; 0x4
	db	3                               ; 0x3
	db	2                               ; 0x2
	db	3                               ; 0x3

	.section	.rodata._.str.8.487,"a",@progbits
	.balign	1
	.local	_.str.8.487
_.str.8.487:
	.asciz	"Healthy %u   Active %u   Dead %u"

	.section	.rodata._.str.9.488,"a",@progbits
	.balign	1
	.local	_.str.9.488
_.str.9.488:
	.asciz	"Ever affected %u"

	.section	.rodata._.str.10.489,"a",@progbits
	.balign	1
	.local	_.str.10.489
_.str.10.489:
	.asciz	"Mixed gameplay ratings (0-4)"

	.section	.rodata._.str.11.490,"a",@progbits
	.balign	1
	.local	_.str.11.490
_.str.11.490:
	.asciz	"Heat %u   Cold %u"

	.section	.rodata._.str.12.491,"a",@progbits
	.balign	1
	.local	_.str.12.491
_.str.12.491:
	.asciz	"Humidity %u   Aridity %u"

	.section	.rodata._.str.13.492,"a",@progbits
	.balign	1
	.local	_.str.13.492
_.str.13.492:
	.asciz	"Urban %u   Rural %u"

	.section	.rodata._.str.14.493,"a",@progbits
	.balign	1
	.local	_.str.14.493
_.str.14.493:
	.asciz	"Healthcare %u"

	.section	.rodata._.str.15.494,"a",@progbits
	.balign	1
	.local	_.str.15.494
_.str.15.494:
	.asciz	"Effective spread: %u.%02u%%"

	.section	.rodata._.str.16.495,"a",@progbits
	.balign	1
	.local	_.str.16.495
_.str.16.495:
	.asciz	"Travel endpoints closed: %u/%u"

	.section	.rodata._.str.19.497,"a",@progbits
	.balign	1
	.local	_.str.19.497
_.str.19.497:
	.asciz	"FUNGUS: SPORE BURST"

	.section	.rodata._.str.20.499,"a",@progbits
	.balign	1
	.local	_.str.20.499
_.str.20.499:
	.asciz	"All three charges spent."

	.section	.rodata._.str.21.498,"a",@progbits
	.balign	1
	.local	_.str.21.498
_.str.21.498:
	.asciz	"DNA %u   Charge %u/3 costs %u"

	.section	.rodata._.str.22.500,"a",@progbits
	.balign	1
	.local	_.str.22.500
_.str.22.500:
	.asciz	"Seeds healthy land; ignores closures."

	.section	.rodata._.str.23.501,"a",@progbits
	.balign	1
	.local	_.str.23.501
_.str.23.501:
	.asciz	"%c %s: %u healthy"

	.section	.rodata._.str.24.502,"a",@progbits
	.balign	1
	.local	_.str.24.502
_.str.24.502:
	.asciz	"Up/Down: choose   Enter: release"

	.section	.rodata._.str.25.503,"a",@progbits
	.balign	1
	.local	_.str.25.503
_.str.25.503:
	.asciz	"Clear: back to actions"

	.section	.rodata._.str.26.505,"a",@progbits
	.balign	1
	.local	_.str.26.505
_.str.26.505:
	.asciz	"No spore charges remain."

	.section	.rodata._.str.27.506,"a",@progbits
	.balign	1
	.local	_.str.27.506
_.str.27.506:
	.asciz	"No healthy land in this region."

	.section	.rodata._.str.28.507,"a",@progbits
	.balign	1
	.local	_.str.28.507
_.str.28.507:
	.asciz	"Not enough DNA for this charge."

	.section	.rodata._.str.29.504,"a",@progbits
	.balign	1
	.local	_.str.29.504
_.str.29.504:
	.asciz	"One healthy cell seeded."

	.section	.rodata._.str.30.508,"a",@progbits
	.balign	1
	.local	_.str.30.508
_.str.30.508:
	.asciz	"No valid destination. Nothing spent."

	.section	.rodata._.str.31.509,"a",@progbits
	.balign	1
	.local	_.str.31.509
_.str.31.509:
	.asciz	"EXTINCTION: VICTORY"

	.section	.rodata._.str.32.510,"a",@progbits
	.balign	1
	.local	_.str.32.510
_.str.32.510:
	.asciz	"OUTBREAK ENDED"

	.section	.rodata._.str.33.511,"a",@progbits
	.balign	1
	.local	_.str.33.511
_.str.33.511:
	.asciz	"%s / %s"

	.section	.rodata._.str.34.512,"a",@progbits
	.balign	1
	.local	_.str.34.512
_.str.34.512:
	.asciz	"Completed world cycles: %lu"

	.section	.rodata._.str.35.513,"a",@progbits
	.balign	1
	.local	_.str.35.513
_.str.35.513:
	.asciz	"Healthy %u%%  Active %u%%  Dead %u%%"

	.section	.rodata._.str.36.514,"a",@progbits
	.balign	1
	.local	_.str.36.514
_.str.36.514:
	.asciz	"Ever affected %u%%   Cure %u.%02u%%"

	.section	.rodata._.str.37.517,"a",@progbits
	.balign	1
	.local	_.str.37.517
_.str.37.517:
	.asciz	"No living land cells remain."

	.section	.rodata._.str.38.515,"a",@progbits
	.balign	1
	.local	_.str.38.515
_.str.38.515:
	.asciz	"Humanity completed the cure."

	.section	.rodata._.str.39.516,"a",@progbits
	.balign	1
	.local	_.str.39.516
_.str.39.516:
	.asciz	"The last active infection died while healthy land survived."

	.section	.rodata._.str.40.518,"a",@progbits
	.balign	1
	.local	_.str.40.518
_.str.40.518:
	.asciz	"Main Menu (Enter / Clear)"

	.section	.rodata._.str.41.484,"a",@progbits
	.balign	1
	.local	_.str.41.484
_.str.41.484:
	.asciz	"TRANSMISSION"

	.section	.rodata._.str.42.485,"a",@progbits
	.balign	1
	.local	_.str.42.485
_.str.42.485:
	.asciz	"SYMPTOMS"

	.section	.rodata._.str.43.486,"a",@progbits
	.balign	1
	.local	_.str.43.486
_.str.43.486:
	.asciz	"ABILITIES"

	.section	.rodata._.str.44.469,"a",@progbits
	.balign	1
	.local	_.str.44.469
_.str.44.469:
	.asciz	"Air"

	.section	.rodata._.str.45.470,"a",@progbits
	.balign	1
	.local	_.str.45.470
_.str.45.470:
	.asciz	"Water"

	.section	.rodata._.str.46.471,"a",@progbits
	.balign	1
	.local	_.str.46.471
_.str.46.471:
	.asciz	"Live"

	.section	.rodata._.str.47.472,"a",@progbits
	.balign	1
	.local	_.str.47.472
_.str.47.472:
	.asciz	"Rod"

	.section	.rodata._.str.48.473,"a",@progbits
	.balign	1
	.local	_.str.48.473
_.str.48.473:
	.asciz	"Insect"

	.section	.rodata._.str.49.474,"a",@progbits
	.balign	1
	.local	_.str.49.474
_.str.49.474:
	.asciz	"Bird"

	.section	.rodata._.str.50.475,"a",@progbits
	.balign	1
	.local	_.str.50.475
_.str.50.475:
	.asciz	"Blood"

	.section	.rodata._.str.51.476,"a",@progbits
	.balign	1
	.local	_.str.51.476
_.str.51.476:
	.asciz	"Respiratory"

	.section	.rodata._.str.52.477,"a",@progbits
	.balign	1
	.local	_.str.52.477
_.str.52.477:
	.asciz	"Digestive"

	.section	.rodata._.str.53.478,"a",@progbits
	.balign	1
	.local	_.str.53.478
_.str.53.478:
	.asciz	"Systemic"

	.section	.rodata._.str.54.479,"a",@progbits
	.balign	1
	.local	_.str.54.479
_.str.54.479:
	.asciz	"Heat"

	.section	.rodata._.str.55.480,"a",@progbits
	.balign	1
	.local	_.str.55.480
_.str.55.480:
	.asciz	"Cold"

	.section	.rodata._.str.56.481,"a",@progbits
	.balign	1
	.local	_.str.56.481
_.str.56.481:
	.asciz	"Medical"

	.section	.rodata._.str.57.482,"a",@progbits
	.balign	1
	.local	_.str.57.482
_.str.57.482:
	.asciz	"Harden"

	.section	.rodata._.str.58.483,"a",@progbits
	.balign	1
	.local	_.str.58.483
_.str.58.483:
	.asciz	"Shuffle"

	.section	.rodata._.str.59.442,"a",@progbits
	.balign	1
	.local	_.str.59.442
_.str.59.442:
	.asciz	"EVOLUTION DETAILS"

	.section	.rodata._.str.60.443,"a",@progbits
	.balign	1
	.local	_.str.60.443
_.str.60.443:
	.asciz	"DNA %u   Cost %u   State %c"

	.section	.rodata._.str.61.444,"a",@progbits
	.balign	1
	.local	_.str.61.444
_.str.61.444:
	.asciz	"Requires:"

	.section	.rodata._.str.62.445,"a",@progbits
	.balign	1
	.local	_.str.62.445
_.str.62.445:
	.asciz	"None"

	.section	.rodata._.str.63.446,"a",@progbits
	.balign	1
	.local	_.str.63.446
_.str.63.446:
	.asciz	"Discovered + positive cure progress"

	.section	.rodata._.str.64.447,"a",@progbits
	.balign	1
	.local	_.str.64.447
_.str.64.447:
	.asciz	"Devolve preview:"

	.section	.rodata._.str.65.448,"a",@progbits
	.balign	1
	.local	_.str.65.448
_.str.65.448:
	.asciz	"Purchase preview:"

	.section	.rodata._.str.66.449,"a",@progbits
	.balign	1
	.local	_.str.66.449
_.str.66.449:
	.asciz	"INF %u>%u  SEV %u>%u"

	.section	.rodata._.str.67.450,"a",@progbits
	.balign	1
	.local	_.str.67.450
_.str.67.450:
	.asciz	"LETH %u>%u%%  RES %u>%u%%"

	.section	.rodata._reshuffle_reductions,"a",@progbits
	.balign	2
	.globl	_reshuffle_reductions
_reshuffle_reductions:
	dw	1500                            ; 0x5dc
	dw	2500                            ; 0x9c4

	.section	.rodata._.str.68.451,"a",@progbits
	.balign	1
	.local	_.str.68.451
_.str.68.451:
	.asciz	"Reshuffle already used this run."

	.section	.rodata._.str.69.452,"a",@progbits
	.balign	1
	.local	_.str.69.452
_.str.69.452:
	.asciz	"Cure %u.%02u > %u.%02u%%"

	.section	.rodata._.str.70.453,"a",@progbits
	.balign	1
	.local	_.str.70.453
_.str.70.453:
	.asciz	"Base air %u>%u%%  sea %u>%u%%"

	.section	.rodata._.str.71.454,"a",@progbits
	.balign	1
	.local	_.str.71.454
_.str.71.454:
	.asciz	"Base birds %u>%u%% per 8 cycles"

	.section	.rodata._.str.72.455,"a",@progbits
	.balign	1
	.local	_.str.72.455
_.str.72.455:
	.asciz	"Local spread %u.%02u > %u.%02u%%"

	.section	.rodata._.str.73.459,"a",@progbits
	.balign	1
	.local	_.str.73.459
_.str.73.459:
	.asciz	"Purchase: %u DNA%s"

	.section	.rodata._.str.74.457,"a",@progbits
	.balign	1
	.local	_.str.74.457
_.str.74.457:
	.asciz	" (owned)"

	.section	.rodata._.str.75.458,"a",@progbits
	.balign	1
	.local	_.str.75.458
_.str.75.458:
	.asciz	" (locked)"

	.section	.rodata._.str.76.456,"a",@progbits
	.balign	1
	.local	_.str.76.456
_.str.76.456:
	.asciz	" (need DNA)"

	.section	.rodata._.str.77.461,"a",@progbits
	.balign	1
	.local	_.str.77.461
_.str.77.461:
	.asciz	"Devolve: %u DNA%s"

	.section	.rodata._.str.78.460,"a",@progbits
	.balign	1
	.local	_.str.78.460
_.str.78.460:
	.asciz	" (need owned leaf)"

	.section	.rodata._.str.79.462,"a",@progbits
	.balign	1
	.local	_.str.79.462
_.str.79.462:
	.asciz	"Back"

	.section	.rodata._.str.80.465,"a",@progbits
	.balign	1
	.local	_.str.80.465
_.str.80.465:
	.asciz	"Already owned."

	.section	.rodata._.str.81.466,"a",@progbits
	.balign	1
	.local	_.str.81.466
_.str.81.466:
	.asciz	"Requirements not met."

	.section	.rodata._.str.82.467,"a",@progbits
	.balign	1
	.local	_.str.82.467
_.str.82.467:
	.asciz	"Not enough DNA."

	.section	.rodata._.str.83.463,"a",@progbits
	.balign	1
	.local	_.str.83.463
_.str.83.463:
	.asciz	"Purchased."

	.section	.rodata._.str.84.468,"a",@progbits
	.balign	1
	.local	_.str.84.468
_.str.84.468:
	.asciz	"Select an owned leaf symptom."

	.section	.rodata._.str.85.464,"a",@progbits
	.balign	1
	.local	_.str.85.464
_.str.85.464:
	.asciz	"Devolved. No refund."

	.section	.rodata._.str.526,"a",@progbits
	.balign	1
	.local	_.str.526
_.str.526:
	.asciz	"CNTG"

	.section	.data._anchor_scaled_data,"aw",@progbits
	.balign	1
	.globl	_anchor_scaled_data
_anchor_scaled_data:
	.ascii	"\b\b\377\377\377kJ\377\377\377\377\377\264kJ\224\376\377\377\377\223!!\214\336\377\377\377\377JJ\377\377\377\266\336\377k)\377\377\326J)\336kJ\336IJ\265!\001!\001\001!\265\377\336k\000!\223\376\377"

	.section	.data._cemetechdiscord_data,"aw",@progbits
	.balign	1
	.globl	_cemetechdiscord_data
_cemetechdiscord_data:
	.ascii	"\033\033\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\377\000\000\377\377\377\000\377\377\000\377\000\000\000\000\000\000\000\377\377\000\377\377\377\377\377\000\377\377\377\377\377\377\000\377\377\000\377\000\377\377\377\377\377\000\377\377\000\377\000\000\000\377\000\377\000\377\377\000\000\000\000\000\000\377\000\377\000\000\000\377\000\377\377\000\377\000\000\000\377\000\377\000\000\377\000\000\000\000\000\377\377\000\377\000\000\000\377\000\377\377\000\377\000\000\000\377\000\377\000\000\000\000\377\000\000\000\000\377\000\377\000\000\000\377\000\377\377\000\377\377\377\377\377\000\377\377\000\377\377\377\000\000\377\000\377\000\377\377\377\377\377\000\377\377\000\000\000\000\000\000\000\377\000\377\000\377\000\377\000\377\000\377\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\000\377\377\000\377\377\000\000\377\377\377\377\377\377\377\377\377\377\000\000\000\000\377\377\000\377\000\377\377\377\000\377\377\000\000\000\377\377\000\000\000\377\000\377\377\000\000\000\377\377\377\377\377\000\000\377\000\000\000\377\377\377\377\377\000\377\377\377\000\377\377\377\377\377\000\000\000\377\000\000\000\377\377\000\000\000\377\377\377\000\000\377\000\377\377\377\377\377\377\377\377\377\377\377\000\377\377\377\377\377\000\377\000\000\377\377\000\377\377\377\000\000\377\377\377\377\377\000\000\000\000\377\000\377\377\000\377\377\377\000\000\377\377\000\000\000\000\377\000\000\000\377\377\377\377\377\377\000\000\377\000\000\000\000\377\000\000\377\000\000\000\000\000\000\377\377\377\000\377\377\377\000\377\000\377\000\000\000\000\377\000\377\377\000\377\377\000\000\000\377\000\377\000\000\377\377\377\000\377\377\000\000\000\377\000\000\377\377\377\377\377\000\377\377\377\377\000\000\377\377\377\000\377\377\377\377\000\000\000\000\000\000\377\377\000\377\377\000\377\377\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\000\377\000\000\000\000\377\000\000\377\377\377\000\377\000\377\000\377\377\000\000\000\000\000\000\000\377\377\000\000\377\000\377\377\377\000\377\000\377\000\377\000\000\000\377\377\000\377\377\377\377\377\000\377\377\000\000\377\377\377\377\000\000\377\377\377\000\377\377\000\377\377\377\000\377\000\000\000\377\000\377\377\000\000\000\377\377\000\377\000\000\000\000\000\000\377\000\000\377\377\000\377\000\000\000\377\000\377\000\000\377\000\377\000\377\377\377\000\000\377\000\000\000\000\000\377\377\000\377\000\000\000\377\000\377\000\377\377\000\377\000\377\000\377\377\000\377\000\377\000\000\377\377\377\000\377\377\377\377\377\000\377\000\000\000\377\000\000\377\000\377\377\000\377\000\377\000\377\377\377\377\000\000\000\000\000\000\000\377\000\377\377\000\000\000\000\377\377\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377"

	.section	.data._closed_scaled_data,"aw",@progbits
	.balign	1
	.globl	_closed_scaled_data
_closed_scaled_data:
	.ascii	"\020\020\224\224\224\224\350\340\340\340\340\340\340\311\224\224\224\224\224\224\224\340\340\340\340\350\350\340\340\340\340\223\224\224\224\224\340\340\340\311\253\224\224\253\311\340\340\340\253\224\224\340\340\340\340\224\224\224\224\224\224\224\340\340\340\223\311\340\340\340\340\340\224\224\224\224\224\224\224\340\340\312\340\340\311\312\340\340\340\224\224\224\224\224\224\312\340\350\340\340\312\224\350\340\340\351\224\224\224\224\224\253\340\340\340\340\224\224\224\350\340\340\311\224\224\224\224\253\340\340\340\340\224\224\224\224\340\340\340\312\224\224\224\253\340\340\340\340\223\224\224\224\223\340\340\340\253\224\224\253\340\340\340\340\312\224\224\224\224\253\340\340\340\312\224\253\340\340\340\340\340\224\224\224\224\224\253\340\340\340\253\351\340\340\312\340\340\312\224\224\224\224\224\253\340\340\340\340\340\312\224\340\340\340\311\224\224\224\224\224\253\340\340\340\350\224\224\224\340\340\340\350\312\312\312\312\350\340\340\340\224\224\224\224\253\340\340\340\340\340\340\340\340\340\340\223\224\224"

	.section	.data._ecprograms_data,"aw",@progbits
	.balign	1
	.globl	_ecprograms_data
_ecprograms_data:
	.ascii	"\033\033\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\377\377\000\000\000\377\377\000\377\377\377\000\000\000\000\000\000\000\377\377\000\377\377\377\377\377\000\377\377\377\377\000\000\000\000\377\000\377\000\377\377\377\377\377\000\377\377\000\377\000\000\000\377\000\377\377\000\000\000\377\377\000\377\377\377\000\377\000\000\000\377\000\377\377\000\377\000\000\000\377\000\377\000\377\000\000\000\000\377\377\000\377\000\377\000\000\000\377\000\377\377\000\377\000\000\000\377\000\377\000\377\000\377\000\000\377\377\000\377\000\377\000\000\000\377\000\377\377\000\377\377\377\377\377\000\377\377\000\000\377\377\377\000\377\377\377\000\377\377\377\377\377\000\377\377\000\000\000\000\000\000\000\377\000\377\000\377\000\377\000\377\000\377\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\000\377\000\000\377\000\000\000\377\377\377\377\377\377\377\377\377\377\000\000\377\377\377\000\000\000\377\000\000\377\377\000\377\377\377\377\377\377\000\000\377\377\377\377\377\377\000\000\377\377\377\377\000\000\377\000\000\000\000\000\000\000\377\377\000\000\000\000\000\377\377\377\377\000\000\000\377\000\000\000\377\000\377\377\000\000\000\000\377\377\377\377\377\000\377\000\000\377\377\377\000\377\000\377\377\377\000\000\377\000\377\377\377\000\377\000\000\000\000\377\000\377\377\000\377\377\000\377\377\000\377\377\000\000\000\000\000\000\000\377\377\377\000\377\000\377\377\377\377\377\000\377\377\000\000\000\377\377\377\377\377\377\000\000\000\377\000\000\000\000\377\377\000\377\377\377\000\377\377\377\000\377\000\377\000\000\000\377\377\377\377\377\000\377\377\000\377\000\377\000\000\000\377\000\000\377\377\000\377\000\377\377\377\377\000\000\000\000\000\377\377\377\000\000\377\377\000\377\000\000\377\000\377\377\000\377\000\000\377\000\000\377\377\377\000\377\377\000\000\000\000\000\000\000\000\377\000\377\377\377\377\377\377\377\377\377\377\377\377\000\377\377\000\377\000\000\000\000\377\377\377\000\377\377\377\377\377\377\000\000\000\000\000\000\000\377\000\000\000\000\000\000\000\377\000\377\000\377\000\377\377\377\000\377\377\000\377\377\377\377\377\000\377\000\000\000\000\000\377\377\000\000\377\377\377\000\377\377\377\000\377\377\000\377\000\000\000\377\000\377\377\000\000\000\000\000\000\000\000\000\000\000\000\377\000\000\377\377\377\000\377\000\000\000\377\000\377\377\000\377\000\377\377\377\000\000\000\000\377\377\377\377\000\000\377\377\000\377\000\000\000\377\000\377\377\000\000\377\000\000\000\377\377\000\377\377\377\000\000\377\000\377\377\000\377\377\377\377\377\000\377\000\000\000\000\377\377\377\000\000\377\377\000\000\377\377\377\000\377\377\000\000\000\000\000\000\000\377\000\000\377\000\000\377\377\377\000\377\000\377\377\000\377\377\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377"

	.section	.data._icons_pal,"aw",@progbits
	.balign	2
	.globl	_icons_pal
_icons_pal:
	dw	0                               ; 0x0
	dw	129                             ; 0x81
	dw	258                             ; 0x102
	dw	387                             ; 0x183
	dw	516                             ; 0x204
	dw	645                             ; 0x285
	dw	774                             ; 0x306
	dw	903                             ; 0x387
	dw	1032                            ; 0x408
	dw	1161                            ; 0x489
	dw	1290                            ; 0x50a
	dw	1419                            ; 0x58b
	dw	1548                            ; 0x60c
	dw	1677                            ; 0x68d
	dw	1806                            ; 0x70e
	dw	1935                            ; 0x78f
	dw	2064                            ; 0x810
	dw	2193                            ; 0x891
	dw	2322                            ; 0x912
	dw	2451                            ; 0x993
	dw	2580                            ; 0xa14
	dw	2709                            ; 0xa95
	dw	2838                            ; 0xb16
	dw	2967                            ; 0xb97
	dw	3096                            ; 0xc18
	dw	3225                            ; 0xc99
	dw	3354                            ; 0xd1a
	dw	3483                            ; 0xd9b
	dw	3612                            ; 0xe1c
	dw	3741                            ; 0xe9d
	dw	3870                            ; 0xf1e
	dw	3999                            ; 0xf9f
	dw	36864                           ; 0x9000
	dw	36993                           ; 0x9081
	dw	37122                           ; 0x9102
	dw	37251                           ; 0x9183
	dw	37380                           ; 0x9204
	dw	37509                           ; 0x9285
	dw	37638                           ; 0x9306
	dw	37767                           ; 0x9387
	dw	37896                           ; 0x9408
	dw	38025                           ; 0x9489
	dw	38154                           ; 0x950a
	dw	38283                           ; 0x958b
	dw	38412                           ; 0x960c
	dw	38541                           ; 0x968d
	dw	38670                           ; 0x970e
	dw	38799                           ; 0x978f
	dw	38928                           ; 0x9810
	dw	39057                           ; 0x9891
	dw	39186                           ; 0x9912
	dw	39315                           ; 0x9993
	dw	39444                           ; 0x9a14
	dw	39573                           ; 0x9a95
	dw	39702                           ; 0x9b16
	dw	39831                           ; 0x9b97
	dw	39960                           ; 0x9c18
	dw	40089                           ; 0x9c99
	dw	40218                           ; 0x9d1a
	dw	40347                           ; 0x9d9b
	dw	40476                           ; 0x9e1c
	dw	40605                           ; 0x9e9d
	dw	40734                           ; 0x9f1e
	dw	40863                           ; 0x9f9f
	dw	8224                            ; 0x2020
	dw	8353                            ; 0x20a1
	dw	8482                            ; 0x2122
	dw	8611                            ; 0x21a3
	dw	8740                            ; 0x2224
	dw	8869                            ; 0x22a5
	dw	8998                            ; 0x2326
	dw	9127                            ; 0x23a7
	dw	9256                            ; 0x2428
	dw	9385                            ; 0x24a9
	dw	9514                            ; 0x252a
	dw	9643                            ; 0x25ab
	dw	9772                            ; 0x262c
	dw	9901                            ; 0x26ad
	dw	10030                           ; 0x272e
	dw	10159                           ; 0x27af
	dw	10288                           ; 0x2830
	dw	10417                           ; 0x28b1
	dw	10546                           ; 0x2932
	dw	10675                           ; 0x29b3
	dw	10804                           ; 0x2a34
	dw	10933                           ; 0x2ab5
	dw	11062                           ; 0x2b36
	dw	11191                           ; 0x2bb7
	dw	11320                           ; 0x2c38
	dw	11449                           ; 0x2cb9
	dw	11578                           ; 0x2d3a
	dw	11707                           ; 0x2dbb
	dw	11836                           ; 0x2e3c
	dw	11965                           ; 0x2ebd
	dw	12094                           ; 0x2f3e
	dw	12223                           ; 0x2fbf
	dw	45088                           ; 0xb020
	dw	45217                           ; 0xb0a1
	dw	45346                           ; 0xb122
	dw	45475                           ; 0xb1a3
	dw	45604                           ; 0xb224
	dw	45733                           ; 0xb2a5
	dw	45862                           ; 0xb326
	dw	45991                           ; 0xb3a7
	dw	46120                           ; 0xb428
	dw	46249                           ; 0xb4a9
	dw	46378                           ; 0xb52a
	dw	46507                           ; 0xb5ab
	dw	46636                           ; 0xb62c
	dw	46765                           ; 0xb6ad
	dw	46894                           ; 0xb72e
	dw	47023                           ; 0xb7af
	dw	47152                           ; 0xb830
	dw	47281                           ; 0xb8b1
	dw	47410                           ; 0xb932
	dw	47539                           ; 0xb9b3
	dw	47668                           ; 0xba34
	dw	47797                           ; 0xbab5
	dw	47926                           ; 0xbb36
	dw	48055                           ; 0xbbb7
	dw	48184                           ; 0xbc38
	dw	48313                           ; 0xbcb9
	dw	48442                           ; 0xbd3a
	dw	48571                           ; 0xbdbb
	dw	48700                           ; 0xbe3c
	dw	48829                           ; 0xbebd
	dw	48958                           ; 0xbf3e
	dw	49087                           ; 0xbfbf
	dw	16448                           ; 0x4040
	dw	16577                           ; 0x40c1
	dw	16706                           ; 0x4142
	dw	16835                           ; 0x41c3
	dw	16964                           ; 0x4244
	dw	17093                           ; 0x42c5
	dw	17222                           ; 0x4346
	dw	17351                           ; 0x43c7
	dw	17480                           ; 0x4448
	dw	17609                           ; 0x44c9
	dw	17738                           ; 0x454a
	dw	17867                           ; 0x45cb
	dw	17996                           ; 0x464c
	dw	18125                           ; 0x46cd
	dw	18254                           ; 0x474e
	dw	18383                           ; 0x47cf
	dw	18512                           ; 0x4850
	dw	18641                           ; 0x48d1
	dw	18770                           ; 0x4952
	dw	18899                           ; 0x49d3
	dw	19028                           ; 0x4a54
	dw	19157                           ; 0x4ad5
	dw	19286                           ; 0x4b56
	dw	19415                           ; 0x4bd7
	dw	19544                           ; 0x4c58
	dw	19673                           ; 0x4cd9
	dw	19802                           ; 0x4d5a
	dw	19931                           ; 0x4ddb
	dw	20060                           ; 0x4e5c
	dw	20189                           ; 0x4edd
	dw	20318                           ; 0x4f5e
	dw	20447                           ; 0x4fdf
	dw	53312                           ; 0xd040
	dw	53441                           ; 0xd0c1
	dw	53570                           ; 0xd142
	dw	53699                           ; 0xd1c3
	dw	53828                           ; 0xd244
	dw	53957                           ; 0xd2c5
	dw	54086                           ; 0xd346
	dw	54215                           ; 0xd3c7
	dw	54344                           ; 0xd448
	dw	54473                           ; 0xd4c9
	dw	54602                           ; 0xd54a
	dw	54731                           ; 0xd5cb
	dw	54860                           ; 0xd64c
	dw	54989                           ; 0xd6cd
	dw	55118                           ; 0xd74e
	dw	55247                           ; 0xd7cf
	dw	55376                           ; 0xd850
	dw	55505                           ; 0xd8d1
	dw	55634                           ; 0xd952
	dw	55763                           ; 0xd9d3
	dw	55892                           ; 0xda54
	dw	56021                           ; 0xdad5
	dw	56150                           ; 0xdb56
	dw	56279                           ; 0xdbd7
	dw	56408                           ; 0xdc58
	dw	56537                           ; 0xdcd9
	dw	56666                           ; 0xdd5a
	dw	56795                           ; 0xdddb
	dw	56924                           ; 0xde5c
	dw	57053                           ; 0xdedd
	dw	57182                           ; 0xdf5e
	dw	57311                           ; 0xdfdf
	dw	24672                           ; 0x6060
	dw	24801                           ; 0x60e1
	dw	24930                           ; 0x6162
	dw	25059                           ; 0x61e3
	dw	25188                           ; 0x6264
	dw	25317                           ; 0x62e5
	dw	25446                           ; 0x6366
	dw	25575                           ; 0x63e7
	dw	25704                           ; 0x6468
	dw	25833                           ; 0x64e9
	dw	25962                           ; 0x656a
	dw	26091                           ; 0x65eb
	dw	26220                           ; 0x666c
	dw	26349                           ; 0x66ed
	dw	26478                           ; 0x676e
	dw	26607                           ; 0x67ef
	dw	26736                           ; 0x6870
	dw	26865                           ; 0x68f1
	dw	26994                           ; 0x6972
	dw	27123                           ; 0x69f3
	dw	27252                           ; 0x6a74
	dw	27381                           ; 0x6af5
	dw	27510                           ; 0x6b76
	dw	27639                           ; 0x6bf7
	dw	27768                           ; 0x6c78
	dw	27897                           ; 0x6cf9
	dw	28026                           ; 0x6d7a
	dw	28155                           ; 0x6dfb
	dw	28284                           ; 0x6e7c
	dw	28413                           ; 0x6efd
	dw	28542                           ; 0x6f7e
	dw	28671                           ; 0x6fff
	dw	61536                           ; 0xf060
	dw	61665                           ; 0xf0e1
	dw	61794                           ; 0xf162
	dw	61923                           ; 0xf1e3
	dw	62052                           ; 0xf264
	dw	62181                           ; 0xf2e5
	dw	62310                           ; 0xf366
	dw	62439                           ; 0xf3e7
	dw	62568                           ; 0xf468
	dw	62697                           ; 0xf4e9
	dw	62826                           ; 0xf56a
	dw	62955                           ; 0xf5eb
	dw	63084                           ; 0xf66c
	dw	63213                           ; 0xf6ed
	dw	63342                           ; 0xf76e
	dw	63471                           ; 0xf7ef
	dw	63600                           ; 0xf870
	dw	63729                           ; 0xf8f1
	dw	63858                           ; 0xf972
	dw	63987                           ; 0xf9f3
	dw	64116                           ; 0xfa74
	dw	64245                           ; 0xfaf5
	dw	64374                           ; 0xfb76
	dw	64503                           ; 0xfbf7
	dw	64632                           ; 0xfc78
	dw	64761                           ; 0xfcf9
	dw	64890                           ; 0xfd7a
	dw	65019                           ; 0xfdfb
	dw	65148                           ; 0xfe7c
	dw	65277                           ; 0xfefd
	dw	65406                           ; 0xff7e
	dw	65535                           ; 0xffff

	.section	.data._logo_data,"aw",@progbits
	.balign	1
	.globl	_logo_data
_logo_data:
	.ascii	"D\n\000\000\000\000\000\000\000\000\000\000\340\340\000\340\340\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\340\340\000\340\340\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\000\000\000\340\340\000\000\000\340\340\000\000\000\377\000\000\000\377\377\000\377\377\377\377\377\377\000\000\000\377\377\000\000\000\000\377\377\377\377\377\000\377\377\000\000\000\340\340\000\000\000\340\340\000\000\000\377\000\000\000\377\377\000\377\377\377\377\377\000\000\000\340\340\000\000\000\340\340\000\000\000\377\377\000\000\377\377\000\377\377\377\377\377\377\000\000\377\377\377\377\000\000\377\377\377\377\377\377\000\377\377\000\000\000\340\340\000\000\000\340\340\000\000\000\377\377\000\000\377\377\377\377\377\000\000\000\000\000\340\340\340\340\000\340\340\340\340\000\000\377\377\377\000\377\377\000\000\000\377\377\000\000\000\377\377\000\000\377\377\000\377\377\000\000\000\000\000\377\377\000\000\340\340\340\340\000\340\340\340\340\000\000\377\377\377\000\377\377\377\377\000\000\000\000\000\340\340\340\340\340\340\340\340\340\340\340\000\377\377\377\377\377\377\000\000\000\377\377\000\000\000\377\377\000\000\377\377\000\377\377\000\377\377\377\000\377\377\000\340\340\340\340\340\340\340\340\340\340\340\000\377\377\377\377\377\377\377\377\000\000\000\000\000\340\340\000\000\340\340\340\000\000\340\340\000\377\377\000\377\377\377\000\000\000\377\377\000\000\000\377\377\377\377\377\377\000\377\377\000\377\377\377\000\377\377\000\340\340\000\000\340\340\340\000\000\340\340\000\377\377\000\377\377\377\377\377\377\000\000\000\000\000\000\000\000\340\340\340\000\000\000\000\000\377\377\000\000\377\377\000\000\000\377\377\000\000\000\377\377\377\377\377\377\000\377\377\000\000\377\377\000\377\377\000\000\000\000\000\340\340\340\000\000\000\000\000\377\377\000\000\377\377\000\377\377\377\377\377\000\340\340\000\340\340\340\340\340\000\340\340\000\377\377\000\000\377\377\000\000\000\377\377\000\000\000\377\377\000\000\377\377\000\377\377\377\377\377\377\000\377\377\000\340\340\000\340\340\340\340\340\000\340\340\000\377\377\000\000\377\377\000\000\377\377\377\377\000\000\340\340\340\340\340\340\340\340\340\000\000\377\377\000\000\377\377\000\000\000\377\377\000\000\000\377\377\000\000\377\377\000\000\377\377\377\377\000\000\377\377\000\000\340\340\340\340\340\340\340\340\340\000\000\377\377\000\000\377\377\000\000\000\000\000\000\000\000\000\340\340\000\000\000\340\340\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\340\340\000\000\000\340\340"
	.zero	9

	.section	.data._myprograms_data,"aw",@progbits
	.balign	1
	.globl	_myprograms_data
_myprograms_data:
	.ascii	"\033\033\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\377\000\000\000\000\377\377\000\377\377\377\000\000\000\000\000\000\000\377\377\000\377\377\377\377\377\000\377\377\377\377\000\000\377\377\377\000\377\000\377\377\377\377\377\000\377\377\000\377\000\000\000\377\000\377\377\000\377\000\377\000\000\377\000\377\000\377\000\000\000\377\000\377\377\000\377\000\000\000\377\000\377\377\377\000\000\000\000\377\377\000\377\000\377\000\000\000\377\000\377\377\000\377\000\000\000\377\000\377\377\377\000\000\000\000\000\377\000\377\000\377\000\000\000\377\000\377\377\000\377\377\377\377\377\000\377\377\000\377\000\000\377\000\377\000\377\000\377\377\377\377\377\000\377\377\000\000\000\000\000\000\000\377\000\377\000\377\000\377\000\377\000\377\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\000\000\377\377\377\000\377\000\000\377\377\377\377\377\377\377\377\377\377\000\000\377\000\000\377\000\377\377\000\377\377\377\377\377\377\000\377\000\377\377\377\377\377\000\377\377\000\377\377\000\377\000\377\000\377\377\000\000\377\000\000\000\000\377\377\000\000\000\000\000\377\377\377\377\377\000\377\377\377\000\000\377\000\377\000\377\000\377\000\377\000\377\377\000\000\377\377\000\377\377\377\377\000\377\000\000\377\377\377\377\377\000\000\377\000\377\377\377\000\000\377\000\000\000\000\377\377\000\377\000\000\000\377\000\377\377\000\000\377\377\377\377\377\000\377\000\377\377\377\377\377\000\377\377\000\000\000\000\000\377\377\000\000\000\000\000\377\377\377\000\000\377\377\377\000\377\377\000\377\377\377\000\000\000\377\000\000\000\377\000\377\000\377\377\000\377\000\000\000\377\377\000\000\000\000\000\377\377\000\377\377\000\377\377\377\377\377\377\377\000\377\377\377\000\000\377\377\000\377\000\000\377\000\377\377\000\377\377\377\377\377\000\000\377\000\377\000\377\000\000\000\000\000\000\000\000\377\000\000\377\377\377\377\377\377\377\377\377\377\377\000\000\377\377\000\377\000\000\000\377\377\377\000\377\000\000\377\377\377\000\000\000\000\000\000\000\377\377\000\377\000\377\377\377\377\000\377\000\377\000\377\377\377\000\377\377\000\377\377\377\377\377\000\377\377\377\377\000\000\000\377\000\000\377\377\377\000\377\377\377\000\377\377\000\377\000\000\000\377\000\377\000\000\377\377\377\377\000\000\000\000\000\000\000\377\377\000\377\377\377\000\377\000\000\000\377\000\377\000\000\000\000\377\000\000\000\000\000\000\377\377\377\377\000\000\377\377\000\377\000\000\000\377\000\377\377\000\000\000\000\377\377\377\377\377\377\377\000\000\000\000\000\377\377\000\377\377\377\377\377\000\377\000\000\377\377\000\377\000\000\377\000\377\000\000\377\000\000\000\377\377\000\000\000\000\000\000\000\377\000\000\377\000\377\377\000\377\000\377\000\377\377\000\377\377\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377"

	.section	.bss._optix_guidata,"aw",@nobits
	.balign	2
	.globl	_optix_guidata
_optix_guidata:
	.zero	14

	.section	.bss._optix_guicolors,"aw",@nobits
	.balign	1
	.globl	_optix_guicolors
_optix_guicolors:
	.zero	9

	.section	.bss._optix_cursor,"aw",@nobits
	.balign	2
	.globl	_optix_cursor
_optix_cursor:
	.zero	4

	.section	.bss._optix_guisettings,"aw",@nobits
	.balign	1
	.globl	_optix_guisettings
_optix_guisettings:
	.zero	3

	.section	.bss._optix_buttoninfo,"aw",@nobits
	.balign	1
	.globl	_optix_buttoninfo
_optix_buttoninfo:
	.zero	2

	.section	.bss._optix_wordwraptext,"aw",@nobits
	.balign	1
	.globl	_optix_wordwraptext
_optix_wordwraptext:
	.zero	3

	.section	.bss._optix_menu,"aw",@nobits
	.balign	1
	.globl	_optix_menu
_optix_menu:
	.zero	3

	.section	.rodata._.str.4.537,"a",@progbits
	.balign	1
	.local	_.str.4.537
_.str.4.537:
	.asciz	"Special characters"

	.section	.rodata._.str.5.538,"a",@progbits
	.balign	1
	.local	_.str.5.538
_.str.5.538:
	.asciz	"ERROR"

	.section	.rodata._.str.6.539,"a",@progbits
	.balign	1
	.local	_.str.6.539
_.str.6.539:
	.asciz	"You attempted to use a character reserved by OPTIX. Nice try, bucko."

	.section	.rodata._.str.7.542,"a",@progbits
	.balign	1
	.local	_.str.7.542
_.str.7.542:
	.asciz	"\000\000\000\000\000\000\000\000\000\000\000WRMH\000\000?\000VQLG\000\000.ZUPKFC\000 YTOJEB\000\000XSNIDA\000\000\000\000\000\000\000\000\000"

	.section	.rodata._.str.8.543,"a",@progbits
	.balign	1
	.local	_.str.8.543
_.str.8.543:
	.asciz	"\000\000\000\000\000\000\000\000\000\000\000wrmh\000\000?\000vqlg\000\000.zupkfc\000 ytojeb\000\000xsnida\000\000\000\000\000\000\000\000\000"

	.section	.rodata._.str.9.544,"a",@progbits
	.balign	1
	.local	_.str.9.544
_.str.9.544:
	.asciz	"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000-369)\000\000\000.258(\000\000\0000147,\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"

	.section	.rodata.___const.optix_GetStringInput.keys,"a",@progbits
	.balign	1
	.local	___const.optix_GetStringInput.keys
___const.optix_GetStringInput.keys:
	d24	_.str.7.542
	d24	_.str.8.543
	d24	_.str.9.544

	.section	.bss._optix_stringinput,"aw",@nobits
	.balign	1
	.globl	_optix_stringinput
_optix_stringinput:
	.zero	3

	.section	.rodata._.str.10.541,"a",@progbits
	.balign	1
	.local	_.str.10.541
_.str.10.541:
	.asciz	"%d/%d"

	.section	.bss._optix_button,"aw",@nobits
	.balign	1
	.globl	_optix_button
_optix_button:
	.zero	3

	.section	.rodata._.str.11.545,"a",@progbits
	.balign	1
	.local	_.str.11.545
_.str.11.545:
	.asciz	"ERROR 01"

	.section	.rodata._.str.12.546,"a",@progbits
	.balign	1
	.local	_.str.12.546
_.str.12.546:
	.asciz	"Failed to reallocate space in the dynamic array for a new button. Please submit a bug report!"

	.section	.bss._optix_box,"aw",@nobits
	.balign	2
	.globl	_optix_box
_optix_box:
	.zero	8

	.section	.data._programthread_data,"aw",@progbits
	.balign	1
	.globl	_programthread_data
_programthread_data:
	.ascii	"\033\033\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\377\000\000\000\000\377\377\000\377\377\377\000\000\000\000\000\000\000\377\377\000\377\377\377\377\377\000\377\377\377\377\000\000\377\377\377\000\377\000\377\377\377\377\377\000\377\377\000\377\000\000\000\377\000\377\377\000\377\000\377\000\000\377\000\377\000\377\000\000\000\377\000\377\377\000\377\000\000\000\377\000\377\377\377\000\000\000\000\377\377\000\377\000\377\000\000\000\377\000\377\377\000\377\000\000\000\377\000\377\377\377\000\000\000\000\000\377\000\377\000\377\000\000\000\377\000\377\377\000\377\377\377\377\377\000\377\377\000\377\000\377\377\000\377\000\377\000\377\377\377\377\377\000\377\377\000\000\000\000\000\000\000\377\000\377\000\377\000\377\000\377\000\377\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\000\000\377\377\000\000\377\000\000\377\377\377\377\377\377\377\377\377\377\000\000\377\000\000\377\000\377\377\000\377\000\377\377\377\377\000\377\000\377\377\377\377\377\000\377\377\377\000\000\000\377\377\377\377\377\377\000\000\377\000\000\000\000\377\377\000\000\000\000\000\377\377\377\000\000\000\377\377\377\000\000\377\000\377\000\000\000\377\000\377\000\377\377\000\000\377\377\000\377\377\000\000\377\000\000\000\377\377\000\377\377\000\377\377\000\377\377\377\000\000\377\000\000\000\000\377\377\000\000\377\000\377\000\000\377\000\000\000\377\000\377\377\377\000\377\000\377\377\377\377\377\000\377\377\000\377\377\000\000\377\377\377\377\377\000\000\377\377\377\000\000\377\377\377\000\377\377\000\377\377\377\000\000\377\377\000\377\000\377\000\377\000\377\000\000\377\000\000\000\377\377\000\000\000\000\000\377\377\000\377\000\000\377\377\377\000\377\377\377\000\000\377\377\000\000\377\377\000\377\000\000\377\000\377\377\000\377\000\377\377\000\000\000\000\377\377\000\000\000\377\000\000\000\000\000\000\377\000\000\377\377\377\377\377\377\377\377\377\377\377\000\000\377\377\377\000\000\000\000\377\377\377\000\377\000\000\377\377\377\000\000\000\000\000\000\000\377\377\377\000\000\000\000\000\377\000\377\000\377\000\377\377\377\000\377\377\000\377\377\377\377\377\000\377\377\377\000\000\000\000\377\000\000\377\377\377\000\377\377\377\000\377\377\000\377\000\000\000\377\000\377\000\000\000\000\377\377\377\000\000\000\000\000\000\377\377\000\377\377\377\000\377\000\000\000\377\000\377\000\377\377\000\377\377\377\000\000\000\000\377\377\377\377\000\000\377\377\000\377\000\000\000\377\000\377\377\000\000\000\000\377\377\377\377\377\377\377\000\000\000\000\000\377\377\000\377\377\377\377\377\000\377\000\000\377\377\377\377\000\000\377\000\377\000\000\377\000\000\000\377\377\000\000\000\000\000\000\000\377\000\000\000\377\000\377\377\377\000\377\000\377\377\000\377\377\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377"

	.section	.data._sprites_pal,"aw",@progbits
	.balign	2
	.globl	_sprites_pal
_sprites_pal:
	dw	0                               ; 0x0
	dw	129                             ; 0x81
	dw	258                             ; 0x102
	dw	387                             ; 0x183
	dw	516                             ; 0x204
	dw	645                             ; 0x285
	dw	774                             ; 0x306
	dw	903                             ; 0x387
	dw	1032                            ; 0x408
	dw	1161                            ; 0x489
	dw	1290                            ; 0x50a
	dw	1419                            ; 0x58b
	dw	1548                            ; 0x60c
	dw	1677                            ; 0x68d
	dw	1806                            ; 0x70e
	dw	1935                            ; 0x78f
	dw	2064                            ; 0x810
	dw	2193                            ; 0x891
	dw	2322                            ; 0x912
	dw	2451                            ; 0x993
	dw	2580                            ; 0xa14
	dw	2709                            ; 0xa95
	dw	2838                            ; 0xb16
	dw	2967                            ; 0xb97
	dw	3096                            ; 0xc18
	dw	3225                            ; 0xc99
	dw	3354                            ; 0xd1a
	dw	3483                            ; 0xd9b
	dw	3612                            ; 0xe1c
	dw	3741                            ; 0xe9d
	dw	3870                            ; 0xf1e
	dw	3999                            ; 0xf9f
	dw	36864                           ; 0x9000
	dw	36993                           ; 0x9081
	dw	37122                           ; 0x9102
	dw	37251                           ; 0x9183
	dw	37380                           ; 0x9204
	dw	37509                           ; 0x9285
	dw	37638                           ; 0x9306
	dw	37767                           ; 0x9387
	dw	37896                           ; 0x9408
	dw	38025                           ; 0x9489
	dw	38154                           ; 0x950a
	dw	38283                           ; 0x958b
	dw	38412                           ; 0x960c
	dw	38541                           ; 0x968d
	dw	38670                           ; 0x970e
	dw	38799                           ; 0x978f
	dw	38928                           ; 0x9810
	dw	39057                           ; 0x9891
	dw	39186                           ; 0x9912
	dw	39315                           ; 0x9993
	dw	39444                           ; 0x9a14
	dw	39573                           ; 0x9a95
	dw	39702                           ; 0x9b16
	dw	39831                           ; 0x9b97
	dw	39960                           ; 0x9c18
	dw	40089                           ; 0x9c99
	dw	40218                           ; 0x9d1a
	dw	40347                           ; 0x9d9b
	dw	40476                           ; 0x9e1c
	dw	40605                           ; 0x9e9d
	dw	40734                           ; 0x9f1e
	dw	40863                           ; 0x9f9f
	dw	8224                            ; 0x2020
	dw	8353                            ; 0x20a1
	dw	8482                            ; 0x2122
	dw	8611                            ; 0x21a3
	dw	8740                            ; 0x2224
	dw	8869                            ; 0x22a5
	dw	8998                            ; 0x2326
	dw	9127                            ; 0x23a7
	dw	9256                            ; 0x2428
	dw	9385                            ; 0x24a9
	dw	9514                            ; 0x252a
	dw	9643                            ; 0x25ab
	dw	9772                            ; 0x262c
	dw	9901                            ; 0x26ad
	dw	10030                           ; 0x272e
	dw	10159                           ; 0x27af
	dw	10288                           ; 0x2830
	dw	10417                           ; 0x28b1
	dw	10546                           ; 0x2932
	dw	10675                           ; 0x29b3
	dw	10804                           ; 0x2a34
	dw	10933                           ; 0x2ab5
	dw	11062                           ; 0x2b36
	dw	11191                           ; 0x2bb7
	dw	11320                           ; 0x2c38
	dw	11449                           ; 0x2cb9
	dw	11578                           ; 0x2d3a
	dw	11707                           ; 0x2dbb
	dw	11836                           ; 0x2e3c
	dw	11965                           ; 0x2ebd
	dw	12094                           ; 0x2f3e
	dw	12223                           ; 0x2fbf
	dw	45088                           ; 0xb020
	dw	45217                           ; 0xb0a1
	dw	45346                           ; 0xb122
	dw	45475                           ; 0xb1a3
	dw	45604                           ; 0xb224
	dw	45733                           ; 0xb2a5
	dw	45862                           ; 0xb326
	dw	45991                           ; 0xb3a7
	dw	46120                           ; 0xb428
	dw	46249                           ; 0xb4a9
	dw	46378                           ; 0xb52a
	dw	46507                           ; 0xb5ab
	dw	46636                           ; 0xb62c
	dw	46765                           ; 0xb6ad
	dw	46894                           ; 0xb72e
	dw	47023                           ; 0xb7af
	dw	47152                           ; 0xb830
	dw	47281                           ; 0xb8b1
	dw	47410                           ; 0xb932
	dw	47539                           ; 0xb9b3
	dw	47668                           ; 0xba34
	dw	47797                           ; 0xbab5
	dw	47926                           ; 0xbb36
	dw	48055                           ; 0xbbb7
	dw	48184                           ; 0xbc38
	dw	48313                           ; 0xbcb9
	dw	48442                           ; 0xbd3a
	dw	48571                           ; 0xbdbb
	dw	48700                           ; 0xbe3c
	dw	48829                           ; 0xbebd
	dw	48958                           ; 0xbf3e
	dw	49087                           ; 0xbfbf
	dw	16448                           ; 0x4040
	dw	16577                           ; 0x40c1
	dw	16706                           ; 0x4142
	dw	16835                           ; 0x41c3
	dw	16964                           ; 0x4244
	dw	17093                           ; 0x42c5
	dw	17222                           ; 0x4346
	dw	17351                           ; 0x43c7
	dw	17480                           ; 0x4448
	dw	17609                           ; 0x44c9
	dw	17738                           ; 0x454a
	dw	17867                           ; 0x45cb
	dw	17996                           ; 0x464c
	dw	18125                           ; 0x46cd
	dw	18254                           ; 0x474e
	dw	18383                           ; 0x47cf
	dw	18512                           ; 0x4850
	dw	18641                           ; 0x48d1
	dw	18770                           ; 0x4952
	dw	18899                           ; 0x49d3
	dw	19028                           ; 0x4a54
	dw	19157                           ; 0x4ad5
	dw	19286                           ; 0x4b56
	dw	19415                           ; 0x4bd7
	dw	19544                           ; 0x4c58
	dw	19673                           ; 0x4cd9
	dw	19802                           ; 0x4d5a
	dw	19931                           ; 0x4ddb
	dw	20060                           ; 0x4e5c
	dw	20189                           ; 0x4edd
	dw	20318                           ; 0x4f5e
	dw	20447                           ; 0x4fdf
	dw	53312                           ; 0xd040
	dw	53441                           ; 0xd0c1
	dw	53570                           ; 0xd142
	dw	53699                           ; 0xd1c3
	dw	53828                           ; 0xd244
	dw	53957                           ; 0xd2c5
	dw	54086                           ; 0xd346
	dw	54215                           ; 0xd3c7
	dw	54344                           ; 0xd448
	dw	54473                           ; 0xd4c9
	dw	54602                           ; 0xd54a
	dw	54731                           ; 0xd5cb
	dw	54860                           ; 0xd64c
	dw	54989                           ; 0xd6cd
	dw	55118                           ; 0xd74e
	dw	55247                           ; 0xd7cf
	dw	55376                           ; 0xd850
	dw	55505                           ; 0xd8d1
	dw	55634                           ; 0xd952
	dw	55763                           ; 0xd9d3
	dw	55892                           ; 0xda54
	dw	56021                           ; 0xdad5
	dw	56150                           ; 0xdb56
	dw	56279                           ; 0xdbd7
	dw	56408                           ; 0xdc58
	dw	56537                           ; 0xdcd9
	dw	56666                           ; 0xdd5a
	dw	56795                           ; 0xdddb
	dw	56924                           ; 0xde5c
	dw	57053                           ; 0xdedd
	dw	57182                           ; 0xdf5e
	dw	57311                           ; 0xdfdf
	dw	24672                           ; 0x6060
	dw	24801                           ; 0x60e1
	dw	24930                           ; 0x6162
	dw	25059                           ; 0x61e3
	dw	25188                           ; 0x6264
	dw	25317                           ; 0x62e5
	dw	25446                           ; 0x6366
	dw	25575                           ; 0x63e7
	dw	25704                           ; 0x6468
	dw	25833                           ; 0x64e9
	dw	25962                           ; 0x656a
	dw	26091                           ; 0x65eb
	dw	26220                           ; 0x666c
	dw	26349                           ; 0x66ed
	dw	26478                           ; 0x676e
	dw	26607                           ; 0x67ef
	dw	26736                           ; 0x6870
	dw	26865                           ; 0x68f1
	dw	26994                           ; 0x6972
	dw	27123                           ; 0x69f3
	dw	27252                           ; 0x6a74
	dw	27381                           ; 0x6af5
	dw	27510                           ; 0x6b76
	dw	27639                           ; 0x6bf7
	dw	27768                           ; 0x6c78
	dw	27897                           ; 0x6cf9
	dw	28026                           ; 0x6d7a
	dw	28155                           ; 0x6dfb
	dw	28284                           ; 0x6e7c
	dw	28413                           ; 0x6efd
	dw	28542                           ; 0x6f7e
	dw	28671                           ; 0x6fff
	dw	61536                           ; 0xf060
	dw	61665                           ; 0xf0e1
	dw	61794                           ; 0xf162
	dw	61923                           ; 0xf1e3
	dw	62052                           ; 0xf264
	dw	62181                           ; 0xf2e5
	dw	62310                           ; 0xf366
	dw	62439                           ; 0xf3e7
	dw	62568                           ; 0xf468
	dw	62697                           ; 0xf4e9
	dw	62826                           ; 0xf56a
	dw	62955                           ; 0xf5eb
	dw	63084                           ; 0xf66c
	dw	63213                           ; 0xf6ed
	dw	63342                           ; 0xf76e
	dw	63471                           ; 0xf7ef
	dw	63600                           ; 0xf870
	dw	63729                           ; 0xf8f1
	dw	63858                           ; 0xf972
	dw	63987                           ; 0xf9f3
	dw	64116                           ; 0xfa74
	dw	64245                           ; 0xfaf5
	dw	64374                           ; 0xfb76
	dw	64503                           ; 0xfbf7
	dw	64632                           ; 0xfc78
	dw	64761                           ; 0xfcf9
	dw	64890                           ; 0xfd7a
	dw	65019                           ; 0xfdfb
	dw	65148                           ; 0xfe7c
	dw	65277                           ; 0xfefd
	dw	65406                           ; 0xff7e
	dw	65535                           ; 0xffff

	.section	.rodata._.str.567,"a",@progbits
	.balign	1
	.local	_.str.567
_.str.567:
	.zero	1

	.section	.rodata._.str.1.549,"a",@progbits
	.balign	1
	.local	_.str.1.549
_.str.1.549:
	.asciz	"WORLD: %s - %s"

	.section	.rodata._.str.2.550,"a",@progbits
	.balign	1
	.local	_.str.2.550
_.str.2.550:
	.asciz	"WORLD: Ended: %s"

	.section	.rodata._.str.3.551,"a",@progbits
	.balign	1
	.local	_.str.3.551
_.str.3.551:
	.asciz	"ALERT: Outbreak discovered."

	.section	.rodata._.str.4.552,"a",@progbits
	.balign	1
	.local	_.str.4.552
_.str.4.552:
	.asciz	"ALERT: Cure research has begun."

	.section	.rodata._.str.5.553,"a",@progbits
	.balign	1
	.local	_.str.5.553
_.str.5.553:
	.asciz	"ALERT: Public response is escalating."

	.section	.rodata._.str.6.554,"a",@progbits
	.balign	1
	.local	_.str.6.554
_.str.6.554:
	.asciz	"ALERT: Cure reaches %u%%."

	.section	.rodata._.str.7.555,"a",@progbits
	.balign	1
	.local	_.str.7.555
_.str.7.555:
	.asciz	"ALERT: %s restricts travel."

	.section	.rodata._.str.8.556,"a",@progbits
	.balign	1
	.local	_.str.8.556
_.str.8.556:
	.asciz	"ALERT: %u regions restrict travel."

	.section	.rodata._.str.9.557,"a",@progbits
	.balign	1
	.local	_.str.9.557
_.str.9.557:
	.asciz	"FIELD: Mutation: %s."

	.section	.rodata._.str.10.558,"a",@progbits
	.balign	1
	.local	_.str.10.558
_.str.10.558:
	.asciz	"FIELD: Spore burst seeds %s."

	.section	.rodata._.str.11.559,"a",@progbits
	.balign	1
	.local	_.str.11.559
_.str.11.559:
	.asciz	"FIELD: First infection reaches %s."

	.section	.rodata._.str.12.560,"a",@progbits
	.balign	1
	.local	_.str.12.560
_.str.12.560:
	.asciz	"WORLD: Half of all land affected."

	.section	.rodata._.str.13.561,"a",@progbits
	.balign	1
	.local	_.str.13.561
_.str.13.561:
	.asciz	"WORLD: %u%% of all land affected."

	.section	.rodata._.str.14.562,"a",@progbits
	.balign	1
	.local	_.str.14.562
_.str.14.562:
	.asciz	"ALERT: Deaths reach %u%% worldwide."

	.section	.rodata._.str.15.563,"a",@progbits
	.balign	1
	.local	_.str.15.563
_.str.15.563:
	.asciz	"WORLD: Infection has reached %u of 7 regions."

	.section	.rodata._.str.16.564,"a",@progbits
	.balign	1
	.local	_.str.16.564
_.str.16.564:
	.asciz	"WORLD: Most healthy land remains in %s."

	.section	.rodata._.str.17.565,"a",@progbits
	.balign	1
	.local	_.str.17.565
_.str.17.565:
	.asciz	"WORLD: Cure research stands at %u.%02u%%."

	.section	.rodata._.str.18.566,"a",@progbits
	.balign	1
	.local	_.str.18.566
_.str.18.566:
	.asciz	"FIELD: Fungus has %u spore charges remaining."

	.section	.rodata._TickerObserve.affected,"a",@progbits
	.balign	1
	.local	_TickerObserve.affected
_TickerObserve.affected:
	.ascii	"\001\005\n\024#2FZd"

	.section	.rodata._TickerObserve.deaths,"a",@progbits
	.balign	1
	.local	_TickerObserve.deaths
_TickerObserve.deaths:
	.ascii	"\001\n\0312KZ"

	.section	.rodata._switch.table.TickerUpdate.27,"a",@progbits
	.balign	1
	.local	_switch.table.TickerUpdate.27
_switch.table.TickerUpdate.27:
	.ascii	"\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\001"

	.section	.rodata._.str.577,"a",@progbits
	.balign	1
	.local	_.str.577
_.str.577:
	.asciz	"Air I"

	.section	.rodata._.str.1.578,"a",@progbits
	.balign	1
	.local	_.str.1.578
_.str.1.578:
	.asciz	"Base air travel +12%; dry spread +2.2%/rating."

	.section	.rodata._.str.2.579,"a",@progbits
	.balign	1
	.local	_.str.2.579
_.str.2.579:
	.asciz	"Air II"

	.section	.rodata._.str.3.580,"a",@progbits
	.balign	1
	.local	_.str.3.580
_.str.3.580:
	.asciz	"Water I"

	.section	.rodata._.str.4.581,"a",@progbits
	.balign	1
	.local	_.str.4.581
_.str.4.581:
	.asciz	"Base sea travel +12%; humid spread +2.2%/rating."

	.section	.rodata._.str.5.582,"a",@progbits
	.balign	1
	.local	_.str.5.582
_.str.5.582:
	.asciz	"Water II"

	.section	.rodata._.str.6.583,"a",@progbits
	.balign	1
	.local	_.str.6.583
_.str.6.583:
	.asciz	"Livestock I"

	.section	.rodata._.str.7.584,"a",@progbits
	.balign	1
	.local	_.str.7.584
_.str.7.584:
	.asciz	"Rural spread +2.8% per rating."

	.section	.rodata._.str.8.585,"a",@progbits
	.balign	1
	.local	_.str.8.585
_.str.8.585:
	.asciz	"Livestock II"

	.section	.rodata._.str.9.586,"a",@progbits
	.balign	1
	.local	_.str.9.586
_.str.9.586:
	.asciz	"Rodents I"

	.section	.rodata._.str.10.587,"a",@progbits
	.balign	1
	.local	_.str.10.587
_.str.10.587:
	.asciz	"Urban spread +2.8% per rating."

	.section	.rodata._.str.11.588,"a",@progbits
	.balign	1
	.local	_.str.11.588
_.str.11.588:
	.asciz	"Rodents II"

	.section	.rodata._.str.12.589,"a",@progbits
	.balign	1
	.local	_.str.12.589
_.str.12.589:
	.asciz	"Insects I"

	.section	.rodata._.str.13.590,"a",@progbits
	.balign	1
	.local	_.str.13.590
_.str.13.590:
	.asciz	"Warm spread +2.8% per rating."

	.section	.rodata._.str.14.591,"a",@progbits
	.balign	1
	.local	_.str.14.591
_.str.14.591:
	.asciz	"Insects II"

	.section	.rodata._.str.15.592,"a",@progbits
	.balign	1
	.local	_.str.15.592
_.str.15.592:
	.asciz	"Birds I"

	.section	.rodata._.str.16.593,"a",@progbits
	.balign	1
	.local	_.str.16.593
_.str.16.593:
	.asciz	"Neighbor migration; small general spread."

	.section	.rodata._.str.17.594,"a",@progbits
	.balign	1
	.local	_.str.17.594
_.str.17.594:
	.asciz	"Birds II"

	.section	.rodata._.str.18.595,"a",@progbits
	.balign	1
	.local	_.str.18.595
_.str.18.595:
	.asciz	"Blood I"

	.section	.rodata._.str.19.596,"a",@progbits
	.balign	1
	.local	_.str.19.596
_.str.19.596:
	.asciz	"Spread +1.5%; weak healthcare adds more."

	.section	.rodata._.str.20.597,"a",@progbits
	.balign	1
	.local	_.str.20.597
_.str.20.597:
	.asciz	"Blood II"

	.section	.rodata._.str.21.598,"a",@progbits
	.balign	1
	.local	_.str.21.598
_.str.21.598:
	.asciz	"Aerosol Persistence"

	.section	.rodata._.str.22.599,"a",@progbits
	.balign	1
	.local	_.str.22.599
_.str.22.599:
	.asciz	"Base air/sea +10%; spread +3%."

	.section	.rodata._.str.23.600,"a",@progbits
	.balign	1
	.local	_.str.23.600
_.str.23.600:
	.asciz	"Animal Reservoirs"

	.section	.rodata._.str.24.601,"a",@progbits
	.balign	1
	.local	_.str.24.601
_.str.24.601:
	.asciz	"Bridges sparse urban/rural areas; +6% spread."

	.section	.rodata._.str.25.602,"a",@progbits
	.balign	1
	.local	_.str.25.602
_.str.25.602:
	.asciz	"Vector Adaptation"

	.section	.rodata._.str.26.603,"a",@progbits
	.balign	1
	.local	_.str.26.603
_.str.26.603:
	.asciz	"Cold vector spread; migration +2%."

	.section	.rodata._.str.27.604,"a",@progbits
	.balign	1
	.local	_.str.27.604
_.str.27.604:
	.asciz	"Cough"

	.section	.rodata._.str.28.605,"a",@progbits
	.balign	1
	.local	_.str.28.605
_.str.28.605:
	.asciz	"Early spread; small detection risk."

	.section	.rodata._.str.29.606,"a",@progbits
	.balign	1
	.local	_.str.29.606
_.str.29.606:
	.asciz	"Sneezing"

	.section	.rodata._.str.30.607,"a",@progbits
	.balign	1
	.local	_.str.30.607
_.str.30.607:
	.asciz	"More spread; modest detection risk."

	.section	.rodata._.str.31.608,"a",@progbits
	.balign	1
	.local	_.str.31.608
_.str.31.608:
	.asciz	"Pneumonia"

	.section	.rodata._.str.32.609,"a",@progbits
	.balign	1
	.local	_.str.32.609
_.str.32.609:
	.asciz	"Stronger symptoms; some deaths."

	.section	.rodata._.str.33.610,"a",@progbits
	.balign	1
	.local	_.str.33.610
_.str.33.610:
	.asciz	"Respiratory Failure"

	.section	.rodata._.str.34.611,"a",@progbits
	.balign	1
	.local	_.str.34.611
_.str.34.611:
	.asciz	"High lethality; strong human response."

	.section	.rodata._.str.35.612,"a",@progbits
	.balign	1
	.local	_.str.35.612
_.str.35.612:
	.asciz	"Nausea"

	.section	.rodata._.str.36.613,"a",@progbits
	.balign	1
	.local	_.str.36.613
_.str.36.613:
	.asciz	"Vomiting"

	.section	.rodata._.str.37.614,"a",@progbits
	.balign	1
	.local	_.str.37.614
_.str.37.614:
	.asciz	"Diarrhea"

	.section	.rodata._.str.38.615,"a",@progbits
	.balign	1
	.local	_.str.38.615
_.str.38.615:
	.asciz	"Systemic Collapse"

	.section	.rodata._.str.39.616,"a",@progbits
	.balign	1
	.local	_.str.39.616
_.str.39.616:
	.asciz	"Rash"

	.section	.rodata._.str.40.617,"a",@progbits
	.balign	1
	.local	_.str.40.617
_.str.40.617:
	.asciz	"Fever"

	.section	.rodata._.str.41.618,"a",@progbits
	.balign	1
	.local	_.str.41.618
_.str.41.618:
	.asciz	"Immune Suppression"

	.section	.rodata._.str.42.619,"a",@progbits
	.balign	1
	.local	_.str.42.619
_.str.42.619:
	.asciz	"Organ Failure"

	.section	.rodata._.str.43.620,"a",@progbits
	.balign	1
	.local	_.str.43.620
_.str.43.620:
	.asciz	"Heat Adaptation I"

	.section	.rodata._.str.44.621,"a",@progbits
	.balign	1
	.local	_.str.44.621
_.str.44.621:
	.asciz	"Reduce heat penalty by 45%."

	.section	.rodata._.str.45.622,"a",@progbits
	.balign	1
	.local	_.str.45.622
_.str.45.622:
	.asciz	"Heat Adaptation II"

	.section	.rodata._.str.46.623,"a",@progbits
	.balign	1
	.local	_.str.46.623
_.str.46.623:
	.asciz	"Reduce heat penalty by another 45%."

	.section	.rodata._.str.47.624,"a",@progbits
	.balign	1
	.local	_.str.47.624
_.str.47.624:
	.asciz	"Cold Adaptation I"

	.section	.rodata._.str.48.625,"a",@progbits
	.balign	1
	.local	_.str.48.625
_.str.48.625:
	.asciz	"Reduce cold penalty by 45%."

	.section	.rodata._.str.49.626,"a",@progbits
	.balign	1
	.local	_.str.49.626
_.str.49.626:
	.asciz	"Cold Adaptation II"

	.section	.rodata._.str.50.627,"a",@progbits
	.balign	1
	.local	_.str.50.627
_.str.50.627:
	.asciz	"Reduce cold penalty by another 45%."

	.section	.rodata._.str.51.628,"a",@progbits
	.balign	1
	.local	_.str.51.628
_.str.51.628:
	.asciz	"Medical Resistance I"

	.section	.rodata._.str.52.629,"a",@progbits
	.balign	1
	.local	_.str.52.629
_.str.52.629:
	.asciz	"Reduce healthcare penalty by 45%."

	.section	.rodata._.str.53.630,"a",@progbits
	.balign	1
	.local	_.str.53.630
_.str.53.630:
	.asciz	"Medical Resistance II"

	.section	.rodata._.str.54.631,"a",@progbits
	.balign	1
	.local	_.str.54.631
_.str.54.631:
	.asciz	"Reduce healthcare penalty by another 45%."

	.section	.rodata._.str.55.632,"a",@progbits
	.balign	1
	.local	_.str.55.632
_.str.55.632:
	.asciz	"Genetic Hardening I"

	.section	.rodata._.str.56.633,"a",@progbits
	.balign	1
	.local	_.str.56.633
_.str.56.633:
	.asciz	"Slow future research by 30%."

	.section	.rodata._.str.57.634,"a",@progbits
	.balign	1
	.local	_.str.57.634
_.str.57.634:
	.asciz	"Genetic Hardening II"

	.section	.rodata._.str.58.635,"a",@progbits
	.balign	1
	.local	_.str.58.635
_.str.58.635:
	.asciz	"Slow research by another 30%."

	.section	.rodata._.str.59.636,"a",@progbits
	.balign	1
	.local	_.str.59.636
_.str.59.636:
	.asciz	"Genetic Reshuffle I"

	.section	.rodata._.str.60.637,"a",@progbits
	.balign	1
	.local	_.str.60.637
_.str.60.637:
	.asciz	"Once: remove 15 cure percentage points."

	.section	.rodata._.str.61.638,"a",@progbits
	.balign	1
	.local	_.str.61.638
_.str.61.638:
	.asciz	"Genetic Reshuffle II"

	.section	.rodata._.str.62.639,"a",@progbits
	.balign	1
	.local	_.str.62.639
_.str.62.639:
	.asciz	"Once: remove 25 cure percentage points."

	.section	.rodata._traits,"a",@progbits
	.balign	2
	.globl	_traits
_traits:
	d24	_.str.577
	d24	_.str.1.578
	.zero	2,255
	db	6                               ; 0x6
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	0                               ; 0x0
	.zero	1
	dw	22                              ; 0x16
	db	65                              ; 0x41
	.ascii	"\000\002\000\001"
	.zero	1
	d24	_.str.2.579
	d24	_.str.1.578
	.ascii	"\000\377"
	db	10                              ; 0xa
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	0                               ; 0x0
	.zero	1
	dw	22                              ; 0x16
	db	107                             ; 0x6b
	.ascii	"\001\003\000\016"
	.zero	1
	d24	_.str.3.580
	d24	_.str.4.581
	.zero	2,255
	db	6                               ; 0x6
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	0                               ; 0x0
	.zero	1
	dw	67                              ; 0x43
	db	65                              ; 0x41
	.ascii	"\000\004\002\003"
	.zero	1
	d24	_.str.5.582
	d24	_.str.4.581
	.ascii	"\002\377"
	db	10                              ; 0xa
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	0                               ; 0x0
	.zero	1
	dw	67                              ; 0x43
	db	107                             ; 0x6b
	.ascii	"\001\005\002\016"
	.zero	1
	d24	_.str.6.583
	d24	_.str.7.584
	.zero	2,255
	db	6                               ; 0x6
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	0                               ; 0x0
	.zero	1
	dw	112                             ; 0x70
	db	65                              ; 0x41
	.ascii	"\002\006\004\005"
	.zero	1
	d24	_.str.8.585
	d24	_.str.7.584
	.ascii	"\004\377"
	db	10                              ; 0xa
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	0                               ; 0x0
	.zero	1
	dw	112                             ; 0x70
	db	107                             ; 0x6b
	.ascii	"\003\007\004\017"
	.zero	1
	d24	_.str.9.586
	d24	_.str.10.587
	.zero	2,255
	db	6                               ; 0x6
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	0                               ; 0x0
	.zero	1
	dw	157                             ; 0x9d
	db	65                              ; 0x41
	.ascii	"\004\b\006\007"
	.zero	1
	d24	_.str.11.588
	d24	_.str.10.587
	.ascii	"\006\377"
	db	10                              ; 0xa
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	0                               ; 0x0
	.zero	1
	dw	157                             ; 0x9d
	db	107                             ; 0x6b
	.ascii	"\005\t\006\017"
	.zero	1
	d24	_.str.12.589
	d24	_.str.13.590
	.zero	2,255
	db	6                               ; 0x6
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	0                               ; 0x0
	.zero	1
	dw	202                             ; 0xca
	db	65                              ; 0x41
	.ascii	"\006\n\b\t"
	.zero	1
	d24	_.str.14.591
	d24	_.str.13.590
	.ascii	"\b\377"
	db	10                              ; 0xa
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	0                               ; 0x0
	.zero	1
	dw	202                             ; 0xca
	db	107                             ; 0x6b
	.ascii	"\007\013\b\020"
	.zero	1
	d24	_.str.15.592
	d24	_.str.16.593
	.zero	2,255
	db	6                               ; 0x6
	db	0                               ; 0x0
	db	2                               ; 0x2
	db	0                               ; 0x0
	db	0                               ; 0x0
	.zero	1
	dw	247                             ; 0xf7
	db	65                              ; 0x41
	.ascii	"\b\f\n\013"
	.zero	1
	d24	_.str.17.594
	d24	_.str.16.593
	.ascii	"\n\377"
	db	10                              ; 0xa
	db	0                               ; 0x0
	db	2                               ; 0x2
	db	0                               ; 0x0
	db	0                               ; 0x0
	.zero	1
	dw	247                             ; 0xf7
	db	107                             ; 0x6b
	.ascii	"\t\r\n\020"
	.zero	1
	d24	_.str.18.595
	d24	_.str.19.596
	.zero	2,255
	db	6                               ; 0x6
	db	0                               ; 0x0
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	0                               ; 0x0
	.zero	1
	dw	292                             ; 0x124
	db	65                              ; 0x41
	.ascii	"\n\f\f\r"
	.zero	1
	d24	_.str.20.597
	d24	_.str.19.596
	.ascii	"\f\377"
	db	10                              ; 0xa
	db	0                               ; 0x0
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	0                               ; 0x0
	.zero	1
	dw	292                             ; 0x124
	db	107                             ; 0x6b
	.ascii	"\013\r\f\020"
	.zero	1
	d24	_.str.21.598
	d24	_.str.22.599
	.ascii	"\001\003"
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	0                               ; 0x0
	.zero	1
	dw	45                              ; 0x2d
	db	148                             ; 0x94
	.ascii	"\001\017\003\016"
	.zero	1
	d24	_.str.23.600
	d24	_.str.24.601
	.ascii	"\005\007"
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	0                               ; 0x0
	.zero	1
	dw	135                             ; 0x87
	db	148                             ; 0x94
	.ascii	"\016\020\007\017"
	.zero	1
	d24	_.str.25.602
	d24	_.str.26.603
	.ascii	"\t\013"
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	0                               ; 0x0
	.zero	1
	dw	225                             ; 0xe1
	db	148                             ; 0x94
	.ascii	"\017\013\013\020"
	.zero	1
	d24	_.str.27.604
	d24	_.str.28.605
	.zero	2,255
	db	5                               ; 0x5
	db	1                               ; 0x1
	db	5                               ; 0x5
	db	2                               ; 0x2
	db	0                               ; 0x0
	.zero	1
	dw	55                              ; 0x37
	db	58                              ; 0x3a
	.ascii	"\021\025\021\022"
	.zero	1
	d24	_.str.29.606
	d24	_.str.30.607
	.ascii	"\021\377"
	db	8                               ; 0x8
	db	1                               ; 0x1
	db	8                               ; 0x8
	db	4                               ; 0x4
	db	0                               ; 0x0
	.zero	1
	dw	55                              ; 0x37
	db	87                              ; 0x57
	.ascii	"\022\026\021\023"
	.zero	1
	d24	_.str.31.608
	d24	_.str.32.609
	.ascii	"\022\377"
	db	12                              ; 0xc
	db	1                               ; 0x1
	db	6                               ; 0x6
	db	10                              ; 0xa
	db	1                               ; 0x1
	.zero	1
	dw	55                              ; 0x37
	db	116                             ; 0x74
	.ascii	"\023\027\022\024"
	.zero	1
	d24	_.str.33.610
	d24	_.str.34.611
	.ascii	"\023\377"
	db	18                              ; 0x12
	db	1                               ; 0x1
	db	2                               ; 0x2
	db	24                              ; 0x18
	db	5                               ; 0x5
	.zero	1
	dw	55                              ; 0x37
	db	145                             ; 0x91
	.ascii	"\024\030\023\024"
	.zero	1
	d24	_.str.35.612
	d24	_.str.28.605
	.zero	2,255
	db	5                               ; 0x5
	db	1                               ; 0x1
	db	5                               ; 0x5
	db	2                               ; 0x2
	db	0                               ; 0x0
	.zero	1
	dw	160                             ; 0xa0
	db	58                              ; 0x3a
	.ascii	"\021\031\025\026"
	.zero	1
	d24	_.str.36.613
	d24	_.str.30.607
	.ascii	"\025\377"
	db	8                               ; 0x8
	db	1                               ; 0x1
	db	8                               ; 0x8
	db	4                               ; 0x4
	db	0                               ; 0x0
	.zero	1
	dw	160                             ; 0xa0
	db	87                              ; 0x57
	.ascii	"\022\032\025\027"
	.zero	1
	d24	_.str.37.614
	d24	_.str.32.609
	.ascii	"\026\377"
	db	12                              ; 0xc
	db	1                               ; 0x1
	db	6                               ; 0x6
	db	10                              ; 0xa
	db	1                               ; 0x1
	.zero	1
	dw	160                             ; 0xa0
	db	116                             ; 0x74
	.ascii	"\023\033\026\030"
	.zero	1
	d24	_.str.38.615
	d24	_.str.34.611
	.ascii	"\027\377"
	db	18                              ; 0x12
	db	1                               ; 0x1
	db	2                               ; 0x2
	db	24                              ; 0x18
	db	5                               ; 0x5
	.zero	1
	dw	160                             ; 0xa0
	db	145                             ; 0x91
	.ascii	"\024\034\027\030"
	.zero	1
	d24	_.str.39.616
	d24	_.str.28.605
	.zero	2,255
	db	5                               ; 0x5
	db	1                               ; 0x1
	db	5                               ; 0x5
	db	2                               ; 0x2
	db	0                               ; 0x0
	.zero	1
	dw	265                             ; 0x109
	db	58                              ; 0x3a
	.ascii	"\025\031\031\032"
	.zero	1
	d24	_.str.40.617
	d24	_.str.30.607
	.ascii	"\031\377"
	db	8                               ; 0x8
	db	1                               ; 0x1
	db	8                               ; 0x8
	db	4                               ; 0x4
	db	0                               ; 0x0
	.zero	1
	dw	265                             ; 0x109
	db	87                              ; 0x57
	.ascii	"\026\032\031\033"
	.zero	1
	d24	_.str.41.618
	d24	_.str.32.609
	.ascii	"\032\377"
	db	12                              ; 0xc
	db	1                               ; 0x1
	db	6                               ; 0x6
	db	10                              ; 0xa
	db	1                               ; 0x1
	.zero	1
	dw	265                             ; 0x109
	db	116                             ; 0x74
	.ascii	"\027\033\032\034"
	.zero	1
	d24	_.str.42.619
	d24	_.str.34.611
	.ascii	"\033\377"
	db	18                              ; 0x12
	db	1                               ; 0x1
	db	2                               ; 0x2
	db	24                              ; 0x18
	db	5                               ; 0x5
	.zero	1
	dw	265                             ; 0x109
	db	145                             ; 0x91
	.ascii	"\030\034\033\034"
	.zero	1
	d24	_.str.43.620
	d24	_.str.44.621
	.zero	2,255
	db	8                               ; 0x8
	db	2                               ; 0x2
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	0                               ; 0x0
	.zero	1
	dw	32                              ; 0x20
	db	75                              ; 0x4b
	.ascii	"\035\037\035\036"
	.zero	1
	d24	_.str.45.622
	d24	_.str.46.623
	.ascii	"\035\377"
	db	14                              ; 0xe
	db	2                               ; 0x2
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	0                               ; 0x0
	.zero	1
	dw	32                              ; 0x20
	db	130                             ; 0x82
	.ascii	"\036 \035\036"
	.zero	1
	d24	_.str.47.624
	d24	_.str.48.625
	.zero	2,255
	db	8                               ; 0x8
	db	2                               ; 0x2
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	0                               ; 0x0
	.zero	1
	dw	95                              ; 0x5f
	db	75                              ; 0x4b
	.ascii	"\035!\037 "
	.zero	1
	d24	_.str.49.626
	d24	_.str.50.627
	.ascii	"\037\377"
	db	14                              ; 0xe
	db	2                               ; 0x2
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	0                               ; 0x0
	.zero	1
	dw	95                              ; 0x5f
	db	130                             ; 0x82
	.ascii	"\036\042\037 "
	.zero	1
	d24	_.str.51.628
	d24	_.str.52.629
	.zero	2,255
	db	8                               ; 0x8
	db	2                               ; 0x2
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	0                               ; 0x0
	.zero	1
	dw	158                             ; 0x9e
	db	75                              ; 0x4b
	.ascii	"\037#!\042"
	.zero	1
	d24	_.str.53.630
	d24	_.str.54.631
	.ascii	"!\377"
	db	14                              ; 0xe
	db	2                               ; 0x2
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	0                               ; 0x0
	.zero	1
	dw	158                             ; 0x9e
	db	130                             ; 0x82
	.ascii	" $!\042"
	.zero	1
	d24	_.str.55.632
	d24	_.str.56.633
	.zero	2,255
	db	8                               ; 0x8
	db	2                               ; 0x2
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	0                               ; 0x0
	.zero	1
	dw	221                             ; 0xdd
	db	75                              ; 0x4b
	.ascii	"!%#$"
	.zero	1
	d24	_.str.57.634
	d24	_.str.58.635
	.ascii	"#\377"
	db	14                              ; 0xe
	db	2                               ; 0x2
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	0                               ; 0x0
	.zero	1
	dw	221                             ; 0xdd
	db	130                             ; 0x82
	.ascii	"\042&#$"
	.zero	1
	d24	_.str.59.636
	d24	_.str.60.637
	.zero	2,255
	db	16                              ; 0x10
	db	2                               ; 0x2
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	0                               ; 0x0
	.zero	1
	dw	284                             ; 0x11c
	db	75                              ; 0x4b
	.ascii	"#%%&"
	.zero	1
	d24	_.str.61.638
	d24	_.str.62.639
	.ascii	"%\377"
	db	24                              ; 0x18
	db	2                               ; 0x2
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	0                               ; 0x0
	.zero	1
	dw	284                             ; 0x11c
	db	130                             ; 0x82
	.ascii	"$&%&"
	.zero	1

	.section	.rodata._neighbors,"a",@progbits
	.balign	1
	.local	_neighbors
_neighbors:
	.ascii	"&U\013\024*\021\002"

	.section	.bss._canpress,"aw",@nobits
	.balign	1
	.local	_canpress
_canpress:
	.zero	1

	.section	.rodata._.str.670,"a",@progbits
	.balign	1
	.local	_.str.670
_.str.670:
	.asciz	">"

	.section	.rodata._.str.1.671,"a",@progbits
	.balign	1
	.local	_.str.1.671
_.str.1.671:
	.asciz	" "

	.section	.rodata._.str.2.678,"a",@progbits
	.balign	1
	.local	_.str.2.678
_.str.2.678:
	.asciz	"Up/Down: select   Enter: confirm"

	.section	.rodata._.str.3.679,"a",@progbits
	.balign	1
	.local	_.str.3.679
_.str.3.679:
	.asciz	"Clear: back"

	.section	.rodata._.str.4.682,"a",@progbits
	.balign	1
	.local	_.str.4.682
_.str.4.682:
	.asciz	"Back (Enter / Clear)"

	.section	.bss._region,"aw",@nobits
	.balign	2
	.globl	_region
_region:
	.zero	112

	.section	.bss._world_events,"aw",@nobits
	.balign	1
	.globl	_world_events
_world_events:
	.zero	50

	.section	.bss._disease,"aw",@nobits
	.balign	2
	.globl	_disease
_disease:
	.zero	58

	.section	.bss._effects,"aw",@nobits
	.balign	2
	.globl	_effects
_effects:
	.zero	28

	.section	.bss._event_modifiers,"aw",@nobits
	.balign	2
	.globl	_event_modifiers
_event_modifiers:
	.zero	48

	.section	.bss._session,"aw",@nobits
	.balign	1
	.globl	_session
_session:
	.zero	9

	.section	.bss._port,"aw",@nobits
	.balign	1
	.globl	_port
_port:
	.zero	132

	.section	.rodata._port_definitions,"a",@progbits
	.balign	1
	.globl	_port_definitions
_port_definitions:
	db	12                              ; 0xc
	db	46                              ; 0x2e
	db	4                               ; 0x4
	db	3                               ; 0x3
	db	20                              ; 0x14
	db	0                               ; 0x0
	db	28                              ; 0x1c
	db	50                              ; 0x32
	db	4                               ; 0x4
	db	1                               ; 0x1
	db	70                              ; 0x46
	db	0                               ; 0x0
	db	37                              ; 0x25
	db	40                              ; 0x28
	db	4                               ; 0x4
	db	3                               ; 0x3
	db	50                              ; 0x32
	db	0                               ; 0x0
	db	54                              ; 0x36
	db	24                              ; 0x18
	db	3                               ; 0x3
	db	3                               ; 0x3
	db	30                              ; 0x1e
	db	0                               ; 0x0
	db	34                              ; 0x22
	db	62                              ; 0x3e
	db	5                               ; 0x5
	db	3                               ; 0x3
	db	50                              ; 0x32
	db	0                               ; 0x0
	db	30                              ; 0x1e
	db	72                              ; 0x48
	db	5                               ; 0x5
	db	2                               ; 0x2
	db	90                              ; 0x5a
	db	0                               ; 0x0
	db	48                              ; 0x30
	db	74                              ; 0x4a
	db	5                               ; 0x5
	db	3                               ; 0x3
	db	60                              ; 0x3c
	db	0                               ; 0x0
	db	84                              ; 0x54
	db	84                              ; 0x54
	db	0                               ; 0x0
	db	3                               ; 0x3
	db	60                              ; 0x3c
	db	0                               ; 0x0
	db	74                              ; 0x4a
	db	60                              ; 0x3c
	db	0                               ; 0x0
	db	1                               ; 0x1
	db	30                              ; 0x1e
	db	0                               ; 0x0
	db	94                              ; 0x5e
	db	80                              ; 0x50
	db	0                               ; 0x0
	db	2                               ; 0x2
	db	40                              ; 0x28
	db	0                               ; 0x0
	db	94                              ; 0x5e
	db	52                              ; 0x34
	db	1                               ; 0x1
	db	3                               ; 0x3
	db	50                              ; 0x32
	db	0                               ; 0x0
	db	68                              ; 0x44
	db	44                              ; 0x2c
	db	2                               ; 0x2
	db	3                               ; 0x3
	db	40                              ; 0x28
	db	0                               ; 0x0
	db	86                              ; 0x56
	db	36                              ; 0x24
	db	2                               ; 0x2
	db	1                               ; 0x1
	db	40                              ; 0x28
	db	0                               ; 0x0
	db	112                             ; 0x70
	db	54                              ; 0x36
	db	1                               ; 0x1
	db	1                               ; 0x1
	db	50                              ; 0x32
	db	0                               ; 0x0
	db	128                             ; 0x80
	db	50                              ; 0x32
	db	1                               ; 0x1
	db	3                               ; 0x3
	db	80                              ; 0x50
	db	0                               ; 0x0
	db	138                             ; 0x8a
	db	46                              ; 0x2e
	db	1                               ; 0x1
	db	2                               ; 0x2
	db	40                              ; 0x28
	db	0                               ; 0x0
	db	134                             ; 0x86
	db	58                              ; 0x3a
	db	1                               ; 0x1
	db	3                               ; 0x3
	db	50                              ; 0x32
	db	0                               ; 0x0
	db	141                             ; 0x8d
	db	68                              ; 0x44
	db	6                               ; 0x6
	db	3                               ; 0x3
	db	40                              ; 0x28
	db	0                               ; 0x0
	db	142                             ; 0x8e
	db	68                              ; 0x44
	db	6                               ; 0x6
	db	2                               ; 0x2
	db	50                              ; 0x32
	db	0                               ; 0x0
	db	146                             ; 0x92
	db	84                              ; 0x54
	db	6                               ; 0x6
	db	1                               ; 0x1
	db	90                              ; 0x5a
	db	0                               ; 0x0
	db	153                             ; 0x99
	db	94                              ; 0x5e
	db	6                               ; 0x6
	db	3                               ; 0x3
	db	50                              ; 0x32
	db	0                               ; 0x0
	db	146                             ; 0x92
	db	70                              ; 0x46
	db	6                               ; 0x6
	db	2                               ; 0x2
	db	40                              ; 0x28
	db	0                               ; 0x0

	.section	.bss._connection,"aw",@nobits
	.balign	1
	.local	_connection
_connection:
	.zero	1

	.section	.bss._destination_port,"aw",@nobits
	.balign	1
	.local	_destination_port
_destination_port:
	.zero	1

	.section	.bss._source_port,"aw",@nobits
	.balign	1
	.local	_source_port
_source_port:
	.zero	1

	.section	.rodata._.str.5.687,"a",@progbits
	.balign	1
	.local	_.str.5.687
_.str.5.687:
	.asciz	"Resume"

	.section	.rodata._.str.6.688,"a",@progbits
	.balign	1
	.local	_.str.6.688
_.str.6.688:
	.asciz	"Evolution"

	.section	.rodata._.str.7.689,"a",@progbits
	.balign	1
	.local	_.str.7.689
_.str.7.689:
	.asciz	"Region Details"

	.section	.rodata._.str.8.691,"a",@progbits
	.balign	1
	.local	_.str.8.691
_.str.8.691:
	.asciz	"Travel View: ON (toggle)"

	.section	.rodata._.str.9.690,"a",@progbits
	.balign	1
	.local	_.str.9.690
_.str.9.690:
	.asciz	"Travel View: OFF (toggle)"

	.section	.rodata._.str.10.692,"a",@progbits
	.balign	1
	.local	_.str.10.692
_.str.10.692:
	.asciz	"World Events"

	.section	.rodata._.str.11.693,"a",@progbits
	.balign	1
	.local	_.str.11.693
_.str.11.693:
	.asciz	"Spore Burst: %u left, %u DNA"

	.section	.rodata._spore_costs,"a",@progbits
	.balign	1
	.globl	_spore_costs
_spore_costs:
	.ascii	"\n\020\030"

	.section	.rodata._.str.12.694,"a",@progbits
	.balign	1
	.local	_.str.12.694
_.str.12.694:
	.asciz	"Spore Burst: no charges left"

	.section	.rodata._.str.13.695,"a",@progbits
	.balign	1
	.local	_.str.13.695
_.str.13.695:
	.asciz	"Save & Main Menu"

	.section	.rodata._.str.14.696,"a",@progbits
	.balign	1
	.local	_.str.14.696
_.str.14.696:
	.asciz	"Save & Quit"

	.section	.rodata._.str.15.697,"a",@progbits
	.balign	1
	.local	_.str.15.697
_.str.15.697:
	.asciz	"PAUSED: ACTIONS"

	.section	.rodata._.str.16.698,"a",@progbits
	.balign	1
	.local	_.str.16.698
_.str.16.698:
	.asciz	"^ more"

	.section	.rodata._.str.17.699,"a",@progbits
	.balign	1
	.local	_.str.17.699
_.str.17.699:
	.asciz	"v more"

	.section	.rodata._.str.18.700,"a",@progbits
	.balign	1
	.local	_.str.18.700
_.str.18.700:
	.asciz	"Clear: resume"

	.section	.rodata._contagion_game_main.choices,"a",@progbits
	.balign	1
	.local	_contagion_game_main.choices
_contagion_game_main.choices:
	d24	_.str.19.740
	d24	_.str.20.741

	.section	.rodata._.str.19.740,"a",@progbits
	.balign	1
	.local	_.str.19.740
_.str.19.740:
	.asciz	"Continue version-2 save"

	.section	.rodata._.str.20.741,"a",@progbits
	.balign	1
	.local	_.str.20.741
_.str.20.741:
	.asciz	"Start fresh"

	.section	.rodata._.str.21.707,"a",@progbits
	.balign	1
	.local	_.str.21.707
_.str.21.707:
	.asciz	"OLDER SAVE FOUND"

	.section	.rodata._.str.22.708,"a",@progbits
	.balign	1
	.local	_.str.22.708
_.str.22.708:
	.asciz	"IMPORT FAILED"

	.section	.rodata._.str.23.709,"a",@progbits
	.balign	1
	.local	_.str.23.709
_.str.23.709:
	.asciz	"The older save could not be loaded. It has not been changed."

	.section	.rodata._.str.24.710,"a",@progbits
	.balign	1
	.local	_.str.24.710
_.str.24.710:
	.asciz	"CONTAGION CE 2.0"

	.section	.rodata._.str.25.711,"a",@progbits
	.balign	1
	.local	_.str.25.711
_.str.25.711:
	.asciz	"Seven regions. One extinction objective."

	.section	.rodata._.str.26.712,"a",@progbits
	.balign	1
	.local	_.str.26.712
_.str.26.712:
	.asciz	"Spread quietly, earn DNA, then evolve lethal symptoms before humanity completes its cure."

	.section	.rodata._.str.27.713,"a",@progbits
	.balign	1
	.local	_.str.27.713
_.str.27.713:
	.asciz	"New Game"

	.section	.rodata._.str.28.714,"a",@progbits
	.balign	1
	.local	_.str.28.714
_.str.28.714:
	.asciz	"Continue"

	.section	.rodata._.str.29.715,"a",@progbits
	.balign	1
	.local	_.str.29.715
_.str.29.715:
	.asciz	"Results"

	.section	.rodata._.str.30.716,"a",@progbits
	.balign	1
	.local	_.str.30.716
_.str.30.716:
	.asciz	"Clear: select Save & Quit"

	.section	.bss._native_check,"aw",@nobits
	.balign	2
	.globl	_native_check
_native_check:
	.zero	2

	.section	.rodata._.str.31.756,"a",@progbits
	.balign	1
	.local	_.str.31.756
_.str.31.756:
	.asciz	"PASS: EVENT AND SAVE CHECKS"

	.section	.rodata._.str.32.757,"a",@progbits
	.balign	1
	.local	_.str.32.757
_.str.32.757:
	.asciz	"FileIOC v3 backup and v2 import"

	.section	.rodata._.str.33.758,"a",@progbits
	.balign	1
	.local	_.str.33.758
_.str.33.758:
	.asciz	"Both chain branches, expiry and cancel"

	.section	.rodata._.str.34.759,"a",@progbits
	.balign	1
	.local	_.str.34.759
_.str.34.759:
	.asciz	"Closed ports persist"

	.section	.rodata._.str.35.760,"a",@progbits
	.balign	1
	.local	_.str.35.760
_.str.35.760:
	.asciz	"PASS: EVENT MENU CHECKS"

	.section	.rodata._SaveExit.choices,"a",@progbits
	.balign	1
	.local	_SaveExit.choices
_SaveExit.choices:
	d24	_.str.36.705
	d24	_.str.37.706
	d24	_.str.38.704

	.section	.rodata._.str.36.705,"a",@progbits
	.balign	1
	.local	_.str.36.705
_.str.36.705:
	.asciz	"Return to game/menu"

	.section	.rodata._.str.37.706,"a",@progbits
	.balign	1
	.local	_.str.37.706
_.str.37.706:
	.asciz	"Retry save"

	.section	.rodata._.str.38.704,"a",@progbits
	.balign	1
	.local	_.str.38.704
_.str.38.704:
	.asciz	"Quit Without Saving"

	.section	.rodata._.str.39.701,"a",@progbits
	.balign	1
	.local	_.str.39.701
_.str.39.701:
	.asciz	"SAVE FAILED: FREE CALCULATOR RAM"

	.section	.rodata._SaveExit.confirm,"a",@progbits
	.balign	1
	.local	_SaveExit.confirm
_SaveExit.confirm:
	d24	_.str.40.703
	d24	_.str.38.704

	.section	.rodata._.str.40.703,"a",@progbits
	.balign	1
	.local	_.str.40.703
_.str.40.703:
	.asciz	"Go back"

	.section	.rodata._.str.41.702,"a",@progbits
	.balign	1
	.local	_.str.41.702
_.str.41.702:
	.asciz	"DISCARD UNSAVED PROGRESS?"

	.section	.rodata._InitializeMap.names,"a",@progbits
	.balign	1
	.local	_InitializeMap.names
_InitializeMap.names:
	d24	_.str.42.742
	d24	_.str.43.743
	d24	_.str.44.744
	d24	_.str.45.745
	d24	_.str.46.746
	d24	_.str.47.747
	d24	_.str.48.748

	.section	.rodata._.str.42.742,"a",@progbits
	.balign	1
	.local	_.str.42.742
_.str.42.742:
	.asciz	"Africa"

	.section	.rodata._.str.43.743,"a",@progbits
	.balign	1
	.local	_.str.43.743
_.str.43.743:
	.asciz	"Asia"

	.section	.rodata._.str.44.744,"a",@progbits
	.balign	1
	.local	_.str.44.744
_.str.44.744:
	.asciz	"Europe"

	.section	.rodata._.str.45.745,"a",@progbits
	.balign	1
	.local	_.str.45.745
_.str.45.745:
	.asciz	"Greenland"

	.section	.rodata._.str.46.746,"a",@progbits
	.balign	1
	.local	_.str.46.746
_.str.46.746:
	.asciz	"North America"

	.section	.rodata._.str.47.747,"a",@progbits
	.balign	1
	.local	_.str.47.747
_.str.47.747:
	.asciz	"South America"

	.section	.rodata._.str.48.748,"a",@progbits
	.balign	1
	.local	_.str.48.748
_.str.48.748:
	.asciz	"Oceania"

	.section	.rodata._InitializeMap.x,"a",@progbits
	.balign	1
	.local	_InitializeMap.x
_InitializeMap.x:
	.ascii	":T?-\000\030~"

	.section	.rodata._InitializeMap.y,"a",@progbits
	.balign	1
	.local	_InitializeMap.y
_InitializeMap.y:
	.ascii	")\022\027\021\0259A"

	.section	.rodata._map_sprites,"a",@progbits
	.balign	1
	.local	_map_sprites
_map_sprites:
	d24	_africa_data
	d24	_asia_data
	d24	_europe_data
	d24	_greenland_data
	d24	_northamerica_data
	d24	_southamerica_data
	d24	_oceania_data

	.section	.data._africa_data,"aw",@progbits
	.balign	1
	.globl	_africa_data
_africa_data:
	.ascii	"(/\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\377\377\377\377\377\377\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377"
	.zero	14

	.section	.data._asia_data,"aw",@progbits
	.balign	1
	.globl	_asia_data
_asia_data:
	.ascii	"A7\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\377\377\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\377\000\000\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\377\377\000\000\000\000\000\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\377\377\000\000\000\000\377\377\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\377\377\000\000\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\377\377\377\377\377\377\377\377\000\000\000\377\377\377\377\377\377\377\377\000\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\000\000\000\000\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\000\000\000\000\000\377\377\377\377\377\377\377\000\000\000\000\000\000\000\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\000\000\000\000\000\000\000\377\377\377\377\377\377\377\000\000\000\000\000\000\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\000\000\000\000\000\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\000\000\000\000\000\000\000\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\000\000\000\000\000\000\000\000\000\000\377\000\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\000\000\000\000\000\000\000\000\000\000\377\000\000\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\000\000\000\000\000\000\000\000\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\000\377\377\000\000\000\000\000\000\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\000\377\000\000\000\000\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\000\000\000\000\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\000\000\000\377\377\377\377\377\000\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\000\000\377\377\377\377\000\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\000\000\000\377\377\377\000\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377"
	.zero	17

	.section	.data._europe_data,"aw",@progbits
	.balign	1
	.globl	_europe_data
_europe_data:
	.ascii	" \030\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\377\000\000\000\000\377\000\377\377\377\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\377\377\000\000\000\000\000\377\000\377\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\377\377\377\377\000\000\000\000\377\377\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\377\377\000\377\377\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\377\000\000\377\377\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\377\377\377\377\377\377\377\000\000\377\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\377\377\377\377\377\377\000\000\000\000\000\377\377\000\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\377\377\377\377\377\000\000\000\000\000\000\000\377\000\377\377\000\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\377\377\377\377\000\000\000\000\000\000\000\000\377\000\000\377\377\000\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\377\377\377\000\000\000\000\000\000\000\000\000\000\000\377\000\000\377\377\377\377\377\377"
	.zero	37

	.section	.data._greenland_data,"aw",@progbits
	.balign	1
	.globl	_greenland_data
_greenland_data:
	.ascii	"\030\016\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377"
	.zero	15

	.section	.data._northamerica_data,"aw",@progbits
	.balign	1
	.globl	_northamerica_data
_northamerica_data:
	.ascii	"0)\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\000\000\000\000\000\000\377\377\000\000\000\000\000\000\000\000\000\000\000\377\377\000\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\377\377\377\000\000\377\377\377\377\377\377\377\000\000\000\377\377\377\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\377\377\377\377\377\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\377\377\377\377\377\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\377\000\000\377\377\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\377\377\377\377\000\000\000\000\000\000\000\377\377\377\377\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\377\377\377\377\377\000\377\000\000\000\000\000\377\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\377\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\000\377\377\377\377\377\377\377\000\000\000\000\000\000\000\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\000\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\000\000\000\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\000\000\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377"
	.zero	21

	.section	.data._southamerica_data,"aw",@progbits
	.balign	1
	.globl	_southamerica_data
_southamerica_data:
	.ascii	"\034,\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377"
	.zero	11

	.section	.data._oceania_data,"aw",@progbits
	.balign	1
	.globl	_oceania_data
_oceania_data:
	.ascii	"\042\037\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\000\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\000\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\000\000\000\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\000\000\000\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\000\000\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\000\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\000\000\000\000\000\377\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\000\000\000\000\000\000\000\000\377\377\377\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377\377\377\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\377"
	.zero	8

	.section	.rodata._.str.49.737,"a",@progbits
	.balign	1
	.local	_.str.49.737
_.str.49.737:
	.asciz	"Balanced. No automatic mutations. Recommended for your first outbreak."

	.section	.rodata._.str.50.738,"a",@progbits
	.balign	1
	.local	_.str.50.738
_.str.50.738:
	.asciz	"Free symptom mutations can help spread, but raise discovery risk. Devolution costs more."

	.section	.rodata._.str.51.739,"a",@progbits
	.balign	1
	.local	_.str.51.739
_.str.51.739:
	.asciz	"Weaker human travel. Three paid spore bursts can seed any region with healthy land."

	.section	.rodata.___const.StartGame.descriptions,"a",@progbits
	.balign	1
	.local	___const.StartGame.descriptions
___const.StartGame.descriptions:
	d24	_.str.49.737
	d24	_.str.50.738
	d24	_.str.51.739

	.section	.rodata._.str.52.717,"a",@progbits
	.balign	1
	.local	_.str.52.717
_.str.52.717:
	.asciz	"NEW GAME: DISEASE TYPE"

	.section	.rodata._disease_names,"a",@progbits
	.balign	1
	.globl	_disease_names
_disease_names:
	d24	_.str
	d24	_.str.1
	d24	_.str.2

	.section	.rodata._.str.53.718,"a",@progbits
	.balign	1
	.local	_.str.53.718
_.str.53.718:
	.asciz	"Up/Down: type   Enter: choose"

	.section	.rodata._.str.54.719,"a",@progbits
	.balign	1
	.local	_.str.54.719
_.str.54.719:
	.asciz	"Clear: cancel"

	.section	.rodata._.str.55.725,"a",@progbits
	.balign	1
	.local	_.str.55.725
_.str.55.725:
	.asciz	"Select healthy land for your first case."

	.section	.rodata._.str.56.726,"a",@progbits
	.balign	1
	.local	_.str.56.726
_.str.56.726:
	.asciz	"Arrows: move  Enter: seed  Clear: cancel"

	.section	.rodata._NameDisease.alphabet,"a",@progbits
	.balign	1
	.local	_NameDisease.alphabet
_NameDisease.alphabet:
	.asciz	"ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 -"

	.section	.rodata._.str.57.720,"a",@progbits
	.balign	1
	.local	_.str.57.720
_.str.57.720:
	.asciz	"NAME YOUR DISEASE"

	.section	.rodata._.str.58.721,"a",@progbits
	.balign	1
	.local	_.str.58.721
_.str.58.721:
	.asciz	"Done"

	.section	.rodata._.str.59.722,"a",@progbits
	.balign	1
	.local	_.str.59.722
_.str.59.722:
	.asciz	"%u/19 characters   Del: erase"

	.section	.rodata._.str.60.723,"a",@progbits
	.balign	1
	.local	_.str.60.723
_.str.60.723:
	.asciz	"Arrows: select   Enter: add / done"

	.section	.rodata._.str.61.724,"a",@progbits
	.balign	1
	.local	_.str.61.724
_.str.61.724:
	.asciz	"Pathogen"

	.section	.rodata._.str.62.731,"a",@progbits
	.balign	1
	.local	_.str.62.731
_.str.62.731:
	.asciz	"SAVE FAILED"

	.section	.rodata._.str.63.732,"a",@progbits
	.balign	1
	.local	_.str.63.732
_.str.63.732:
	.asciz	"Unable to save. Your last validated save is retained. Free calculator storage and try again."

	.section	.rodata._.str.64.727,"a",@progbits
	.balign	1
	.local	_.str.64.727
_.str.64.727:
	.asciz	"DNA %u   Cure %u%%   Cycle %lu"

	.section	.bss._ticker,"aw",@nobits
	.balign	2
	.globl	_ticker
_ticker:
	.zero	134

	.section	.rodata._responses,"a",@progbits
	.balign	1
	.local	_responses
_responses:
	d24	_.str.68.733
	d24	_.str.69.734
	d24	_.str.70.735
	d24	_.str.71.736

	.section	.rodata._.str.65.728,"a",@progbits
	.balign	1
	.local	_.str.65.728
_.str.65.728:
	.asciz	"%s: active %u%%  dead %u%%"

	.section	.rodata._.str.66.729,"a",@progbits
	.balign	1
	.local	_.str.66.729
_.str.66.729:
	.asciz	"World affected %u%%   dead %u%%"

	.section	.rodata._.str.67.730,"a",@progbits
	.balign	1
	.local	_.str.67.730
_.str.67.730:
	.asciz	"Arrows: region   Enter/Clear: actions"

	.section	.rodata._.str.68.733,"a",@progbits
	.balign	1
	.local	_.str.68.733
_.str.68.733:
	.asciz	"Undetected"

	.section	.rodata._.str.69.734,"a",@progbits
	.balign	1
	.local	_.str.69.734
_.str.69.734:
	.asciz	"Discovered"

	.section	.rodata._.str.70.735,"a",@progbits
	.balign	1
	.local	_.str.70.735
_.str.70.735:
	.asciz	"Research underway"

	.section	.rodata._.str.71.736,"a",@progbits
	.balign	1
	.local	_.str.71.736
_.str.71.736:
	.asciz	"Escalating response"

	.section	.rodata._event_catalog,"a",@progbits
	.balign	2
	.globl	_event_catalog
_event_catalog:
	d24	_.str.4
	d24	_.str.1.5
	db	1                               ; 0x1
	db	12                              ; 0xc
	db	15                              ; 0xf
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	8                               ; 0x8
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.2.6
	d24	_.str.3.7
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	15                              ; 0xf
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	10                              ; 0xa
	dw	8                               ; 0x8
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	8                               ; 0x8
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.4.8
	d24	_.str.5
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	20                              ; 0x14
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	15                              ; 0xf
	dw	16                              ; 0x10
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.6
	d24	_.str.7
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	15                              ; 0xf
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	8                               ; 0x8
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.8
	d24	_.str.9
	db	1                               ; 0x1
	db	2                               ; 0x2
	db	15                              ; 0xf
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	8                               ; 0x8
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	8                               ; 0x8
	db	5                               ; 0x5
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.10
	d24	_.str.11
	db	1                               ; 0x1
	db	12                              ; 0xc
	db	10                              ; 0xa
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	8                               ; 0x8
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	10                              ; 0xa
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.12
	d24	_.str.13
	db	1                               ; 0x1
	db	8                               ; 0x8
	db	15                              ; 0xf
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	8                               ; 0x8
	db	0                               ; 0x0
	db	10                              ; 0xa
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.14
	d24	_.str.15
	db	1                               ; 0x1
	db	12                              ; 0xc
	db	10                              ; 0xa
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	8                               ; 0x8
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	8                               ; 0x8
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	5                               ; 0x5
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.16
	d24	_.str.17
	db	1                               ; 0x1
	db	12                              ; 0xc
	db	15                              ; 0xf
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	8                               ; 0x8
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.18
	d24	_.str.19
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	20                              ; 0x14
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	15                              ; 0xf
	dw	8                               ; 0x8
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	8                               ; 0x8
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	2                               ; 0x2
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.20
	d24	_.str.21
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	15                              ; 0xf
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	11                              ; 0xb
	db	0                               ; 0x0
	db	10                              ; 0xa
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.22
	d24	_.str.23
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	20                              ; 0x14
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	8                               ; 0x8
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	11                              ; 0xb
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	2                               ; 0x2
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.24
	d24	_.str.25
	db	1                               ; 0x1
	db	12                              ; 0xc
	db	15                              ; 0xf
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	8                               ; 0x8
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	10                              ; 0xa
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.26
	d24	_.str.27
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	241                             ; 0xf1
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	8                               ; 0x8
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	8                               ; 0x8
	db	11                              ; 0xb
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.28
	d24	_.str.29
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	241                             ; 0xf1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	8                               ; 0x8
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	11                              ; 0xb
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	2                               ; 0x2
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.30
	d24	_.str.31
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	15                              ; 0xf
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	8                               ; 0x8
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	8                               ; 0x8
	db	11                              ; 0xb
	db	0                               ; 0x0
	db	10                              ; 0xa
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.32
	d24	_.str.33
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	15                              ; 0xf
	db	1                               ; 0x1
	db	12                              ; 0xc
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	11                              ; 0xb
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.34
	d24	_.str.35
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	20                              ; 0x14
	db	1                               ; 0x1
	db	12                              ; 0xc
	db	10                              ; 0xa
	dw	8                               ; 0x8
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	10                              ; 0xa
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.36
	d24	_.str.37
	db	3                               ; 0x3
	db	255                             ; 0xff
	db	20                              ; 0x14
	db	1                               ; 0x1
	db	2                               ; 0x2
	db	15                              ; 0xf
	dw	16                              ; 0x10
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	10                              ; 0xa
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.38
	d24	_.str.39
	db	7                               ; 0x7
	db	255                             ; 0xff
	db	1                               ; 0x1
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	246                             ; 0xf6
	dw	8                               ; 0x8
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	8                               ; 0x8
	db	11                              ; 0xb
	db	2                               ; 0x2
	db	10                              ; 0xa
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.40
	d24	_.str.41
	db	3                               ; 0x3
	db	255                             ; 0xff
	db	20                              ; 0x14
	db	1                               ; 0x1
	db	2                               ; 0x2
	db	15                              ; 0xf
	dw	16                              ; 0x10
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	10                              ; 0xa
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.42
	d24	_.str.43
	db	3                               ; 0x3
	db	255                             ; 0xff
	db	10                              ; 0xa
	db	1                               ; 0x1
	db	4                               ; 0x4
	db	10                              ; 0xa
	dw	8                               ; 0x8
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	10                              ; 0xa
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.44
	d24	_.str.45
	db	8                               ; 0x8
	db	255                             ; 0xff
	db	1                               ; 0x1
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	15                              ; 0xf
	dw	8                               ; 0x8
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	8                               ; 0x8
	db	10                              ; 0xa
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.46
	d24	_.str.47
	db	3                               ; 0x3
	db	255                             ; 0xff
	db	246                             ; 0xf6
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	20                              ; 0x14
	dw	8                               ; 0x8
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	10                              ; 0xa
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.48
	d24	_.str.49
	db	1                               ; 0x1
	db	2                               ; 0x2
	db	15                              ; 0xf
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	8                               ; 0x8
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	8                               ; 0x8
	db	5                               ; 0x5
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.50
	d24	_.str.51
	db	3                               ; 0x3
	db	255                             ; 0xff
	db	241                             ; 0xf1
	db	1                               ; 0x1
	db	12                              ; 0xc
	db	10                              ; 0xa
	dw	8                               ; 0x8
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	8                               ; 0x8
	db	10                              ; 0xa
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.52
	d24	_.str.53
	db	8                               ; 0x8
	db	255                             ; 0xff
	db	1                               ; 0x1
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	246                             ; 0xf6
	dw	8                               ; 0x8
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	10                              ; 0xa
	db	2                               ; 0x2
	db	10                              ; 0xa
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.54
	d24	_.str.55
	db	1                               ; 0x1
	db	6                               ; 0x6
	db	20                              ; 0x14
	db	3                               ; 0x3
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	10                              ; 0xa
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.56
	d24	_.str.57
	db	3                               ; 0x3
	db	255                             ; 0xff
	db	10                              ; 0xa
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	15                              ; 0xf
	dw	8                               ; 0x8
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	10                              ; 0xa
	db	0                               ; 0x0
	db	10                              ; 0xa
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.58
	d24	_.str.59
	db	3                               ; 0x3
	db	255                             ; 0xff
	db	15                              ; 0xf
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	246                             ; 0xf6
	dw	8                               ; 0x8
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	8                               ; 0x8
	db	10                              ; 0xa
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.60
	d24	_.str.61
	db	1                               ; 0x1
	db	2                               ; 0x2
	db	20                              ; 0x14
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	3                               ; 0x3
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	5                               ; 0x5
	db	0                               ; 0x0
	db	10                              ; 0xa
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.62
	d24	_.str.63
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	241                             ; 0xf1
	db	1                               ; 0x1
	db	8                               ; 0x8
	db	15                              ; 0xf
	dw	8                               ; 0x8
	db	3                               ; 0x3
	db	255                             ; 0xff
	db	8                               ; 0x8
	db	6                               ; 0x6
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.64
	d24	_.str.65
	db	1                               ; 0x1
	db	8                               ; 0x8
	db	20                              ; 0x14
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	246                             ; 0xf6
	dw	8                               ; 0x8
	db	3                               ; 0x3
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	3                               ; 0x3
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	29                              ; 0x1d
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.66
	d24	_.str.67
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	241                             ; 0xf1
	db	1                               ; 0x1
	db	4                               ; 0x4
	db	246                             ; 0xf6
	dw	8                               ; 0x8
	db	3                               ; 0x3
	db	255                             ; 0xff
	db	8                               ; 0x8
	db	4                               ; 0x4
	db	0                               ; 0x0
	db	10                              ; 0xa
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.68
	d24	_.str.69
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	236                             ; 0xec
	db	7                               ; 0x7
	db	255                             ; 0xff
	db	1                               ; 0x1
	dw	8                               ; 0x8
	db	3                               ; 0x3
	db	255                             ; 0xff
	db	8                               ; 0x8
	db	11                              ; 0xb
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.70
	d24	_.str.71
	db	1                               ; 0x1
	db	2                               ; 0x2
	db	15                              ; 0xf
	db	3                               ; 0x3
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	8                               ; 0x8
	db	3                               ; 0x3
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	5                               ; 0x5
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.72
	d24	_.str.73
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	10                              ; 0xa
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	15                              ; 0xf
	dw	16                              ; 0x10
	db	3                               ; 0x3
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	6                               ; 0x6
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.74
	d24	_.str.75
	db	1                               ; 0x1
	db	8                               ; 0x8
	db	20                              ; 0x14
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	8                               ; 0x8
	db	3                               ; 0x3
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	5                               ; 0x5
	db	0                               ; 0x0
	db	10                              ; 0xa
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.76
	d24	_.str.77
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	236                             ; 0xec
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	246                             ; 0xf6
	dw	8                               ; 0x8
	db	3                               ; 0x3
	db	255                             ; 0xff
	db	8                               ; 0x8
	db	4                               ; 0x4
	db	0                               ; 0x0
	db	10                              ; 0xa
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.78
	d24	_.str.79
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	10                              ; 0xa
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	8                               ; 0x8
	db	3                               ; 0x3
	db	255                             ; 0xff
	db	8                               ; 0x8
	db	6                               ; 0x6
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.80
	d24	_.str.81
	db	1                               ; 0x1
	db	2                               ; 0x2
	db	20                              ; 0x14
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	8                               ; 0x8
	db	4                               ; 0x4
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	5                               ; 0x5
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.82
	d24	_.str.83
	db	1                               ; 0x1
	db	2                               ; 0x2
	db	236                             ; 0xec
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	8                               ; 0x8
	db	4                               ; 0x4
	db	255                             ; 0xff
	db	8                               ; 0x8
	db	5                               ; 0x5
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.84
	d24	_.str.85
	db	1                               ; 0x1
	db	2                               ; 0x2
	db	10                              ; 0xa
	db	1                               ; 0x1
	db	12                              ; 0xc
	db	10                              ; 0xa
	dw	8                               ; 0x8
	db	4                               ; 0x4
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.86
	d24	_.str.87
	db	1                               ; 0x1
	db	2                               ; 0x2
	db	15                              ; 0xf
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	8                               ; 0x8
	db	4                               ; 0x4
	db	255                             ; 0xff
	db	8                               ; 0x8
	db	5                               ; 0x5
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.88
	d24	_.str.89
	db	1                               ; 0x1
	db	2                               ; 0x2
	db	246                             ; 0xf6
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	15                              ; 0xf
	dw	16                              ; 0x10
	db	4                               ; 0x4
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.90
	d24	_.str.91
	db	1                               ; 0x1
	db	4                               ; 0x4
	db	246                             ; 0xf6
	db	1                               ; 0x1
	db	2                               ; 0x2
	db	241                             ; 0xf1
	dw	8                               ; 0x8
	db	4                               ; 0x4
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	8                               ; 0x8
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.92
	d24	_.str.93
	db	1                               ; 0x1
	db	2                               ; 0x2
	db	15                              ; 0xf
	db	3                               ; 0x3
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	8                               ; 0x8
	db	4                               ; 0x4
	db	255                             ; 0xff
	db	8                               ; 0x8
	db	5                               ; 0x5
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.94
	d24	_.str.95
	db	1                               ; 0x1
	db	2                               ; 0x2
	db	25                              ; 0x19
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	8                               ; 0x8
	db	4                               ; 0x4
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	8                               ; 0x8
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.96
	d24	_.str.97
	db	1                               ; 0x1
	db	2                               ; 0x2
	db	15                              ; 0xf
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	246                             ; 0xf6
	dw	8                               ; 0x8
	db	4                               ; 0x4
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.98
	d24	_.str.99
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	15                              ; 0xf
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	4                               ; 0x4
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	8                               ; 0x8
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.100
	d24	_.str.101
	db	1                               ; 0x1
	db	4                               ; 0x4
	db	20                              ; 0x14
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	8                               ; 0x8
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	8                               ; 0x8
	db	0                               ; 0x0
	db	10                              ; 0xa
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.102
	d24	_.str.103
	db	4                               ; 0x4
	db	255                             ; 0xff
	db	25                              ; 0x19
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	16                              ; 0x10
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	10                              ; 0xa
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.104
	d24	_.str.105
	db	1                               ; 0x1
	db	4                               ; 0x4
	db	20                              ; 0x14
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	8                               ; 0x8
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	8                               ; 0x8
	db	8                               ; 0x8
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.106
	d24	_.str.107
	db	1                               ; 0x1
	db	8                               ; 0x8
	db	20                              ; 0x14
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	8                               ; 0x8
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	3                               ; 0x3
	db	0                               ; 0x0
	db	10                              ; 0xa
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	29                              ; 0x1d
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.108
	d24	_.str.109
	db	1                               ; 0x1
	db	6                               ; 0x6
	db	236                             ; 0xec
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	8                               ; 0x8
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	8                               ; 0x8
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.110
	d24	_.str.111
	db	4                               ; 0x4
	db	255                             ; 0xff
	db	15                              ; 0xf
	db	1                               ; 0x1
	db	4                               ; 0x4
	db	10                              ; 0xa
	dw	8                               ; 0x8
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	8                               ; 0x8
	db	0                               ; 0x0
	db	10                              ; 0xa
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.112
	d24	_.str.113
	db	1                               ; 0x1
	db	4                               ; 0x4
	db	241                             ; 0xf1
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	8                               ; 0x8
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.114
	d24	_.str.115
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	241                             ; 0xf1
	db	8                               ; 0x8
	db	255                             ; 0xff
	db	1                               ; 0x1
	dw	8                               ; 0x8
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	8                               ; 0x8
	db	10                              ; 0xa
	db	1                               ; 0x1
	db	10                              ; 0xa
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.116
	d24	_.str.117
	db	1                               ; 0x1
	db	8                               ; 0x8
	db	236                             ; 0xec
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	8                               ; 0x8
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	3                               ; 0x3
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.118
	d24	_.str.119
	db	1                               ; 0x1
	db	6                               ; 0x6
	db	236                             ; 0xec
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	246                             ; 0xf6
	dw	16                              ; 0x10
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	8                               ; 0x8
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.120
	d24	_.str.121
	db	1                               ; 0x1
	db	12                              ; 0xc
	db	15                              ; 0xf
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	8                               ; 0x8
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	8                               ; 0x8
	db	9                               ; 0x9
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	2                               ; 0x2
	db	0                               ; 0x0
	db	33                              ; 0x21
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.122
	d24	_.str.123
	db	1                               ; 0x1
	db	12                              ; 0xc
	db	20                              ; 0x14
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	8                               ; 0x8
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	9                               ; 0x9
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	5                               ; 0x5
	db	0                               ; 0x0
	db	33                              ; 0x21
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.124
	d24	_.str.125
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	241                             ; 0xf1
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	246                             ; 0xf6
	dw	8                               ; 0x8
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	9                               ; 0x9
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.126
	d24	_.str.127
	db	1                               ; 0x1
	db	12                              ; 0xc
	db	246                             ; 0xf6
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	15                              ; 0xf
	dw	16                              ; 0x10
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.128
	d24	_.str.129
	db	1                               ; 0x1
	db	12                              ; 0xc
	db	241                             ; 0xf1
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	8                               ; 0x8
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	9                               ; 0x9
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.130
	d24	_.str.131
	db	1                               ; 0x1
	db	12                              ; 0xc
	db	10                              ; 0xa
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	15                              ; 0xf
	dw	8                               ; 0x8
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	8                               ; 0x8
	db	9                               ; 0x9
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	2                               ; 0x2
	db	33                              ; 0x21
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.132
	d24	_.str.133
	db	1                               ; 0x1
	db	12                              ; 0xc
	db	246                             ; 0xf6
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	15                              ; 0xf
	dw	16                              ; 0x10
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	9                               ; 0x9
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.134
	d24	_.str.135
	db	1                               ; 0x1
	db	12                              ; 0xc
	db	15                              ; 0xf
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	8                               ; 0x8
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	8                               ; 0x8
	db	0                               ; 0x0
	db	10                              ; 0xa
	db	7                               ; 0x7
	db	2                               ; 0x2
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.136
	d24	_.str.137
	db	1                               ; 0x1
	db	12                              ; 0xc
	db	236                             ; 0xec
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	8                               ; 0x8
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	9                               ; 0x9
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.138
	d24	_.str.139
	db	1                               ; 0x1
	db	12                              ; 0xc
	db	241                             ; 0xf1
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	15                              ; 0xf
	dw	16                              ; 0x10
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	9                               ; 0x9
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.140
	d24	_.str.141
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	15                              ; 0xf
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	8                               ; 0x8
	db	7                               ; 0x7
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	1                               ; 0x1
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.142
	d24	_.str.143
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	15                              ; 0xf
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	8                               ; 0x8
	db	7                               ; 0x7
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	2                               ; 0x2
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.144
	d24	_.str.145
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	241                             ; 0xf1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	16                              ; 0x10
	db	7                               ; 0x7
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	4                               ; 0x4
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.146
	d24	_.str.147
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	15                              ; 0xf
	db	1                               ; 0x1
	db	12                              ; 0xc
	db	10                              ; 0xa
	dw	8                               ; 0x8
	db	7                               ; 0x7
	db	255                             ; 0xff
	db	8                               ; 0x8
	db	9                               ; 0x9
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	33                              ; 0x21
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.148
	d24	_.str.149
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	241                             ; 0xf1
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	241                             ; 0xf1
	dw	8                               ; 0x8
	db	7                               ; 0x7
	db	255                             ; 0xff
	db	8                               ; 0x8
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.150
	d24	_.str.151
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	20                              ; 0x14
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	7                               ; 0x7
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.152
	d24	_.str.153
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	241                             ; 0xf1
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	246                             ; 0xf6
	dw	8                               ; 0x8
	db	7                               ; 0x7
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.154
	d24	_.str.155
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	20                              ; 0x14
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	16                              ; 0x10
	db	7                               ; 0x7
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	9                               ; 0x9
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.156
	d24	_.str.157
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	236                             ; 0xec
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	246                             ; 0xf6
	dw	8                               ; 0x8
	db	7                               ; 0x7
	db	255                             ; 0xff
	db	8                               ; 0x8
	db	9                               ; 0x9
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.158
	d24	_.str.159
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	10                              ; 0xa
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	15                              ; 0xf
	dw	8                               ; 0x8
	db	7                               ; 0x7
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.160
	d24	_.str.161
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	241                             ; 0xf1
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	246                             ; 0xf6
	dw	8                               ; 0x8
	db	8                               ; 0x8
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.162
	d24	_.str.163
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	241                             ; 0xf1
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	8                               ; 0x8
	db	8                               ; 0x8
	db	255                             ; 0xff
	db	8                               ; 0x8
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	2                               ; 0x2
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.164
	d24	_.str.165
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	241                             ; 0xf1
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	246                             ; 0xf6
	dw	8                               ; 0x8
	db	8                               ; 0x8
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	10                              ; 0xa
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.166
	d24	_.str.167
	db	1                               ; 0x1
	db	12                              ; 0xc
	db	241                             ; 0xf1
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	8                               ; 0x8
	db	8                               ; 0x8
	db	255                             ; 0xff
	db	8                               ; 0x8
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.168
	d24	_.str.169
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	15                              ; 0xf
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	8                               ; 0x8
	db	8                               ; 0x8
	db	255                             ; 0xff
	db	8                               ; 0x8
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.170
	d24	_.str.171
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	15                              ; 0xf
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	246                             ; 0xf6
	dw	8                               ; 0x8
	db	8                               ; 0x8
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.172
	d24	_.str.173
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	241                             ; 0xf1
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	8                               ; 0x8
	db	8                               ; 0x8
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.174
	d24	_.str.175
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	10                              ; 0xa
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	8                               ; 0x8
	db	8                               ; 0x8
	db	255                             ; 0xff
	db	8                               ; 0x8
	db	0                               ; 0x0
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.176
	d24	_.str.177
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	246                             ; 0xf6
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	246                             ; 0xf6
	dw	16                              ; 0x10
	db	8                               ; 0x8
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	1                               ; 0x1
	db	10                              ; 0xa
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.178
	d24	_.str.179
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	15                              ; 0xf
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	246                             ; 0xf6
	dw	8                               ; 0x8
	db	8                               ; 0x8
	db	255                             ; 0xff
	db	8                               ; 0x8
	db	0                               ; 0x0
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.180
	d24	_.str.181
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	246                             ; 0xf6
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	241                             ; 0xf1
	dw	8                               ; 0x8
	db	9                               ; 0x9
	db	255                             ; 0xff
	db	8                               ; 0x8
	db	11                              ; 0xb
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.182
	d24	_.str.183
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	241                             ; 0xf1
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	246                             ; 0xf6
	dw	8                               ; 0x8
	db	9                               ; 0x9
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.184
	d24	_.str.185
	db	1                               ; 0x1
	db	4                               ; 0x4
	db	15                              ; 0xf
	db	3                               ; 0x3
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	8                               ; 0x8
	db	9                               ; 0x9
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	8                               ; 0x8
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.186
	d24	_.str.187
	db	1                               ; 0x1
	db	2                               ; 0x2
	db	15                              ; 0xf
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	246                             ; 0xf6
	dw	8                               ; 0x8
	db	9                               ; 0x9
	db	255                             ; 0xff
	db	8                               ; 0x8
	db	5                               ; 0x5
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.188
	d24	_.str.189
	db	7                               ; 0x7
	db	255                             ; 0xff
	db	1                               ; 0x1
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	246                             ; 0xf6
	dw	8                               ; 0x8
	db	9                               ; 0x9
	db	255                             ; 0xff
	db	8                               ; 0x8
	db	11                              ; 0xb
	db	0                               ; 0x0
	db	10                              ; 0xa
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.190
	d24	_.str.191
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	236                             ; 0xec
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	246                             ; 0xf6
	dw	8                               ; 0x8
	db	9                               ; 0x9
	db	255                             ; 0xff
	db	8                               ; 0x8
	db	0                               ; 0x0
	db	1                               ; 0x1
	db	10                              ; 0xa
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.192
	d24	_.str.193
	db	8                               ; 0x8
	db	255                             ; 0xff
	db	1                               ; 0x1
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	246                             ; 0xf6
	dw	8                               ; 0x8
	db	9                               ; 0x9
	db	255                             ; 0xff
	db	8                               ; 0x8
	db	10                              ; 0xa
	db	0                               ; 0x0
	db	10                              ; 0xa
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.194
	d24	_.str.195
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	20                              ; 0x14
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	246                             ; 0xf6
	dw	8                               ; 0x8
	db	9                               ; 0x9
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.196
	d24	_.str.197
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	15                              ; 0xf
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	8                               ; 0x8
	db	9                               ; 0x9
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	9                               ; 0x9
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.198
	d24	_.str.199
	db	1                               ; 0x1
	db	2                               ; 0x2
	db	241                             ; 0xf1
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	9                               ; 0x9
	db	255                             ; 0xff
	db	16                              ; 0x10
	db	5                               ; 0x5
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.200
	d24	_.str.201
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	15                              ; 0xf
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	10                              ; 0xa
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	101                             ; 0x65
	db	255                             ; 0xff
	d24	_.str.202
	d24	_.str.203
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	246                             ; 0xf6
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	16                              ; 0x10
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	102                             ; 0x66
	db	103                             ; 0x67
	d24	_.str.204
	d24	_.str.205
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	236                             ; 0xec
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	246                             ; 0xf6
	dw	16                              ; 0x10
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	16                              ; 0x10
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	104                             ; 0x68
	db	255                             ; 0xff
	d24	_.str.206
	d24	_.str.207
	db	1                               ; 0x1
	db	12                              ; 0xc
	db	15                              ; 0xf
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	16                              ; 0x10
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	12                              ; 0xc
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	104                             ; 0x68
	db	255                             ; 0xff
	d24	_.str.208
	d24	_.str.209
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	10                              ; 0xa
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	16                              ; 0x10
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	10                              ; 0xa
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.210
	d24	_.str.211
	db	1                               ; 0x1
	db	2                               ; 0x2
	db	15                              ; 0xf
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	0                               ; 0x0
	db	1                               ; 0x1
	db	16                              ; 0x10
	db	5                               ; 0x5
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	106                             ; 0x6a
	db	255                             ; 0xff
	d24	_.str.212
	d24	_.str.213
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	246                             ; 0xf6
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	16                              ; 0x10
	db	0                               ; 0x0
	db	1                               ; 0x1
	db	16                              ; 0x10
	db	5                               ; 0x5
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	1                               ; 0x1
	db	8                               ; 0x8
	db	107                             ; 0x6b
	db	108                             ; 0x6c
	d24	_.str.214
	d24	_.str.215
	db	1                               ; 0x1
	db	8                               ; 0x8
	db	236                             ; 0xec
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	246                             ; 0xf6
	dw	16                              ; 0x10
	db	0                               ; 0x0
	db	1                               ; 0x1
	db	16                              ; 0x10
	db	3                               ; 0x3
	db	1                               ; 0x1
	db	10                              ; 0xa
	db	7                               ; 0x7
	db	8                               ; 0x8
	db	8                               ; 0x8
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	109                             ; 0x6d
	db	255                             ; 0xff
	d24	_.str.216
	d24	_.str.217
	db	1                               ; 0x1
	db	8                               ; 0x8
	db	20                              ; 0x14
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	0                               ; 0x0
	db	1                               ; 0x1
	db	16                              ; 0x10
	db	3                               ; 0x3
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	8                               ; 0x8
	db	8                               ; 0x8
	db	29                              ; 0x1d
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	109                             ; 0x6d
	db	255                             ; 0xff
	d24	_.str.218
	d24	_.str.219
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	10                              ; 0xa
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	16                              ; 0x10
	db	0                               ; 0x0
	db	1                               ; 0x1
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	10                              ; 0xa
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.220
	d24	_.str.221
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	15                              ; 0xf
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	7                               ; 0x7
	db	2                               ; 0x2
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	35                              ; 0x23
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	111                             ; 0x6f
	db	255                             ; 0xff
	d24	_.str.222
	d24	_.str.223
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	10                              ; 0xa
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	16                              ; 0x10
	db	7                               ; 0x7
	db	2                               ; 0x2
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	35                              ; 0x23
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	112                             ; 0x70
	db	113                             ; 0x71
	d24	_.str.224
	d24	_.str.225
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	20                              ; 0x14
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	16                              ; 0x10
	db	7                               ; 0x7
	db	2                               ; 0x2
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	35                              ; 0x23
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	114                             ; 0x72
	db	255                             ; 0xff
	d24	_.str.226
	d24	_.str.227
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	236                             ; 0xec
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	246                             ; 0xf6
	dw	16                              ; 0x10
	db	7                               ; 0x7
	db	2                               ; 0x2
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	35                              ; 0x23
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	114                             ; 0x72
	db	255                             ; 0xff
	d24	_.str.228
	d24	_.str.229
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	10                              ; 0xa
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	16                              ; 0x10
	db	7                               ; 0x7
	db	2                               ; 0x2
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	35                              ; 0x23
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.230
	d24	_.str.231
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	20                              ; 0x14
	db	1                               ; 0x1
	db	12                              ; 0xc
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	6                               ; 0x6
	db	3                               ; 0x3
	db	16                              ; 0x10
	db	9                               ; 0x9
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	33                              ; 0x21
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	116                             ; 0x74
	db	255                             ; 0xff
	d24	_.str.232
	d24	_.str.233
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	246                             ; 0xf6
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	16                              ; 0x10
	db	6                               ; 0x6
	db	3                               ; 0x3
	db	16                              ; 0x10
	db	9                               ; 0x9
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	117                             ; 0x75
	db	118                             ; 0x76
	d24	_.str.234
	d24	_.str.235
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	20                              ; 0x14
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	246                             ; 0xf6
	dw	16                              ; 0x10
	db	6                               ; 0x6
	db	3                               ; 0x3
	db	16                              ; 0x10
	db	9                               ; 0x9
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	119                             ; 0x77
	db	255                             ; 0xff
	d24	_.str.236
	d24	_.str.237
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	10                              ; 0xa
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	6                               ; 0x6
	db	3                               ; 0x3
	db	16                              ; 0x10
	db	9                               ; 0x9
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	33                              ; 0x21
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	119                             ; 0x77
	db	255                             ; 0xff
	d24	_.str.238
	d24	_.str.239
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	10                              ; 0xa
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	6                               ; 0x6
	db	3                               ; 0x3
	db	16                              ; 0x10
	db	9                               ; 0x9
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.240
	d24	_.str.241
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	10                              ; 0xa
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	246                             ; 0xf6
	dw	16                              ; 0x10
	db	9                               ; 0x9
	db	4                               ; 0x4
	db	16                              ; 0x10
	db	11                              ; 0xb
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	121                             ; 0x79
	db	255                             ; 0xff
	d24	_.str.242
	d24	_.str.243
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	246                             ; 0xf6
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	16                              ; 0x10
	db	9                               ; 0x9
	db	4                               ; 0x4
	db	16                              ; 0x10
	db	11                              ; 0xb
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	122                             ; 0x7a
	db	123                             ; 0x7b
	d24	_.str.244
	d24	_.str.245
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	236                             ; 0xec
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	246                             ; 0xf6
	dw	16                              ; 0x10
	db	9                               ; 0x9
	db	4                               ; 0x4
	db	16                              ; 0x10
	db	11                              ; 0xb
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	124                             ; 0x7c
	db	255                             ; 0xff
	d24	_.str.246
	d24	_.str.247
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	15                              ; 0xf
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	9                               ; 0x9
	db	4                               ; 0x4
	db	16                              ; 0x10
	db	11                              ; 0xb
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	124                             ; 0x7c
	db	255                             ; 0xff
	d24	_.str.248
	d24	_.str.239
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	10                              ; 0xa
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	9                               ; 0x9
	db	4                               ; 0x4
	db	16                              ; 0x10
	db	11                              ; 0xb
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.249
	d24	_.str.250
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	10                              ; 0xa
	db	1                               ; 0x1
	db	2                               ; 0x2
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	2                               ; 0x2
	db	5                               ; 0x5
	db	16                              ; 0x10
	db	10                              ; 0xa
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	126                             ; 0x7e
	db	255                             ; 0xff
	d24	_.str.251
	d24	_.str.252
	db	3                               ; 0x3
	db	255                             ; 0xff
	db	246                             ; 0xf6
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	16                              ; 0x10
	db	2                               ; 0x2
	db	5                               ; 0x5
	db	16                              ; 0x10
	db	10                              ; 0xa
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	2                               ; 0x2
	db	1                               ; 0x1
	db	2                               ; 0x2
	db	127                             ; 0x7f
	db	128                             ; 0x80
	d24	_.str.253
	d24	_.str.254
	db	1                               ; 0x1
	db	2                               ; 0x2
	db	236                             ; 0xec
	db	3                               ; 0x3
	db	255                             ; 0xff
	db	246                             ; 0xf6
	dw	16                              ; 0x10
	db	2                               ; 0x2
	db	5                               ; 0x5
	db	16                              ; 0x10
	db	10                              ; 0xa
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	2                               ; 0x2
	db	2                               ; 0x2
	db	2                               ; 0x2
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	129                             ; 0x81
	db	255                             ; 0xff
	d24	_.str.255
	d24	_.str.256
	db	1                               ; 0x1
	db	2                               ; 0x2
	db	20                              ; 0x14
	db	3                               ; 0x3
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	2                               ; 0x2
	db	5                               ; 0x5
	db	16                              ; 0x10
	db	10                              ; 0xa
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	2                               ; 0x2
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	129                             ; 0x81
	db	255                             ; 0xff
	d24	_.str.257
	d24	_.str.239
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	10                              ; 0xa
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	2                               ; 0x2
	db	5                               ; 0x5
	db	16                              ; 0x10
	db	10                              ; 0xa
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	2                               ; 0x2
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.258
	d24	_.str.259
	db	4                               ; 0x4
	db	255                             ; 0xff
	db	20                              ; 0x14
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	16                              ; 0x10
	db	5                               ; 0x5
	db	6                               ; 0x6
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	10                              ; 0xa
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	131                             ; 0x83
	db	255                             ; 0xff
	d24	_.str.260
	d24	_.str.261
	db	4                               ; 0x4
	db	255                             ; 0xff
	db	246                             ; 0xf6
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	16                              ; 0x10
	db	5                               ; 0x5
	db	6                               ; 0x6
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	10                              ; 0xa
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	3                               ; 0x3
	db	255                             ; 0xff
	db	132                             ; 0x84
	db	133                             ; 0x85
	d24	_.str.262
	d24	_.str.263
	db	4                               ; 0x4
	db	255                             ; 0xff
	db	231                             ; 0xe7
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	16                              ; 0x10
	db	5                               ; 0x5
	db	6                               ; 0x6
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	1                               ; 0x1
	db	10                              ; 0xa
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	25                              ; 0x19
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	134                             ; 0x86
	db	255                             ; 0xff
	d24	_.str.264
	d24	_.str.265
	db	4                               ; 0x4
	db	255                             ; 0xff
	db	25                              ; 0x19
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	16                              ; 0x10
	db	5                               ; 0x5
	db	6                               ; 0x6
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	1                               ; 0x1
	db	10                              ; 0xa
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	25                              ; 0x19
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	134                             ; 0x86
	db	255                             ; 0xff
	d24	_.str.266
	d24	_.str.267
	db	4                               ; 0x4
	db	255                             ; 0xff
	db	10                              ; 0xa
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	16                              ; 0x10
	db	5                               ; 0x5
	db	6                               ; 0x6
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	10                              ; 0xa
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.268
	d24	_.str.269
	db	1                               ; 0x1
	db	4                               ; 0x4
	db	20                              ; 0x14
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	5                               ; 0x5
	db	7                               ; 0x7
	db	16                              ; 0x10
	db	8                               ; 0x8
	db	0                               ; 0x0
	db	10                              ; 0xa
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	136                             ; 0x88
	db	255                             ; 0xff
	d24	_.str.270
	d24	_.str.271
	db	1                               ; 0x1
	db	4                               ; 0x4
	db	246                             ; 0xf6
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	16                              ; 0x10
	db	5                               ; 0x5
	db	7                               ; 0x7
	db	16                              ; 0x10
	db	8                               ; 0x8
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	137                             ; 0x89
	db	138                             ; 0x8a
	d24	_.str.272
	d24	_.str.273
	db	1                               ; 0x1
	db	4                               ; 0x4
	db	236                             ; 0xec
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	5                               ; 0x5
	db	7                               ; 0x7
	db	16                              ; 0x10
	db	8                               ; 0x8
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	4                               ; 0x4
	db	4                               ; 0x4
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	139                             ; 0x8b
	db	255                             ; 0xff
	d24	_.str.274
	d24	_.str.275
	db	1                               ; 0x1
	db	4                               ; 0x4
	db	20                              ; 0x14
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	5                               ; 0x5
	db	7                               ; 0x7
	db	16                              ; 0x10
	db	8                               ; 0x8
	db	1                               ; 0x1
	db	10                              ; 0xa
	db	7                               ; 0x7
	db	4                               ; 0x4
	db	4                               ; 0x4
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	139                             ; 0x8b
	db	255                             ; 0xff
	d24	_.str.276
	d24	_.str.239
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	10                              ; 0xa
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	5                               ; 0x5
	db	7                               ; 0x7
	db	16                              ; 0x10
	db	8                               ; 0x8
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.277
	d24	_.str.107
	db	1                               ; 0x1
	db	8                               ; 0x8
	db	20                              ; 0x14
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	5                               ; 0x5
	db	8                               ; 0x8
	db	16                              ; 0x10
	db	3                               ; 0x3
	db	0                               ; 0x0
	db	10                              ; 0xa
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	29                              ; 0x1d
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	141                             ; 0x8d
	db	255                             ; 0xff
	d24	_.str.278
	d24	_.str.279
	db	1                               ; 0x1
	db	8                               ; 0x8
	db	246                             ; 0xf6
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	16                              ; 0x10
	db	5                               ; 0x5
	db	8                               ; 0x8
	db	16                              ; 0x10
	db	3                               ; 0x3
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	142                             ; 0x8e
	db	143                             ; 0x8f
	d24	_.str.280
	d24	_.str.281
	db	1                               ; 0x1
	db	8                               ; 0x8
	db	236                             ; 0xec
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	246                             ; 0xf6
	dw	16                              ; 0x10
	db	5                               ; 0x5
	db	8                               ; 0x8
	db	16                              ; 0x10
	db	3                               ; 0x3
	db	1                               ; 0x1
	db	10                              ; 0xa
	db	7                               ; 0x7
	db	8                               ; 0x8
	db	8                               ; 0x8
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	144                             ; 0x90
	db	255                             ; 0xff
	d24	_.str.282
	d24	_.str.283
	db	1                               ; 0x1
	db	8                               ; 0x8
	db	20                              ; 0x14
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	5                               ; 0x5
	db	8                               ; 0x8
	db	16                              ; 0x10
	db	3                               ; 0x3
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	8                               ; 0x8
	db	8                               ; 0x8
	db	29                              ; 0x1d
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	144                             ; 0x90
	db	255                             ; 0xff
	d24	_.str.284
	d24	_.str.239
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	10                              ; 0xa
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	5                               ; 0x5
	db	8                               ; 0x8
	db	16                              ; 0x10
	db	3                               ; 0x3
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.285
	d24	_.str.286
	db	1                               ; 0x1
	db	6                               ; 0x6
	db	20                              ; 0x14
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	5                               ; 0x5
	db	9                               ; 0x9
	db	16                              ; 0x10
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	146                             ; 0x92
	db	255                             ; 0xff
	d24	_.str.287
	d24	_.str.288
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	246                             ; 0xf6
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	16                              ; 0x10
	db	5                               ; 0x5
	db	9                               ; 0x9
	db	16                              ; 0x10
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	4                               ; 0x4
	db	255                             ; 0xff
	db	147                             ; 0x93
	db	148                             ; 0x94
	d24	_.str.289
	d24	_.str.290
	db	1                               ; 0x1
	db	6                               ; 0x6
	db	236                             ; 0xec
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	246                             ; 0xf6
	dw	16                              ; 0x10
	db	5                               ; 0x5
	db	9                               ; 0x9
	db	16                              ; 0x10
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	50                              ; 0x32
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	149                             ; 0x95
	db	255                             ; 0xff
	d24	_.str.291
	d24	_.str.292
	db	1                               ; 0x1
	db	6                               ; 0x6
	db	20                              ; 0x14
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	246                             ; 0xf6
	dw	16                              ; 0x10
	db	5                               ; 0x5
	db	9                               ; 0x9
	db	16                              ; 0x10
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	50                              ; 0x32
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	149                             ; 0x95
	db	255                             ; 0xff
	d24	_.str.293
	d24	_.str.294
	db	1                               ; 0x1
	db	6                               ; 0x6
	db	246                             ; 0xf6
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	16                              ; 0x10
	db	5                               ; 0x5
	db	9                               ; 0x9
	db	16                              ; 0x10
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.295
	d24	_.str.296
	db	1                               ; 0x1
	db	2                               ; 0x2
	db	20                              ; 0x14
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	241                             ; 0xf1
	dw	16                              ; 0x10
	db	4                               ; 0x4
	db	10                              ; 0xa
	db	16                              ; 0x10
	db	5                               ; 0x5
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	151                             ; 0x97
	db	255                             ; 0xff
	d24	_.str.297
	d24	_.str.298
	db	3                               ; 0x3
	db	255                             ; 0xff
	db	246                             ; 0xf6
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	16                              ; 0x10
	db	4                               ; 0x4
	db	10                              ; 0xa
	db	16                              ; 0x10
	db	5                               ; 0x5
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	3                               ; 0x3
	db	255                             ; 0xff
	db	152                             ; 0x98
	db	153                             ; 0x99
	d24	_.str.299
	d24	_.str.300
	db	1                               ; 0x1
	db	2                               ; 0x2
	db	236                             ; 0xec
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	15                              ; 0xf
	dw	16                              ; 0x10
	db	4                               ; 0x4
	db	10                              ; 0xa
	db	16                              ; 0x10
	db	5                               ; 0x5
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	25                              ; 0x19
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	154                             ; 0x9a
	db	255                             ; 0xff
	d24	_.str.301
	d24	_.str.302
	db	1                               ; 0x1
	db	2                               ; 0x2
	db	25                              ; 0x19
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	246                             ; 0xf6
	dw	16                              ; 0x10
	db	4                               ; 0x4
	db	10                              ; 0xa
	db	16                              ; 0x10
	db	5                               ; 0x5
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	25                              ; 0x19
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	154                             ; 0x9a
	db	255                             ; 0xff
	d24	_.str.303
	d24	_.str.304
	db	1                               ; 0x1
	db	2                               ; 0x2
	db	246                             ; 0xf6
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	4                               ; 0x4
	db	10                              ; 0xa
	db	16                              ; 0x10
	db	5                               ; 0x5
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.305
	d24	_.str.306
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	241                             ; 0xf1
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	9                               ; 0x9
	db	11                              ; 0xb
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	2                               ; 0x2
	db	10                              ; 0xa
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	156                             ; 0x9c
	db	255                             ; 0xff
	d24	_.str.307
	d24	_.str.308
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	10                              ; 0xa
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	16                              ; 0x10
	db	9                               ; 0x9
	db	11                              ; 0xb
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	157                             ; 0x9d
	db	158                             ; 0x9e
	d24	_.str.309
	d24	_.str.310
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	20                              ; 0x14
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	9                               ; 0x9
	db	11                              ; 0xb
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	159                             ; 0x9f
	db	255                             ; 0xff
	d24	_.str.311
	d24	_.str.312
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	236                             ; 0xec
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	246                             ; 0xf6
	dw	16                              ; 0x10
	db	9                               ; 0x9
	db	11                              ; 0xb
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	159                             ; 0x9f
	db	255                             ; 0xff
	d24	_.str.313
	d24	_.str.239
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	10                              ; 0xa
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	9                               ; 0x9
	db	11                              ; 0xb
	db	16                              ; 0x10
	db	9                               ; 0x9
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.314
	d24	_.str.315
	db	1                               ; 0x1
	db	2                               ; 0x2
	db	15                              ; 0xf
	db	3                               ; 0x3
	db	255                             ; 0xff
	db	246                             ; 0xf6
	dw	16                              ; 0x10
	db	3                               ; 0x3
	db	12                              ; 0xc
	db	16                              ; 0x10
	db	10                              ; 0xa
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	161                             ; 0xa1
	db	255                             ; 0xff
	d24	_.str.316
	d24	_.str.317
	db	3                               ; 0x3
	db	255                             ; 0xff
	db	246                             ; 0xf6
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	16                              ; 0x10
	db	3                               ; 0x3
	db	12                              ; 0xc
	db	16                              ; 0x10
	db	10                              ; 0xa
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	1                               ; 0x1
	db	2                               ; 0x2
	db	162                             ; 0xa2
	db	163                             ; 0xa3
	d24	_.str.318
	d24	_.str.319
	db	1                               ; 0x1
	db	2                               ; 0x2
	db	236                             ; 0xec
	db	3                               ; 0x3
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	3                               ; 0x3
	db	12                              ; 0xc
	db	16                              ; 0x10
	db	10                              ; 0xa
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	2                               ; 0x2
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	164                             ; 0xa4
	db	255                             ; 0xff
	d24	_.str.320
	d24	_.str.321
	db	8                               ; 0x8
	db	255                             ; 0xff
	db	1                               ; 0x1
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	3                               ; 0x3
	db	12                              ; 0xc
	db	16                              ; 0x10
	db	10                              ; 0xa
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	2                               ; 0x2
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	164                             ; 0xa4
	db	255                             ; 0xff
	d24	_.str.322
	d24	_.str.323
	db	1                               ; 0x1
	db	2                               ; 0x2
	db	246                             ; 0xf6
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	3                               ; 0x3
	db	12                              ; 0xc
	db	16                              ; 0x10
	db	10                              ; 0xa
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.324
	d24	_.str.325
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	236                             ; 0xec
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	16                              ; 0x10
	db	3                               ; 0x3
	db	13                              ; 0xd
	db	16                              ; 0x10
	db	3                               ; 0x3
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	29                              ; 0x1d
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	166                             ; 0xa6
	db	255                             ; 0xff
	d24	_.str.326
	d24	_.str.327
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	231                             ; 0xe7
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	16                              ; 0x10
	db	3                               ; 0x3
	db	13                              ; 0xd
	db	16                              ; 0x10
	db	3                               ; 0x3
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	29                              ; 0x1d
	db	1                               ; 0x1
	db	29                              ; 0x1d
	db	167                             ; 0xa7
	db	168                             ; 0xa8
	d24	_.str.328
	d24	_.str.329
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	246                             ; 0xf6
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	16                              ; 0x10
	db	3                               ; 0x3
	db	13                              ; 0xd
	db	16                              ; 0x10
	db	3                               ; 0x3
	db	1                               ; 0x1
	db	10                              ; 0xa
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	29                              ; 0x1d
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	169                             ; 0xa9
	db	255                             ; 0xff
	d24	_.str.330
	d24	_.str.331
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	226                             ; 0xe2
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	16                              ; 0x10
	db	3                               ; 0x3
	db	13                              ; 0xd
	db	16                              ; 0x10
	db	3                               ; 0x3
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	8                               ; 0x8
	db	0                               ; 0x0
	db	29                              ; 0x1d
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	169                             ; 0xa9
	db	255                             ; 0xff
	d24	_.str.332
	d24	_.str.329
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	246                             ; 0xf6
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	16                              ; 0x10
	db	3                               ; 0x3
	db	13                              ; 0xd
	db	16                              ; 0x10
	db	9                               ; 0x9
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	29                              ; 0x1d
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.333
	d24	_.str.334
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	236                             ; 0xec
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	16                              ; 0x10
	db	3                               ; 0x3
	db	14                              ; 0xe
	db	16                              ; 0x10
	db	4                               ; 0x4
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	31                              ; 0x1f
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	171                             ; 0xab
	db	255                             ; 0xff
	d24	_.str.335
	d24	_.str.336
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	231                             ; 0xe7
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	16                              ; 0x10
	db	3                               ; 0x3
	db	14                              ; 0xe
	db	16                              ; 0x10
	db	4                               ; 0x4
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	31                              ; 0x1f
	db	1                               ; 0x1
	db	31                              ; 0x1f
	db	172                             ; 0xac
	db	173                             ; 0xad
	d24	_.str.337
	d24	_.str.338
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	246                             ; 0xf6
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	16                              ; 0x10
	db	3                               ; 0x3
	db	14                              ; 0xe
	db	16                              ; 0x10
	db	9                               ; 0x9
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	31                              ; 0x1f
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	174                             ; 0xae
	db	255                             ; 0xff
	d24	_.str.339
	d24	_.str.340
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	226                             ; 0xe2
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	16                              ; 0x10
	db	3                               ; 0x3
	db	14                              ; 0xe
	db	16                              ; 0x10
	db	9                               ; 0x9
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	31                              ; 0x1f
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	174                             ; 0xae
	db	255                             ; 0xff
	d24	_.str.341
	d24	_.str.338
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	246                             ; 0xf6
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	16                              ; 0x10
	db	3                               ; 0x3
	db	14                              ; 0xe
	db	16                              ; 0x10
	db	4                               ; 0x4
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	31                              ; 0x1f
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.342
	d24	_.str.343
	db	1                               ; 0x1
	db	2                               ; 0x2
	db	10                              ; 0xa
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	246                             ; 0xf6
	dw	16                              ; 0x10
	db	4                               ; 0x4
	db	15                              ; 0xf
	db	16                              ; 0x10
	db	6                               ; 0x6
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	176                             ; 0xb0
	db	255                             ; 0xff
	d24	_.str.344
	d24	_.str.345
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	10                              ; 0xa
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	16                              ; 0x10
	db	4                               ; 0x4
	db	15                              ; 0xf
	db	16                              ; 0x10
	db	6                               ; 0x6
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	4                               ; 0x4
	db	255                             ; 0xff
	db	177                             ; 0xb1
	db	178                             ; 0xb2
	d24	_.str.346
	d24	_.str.347
	db	1                               ; 0x1
	db	2                               ; 0x2
	db	241                             ; 0xf1
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	15                              ; 0xf
	dw	16                              ; 0x10
	db	4                               ; 0x4
	db	15                              ; 0xf
	db	16                              ; 0x10
	db	8                               ; 0x8
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	50                              ; 0x32
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	179                             ; 0xb3
	db	255                             ; 0xff
	d24	_.str.348
	d24	_.str.349
	db	1                               ; 0x1
	db	2                               ; 0x2
	db	20                              ; 0x14
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	4                               ; 0x4
	db	15                              ; 0xf
	db	16                              ; 0x10
	db	8                               ; 0x8
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	50                              ; 0x32
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	179                             ; 0xb3
	db	255                             ; 0xff
	d24	_.str.350
	d24	_.str.239
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	10                              ; 0xa
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	4                               ; 0x4
	db	15                              ; 0xf
	db	16                              ; 0x10
	db	6                               ; 0x6
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.351
	d24	_.str.352
	db	1                               ; 0x1
	db	12                              ; 0xc
	db	15                              ; 0xf
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	6                               ; 0x6
	db	16                              ; 0x10
	db	16                              ; 0x10
	db	9                               ; 0x9
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	33                              ; 0x21
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	181                             ; 0xb5
	db	255                             ; 0xff
	d24	_.str.353
	d24	_.str.354
	db	1                               ; 0x1
	db	12                              ; 0xc
	db	246                             ; 0xf6
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	16                              ; 0x10
	db	6                               ; 0x6
	db	16                              ; 0x10
	db	16                              ; 0x10
	db	9                               ; 0x9
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	3                               ; 0x3
	db	255                             ; 0xff
	db	182                             ; 0xb6
	db	183                             ; 0xb7
	d24	_.str.355
	d24	_.str.356
	db	1                               ; 0x1
	db	12                              ; 0xc
	db	236                             ; 0xec
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	6                               ; 0x6
	db	16                              ; 0x10
	db	16                              ; 0x10
	db	9                               ; 0x9
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	25                              ; 0x19
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	184                             ; 0xb8
	db	255                             ; 0xff
	d24	_.str.357
	d24	_.str.358
	db	1                               ; 0x1
	db	12                              ; 0xc
	db	20                              ; 0x14
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	246                             ; 0xf6
	dw	16                              ; 0x10
	db	6                               ; 0x6
	db	16                              ; 0x10
	db	16                              ; 0x10
	db	9                               ; 0x9
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	25                              ; 0x19
	db	33                              ; 0x21
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	184                             ; 0xb8
	db	255                             ; 0xff
	d24	_.str.359
	d24	_.str.360
	db	1                               ; 0x1
	db	12                              ; 0xc
	db	246                             ; 0xf6
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	6                               ; 0x6
	db	16                              ; 0x10
	db	16                              ; 0x10
	db	9                               ; 0x9
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.361
	d24	_.str.362
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	15                              ; 0xf
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	7                               ; 0x7
	db	17                              ; 0x11
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	186                             ; 0xba
	db	255                             ; 0xff
	d24	_.str.363
	d24	_.str.364
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	10                              ; 0xa
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	16                              ; 0x10
	db	7                               ; 0x7
	db	17                              ; 0x11
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	1                               ; 0x1
	db	35                              ; 0x23
	db	187                             ; 0xbb
	db	188                             ; 0xbc
	d24	_.str.365
	d24	_.str.366
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	20                              ; 0x14
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	16                              ; 0x10
	db	7                               ; 0x7
	db	17                              ; 0x11
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	35                              ; 0x23
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	189                             ; 0xbd
	db	255                             ; 0xff
	d24	_.str.367
	d24	_.str.368
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	241                             ; 0xf1
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	246                             ; 0xf6
	dw	16                              ; 0x10
	db	7                               ; 0x7
	db	17                              ; 0x11
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	35                              ; 0x23
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	189                             ; 0xbd
	db	255                             ; 0xff
	d24	_.str.369
	d24	_.str.370
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	10                              ; 0xa
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	16                              ; 0x10
	db	7                               ; 0x7
	db	17                              ; 0x11
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.371
	d24	_.str.372
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	10                              ; 0xa
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	8                               ; 0x8
	db	18                              ; 0x12
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	191                             ; 0xbf
	db	255                             ; 0xff
	d24	_.str.373
	d24	_.str.374
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	246                             ; 0xf6
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	16                              ; 0x10
	db	8                               ; 0x8
	db	18                              ; 0x12
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	192                             ; 0xc0
	db	193                             ; 0xc1
	d24	_.str.375
	d24	_.str.376
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	15                              ; 0xf
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	246                             ; 0xf6
	dw	16                              ; 0x10
	db	8                               ; 0x8
	db	18                              ; 0x12
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	194                             ; 0xc2
	db	255                             ; 0xff
	d24	_.str.377
	d24	_.str.378
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	241                             ; 0xf1
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	8                               ; 0x8
	db	18                              ; 0x12
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	194                             ; 0xc2
	db	255                             ; 0xff
	d24	_.str.379
	d24	_.str.239
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	10                              ; 0xa
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	8                               ; 0x8
	db	18                              ; 0x12
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff
	d24	_.str.380
	d24	_.str.381
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	15                              ; 0xf
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	10                              ; 0xa
	dw	16                              ; 0x10
	db	9                               ; 0x9
	db	19                              ; 0x13
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	196                             ; 0xc4
	db	255                             ; 0xff
	d24	_.str.382
	d24	_.str.383
	db	2                               ; 0x2
	db	255                             ; 0xff
	db	246                             ; 0xf6
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	dw	16                              ; 0x10
	db	9                               ; 0x9
	db	19                              ; 0x13
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	197                             ; 0xc5
	db	198                             ; 0xc6
	d24	_.str.384
	d24	_.str.385
	db	7                               ; 0x7
	db	255                             ; 0xff
	db	1                               ; 0x1
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	241                             ; 0xf1
	dw	16                              ; 0x10
	db	9                               ; 0x9
	db	19                              ; 0x13
	db	16                              ; 0x10
	db	11                              ; 0xb
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	2                               ; 0x2
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	199                             ; 0xc7
	db	255                             ; 0xff
	d24	_.str.386
	d24	_.str.387
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	15                              ; 0xf
	db	5                               ; 0x5
	db	255                             ; 0xff
	db	246                             ; 0xf6
	dw	16                              ; 0x10
	db	9                               ; 0x9
	db	19                              ; 0x13
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	1                               ; 0x1
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	199                             ; 0xc7
	db	255                             ; 0xff
	d24	_.str.388
	d24	_.str.389
	db	6                               ; 0x6
	db	255                             ; 0xff
	db	10                              ; 0xa
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	246                             ; 0xf6
	dw	16                              ; 0x10
	db	9                               ; 0x9
	db	19                              ; 0x13
	db	16                              ; 0x10
	db	0                               ; 0x0
	db	1                               ; 0x1
	db	255                             ; 0xff
	db	7                               ; 0x7
	db	0                               ; 0x0
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	0                               ; 0x0
	db	255                             ; 0xff
	db	255                             ; 0xff
	db	255                             ; 0xff

	.section	.rodata._.str.72.749,"a",@progbits
	.balign	1
	.local	_.str.72.749
_.str.72.749:
	.asciz	"CNTGN3"

	.section	.rodata._.str.73.763,"a",@progbits
	.balign	1
	.local	_.str.73.763
_.str.73.763:
	.asciz	"CNTGN3B"

	.section	.rodata._.str.74.764,"a",@progbits
	.balign	1
	.local	_.str.74.764
_.str.74.764:
	.asciz	"CNTGN3T"

	.section	.rodata._.str.75.762,"a",@progbits
	.balign	1
	.local	_.str.75.762
_.str.75.762:
	.asciz	"FAIL EVENT/SAVE %u"

	.section	.rodata._.str.76.750,"a",@progbits
	.balign	1
	.local	_.str.76.750
_.str.76.750:
	.asciz	"w"

	.section	.rodata._.str.77.751,"a",@progbits
	.balign	1
	.local	_.str.77.751
_.str.77.751:
	.asciz	"CNTGN2"

	.section	.rodata._.str.78.752,"a",@progbits
	.balign	1
	.local	_.str.78.752
_.str.78.752:
	.asciz	"CNTGN2B"

	.section	.rodata._.str.79.761,"a",@progbits
	.balign	1
	.local	_.str.79.761
_.str.79.761:
	.asciz	"r"

	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.ident	"clang version 19.1.0 (https://github.com/CE-Programming/llvm-project ef28e9c54cd1333a6091ab2ffbd315b465fc5090)"
	.section	".note.GNU-stack","",@progbits
	.extern	_gfx_FillCircle
	.extern	__sremu
	.extern	_llvm.memset.p0.i64
	.extern	_os_GetCSC
	.extern	__lcmpzero
	.extern	__brems
	.extern	_memchr
	.extern	_ti_Seek
	.extern	__ladd
	.extern	_llvm.umin.i24
	.extern	__idivu
	.extern	__ldivs
	.extern	__indcallhl
	.extern	_llvm.eh.sjlj.lsda
	.extern	_free
	.extern	__lnot
	.extern	_memcmp
	.extern	__bremu
	.extern	_gfx_VertLine
	.extern	_gfx_Rectangle
	.extern	_gfx_Blit
	.extern	__iremu
	.extern	_gfx_FillTriangle
	.extern	__lshl
	.extern	__sand
	.extern	_kb_AnyKey
	.extern	__lcmpu
	.extern	_gfx_PrintChar
	.extern	_llvm.uadd.sat.i32
	.extern	_llvm.eh.sjlj.callsite
	.extern	_gfx_Circle
	.extern	_ti_Write
	.extern	_gfx_SetClipRegion
	.extern	__smulu
	.extern	__ldivu
	.extern	_llvm.smin.i24
	.extern	_gfx_FillRectangle
	.extern	_llvm.lifetime.end.p0
	.extern	__sor
	.extern	_kb_Scan
	.extern	__land
	.extern	_gfx_GetStringWidth
	.extern	__setflag
	.extern	_llvm.smax.i32
	.extern	_llvm.lifetime.start.p0
	.extern	_gfx_SetTextTransparentColor
	.extern	__lshru
	.extern	__ixor
	.extern	_memcpy
	.extern	__srems
	.extern	_llvm.umax.i24
	.extern	_llvm.memcpy.p0.p0.i24
	.extern	_llvm.eh.sjlj.setup.dispatch
	.extern	_gfx_SetTextFGColor
	.extern	_gfx_SetTransparentColor
	.extern	__lor
	.extern	__imulu
	.extern	_gfx_SetDraw
	.extern	__ishl
	.extern	_strcat
	.extern	_llvm.uadd.with.overflow.i24
	.extern	__ishru
	.extern	__Unwind_SjLj_Unregister
	.extern	_llvm.usub.sat.i16
	.extern	_llvm.smax.i16
	.extern	__sneg
	.extern	__lsub
	.extern	_llvm.abs.i24
	.extern	_ti_Open
	.extern	__lxor
	.extern	_ti_Delete
	.extern	__iand
	.extern	_ti_Close
	.extern	__sdivs
	.extern	__sdivu
	.extern	__bshru
	.extern	__snot
	.extern	_llvm.umin.i8
	.extern	_llvm.memset.p0.i24
	.extern	_gfx_End
	.extern	_llvm.frameaddress.p0
	.extern	_gfx_ScaledTransparentSprite_NoClip
	.extern	__lremu
	.extern	_sprintf
	.extern	__indcall
	.extern	_gfx_SetTextScale
	.extern	__ishru_1
	.extern	__lcmps
	.extern	_gfx_SetTextBGColor
	.extern	__sshru
	.extern	_strlen
	.extern	__frameset
	.extern	__lmulu
	.extern	__sshl
	.extern	__idivs
	.extern	_llvm.umax.i8
	.extern	_srand
	.extern	_gfx_Line
	.extern	_ti_Read
	.extern	_malloc
	.extern	_snprintf
	.extern	_strcpy
	.extern	_gfx_TransparentSprite
	.extern	_llvm.stacksave.p0
	.extern	_llvm.umin.i16
	.extern	_llvm.eh.sjlj.functioncontext
	.extern	_ti_GetSize
	.extern	_llvm.umin.i32
	.extern	_realloc
	.extern	_gfx_FillScreen
	.extern	_gfx_PrintStringXY
	.extern	_gfx_SetColor
	.extern	_gfx_SetTextConfig
	.extern	_gfx_SetTextXY
	.extern	_llvm.stackrestore.p0
	.extern	_gfx_Begin
	.extern	__bdivu
	.extern	_gfx_SwapDraw
	.extern	_random
	.extern	__frameset0
	.extern	__Unwind_SjLj_Register
	.extern	__bshl
