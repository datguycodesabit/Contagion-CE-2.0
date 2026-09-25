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
	ld	hl, _.str.61.251
	ld	bc, 9
	ldir
	pop	ix
	ret
	.local	.Lfunc_end11
.Lfunc_end11:
	.size	_ResetDisease, .Lfunc_end11-_ResetDisease
                                        ; -- End function
	.section	.text._CalculateEffects,"ax",@progbits
	.globl	_CalculateEffects               ; -- Begin function CalculateEffects
	.type	_CalculateEffects,@function
_CalculateEffects:                      ; @CalculateEffects
; %bb.0:
	ld	hl, -67
	call	__frameset
	ld	hl, (ix + 9)
	ld.sis	de, 800
	ld	(ix - 25), e
	ld	(ix - 24), d
	ld	e, 45
	ld	(ix - 22), e
	ld	(ix - 21), d
	ld.sis	de, 12
	ld	(ix - 18), e
	ld	(ix - 17), d
	ld	de, _environments+3
	ld	(ix - 16), de
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
	.local	.LBB12_1
.LBB12_1:                               ; =>This Inner Loop Header: Depth=1
	ld	(ix - 13), hl
	or	a, a
	sbc	hl, de
	jr	z, .LBB12_6
; %bb.2:                                ;   in Loop: Header=BB12_1 Depth=1
	ld	(ix - 27), c
	ld	(ix - 26), b
	ld	(ix - 30), iy
	push	iy
	ld	hl, (ix + 6)
	push	hl
	call	_Owns
	pop	hl
	pop	hl
	bit	0, a
	jr	z, .LBB12_4
; %bb.3:                                ;   in Loop: Header=BB12_1 Depth=1
	ld	iy, _traits
	ld	de, (ix - 13)
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
	ld	l, (ix - 27)
	ld	h, (ix - 26)
	add.sis	hl, de
	ld	c, l
	ld	b, h
	jr	.LBB12_5
	.local	.LBB12_4
.LBB12_4:                               ;   in Loop: Header=BB12_1 Depth=1
	ld	c, (ix - 27)
	ld	b, (ix - 26)
	.local	.LBB12_5
.LBB12_5:                               ;   in Loop: Header=BB12_1 Depth=1
	ld	hl, (ix - 13)
	ld	iy, (ix - 30)
	inc	iyl
	ld	de, 22
	add	hl, de
	ld	de, 858
	jr	.LBB12_1
	.local	.LBB12_6
.LBB12_6:
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
	ld	(ix - 13), l
	ld	(ix - 12), h
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
	ld	e, (ix - 13)
	ld	d, (ix - 12)
	ld	h, d
	ld.sis	bc, 1200
	call	__smulu
	ld	(ix - 20), l
	ld	(ix - 19), h
	ld	iy, (ix + 6)
	ld	hl, (iy)
	ld	e, (iy + 3)
	ld	(ix - 30), hl
	ld	(ix - 33), e                    ; 1-byte Folded Spill
	ld	bc, 16384
	push	hl
	ld	l, (ix - 13)
	ld	h, (ix - 12)
	ex	(sp), hl
	pop	iy
	ld	a, iyh
	call	__land
	ld	a, h
	or	a, a
	sbc	hl, hl
	ld	l, h
	ld	(ix - 34), a                    ; 1-byte Folded Spill
	ld	(ix - 27), l                    ; 1-byte Folded Spill
	cp	a, l
	jr	z, .LBB12_8
; %bb.7:
	ld.sis	hl, 1800
	ld	(ix - 25), l
	ld	(ix - 24), h
	.local	.LBB12_8
.LBB12_8:
	ld	l, (ix - 25)
	ld	h, (ix - 24)
	ld	e, (ix - 20)
	ld	d, (ix - 19)
	add.sis	hl, de
	ld	(ix - 37), l
	ld	(ix - 36), h
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
	ld	e, (ix - 25)
	ld	d, (ix - 24)
	add.sis	hl, de
	ld	iy, (ix + 9)
	ld	(iy + 24), l
	ld	(iy + 25), h
	ld	iy, (ix + 6)
	ld	a, (iy + 32)
	cp	a, 2
	jr	nz, .LBB12_10
; %bb.9:
	ld	e, (ix - 37)
	ld	d, (ix - 36)
	srl	d
	rr	e
	ld	iy, (ix + 9)
	ld	(iy + 22), e
	ld	(iy + 23), d
	srl	h
	rr	l
	ld	(iy + 24), l
	ld	(iy + 25), h
	.local	.LBB12_10
.LBB12_10:
	ld	hl, 10
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_Level
	ld	l, a
	pop	de
	pop	de
	or	a, a
	jr	nz, .LBB12_12
; %bb.11:
	ld	hl, (ix - 30)
	ld	e, (ix - 33)                    ; 1-byte Folded Reload
	ld	bc, 65536
	push	hl
	ld	l, (ix - 13)
	ld	h, (ix - 12)
	ex	(sp), hl
	pop	iy
	ld	a, iyh
	call	__land
	ld	(ix - 37), hl
	ld	(ix - 38), e                    ; 1-byte Folded Spill
	ld.sis	hl, 0
	jr	.LBB12_15
	.local	.LBB12_12
.LBB12_12:
	ld	e, (ix - 20)
	ld	d, (ix - 19)
	ld	h, d
	ld.sis	bc, 100
	call	__smulu
	ld	(ix - 25), l
	ld	(ix - 24), h
	ld	hl, (ix - 30)
	ld	e, (ix - 33)                    ; 1-byte Folded Reload
	ld	bc, 65536
	push	hl
	ld	l, (ix - 13)
	ld	h, (ix - 12)
	ex	(sp), hl
	pop	iy
	ld	a, iyh
	call	__land
	push	hl
	pop	bc
	ld	a, e
	ld	l, 16
	ld	(ix - 37), bc
	ld	(ix - 38), a                    ; 1-byte Folded Spill
	call	__lshru
	bit	0, c
	ld.sis	de, 0
	jr	z, .LBB12_14
; %bb.13:
	ld.sis	de, 200
	.local	.LBB12_14
.LBB12_14:
	ld	l, (ix - 25)
	ld	h, (ix - 24)
	add.sis	hl, de
	.local	.LBB12_15
.LBB12_15:
	ld	iy, (ix + 9)
	ld	(iy + 26), l
	ld	(iy + 27), h
	ld	l, (ix - 20)
	ld	h, (ix - 19)
	ld	(ix - 10), h
	ld	hl, (ix - 12)
	ld	e, (ix - 18)
	ld	d, (ix - 17)
	ld	h, d
	ld	l, e
	ld	de, 0
	ld	(ix - 18), e                    ; 1-byte Folded Spill
	ld	bc, 100
	push	hl
	ld	l, (ix - 13)
	ld	h, (ix - 12)
	ex	(sp), hl
	pop	iy
	ld	a, iyh
	call	__lmulu
	ld	(ix - 41), hl
	ld	(ix - 42), e                    ; 1-byte Folded Spill
	ld	hl, (ix - 30)
	ld	e, (ix - 33)                    ; 1-byte Folded Reload
	ld	bc, 32768
	call	__land
	ld	de, 14
	ld	a, h
	ld	(ix - 43), a
	ld	bc, 0
	.local	.LBB12_16
.LBB12_16:                              ; =>This Inner Loop Header: Depth=1
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	jp	z, .LBB12_38
; %bb.17:                               ;   in Loop: Header=BB12_16 Depth=1
	ld	(ix - 46), bc
	ld	a, (ix - 34)                    ; 1-byte Folded Reload
	ld	l, (ix - 27)
	cp	a, l
	ld	a, -1
	jr	z, .LBB12_19
; %bb.18:                               ;   in Loop: Header=BB12_16 Depth=1
	ld	a, 0
	.local	.LBB12_19
.LBB12_19:                              ;   in Loop: Header=BB12_16 Depth=1
	ld	(ix - 48), a
	ld	iy, (ix - 16)
	ld	a, (iy - 3)
	ld	(ix - 52), a
	ld	e, (ix - 20)
	ld	d, (ix - 19)
	ld	(ix - 9), d
	ld	hl, (ix - 11)
	ld	h, d
	ld	l, a
	ld	e, (ix - 18)                    ; 1-byte Folded Reload
	ld	bc, 100
	push	hl
	ld	l, (ix - 13)
	ld	h, (ix - 12)
	ex	(sp), hl
	pop	iy
	ld	a, iyh
	call	__lmulu
	ld	(ix - 25), hl
	ld	(ix - 30), e                    ; 1-byte Folded Spill
	ld	hl, 29
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_Level
	ld	e, (ix - 22)
	ld	d, (ix - 21)
	ld	d, a
	ld	(ix - 22), e
	ld	(ix - 21), d
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
	ld	hl, (ix - 25)
	ld	e, (ix - 30)                    ; 1-byte Folded Reload
	ld	a, (ix - 18)                    ; 1-byte Folded Reload
	call	__lmulu
	ld	bc, 100
	push	hl
	ld	l, (ix - 13)
	ld	h, (ix - 12)
	ex	(sp), hl
	pop	iy
	ld	a, iyh
	call	__ldivu
	ld	(ix - 25), hl
	ld	(ix - 49), e                    ; 1-byte Folded Spill
	ld	iy, (ix - 16)
	ld	a, (iy - 2)
	ld	e, (ix - 20)
	ld	d, (ix - 19)
	ld	(ix - 8), d
	ld	hl, (ix - 10)
	ld	h, d
	ld	(ix - 47), a                    ; 1-byte Folded Spill
	ld	l, a
	ld	e, (ix - 18)                    ; 1-byte Folded Reload
	ld	bc, 180
	push	hl
	ld	l, (ix - 13)
	ld	h, (ix - 12)
	ex	(sp), hl
	pop	iy
	ld	a, iyh
	call	__lmulu
	ld	(ix - 30), hl
	ld	(ix - 33), e                    ; 1-byte Folded Spill
	ld	hl, 31
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_Level
	ld	h, a
	pop	de
	pop	de
	ld	e, (ix - 22)
	ld	d, (ix - 21)
	ld	l, e
	mlt	hl
	ld	de, 0
	ld	e, l
	ld	hl, 100
	or	a, a
	sbc	hl, de
	push	hl
	pop	bc
	ld	hl, (ix - 30)
	ld	e, (ix - 33)                    ; 1-byte Folded Reload
	ld	a, (ix - 18)                    ; 1-byte Folded Reload
	call	__lmulu
	ld	bc, 100
	push	hl
	ld	l, (ix - 13)
	ld	h, (ix - 12)
	ex	(sp), hl
	pop	iy
	ld	a, iyh
	call	__ldivu
	ld	(ix - 55), hl
	ld	(ix - 56), e                    ; 1-byte Folded Spill
	ld	iy, (ix - 16)
	ld	a, (iy + 3)
	ld	(ix - 57), a
	ld	e, (ix - 20)
	ld	d, (ix - 19)
	ld	(ix - 7), d
	ld	hl, (ix - 9)
	ld	h, d
	ld	l, a
	ld	e, (ix - 18)                    ; 1-byte Folded Reload
	push	hl
	ld	l, (ix - 13)
	ld	h, (ix - 12)
	ex	(sp), hl
	pop	iy
	ld	a, iyh
	call	__lmulu
	ld	(ix - 30), hl
	ld	(ix - 33), e                    ; 1-byte Folded Spill
	ld	hl, 33
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_Level
	ld	h, a
	pop	de
	pop	de
	ld	e, (ix - 22)
	ld	d, (ix - 21)
	ld	l, e
	mlt	hl
	ld	de, 0
	ld	e, l
	ld	hl, 100
	or	a, a
	sbc	hl, de
	push	hl
	pop	bc
	ld	hl, (ix - 30)
	ld	e, (ix - 33)                    ; 1-byte Folded Reload
	ld	a, (ix - 18)                    ; 1-byte Folded Reload
	call	__lmulu
	ld	bc, 100
	push	hl
	ld	l, (ix - 13)
	ld	h, (ix - 12)
	ex	(sp), hl
	pop	iy
	ld	a, iyh
	call	__ldivu
	ld	(ix - 60), hl
	ld	(ix - 61), e                    ; 1-byte Folded Spill
	ld	hl, (ix - 16)
	ld	a, (hl)
	or	a, a
	sbc	hl, hl
	push	hl
	pop	de
	ld	e, a
	ld	(ix - 30), de
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_Level
	pop	hl
	pop	hl
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	bc, (ix - 30)
	call	__imulu
	ld	(ix - 30), hl
	ld	iy, (ix - 16)
	ld	a, (iy - 1)
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	(ix - 33), hl
	ld	hl, 2
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_Level
	pop	hl
	pop	hl
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	bc, (ix - 33)
	call	__imulu
	ld	de, (ix - 30)
	add	hl, de
	ld	bc, 220
	call	__imulu
	ld	(ix - 64), hl
	ld	iy, (ix - 16)
	ld	a, (iy + 2)
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	(ix - 30), hl
	ld	hl, 4
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_Level
	pop	hl
	pop	hl
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	bc, (ix - 30)
	call	__imulu
	ld	(ix - 67), hl
	ld	iy, (ix - 16)
	ld	a, (iy + 1)
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	(ix - 33), hl
	ld	hl, 6
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_Level
	pop	hl
	pop	hl
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	bc, (ix - 33)
	call	__imulu
	ld	de, (ix - 67)
	add	hl, de
	ld	(ix - 67), hl
	or	a, a
	sbc	hl, hl
	ld	l, (ix - 52)                    ; 1-byte Folded Reload
	ld	(ix - 52), hl
	ld	hl, 8
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_Level
	pop	hl
	pop	hl
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	bc, (ix - 52)
	call	__imulu
	ex	de, hl
	ld	hl, (ix - 67)
	add	hl, de
	ld	bc, 280
	call	__imulu
	ld	(ix - 52), hl
	ld	hl, 12
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_Level
	pop	hl
	pop	hl
	ld	bc, 0
	push	bc
	pop	de
	ld	e, a
	ld	c, (ix - 57)                    ; 1-byte Folded Reload
	ld	hl, 4
	or	a, a
	sbc	hl, bc
	ld	bc, 100
	call	__imulu
	ld	bc, 50
	add	hl, bc
	push	de
	pop	bc
	call	__imulu
	push	hl
	pop	iy
	ld	(ix - 6), iy
	ld	a, (ix - 4)
	rlc	a
	sbc	a, a
	ld	d, a
	ld	hl, (ix - 25)
	ld	e, (ix - 49)                    ; 1-byte Folded Reload
	ld	bc, (ix - 55)
	ld	a, (ix - 56)                    ; 1-byte Folded Reload
	call	__ladd
	ld	bc, (ix - 60)
	ld	a, (ix - 61)                    ; 1-byte Folded Reload
	call	__ladd
	push	hl
	pop	bc
	ld	a, e
	ld	hl, (ix - 41)
	ld	e, (ix - 42)                    ; 1-byte Folded Reload
	call	__lsub
	ld	bc, (ix - 64)
	ld	a, (ix - 18)                    ; 1-byte Folded Reload
	call	__ladd
	lea	bc, iy + 0
	push	hl
	ld	l, (ix - 13)
	ld	h, (ix - 12)
	ex	(sp), hl
	pop	iy
	ld	a, d
	call	__ladd
	ld	bc, (ix - 52)
	ld	a, (ix - 18)                    ; 1-byte Folded Reload
	call	__ladd
	ld	d, e
	ld	(ix - 25), hl
	ld	bc, 300
	ld	a, iyh
	call	__ladd
	ld	a, (ix - 48)                    ; 1-byte Folded Reload
	bit	0, a
	jr	nz, .LBB12_21
; %bb.20:                               ;   in Loop: Header=BB12_16 Depth=1
	ld	(ix - 25), hl
	.local	.LBB12_21
.LBB12_21:                              ;   in Loop: Header=BB12_16 Depth=1
	bit	0, a
	jr	nz, .LBB12_23
; %bb.22:                               ;   in Loop: Header=BB12_16 Depth=1
	ld	d, e
	.local	.LBB12_23
.LBB12_23:                              ;   in Loop: Header=BB12_16 Depth=1
	ld	a, (ix - 43)                    ; 1-byte Folded Reload
	ld	l, (ix - 27)
	cp	a, l
	jr	z, .LBB12_25
; %bb.24:                               ;   in Loop: Header=BB12_16 Depth=1
	ld	hl, (ix - 30)
	ld	bc, (ix - 33)
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
	ld	hl, (ix - 25)
	ld	e, d
	lea	bc, iy + 0
	push	hl
	ld	l, (ix - 13)
	ld	h, (ix - 12)
	ex	(sp), hl
	pop	iy
	call	__ladd
	ld	(ix - 25), hl
	ld	d, e
	.local	.LBB12_25
.LBB12_25:                              ;   in Loop: Header=BB12_16 Depth=1
	ld	bc, (ix - 37)
	ld	a, (ix - 38)                    ; 1-byte Folded Reload
	ld	l, 16
	call	__lshru
	ld	l, 1
	ld	a, c
	xor	a, l
	ld	e, a
	or	a, a
	sbc	hl, hl
	ld	l, (ix - 47)                    ; 1-byte Folded Reload
	ld	bc, 280
	call	__imulu
	bit	0, e
	ld	bc, 0
	jr	nz, .LBB12_27
; %bb.26:                               ;   in Loop: Header=BB12_16 Depth=1
	push	hl
	pop	bc
	.local	.LBB12_27
.LBB12_27:                              ;   in Loop: Header=BB12_16 Depth=1
	bit	0, e
	ld	a, iyh
	jr	nz, .LBB12_29
; %bb.28:                               ;   in Loop: Header=BB12_16 Depth=1
	ld	a, (ix - 18)                    ; 1-byte Folded Reload
	.local	.LBB12_29
.LBB12_29:                              ;   in Loop: Header=BB12_16 Depth=1
	ld	hl, (ix - 25)
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
	jp	m, .LBB12_31
; %bb.30:                               ;   in Loop: Header=BB12_16 Depth=1
	ld	l, 0
	ld	c, l
	.local	.LBB12_31
.LBB12_31:                              ;   in Loop: Header=BB12_16 Depth=1
	bit	0, c
	jr	nz, .LBB12_33
; %bb.32:                               ;   in Loop: Header=BB12_16 Depth=1
	ld	iy, 100
	.local	.LBB12_33
.LBB12_33:                              ;   in Loop: Header=BB12_16 Depth=1
	bit	0, c
	jr	nz, .LBB12_35
; %bb.34:                               ;   in Loop: Header=BB12_16 Depth=1
	ld	e, (ix - 13)
	ld	d, (ix - 12)
	ld	a, d
	.local	.LBB12_35
.LBB12_35:                              ;   in Loop: Header=BB12_16 Depth=1
	lea	hl, iy + 0
	ld	e, a
	ld	(ix - 25), iy
	ld	bc, 10000
	push	hl
	ld	l, (ix - 13)
	ld	h, (ix - 12)
	ex	(sp), hl
	pop	iy
	ld	a, iyh
	call	__lcmpu
	ld	hl, (ix - 25)
	jr	c, .LBB12_37
; %bb.36:                               ;   in Loop: Header=BB12_16 Depth=1
	ld	hl, 10000
	.local	.LBB12_37
.LBB12_37:                              ;   in Loop: Header=BB12_16 Depth=1
	ld	iy, (ix + 9)
	ld	de, (ix - 46)
	add	iy, de
	ld	(iy), l
	ld	(iy + 1), h
	ex	de, hl
	ld	de, 2
	add	hl, de
	ld	iy, (ix - 16)
	lea	iy, iy + 7
	ld	(ix - 16), iy
	push	hl
	pop	bc
	push	hl
	ld	l, (ix - 13)
	ld	h, (ix - 12)
	ex	(sp), hl
	pop	iy
	ld	de, 14
	jp	.LBB12_16
	.local	.LBB12_38
.LBB12_38:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end12
.Lfunc_end12:
	.size	_CalculateEffects, .Lfunc_end12-_CalculateEffects
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
	jp	nz, .LBB14_16
; %bb.1:
	ld	a, (iy + 33)
	or	a, a
	jp	z, .LBB14_16
; %bb.2:
	ld	a, (iy + 34)
	or	a, a
	jp	nz, .LBB14_16
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
	jp	nz, .LBB14_16
; %bb.4:
	ld	iy, (ix + 9)
	ld	hl, 10000
	push	hl
	call	__indcall
	pop	de
	ld.sis	de, 1500
	or	a, a
	sbc.sis	hl, de
	jr	nc, .LBB14_13
; %bb.5:                                ; %.preheader.preheader
	ld	c, 17
	ld	d, -1
	ld	iyl, d
	ld	hl, (ix + 6)
	.local	.LBB14_6
.LBB14_6:                               ; %.preheader
                                        ; =>This Inner Loop Header: Depth=1
	ld	a, c
	cp	a, 29
	jr	z, .LBB14_14
; %bb.7:                                ;   in Loop: Header=BB14_6 Depth=1
	ld	(ix - 4), iy
	push	bc
	push	hl
	ld	(ix - 7), bc
	call	_Eligible
	pop	hl
	pop	hl
	bit	0, a
	jr	z, .LBB14_11
; %bb.8:                                ;   in Loop: Header=BB14_6 Depth=1
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
	jr	z, .LBB14_10
; %bb.9:                                ;   in Loop: Header=BB14_6 Depth=1
	ld	hl, (ix - 4)
	ld	a, l
	.local	.LBB14_10
.LBB14_10:                              ;   in Loop: Header=BB14_6 Depth=1
	ld	iyl, a
	ld	d, -1
	ld	hl, (ix + 6)
	jr	.LBB14_12
	.local	.LBB14_11
.LBB14_11:                              ;   in Loop: Header=BB14_6 Depth=1
	ld	d, -1
	ld	hl, (ix + 6)
	ld	iy, (ix - 4)
	ld	bc, (ix - 7)
	.local	.LBB14_12
.LBB14_12:                              ;   in Loop: Header=BB14_6 Depth=1
	inc	c
	jr	.LBB14_6
	.local	.LBB14_13
.LBB14_13:
	ld	d, -1
	jr	.LBB14_16
	.local	.LBB14_14
.LBB14_14:
	ld	a, iyl
	cp	a, -1
	jr	z, .LBB14_16
; %bb.15:
	push	iy
	push	hl
	ld	(ix - 4), iy
	call	_SetOwned
	pop	hl
	pop	hl
	ld	hl, (ix - 4)
	ld	d, l
	.local	.LBB14_16
.LBB14_16:
	ld	a, d
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end14
.Lfunc_end14:
	.size	_Mutate, .Lfunc_end14-_Mutate
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
	.local	.LBB15_1
.LBB15_1:                               ; =>This Inner Loop Header: Depth=1
	ld	de, 7
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	jp	z, .LBB15_8
; %bb.2:                                ;   in Loop: Header=BB15_1 Depth=1
	ld	hl, 1
	call	__ishl
	ld	e, (ix - 13)
	ld	a, l
	and	a, e
	ld	e, a
	or	a, a
	jp	z, .LBB15_7
; %bb.3:                                ;   in Loop: Header=BB15_1 Depth=1
	ld	iy, (ix + 6)
	ld	d, (iy + 29)
	ld	a, l
	and	a, d
	ld	e, a
	or	a, a
	jp	nz, .LBB15_7
; %bb.4:                                ;   in Loop: Header=BB15_1 Depth=1
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
	jr	nc, .LBB15_6
; %bb.5:                                ;   in Loop: Header=BB15_1 Depth=1
	ex	de, hl
	ld	e, iyl
	ld	d, iyh
	ex	de, hl
	.local	.LBB15_6
.LBB15_6:                               ;   in Loop: Header=BB15_1 Depth=1
	ld	iy, (ix + 6)
	ld	(iy + 20), l
	ld	(iy + 21), h
	.local	.LBB15_7
.LBB15_7:                               ;   in Loop: Header=BB15_1 Depth=1
	inc	bc
	jp	.LBB15_1
	.local	.LBB15_8
.LBB15_8:
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
	.local	.LBB15_9
.LBB15_9:                               ; =>This Inner Loop Header: Depth=1
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	jp	z, .LBB15_17
; %bb.10:                               ;   in Loop: Header=BB15_9 Depth=1
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
	jp	nz, .LBB15_16
; %bb.11:                               ;   in Loop: Header=BB15_9 Depth=1
	ld	e, (ix - 7)
	ld	d, (ix - 6)
	sbc.sis	hl, hl
	adc.sis	hl, de
	jp	z, .LBB15_16
; %bb.12:                               ;   in Loop: Header=BB15_9 Depth=1
	xor	a, a
	ld	(ix - 5), a
	ld	bc, (ix - 7)
	ld	b, d
	ld	c, e
	sbc	hl, hl
	ld	a, l
	ld	hl, _affected_thresholds
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
	jp	c, .LBB15_16
; %bb.13:                               ;   in Loop: Header=BB15_9 Depth=1
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
	jr	nc, .LBB15_15
; %bb.14:                               ;   in Loop: Header=BB15_9 Depth=1
	ex	de, hl
	ld	e, iyl
	ld	d, iyh
	ex	de, hl
	.local	.LBB15_15
.LBB15_15:                              ;   in Loop: Header=BB15_9 Depth=1
	ld	iy, (ix + 6)
	ld	(iy + 20), l
	ld	(iy + 21), h
	.local	.LBB15_16
.LBB15_16:                              ;   in Loop: Header=BB15_9 Depth=1
	ld	de, 9
	ld	bc, (ix - 16)
	inc	bc
	jp	.LBB15_9
	.local	.LBB15_17
.LBB15_17:
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
	.local	.LBB15_18
.LBB15_18:                              ; =>This Inner Loop Header: Depth=1
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	jp	z, .LBB15_28
; %bb.19:                               ;   in Loop: Header=BB15_18 Depth=1
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
	jp	nz, .LBB15_26
; %bb.20:                               ;   in Loop: Header=BB15_18 Depth=1
	ld	e, (ix - 7)
	ld	d, (ix - 6)
	sbc.sis	hl, hl
	adc.sis	hl, de
	jp	z, .LBB15_25
; %bb.21:                               ;   in Loop: Header=BB15_18 Depth=1
	xor	a, a
	ld	(ix - 2), a
	ld	bc, (ix - 4)
	ld	b, d
	ld	c, e
	ld	hl, _death_thresholds
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
	jp	c, .LBB15_25
; %bb.22:                               ;   in Loop: Header=BB15_18 Depth=1
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
	jr	nc, .LBB15_24
; %bb.23:                               ;   in Loop: Header=BB15_18 Depth=1
	ex	de, hl
	ld	e, iyl
	ld	d, iyh
	ex	de, hl
	.local	.LBB15_24
.LBB15_24:                              ;   in Loop: Header=BB15_18 Depth=1
	ld	iy, (ix + 6)
	ld	(iy + 20), l
	ld	(iy + 21), h
	.local	.LBB15_25
.LBB15_25:                              ;   in Loop: Header=BB15_18 Depth=1
	ld	bc, (ix - 10)
	ld	de, 6
	jr	.LBB15_27
	.local	.LBB15_26
.LBB15_26:                              ;   in Loop: Header=BB15_18 Depth=1
	ld	bc, (ix - 10)
	.local	.LBB15_27
.LBB15_27:                              ;   in Loop: Header=BB15_18 Depth=1
	inc	bc
	jp	.LBB15_18
	.local	.LBB15_28
.LBB15_28:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end15
.Lfunc_end15:
	.size	_AwardDNA, .Lfunc_end15-_AwardDNA
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
	jp	z, .LBB16_11
; %bb.1:
	ld	a, (iy + 34)
	or	a, a
	jp	nz, .LBB16_11
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
	jp	z, .LBB16_11
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
	jr	nz, .LBB16_5
; %bb.4:
	ld	a, 1
	jp	.LBB16_10
	.local	.LBB16_5
.LBB16_5:
	ld	hl, (ix + 10)
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	jr	z, .LBB16_8
; %bb.6:
	sbc.sis	hl, hl
	adc.sis	hl, de
	jr	nz, .LBB16_8
; %bb.7:
	ld	a, 2
	jp	.LBB16_10
	.local	.LBB16_8
.LBB16_8:
	ld	hl, (iy + 22)
	ld.sis	de, 10000
                                        ; kill: def $hl killed $hl killed $uhl
	or	a, a
	sbc.sis	hl, de
	jr	c, .LBB16_11
; %bb.9:
	ld	a, 3
	.local	.LBB16_10
.LBB16_10:
	ld	(iy + 34), a
	.local	.LBB16_11
.LBB16_11:
	pop	hl
	pop	ix
	ret
	.local	.Lfunc_end16
.Lfunc_end16:
	.size	_EvaluateOutcome, .Lfunc_end16-_EvaluateOutcome
                                        ; -- End function
	.section	.text._AdvanceDisease,"ax",@progbits
	.globl	_AdvanceDisease                 ; -- Begin function AdvanceDisease
	.type	_AdvanceDisease,@function
_AdvanceDisease:                        ; @AdvanceDisease
; %bb.0:
	ld	hl, -46
	call	__frameset
	ld	iy, (ix + 6)
	ld	d, 0
	ld	a, (iy + 33)
	or	a, a
	jp	z, .LBB17_11
; %bb.1:
	ld	a, (iy + 34)
	or	a, a
	jp	nz, .LBB17_11
; %bb.2:
	ld	bc, -2
	ld	a, b
	ld	hl, (iy + 8)
	ld	e, (iy + 11)
	call	__lcmpu
	jr	nc, .LBB17_4
; %bb.3:
	ld	bc, 1
	ld	a, d
	call	__ladd
	ld	bc, (ix + 6)
	push	bc
	pop	iy
	ld	(iy + 8), hl
	ld	(iy + 11), e
	.local	.LBB17_4
.LBB17_4:
	ld	bc, 7
	ld.sis	de, 0
	ld	a, 1
	ld	(ix - 17), a
	ld	hl, _environments+6
	ld	(ix - 23), hl
	lea	hl, ix - 7
	ld	(ix - 32), hl
	ld	iy, (ix + 9)
	lea	hl, iy + 4
	ld	(ix - 26), hl
	ld	iy, 0
	lea	hl, iy + 0
	ld	(ix - 20), e
	ld	(ix - 19), d
	ld	(ix - 16), e
	ld	(ix - 15), d
	dec	a
	ld	(ix - 37), a                    ; 1-byte Folded Spill
	ld	(ix - 35), iy
	ld	(ix - 36), a                    ; 1-byte Folded Spill
	.local	.LBB17_5
.LBB17_5:                               ; =>This Inner Loop Header: Depth=1
	ld	iy, (ix + 6)
	ld	(ix - 29), hl
	or	a, a
	sbc	hl, bc
	jp	z, .LBB17_12
; %bb.6:                                ;   in Loop: Header=BB17_5 Depth=1
	ld	iy, (ix - 26)
	ld	hl, (iy - 4)
	add.sis	hl, de
	ld	(ix - 40), hl
	ld	de, (iy - 2)
	ld	l, e
	ld	h, d
	ld	c, (ix - 16)
	ld	b, (ix - 15)
	add.sis	hl, bc
	ld	(ix - 16), l
	ld	(ix - 15), h
	ld	hl, (iy)
	ld	c, (ix - 20)
	ld	b, (ix - 19)
	add.sis	hl, bc
	ld	(ix - 20), hl
	sbc.sis	hl, hl
	adc.sis	hl, de
	jp	z, .LBB17_10
; %bb.7:                                ;   in Loop: Header=BB17_5 Depth=1
	ld	hl, 1
	ld	bc, (ix - 29)
                                        ; kill: def $c killed $c killed $ubc
	call	__ishl
	lea	bc, iy + 0
	ld	iy, (ix + 6)
	ld	a, (iy + 30)
                                        ; kill: def $l killed $l killed $uhl
	or	a, l
	ld	l, a
	ld	(iy + 30), l
	ld	hl, (ix - 23)
	ld	a, (hl)
	push	bc
	pop	iy
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	(ix - 43), hl
	ld	bc, (iy - 4)
	ld	hl, (iy - 2)
	ld	iy, (iy)
	add.sis	hl, bc
	lea	bc, iy + 0
	add.sis	hl, bc
	ld	(ix - 46), hl
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	ld	hl, 0
	jr	z, .LBB17_9
; %bb.8:                                ;   in Loop: Header=BB17_5 Depth=1
	ld	iy, 0
	ld	iyl, e
	ld	iyh, d
	lea	hl, iy + 0
	ld	bc, 100
	call	__imulu
	ld	de, (ix - 46)
	ld	iyl, e
	ld	iyh, d
	lea	bc, iy + 0
	call	__idivu
	.local	.LBB17_9
.LBB17_9:                               ;   in Loop: Header=BB17_5 Depth=1
	inc	(ix - 37)
	ld	bc, 255
	call	__iand
	ld	bc, (ix - 43)
	call	__imulu
	push	hl
	pop	bc
	or	a, a
	sbc	hl, hl
	ld	a, l
	ld	hl, (ix - 35)
	ld	e, (ix - 36)                    ; 1-byte Folded Reload
	call	__ladd
	ld	(ix - 35), hl
	ld	(ix - 36), e                    ; 1-byte Folded Spill
	ld	iy, (ix - 26)
	.local	.LBB17_10
.LBB17_10:                              ;   in Loop: Header=BB17_5 Depth=1
	ld	hl, (ix - 29)
	inc	hl
	lea	iy, iy + 6
	ld	(ix - 26), iy
	ld	iy, (ix - 23)
	lea	iy, iy + 7
	ld	(ix - 23), iy
	ld	de, (ix - 20)
                                        ; kill: def $de killed $de killed $ude
	ld	(ix - 20), e
	ld	(ix - 19), d
	ld	de, (ix - 40)
                                        ; kill: def $de killed $de killed $ude
	ld	bc, 7
	jp	.LBB17_5
	.local	.LBB17_11
.LBB17_11:
	ld	a, d
	jp	.LBB17_32
	.local	.LBB17_12
.LBB17_12:
	ld	(ix - 7), e
	ld	(ix - 6), d
	ld	l, (ix - 16)
	ld	h, (ix - 15)
	ld	(ix - 5), l
	ld	(ix - 4), h
	ld	c, (ix - 20)
	ld	b, (ix - 19)
	ld	(ix - 3), c
	ld	(ix - 2), b
	add.sis	hl, bc
	add.sis	hl, de
	ld	(ix - 29), l
	ld	(ix - 28), h
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	ld	a, 0
	ld	(ix - 23), a                    ; 1-byte Folded Spill
	ld	l, a
	ld	(ix - 26), hl
	jr	z, .LBB17_14
; %bb.13:
	ld	iy, 0
	lea	hl, iy + 0
	ld	e, (ix - 16)
	ld	d, (ix - 15)
	ld	l, e
	ld	h, d
	ld	de, 100
	ld	iyl, c
	ld	iyh, b
	push	de
	pop	bc
	call	__imulu
	ld	de, 0
	ld	c, (ix - 29)
	ld	b, (ix - 28)
	ld	e, c
	ld	d, b
	push	de
	pop	bc
	call	__idivu
	ld	(ix - 23), hl
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
	ld	(ix - 26), hl
	ld	hl, (ix - 23)
	ld	(ix - 23), l                    ; 1-byte Folded Spill
	ld	iy, (ix + 6)
	.local	.LBB17_14
.LBB17_14:
	push	hl
	push	hl
	dec	sp
	ex	de, hl
	ld	hl, 0
	add	hl, sp
	ex	de, hl
	inc	de
	ld	bc, 6
	ld	hl, (ix - 32)
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
	jp	nz, .LBB17_19
; %bb.15:
	ld	l, 3
	ld	bc, (ix - 35)
	ld	a, (ix - 36)                    ; 1-byte Folded Reload
	call	__lshru
	ld	l, 0
	ld	(ix - 13), l
	ld	iy, (ix - 15)
	ex	de, hl
	ld	iyh, e
	ex	de, hl
	push	af
	ld	a, (ix - 23)                    ; 1-byte Folded Reload
	ld	iyl, a
	pop	af
	or	a, a
	sbc	hl, hl
	ld	d, l
	ld	(ix - 36), d
	push	bc
	pop	hl
	ld	e, a
	lea	bc, iy + 0
	ld	a, d
	call	__ladd
	ld	(ix - 29), hl
	ld	(ix - 40), e                    ; 1-byte Folded Spill
	ld	iy, (ix + 12)
	ld	bc, (iy + 16)
	ld	iy, 0
	lea	hl, iy + 0
	ld	l, c
	ld	h, b
	add	hl, hl
	ld	(ix - 20), hl
	lea	hl, iy + 0
	ld	bc, (ix - 26)
	ld	l, c
	add	hl, hl
	add	hl, hl
	add	hl, hl
	push	hl
	pop	bc
	ld	iy, (ix + 6)
	lea	de, iy + 16
	ld	hl, (iy + 16)
	ld	(ix - 35), hl
	push	de
	pop	iy
	lea	hl, iy + 3
	ld	a, (hl)
	ld	iyl, a
	ld	hl, (ix - 29)
	ld	e, (ix - 40)                    ; 1-byte Folded Reload
	ld	d, (ix - 36)                    ; 1-byte Folded Reload
	ld	a, d
	call	__ladd
	ld	bc, (ix - 35)
	ld	a, iyl
	call	__ladd
	ld	bc, (ix - 20)
	ld	iy, (ix + 6)
	ld	a, d
	ld	d, 0
	call	__ladd
	push	hl
	pop	bc
	ld	a, e
	ld	(iy + 16), bc
	ld	(iy + 19), a
	ld	hl, 11999
	ld	e, d
	call	__lcmpu
	jr	c, .LBB17_18
; %bb.16:
	ld	a, (ix - 23)                    ; 1-byte Folded Reload
	cp	a, 65
	jr	nc, .LBB17_18
; %bb.17:
	ld	hl, (ix - 26)
	ld	a, l
	cp	a, 5
	jp	c, .LBB17_42
	.local	.LBB17_18
.LBB17_18:
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
	jr	.LBB17_21
	.local	.LBB17_19
.LBB17_19:
	ld	a, e
	cp	a, 1
	ld	d, 0
	ld	l, d
	jr	nz, .LBB17_23
; %bb.20:
	ld	hl, (iy + 8)
	ld	e, (iy + 11)
	ld	bc, (iy + 12)
	ld	a, (iy + 15)
	ld	(ix - 17), d                    ; 1-byte Folded Spill
	.local	.LBB17_21
.LBB17_21:
	call	__lsub
	push	hl
	pop	bc
	ld	a, e
	ld	hl, 7
	ld	e, d
	call	__lcmpu
	jr	nc, .LBB17_24
; %bb.22:
	ld	(iy + 35), 2
	ld	l, (ix - 17)                    ; 1-byte Folded Reload
	ld	a, 2
	ld	e, a
	ld	a, l
	add	a, e
	ld	l, a
	.local	.LBB17_23
.LBB17_23:
	ld	(ix - 17), l
	ld	l, (ix - 16)
	ld	h, (ix - 15)
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	jp	nz, .LBB17_33
	.local	.LBB17_24
.LBB17_24:
	ld	bc, 0
	ld	hl, (iy + 22)
	ld	de, 0
	ld	e, l
	ld	d, h
	ld	(ix - 20), de
	.local	.LBB17_25
.LBB17_25:
	ld	de, 4
	.local	.LBB17_26
.LBB17_26:                              ; =>This Inner Loop Header: Depth=1
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	jp	z, .LBB17_31
; %bb.27:                               ;   in Loop: Header=BB17_26 Depth=1
	ld	hl, _cure_thresholds
	add	hl, bc
	ld	a, (hl)
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	(ix - 16), bc
	ld	bc, 100
	call	__imulu
	ex	de, hl
	ld	hl, (ix - 20)
	or	a, a
	sbc	hl, de
	jp	c, .LBB17_30
; %bb.28:                               ;   in Loop: Header=BB17_26 Depth=1
	ld	iy, (ix + 6)
	ld	d, (iy + 31)
	ld	hl, 1
	ld	bc, (ix - 16)
                                        ; kill: def $c killed $c killed $ubc
	call	__ishl
	ld	a, l
	and	a, d
	ld	e, a
	or	a, a
	jp	nz, .LBB17_30
; %bb.29:                               ;   in Loop: Header=BB17_26 Depth=1
                                        ; kill: def $l killed $l killed $uhl
	ld	a, d
	or	a, l
	ld	l, a
	ld	(iy + 31), l
	ld	hl, 8
	ld	bc, (ix - 16)
                                        ; kill: def $c killed $c killed $ubc
	call	__ishl
                                        ; kill: def $l killed $l killed $uhl
	ld	e, (ix - 17)
	ld	a, e
	or	a, l
	ld	e, a
	ld	(ix - 17), e
	.local	.LBB17_30
.LBB17_30:                              ;   in Loop: Header=BB17_26 Depth=1
	ld	de, 4
	ld	bc, (ix - 16)
	inc	bc
	ld	iy, (ix + 6)
	jp	.LBB17_26
	.local	.LBB17_31
.LBB17_31:
	push	hl
	push	hl
	dec	sp
	ex	de, hl
	ld	hl, 0
	add	hl, sp
	ex	de, hl
	inc	de
	ld	bc, 6
	ld	hl, (ix - 32)
	ldir
	push	iy
	call	_EvaluateOutcome
	pop	hl
	pop	hl
	pop	hl
	inc	sp
	ld	a, (ix - 17)                    ; 1-byte Folded Reload
	.local	.LBB17_32
.LBB17_32:
	ld	sp, ix
	pop	ix
	ret
	.local	.LBB17_33
.LBB17_33:
	ld	(ix - 29), e                    ; 1-byte Folded Spill
	ld	a, (ix - 23)                    ; 1-byte Folded Reload
	srl	a
	ld	l, 20
	add	a, l
	ld	l, a
	ld	de, 0
	push	de
	pop	bc
	ld	e, l
	ld	(ix - 16), de
	push	bc
	pop	de
	ld	hl, (ix - 26)
	ld	e, l
	ld	iy, (ix + 12)
	ld	bc, (iy + 16)
	ld	iy, 0
	lea	hl, iy + 0
	ld	(ix - 35), bc
	ld	l, c
	ld	h, b
	add	hl, hl
	ld	(ix - 20), hl
	push	af
	ld	a, (ix - 37)                    ; 1-byte Folded Reload
	ld	iyl, a
	pop	af
	lea	hl, iy + 0
	ld	bc, 3
	call	__imulu
	add	hl, de
	ld	de, (ix - 16)
	add	hl, de
	ld	de, (ix - 20)
	add	hl, de
	ld	(ix - 20), hl
	ld	de, 0
	ld	a, e
	ld	(ix - 16), a
	ld	iy, (ix + 12)
	ld	hl, (iy + 20)
	ld	e, l
	ld	d, h
	ld	hl, 100
	or	a, a
	sbc	hl, de
	push	hl
	pop	bc
	ld	(ix - 12), bc
	ld	a, (ix - 10)
	rlc	a
	sbc	a, a
	ld	hl, (ix - 20)
	ld	e, (ix - 16)                    ; 1-byte Folded Reload
	call	__lmulu
	ld	iy, (ix + 6)
	ld	iy, (iy + 24)
	ld	d, 0
	ld	(ix - 9), d
	ld	bc, (ix - 11)
	ld	b, iyh
	ld	c, iyl
	ld	a, (ix - 16)                    ; 1-byte Folded Reload
	call	__ladd
	ld	iy, (ix + 6)
	ld	bc, (iy + 22)
	ld	(ix - 8), d
	ld	iy, (ix - 10)
	ld	iyh, b
	ld	iyl, c
	ld	(ix - 20), hl
	ld	bc, 200
	ld	a, d
	call	__ldivu
	ld	(ix - 23), hl
	lea	bc, iy + 0
	ld	a, (ix - 16)                    ; 1-byte Folded Reload
	call	__ladd
	ld	bc, 10000
	ld	a, d
	call	__lcmpu
	jr	c, .LBB17_35
; %bb.34:
	push	bc
	pop	hl
	.local	.LBB17_35
.LBB17_35:
	ex	de, hl
	ld	iy, (ix + 6)
	ld	(iy + 22), e
	ld	(iy + 23), d
	ld.sis	bc, -200
	ld	hl, (ix - 23)
                                        ; kill: def $hl killed $hl killed $uhl
	call	__smulu
	ex	de, hl
	ld	iyl, e
	ld	iyh, d
	ex	de, hl
	ld	bc, (ix - 20)
	add.sis	iy, bc
	ld.sis	bc, 10000
	ld	(ix - 20), de
	ld	l, e
	ld	h, d
	or	a, a
	sbc.sis	hl, bc
	ld.sis	hl, 0
	jr	z, .LBB17_37
; %bb.36:
	ex	de, hl
	ld	e, iyl
	ld	d, iyh
	ex	de, hl
	.local	.LBB17_37
.LBB17_37:
	ld	iy, (ix + 6)
	ld	(iy + 24), l
	ld	(iy + 25), h
	ld	a, (ix - 29)                    ; 1-byte Folded Reload
	cp	a, 2
	ld	bc, 0
	jp	nz, .LBB17_25
; %bb.38:
	ld.sis	de, 2500
	ld	hl, (ix - 20)
                                        ; kill: def $hl killed $hl killed $uhl
	or	a, a
	sbc.sis	hl, de
	jp	nc, .LBB17_41
; %bb.39:
	ld.sis	de, 30
	ld	hl, (ix - 35)
                                        ; kill: def $hl killed $hl killed $uhl
	or	a, a
	sbc.sis	hl, de
	jr	nc, .LBB17_41
; %bb.40:
	ld	hl, (ix - 26)
	ld	a, l
	cp	a, 10
	jp	c, .LBB17_25
	.local	.LBB17_41
.LBB17_41:
	ld	(iy + 35), 3
	ld	l, (ix - 17)
	ld	e, 4
	ld	a, l
	add	a, e
	ld	l, a
	ld	(ix - 17), l
	jp	.LBB17_25
	.local	.LBB17_42
.LBB17_42:
	ld	(ix - 17), d                    ; 1-byte Folded Spill
	jp	.LBB17_24
	.local	.Lfunc_end17
.Lfunc_end17:
	.size	_AdvanceDisease, .Lfunc_end17-_AdvanceDisease
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
	jp	nc, .LBB18_41
; %bb.1:
	ld	h, (iy + 33)
	ld	a, h
	cp	a, 2
	jp	nc, .LBB18_41
; %bb.2:
	ld	b, (iy + 34)
	ld	a, b
	cp	a, 4
	jp	nc, .LBB18_41
; %bb.3:
	ld	e, (iy + 35)
	ld	a, e
	cp	a, 4
	jp	nc, .LBB18_41
; %bb.4:
	ld	c, (iy + 36)
	ld	a, c
	cp	a, 4
	jp	nc, .LBB18_41
; %bb.5:
	ld	a, l
	cp	a, 2
	jr	z, .LBB18_7
; %bb.6:
	ld	a, c
	or	a, a
	jp	nz, .LBB18_41
	.local	.LBB18_7
.LBB18_7:
	ld	(ix - 7), b                     ; 1-byte Folded Spill
	ld	(ix - 6), h                     ; 1-byte Folded Spill
	ld	(ix - 8), c                     ; 1-byte Folded Spill
	ld	hl, (iy + 20)
	ld.sis	bc, 180
	ld	(ix - 3), hl
                                        ; kill: def $hl killed $hl killed $uhl
	or	a, a
	sbc.sis	hl, bc
	jp	nc, .LBB18_41
; %bb.8:
	ld	hl, (iy + 22)
	ld.sis	bc, 10001
	ld	(ix - 11), hl
                                        ; kill: def $hl killed $hl killed $uhl
	or	a, a
	sbc.sis	hl, bc
	jp	nc, .LBB18_41
; %bb.9:
	ld	hl, (iy + 24)
	ld.sis	bc, 200
	ld	(ix - 14), hl
                                        ; kill: def $hl killed $hl killed $uhl
	or	a, a
	sbc.sis	hl, bc
	jp	nc, .LBB18_41
; %bb.10:
	ld	(ix - 15), e                    ; 1-byte Folded Spill
	ld	e, 0
	ld	hl, 127
	ld	bc, (iy + 4)
	ld	a, (iy + 7)
	ld	(ix - 18), bc
	ld	(ix - 19), a                    ; 1-byte Folded Spill
	call	__lcmpu
	jp	c, .LBB18_41
; %bb.11:
	ld	hl, (iy + 26)
	ld.sis	bc, 512
	ld	(ix - 22), hl
                                        ; kill: def $hl killed $hl killed $uhl
	or	a, a
	sbc.sis	hl, bc
	jp	nc, .LBB18_41
; %bb.12:
	ld	l, (iy + 28)
	ld	a, l
	cp	a, 64
	jp	nc, .LBB18_41
; %bb.13:
	ld	e, (iy + 29)
	ld	a, e
	cp	a, 0
	call	pe, __setflag
	jp	m, .LBB18_41
; %bb.14:
	ld	a, (iy + 30)
	cp	a, 0
	call	pe, __setflag
	jp	m, .LBB18_41
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
	jp	nz, .LBB18_41
; %bb.16:
	ld	a, (iy + 31)
	ld	(ix - 28), a                    ; 1-byte Folded Spill
	cp	a, 16
	jp	nc, .LBB18_40
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
	jp	c, .LBB18_40
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
	jp	z, .LBB18_40
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
	jp	c, .LBB18_40
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
	jp	nz, .LBB18_40
; %bb.21:
	ld	e, (ix - 23)                    ; 1-byte Folded Reload
	ld	l, e
	inc	l
	ld	a, l
	and	a, e
	ld	l, a
	or	a, a
	jp	nz, .LBB18_40
; %bb.22:
	ld	e, (ix - 28)                    ; 1-byte Folded Reload
	ld	l, e
	inc	l
	ld	a, l
	and	a, e
	ld	l, a
	or	a, a
	jp	nz, .LBB18_40
; %bb.23:                               ; %.preheader30.preheader
	ld	bc, 0
	ld.sis	hl, 12
	ld	(ix - 42), l
	ld	(ix - 41), h
	ld	hl, _traits+6
	ld	(ix - 45), hl
	ld	iy, 7
	.local	.LBB18_24
.LBB18_24:                              ; %.preheader30
                                        ; =>This Inner Loop Header: Depth=1
	push	bc
	pop	hl
	lea	de, iy + 0
	or	a, a
	sbc	hl, de
	jr	z, .LBB18_28
; %bb.25:                               ;   in Loop: Header=BB18_24 Depth=1
	ld	hl, 1
	call	__ishl
	ld	e, (ix - 26)
	ld	a, l
	and	a, e
	ld	l, a
	or	a, a
	jr	z, .LBB18_27
; %bb.26:                               ;   in Loop: Header=BB18_24 Depth=1
	ld	l, (ix - 42)
	ld	h, (ix - 41)
	ld.sis	de, 5
	add.sis	hl, de
	ld	(ix - 42), l
	ld	(ix - 41), h
	.local	.LBB18_27
.LBB18_27:                              ;   in Loop: Header=BB18_24 Depth=1
	inc	bc
	jr	.LBB18_24
	.local	.LBB18_28
.LBB18_28:
	ld	de, 0
	ld	hl, (ix - 22)
	ld	e, l
	ld	d, h
	ld	iy, 0
	.local	.LBB18_29
.LBB18_29:                              ; =>This Inner Loop Header: Depth=1
	lea	hl, iy + 0
	ld	bc, 9
	or	a, a
	sbc	hl, bc
	jr	z, .LBB18_33
; %bb.30:                               ;   in Loop: Header=BB18_29 Depth=1
	ld	hl, 1
	ld	c, iyl
	call	__ishl
	push	de
	pop	bc
	call	__iand
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	z, .LBB18_32
; %bb.31:                               ;   in Loop: Header=BB18_29 Depth=1
	ld	l, (ix - 42)
	ld	h, (ix - 41)
	ld.sis	bc, 8
	add.sis	hl, bc
	ld	(ix - 42), l
	ld	(ix - 41), h
	.local	.LBB18_32
.LBB18_32:                              ;   in Loop: Header=BB18_29 Depth=1
	inc	iy
	jr	.LBB18_29
	.local	.LBB18_33
.LBB18_33:
	ld	iy, 6
	ld	bc, 0
	.local	.LBB18_34
.LBB18_34:                              ; =>This Inner Loop Header: Depth=1
	push	bc
	pop	hl
	lea	de, iy + 0
	or	a, a
	sbc	hl, de
	jr	z, .LBB18_38
; %bb.35:                               ;   in Loop: Header=BB18_34 Depth=1
	ld	hl, 1
	call	__ishl
	ld	e, (ix - 23)
	ld	a, l
	and	a, e
	ld	l, a
	or	a, a
	jr	z, .LBB18_37
; %bb.36:                               ;   in Loop: Header=BB18_34 Depth=1
	ld.sis	de, 10
	ld	l, (ix - 42)
	ld	h, (ix - 41)
	add.sis	hl, de
	ld	(ix - 42), l
	ld	(ix - 41), h
	.local	.LBB18_37
.LBB18_37:                              ;   in Loop: Header=BB18_34 Depth=1
	inc	bc
	jr	.LBB18_34
	.local	.LBB18_38
.LBB18_38:
	ld	l, (ix - 42)
	ld	h, (ix - 41)
	ld	de, (ix - 3)
	or	a, a
	sbc.sis	hl, de
	jr	c, .LBB18_40
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
	jr	nz, .LBB18_42
	.local	.LBB18_40
.LBB18_40:
	ld	d, 0
	.local	.LBB18_41
.LBB18_41:                              ; %.loopexit25
	ld	a, d
	ld	sp, ix
	pop	ix
	ret
	.local	.LBB18_42
.LBB18_42:                              ; %.preheader28.preheader
	ld	c, 0
	.local	.LBB18_43
.LBB18_43:                              ; %.preheader28
                                        ; =>This Inner Loop Header: Depth=1
	ld	de, 0
	ld	e, c
	ld	hl, (ix - 26)
	add	hl, de
	ld	l, (hl)
	ld	a, l
	or	a, a
	jr	z, .LBB18_46
; %bb.44:                               ;   in Loop: Header=BB18_43 Depth=1
	ld	e, -127
	ld	a, l
	add	a, e
	ld	l, a
	cp	a, -95
	jr	c, .LBB18_40
; %bb.45:                               ;   in Loop: Header=BB18_43 Depth=1
	inc	c
	jr	.LBB18_43
	.local	.LBB18_46
.LBB18_46:
	or	a, a
	sbc	hl, hl
	ld	l, c
	ld	bc, 21
	ld	(ix - 26), hl
	sbc	hl, bc
	jr	nc, .LBB18_48
; %bb.47:
	ld	hl, 20
	ld	(ix - 26), hl
	.local	.LBB18_48
.LBB18_48:                              ; =>This Inner Loop Header: Depth=1
	ld	hl, (ix - 26)
	or	a, a
	sbc	hl, de
	jr	z, .LBB18_50
; %bb.49:                               ;   in Loop: Header=BB18_48 Depth=1
	ld	iy, (ix + 6)
	add	iy, de
	inc	de
	ld	a, (iy + 37)
	or	a, a
	jr	nz, .LBB18_40
	jr	.LBB18_48
	.local	.LBB18_50
.LBB18_50:
	ld	a, (ix - 6)                     ; 1-byte Folded Reload
	or	a, a
	jp	nz, .LBB18_61
; %bb.51:
	ld	a, (ix - 7)                     ; 1-byte Folded Reload
	or	a, a
	jr	nz, .LBB18_40
; %bb.52:
	ld	hl, (ix - 35)
	ld	e, (ix - 36)                    ; 1-byte Folded Reload
	call	__lcmpzero
	jr	nz, .LBB18_40
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
	jp	nz, .LBB18_40
; %bb.54:
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	jp	nz, .LBB18_40
; %bb.55:
	ld.sis	bc, 12
	ld	hl, (ix - 3)
                                        ; kill: def $hl killed $hl killed $uhl
	or	a, a
	sbc.sis	hl, bc
	jp	nz, .LBB18_40
; %bb.56:
	ld	hl, (ix - 32)
	ld	e, (ix - 29)                    ; 1-byte Folded Reload
	call	__lcmpzero
	jp	nz, .LBB18_40
; %bb.57:
	ld	a, (ix - 23)                    ; 1-byte Folded Reload
	or	a, a
	jp	nz, .LBB18_40
; %bb.58:
	ld	hl, (ix - 22)
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	jp	nz, .LBB18_40
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
	jp	nz, .LBB18_40
; %bb.60:
	lea	hl, iy + 0
	ld	e, d
	jp	.LBB18_65
	.local	.LBB18_61
.LBB18_61:
	ld	a, (ix - 15)                    ; 1-byte Folded Reload
	or	a, a
	jp	nz, .LBB18_67
; %bb.62:
	ld	hl, (ix - 14)
                                        ; kill: def $hl killed $hl killed $uhl
	ld	bc, (ix - 11)
                                        ; kill: def $bc killed $bc killed $ubc
	call	__sor
	ld	a, (ix - 28)                    ; 1-byte Folded Reload
	or	a, a
	jp	nz, .LBB18_40
; %bb.63:
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	jp	nz, .LBB18_40
; %bb.64:
	ld	hl, (ix - 40)
	ld	e, (ix - 37)                    ; 1-byte Folded Reload
	.local	.LBB18_65
.LBB18_65:
	call	__lcmpzero
	jp	nz, .LBB18_40
; %bb.66:
	ld	hl, (ix - 18)
	ld	a, l
	bit	5, a
	jp	nz, .LBB18_40
	jr	.LBB18_69
	.local	.LBB18_67
.LBB18_67:
	ld	hl, (ix - 32)
	ld	e, (ix - 29)                    ; 1-byte Folded Reload
	ld	bc, 12000
	xor	a, a
	call	__lcmpu
	jp	nz, .LBB18_40
; %bb.68:
	ld	hl, (ix - 40)
	ld	e, (ix - 37)                    ; 1-byte Folded Reload
	call	__lcmpzero
	jp	z, .LBB18_40
	.local	.LBB18_69
.LBB18_69:                              ; %.preheader64
	or	a, a
	sbc	hl, hl
	ld	(ix - 3), hl
	.local	.LBB18_70
.LBB18_70:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB18_73 Depth 2
	ld	hl, (ix - 3)
	ld	de, 39
	or	a, a
	sbc	hl, de
	jr	z, .LBB18_78
; %bb.71:                               ;   in Loop: Header=BB18_70 Depth=1
	ld	hl, (ix - 3)
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_Owns
	pop	hl
	pop	hl
	bit	0, a
	jr	z, .LBB18_77
; %bb.72:                               ; %.preheader.preheader
                                        ;   in Loop: Header=BB18_70 Depth=1
	or	a, a
	sbc	hl, hl
	.local	.LBB18_73
.LBB18_73:                              ; %.preheader
                                        ;   Parent Loop BB18_70 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ld	(ix - 6), hl
	ld	hl, (ix - 6)
	ld	de, 2
	or	a, a
	sbc	hl, de
	jr	z, .LBB18_77
; %bb.74:                               ;   in Loop: Header=BB18_73 Depth=2
	ld	iy, (ix - 45)
	ld	de, (ix - 6)
	add	iy, de
	ld	a, (iy)
	cp	a, -1
	jr	z, .LBB18_76
; %bb.75:                               ;   in Loop: Header=BB18_73 Depth=2
	ld	l, a
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_Owns
	pop	hl
	pop	hl
	bit	0, a
	jp	z, .LBB18_40
	.local	.LBB18_76
.LBB18_76:                              ;   in Loop: Header=BB18_73 Depth=2
	ld	hl, (ix - 6)
	inc	hl
	jr	.LBB18_73
	.local	.LBB18_77
.LBB18_77:                              ; %.loopexit
                                        ;   in Loop: Header=BB18_70 Depth=1
	ld	hl, (ix - 3)
	inc	hl
	ld	(ix - 3), hl
	ld	iy, (ix - 45)
	lea	iy, iy + 22
	ld	(ix - 45), iy
	jr	.LBB18_70
	.local	.LBB18_78
.LBB18_78:
	ld	d, 1
	jp	.LBB18_41
	.local	.Lfunc_end18
.Lfunc_end18:
	.size	_ValidateDisease, .Lfunc_end18-_ValidateDisease
                                        ; -- End function
	.section	.text._EvolutionMenu,"ax",@progbits
	.globl	_EvolutionMenu                  ; -- Begin function EvolutionMenu
	.type	_EvolutionMenu,@function
_EvolutionMenu:                         ; @EvolutionMenu
; %bb.0:
	ld	hl, -348
	call	__frameset
	ld	de, -242
	lea	iy, ix + 0
	add	iy, de
	lea	hl, ix - 88
	push	ix
	ld	de, -261
	add	ix, de
	ld	(ix + 0), hl
	pop	ix
	lea	hl, iy + 95
	push	ix
	ld	de, -282
	add	ix, de
	ld	(ix + 0), hl
	pop	ix
	lea	hl, iy + 67
	push	ix
	ld	de, -285
	add	ix, de
	ld	(ix + 0), hl
	pop	ix
	lea	bc, iy + 64
	lea	de, iy + 0
	push	ix
	lea	ix, ix - 128
	ld	(ix - 123), de
	pop	ix
	ld	hl, _first_node
	ld	a, (hl)
	push	bc
	pop	hl
	push	ix
	ld	de, -267
	add	ix, de
	ld	(ix + 0), hl
	pop	ix
	ld	(hl), a
	ld	a, (_first_node+1)
	ld	(iy + 65), a
	ld	a, (_first_node+2)
	ld	de, -276
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), iy
	ld	(iy + 66), a
	ld	e, 1
	xor	a, a
	ld	l, a
	ld	bc, -245
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), hl
	.local	.LBB19_1
.LBB19_1:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB19_21 Depth 2
                                        ;     Child Loop BB19_24 Depth 2
                                        ;       Child Loop BB19_27 Depth 3
                                        ;     Child Loop BB19_33 Depth 2
                                        ;     Child Loop BB19_49 Depth 2
	bit	0, e
	jr	z, .LBB19_3
; %bb.2:                                ;   in Loop: Header=BB19_1 Depth=1
	ld	de, -245
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, 3
	push	hl
	ld	hl, _categories
	push	hl
	ld	hl, _.str.4
	push	hl
	call	_ChooseMenu
	ld	iy, _categories
	ld	e, a
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	cp	a, -1
	jp	z, .LBB19_114
	jr	.LBB19_4
	.local	.LBB19_3
.LBB19_3:                               ;   in Loop: Header=BB19_1 Depth=1
	ld	de, _categories
	push	de
	pop	iy
	ld	bc, -245
	lea	hl, ix + 0
	add	hl, bc
	ld	de, (hl)
	.local	.LBB19_4
.LBB19_4:                               ;   in Loop: Header=BB19_1 Depth=1
	ld	bc, -245
	lea	hl, ix + 0
	add	hl, bc
	ld	(hl), de
	ld	bc, 0
	ld	c, e
	push	ix
	ld	de, -267
	add	ix, de
	ld	hl, (ix + 0)
	pop	ix
	add	hl, bc
	ld	a, (hl)
	ld	de, -255
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), a
	ld	de, -258
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
	ld	hl, _.str.1.5
	push	hl
	ld	hl, 64
	push	hl
	ld	de, -251
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
	ld	de, -251
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	bc, -245
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	ld	a, e
	or	a, a
	ld	l, b
	jr	z, .LBB19_6
; %bb.5:                                ;   in Loop: Header=BB19_1 Depth=1
	ld	l, 0
	.local	.LBB19_6
.LBB19_6:                               ;   in Loop: Header=BB19_1 Depth=1
	ld	a, e
	cp	a, 1
	ld	a, -1
	jr	z, .LBB19_8
; %bb.7:                                ;   in Loop: Header=BB19_1 Depth=1
	ld	a, 0
	.local	.LBB19_8
.LBB19_8:                               ;   in Loop: Header=BB19_1 Depth=1
	bit	0, a
	ld	de, 3
	jr	nz, .LBB19_10
; %bb.9:                                ;   in Loop: Header=BB19_1 Depth=1
	ld	de, 5
	.local	.LBB19_10
.LBB19_10:                              ;   in Loop: Header=BB19_1 Depth=1
	bit	0, l
	ld	bc, 7
	jr	nz, .LBB19_12
; %bb.11:                               ;   in Loop: Header=BB19_1 Depth=1
	push	de
	pop	bc
	.local	.LBB19_12
.LBB19_12:                              ;   in Loop: Header=BB19_1 Depth=1
	ld	de, -254
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), bc
	bit	0, a
	ld	de, 105
	push	de
	pop	iy
	jr	nz, .LBB19_14
; %bb.13:                               ;   in Loop: Header=BB19_1 Depth=1
	ld	de, 63
	push	de
	pop	iy
	.local	.LBB19_14
.LBB19_14:                              ;   in Loop: Header=BB19_1 Depth=1
	bit	0, a
	ld	bc, 55
	jr	nz, .LBB19_16
; %bb.15:                               ;   in Loop: Header=BB19_1 Depth=1
	ld	bc, 32
	.local	.LBB19_16
.LBB19_16:                              ;   in Loop: Header=BB19_1 Depth=1
	bit	0, l
	ld	de, 45
	push	ix
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 8
	ld	(ix + 0), de
	pop	ix
	jr	nz, .LBB19_18
; %bb.17:                               ;   in Loop: Header=BB19_1 Depth=1
	push	ix
	ld	de, -264
	add	ix, de
	ld	(ix + 0), iy
	pop	ix
	.local	.LBB19_18
.LBB19_18:                              ;   in Loop: Header=BB19_1 Depth=1
	bit	0, l
	ld	hl, 22
	ld	de, -248
	lea	iy, ix + 0
	push	af
	add	iy, de
	pop	af
	ld	(iy + 0), hl
	jr	nz, .LBB19_20
; %bb.19:                               ;   in Loop: Header=BB19_1 Depth=1
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), bc
	.local	.LBB19_20
.LBB19_20:                              ;   in Loop: Header=BB19_1 Depth=1
	ld	de, -258
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
	ld	bc, -254
	lea	hl, ix + 0
	add	hl, bc
	ld	de, (hl)
	.local	.LBB19_21
.LBB19_21:                              ;   Parent Loop BB19_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	sbc	hl, hl
	adc	hl, de
	jp	z, .LBB19_23
; %bb.22:                               ;   in Loop: Header=BB19_21 Depth=2
	ld	hl, (iy)
	push	ix
	ld	bc, -273
	add	ix, bc
	ld	(ix + 0), hl
	pop	ix
	push	hl
	ld	bc, -254
	lea	hl, ix + 0
	add	hl, bc
	ld	(hl), de
	ld	de, -270
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), iy
	call	_gfx_GetStringWidth
	pop	de
	call	__ishru_1
	ex	de, hl
	ld	bc, -248
	lea	iy, ix + 0
	add	iy, bc
	ld	hl, (iy + 0)
	or	a, a
	sbc	hl, de
	ld	de, 40
	push	de
	push	hl
	ld	de, -273
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_Text
	ld	de, -270
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	bc, -254
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
	lea	ix, ix - 8
	ld	bc, (ix + 0)
	pop	ix
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 120)
	pop	ix
	add	hl, bc
	push	ix
	lea	ix, ix - 128
	ld	(ix - 120), hl
	pop	ix
	jp	.LBB19_21
	.local	.LBB19_23
.LBB19_23:                              ;   in Loop: Header=BB19_1 Depth=1
	ld	hl, 181
	push	hl
	call	_gfx_SetColor
	pop	hl
	ld	hl, _traits+6
	push	hl
	pop	iy
	ld	bc, 0
	.local	.LBB19_24
.LBB19_24:                              ;   Parent Loop BB19_1 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB19_27 Depth 3
	push	bc
	pop	hl
	ld	de, 39
	or	a, a
	sbc	hl, de
	jp	z, .LBB19_32
; %bb.25:                               ;   in Loop: Header=BB19_24 Depth=2
	ld	de, -248
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
	ld	de, -254
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), iy
	ld	a, (iy + 9)
	push	bc
	pop	iy
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 117)
	pop	ix
	cp	a, l
	jp	nz, .LBB19_31
; %bb.26:                               ;   in Loop: Header=BB19_24 Depth=2
	or	a, a
	sbc	hl, hl
	push	hl
	pop	bc
	.local	.LBB19_27
.LBB19_27:                              ;   Parent Loop BB19_1 Depth=1
                                        ;     Parent Loop BB19_24 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	push	bc
	pop	hl
	ld	de, 2
	or	a, a
	sbc	hl, de
	jp	z, .LBB19_31
; %bb.28:                               ;   in Loop: Header=BB19_27 Depth=3
	ld	de, -264
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), iy
	add	iy, bc
	ld	a, (iy)
	cp	a, -1
	jp	z, .LBB19_30
; %bb.29:                               ;   in Loop: Header=BB19_27 Depth=3
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	de, -270
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
	ld	de, -279
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
	lea	ix, ix - 128
	ld	iy, (ix - 126)
	pop	ix
	ld	bc, (iy + 14)
	push	ix
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 17
	ld	(ix + 0), bc
	pop	ix
	push	ix
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 17
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
	ld	de, -279
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_gfx_Line
	ld	de, -270
	lea	iy, ix + 0
	add	iy, de
	ld	bc, (iy + 0)
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	.local	.LBB19_30
.LBB19_30:                              ;   in Loop: Header=BB19_27 Depth=3
	inc	bc
	ld	de, -264
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	jp	.LBB19_27
	.local	.LBB19_31
.LBB19_31:                              ; %.loopexit
                                        ;   in Loop: Header=BB19_24 Depth=2
	ld	de, -248
	lea	hl, ix + 0
	add	hl, de
	ld	bc, (hl)
	inc	bc
	lea	iy, iy + 22
	jp	.LBB19_24
	.local	.LBB19_32
.LBB19_32:                              ;   in Loop: Header=BB19_1 Depth=1
	or	a, a
	sbc	hl, hl
	ld	de, -255
	lea	iy, ix + 0
	add	iy, de
	ld	l, (iy + 0)                     ; 1-byte Folded Reload
	inc	de
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	ld	bc, 22
	call	__imulu
	ld	de, -273
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	xor	a, a
	ld	l, a
	ld	de, -248
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	or	a, a
	sbc	hl, hl
	push	ix
	lea	ix, ix - 128
	ld	iy, (ix - 117)
	.local	.LBB19_33
.LBB19_33:                              ;   Parent Loop BB19_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	pop	ix
	push	hl
	pop	bc
	ld	de, 858
	or	a, a
	sbc	hl, de
	jp	z, .LBB19_39
; %bb.34:                               ;   in Loop: Header=BB19_33 Depth=2
	ld	hl, _traits
	lea	de, iy + 0
	push	hl
	pop	iy
	add	iy, bc
	push	ix
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 14
	ld	(ix + 0), iy
	pop	ix
	ld	a, (iy + 9)
	push	de
	pop	iy
	cp	a, iyl
	jp	nz, .LBB19_38
; %bb.35:                               ;   in Loop: Header=BB19_33 Depth=2
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 120
	ld	de, (iy + 0)
	push	de
	ld	de, -279
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
	ld	de, -270
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	hl, (iy + 14)
	ld	de, 0
	ld	e, l
	ld	d, h
	ld	bc, -264
	lea	hl, ix + 0
	add	hl, bc
	ld	(hl), de
	ld	a, (iy + 16)
	ld	bc, 0
	ld	c, a
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 14
	ld	(iy + 0), bc
	ld	hl, 10
	push	hl
	push	bc
	push	de
	call	_gfx_FillCircle
	pop	hl
	pop	hl
	pop	hl
	ld	de, -248
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
	ld	de, -270
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -264
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_gfx_Circle
	pop	hl
	pop	hl
	pop	hl
	ld	de, -273
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	ld	bc, -279
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	or	a, a
	sbc	hl, de
	jr	nz, .LBB19_37
; %bb.36:                               ;   in Loop: Header=BB19_33 Depth=2
	ld	de, -264
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	hl, -13
	ex	de, hl
	add	iy, de
	push	ix
	ld	bc, -270
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
	.local	.LBB19_37
.LBB19_37:                              ;   in Loop: Header=BB19_33 Depth=2
	ld	de, -3
	ld	bc, -264
	lea	hl, ix + 0
	add	hl, bc
	ld	iy, (hl)
	add	iy, de
	dec	de
	push	ix
	ld	bc, -270
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
	ld	de, -245
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	de, -279
	lea	hl, ix + 0
	add	hl, de
	ld	bc, (hl)
	.local	.LBB19_38
.LBB19_38:                              ;   in Loop: Header=BB19_33 Depth=2
	push	bc
	pop	hl
	ld	de, 22
	add	hl, de
	push	ix
	lea	ix, ix - 128
	ld	de, (ix - 120)
	pop	ix
	inc	e
	push	ix
	lea	ix, ix - 128
	ld	(ix - 120), de
	jp	.LBB19_33
	.local	.LBB19_39
.LBB19_39:                              ;   in Loop: Header=BB19_1 Depth=1
	ld	a, iyl
	or	a, a
	ld	iy, 8
	jr	nz, .LBB19_41
; %bb.40:                               ;   in Loop: Header=BB19_1 Depth=1
	ld	hl, 163
	push	hl
	ld	hl, 22
	push	hl
	ld	hl, _.str.2.6
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 163
	push	hl
	ld	hl, 105
	push	hl
	ld	hl, _.str.3.7
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 163
	push	hl
	ld	hl, 208
	push	hl
	ld	hl, _.str.4.8
	push	hl
	call	_Text
	ld	iy, 8
	pop	hl
	pop	hl
	pop	hl
	.local	.LBB19_41
.LBB19_41:                              ;   in Loop: Header=BB19_1 Depth=1
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 126)
	pop	ix
	ld	bc, 22
	call	__imulu
	ex	de, hl
	ld	hl, _traits
	add	hl, de
	push	ix
	lea	ix, ix - 128
	ld	(ix - 120), hl
	pop	ix
	ld	de, (hl)
	ld	hl, 180
	push	hl
	push	iy
	ld	bc, -273
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), de
	push	de
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	de, -248
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	e, (iy + 8)
	or	a, a
	sbc	hl, hl
	ld	bc, -270
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), e
	ld	(iy + 1), d
	ld	l, e
	ld	de, -264
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	push	hl
	ld	hl, _.str.5
	push	hl
	ld	hl, 64
	push	hl
	ld	de, -251
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
	ld	de, -251
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
	ld	hl, _.str.6
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 226
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, _.str.7
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
	jr	z, .LBB19_43
; %bb.42:                               ;   in Loop: Header=BB19_1 Depth=1
	ld	a, 0
	ld	e, a
	.local	.LBB19_43
.LBB19_43:                              ;   in Loop: Header=BB19_1 Depth=1
	bit	0, e
	jr	z, .LBB19_45
	.local	.LBB19_44
.LBB19_44:                              ;   in Loop: Header=BB19_1 Depth=1
	ld	bc, -255
	lea	iy, ix + 0
	add	iy, bc
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	jp	.LBB19_112
	.local	.LBB19_45
.LBB19_45:                              ;   in Loop: Header=BB19_1 Depth=1
	ld	a, l
	dec	a
	cp	a, 4
	jr	nc, .LBB19_47
; %bb.46:                               ;   in Loop: Header=BB19_1 Depth=1
	ld	bc, 0
	ld	c, l
	push	ix
	lea	ix, ix - 128
	ld	iy, (ix - 120)
	pop	ix
	add	iy, bc
	ld	a, (iy + 16)
	ld	bc, -267
	lea	iy, ix + 0
	add	iy, bc
	ld	hl, (iy + 0)
	ld	c, e
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 2
	ld	de, (iy + 0)
	add	hl, de
	ld	e, c
	ld	(hl), a
	jp	.LBB19_112
	.local	.LBB19_47
.LBB19_47:                              ;   in Loop: Header=BB19_1 Depth=1
	ld	a, l
	cp	a, 5
	jr	nz, .LBB19_44
; %bb.48:                               ;   in Loop: Header=BB19_1 Depth=1
	ld	bc, -303
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), e                     ; 1-byte Folded Spill
	ld	(ix - 8), 0
	ld	l, -17
	push	ix
	lea	ix, ix - 128
	push	af
	ld	a, (ix - 127)                   ; 1-byte Folded Reload
	ld	iyh, a
	pop	af
	pop	ix
	ld	a, iyh
	add	a, l
	ld	l, a
	push	ix
	ld	de, -279
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
	ld	de, -306
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), bc
	dec	de
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), a                         ; 1-byte Folded Spill
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 126)
	pop	ix
	ld	c, 5
	call	__ishru
	add	hl, hl
	add	hl, hl
	ex	de, hl
	push	ix
	ld	bc, -282
	add	ix, bc
	ld	hl, (ix + 0)
	pop	ix
	add	hl, de
	push	ix
	ld	de, -294
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
	ld	bc, -310
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
	ld	de, -330
	add	ix, de
	ld	(ix + 0), l
	pop	ix
	ld	de, -37
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 126)
	pop	ix
	add	hl, de
	add	hl, hl
	ex	de, hl
	ld	hl, _reshuffle_reductions
	add	hl, de
	push	ix
	ld	de, -329
	add	ix, de
	ld	(ix + 0), hl
	pop	ix
	ld	de, -279
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
	ld	de, -314
	add	ix, de
	ld	(ix + 0), hl
	pop	ix
	ld	d, iyl
	push	ix
	ld	bc, -270
	add	ix, bc
	ld	l, (ix + 0)
	ld	h, (ix + 1)
	pop	ix
	push	ix
	ld	bc, -296
	add	ix, bc
	ld	(ix + 0), e
	ld	(ix + 1), d
	pop	ix
	ld	h, d
	push	ix
	ld	de, -270
	add	ix, de
	ld	(ix + 0), l
	ld	(ix + 1), h
	pop	ix
	ex	de, hl
	ld	e, iyh
	ex	de, hl
	push	ix
	ld	de, -299
	add	ix, de
	ld	(ix + 0), hl
	pop	ix
	push	ix
	ld	de, -317
	add	ix, de
	ld	(ix + 0), hl
	pop	ix
	push	ix
	ld	de, -302
	add	ix, de
	ld	(ix + 0), hl
	pop	ix
	push	ix
	ld	de, -320
	add	ix, de
	ld	(ix + 0), hl
	pop	ix
	push	ix
	ld	de, -333
	add	ix, de
	ld	(ix + 0), hl
	pop	ix
	push	ix
	ld	de, -339
	add	ix, de
	ld	(ix + 0), hl
	pop	ix
	push	ix
	ld	de, -345
	add	ix, de
	ld	(ix + 0), hl
	pop	ix
	push	ix
	ld	de, -336
	add	ix, de
	ld	(ix + 0), hl
	pop	ix
	push	ix
	ld	de, -342
	add	ix, de
	ld	(ix + 0), hl
	pop	ix
	push	ix
	ld	de, -323
	add	ix, de
	ld	(ix + 0), hl
	pop	ix
	ld	a, iyl
	ld	de, -282
	lea	iy, ix + 0
	add	iy, de
	ld	bc, (iy + 0)
	ld	hl, _.str.102
	.local	.LBB19_49
.LBB19_49:                              ;   Parent Loop BB19_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ld	de, -288
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
	jr	z, .LBB19_51
; %bb.50:                               ;   in Loop: Header=BB19_49 Depth=2
	ld	l, 0
	.local	.LBB19_51
.LBB19_51:                              ;   in Loop: Header=BB19_49 Depth=2
	ld	de, -279
	lea	iy, ix + 0
	add	iy, de
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	cp	a, 12
                                        ; kill: def $a killed $a
	sbc	a, a
	and	a, l
	ld	l, a
	bit	0, l
	ld	de, -254
	lea	iy, ix + 0
	push	af
	add	iy, de
	pop	af
	ld	(iy + 0), l
	jr	z, .LBB19_53
; %bb.52:                               ;   in Loop: Header=BB19_49 Depth=2
	ld	de, -276
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	hl, (iy + 95)
	push	ix
	ld	de, -282
	add	ix, de
	ld	iy, (ix + 0)
	pop	ix
	lea	iy, iy + 3
	ld	e, (iy)
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 54
	ld	bc, (iy + 0)
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 55
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	call	__land
	push	ix
	ld	bc, -276
	add	ix, bc
	ld	iy, (ix + 0)
	pop	ix
	ld	(iy + 95), hl
	lea	hl, ix + 0
	add	hl, bc
	ld	iy, (hl)
	ld	(iy + 98), e
	jr	.LBB19_54
	.local	.LBB19_53
.LBB19_53:                              ;   in Loop: Header=BB19_49 Depth=2
	ld	de, -294
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	hl, (iy)
	lea	iy, iy + 3
	ld	e, (iy)
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 50
	ld	bc, (iy + 0)
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 51
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	call	__lor
	push	ix
	ld	bc, -294
	add	ix, bc
	ld	iy, (ix + 0)
	pop	ix
	ld	(iy), hl
	ld	(iy + 3), e
	.local	.LBB19_54
.LBB19_54:                              ;   in Loop: Header=BB19_49 Depth=2
	ld	bc, -282
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	ld	bc, -285
	lea	iy, ix + 0
	add	iy, bc
	ld	hl, (iy + 0)
	push	hl
	push	de
	call	_CalculateEffects
	pop	hl
	pop	hl
	ld	hl, _.str.60
	push	hl
	call	_BeginScreen
	pop	hl
	ld	hl, 28
	push	hl
	ld	hl, 8
	push	hl
	ld	de, -273
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
	ld	bc, -291
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), de
	ld	de, -299
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
	ld	de, -264
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -291
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _.str.61
	push	hl
	ld	hl, 80
	push	hl
	ld	de, -261
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
	ld	de, -261
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
	ld	hl, _.str.62
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	de, -248
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	a, (iy + 6)
	cp	a, d
	ld	hl, _.str.63
	jr	z, .LBB19_56
; %bb.55:                               ;   in Loop: Header=BB19_49 Depth=2
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	bc, 22
	call	__imulu
	ex	de, hl
	ld	hl, _traits
	add	hl, de
	ld	hl, (hl)
	.local	.LBB19_56
.LBB19_56:                              ;   in Loop: Header=BB19_49 Depth=2
	ld	de, 55
	push	de
	ld	de, 80
	push	de
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	de, -248
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	a, (iy + 7)
	cp	a, d
	jr	z, .LBB19_58
; %bb.57:                               ;   in Loop: Header=BB19_49 Depth=2
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
	.local	.LBB19_58
.LBB19_58:                              ;   in Loop: Header=BB19_49 Depth=2
	ld	de, -255
	lea	iy, ix + 0
	add	iy, de
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	cp	a, 37
	ld	hl, 78
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, _.str.64
	push	hl
	call	nc, _Text
	pop	hl
	pop	hl
	pop	hl
	ld	de, -248
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
	ld	de, -254
	lea	iy, ix + 0
	push	af
	add	iy, de
	pop	af
	bit	0, (iy + 0)                     ; 1-byte Folded Reload
	ld	hl, _.str.65
	jr	nz, .LBB19_60
; %bb.59:                               ;   in Loop: Header=BB19_49 Depth=2
	ld	hl, _.str.66
	.local	.LBB19_60
.LBB19_60:                              ;   in Loop: Header=BB19_49 Depth=2
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
	lea	iy, iy - 126
	ld	(iy + 0), bc
	ld	bc, -276
	lea	hl, ix + 0
	add	hl, bc
	ld	iy, (hl)
	ld	bc, (iy + 81)
	push	de
	pop	hl
	ld	l, c
	ld	h, b
	ld	bc, -291
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), hl
	ld	hl, _effects+16
	ld	bc, (hl)
	ld	e, c
	ld	d, b
	ld	bc, -276
	lea	hl, ix + 0
	add	hl, bc
	ld	iy, (hl)
	ld	hl, (iy + 83)
	ld	bc, 0
	ld	c, l
	ld	b, h
	push	bc
	push	de
	ld	de, -291
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -254
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _.str.67
	push	hl
	ld	hl, 80
	push	hl
	ld	de, -261
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
	ld	de, -261
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
	ld	de, -254
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), bc
	push	ix
	ld	de, -276
	add	ix, de
	ld	iy, (ix + 0)
	pop	ix
	ld	iy, (iy + 85)
	push	hl
	pop	bc
	ex	de, hl
	ld	c, iyl
	ld	b, iyh
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 35
	ld	(iy + 0), bc
	ld	hl, _effects+20
	ld	bc, (hl)
	ld	e, c
	ld	d, b
	ld	bc, -276
	lea	hl, ix + 0
	add	hl, bc
	ld	iy, (hl)
	ld	hl, (iy + 87)
	ld	bc, 0
	ld	c, l
	ld	b, h
	push	bc
	push	de
	ld	de, -291
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -254
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _.str.68
	push	hl
	ld	hl, 80
	push	hl
	ld	de, -261
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
	ld	de, -261
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	de, -255
	lea	iy, ix + 0
	add	iy, de
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	cp	a, 37
	jr	c, .LBB19_63
; %bb.61:                               ;   in Loop: Header=BB19_49 Depth=2
	ld	de, -317
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
	jp	z, .LBB19_69
; %bb.62:                               ;   in Loop: Header=BB19_49 Depth=2
	ld	de, -261
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	lea	de, iy + 0
	ld	hl, _.str.69
	ld	bc, 33
	ldir
	jp	.LBB19_74
	.local	.LBB19_63
.LBB19_63:                              ;   in Loop: Header=BB19_49 Depth=2
	cp	a, 15
	jp	nc, .LBB19_66
; %bb.64:                               ;   in Loop: Header=BB19_49 Depth=2
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
	jp	z, .LBB19_66
; %bb.65:                               ;   in Loop: Header=BB19_49 Depth=2
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
	lea	iy, iy - 126
	ld	(iy + 0), de
	ld	de, -276
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	hl, (iy + 89)
                                        ; kill: def $hl killed $hl killed $uhl
	call	__sdivu
	ld	de, 0
	ld	e, l
	ld	d, h
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 35
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
	lea	ix, ix - 20
	ld	iy, (ix + 0)
	pop	ix
	ld	hl, (iy + 91)
                                        ; kill: def $hl killed $hl killed $uhl
	call	__sdivu
	ld	bc, 0
	ld	c, l
	ld	b, h
	push	bc
	push	de
	ld	de, -291
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -254
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _.str.71
	jp	.LBB19_73
	.local	.LBB19_66
.LBB19_66:                              ;   in Loop: Header=BB19_49 Depth=2
	cp	a, 16
	jr	z, .LBB19_68
; %bb.67:                               ;   in Loop: Header=BB19_49 Depth=2
	ld	de, -330
	lea	iy, ix + 0
	add	iy, de
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	cp	a, 10
	jp	nz, .LBB19_72
	.local	.LBB19_68
.LBB19_68:                              ;   in Loop: Header=BB19_49 Depth=2
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
	lea	ix, ix - 20
	ld	iy, (ix + 0)
	pop	ix
	ld	hl, (iy + 93)
                                        ; kill: def $hl killed $hl killed $uhl
	call	__sdivu
	ld	bc, 0
	ld	c, l
	ld	b, h
	push	bc
	push	de
	ld	hl, _.str.72
	push	hl
	ld	hl, 80
	push	hl
	ld	de, -261
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_snprintf
	ld	de, -261
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	jp	.LBB19_74
	.local	.LBB19_69
.LBB19_69:                              ;   in Loop: Header=BB19_49 Depth=2
	ld	de, -329
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	ld	hl, (hl)
	ld	de, -326
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
	ld	bc, -348
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
	ld	(ix - 126), bc
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
	lea	ix, ix - 35
	ld	(ix + 0), bc
	pop	ix
	push	de
	pop	bc
	push	ix
	lea	ix, ix - 128
	lea	ix, ix - 128
	lea	ix, ix - 70
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
	lea	iy, iy - 92
	ld	de, (iy + 0)
	or	a, a
	sbc.sis	hl, de
	jr	c, .LBB19_71
; %bb.70:                               ;   in Loop: Header=BB19_49 Depth=2
	ld	bc, 0
	.local	.LBB19_71
.LBB19_71:                              ;   in Loop: Header=BB19_49 Depth=2
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
	ld	de, -291
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -254
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _.str.70
	jp	.LBB19_73
	.local	.LBB19_72
.LBB19_72:                              ;   in Loop: Header=BB19_49 Depth=2
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
	ld	bc, -291
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
	lea	iy, iy - 126
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
	ld	de, -285
	add	ix, de
	ld	hl, (ix + 0)
	pop	ix
	push	ix
	ld	bc, -291
	add	ix, bc
	ld	de, (ix + 0)
	pop	ix
	add	hl, de
	ld	hl, (hl)
	push	ix
	ld	de, -291
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
	lea	ix, ix - 35
	ld	bc, (ix + 0)
	pop	ix
	add.sis	hl, bc
	ld	bc, 0
	ld	c, l
	ld	b, h
	push	bc
	push	de
	push	iy
	ld	de, -254
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _.str.73
	.local	.LBB19_73
.LBB19_73:                              ;   in Loop: Header=BB19_49 Depth=2
	push	hl
	ld	hl, 80
	push	hl
	ld	de, -261
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_snprintf
	ld	de, -261
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	hl, 21
	add	hl, sp
	ld	sp, hl
	.local	.LBB19_74
.LBB19_74:                              ;   in Loop: Header=BB19_49 Depth=2
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
	ld	de, -288
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	de, -302
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
	ld	hl, _.str.75
	jp	nz, .LBB19_78
; %bb.75:                               ;   in Loop: Header=BB19_49 Depth=2
	ld	de, -323
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
	ld	hl, _.str.76
	jp	z, .LBB19_78
; %bb.76:                               ;   in Loop: Header=BB19_49 Depth=2
	ld	hl, _disease+20
	ld	hl, (hl)
                                        ; kill: def $hl killed $hl killed $uhl
	ld	bc, -270
	lea	iy, ix + 0
	add	iy, bc
	ld	e, (iy + 0)
	ld	d, (iy + 1)
	or	a, a
	sbc.sis	hl, de
	ld	hl, _.str.77
	jr	c, .LBB19_78
; %bb.77:                               ;   in Loop: Header=BB19_49 Depth=2
	ld	hl, _.str.102
	.local	.LBB19_78
.LBB19_78:                              ;   in Loop: Header=BB19_49 Depth=2
	push	hl
	ld	de, -264
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _.str.74
	push	hl
	ld	hl, 80
	push	hl
	ld	de, -261
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
	ld	de, -254
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), a                     ; 1-byte Folded Spill
	or	a, a
	ld	hl, -1
	jr	z, .LBB19_80
; %bb.79:                               ;   in Loop: Header=BB19_49 Depth=2
	ld	hl, 0
	.local	.LBB19_80
.LBB19_80:                              ;   in Loop: Header=BB19_49 Depth=2
	push	hl
	ld	hl, 184
	push	hl
	ld	de, -261
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_MenuItem
	pop	hl
	pop	hl
	pop	hl
	ld	de, -279
	lea	iy, ix + 0
	add	iy, de
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	cp	a, 12
	ld	hl, 1
	jp	nc, .LBB19_90
; %bb.81:                               ;   in Loop: Header=BB19_49 Depth=2
	ld	a, (_disease+32)
	cp	a, 1
	ld	a, 7
	jr	z, .LBB19_83
; %bb.82:                               ;   in Loop: Header=BB19_49 Depth=2
	ld	a, 4
	.local	.LBB19_83
.LBB19_83:                              ;   in Loop: Header=BB19_49 Depth=2
	ld	de, -291
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), a
	ld	de, -320
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _disease
	push	hl
	call	_CanDevolve
	ld	de, -291
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
	ld	bc, -296
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
	ld	hl, _.str.77
	jr	c, .LBB19_85
; %bb.84:                               ;   in Loop: Header=BB19_49 Depth=2
	ld	hl, _.str.102
	.local	.LBB19_85
.LBB19_85:                              ;   in Loop: Header=BB19_49 Depth=2
	ld	bc, 0
	ld	c, iyl
	bit	0, a
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 5
	ld	de, (iy + 0)
	jr	nz, .LBB19_87
; %bb.86:                               ;   in Loop: Header=BB19_49 Depth=2
	ld	hl, _.str.79
	.local	.LBB19_87
.LBB19_87:                              ;   in Loop: Header=BB19_49 Depth=2
	push	hl
	push	bc
	ld	hl, _.str.78
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
	ld	de, -254
	lea	iy, ix + 0
	add	iy, de
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	cp	a, 1
	ld	hl, -1
	jr	z, .LBB19_89
; %bb.88:                               ;   in Loop: Header=BB19_49 Depth=2
	ld	hl, 0
	.local	.LBB19_89
.LBB19_89:                              ;   in Loop: Header=BB19_49 Depth=2
	push	hl
	ld	hl, 204
	push	hl
	ld	de, -261
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_MenuItem
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 2
	.local	.LBB19_90
.LBB19_90:                              ;   in Loop: Header=BB19_49 Depth=2
	ld	de, -291
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	ld	a, l
	ld	de, -254
	lea	iy, ix + 0
	add	iy, de
	ld	l, (iy + 0)
	cp	a, l
	ld	hl, -1
	jr	z, .LBB19_92
; %bb.91:                               ;   in Loop: Header=BB19_49 Depth=2
	ld	hl, 0
	.local	.LBB19_92
.LBB19_92:                              ;   in Loop: Header=BB19_49 Depth=2
	push	hl
	ld	hl, 224
	push	hl
	ld	hl, _.str.80
	push	hl
	call	_MenuItem
	pop	hl
	pop	hl
	pop	hl
	call	_gfx_SwapDraw
	call	_WaitKey
	ld	e, a
	cp	a, 6
	jp	z, .LBB19_111
; %bb.93:                               ;   in Loop: Header=BB19_49 Depth=2
	ld	bc, -314
	lea	iy, ix + 0
	add	iy, bc
	ld	hl, (iy + 0)
	push	hl
	pea	ix - 8
	push	de
	ld	bc, -326
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), de
	call	_MenuMove
	ld	l, a
	pop	de
	pop	de
	pop	de
	ld	a, (ix - 8)
	ld	de, -254
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), a
	ld	bc, -326
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	ld	a, e
	cp	a, 5
	jr	z, .LBB19_95
; %bb.94:                               ;   in Loop: Header=BB19_49 Depth=2
	ld	de, -288
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	ld	de, -282
	lea	iy, ix + 0
	add	iy, de
	ld	bc, (iy + 0)
	jr	.LBB19_97
	.local	.LBB19_95
.LBB19_95:                              ;   in Loop: Header=BB19_49 Depth=2
	bit	0, l
	ld	de, -282
	lea	iy, ix + 0
	push	af
	add	iy, de
	pop	af
	ld	bc, (iy + 0)
	jr	z, .LBB19_98
; %bb.96:                               ;   in Loop: Header=BB19_49 Depth=2
	ld	de, -288
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	.local	.LBB19_97
.LBB19_97:                              ;   in Loop: Header=BB19_49 Depth=2
	ld	de, -254
	lea	iy, ix + 0
	add	iy, de
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	jp	.LBB19_49
	.local	.LBB19_98
.LBB19_98:                              ;   in Loop: Header=BB19_49 Depth=2
	ld	de, -291
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	ld	a, l
	ld	de, -254
	lea	iy, ix + 0
	add	iy, de
	ld	l, (iy + 0)                     ; 1-byte Folded Reload
	cp	a, l
	ld	a, l
	jp	z, .LBB19_111
; %bb.99:                               ;   in Loop: Header=BB19_49 Depth=2
	or	a, a
	jp	nz, .LBB19_104
; %bb.100:                              ;   in Loop: Header=BB19_49 Depth=2
	ld	de, -333
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
	ld	hl, _.str.81
	ld	de, -282
	lea	iy, ix + 0
	push	af
	add	iy, de
	pop	af
	ld	bc, (iy + 0)
	ld	de, -254
	lea	iy, ix + 0
	push	af
	add	iy, de
	pop	af
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	jp	nz, .LBB19_49
; %bb.101:                              ;   in Loop: Header=BB19_49 Depth=2
	ld	de, -339
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _disease
	push	hl
	call	_Eligible
	ld	de, -282
	lea	iy, ix + 0
	add	iy, de
	ld	bc, (iy + 0)
	pop	hl
	pop	hl
	bit	0, a
	ld	de, -254
	lea	iy, ix + 0
	push	af
	add	iy, de
	pop	af
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	ld	hl, _.str.82
	jp	z, .LBB19_49
; %bb.102:                              ;   in Loop: Header=BB19_49 Depth=2
	ld	hl, _disease+20
	ld	hl, (hl)
                                        ; kill: def $hl killed $hl killed $uhl
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 14
	ld	e, (iy + 0)
	ld	d, (iy + 1)
	or	a, a
	sbc.sis	hl, de
	ld	hl, _.str.83
	jp	c, .LBB19_49
; %bb.103:                              ;   in Loop: Header=BB19_49 Depth=2
	ld	de, -345
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _disease
	push	hl
	call	_Purchase
	ld	de, -282
	lea	iy, ix + 0
	add	iy, de
	ld	bc, (iy + 0)
	pop	hl
	pop	hl
	bit	0, a
	ld	de, -254
	lea	iy, ix + 0
	push	af
	add	iy, de
	pop	af
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	ld	hl, _.str.84
	jp	.LBB19_109
	.local	.LBB19_104
.LBB19_104:                             ;   in Loop: Header=BB19_49 Depth=2
	ld	de, -336
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
	ld	hl, _.str.85
	ld	de, -282
	lea	iy, ix + 0
	push	af
	add	iy, de
	pop	af
	ld	bc, (iy + 0)
	ld	de, -254
	lea	iy, ix + 0
	push	af
	add	iy, de
	pop	af
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	jp	z, .LBB19_49
; %bb.105:                              ;   in Loop: Header=BB19_49 Depth=2
	ld	a, (_disease+32)
	cp	a, 1
	ld.sis	de, 7
	jr	z, .LBB19_107
; %bb.106:                              ;   in Loop: Header=BB19_49 Depth=2
	ld.sis	de, 4
	.local	.LBB19_107
.LBB19_107:                             ;   in Loop: Header=BB19_49 Depth=2
	ld	hl, _disease+20
	ld	hl, (hl)
                                        ; kill: def $hl killed $hl killed $uhl
	or	a, a
	sbc.sis	hl, de
	ld	hl, _.str.83
	ld	de, -254
	lea	iy, ix + 0
	push	af
	add	iy, de
	pop	af
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	jp	c, .LBB19_49
; %bb.108:                              ;   in Loop: Header=BB19_49 Depth=2
	ld	de, -342
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _disease
	push	hl
	call	_Devolve
	ld	de, -282
	lea	iy, ix + 0
	add	iy, de
	ld	bc, (iy + 0)
	pop	hl
	pop	hl
	bit	0, a
	ld	de, -254
	lea	iy, ix + 0
	push	af
	add	iy, de
	pop	af
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	ld	hl, _.str.86
	.local	.LBB19_109
.LBB19_109:                             ;   in Loop: Header=BB19_49 Depth=2
	ex	de, hl
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 32
	ld	hl, (iy + 0)
	jp	z, .LBB19_49
; %bb.110:                              ;   in Loop: Header=BB19_49 Depth=2
	ld	bc, -288
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), de
	ld	hl, _effects
	push	hl
	ld	hl, _disease
	push	hl
	call	_CalculateEffects
	ld	de, -254
	lea	iy, ix + 0
	add	iy, de
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	ld	de, -282
	lea	iy, ix + 0
	add	iy, de
	ld	bc, (iy + 0)
	pop	hl
	pop	hl
	ld	de, -288
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	jp	.LBB19_49
	.local	.LBB19_111
.LBB19_111:                             ;   in Loop: Header=BB19_1 Depth=1
	ld	de, -267
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	ld	bc, -258
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	add	hl, de
	ld	a, (hl)
	ld	bc, -303
	lea	iy, ix + 0
	add	iy, bc
	ld	e, (iy + 0)                     ; 1-byte Folded Reload
	.local	.LBB19_112
.LBB19_112:                             ;   in Loop: Header=BB19_1 Depth=1
	cp	a, 39
	jp	c, .LBB19_1
; %bb.113:                              ;   in Loop: Header=BB19_1 Depth=1
	ld	hl, _first_node
	ld	c, e
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 2
	ld	de, (iy + 0)
	add	hl, de
	ld	a, (hl)
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 128
	lea	iy, iy - 11
	ld	hl, (iy + 0)
	add	hl, de
	ld	e, c
	ld	(hl), a
	jp	.LBB19_1
	.local	.LBB19_114
.LBB19_114:
	call	_ReleaseKeys
	or	a, a
	sbc	hl, hl
	ld	(-917504), hl
	xor	a, a
	ld	(-917501), a
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end19
.Lfunc_end19:
	.size	_EvolutionMenu, .Lfunc_end19-_EvolutionMenu
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
	jr	z, .LBB20_2
; %bb.1:
	ld	a, 42
	jr	.LBB20_7
	.local	.LBB20_2
.LBB20_2:
	ld	l, (ix + 6)
	push	hl
	ld	hl, _disease
	push	hl
	call	_Eligible
	pop	hl
	pop	hl
	bit	0, a
	jr	z, .LBB20_5
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
	jr	c, .LBB20_6
; %bb.4:
	ld	a, 43
	jr	.LBB20_7
	.local	.LBB20_5
.LBB20_5:
	ld	a, 76
	jr	.LBB20_7
	.local	.LBB20_6
.LBB20_6:
	ld	a, 36
	.local	.LBB20_7
.LBB20_7:
	pop	ix
	ret
	.local	.Lfunc_end20
.Lfunc_end20:
	.size	_StateSymbol, .Lfunc_end20-_StateSymbol
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
	ld	hl, _.str.8
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
	ld	hl, _.str.9
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
	ld	hl, _.str.10
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
	ld	hl, _.str.11
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
	ld	hl, _.str.12
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
	ld	hl, _.str.13
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
	ld	hl, _.str.14
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
	ld	hl, _.str.15
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
	.local	.LBB21_1
.LBB21_1:                               ; =>This Inner Loop Header: Depth=1
	push	bc
	pop	hl
	lea	de, iy + 0
	or	a, a
	sbc	hl, de
	jr	z, .LBB21_5
; %bb.2:                                ;   in Loop: Header=BB21_1 Depth=1
	ld	iy, _port
	add	iy, bc
	ld	a, (iy + 2)
	ld	l, (ix - 92)
	cp	a, l
	jr	nz, .LBB21_4
; %bb.3:                                ;   in Loop: Header=BB21_1 Depth=1
	inc	(ix - 86)
	ld	a, (iy + 5)
	ld	l, (ix - 89)
	add	a, l
	ld	l, a
	ld	(ix - 89), l
	.local	.LBB21_4
.LBB21_4:                               ;   in Loop: Header=BB21_1 Depth=1
	push	bc
	pop	hl
	ld	bc, 6
	add	hl, bc
	push	hl
	pop	bc
	ld	iy, 132
	jr	.LBB21_1
	.local	.LBB21_5
.LBB21_5:
	or	a, a
	sbc	hl, hl
	push	hl
	pop	bc
	ld	c, (ix - 89)                    ; 1-byte Folded Reload
	ld	l, (ix - 86)                    ; 1-byte Folded Reload
	push	hl
	push	bc
	ld	hl, _.str.16
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
	ld	hl, _.str.4.214
	push	hl
	call	_MenuItem
	pop	hl
	pop	hl
	pop	hl
	call	_gfx_SwapDraw
	.local	.LBB21_6
.LBB21_6:                               ; =>This Inner Loop Header: Depth=1
	call	_WaitKey
	ld	l, -5
	add	a, l
	ld	l, a
	cp	a, 2
	jr	nc, .LBB21_6
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
	.local	.Lfunc_end21
.Lfunc_end21:
	.size	_RegionInfo, .Lfunc_end21-_RegionInfo
                                        ; -- End function
	.section	.text._SporeMenu,"ax",@progbits
	.globl	_SporeMenu                      ; -- Begin function SporeMenu
	.type	_SporeMenu,@function
_SporeMenu:                             ; @SporeMenu
; %bb.0:
	ld	hl, -104
	call	__frameset
	ld	hl, _.str.102
	ld	(ix - 101), hl
	lea	hl, ix - 80
	ld	(ix - 86), hl
	ld	a, (_session+4)
	ld	l, a
	.local	.LBB22_1
.LBB22_1:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB22_2 Depth 2
                                        ;       Child Loop BB22_5 Depth 3
	ld	(ix - 98), hl
	.local	.LBB22_2
.LBB22_2:                               ;   Parent Loop BB22_1 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB22_5 Depth 3
	ld	hl, _.str.19
	push	hl
	call	_BeginScreen
	pop	hl
	ld	a, (_disease+36)
	cp	a, 3
	ld	hl, _.str.20
	jr	nc, .LBB22_4
; %bb.3:                                ;   in Loop: Header=BB22_2 Depth=2
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
	ld	hl, _.str.21
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
	.local	.LBB22_4
.LBB22_4:                               ;   in Loop: Header=BB22_2 Depth=2
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
	ld	hl, _.str.22
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
	.local	.LBB22_5
.LBB22_5:                               ;   Parent Loop BB22_1 Depth=1
                                        ;     Parent Loop BB22_2 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	push	hl
	pop	bc
	ld	de, 119
	or	a, a
	sbc	hl, de
	jr	z, .LBB22_9
; %bb.6:                                ;   in Loop: Header=BB22_5 Depth=3
	ld	hl, (ix - 89)
	ld	(ix - 92), bc
	or	a, a
	sbc	hl, bc
	ld	hl, 62
	jr	z, .LBB22_8
; %bb.7:                                ;   in Loop: Header=BB22_5 Depth=3
	ld	hl, 32
	.local	.LBB22_8
.LBB22_8:                               ;   in Loop: Header=BB22_5 Depth=3
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
	ld	hl, _.str.23
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
	jr	.LBB22_5
	.local	.LBB22_9
.LBB22_9:                               ;   in Loop: Header=BB22_2 Depth=2
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
	ld	hl, _.str.24
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 226
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, _.str.25
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
	jp	nc, .LBB22_2
; %bb.10:                               ;   in Loop: Header=BB22_2 Depth=2
	ld	de, 0
	ld	e, l
	ld	hl, JTI22_0
	add	hl, de
	add	hl, de
	add	hl, de
	ld	hl, (hl)
	jp	(hl)
	.local	.LBB22_11
.LBB22_11:                              ;   in Loop: Header=BB22_2 Depth=2
	ld	a, (_disease+36)
	cp	a, 3
	ld	hl, _.str.26
	ld	(ix - 101), hl
	jp	nc, .LBB22_2
; %bb.12:                               ;   in Loop: Header=BB22_2 Depth=2
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
	ld	hl, _.str.27
	ld	(ix - 101), hl
	jp	z, .LBB22_2
; %bb.13:                               ;   in Loop: Header=BB22_2 Depth=2
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
	ld	hl, _.str.28
	ld	(ix - 101), hl
	jp	c, .LBB22_2
; %bb.14:                               ;   in Loop: Header=BB22_2 Depth=2
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
	ld	hl, _.str.31
	ld	(ix - 101), hl
	jp	z, .LBB22_2
; %bb.15:                               ;   in Loop: Header=BB22_2 Depth=2
	ld	hl, _.str.29
	push	hl
	call	_QueueNews
	pop	hl
	ld	hl, _.str.30
	ld	(ix - 101), hl
	jp	.LBB22_2
	.local	.LBB22_16
.LBB22_16:                              ;   in Loop: Header=BB22_1 Depth=1
	ld	hl, (ix - 98)
	ld	h, 0
	ld.sis	de, 6
	add.sis	hl, de
	jr	.LBB22_18
	.local	.LBB22_17
.LBB22_17:                              ;   in Loop: Header=BB22_1 Depth=1
	ld	hl, (ix - 98)
	ld	h, 0
	inc.sis	hl
	.local	.LBB22_18
.LBB22_18:                              ;   in Loop: Header=BB22_1 Depth=1
                                        ; kill: def $hl killed $hl killed $uhl
	ld.sis	bc, 7
	call	__sremu
                                        ; kill: def $hl killed $hl def $uhl
	jp	.LBB22_1
	.local	.LBB22_19
.LBB22_19:
	call	_EndModal
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end22
.Lfunc_end22:
	.size	_SporeMenu, .Lfunc_end22-_SporeMenu
	.section	.rodata._SporeMenu,"a",@progbits
JTI22_0:
	d24	.LBB22_16
	d24	.LBB22_17
	d24	.LBB22_11
	d24	.LBB22_19
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
	jr	z, .LBB23_2
; %bb.1:
	ld	hl, _.str.33
	jr	.LBB23_3
	.local	.LBB23_2
.LBB23_2:
	ld	hl, _.str.32
	.local	.LBB23_3
.LBB23_3:
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
	ld	hl, _.str.34
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
	ld	hl, _.str.35
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
	jr	nz, .LBB23_5
; %bb.4:                                ; %Percentage.exit3.critedge
	or	a, a
	sbc	hl, hl
	push	hl
	push	hl
	ld	(ix - 93), hl
	push	hl
	ld	hl, _.str.36
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
	jp	.LBB23_6
	.local	.LBB23_5
.LBB23_5:                               ; %Percentage.exit2
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
	ld	hl, _.str.36
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
	.local	.LBB23_6
.LBB23_6:                               ; %Percentage.exit3
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
	ld	hl, _.str.37
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
	jr	z, .LBB23_8
; %bb.7:                                ; %Percentage.exit3
	ld	hl, _.str.40
	jr	.LBB23_9
	.local	.LBB23_8
.LBB23_8:
	ld	hl, _.str.39
	.local	.LBB23_9
.LBB23_9:                               ; %Percentage.exit3
	ld	bc, 304
	cp	a, b
	ld	de, 8
	jr	nz, .LBB23_11
; %bb.10:
	ld	hl, _.str.38
	.local	.LBB23_11
.LBB23_11:                              ; %Percentage.exit3
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
	ld	hl, _.str.41
	push	hl
	call	_MenuItem
	pop	hl
	pop	hl
	pop	hl
	call	_gfx_SwapDraw
	.local	.LBB23_12
.LBB23_12:                              ; =>This Inner Loop Header: Depth=1
	call	_WaitKey
	ld	l, -5
	add	a, l
	ld	l, a
	cp	a, 2
	jr	nc, .LBB23_12
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
	.local	.Lfunc_end23
.Lfunc_end23:
	.size	_ResultScreen, .Lfunc_end23-_ResultScreen
                                        ; -- End function
	.section	.text._LoadData,"ax",@progbits
	.globl	_LoadData                       ; -- Begin function LoadData
	.type	_LoadData,@function
_LoadData:                              ; @LoadData
; %bb.0:
	ld	hl, -1
	call	__frameset
	ld	hl, _.str.24.283
	ld	de, 1
	push	de
	push	hl
	call	_ReadNamed
	pop	hl
	pop	hl
	bit	0, a
	jr	nz, .LBB24_2
; %bb.1:
	ld	hl, _.str.26.285
	ld	de, 1
	push	de
	push	hl
	call	_ReadNamed
	pop	hl
	pop	hl
	bit	0, a
	jr	z, .LBB24_3
	.local	.LBB24_2
.LBB24_2:
	ld	a, 1
	ld	(ix - 1), a
	ld	hl, _disease
	ld	de, _effects
	push	de
	push	hl
	call	_CalculateEffects
	pop	hl
	pop	hl
	jr	.LBB24_4
	.local	.LBB24_3
.LBB24_3:
	xor	a, a
	ld	(ix - 1), a
	call	_ResetGameState
	.local	.LBB24_4
.LBB24_4:
	ld	a, (ix - 1)                     ; 1-byte Folded Reload
	inc	sp
	pop	ix
	ret
	.local	.Lfunc_end24
.Lfunc_end24:
	.size	_LoadData, .Lfunc_end24-_LoadData
                                        ; -- End function
	.section	.text._ReadNamed,"ax",@progbits
	.type	_ReadNamed,@function            ; -- Begin function ReadNamed
_ReadNamed:                             ; @ReadNamed
; %bb.0:
	ld	hl, -24
	call	__frameset
	ld	hl, (ix + 6)
	ld	de, _.str.25.284
	push	de
	push	hl
	call	_ti_Open
	ld	l, a
	pop	de
	pop	de
	ld	(ix - 1), l
	or	a, a
	jr	nz, .LBB25_2
; %bb.1:
	xor	a, a
	jp	.LBB25_6
	.local	.LBB25_2
.LBB25_2:
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
	jr	z, .LBB25_4
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
	jr	.LBB25_5
	.local	.LBB25_4
.LBB25_4:
	ld	hl, _region
	push	hl
	ld	hl, (ix - 21)
	push	hl
	call	_ValidateSave
	ld	(ix - 21), a                    ; 1-byte Folded Spill
	.local	.LBB25_5
.LBB25_5:
	pop	hl
	pop	hl
	ld	a, (ix - 1)
	ld	l, a
	push	hl
	call	_ti_Close
	pop	hl
	ld	a, (ix - 21)                    ; 1-byte Folded Reload
	.local	.LBB25_6
.LBB25_6:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end25
.Lfunc_end25:
	.size	_ReadNamed, .Lfunc_end25-_ReadNamed
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
	jr	z, .LBB26_2
; %bb.1:
	ld	a, 0
	jr	.LBB26_3
	.local	.LBB26_2
.LBB26_2:
	ld	a, -1
	.local	.LBB26_3
.LBB26_3:
	pop	ix
	ret
	.local	.Lfunc_end26
.Lfunc_end26:
	.size	_FileRead, .Lfunc_end26-_FileRead
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
	jr	z, .LBB27_2
; %bb.1:
	ld	a, 0
	jr	.LBB27_3
	.local	.LBB27_2
.LBB27_2:
	ld	a, -1
	.local	.LBB27_3
.LBB27_3:
	pop	ix
	ret
	.local	.Lfunc_end27
.Lfunc_end27:
	.size	_FileWrite, .Lfunc_end27-_FileWrite
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
	jr	nz, .LBB28_2
; %bb.1:
	ld	a, 0
	jr	.LBB28_3
	.local	.LBB28_2
.LBB28_2:
	ld	a, -1
	.local	.LBB28_3
.LBB28_3:
	pop	ix
	ret
	.local	.Lfunc_end28
.Lfunc_end28:
	.size	_FileSeek, .Lfunc_end28-_FileSeek
                                        ; -- End function
	.section	.text._SaveData,"ax",@progbits
	.globl	_SaveData                       ; -- Begin function SaveData
	.type	_SaveData,@function
_SaveData:                              ; @SaveData
; %bb.0:
	ld	hl, -22
	call	__frameset
	ld	de, _.str.27.286
	ld	hl, _.str.28.287
	push	hl
	push	de
	call	_ti_Open
	ld	l, a
	pop	de
	pop	de
	ld	(ix - 1), l
	or	a, a
	jr	nz, .LBB29_2
	.local	.LBB29_1
.LBB29_1:
	xor	a, a
	jp	.LBB29_9
	.local	.LBB29_2
.LBB29_2:
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
	ld	hl, _port
	push	hl
	ld	hl, _region
	push	hl
	ld	hl, _session
	push	hl
	ld	hl, _disease
	push	hl
	pea	ix - 17
	call	_EncodeSave
	ld	(ix - 21), a                    ; 1-byte Folded Spill
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
	jr	z, .LBB29_8
; %bb.3:
	or	a, a
	sbc	hl, hl
	push	hl
	ld	hl, _.str.27.286
	push	hl
	call	_ReadNamed
	pop	hl
	pop	hl
	bit	0, a
	jr	z, .LBB29_8
; %bb.4:
	ld	de, _.str.24.283
	or	a, a
	sbc	hl, hl
	push	hl
	push	de
	call	_ReadNamed
	pop	hl
	pop	hl
	bit	0, a
	jr	z, .LBB29_6
; %bb.5:
	ld	hl, _.str.26.285
	push	hl
	ld	hl, _.str.24.283
	push	hl
	call	_CopyNamed
	pop	hl
	pop	hl
	bit	0, a
	jp	z, .LBB29_1
	.local	.LBB29_6
.LBB29_6:
	ld	hl, _.str.24.283
	push	hl
	ld	hl, _.str.27.286
	push	hl
	call	_CopyNamed
	pop	hl
	pop	hl
	bit	0, a
	ld	a, 0
	jr	z, .LBB29_9
; %bb.7:
	ld	a, 1
	ld	(ix - 22), a
	.local	.LBB29_8
.LBB29_8:
	ld	hl, _.str.27.286
	push	hl
	call	_ti_Delete
	pop	hl
	ld	a, (ix - 22)                    ; 1-byte Folded Reload
	.local	.LBB29_9
.LBB29_9:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end29
.Lfunc_end29:
	.size	_SaveData, .Lfunc_end29-_SaveData
                                        ; -- End function
	.section	.text._CopyNamed,"ax",@progbits
	.type	_CopyNamed,@function            ; -- Begin function CopyNamed
_CopyNamed:                             ; @CopyNamed
; %bb.0:
	ld	hl, -50
	call	__frameset
	ld	hl, (ix + 6)
	ld	de, _.str.25.284
	push	de
	push	hl
	call	_ti_Open
	ld	e, a
	pop	hl
	pop	hl
	or	a, a
	jp	z, .LBB30_11
; %bb.1:
	push	de
	ld	(ix - 35), de
	call	_ti_GetSize
	ld	(ix - 41), l
	ld	(ix - 40), h
	pop	hl
	ld	hl, _.str.28.287
	push	hl
	ld	hl, (ix + 9)
	push	hl
	call	_ti_Open
	ld	e, a
	pop	hl
	pop	hl
	ld	(ix - 38), de
	or	a, a
	jr	nz, .LBB30_3
; %bb.2:
	ld	hl, (ix - 35)
	jp	.LBB30_10
	.local	.LBB30_3
.LBB30_3:
	lea	iy, ix - 32
	ld	de, 0
	ld	l, (ix - 41)
	ld	h, (ix - 40)
	ld	e, l
	ld	d, h
	.local	.LBB30_4
.LBB30_4:                               ; =>This Inner Loop Header: Depth=1
	sbc	hl, hl
	adc	hl, de
	jp	z, .LBB30_13
; %bb.5:                                ;   in Loop: Header=BB30_4 Depth=1
	push	de
	pop	hl
	push	de
	pop	bc
	ld	de, 32
	or	a, a
	sbc	hl, de
	ld	(ix - 41), bc
	ld	hl, (ix - 35)
	jr	c, .LBB30_7
; %bb.6:                                ;   in Loop: Header=BB30_4 Depth=1
	ld	bc, 32
	.local	.LBB30_7
.LBB30_7:                               ;   in Loop: Header=BB30_4 Depth=1
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
	jr	nz, .LBB30_9
; %bb.8:                                ;   in Loop: Header=BB30_4 Depth=1
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
	jr	z, .LBB30_4
	.local	.LBB30_9
.LBB30_9:
	ld	hl, (ix - 35)
	push	hl
	call	_ti_Close
	pop	hl
	ld	hl, (ix - 38)
	.local	.LBB30_10
.LBB30_10:
	push	hl
	call	_ti_Close
	pop	hl
	.local	.LBB30_11
.LBB30_11:
	xor	a, a
	.local	.LBB30_12
.LBB30_12:
	ld	sp, ix
	pop	ix
	ret
	.local	.LBB30_13
.LBB30_13:
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
	jr	.LBB30_12
	.local	.Lfunc_end30
.Lfunc_end30:
	.size	_CopyNamed, .Lfunc_end30-_CopyNamed
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
	.local	.LBB31_1
.LBB31_1:                               ; =>This Inner Loop Header: Depth=1
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	jr	z, .LBB31_3
; %bb.2:                                ;   in Loop: Header=BB31_1 Depth=1
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
	jr	.LBB31_1
	.local	.LBB31_3
.LBB31_3:
	lea	hl, iy + 0
	ld	e, (ix - 3)                     ; 1-byte Folded Reload
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end31
.Lfunc_end31:
	.size	_SaveSize, .Lfunc_end31-_SaveSize
                                        ; -- End function
	.section	.text._EncodeSave,"ax",@progbits
	.globl	_EncodeSave                     ; -- Begin function EncodeSave
	.type	_EncodeSave,@function
_EncodeSave:                            ; @EncodeSave
; %bb.0:
	ld	hl, -93
	call	__frameset
	ld	hl, 1875397
	ld	bc, 58
	xor	a, a
	lea	iy, ix - 9
	ld	(ix - 82), iy
	lea	iy, ix - 67
	lea	de, ix - 76
	ld	(ix - 85), de
	lea	de, ix - 79
	ld	(ix - 88), de
	ld	de, (ix + 6)
	ld	(ix - 9), de
	ld	(ix - 6), hl
	ld	(ix - 3), -127
	ld	(ix - 2), 1
	ld	(ix - 1), 1
	ld	(ix - 91), iy
	lea	de, iy + 0
	ld	hl, (ix + 9)
	ldir
	ld	de, (ix - 85)
	ld	hl, (ix + 12)
	ld	bc, 9
	ldir
	ld	(ix - 79), a
	ld	(ix - 78), a
	ld	(ix - 77), a
	ld	iy, (ix + 18)
	lea	iy, iy + 5
	ld	bc, 22
	ld	de, 0
	.local	.LBB32_1
.LBB32_1:                               ; =>This Inner Loop Header: Depth=1
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	jr	z, .LBB32_5
; %bb.2:                                ;   in Loop: Header=BB32_1 Depth=1
	bit	0, (iy)
	jr	z, .LBB32_4
; %bb.3:                                ;   in Loop: Header=BB32_1 Depth=1
	ld	(ix - 92), a                    ; 1-byte Folded Spill
	ld	a, (ix - 92)
	ld	l, 7
	and	a, l
	ld	b, a
	ld	a, 1
	call	__bshl
	ld	(ix - 93), a                    ; 1-byte Folded Spill
	push	de
	pop	hl
	ld	c, 3
	call	__ishru
	push	hl
	pop	bc
	ld	hl, (ix - 88)
	add	hl, bc
	ld	a, (hl)
	ld	c, (ix - 93)
	or	a, c
	ld	c, a
	ld	a, (ix - 92)                    ; 1-byte Folded Reload
	ld	(hl), c
	ld	bc, 22
	.local	.LBB32_4
.LBB32_4:                               ;   in Loop: Header=BB32_1 Depth=1
	inc	de
	lea	iy, iy + 6
	inc	a
	jr	.LBB32_1
	.local	.LBB32_5
.LBB32_5:
	ld	hl, (ix + 15)
	push	hl
	ld	hl, (ix - 82)
	push	hl
	call	_Header
	pop	hl
	pop	hl
	ld	hl, (ix - 88)
	push	hl
	ld	hl, (ix - 85)
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
	ld	bc, 112
	ld	de, 0
	.local	.LBB32_6
.LBB32_6:                               ; =>This Inner Loop Header: Depth=1
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	jr	z, .LBB32_8
; %bb.7:                                ;   in Loop: Header=BB32_6 Depth=1
	ld	hl, (ix + 15)
	add	hl, de
	ld	(ix - 88), hl
	push	hl
	ld	hl, (ix - 82)
	push	hl
	ld	(ix - 85), de
	call	_Geometry
	pop	hl
	pop	hl
	ld	iy, (ix - 88)
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
	ld	hl, (ix - 82)
	push	hl
	call	_Bytes
	ld	bc, 112
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (ix - 85)
	ld	de, 16
	add	hl, de
	ex	de, hl
	jr	.LBB32_6
	.local	.LBB32_8
.LBB32_8:
	ld	hl, (ix - 82)
	push	hl
	call	_Checksum
	pop	hl
	ld	a, (ix - 2)
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end32
.Lfunc_end32:
	.size	_EncodeSave, .Lfunc_end32-_EncodeSave
                                        ; -- End function
	.section	.text._Header,"ax",@progbits
	.type	_Header,@function               ; -- Begin function Header
_Header:                                ; @Header
; %bb.0:
	ld	hl, -13
	call	__frameset
	ld	de, (ix + 9)
	ld	hl, 5525059
	lea	bc, ix - 4
	ld	(ix - 12), bc
	ld	(ix - 4), hl
	ld	(ix - 1), 71
	ld	(ix - 5), 2
	push	de
	call	_SaveSize
	pop	bc
	ld	(ix - 9), hl
	ld	(ix - 6), e
	ld	hl, 4
	push	hl
	ld	hl, (ix - 12)
	push	hl
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
	pea	ix - 9
	ld	hl, (ix + 6)
	push	hl
	call	_U32
	pop	hl
	pop	hl
	ld	hl, 4
	push	hl
	ld	hl, _.str.94
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
	jr	nz, .LBB33_3
; %bb.1:
	ld	a, (ix - 5)
	cp	a, 2
	jr	nz, .LBB33_3
; %bb.2:
	ld	hl, (ix - 9)
	ld	(ix - 12), hl
	ld	a, (ix - 6)
	ld	(ix - 13), a
	ld	hl, (ix + 9)
	push	hl
	call	_SaveSize
	push	hl
	pop	bc
	ld	a, e
	pop	hl
	ld	hl, (ix - 12)
	ld	e, (ix - 13)                    ; 1-byte Folded Reload
	call	__lcmpu
	jr	z, .LBB33_4
	.local	.LBB33_3
.LBB33_3:
	ld	iy, (ix + 6)
	ld	(iy + 7), 0
	.local	.LBB33_4
.LBB33_4:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end33
.Lfunc_end33:
	.size	_Header, .Lfunc_end33-_Header
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
	jr	z, .LBB34_7
; %bb.1:
	ld	iy, (ix + 12)
	ld	a, (iy + 4)
	cp	a, 7
	jr	nc, .LBB34_7
; %bb.2:
	ld	a, (iy + 5)
	cp	a, 7
	jr	nc, .LBB34_7
; %bb.3:
	ld	a, (iy + 6)
	cp	a, -96
	jr	nc, .LBB34_7
; %bb.4:
	ld	a, (iy + 7)
	cp	a, 120
	jr	nc, .LBB34_7
; %bb.5:
	ld	a, (iy + 8)
	cp	a, 2
	jr	nc, .LBB34_7
; %bb.6:
	ld	iy, (ix + 15)
	ld	e, (iy + 2)
	ld	a, e
	cp	a, 64
	jr	c, .LBB34_9
	.local	.LBB34_7
.LBB34_7:
	ld	iy, (ix + 6)
	ld	(iy + 7), 0
	.local	.LBB34_8
.LBB34_8:
	pop	ix
	ret
	.local	.LBB34_9
.LBB34_9:
	ld	iy, (ix + 9)
	ld	a, (iy + 35)
	or	a, a
	jr	nz, .LBB34_8
; %bb.10:
	ld	hl, (ix + 15)
	ld	a, (hl)
	or	a, a
	jr	nz, .LBB34_7
; %bb.11:
	ld	iy, (ix + 15)
	ld	a, (iy + 1)
	or	a, e
	ld	l, a
	or	a, a
	jr	nz, .LBB34_7
	jr	.LBB34_8
	.local	.Lfunc_end34
.Lfunc_end34:
	.size	_State, .Lfunc_end34-_State
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
	jr	nz, .LBB35_4
; %bb.1:
	ld	l, (iy + 7)
	ld	a, (ix - 3)
	cp	a, l
	jr	nz, .LBB35_4
; %bb.2:
	ld	l, (iy + 8)
	ld	a, (ix - 2)
	cp	a, l
	jr	nz, .LBB35_4
; %bb.3:
	ld	l, (iy + 9)
	ld	a, (ix - 1)
	cp	a, l
	jr	z, .LBB35_5
	.local	.LBB35_4
.LBB35_4:
	ld	iy, (ix + 6)
	ld	(iy + 7), 0
	.local	.LBB35_5
.LBB35_5:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end35
.Lfunc_end35:
	.size	_Geometry, .Lfunc_end35-_Geometry
                                        ; -- End function
	.section	.text._Bytes,"ax",@progbits
	.type	_Bytes,@function                ; -- Begin function Bytes
_Bytes:                                 ; @Bytes
; %bb.0:
	ld	hl, -11
	call	__frameset
	ld	iy, (ix + 6)
	bit	0, (iy + 7)
	jp	z, .LBB36_8
; %bb.1:
	lea	hl, iy + 0
	ld	iy, (hl)
	lea	bc, iy + 0
	ld	de, (iy)
	push	hl
	pop	iy
	bit	0, (iy + 8)
	jr	z, .LBB36_3
; %bb.2:
	push	bc
	pop	iy
	ld	iy, (iy + 6)
	jr	.LBB36_4
	.local	.LBB36_3
.LBB36_3:
	push	bc
	pop	iy
	ld	iy, (iy + 3)
	.local	.LBB36_4
.LBB36_4:
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
	jr	z, .LBB36_8
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
	.local	.LBB36_6
.LBB36_6:                               ; =>This Inner Loop Header: Depth=1
	push	hl
	pop	bc
	sbc	hl, hl
	adc	hl, bc
	ld	iy, (ix + 6)
	jr	z, .LBB36_8
; %bb.7:                                ;   in Loop: Header=BB36_6 Depth=1
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
	jr	.LBB36_6
	.local	.LBB36_8
.LBB36_8:                               ; %.loopexit
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end36
.Lfunc_end36:
	.size	_Bytes, .Lfunc_end36-_Bytes
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
	jr	z, .LBB37_2
; %bb.1:
	ld	iy, (ix + 6)
	ld	(iy + 7), 0
	.local	.LBB37_2
.LBB37_2:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end37
.Lfunc_end37:
	.size	_Checksum, .Lfunc_end37-_Checksum
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
	jr	nz, .LBB38_3
; %bb.1:
	bit	0, (iy + 7)
	jr	z, .LBB38_3
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
	.local	.LBB38_3
.LBB38_3:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end38
.Lfunc_end38:
	.size	_U32, .Lfunc_end38-_U32
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
	jr	nz, .LBB39_3
; %bb.1:
	bit	0, (iy + 7)
	jr	z, .LBB39_3
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
	.local	.LBB39_3
.LBB39_3:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end39
.Lfunc_end39:
	.size	_U16, .Lfunc_end39-_U16
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
	.local	.Lfunc_end40
.Lfunc_end40:
	.size	_U8, .Lfunc_end40-_U8
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
	.local	.Lfunc_end41
.Lfunc_end41:
	.size	_ValidateSave, .Lfunc_end41-_ValidateSave
                                        ; -- End function
	.section	.text._ReadSave,"ax",@progbits
	.type	_ReadSave,@function             ; -- Begin function ReadSave
_ReadSave:                              ; @ReadSave
; %bb.0:
	ld	hl, -234
	call	__frameset
	ld	de, (ix + 6)
	ld	bc, 1875397
	lea	hl, ix - 75
	lea	iy, ix - 84
	ld	(ix - 16), de
	ld	(ix - 13), bc
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
	ld	(ix - 64), hl
	pop	ix
	ldir
	ld	(ix - 84), 0
	lea	de, iy + 0
	inc	de
	ld	bc, -195
	lea	hl, ix + 0
	add	hl, bc
	ld	(hl), iy
	lea	hl, iy + 0
	ld	bc, 8
	ldir
	ld	(ix - 87), 0
	ld	(ix - 86), 0
	ld	(ix - 85), 0
	ld	iy, (ix + 6)
	ld	hl, (iy + 12)
	push	ix
	lea	ix, ix - 128
	ld	(ix - 58), hl
	pop	ix
	ld	a, (iy + 15)
	ld	de, -189
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), a
	ld	hl, (ix + 15)
	push	hl
	call	_SaveSize
	push	hl
	pop	bc
	ld	a, e
	pop	hl
	ld	de, -186
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 61
	ld	e, (iy + 0)                     ; 1-byte Folded Reload
	call	__lcmpu
	jp	nz, .LBB42_34
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
	jp	z, .LBB42_35
; %bb.2:
	ld	de, -183
	lea	iy, ix + 0
	add	iy, de
	lea	de, ix - 16
	ld	bc, -186
	lea	hl, ix + 0
	add	hl, bc
	ld	(hl), de
	lea	hl, ix - 87
	push	ix
	lea	ix, ix - 128
	ld	(ix - 70), hl
	pop	ix
	lea	hl, ix - 119
	push	ix
	lea	ix, ix - 128
	ld	(ix - 86), hl
	pop	ix
	lea	hl, ix - 125
	push	ix
	lea	ix, ix - 128
	ld	(ix - 83), hl
	pop	ix
	ld	bc, -205
	lea	hl, ix + 0
	add	hl, bc
	ld	(hl), iy
	lea	hl, iy + 0
	ld	bc, -208
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), hl
	ld	hl, (ix + 15)
	push	hl
	push	de
	call	_Header
	pop	hl
	pop	hl
	ld	de, -198
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -195
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -192
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -186
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_State
	ld.sis	bc, 0
	ld	de, 7
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	a, (ix - 9)
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 71
	ld	(iy + 0), a
	ld	iyl, c
	ld	iyh, b
	push	ix
	lea	ix, ix - 128
	ld	(ix - 74), c
	ld	(ix - 73), b
	pop	ix
	or	a, a
	sbc	hl, hl
	xor	a, a
	push	ix
	lea	ix, ix - 128
	ld	(ix - 72), a                    ; 1-byte Folded Spill
	pop	ix
	.local	.LBB42_3
.LBB42_3:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB42_6 Depth 2
                                        ;       Child Loop BB42_12 Depth 3
	push	ix
	lea	ix, ix - 128
	ld	(ix - 61), hl
	pop	ix
	or	a, a
	sbc	hl, de
	jp	nc, .LBB42_36
; %bb.4:                                ;   in Loop: Header=BB42_3 Depth=1
	ld	de, -199
	lea	hl, ix + 0
	push	af
	add	hl, de
	pop	af
	bit	0, (hl)                         ; 1-byte Folded Reload
	jp	z, .LBB42_36
; %bb.5:                                ;   in Loop: Header=BB42_3 Depth=1
	ld	de, -221
	lea	hl, ix + 0
	add	hl, de
	push	de
	ld	e, iyl
	ld	d, iyh
	ld	(hl), e
	inc	hl
	ld	(hl), d
	dec	hl
	pop	de
	ld	de, -216
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), c
	ld	(iy + 1), b
	ld	de, -189
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de, hl
	ld	hl, (ix + 15)
	push	hl
	pop	iy
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
	push	ix
	lea	ix, ix - 128
	ld	(ix - 91), hl
	pop	ix
	ld	de, -227
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), iy
	push	iy
	ld	de, -186
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_Geometry
	ld	bc, -219
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	pop	hl
	pop	hl
	ld	hl, 1
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 61
	ld	bc, (iy + 0)
                                        ; kill: def $c killed $c killed $ubc
	call	__ishl
	ld	c, l
	ld	a, (ix - 9)
	or	a, a
	sbc	hl, hl
	.local	.LBB42_6
.LBB42_6:                               ;   Parent Loop BB42_3 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB42_12 Depth 3
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 96
	ld	(iy + 0), hl
	or	a, a
	sbc	hl, de
	jp	nc, .LBB42_32
; %bb.7:                                ;   in Loop: Header=BB42_6 Depth=2
	ld	de, -228
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), c                     ; 1-byte Folded Spill
	bit	0, a
	ld	de, 7
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 88
	ld	c, (iy + 0)
	ld	b, (iy + 1)
	push	ix
	lea	ix, ix - 128
	push	hl
	ld	l, (ix - 93)
	ld	h, (ix - 92)
	ex	(sp), hl
	pop	iy
	pop	ix
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 61)
	pop	ix
	jp	z, .LBB42_33
; %bb.8:                                ;   in Loop: Header=BB42_6 Depth=2
	ld	de, -219
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	ld	bc, -224
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	or	a, a
	sbc	hl, de
	push	hl
	pop	bc
	ld	de, 32
	or	a, a
	sbc	hl, de
	jr	c, .LBB42_10
; %bb.9:                                ;   in Loop: Header=BB42_6 Depth=2
	ld	bc, 32
	.local	.LBB42_10
.LBB42_10:                              ;   in Loop: Header=BB42_6 Depth=2
	ld	de, -231
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), bc
	push	bc
	ld	de, -214
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -186
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_Bytes
	pop	hl
	pop	hl
	pop	hl
	ld	a, (ix - 9)
	bit	0, a
	jp	z, .LBB42_32
; %bb.11:                               ; %.preheader7.preheader
                                        ;   in Loop: Header=BB42_6 Depth=2
	ld	bc, 0
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 88
	ld	e, (iy + 0)
	ld	d, (iy + 1)
	push	ix
	lea	ix, ix - 128
	ld	iy, (ix - 103)
	.local	.LBB42_12
.LBB42_12:                              ; %.preheader7
                                        ;   Parent Loop BB42_3 Depth=1
                                        ;     Parent Loop BB42_6 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	pop	ix
	lea	hl, iy + 0
	or	a, a
	sbc	hl, bc
	push	ix
	lea	ix, ix - 128
	ld	(ix - 88), e
	ld	(ix - 87), d
	pop	ix
	jp	z, .LBB42_26
; %bb.13:                               ;   in Loop: Header=BB42_12 Depth=3
	ld	de, -199
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), a                     ; 1-byte Folded Spill
	ld	de, -214
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	add	hl, bc
	ld	a, (hl)
	ld	de, -227
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	hl, (iy + 3)
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 96
	ld	de, (iy + 0)
	add	hl, de
	ld	de, -234
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), bc
	add	hl, bc
	ld	e, (hl)
	ld	l, a
	ld	a, e
	or	a, a
	jr	nz, .LBB42_15
; %bb.14:                               ;   in Loop: Header=BB42_12 Depth=3
	ld	a, l
	or	a, a
	jp	nz, .LBB42_27
	.local	.LBB42_15
.LBB42_15:                              ;   in Loop: Header=BB42_12 Depth=3
	ld	a, e
	or	a, a
	jr	z, .LBB42_19
; %bb.16:                               ;   in Loop: Header=BB42_12 Depth=3
	ld	a, l
	cp	a, 64
	jr	z, .LBB42_19
; %bb.17:                               ;   in Loop: Header=BB42_12 Depth=3
	ld	a, l
	cp	a, -1
	jr	z, .LBB42_19
; %bb.18:                               ;   in Loop: Header=BB42_12 Depth=3
	ld	a, l
	cp	a, -32
	jp	nz, .LBB42_27
	.local	.LBB42_19
.LBB42_19:                              ;   in Loop: Header=BB42_12 Depth=3
	ld	a, l
	cp	a, -32
	jr	nz, .LBB42_21
; %bb.20:                               ;   in Loop: Header=BB42_12 Depth=3
	ld	de, -221
	lea	iy, ix + 0
	add	iy, de
	ld	l, (iy + 0)
	ld	h, (iy + 1)
	inc.sis	hl
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), l
	ld	(iy + 1), h
	ld	de, -200
	lea	iy, ix + 0
	add	iy, de
	ld	l, (iy + 0)
	ld	bc, -228
	lea	iy, ix + 0
	add	iy, bc
	ld	e, (iy + 0)
	ld	a, l
	or	a, e
	ld	l, a
	ld	de, -200
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), l
	ld	de, -231
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	bc, -216
	lea	hl, ix + 0
	add	hl, bc
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	hl
	jr	.LBB42_25
	.local	.LBB42_21
.LBB42_21:                              ;   in Loop: Header=BB42_12 Depth=3
	ld	a, l
	cp	a, -1
	push	ix
	lea	ix, ix - 128
	ld	iy, (ix - 103)
	pop	ix
	push	ix
	lea	ix, ix - 128
	ld	e, (ix - 88)
	ld	d, (ix - 87)
	pop	ix
	jr	nz, .LBB42_23
; %bb.22:                               ;   in Loop: Header=BB42_12 Depth=3
	inc.sis	de
	jr	.LBB42_25
	.local	.LBB42_23
.LBB42_23:                              ;   in Loop: Header=BB42_12 Depth=3
	ld	a, l
	cp	a, 64
	jr	nz, .LBB42_25
; %bb.24:                               ;   in Loop: Header=BB42_12 Depth=3
	push	ix
	lea	ix, ix - 128
	ld	l, (ix - 74)
	ld	h, (ix - 73)
	pop	ix
	inc.sis	hl
	push	ix
	lea	ix, ix - 128
	ld	(ix - 74), l
	ld	(ix - 73), h
	pop	ix
	push	ix
	lea	ix, ix - 128
	ld	l, (ix - 72)
	pop	ix
	push	ix
	lea	ix, ix - 128
	ld	c, (ix - 100)
	pop	ix
	ld	a, l
	or	a, c
	ld	l, a
	push	ix
	lea	ix, ix - 128
	ld	(ix - 72), l
	pop	ix
	.local	.LBB42_25
.LBB42_25:                              ;   in Loop: Header=BB42_12 Depth=3
	push	ix
	lea	ix, ix - 128
	ld	bc, (ix - 106)
	pop	ix
	inc	bc
	push	ix
	lea	ix, ix - 128
	ld	a, (ix - 71)                    ; 1-byte Folded Reload
	jp	.LBB42_12
	.local	.LBB42_26
.LBB42_26:                              ;   in Loop: Header=BB42_6 Depth=2
	ld	bc, -219
	lea	hl, ix + 0
	add	hl, bc
	ld	de, (hl)
	jr	.LBB42_28
	.local	.LBB42_27
.LBB42_27:                              ;   in Loop: Header=BB42_6 Depth=2
	ld	(ix - 9), 0
	xor	a, a
	ld	bc, -219
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	ld	bc, -231
	lea	hl, ix + 0
	add	hl, bc
	ld	iy, (hl)
	.local	.LBB42_28
.LBB42_28:                              ; %.loopexit8
                                        ;   in Loop: Header=BB42_6 Depth=2
	bit	0, (ix + 21)
	jr	z, .LBB42_31
; %bb.29:                               ;   in Loop: Header=BB42_6 Depth=2
	bit	0, a
	jr	z, .LBB42_31
; %bb.30:                               ;   in Loop: Header=BB42_6 Depth=2
	ld	de, -227
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	hl, (iy + 3)
	ld	bc, -224
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	add	hl, de
	ld	bc, -231
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	push	de
	ld	bc, -214
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	push	de
	push	hl
	ld	de, -199
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), a                     ; 1-byte Folded Spill
	call	_memcpy
	ld	de, -231
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	bc, -219
	lea	hl, ix + 0
	add	hl, bc
	ld	de, (hl)
	ld	bc, -199
	lea	hl, ix + 0
	add	hl, bc
	ld	a, (hl)                         ; 1-byte Folded Reload
	pop	hl
	pop	hl
	pop	hl
	.local	.LBB42_31
.LBB42_31:                              ;   in Loop: Header=BB42_6 Depth=2
	push	ix
	lea	ix, ix - 128
	ld	bc, (ix - 96)
	pop	ix
	add	iy, bc
	push	ix
	lea	ix, ix - 128
	ld	c, (ix - 100)                   ; 1-byte Folded Reload
	pop	ix
	lea	hl, iy + 0
	jp	.LBB42_6
	.local	.LBB42_32
.LBB42_32:                              ;   in Loop: Header=BB42_3 Depth=1
	ld	de, 7
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 88
	ld	c, (iy + 0)
	ld	b, (iy + 1)
	push	ix
	lea	ix, ix - 128
	push	hl
	ld	l, (ix - 93)
	ld	h, (ix - 92)
	ex	(sp), hl
	pop	iy
	pop	ix
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 61)
	pop	ix
	.local	.LBB42_33
.LBB42_33:                              ;   in Loop: Header=BB42_3 Depth=1
	push	ix
	lea	ix, ix - 128
	ld	(ix - 71), a
	pop	ix
	inc	hl
	jp	.LBB42_3
	.local	.LBB42_34
.LBB42_34:
	xor	a, a
	.local	.LBB42_35
.LBB42_35:                              ; %.loopexit
	ld	sp, ix
	pop	ix
	ret
	.local	.LBB42_36
.LBB42_36:
	push	ix
	lea	ix, ix - 128
	ld	l, (ix - 74)
	ld	h, (ix - 73)
	pop	ix
	ld	(ix - 121), l
	ld	(ix - 120), h
	push	iy
	ex	(sp), hl
	ld	(ix - 123), l
	ld	(ix - 122), h
	pop	hl
	ld	(ix - 125), c
	ld	(ix - 124), b
	ld	de, -186
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_Checksum
	pop	hl
	ld	l, (ix - 45)
	ld	de, -200
	lea	iy, ix + 0
	add	iy, de
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	cp	a, l
	jr	nz, .LBB42_42
; %bb.37:
	or	a, a
	ld	l, -1
	ld	c, 0
	ld	e, l
	jr	nz, .LBB42_39
; %bb.38:
	ld	e, c
	.local	.LBB42_39
.LBB42_39:
	ld	a, (ix - 42)
	or	a, a
	jr	z, .LBB42_41
; %bb.40:
	ld	l, c
	.local	.LBB42_41
.LBB42_41:
	ld	a, e
	xor	a, l
	ld	l, a
	bit	0, l
	jr	nz, .LBB42_43
	.local	.LBB42_42
.LBB42_42:
	ld	(ix - 9), 0
	.local	.LBB42_43
.LBB42_43:
	ld	l, (ix - 41)
	ld	a, l
	or	a, a
	jp	z, .LBB42_47
; %bb.44:
	ld	bc, -208
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	ld	bc, -186
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), l                     ; 1-byte Folded Spill
	ld	bc, -192
	lea	iy, ix + 0
	add	iy, bc
	ld	hl, (iy + 0)
	ld	bc, 58
	ldir
	ld	de, -205
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	(iy + 34), 0
	push	hl
	push	hl
	dec	sp
	ex	de, hl
	ld	hl, 0
	add	hl, sp
	ex	de, hl
	inc	de
	ld	bc, 6
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 83
	ld	hl, (iy + 0)
	ldir
	ld	de, -208
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_EvaluateOutcome
	pop	hl
	pop	hl
	pop	hl
	inc	sp
	ld	de, -205
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	a, (iy + 34)
	ld	de, -186
	lea	iy, ix + 0
	add	iy, de
	ld	l, (iy + 0)
	cp	a, l
	jr	nz, .LBB42_46
; %bb.45:
	ld	a, (ix - 79)
	or	a, a
	jr	z, .LBB42_47
	.local	.LBB42_46
.LBB42_46:
	ld	(ix - 9), 0
	.local	.LBB42_47
.LBB42_47:
	ld	a, (ix - 9)
	bit	0, a
	jp	z, .LBB42_35
; %bb.48:
	bit	0, (ix + 21)
	jp	z, .LBB42_35
; %bb.49:
	ld	de, (ix + 9)
	ld	bc, -192
	lea	iy, ix + 0
	add	iy, bc
	ld	hl, (iy + 0)
	ld	bc, 58
	ldir
	ld	de, (ix + 12)
	ld	bc, -195
	lea	iy, ix + 0
	add	iy, bc
	ld	hl, (iy + 0)
	ld	bc, 9
	ldir
	ld	iy, (ix + 18)
	lea	iy, iy + 5
	ld	bc, 22
	ld	de, 0
	.local	.LBB42_50
.LBB42_50:                              ; =>This Inner Loop Header: Depth=1
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	jp	z, .LBB42_54
; %bb.51:                               ;   in Loop: Header=BB42_50 Depth=1
	push	de
	pop	hl
	ld	c, 3
	call	__ishru
	push	hl
	pop	bc
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 70)
	pop	ix
	add	hl, bc
	ld	a, (hl)
	ld	bc, -186
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
	jr	nz, .LBB42_53
; %bb.52:                               ;   in Loop: Header=BB42_50 Depth=1
	ld	a, 0
	.local	.LBB42_53
.LBB42_53:                              ;   in Loop: Header=BB42_50 Depth=1
	ld	(iy), a
	ld	bc, -186
	lea	hl, ix + 0
	add	hl, bc
	ld	de, (hl)
	inc	de
	lea	iy, iy + 6
	ld	bc, 22
	jp	.LBB42_50
	.local	.LBB42_54
.LBB42_54:
	ld	bc, 112
	ld	de, 0
	.local	.LBB42_55
.LBB42_55:                              ; %.preheader
                                        ; =>This Inner Loop Header: Depth=1
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	jr	z, .LBB42_57
; %bb.56:                               ;   in Loop: Header=BB42_55 Depth=1
	ld	hl, (ix + 15)
	add	hl, de
	push	hl
	ld	bc, -186
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), de
	call	_RecountRegion
	ld	bc, 112
	pop	hl
	ld	de, -186
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	ld	de, 16
	add	hl, de
	ex	de, hl
	jr	.LBB42_55
	.local	.LBB42_57
.LBB42_57:
	ld	a, 1
	jp	.LBB42_35
	.local	.Lfunc_end42
.Lfunc_end42:
	.size	_ReadSave, .Lfunc_end42-_ReadSave
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
	jr	z, .LBB43_2
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
	jr	.LBB43_3
	.local	.LBB43_2
.LBB43_2:
	xor	a, a
	.local	.LBB43_3
.LBB43_3:
	pop	ix
	ret
	.local	.Lfunc_end43
.Lfunc_end43:
	.size	_DecodeSave, .Lfunc_end43-_DecodeSave
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
	jr	nz, .LBB44_2
; %bb.1:
	ld	a, 1
	ld	(_optix_guidata+2), a
	.local	.LBB44_2
.LBB44_2:
	ld	a, (_optix_guicolors)
	ld	l, a
	push	hl
	call	_gfx_FillScreen
	pop	hl
	call	_optix_RenderButtons
	call	_optix_HandleCursor
	jp	_optix_CheckForAltKey
	.local	.Lfunc_end44
.Lfunc_end44:
	.size	_optix_HandleGUI, .Lfunc_end44-_optix_HandleGUI
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
	.local	.LBB45_1
.LBB45_1:                               ; =>This Inner Loop Header: Depth=1
	ld	a, (_optix_buttoninfo)
	ld	e, a
	lea	hl, iy + 0
	or	a, a
	sbc	hl, de
	jp	nc, .LBB45_8
; %bb.2:                                ;   in Loop: Header=BB45_1 Depth=1
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
	jp	nz, .LBB45_7
; %bb.3:                                ;   in Loop: Header=BB45_1 Depth=1
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
	jr	nz, .LBB45_5
; %bb.4:                                ;   in Loop: Header=BB45_1 Depth=1
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
	jr	.LBB45_6
	.local	.LBB45_5
.LBB45_5:                               ;   in Loop: Header=BB45_1 Depth=1
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
	.local	.LBB45_6
.LBB45_6:                               ;   in Loop: Header=BB45_1 Depth=1
	pop	hl
	pop	hl
	pop	hl
	.local	.LBB45_7
.LBB45_7:                               ;   in Loop: Header=BB45_1 Depth=1
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
	jp	.LBB45_1
	.local	.LBB45_8
.LBB45_8:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end45
.Lfunc_end45:
	.size	_optix_RenderButtons, .Lfunc_end45-_optix_RenderButtons
                                        ; -- End function
	.section	.text._optix_HandleCursor,"ax",@progbits
	.globl	_optix_HandleCursor             ; -- Begin function optix_HandleCursor
	.type	_optix_HandleCursor,@function
_optix_HandleCursor:                    ; @optix_HandleCursor
; %bb.0:
	call	_optix_HandleTrackPad
	ld	a, (_optix_cursor+3)
	bit	0, a
	jr	z, .LBB46_2
; %bb.1:
	call	_optix_UpdateCursor
	call	_optix_ClickCursor
	call	_optix_RenderCursor
	ret
	.local	.LBB46_2
.LBB46_2:
	call	_optix_UpdateSelectedButton
	call	_optix_ClickButton
	ret
	.local	.Lfunc_end46
.Lfunc_end46:
	.size	_optix_HandleCursor, .Lfunc_end46-_optix_HandleCursor
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
	.local	.LBB47_1
.LBB47_1:                               ; =>This Inner Loop Header: Depth=1
	ld	c, a
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	jr	nc, .LBB47_7
; %bb.2:                                ;   in Loop: Header=BB47_1 Depth=1
	ld	h, a
	ld	iy, (_optix_button)
	ld	bc, (ix - 3)
	add	iy, bc
	ld	l, (iy + 28)
	ld	a, (_optix_guidata+3)
	ld	c, a
	ld	a, l
	or	a, a
	jr	nz, .LBB47_4
; %bb.3:                                ;   in Loop: Header=BB47_1 Depth=1
	ld	a, h
	jr	.LBB47_6
	.local	.LBB47_4
.LBB47_4:                               ;   in Loop: Header=BB47_1 Depth=1
	ld	a, l
	cp	a, c
	ld	a, h
	jr	nz, .LBB47_6
; %bb.5:                                ;   in Loop: Header=BB47_1 Depth=1
	ld	hl, (iy + 25)
	ld	(ix - 6), de
	call	__indcallhl
	ld	de, (ix - 6)
	ld	a, (_optix_buttoninfo)
	.local	.LBB47_6
.LBB47_6:                               ;   in Loop: Header=BB47_1 Depth=1
	inc	de
	ld	hl, (ix - 3)
	ld	bc, 30
	add	hl, bc
	ld	(ix - 3), hl
	ld	bc, 0
	jr	.LBB47_1
	.local	.LBB47_7
.LBB47_7:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end47
.Lfunc_end47:
	.size	_optix_CheckForAltKey, .Lfunc_end47-_optix_CheckForAltKey
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
	jr	nz, .LBB48_2
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
	jr	.LBB48_15
	.local	.LBB48_2
.LBB48_2:
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
	jr	z, .LBB48_4
; %bb.3:
	ld	iyh, 0
	.local	.LBB48_4
.LBB48_4:
	ld	a, l
	cp	a, 4
	ld	c, -102
	ld	a, 51
	ld	(ix - 8), a
	jr	z, .LBB48_6
; %bb.5:
	ld	c, iyh
	.local	.LBB48_6
.LBB48_6:
	ld	a, l
	cp	a, 8
	ld	e, 120
	ld	a, 85
	ld	(ix - 11), a
	jr	z, .LBB48_8
; %bb.7:
	ld	e, c
	.local	.LBB48_8
.LBB48_8:
	ld	a, l
	cp	a, 16
	ld	c, 85
	jr	z, .LBB48_10
; %bb.9:
	ld	c, e
	.local	.LBB48_10
.LBB48_10:
	ld	a, l
	cp	a, 32
	ld	e, 51
	jr	z, .LBB48_12
; %bb.11:
	ld	e, c
	.local	.LBB48_12
.LBB48_12:
	ld	a, l
	cp	a, 64
	ld	l, 17
	ld	a, l
	jr	z, .LBB48_14
; %bb.13:
	ld	a, e
	.local	.LBB48_14
.LBB48_14:
	ld	(ix - 3), a
	ld.sis	de, 32
	ld.sis	bc, 255
	.local	.LBB48_15
.LBB48_15:
	ld	iy, -720874
	ld	l, (iy)
	ld	h, (iy + 1)
	ld	a, l
	or	a, a
	jr	z, .LBB48_31
; %bb.16:
	ld	l, (iy)
	ld	h, (iy + 1)
	call	__sand
	ld	a, l
	cp	a, 1
	ld	c, -34
	jr	z, .LBB48_18
; %bb.17:
	ld	c, (ix - 3)                     ; 1-byte Folded Reload
	.local	.LBB48_18
.LBB48_18:
	ld	a, l
	cp	a, 2
	ld	d, -68
	jr	z, .LBB48_20
; %bb.19:
	ld	d, c
	.local	.LBB48_20
.LBB48_20:
	ld	a, l
	cp	a, 4
	ld	c, -102
	jr	z, .LBB48_22
; %bb.21:
	ld	c, d
	.local	.LBB48_22
.LBB48_22:
	ld	a, l
	cp	a, 8
	ld	d, 120
	jr	z, .LBB48_24
; %bb.23:
	ld	d, c
	.local	.LBB48_24
.LBB48_24:
	ld	a, l
	cp	a, 16
	ld	c, 85
	jr	z, .LBB48_26
; %bb.25:
	ld	c, d
	.local	.LBB48_26
.LBB48_26:
	ld	a, l
	cp	a, 32
	ld	b, 51
	jr	z, .LBB48_28
; %bb.27:
	ld	b, c
	.local	.LBB48_28
.LBB48_28:
	ld	a, l
	cp	a, 64
	ld	l, 17
	ld	a, l
	jr	z, .LBB48_30
; %bb.29:
	ld	a, b
	.local	.LBB48_30
.LBB48_30:
	ld	(ix - 3), a
	ld.sis	de, 96
	ld.sis	bc, 255
	.local	.LBB48_31
.LBB48_31:
	ld	iy, -720872
	ld	l, (iy)
	ld	h, (iy + 1)
	ld	a, l
	or	a, a
	jr	z, .LBB48_47
; %bb.32:
	ld	l, (iy)
	ld	h, (iy + 1)
	call	__sand
	ld	a, l
	cp	a, 1
	ld	c, -34
	jr	z, .LBB48_34
; %bb.33:
	ld	c, (ix - 3)                     ; 1-byte Folded Reload
	.local	.LBB48_34
.LBB48_34:
	ld	a, l
	cp	a, 2
	ld	d, -68
	jr	z, .LBB48_36
; %bb.35:
	ld	d, c
	.local	.LBB48_36
.LBB48_36:
	ld	a, l
	cp	a, 4
	ld	c, -102
	jr	z, .LBB48_38
; %bb.37:
	ld	c, d
	.local	.LBB48_38
.LBB48_38:
	ld	a, l
	cp	a, 8
	ld	d, 120
	jr	z, .LBB48_40
; %bb.39:
	ld	d, c
	.local	.LBB48_40
.LBB48_40:
	ld	a, l
	cp	a, 16
	ld	c, 85
	jr	z, .LBB48_42
; %bb.41:
	ld	c, d
	.local	.LBB48_42
.LBB48_42:
	ld	a, l
	cp	a, 32
	ld	b, 51
	jr	z, .LBB48_44
; %bb.43:
	ld	b, c
	.local	.LBB48_44
.LBB48_44:
	ld	a, l
	cp	a, 64
	ld	l, 17
	ld	a, l
	jr	z, .LBB48_46
; %bb.45:
	ld	a, b
	.local	.LBB48_46
.LBB48_46:
	ld	(ix - 3), a
	ld.sis	de, 160
	ld.sis	bc, 255
	.local	.LBB48_47
.LBB48_47:
	ld	iy, -720870
	ld	l, (iy)
	ld	h, (iy + 1)
	ld	a, l
	or	a, a
	jr	nz, .LBB48_49
; %bb.48:
	ld	iy, -720868
	jr	.LBB48_64
	.local	.LBB48_49
.LBB48_49:
	ld	l, (iy)
	ld	h, (iy + 1)
	call	__sand
	ld	a, l
	cp	a, 1
	ld	c, -34
	jr	z, .LBB48_51
; %bb.50:
	ld	c, (ix - 3)                     ; 1-byte Folded Reload
	.local	.LBB48_51
.LBB48_51:
	ld	a, l
	cp	a, 2
	ld	d, -68
	jr	z, .LBB48_53
; %bb.52:
	ld	d, c
	.local	.LBB48_53
.LBB48_53:
	ld	a, l
	cp	a, 4
	ld	c, -102
	ld	iy, -720868
	jr	z, .LBB48_55
; %bb.54:
	ld	c, d
	.local	.LBB48_55
.LBB48_55:
	ld	a, l
	cp	a, 8
	ld	d, 120
	jr	z, .LBB48_57
; %bb.56:
	ld	d, c
	.local	.LBB48_57
.LBB48_57:
	ld	a, l
	cp	a, 16
	ld	c, 85
	jr	z, .LBB48_59
; %bb.58:
	ld	c, d
	.local	.LBB48_59
.LBB48_59:
	ld	a, l
	cp	a, 32
	ld	b, 51
	jr	z, .LBB48_61
; %bb.60:
	ld	b, c
	.local	.LBB48_61
.LBB48_61:
	ld	a, l
	cp	a, 64
	ld	l, 17
	ld	(ix - 3), l                     ; 1-byte Folded Spill
	jr	z, .LBB48_63
; %bb.62:
	ld	(ix - 3), b                     ; 1-byte Folded Spill
	.local	.LBB48_63
.LBB48_63:
	ld.sis	de, 224
	ld.sis	bc, 255
	.local	.LBB48_64
.LBB48_64:
	ld	l, (iy)
	ld	h, (iy + 1)
	ld	a, l
	or	a, a
	jr	nz, .LBB48_66
; %bb.65:
	ld	c, (ix - 3)                     ; 1-byte Folded Reload
	ex.sis	de, hl
	jr	.LBB48_81
	.local	.LBB48_66
.LBB48_66:
	ld	l, (iy)
	ld	h, (iy + 1)
	call	__sand
	ld	a, l
	cp	a, 1
	ld	e, -34
	jr	z, .LBB48_68
; %bb.67:
	ld	e, (ix - 3)                     ; 1-byte Folded Reload
	.local	.LBB48_68
.LBB48_68:
	ld	a, l
	cp	a, 2
	ld	c, -68
	jr	z, .LBB48_70
; %bb.69:
	ld	c, e
	.local	.LBB48_70
.LBB48_70:
	ld	a, l
	cp	a, 4
	jr	z, .LBB48_72
; %bb.71:
	ld	(ix - 6), c                     ; 1-byte Folded Spill
	.local	.LBB48_72
.LBB48_72:
	ld	a, l
	cp	a, 8
	jr	z, .LBB48_74
; %bb.73:
	ld	a, (ix - 6)
	ld	(ix - 5), a                     ; 1-byte Folded Spill
	.local	.LBB48_74
.LBB48_74:
	ld	a, l
	cp	a, 16
	ld	c, 17
	jr	z, .LBB48_76
; %bb.75:
	ld	a, (ix - 5)                     ; 1-byte Folded Reload
	ld	(ix - 11), a
	.local	.LBB48_76
.LBB48_76:
	ld	a, l
	cp	a, 32
	jr	z, .LBB48_78
; %bb.77:
	ld	a, (ix - 11)
	ld	(ix - 8), a                     ; 1-byte Folded Spill
	.local	.LBB48_78
.LBB48_78:
	ld	a, l
	cp	a, 64
	jr	z, .LBB48_80
; %bb.79:
	ld	c, (ix - 8)                     ; 1-byte Folded Reload
	.local	.LBB48_80
.LBB48_80:
	ld.sis	hl, 288
	.local	.LBB48_81
.LBB48_81:
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
	jr	z, .LBB48_85
; %bb.82:
	ld	a, c
	or	a, a
	jr	z, .LBB48_85
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
	jr	c, .LBB48_86
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
	jr	.LBB48_87
	.local	.LBB48_85
.LBB48_85:
	inc	e
	ld	a, e
	jp	.LBB48_88
	.local	.LBB48_86
.LBB48_86:
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
	.local	.LBB48_87
.LBB48_87:
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
	.local	.LBB48_88
.LBB48_88:
	ld	(_optix_guidata+13), a
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end48
.Lfunc_end48:
	.size	_optix_HandleTrackPad, .Lfunc_end48-_optix_HandleTrackPad
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
	jr	z, .LBB49_3
; %bb.1:
	push	hl
	pop	iy
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	jr	z, .LBB49_4
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
	jr	.LBB49_5
	.local	.LBB49_3
.LBB49_3:
	ld	(ix - 3), hl
	jr	.LBB49_5
	.local	.LBB49_4
.LBB49_4:
	ld	(ix - 3), iy
	.local	.LBB49_5
.LBB49_5:
	push	bc
	pop	iy
	ld.sis	de, 320
	ld	l, (iy)
	ld	h, (iy + 1)
	ld	a, l
	bit	2, a
	jr	z, .LBB49_9
; %bb.6:
	ld	iy, (ix - 3)
	ex	de, hl
	ld	e, iyl
	ld	d, iyh
	ex	de, hl
	or	a, a
	sbc.sis	hl, de
	jr	nc, .LBB49_8
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
	.local	.LBB49_8
.LBB49_8:
	push	bc
	pop	iy
	.local	.LBB49_9
.LBB49_9:
	ld.sis	bc, 1
	ld	l, (iy)
	ld	h, (iy + 1)
                                        ; kill: def $l killed $l killed $hl
	ld	a, (_optix_cursor+2)
	ld	e, a
	bit	3, l
	jr	z, .LBB49_12
; %bb.10:
	ld	a, e
	or	a, a
	jr	z, .LBB49_12
; %bb.11:
	ld	l, -2
	ld	a, e
	add	a, l
	ld	e, a
	ld	(_optix_cursor+2), a
	.local	.LBB49_12
.LBB49_12:
	ld	l, (iy)
	ld	h, (iy + 1)
	call	__sand
	bit	0, l
	jr	z, .LBB49_15
; %bb.13:
	ld	a, e
	cp	a, -16
	jr	nc, .LBB49_15
; %bb.14:
	ld	l, 2
	ld	a, e
	add	a, l
	ld	e, a
	ld	(_optix_cursor+2), a
	.local	.LBB49_15
.LBB49_15:
	ld	hl, (ix - 3)
	ld.sis	bc, 321
                                        ; kill: def $hl killed $hl killed $uhl
	or	a, a
	sbc.sis	hl, bc
	jr	c, .LBB49_17
; %bb.16:
	ld	hl, _optix_cursor
	ld.sis	bc, 320
	ld	(hl), c
	inc	hl
	ld	(hl), b
	.local	.LBB49_17
.LBB49_17:
	ld	a, e
	cp	a, -15
	jr	c, .LBB49_19
; %bb.18:
	ld	a, -16
	ld	(_optix_cursor+2), a
	.local	.LBB49_19
.LBB49_19:
	pop	hl
	pop	ix
	ret
	.local	.Lfunc_end49
.Lfunc_end49:
	.size	_optix_UpdateCursor, .Lfunc_end49-_optix_UpdateCursor
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
	jp	z, .LBB50_9
; %bb.1:
	ld	a, (_optix_guidata+2)
	bit	0, a
	jp	z, .LBB50_9
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
	.local	.LBB50_3
.LBB50_3:                               ; =>This Inner Loop Header: Depth=1
	sbc	hl, hl
	adc	hl, de
	jp	z, .LBB50_18
; %bb.4:                                ;   in Loop: Header=BB50_3 Depth=1
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
	jp	p, .LBB50_8
; %bb.5:                                ;   in Loop: Header=BB50_3 Depth=1
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
	jp	m, .LBB50_8
; %bb.6:                                ;   in Loop: Header=BB50_3 Depth=1
	ld	hl, (ix - 3)
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	jp	m, .LBB50_8
; %bb.7:                                ;   in Loop: Header=BB50_3 Depth=1
	ld	bc, 0
	ld	c, a
	ld	hl, (ix - 15)
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	jp	m, .LBB50_17
	.local	.LBB50_8
.LBB50_8:                               ;   in Loop: Header=BB50_3 Depth=1
	lea	iy, iy + 30
	ld	de, (ix - 9)
	dec	de
	jp	.LBB50_3
	.local	.LBB50_9
.LBB50_9:
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
	.local	.LBB50_10
.LBB50_10:                              ; =>This Inner Loop Header: Depth=1
	sbc	hl, hl
	adc	hl, bc
	jp	z, .LBB50_19
; %bb.11:                               ;   in Loop: Header=BB50_10 Depth=1
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
	jp	p, .LBB50_15
; %bb.12:                               ;   in Loop: Header=BB50_10 Depth=1
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
	jp	m, .LBB50_15
; %bb.13:                               ;   in Loop: Header=BB50_10 Depth=1
	ld	hl, (ix - 18)
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	m, .LBB50_15
; %bb.14:                               ;   in Loop: Header=BB50_10 Depth=1
	ld	de, 0
	ld	e, a
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	m, .LBB50_16
	.local	.LBB50_15
.LBB50_15:                              ;   in Loop: Header=BB50_10 Depth=1
	ld	d, (ix - 9)                     ; 1-byte Folded Reload
	ld	a, d
	ld	(_optix_buttoninfo+1), a
	ld	e, (ix - 3)                     ; 1-byte Folded Reload
	inc	e
	lea	iy, iy + 30
	ld	bc, (ix - 12)
	dec	bc
	jp	.LBB50_10
	.local	.LBB50_16
.LBB50_16:
	ld	a, (ix - 3)                     ; 1-byte Folded Reload
	ld	(_optix_buttoninfo+1), a
	jr	.LBB50_19
	.local	.LBB50_17
.LBB50_17:
	ld	hl, (iy + 25)
	call	__indcallhl
	.local	.LBB50_18
.LBB50_18:                              ; %.loopexit4
	xor	a, a
	ld	(_optix_guidata+2), a
	.local	.LBB50_19
.LBB50_19:                              ; %.loopexit
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end50
.Lfunc_end50:
	.size	_optix_ClickCursor, .Lfunc_end50-_optix_ClickCursor
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
	.local	.Lfunc_end51
.Lfunc_end51:
	.size	_optix_RenderCursor, .Lfunc_end51-_optix_RenderCursor
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
	jp	z, .LBB52_35
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
	jr	nz, .LBB52_6
; %bb.2:
	ld	hl, (ix - 9)
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	z, .LBB52_4
; %bb.3:
	ld	a, 0
	jr	.LBB52_5
	.local	.LBB52_4
.LBB52_4:
	ld	a, -1
	.local	.LBB52_5
.LBB52_5:
	bit	0, a
	jp	nz, .LBB52_35
	.local	.LBB52_6
.LBB52_6:
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
	.local	.LBB52_7
.LBB52_7:                               ; =>This Inner Loop Header: Depth=1
	sbc	hl, hl
	adc	hl, de
	jp	z, .LBB52_32
; %bb.8:                                ;   in Loop: Header=BB52_7 Depth=1
	ld	a, (iy + 28)
	or	a, a
	jp	nz, .LBB52_31
; %bb.9:                                ;   in Loop: Header=BB52_7 Depth=1
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
	jr	nz, .LBB52_12
; %bb.10:                               ;   in Loop: Header=BB52_7 Depth=1
	ld	de, (iy)
	ld	hl, (ix - 15)
	ld	bc, (hl)
	ld	l, e
	ld	h, d
	or	a, a
	sbc.sis	hl, bc
	jp	nc, .LBB52_15
; %bb.11:                               ;   in Loop: Header=BB52_7 Depth=1
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
	jr	.LBB52_16
	.local	.LBB52_12
.LBB52_12:                              ;   in Loop: Header=BB52_7 Depth=1
	push	bc
	pop	hl
	ld	de, 1
	or	a, a
	sbc	hl, de
	jr	nz, .LBB52_17
; %bb.13:                               ;   in Loop: Header=BB52_7 Depth=1
	ld	de, (iy)
	ld	hl, (ix - 15)
	ld	bc, (hl)
	ld	l, c
	ld	h, b
	ld	(ix - 29), de
	or	a, a
	sbc.sis	hl, de
	ld	de, (ix - 25)
	jp	nc, .LBB52_25
; %bb.14:                               ;   in Loop: Header=BB52_7 Depth=1
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
	jp	.LBB52_24
	.local	.LBB52_15
.LBB52_15:                              ;   in Loop: Header=BB52_7 Depth=1
	ld	bc, (ix - 3)
	ld	iy, 10000
	.local	.LBB52_16
.LBB52_16:                              ;   in Loop: Header=BB52_7 Depth=1
	ld	de, (ix - 25)
	jp	.LBB52_26
	.local	.LBB52_17
.LBB52_17:                              ;   in Loop: Header=BB52_7 Depth=1
	ld	bc, (ix - 9)
	push	bc
	pop	hl
	ld	de, -1
	or	a, a
	sbc	hl, de
	jr	nz, .LBB52_20
; %bb.18:                               ;   in Loop: Header=BB52_7 Depth=1
	ld	a, (iy + 2)
	lea	hl, iy + 0
	ld	iy, (ix - 15)
	ld	c, (iy + 2)
	cp	a, c
	ld	de, (ix - 25)
	jp	nc, .LBB52_25
; %bb.19:                               ;   in Loop: Header=BB52_7 Depth=1
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
	jr	.LBB52_23
	.local	.LBB52_20
.LBB52_20:                              ;   in Loop: Header=BB52_7 Depth=1
	push	bc
	pop	hl
	ld	de, 1
	or	a, a
	sbc	hl, de
	ld	bc, 10000
	ld	de, (ix - 25)
	ld	iy, (ix - 12)
	jr	nz, .LBB52_26
; %bb.21:                               ;   in Loop: Header=BB52_7 Depth=1
	ld	iy, (ix - 22)
	ld	c, (iy + 2)
	ld	iy, (ix - 15)
	ld	a, (iy + 2)
	cp	a, c
	jr	nc, .LBB52_25
; %bb.22:                               ;   in Loop: Header=BB52_7 Depth=1
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
	.local	.LBB52_23
.LBB52_23:                              ;   in Loop: Header=BB52_7 Depth=1
	ld	iy, 0
	lea	hl, iy + 0
	ld	l, c
	ld	h, b
	ld	iy, (ix - 15)
	ld	iy, (iy)
	ld	bc, 0
	ld	c, iyl
	ld	b, iyh
	.local	.LBB52_24
.LBB52_24:                              ;   in Loop: Header=BB52_7 Depth=1
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
	jr	.LBB52_26
	.local	.LBB52_25
.LBB52_25:                              ;   in Loop: Header=BB52_7 Depth=1
	ld	bc, (ix - 3)
	ld	iy, 10000
	.local	.LBB52_26
.LBB52_26:                              ;   in Loop: Header=BB52_7 Depth=1
	lea	hl, iy + 0
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	ld	a, (ix - 16)                    ; 1-byte Folded Reload
	jp	m, .LBB52_28
; %bb.27:                               ;   in Loop: Header=BB52_7 Depth=1
	ld	a, (ix - 26)                    ; 1-byte Folded Reload
	.local	.LBB52_28
.LBB52_28:                              ;   in Loop: Header=BB52_7 Depth=1
	lea	hl, iy + 0
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	ld	(ix - 12), iy
	ld	(ix - 3), iy
	ld	iy, (ix - 22)
	jp	m, .LBB52_30
; %bb.29:                               ;   in Loop: Header=BB52_7 Depth=1
	ld	(ix - 3), bc
	.local	.LBB52_30
.LBB52_30:                              ;   in Loop: Header=BB52_7 Depth=1
	ld	b, a
	ld	c, (ix - 16)                    ; 1-byte Folded Reload
	.local	.LBB52_31
.LBB52_31:                              ;   in Loop: Header=BB52_7 Depth=1
	lea	iy, iy + 30
	inc	c
	dec	de
	jp	.LBB52_7
	.local	.LBB52_32
.LBB52_32:
	ld	de, 5000
	ld	hl, (ix - 3)
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	p, .LBB52_34
; %bb.33:
	ld	a, b
	ld	(_optix_buttoninfo+1), a
	.local	.LBB52_34
.LBB52_34:
	xor	a, a
	ld	(_optix_guidata+2), a
	.local	.LBB52_35
.LBB52_35:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end52
.Lfunc_end52:
	.size	_optix_UpdateSelectedButton, .Lfunc_end52-_optix_UpdateSelectedButton
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
	jr	z, .LBB53_3
; %bb.1:
	ld	l, a
	ld	a, (_optix_guidata+2)
	bit	0, a
	ld	a, l
	jr	z, .LBB53_3
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
	.local	.LBB53_3
.LBB53_3:
	ret
	.local	.Lfunc_end53
.Lfunc_end53:
	.size	_optix_ClickButton, .Lfunc_end53-_optix_ClickButton
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
	jr	nz, .LBB54_2
; %bb.1:
	ld	de, 5
	jr	.LBB54_3
	.local	.LBB54_2
.LBB54_2:
	ld	de, 7
	.local	.LBB54_3
.LBB54_3:
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
	jr	nz, .LBB54_5
; %bb.4:
	ld	l, a
	.local	.LBB54_5
.LBB54_5:
	push	hl
	call	_gfx_SetTextFGColor
	pop	hl
	ld	hl, (ix - 3)
	ld	a, (hl)
	ld	(ix + 6), a
	ld	sp, ix
	pop	ix
	jp	_gfx_SetTextTransparentColor
	.local	.Lfunc_end54
.Lfunc_end54:
	.size	_optix_CusText, .Lfunc_end54-_optix_CusText
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
	.local	.Lfunc_end55
.Lfunc_end55:
	.size	_optix_WhiText, .Lfunc_end55-_optix_WhiText
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
	.local	.Lfunc_end56
.Lfunc_end56:
	.size	_optix_BlaText, .Lfunc_end56-_optix_BlaText
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
	.local	.Lfunc_end57
.Lfunc_end57:
	.size	_optix_SetDefaultColors, .Lfunc_end57-_optix_SetDefaultColors
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
	.local	.Lfunc_end58
.Lfunc_end58:
	.size	_optix_SetDefaultSettings, .Lfunc_end58-_optix_SetDefaultSettings
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
	.local	.Lfunc_end59
.Lfunc_end59:
	.size	_optix_VertScrollbar, .Lfunc_end59-_optix_VertScrollbar
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
	jr	z, .LBB60_2
; %bb.1:
	ld	a, (_optix_guicolors+3)
	ld	l, a
	push	hl
	call	_gfx_SetColor
	pop	hl
	.local	.LBB60_2
.LBB60_2:
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
	jp	p, .LBB60_5
; %bb.3:
	ld	hl, (ix + 6)
	add	hl, bc
	ld	(ix - 18), hl
	bit	0, a
	jp	z, .LBB60_7
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
	jp	.LBB60_8
	.local	.LBB60_5
.LBB60_5:
	bit	0, a
	jp	z, .LBB60_10
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
	jp	.LBB60_11
	.local	.LBB60_7
.LBB60_7:
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
	.local	.LBB60_8
.LBB60_8:
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
	jp	z, .LBB60_13
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
	jp	.LBB60_16
	.local	.LBB60_10
.LBB60_10:
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
	.local	.LBB60_11
.LBB60_11:
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
	jr	z, .LBB60_14
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
	jr	.LBB60_16
	.local	.LBB60_13
.LBB60_13:
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
	jr	.LBB60_15
	.local	.LBB60_14
.LBB60_14:
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
	.local	.LBB60_15
.LBB60_15:
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
	.local	.LBB60_16
.LBB60_16:
	push	hl
	call	_gfx_Rectangle
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end60
.Lfunc_end60:
	.size	_optix_Scrollbar, .Lfunc_end60-_optix_Scrollbar
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
	.local	.Lfunc_end61
.Lfunc_end61:
	.size	_optix_HorizScrollbar, .Lfunc_end61-_optix_HorizScrollbar
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
	.local	.Lfunc_end62
.Lfunc_end62:
	.size	_optix_RenderWindow, .Lfunc_end62-_optix_RenderWindow
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
	.local	.LBB63_1
.LBB63_1:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB63_2 Depth 2
	ld	(ix - 107), 0
	xor	a, a
	ld	de, -218
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), a                         ; 1-byte Folded Spill
	.local	.LBB63_2
.LBB63_2:                               ;   Parent Loop BB63_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	lea	de, iy + 0
	ld	e, c
	ld	d, b
	ld	hl, (ix + 6)
	add	hl, de
	ld	a, (hl)
	cp	a, 32
	jp	z, .LBB63_9
; %bb.3:                                ;   in Loop: Header=BB63_2 Depth=2
	ld	de, -215
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), c
	inc	hl
	ld	(hl), b
	dec	hl
	cp	a, 96
	jr	nz, .LBB63_5
; %bb.4:                                ;   in Loop: Header=BB63_2 Depth=2
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
	jp	nc, .LBB63_8
	.local	.LBB63_5
.LBB63_5:                               ;   in Loop: Header=BB63_2 Depth=2
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
	jr	nc, .LBB63_7
; %bb.6:                                ;   in Loop: Header=BB63_2 Depth=2
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
	jp	m, .LBB63_2
	jp	.LBB63_9
	.local	.LBB63_7
.LBB63_7:                               ;   in Loop: Header=BB63_1 Depth=1
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
	jr	.LBB63_9
	.local	.LBB63_8
.LBB63_8:                               ;   in Loop: Header=BB63_1 Depth=1
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
	.local	.LBB63_9
.LBB63_9:                               ; %.loopexit
                                        ;   in Loop: Header=BB63_1 Depth=1
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
	jr	nz, .LBB63_11
; %bb.10:                               ;   in Loop: Header=BB63_1 Depth=1
	ld	de, -213
	lea	hl, ix + 0
	add	hl, de
	ld	bc, (hl)
	ld	de, -218
	lea	hl, ix + 0
	add	hl, de
	ld	a, (hl)                         ; 1-byte Folded Reload
	jr	.LBB63_12
	.local	.LBB63_11
.LBB63_11:                              ;   in Loop: Header=BB63_1 Depth=1
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
	.local	.LBB63_12
.LBB63_12:                              ;   in Loop: Header=BB63_1 Depth=1
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
	jr	nc, .LBB63_14
; %bb.13:                               ;   in Loop: Header=BB63_1 Depth=1
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
	jr	.LBB63_15
	.local	.LBB63_14
.LBB63_14:                              ;   in Loop: Header=BB63_1 Depth=1
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
	.local	.LBB63_15
.LBB63_15:                              ;   in Loop: Header=BB63_1 Depth=1
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
	jp	m, .LBB63_1
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
	.local	.Lfunc_end63
.Lfunc_end63:
	.size	_optix_WordWrap, .Lfunc_end63-_optix_WordWrap
                                        ; -- End function
	.section	.text._optix_GetStringLength,"ax",@progbits
	.globl	_optix_GetStringLength          ; -- Begin function optix_GetStringLength
	.type	_optix_GetStringLength,@function
_optix_GetStringLength:                 ; @optix_GetStringLength
; %bb.0:
	call	__frameset0
	ld	iy, (ix + 6)
	ld	bc, 0
	.local	.LBB64_1
.LBB64_1:                               ; =>This Inner Loop Header: Depth=1
	push	bc
	pop	de
	lea	hl, iy + 0
	add	hl, de
	inc	bc
	ld	a, (hl)
	or	a, a
	jr	nz, .LBB64_1
; %bb.2:
	ex	de, hl
	pop	ix
	ret
	.local	.Lfunc_end64
.Lfunc_end64:
	.size	_optix_GetStringLength, .Lfunc_end64-_optix_GetStringLength
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
	jr	z, .LBB65_2
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
	.local	.LBB65_2
.LBB65_2:
	inc	sp
	pop	ix
	ret
	.local	.Lfunc_end65
.Lfunc_end65:
	.size	_optix_AddWordWrapLine, .Lfunc_end65-_optix_AddWordWrapLine
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
	.local	.LBB66_1
.LBB66_1:                               ; =>This Inner Loop Header: Depth=1
	push	hl
	pop	bc
	sbc	hl, hl
	adc	hl, de
	jp	z, .LBB66_9
; %bb.2:                                ;   in Loop: Header=BB66_1 Depth=1
	ld	l, (ix + 21)
	cp	a, l
	jp	nc, .LBB66_9
; %bb.3:                                ;   in Loop: Header=BB66_1 Depth=1
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
	jp	nz, .LBB66_6
; %bb.4:                                ;   in Loop: Header=BB66_1 Depth=1
	ld	hl, (iy + 0)
	ld	bc, -224
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	p, .LBB66_7
; %bb.5:                                ;   in Loop: Header=BB66_1 Depth=1
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
	jr	.LBB66_8
	.local	.LBB66_6
.LBB66_6:                               ;   in Loop: Header=BB66_1 Depth=1
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
	.local	.LBB66_7
.LBB66_7:                               ;   in Loop: Header=BB66_1 Depth=1
	ld	de, -237
	lea	iy, ix + 0
	add	iy, de
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	inc	de
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	.local	.LBB66_8
.LBB66_8:                               ;   in Loop: Header=BB66_1 Depth=1
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
	jp	.LBB66_1
	.local	.LBB66_9
.LBB66_9:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end66
.Lfunc_end66:
	.size	_optix_PrintWordWrap, .Lfunc_end66-_optix_PrintWordWrap
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
	jr	c, .LBB67_2
; %bb.1:
	push	af
	ld	a, (ix + 18)
	ld	iyl, a
	pop	af
	.local	.LBB67_2
.LBB67_2:
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
	.local	.LBB67_3
.LBB67_3:                               ; =>This Inner Loop Header: Depth=1
	call	_kb_AnyKey
	or	a, a
	jr	z, .LBB67_5
; %bb.4:                                ;   in Loop: Header=BB67_3 Depth=1
	call	_kb_Scan
	jr	.LBB67_3
	.local	.LBB67_5
.LBB67_5:
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
	.local	.LBB67_6
.LBB67_6:                               ; =>This Inner Loop Header: Depth=1
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
	jp	nz, .LBB67_33
; %bb.7:                                ;   in Loop: Header=BB67_6 Depth=1
	call	_kb_Scan
	ld	a, (ix + 18)
	ld	l, (ix - 12)
	cp	a, l
	jp	nc, .LBB67_23
; %bb.8:                                ;   in Loop: Header=BB67_6 Depth=1
	ld	hl, -720866
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	iy, (ix - 18)
	ld	a, iyl
	or	a, a
	ld	l, -1
	jr	nz, .LBB67_10
; %bb.9:                                ;   in Loop: Header=BB67_6 Depth=1
	ld	l, 0
	.local	.LBB67_10
.LBB67_10:                              ;   in Loop: Header=BB67_6 Depth=1
	ld	a, e
	bit	3, a
	ld	a, -1
	ld	c, 0
	jr	nz, .LBB67_12
; %bb.11:                               ;   in Loop: Header=BB67_6 Depth=1
	ld	a, 0
	.local	.LBB67_12
.LBB67_12:                              ;   in Loop: Header=BB67_6 Depth=1
	and	a, l
	ld	e, a
	bit	0, e
	ld	h, (ix - 24)                    ; 1-byte Folded Reload
	jr	nz, .LBB67_14
; %bb.13:                               ;   in Loop: Header=BB67_6 Depth=1
	ld	l, c
	jr	.LBB67_15
	.local	.LBB67_14
.LBB67_14:                              ;   in Loop: Header=BB67_6 Depth=1
	ld	l, 1
	ld	a, h
	and	a, l
	ld	l, a
	.local	.LBB67_15
.LBB67_15:                              ;   in Loop: Header=BB67_6 Depth=1
	ld	a, e
	and	a, h
	ld	e, a
	bit	0, e
	ld	e, c
	jr	nz, .LBB67_17
; %bb.16:                               ;   in Loop: Header=BB67_6 Depth=1
	ld	e, h
	.local	.LBB67_17
.LBB67_17:                              ;   in Loop: Header=BB67_6 Depth=1
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
	jr	z, .LBB67_22
; %bb.18:                               ;   in Loop: Header=BB67_6 Depth=1
	or	a, a
	sbc	hl, hl
	ld	l, d
	ld	bc, (ix - 48)
	sbc	hl, bc
	call	pe, __setflag
	jp	p, .LBB67_22
; %bb.19:                               ;   in Loop: Header=BB67_6 Depth=1
	bit	0, e
	ld	a, 0
	jr	nz, .LBB67_21
; %bb.20:                               ;   in Loop: Header=BB67_6 Depth=1
	ld	a, e
	.local	.LBB67_21
.LBB67_21:                              ;   in Loop: Header=BB67_6 Depth=1
	ld	(ix - 24), a
	ld	l, 1
	ld	a, e
	and	a, l
	ld	l, a
	ld	a, l
	add	a, d
	ld	l, a
	ld	(ix - 18), hl
	jr	.LBB67_23
	.local	.LBB67_22
.LBB67_22:                              ;   in Loop: Header=BB67_6 Depth=1
	ld	l, d
	ld	(ix - 18), hl
	ld	(ix - 24), e                    ; 1-byte Folded Spill
	.local	.LBB67_23
.LBB67_23:                              ;   in Loop: Header=BB67_6 Depth=1
	call	_kb_AnyKey
	or	a, a
	ld	a, 1
	jr	z, .LBB67_25
; %bb.24:                               ;   in Loop: Header=BB67_6 Depth=1
	ld	a, (ix - 24)                    ; 1-byte Folded Reload
	.local	.LBB67_25
.LBB67_25:                              ;   in Loop: Header=BB67_6 Depth=1
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
	jr	nc, .LBB67_32
; %bb.26:                               ;   in Loop: Header=BB67_6 Depth=1
	ld	de, (ix - 18)
	ld	a, e
	or	a, a
	jr	nz, .LBB67_28
; %bb.27:                               ;   in Loop: Header=BB67_6 Depth=1
	ld	(ix - 2), 25
	jr	.LBB67_31
	.local	.LBB67_28
.LBB67_28:                              ;   in Loop: Header=BB67_6 Depth=1
	or	a, a
	sbc	hl, hl
	ld	l, e
	ld	de, (ix - 48)
	sbc	hl, de
	call	pe, __setflag
	jp	p, .LBB67_30
; %bb.29:                               ;   in Loop: Header=BB67_6 Depth=1
	ld	(ix - 2), 18
	jr	.LBB67_31
	.local	.LBB67_30
.LBB67_30:                              ;   in Loop: Header=BB67_6 Depth=1
	ld	(ix - 2), 24
	.local	.LBB67_31
.LBB67_31:                              ;   in Loop: Header=BB67_6 Depth=1
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
	.local	.LBB67_32
.LBB67_32:                              ;   in Loop: Header=BB67_6 Depth=1
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
	jp	.LBB67_6
	.local	.LBB67_33
.LBB67_33:                              ; %.preheader
                                        ; =>This Inner Loop Header: Depth=1
	call	_kb_AnyKey
	or	a, a
	jr	z, .LBB67_35
; %bb.34:                               ;   in Loop: Header=BB67_33 Depth=1
	call	_kb_Scan
	jr	.LBB67_33
	.local	.LBB67_35
.LBB67_35:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end67
.Lfunc_end67:
	.size	_optix_Message, .Lfunc_end67-_optix_Message
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
	jr	c, .LBB68_2
; %bb.1:
	ld	l, (ix + 18)
	.local	.LBB68_2
.LBB68_2:
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
	.local	.LBB68_3
.LBB68_3:                               ; =>This Inner Loop Header: Depth=1
	call	_kb_AnyKey
	or	a, a
	jr	z, .LBB68_5
; %bb.4:                                ;   in Loop: Header=BB68_3 Depth=1
	call	_kb_Scan
	jr	.LBB68_3
	.local	.LBB68_5
.LBB68_5:
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
	.local	.LBB68_6
.LBB68_6:                               ; =>This Inner Loop Header: Depth=1
	ld	iy, (ix - 17)
	bit	0, (iy + 15)
	jr	z, .LBB68_9
; %bb.7:                                ;   in Loop: Header=BB68_6 Depth=1
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
	jr	nz, .LBB68_9
; %bb.8:                                ;   in Loop: Header=BB68_6 Depth=1
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
	jp	z, .LBB68_18
	.local	.LBB68_9
.LBB68_9:                               ;   in Loop: Header=BB68_6 Depth=1
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
	jr	nc, .LBB68_17
; %bb.10:                               ;   in Loop: Header=BB68_6 Depth=1
	ld	iy, (ix - 17)
	ld	l, (iy + 16)
	ld	a, l
	or	a, a
	jr	nz, .LBB68_13
; %bb.11:                               ;   in Loop: Header=BB68_6 Depth=1
	ld	l, (iy + 14)
	ld	de, (ix - 33)
	ld	a, e
	cp	a, l
	jr	nc, .LBB68_16
; %bb.12:                               ;   in Loop: Header=BB68_6 Depth=1
	ld	(ix - 2), 25
	jr	.LBB68_16
	.local	.LBB68_13
.LBB68_13:                              ;   in Loop: Header=BB68_6 Depth=1
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
	jp	p, .LBB68_15
; %bb.14:                               ;   in Loop: Header=BB68_6 Depth=1
	ld	(ix - 2), 18
	jr	.LBB68_16
	.local	.LBB68_15
.LBB68_15:                              ;   in Loop: Header=BB68_6 Depth=1
	ld	(ix - 2), 24
	.local	.LBB68_16
.LBB68_16:                              ;   in Loop: Header=BB68_6 Depth=1
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
	.local	.LBB68_17
.LBB68_17:                              ;   in Loop: Header=BB68_6 Depth=1
	ld	a, (_optix_guidata)
	ld	l, a
	push	hl
	call	_optix_RenderMenu
	pop	hl
	call	_gfx_SwapDraw
	jp	.LBB68_6
	.local	.LBB68_18
.LBB68_18:
	ld	a, (iy + 12)
	ld	(ix - 5), a
	call	_optix_DeleteLastMenu
	ld	a, (ix - 5)                     ; 1-byte Folded Reload
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end68
.Lfunc_end68:
	.size	_optix_Menu, .Lfunc_end68-_optix_Menu
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
	.local	.LBB69_1
.LBB69_1:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB69_3 Depth 2
	ld	iy, 0
	lea	hl, iy + 0
	ld	c, (ix - 102)
	ld	b, (ix - 101)
	ld	l, c
	ld	h, b
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	p, .LBB69_7
; %bb.2:                                ;   in Loop: Header=BB69_1 Depth=1
	ld	(ix - 115), de
	ld.sis	hl, 32
	ld	(ix - 100), l
	ld	(ix - 99), h
	ld	e, h
	ld	a, e
	.local	.LBB69_3
.LBB69_3:                               ;   Parent Loop BB69_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ld	(ix - 118), a
	lea	de, iy + 0
	ld	e, c
	ld	d, b
	ld	hl, (ix + 30)
	add	hl, de
	ld	a, (hl)
	cp	a, 96
	jr	z, .LBB69_5
; %bb.4:                                ;   in Loop: Header=BB69_3 Depth=2
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
	jr	nc, .LBB69_3
	jr	.LBB69_6
	.local	.LBB69_5
.LBB69_5:                               ;   in Loop: Header=BB69_1 Depth=1
	ld	a, (ix - 118)                   ; 1-byte Folded Reload
	.local	.LBB69_6
.LBB69_6:                               ;   in Loop: Header=BB69_1 Depth=1
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
	jp	.LBB69_1
	.local	.LBB69_7
.LBB69_7:
	ld	iy, (ix - 112)
	ld	a, (ix - 106)                   ; 1-byte Folded Reload
	ld	(iy - 6), a
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end69
.Lfunc_end69:
	.size	_optix_AddMenu, .Lfunc_end69-_optix_AddMenu
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
	jp	z, .LBB70_5
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
	.local	.LBB70_2
.LBB70_2:                               ; =>This Inner Loop Header: Depth=1
	ld	a, (iy + 14)
	ld	e, a
	ld	iy, (iy + 9)
	ld	hl, (ix - 3)
	or	a, a
	sbc	hl, de
	jr	nc, .LBB70_4
; %bb.3:                                ;   in Loop: Header=BB70_2 Depth=1
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
	jr	.LBB70_2
	.local	.LBB70_4
.LBB70_4:
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
	.local	.LBB70_5
.LBB70_5:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end70
.Lfunc_end70:
	.size	_optix_DeleteLastMenu, .Lfunc_end70-_optix_DeleteLastMenu
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
	jr	nz, .LBB71_2
; %bb.1:
	ld	a, 1
	ld	(_optix_guidata+2), a
	.local	.LBB71_2
.LBB71_2:
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
	jr	z, .LBB71_6
; %bb.3:
	ld	a, (_optix_guidata+2)
	bit	0, a
	jr	z, .LBB71_6
; %bb.4:
	ld	iy, (ix - 3)
	ld	a, (iy + 6)
	cp	a, 2
	jr	c, .LBB71_6
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
	.local	.LBB71_6
.LBB71_6:
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
	jr	z, .LBB71_10
; %bb.7:
	ld	a, (_optix_guidata+2)
	bit	0, a
	jr	z, .LBB71_10
; %bb.8:
	ld	iy, (ix - 3)
	ld	a, (iy + 6)
	cp	a, 2
	jr	c, .LBB71_10
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
	.local	.LBB71_10
.LBB71_10:
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
	jr	z, .LBB71_13
; %bb.11:
	ld	a, (_optix_guidata+2)
	bit	0, a
	jr	z, .LBB71_13
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
	.local	.LBB71_13
.LBB71_13:
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
	jr	z, .LBB71_16
; %bb.14:
	ld	a, (_optix_guidata+2)
	bit	0, a
	jr	z, .LBB71_16
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
	.local	.LBB71_16
.LBB71_16:
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
	jr	nz, .LBB71_18
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
	jr	z, .LBB71_19
	.local	.LBB71_18
.LBB71_18:
	ld	iy, (ix - 3)
	ld	(iy + 15), 1
	.local	.LBB71_19
.LBB71_19:
	ld	de, 0
	ld	hl, (ix - 6)
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	ld	bc, (ix - 3)
	jp	m, .LBB71_22
; %bb.20:
	push	bc
	pop	iy
	ld	a, (iy + 14)
	ld	de, 0
	ld	e, a
	ld	hl, (ix - 6)
	or	a, a
	sbc	hl, de
	jr	nc, .LBB71_22
; %bb.21:
	ld	hl, (ix - 6)
	ld	a, l
	push	bc
	pop	iy
	ld	(iy + 12), a
	.local	.LBB71_22
.LBB71_22:
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
	jp	p, .LBB71_26
; %bb.23:
	ld	l, (ix - 6)                     ; 1-byte Folded Reload
	ld	a, (ix - 7)                     ; 1-byte Folded Reload
	cp	a, 1
	ld	e, a
	jr	z, .LBB71_25
; %bb.24:
	ld	a, (ix - 12)                    ; 1-byte Folded Reload
	cp	a, 1
	jr	nz, .LBB71_30
	.local	.LBB71_25
.LBB71_25:
	inc	l
	jr	.LBB71_33
	.local	.LBB71_26
.LBB71_26:
	ld	e, (ix - 7)                     ; 1-byte Folded Reload
	ld	a, (ix - 11)                    ; 1-byte Folded Reload
	ld	l, (ix - 6)                     ; 1-byte Folded Reload
	cp	a, l
	jr	nc, .LBB71_34
; %bb.27:
	ld	a, e
	cp	a, 1
	jr	z, .LBB71_29
; %bb.28:
	ld	a, (ix - 12)                    ; 1-byte Folded Reload
	cp	a, 1
	jr	nz, .LBB71_31
	.local	.LBB71_29
.LBB71_29:
	dec	l
	jr	.LBB71_33
	.local	.LBB71_30
.LBB71_30:
	ld	a, e
	add	a, l
	jr	.LBB71_32
	.local	.LBB71_31
.LBB71_31:
	ld	a, l
	sub	a, e
	.local	.LBB71_32
.LBB71_32:
	ld	l, a
	.local	.LBB71_33
.LBB71_33:
	ld	iy, (ix - 3)
	ld	(iy + 16), l
	.local	.LBB71_34
.LBB71_34:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end71
.Lfunc_end71:
	.size	_optix_UpdateCurrMenu, .Lfunc_end71-_optix_UpdateCurrMenu
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
	.local	.LBB72_1
.LBB72_1:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB72_3 Depth 2
	ld	a, (iy + 6)
	push	bc
	pop	de
	ld	e, a
	ld	(ix - 6), hl
	or	a, a
	sbc	hl, de
	jp	nc, .LBB72_12
; %bb.2:                                ; %.preheader.preheader
                                        ;   in Loop: Header=BB72_1 Depth=1
	or	a, a
	sbc	hl, hl
	.local	.LBB72_3
.LBB72_3:                               ; %.preheader
                                        ;   Parent Loop BB72_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ld	iy, (ix - 3)
	ld	a, (iy + 5)
	push	bc
	pop	de
	ld	e, a
	ld	(ix - 10), hl
	or	a, a
	sbc	hl, de
	jp	nc, .LBB72_11
; %bb.4:                                ;   in Loop: Header=BB72_3 Depth=2
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
	jp	nz, .LBB72_9
; %bb.5:                                ;   in Loop: Header=BB72_3 Depth=2
	ld	a, l
	ld	l, (ix + 6)
	cp	a, l
	jp	nz, .LBB72_9
; %bb.6:                                ;   in Loop: Header=BB72_3 Depth=2
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
	jr	nz, .LBB72_8
; %bb.7:                                ;   in Loop: Header=BB72_3 Depth=2
	ld	l, a
	.local	.LBB72_8
.LBB72_8:                               ;   in Loop: Header=BB72_3 Depth=2
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
	jr	.LBB72_10
	.local	.LBB72_9
.LBB72_9:                               ;   in Loop: Header=BB72_3 Depth=2
	or	a, a
	sbc	hl, hl
	push	hl
	call	_optix_CusText
	.local	.LBB72_10
.LBB72_10:                              ;   in Loop: Header=BB72_3 Depth=2
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
	jp	nz, .LBB72_3
	.local	.LBB72_11
.LBB72_11:                              ;   in Loop: Header=BB72_1 Depth=1
	ld	hl, (ix - 6)
	inc	hl
	ld	iy, (ix - 3)
	jp	.LBB72_1
	.local	.LBB72_12
.LBB72_12:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end72
.Lfunc_end72:
	.size	_optix_RenderMenu, .Lfunc_end72-_optix_RenderMenu
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
	.local	.LBB73_1
.LBB73_1:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB73_24 Depth 2
                                        ;       Child Loop BB73_26 Depth 3
	ld	l, (iy)
	ld	h, (iy + 1)
	call	__sand
	bit	0, l
	jp	nz, .LBB73_34
; %bb.2:                                ;   in Loop: Header=BB73_1 Depth=1
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
	jp	nz, .LBB73_33
; %bb.3:                                ;   in Loop: Header=BB73_1 Depth=1
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
	jr	nz, .LBB73_5
; %bb.4:                                ;   in Loop: Header=BB73_1 Depth=1
	ex	de, hl
	ld	e, iyh
	ex	de, hl
	.local	.LBB73_5
.LBB73_5:                               ;   in Loop: Header=BB73_1 Depth=1
	ld	a, (ix - 6)                     ; 1-byte Folded Reload
	or	a, a
	ld	e, iyl
	ld	c, (ix - 12)                    ; 1-byte Folded Reload
	jr	nz, .LBB73_7
; %bb.6:                                ;   in Loop: Header=BB73_1 Depth=1
	ld	e, iyh
	.local	.LBB73_7
.LBB73_7:                               ;   in Loop: Header=BB73_1 Depth=1
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
	jr	nz, .LBB73_9
; %bb.8:                                ;   in Loop: Header=BB73_1 Depth=1
	ld	d, c
	.local	.LBB73_9
.LBB73_9:                               ;   in Loop: Header=BB73_1 Depth=1
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
	jr	nz, .LBB73_11
; %bb.10:                               ;   in Loop: Header=BB73_1 Depth=1
	ld	c, d
	.local	.LBB73_11
.LBB73_11:                              ;   in Loop: Header=BB73_1 Depth=1
	ld	hl, -720866
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, e
	bit	1, a
	ex	de, hl
	ld	e, iyl
	ex	de, hl
	jr	nz, .LBB73_13
; %bb.12:                               ;   in Loop: Header=BB73_1 Depth=1
	ex	de, hl
	ld	e, iyh
	ex	de, hl
	.local	.LBB73_13
.LBB73_13:                              ;   in Loop: Header=BB73_1 Depth=1
	ld	e, (ix - 9)                     ; 1-byte Folded Reload
	ld	a, e
	or	a, a
	ld	d, iyl
	jr	nz, .LBB73_15
; %bb.14:                               ;   in Loop: Header=BB73_1 Depth=1
	ld	d, iyh
	.local	.LBB73_15
.LBB73_15:                              ;   in Loop: Header=BB73_1 Depth=1
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
	jr	nz, .LBB73_17
; %bb.16:                               ;   in Loop: Header=BB73_1 Depth=1
	ld	d, c
	.local	.LBB73_17
.LBB73_17:                              ;   in Loop: Header=BB73_1 Depth=1
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
	jr	nz, .LBB73_19
; %bb.18:                               ;   in Loop: Header=BB73_1 Depth=1
	ex	de, hl
	ld	d, iyh
	ex	de, hl
	.local	.LBB73_19
.LBB73_19:                              ;   in Loop: Header=BB73_1 Depth=1
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
	jr	nz, .LBB73_21
; %bb.20:                               ;   in Loop: Header=BB73_1 Depth=1
	ld	(ix - 12), d                    ; 1-byte Folded Spill
	.local	.LBB73_21
.LBB73_21:                              ;   in Loop: Header=BB73_1 Depth=1
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
	jr	z, .LBB73_23
; %bb.22:                               ;   in Loop: Header=BB73_1 Depth=1
	bit	0, (ix - 12)                    ; 1-byte Folded Reload
	jp	nz, .LBB73_32
	.local	.LBB73_23
.LBB73_23:                              ;   in Loop: Header=BB73_1 Depth=1
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
	.local	.LBB73_24
.LBB73_24:                              ;   Parent Loop BB73_1 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB73_26 Depth 3
	push	bc
	pop	hl
	ld	de, 8
	or	a, a
	sbc	hl, de
	jr	z, .LBB73_29
; %bb.25:                               ;   in Loop: Header=BB73_24 Depth=2
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
	.local	.LBB73_26
.LBB73_26:                              ;   Parent Loop BB73_1 Depth=1
                                        ;     Parent Loop BB73_24 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	push	hl
	pop	bc
	ld	de, 241
	or	a, a
	sbc	hl, de
	jr	z, .LBB73_28
; %bb.27:                               ;   in Loop: Header=BB73_26 Depth=3
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
	jr	.LBB73_26
	.local	.LBB73_28
.LBB73_28:                              ;   in Loop: Header=BB73_24 Depth=2
	ld	bc, (ix - 23)
	inc	bc
	ld	l, 16
	ld	a, iyl
	add	a, l
	ld	iyl, a
	jr	.LBB73_24
	.local	.LBB73_29
.LBB73_29:                              ;   in Loop: Header=BB73_1 Depth=1
	ld	a, (ix - 19)                    ; 1-byte Folded Reload
	or	a, a
	ld	a, 1
	jr	z, .LBB73_31
; %bb.30:                               ;   in Loop: Header=BB73_1 Depth=1
	ld	a, (ix - 12)                    ; 1-byte Folded Reload
	.local	.LBB73_31
.LBB73_31:                              ;   in Loop: Header=BB73_1 Depth=1
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
	ld	hl, _.str.4.99
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
	ld	hl, _.str.4.99
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
	jp	.LBB73_1
	.local	.LBB73_32
.LBB73_32:
	xor	a, a
	ld	l, a
	ld	(ix - 3), hl
	.local	.LBB73_33
.LBB73_33:
	ld	a, (ix - 6)                     ; 1-byte Folded Reload
	.local	.LBB73_34
.LBB73_34:
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
	.local	.LBB73_35
.LBB73_35:                              ; =>This Inner Loop Header: Depth=1
	ld	l, (iy)
	ld	h, (iy + 1)
	ld.sis	bc, 1
	call	__sand
	bit	0, l
	jp	z, .LBB73_37
; %bb.36:                               ;   in Loop: Header=BB73_35 Depth=1
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
	jp	.LBB73_35
	.local	.LBB73_37
.LBB73_37:
	ld	a, e
	cp	a, 96
	jr	z, .LBB73_39
; %bb.38:
	ld	a, e
	cp	a, 126
	jr	nz, .LBB73_40
	.local	.LBB73_39
.LBB73_39:
	ld	hl, 10
	ex	de, hl
	push	de
	ld	hl, 150
	push	hl
	push	de
	ld	hl, _.str.6.101
	push	hl
	ld	hl, _.str.5.100
	push	hl
	call	_optix_Message
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	xor	a, a
	ld	e, a
	.local	.LBB73_40
.LBB73_40:
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
	.local	.Lfunc_end73
.Lfunc_end73:
	.size	_optix_InsertSpecialCharacter, .Lfunc_end73-_optix_InsertSpecialCharacter
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
	jp	z, .LBB74_37
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
	ld	hl, _.str.102
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
	.local	.LBB74_2
.LBB74_2:                               ; =>This Inner Loop Header: Depth=1
	call	_kb_AnyKey
	or	a, a
	jr	z, .LBB74_4
; %bb.3:                                ;   in Loop: Header=BB74_2 Depth=1
	call	_kb_Scan
	jr	.LBB74_2
	.local	.LBB74_4
.LBB74_4:
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
	.local	.LBB74_5
.LBB74_5:                               ; =>This Inner Loop Header: Depth=1
	call	_os_GetCSC
	ld	iyh, a
	cp	a, 9
	jp	z, .LBB74_34
; %bb.6:                                ;   in Loop: Header=BB74_5 Depth=1
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
	jp	p, .LBB74_9
; %bb.7:                                ;   in Loop: Header=BB74_5 Depth=1
	ld	a, e
	or	a, a
	jr	z, .LBB74_9
; %bb.8:                                ;   in Loop: Header=BB74_5 Depth=1
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
	.local	.LBB74_9
.LBB74_9:                               ;   in Loop: Header=BB74_5 Depth=1
	ld	a, iyh
	cp	a, 56
	jr	nz, .LBB74_12
; %bb.10:                               ;   in Loop: Header=BB74_5 Depth=1
	ld	hl, (ix - 25)
	ld	de, 1
	or	a, a
	sbc	hl, de
	call	pe, __setflag
	jp	m, .LBB74_12
; %bb.11:                               ;   in Loop: Header=BB74_5 Depth=1
	ld	iy, (_optix_stringinput)
	ld	de, (ix - 25)
	add	iy, de
	dec	de
	ld	(ix - 25), de
	ld	(iy - 1), 0
	jr	.LBB74_14
	.local	.LBB74_12
.LBB74_12:                              ;   in Loop: Header=BB74_5 Depth=1
	ld	a, iyh
	cp	a, 15
	jr	nz, .LBB74_15
; %bb.13:                               ;   in Loop: Header=BB74_5 Depth=1
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
	.local	.LBB74_14
.LBB74_14:                              ;   in Loop: Header=BB74_5 Depth=1
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
	jr	.LBB74_18
	.local	.LBB74_15
.LBB74_15:                              ;   in Loop: Header=BB74_5 Depth=1
	ld	a, iyh
	cp	a, 10
	jr	nz, .LBB74_18
; %bb.16:                               ;   in Loop: Header=BB74_5 Depth=1
	ld	de, (ix - 25)
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	jp	p, .LBB74_18
; %bb.17:                               ;   in Loop: Header=BB74_5 Depth=1
	ld	(ix - 25), de
	call	_optix_InsertSpecialCharacter
	ld	hl, (_optix_stringinput)
	ld	de, (ix - 25)
	add	hl, de
	inc	de
	ld	(ix - 25), de
	ld	(hl), a
	jr	.LBB74_14
	.local	.LBB74_18
.LBB74_18:                              ;   in Loop: Header=BB74_5 Depth=1
	ld	a, iyh
	cp	a, 48
	ld	l, 1
	jr	z, .LBB74_20
; %bb.19:                               ;   in Loop: Header=BB74_5 Depth=1
	ld	l, 0
	.local	.LBB74_20
.LBB74_20:                              ;   in Loop: Header=BB74_5 Depth=1
	ld	a, iyl
	add	a, l
	ld	l, a
	cp	a, 3
	ld	a, 0
	ld	de, (ix - 25)
	jr	nc, .LBB74_22
; %bb.21:                               ;   in Loop: Header=BB74_5 Depth=1
	ld	a, l
	.local	.LBB74_22
.LBB74_22:                              ;   in Loop: Header=BB74_5 Depth=1
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
	jp	nc, .LBB74_24
; %bb.23:                               ;   in Loop: Header=BB74_5 Depth=1
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
	.local	.LBB74_24
.LBB74_24:                              ;   in Loop: Header=BB74_5 Depth=1
	inc	e
	ld	a, e
	cp	a, 21
	ld	a, 0
	jr	nc, .LBB74_26
; %bb.25:                               ;   in Loop: Header=BB74_5 Depth=1
	ld	a, e
	.local	.LBB74_26
.LBB74_26:                              ;   in Loop: Header=BB74_5 Depth=1
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
	ld	hl, _.str.10.103
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
	jr	nz, .LBB74_28
; %bb.27:                               ;   in Loop: Header=BB74_5 Depth=1
	ld	(ix - 2), 65
	jr	.LBB74_33
	.local	.LBB74_28
.LBB74_28:                              ;   in Loop: Header=BB74_5 Depth=1
	ld	a, l
	cp	a, 1
	jr	nz, .LBB74_30
; %bb.29:                               ;   in Loop: Header=BB74_5 Depth=1
	ld	(ix - 2), 97
	jr	.LBB74_33
	.local	.LBB74_30
.LBB74_30:                              ;   in Loop: Header=BB74_5 Depth=1
	ld	a, l
	cp	a, 2
	jr	nz, .LBB74_32
; %bb.31:                               ;   in Loop: Header=BB74_5 Depth=1
	ld	(ix - 2), 49
	jr	.LBB74_33
	.local	.LBB74_32
.LBB74_32:                              ;   in Loop: Header=BB74_5 Depth=1
	ld	(ix - 2), 63
	.local	.LBB74_33
.LBB74_33:                              ;   in Loop: Header=BB74_5 Depth=1
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
	jp	.LBB74_5
	.local	.LBB74_34
.LBB74_34:                              ; %.preheader
                                        ; =>This Inner Loop Header: Depth=1
	call	_kb_AnyKey
	or	a, a
	jr	z, .LBB74_36
; %bb.35:                               ;   in Loop: Header=BB74_34 Depth=1
	call	_kb_Scan
	jr	.LBB74_34
	.local	.LBB74_36
.LBB74_36:
	ld	hl, (_optix_stringinput)
	.local	.LBB74_37
.LBB74_37:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end74
.Lfunc_end74:
	.size	_optix_GetStringInput, .Lfunc_end74-_optix_GetStringInput
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
	.local	.Lfunc_end75
.Lfunc_end75:
	.size	_optix_InitializeButtons, .Lfunc_end75-_optix_InitializeButtons
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
	jr	nz, .LBB76_2
; %bb.1:
	ld	hl, _.str.11.107
	ld	de, _.str.12.108
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
	jr	.LBB76_3
	.local	.LBB76_2
.LBB76_2:
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
	.local	.LBB76_3
.LBB76_3:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end76
.Lfunc_end76:
	.size	_optix_AddButton, .Lfunc_end76-_optix_AddButton
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
	.local	.LBB77_1
.LBB77_1:                               ; =>This Inner Loop Header: Depth=1
	ld	(ix - 6), hl
	lea	hl, iy + 0
	or	a, a
	sbc	hl, de
	lea	bc, iy + 0
	jr	nc, .LBB77_3
; %bb.2:                                ;   in Loop: Header=BB77_1 Depth=1
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
	jr	.LBB77_1
	.local	.LBB77_3
.LBB77_3:
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
	.local	.Lfunc_end77
.Lfunc_end77:
	.size	_optix_DeleteButton, .Lfunc_end77-_optix_DeleteButton
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
	.local	.LBB78_1
.LBB78_1:                               ; =>This Inner Loop Header: Depth=1
	lea	hl, iy + 0
	or	a, a
	sbc	hl, bc
	jr	z, .LBB78_9
; %bb.2:                                ;   in Loop: Header=BB78_1 Depth=1
	ld	(ix - 3), iy
	ld	iy, (ix + 6)
	ld	hl, (iy + 3)
	push	bc
	pop	de
	add	hl, bc
	ld	a, (hl)
	cp	a, -32
	jr	nz, .LBB78_4
; %bb.3:                                ;   in Loop: Header=BB78_1 Depth=1
	ld	l, (ix - 5)
	ld	h, (ix - 4)
	inc.sis	hl
	ld	(ix - 5), l
	ld	(ix - 4), h
	ld	(iy + 12), l
	ld	(iy + 13), h
	jr	.LBB78_8
	.local	.LBB78_4
.LBB78_4:                               ;   in Loop: Header=BB78_1 Depth=1
	cp	a, -1
	jr	nz, .LBB78_6
; %bb.5:                                ;   in Loop: Header=BB78_1 Depth=1
	ld	l, (ix - 7)
	ld	h, (ix - 6)
	inc.sis	hl
	ld	(ix - 7), l
	ld	(ix - 6), h
	ld	(iy + 10), l
	ld	(iy + 11), h
	jr	.LBB78_8
	.local	.LBB78_6
.LBB78_6:                               ;   in Loop: Header=BB78_1 Depth=1
	cp	a, 64
	jr	nz, .LBB78_8
; %bb.7:                                ;   in Loop: Header=BB78_1 Depth=1
	ld	l, (ix - 9)
	ld	h, (ix - 8)
	inc.sis	hl
	ld	(ix - 9), l
	ld	(ix - 8), h
	ld	(iy + 14), l
	ld	(iy + 15), h
	.local	.LBB78_8
.LBB78_8:                               ;   in Loop: Header=BB78_1 Depth=1
	push	de
	pop	bc
	inc	bc
	ld	iy, (ix - 3)
	jr	.LBB78_1
	.local	.LBB78_9
.LBB78_9:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end78
.Lfunc_end78:
	.size	_RecountRegion, .Lfunc_end78-_RecountRegion
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
	.local	.LBB79_1
.LBB79_1:                               ; =>This Inner Loop Header: Depth=1
	ld	hl, (ix - 3)
	push	de
	pop	bc
	or	a, a
	sbc	hl, de
	jp	z, .LBB79_3
; %bb.2:                                ;   in Loop: Header=BB79_1 Depth=1
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
	jp	.LBB79_1
	.local	.LBB79_3
.LBB79_3:
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
	.local	.Lfunc_end79
.Lfunc_end79:
	.size	_CountWorld, .Lfunc_end79-_CountWorld
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
	jr	nc, .LBB80_8
; %bb.1:
	ld	b, (ix + 12)
	ld	hl, (iy + 3)
	ld	(ix - 3), hl
	add	hl, de
	ld	c, (hl)
	ld	a, b
	cp	a, -32
	jr	nz, .LBB80_4
; %bb.2:
	ld	a, c
	cp	a, -1
	jr	nz, .LBB80_4
; %bb.3:
	ld	bc, 10
	ld	de, 12
	jr	.LBB80_7
	.local	.LBB80_4
.LBB80_4:
	ld	a, b
	cp	a, 64
	jr	nz, .LBB80_8
; %bb.5:
	ld	a, c
	cp	a, -32
	ld	a, 0
	jr	nz, .LBB80_9
; %bb.6:
	ld	hl, 14
	ld	bc, 12
	ex	de, hl
	.local	.LBB80_7
.LBB80_7:
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
	jr	.LBB80_9
	.local	.LBB80_8
.LBB80_8:
	xor	a, a
	.local	.LBB80_9
.LBB80_9:
	pop	hl
	pop	ix
	ret
	.local	.Lfunc_end80
.Lfunc_end80:
	.size	_SetCell, .Lfunc_end80-_SetCell
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
	.local	.LBB81_1
.LBB81_1:                               ; =>This Inner Loop Header: Depth=1
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	jp	z, .LBB81_9
; %bb.2:                                ;   in Loop: Header=BB81_1 Depth=1
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
	jp	m, .LBB81_7
; %bb.3:                                ;   in Loop: Header=BB81_1 Depth=1
	lea	hl, iy + 0
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	jp	m, .LBB81_7
; %bb.4:                                ;   in Loop: Header=BB81_1 Depth=1
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
	jr	nc, .LBB81_7
; %bb.5:                                ;   in Loop: Header=BB81_1 Depth=1
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
	jr	nc, .LBB81_7
; %bb.6:                                ;   in Loop: Header=BB81_1 Depth=1
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
	jr	nz, .LBB81_8
	.local	.LBB81_7
.LBB81_7:                               ;   in Loop: Header=BB81_1 Depth=1
	ld	de, (ix - 6)
	inc	de
	ld	iy, (ix - 3)
	lea	iy, iy + 16
	ld	bc, 7
	xor	a, a
	jp	.LBB81_1
	.local	.LBB81_8
.LBB81_8:
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
	.local	.LBB81_9
.LBB81_9:                               ; %.loopexit
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end81
.Lfunc_end81:
	.size	_InfectCoordinate, .Lfunc_end81-_InfectCoordinate
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
	jr	c, .LBB82_2
; %bb.1:
	ld	a, l
	jr	.LBB82_5
	.local	.LBB82_2
.LBB82_2:
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
	jr	z, .LBB82_4
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
	jr	nz, .LBB82_6
	.local	.LBB82_4
.LBB82_4:
	xor	a, a
	.local	.LBB82_5
.LBB82_5:                               ; %.loopexit
	ld	sp, ix
	pop	ix
	ret
	.local	.LBB82_6
.LBB82_6:
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
	.local	.LBB82_7
.LBB82_7:                               ; =>This Inner Loop Header: Depth=1
	ld	(ix - 9), hl
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	z, .LBB82_4
; %bb.8:                                ;   in Loop: Header=BB82_7 Depth=1
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
	jr	z, .LBB82_7
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
	jp	.LBB82_5
	.local	.Lfunc_end82
.Lfunc_end82:
	.size	_SeedRegion, .Lfunc_end82-_SeedRegion
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
	.local	.LBB83_1
.LBB83_1:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB83_3 Depth 2
	ld	a, (iy + 6)
	push	de
	pop	bc
	ld	e, a
	ld	(ix - 3), hl
	or	a, a
	sbc	hl, de
	jp	nc, .LBB83_19
; %bb.2:                                ; %.preheader.preheader
                                        ;   in Loop: Header=BB83_1 Depth=1
	push	bc
	pop	hl
	.local	.LBB83_3
.LBB83_3:                               ; %.preheader
                                        ;   Parent Loop BB83_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	push	bc
	pop	de
	ld	a, (iy + 7)
	ld	e, a
	push	hl
	pop	bc
	or	a, a
	sbc	hl, de
	jp	nc, .LBB83_18
; %bb.4:                                ;   in Loop: Header=BB83_3 Depth=2
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
	jp	nz, .LBB83_17
; %bb.5:                                ;   in Loop: Header=BB83_3 Depth=2
	ld	hl, (ix + 9)
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	jp	z, .LBB83_13
; %bb.6:                                ;   in Loop: Header=BB83_3 Depth=2
	ld	hl, (ix + 9)
                                        ; kill: def $hl killed $hl killed $uhl
	ld.sis	de, 10000
	or	a, a
	sbc.sis	hl, de
	jr	nc, .LBB83_8
; %bb.7:                                ; %Roll.exit
                                        ;   in Loop: Header=BB83_3 Depth=2
	ld	hl, 10000
	push	hl
	ld	hl, (ix + 15)
	call	__indcallhl
	pop	de
	ld	de, (ix + 9)
	or	a, a
	sbc.sis	hl, de
	jp	nc, .LBB83_13
	.local	.LBB83_8
.LBB83_8:                               ; %Roll.exit.thread
                                        ;   in Loop: Header=BB83_3 Depth=2
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
	jr	nc, .LBB83_13
; %bb.9:                                ; %Roll.exit.thread
                                        ;   in Loop: Header=BB83_3 Depth=2
	bit	0, a
	jr	z, .LBB83_13
; %bb.10:                               ;   in Loop: Header=BB83_3 Depth=2
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
	jr	c, .LBB83_13
; %bb.11:                               ;   in Loop: Header=BB83_3 Depth=2
	ld	iy, (ix + 6)
	ld	a, (iy + 7)
	or	a, a
	sbc	hl, hl
	ld	l, a
	sbc	hl, de
	ld	hl, (ix - 18)
	jr	c, .LBB83_13
; %bb.12:                               ;   in Loop: Header=BB83_3 Depth=2
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
	.local	.LBB83_13
.LBB83_13:                              ; %Roll.exit.thread5
                                        ;   in Loop: Header=BB83_3 Depth=2
	ld	hl, (ix + 12)
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	ld	iy, (ix + 6)
	jp	z, .LBB83_17
; %bb.14:                               ;   in Loop: Header=BB83_3 Depth=2
	ld	hl, (ix + 12)
                                        ; kill: def $hl killed $hl killed $uhl
	ld.sis	de, 10000
	or	a, a
	sbc.sis	hl, de
	jr	nc, .LBB83_16
; %bb.15:                               ; %Roll.exit4
                                        ;   in Loop: Header=BB83_3 Depth=2
	ld	hl, 10000
	push	hl
	ld	hl, (ix + 15)
	call	__indcallhl
	ld	iy, (ix + 6)
	pop	de
	ld	de, (ix + 12)
	or	a, a
	sbc.sis	hl, de
	jr	nc, .LBB83_17
	.local	.LBB83_16
.LBB83_16:                              ; %Roll.exit4.thread
                                        ;   in Loop: Header=BB83_3 Depth=2
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
	.local	.LBB83_17
.LBB83_17:                              ; %Roll.exit4.thread6
                                        ;   in Loop: Header=BB83_3 Depth=2
	ld	hl, (ix - 6)
	inc	hl
	ld	bc, 0
	jp	.LBB83_3
	.local	.LBB83_18
.LBB83_18:                              ;   in Loop: Header=BB83_1 Depth=1
	ld	hl, (ix - 3)
	inc	hl
	ld	iy, (ix + 6)
	ld	de, 0
	jp	.LBB83_1
	.local	.LBB83_19
.LBB83_19:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end83
.Lfunc_end83:
	.size	_StepRegion, .Lfunc_end83-_StepRegion
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
	jr	c, .LBB84_2
; %bb.1:
	ld	hl, 10000
	.local	.LBB84_2
.LBB84_2:
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
	jr	z, .LBB84_4
; %bb.3:
	ld	a, 0
	jr	.LBB84_5
	.local	.LBB84_4
.LBB84_4:
	ld	a, -1
	.local	.LBB84_5
.LBB84_5:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end84
.Lfunc_end84:
	.size	_StepWorldRegion, .Lfunc_end84-_StepWorldRegion
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
	jp	nc, .LBB85_8
; %bb.1:
	ld	a, (iy + 3)
	dec	a
	cp	a, 3
	jp	nc, .LBB85_8
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
	jp	m, .LBB85_7
; %bb.3:
	lea	hl, iy + 0
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	jp	m, .LBB85_7
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
	jr	nc, .LBB85_7
; %bb.5:
	ld	iy, (ix - 3)
	ld	e, (iy + 7)
	ld	bc, (ix - 9)
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	ld	l, 0
	jr	nc, .LBB85_8
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
	jr	nz, .LBB85_9
	.local	.LBB85_7
.LBB85_7:
	ld	l, 0
	.local	.LBB85_8
.LBB85_8:
	ld	a, l
	ld	sp, ix
	pop	ix
	ret
	.local	.LBB85_9
.LBB85_9:
	ld	l, -1
	jr	.LBB85_8
	.local	.Lfunc_end85
.Lfunc_end85:
	.size	_ValidPort, .Lfunc_end85-_ValidPort
                                        ; -- End function
	.section	.text._Transport,"ax",@progbits
	.globl	_Transport                      ; -- Begin function Transport
	.type	_Transport,@function
_Transport:                             ; @Transport
; %bb.0:
	ld	hl, -32
	call	__frameset
	ld	iy, (ix + 18)
	ld	hl, 2
	push	hl
	call	__indcall
	pop	de
	ld	(ix - 19), l
	ld	(ix - 18), h
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	jr	z, .LBB86_2
; %bb.1:
	ld	c, 0
	jr	.LBB86_3
	.local	.LBB86_2
.LBB86_2:
	ld	c, 1
	.local	.LBB86_3
.LBB86_3:
	ld	d, 0
	ld	e, -1
	ld	hl, 24
	ld	(ix - 17), hl
	ld	iy, 0
	xor	a, a
	ld	(ix - 7), a
	inc	c
	ld	(ix - 10), c
	ld	hl, (ix + 24)
	ld	(hl), a
	ld	hl, (ix + 21)
	ld	(hl), a
	ld	bc, 132
	ld	a, d
	ld	(ix - 22), d                    ; 1-byte Folded Spill
	ld	(ix - 14), e                    ; 1-byte Folded Spill
	ld	(ix - 6), e                     ; 1-byte Folded Spill
	lea	de, iy + 0
	.local	.LBB86_4
.LBB86_4:                               ; =>This Inner Loop Header: Depth=1
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	jp	z, .LBB86_15
; %bb.5:                                ;   in Loop: Header=BB86_4 Depth=1
	ld	iy, (ix + 9)
	add	iy, de
	ld	(ix - 13), iy
	bit	0, (iy + 5)
	ld	l, (ix - 10)                    ; 1-byte Folded Reload
	jr	nz, .LBB86_14
; %bb.6:                                ;   in Loop: Header=BB86_4 Depth=1
	ld	(ix - 23), a                    ; 1-byte Folded Spill
	ld	iy, (ix - 13)
	ld	a, (iy + 3)
	and	a, l
	ld	l, a
	or	a, a
	jr	nz, .LBB86_8
; %bb.7:                                ;   in Loop: Header=BB86_4 Depth=1
	ld	a, (ix - 23)                    ; 1-byte Folded Reload
	jr	.LBB86_14
	.local	.LBB86_8
.LBB86_8:                               ;   in Loop: Header=BB86_4 Depth=1
	ld	(ix - 26), de
	ld	hl, (ix - 13)
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_ValidPort
	pop	hl
	pop	hl
	bit	0, a
	jr	z, .LBB86_13
; %bb.9:                                ;   in Loop: Header=BB86_4 Depth=1
	ld	iy, (ix - 13)
	ld	a, (iy + 2)
	ld	de, 0
	push	de
	pop	hl
	ld	l, a
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
	jr	z, .LBB86_13
; %bb.10:                               ;   in Loop: Header=BB86_4 Depth=1
	ld	a, (ix - 22)                    ; 1-byte Folded Reload
	inc	a
	ld	(ix - 22), a                    ; 1-byte Folded Spill
	ld	e, a
	push	de
	ld	hl, (ix + 18)
	call	__indcallhl
	pop	de
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	ld	a, (ix - 23)                    ; 1-byte Folded Reload
	jr	z, .LBB86_12
; %bb.11:                               ;   in Loop: Header=BB86_4 Depth=1
	ld	a, (ix - 6)                     ; 1-byte Folded Reload
	.local	.LBB86_12
.LBB86_12:                              ;   in Loop: Header=BB86_4 Depth=1
	ld	(ix - 6), a                     ; 1-byte Folded Spill
	.local	.LBB86_13
.LBB86_13:                              ;   in Loop: Header=BB86_4 Depth=1
	ld	a, (ix - 23)                    ; 1-byte Folded Reload
	ld	de, (ix - 26)
	.local	.LBB86_14
.LBB86_14:                              ;   in Loop: Header=BB86_4 Depth=1
	ex	de, hl
	ld	de, 6
	add	hl, de
	inc	a
	ex	de, hl
	ld	bc, 132
	jp	.LBB86_4
	.local	.LBB86_15
.LBB86_15:
	ld	de, 0
	ld	a, (ix - 6)                     ; 1-byte Folded Reload
	cp	a, -1
	jp	z, .LBB86_39
; %bb.16:
	ld	e, a
	ld	bc, 6
	push	de
	pop	hl
	call	__imulu
	push	hl
	pop	bc
	ld	hl, (ix + 9)
	add	hl, bc
	ld	(ix - 13), hl
	ex	de, hl
	ld	bc, 6
	call	__imulu
	push	hl
	pop	iy
	ld	c, b
	ld	a, c
	ld	(ix - 23), a                    ; 1-byte Folded Spill
	or	a, a
	sbc	hl, hl
	.local	.LBB86_17
.LBB86_17:                              ; =>This Inner Loop Header: Depth=1
	push	hl
	pop	bc
	ld	de, 132
	or	a, a
	sbc	hl, de
	jp	z, .LBB86_32
; %bb.18:                               ;   in Loop: Header=BB86_17 Depth=1
	lea	hl, iy + 0
	or	a, a
	sbc	hl, bc
	push	bc
	pop	de
	jr	z, .LBB86_23
; %bb.19:                               ;   in Loop: Header=BB86_17 Depth=1
	ld	(ix - 26), a                    ; 1-byte Folded Spill
	ld	(ix - 22), iy
	ld	hl, (ix + 9)
	add	hl, de
	ld	iy, (ix - 13)
	ld	c, (iy + 2)
	push	hl
	pop	iy
	ld	(ix - 29), iy
	ld	a, (iy + 2)
	cp	a, c
	jr	nz, .LBB86_21
; %bb.20:                               ;   in Loop: Header=BB86_17 Depth=1
	ld	iy, (ix - 22)
	jr	.LBB86_22
	.local	.LBB86_21
.LBB86_21:                              ;   in Loop: Header=BB86_17 Depth=1
	ld	iy, (ix - 29)
	bit	0, (iy + 5)
	ld	iy, (ix - 22)
	jr	z, .LBB86_24
	.local	.LBB86_22
.LBB86_22:                              ;   in Loop: Header=BB86_17 Depth=1
	ld	a, (ix - 26)                    ; 1-byte Folded Reload
	.local	.LBB86_23
.LBB86_23:                              ;   in Loop: Header=BB86_17 Depth=1
	ex	de, hl
	ld	de, 6
	add	hl, de
	inc	a
	jr	.LBB86_17
	.local	.LBB86_24
.LBB86_24:                              ;   in Loop: Header=BB86_17 Depth=1
	ld	iy, (ix - 29)
	ld	a, (iy + 3)
	ld	l, (ix - 10)
	and	a, l
	ld	l, a
	or	a, a
	jr	nz, .LBB86_26
; %bb.25:                               ;   in Loop: Header=BB86_17 Depth=1
	ld	a, (ix - 26)                    ; 1-byte Folded Reload
	jr	.LBB86_31
	.local	.LBB86_26
.LBB86_26:                              ;   in Loop: Header=BB86_17 Depth=1
	ld	(ix - 32), de
	ld	hl, (ix - 29)
	push	hl
	ld	hl, (ix + 6)
	push	hl
	call	_ValidPort
	pop	hl
	pop	hl
	bit	0, a
	jr	z, .LBB86_30
; %bb.27:                               ;   in Loop: Header=BB86_17 Depth=1
	ld	a, (ix - 23)                    ; 1-byte Folded Reload
	inc	a
	or	a, a
	sbc	hl, hl
	ld	(ix - 23), a                    ; 1-byte Folded Spill
	ld	l, a
	push	hl
	ld	hl, (ix + 18)
	call	__indcallhl
	pop	de
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	ld	a, (ix - 26)                    ; 1-byte Folded Reload
	ld	l, a
	jr	z, .LBB86_29
; %bb.28:                               ;   in Loop: Header=BB86_17 Depth=1
	ld	a, (ix - 14)                    ; 1-byte Folded Reload
	.local	.LBB86_29
.LBB86_29:                              ;   in Loop: Header=BB86_17 Depth=1
	ld	(ix - 14), a                    ; 1-byte Folded Spill
	ld	de, (ix - 32)
	ld	iy, (ix - 22)
	ld	a, l
	jr	.LBB86_23
	.local	.LBB86_30
.LBB86_30:                              ;   in Loop: Header=BB86_17 Depth=1
	ld	a, (ix - 26)                    ; 1-byte Folded Reload
	ld	de, (ix - 32)
	.local	.LBB86_31
.LBB86_31:                              ;   in Loop: Header=BB86_17 Depth=1
	ld	iy, (ix - 22)
	jr	.LBB86_23
	.local	.LBB86_32
.LBB86_32:
	ld	a, (ix - 14)                    ; 1-byte Folded Reload
	cp	a, -1
	jp	z, .LBB86_39
; %bb.33:
	ld	hl, (ix + 21)
	ld	e, (ix - 6)
	ld	(hl), e
	ld	hl, (ix + 24)
	ld	(hl), a
	ld	l, (ix - 19)
	ld	h, (ix - 18)
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	jr	z, .LBB86_35
; %bb.34:
	ld	hl, 22
	ld	(ix - 17), hl
	.local	.LBB86_35
.LBB86_35:
	ld	hl, (ix + 15)
	ld	de, (ix - 17)
	add	hl, de
	ld	hl, (hl)
	xor	a, a
	ld	(ix - 3), a
	ld	bc, (ix - 5)
	ld	b, h
	ld	c, l
	sbc	hl, hl
	ld	a, l
	ld	iy, (ix - 13)
	ld	e, (iy + 2)
	ld	l, e
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de, hl
	ld	hl, (ix + 6)
	add	hl, de
	ld	(ix - 6), hl
	ld	iy, (ix - 6)
	ld	iy, (iy + 12)
	ld	(ix - 13), iy
	ld	l, 0
	ld	(ix - 2), l
	ld	hl, (ix - 4)
	ex	de, hl
	ld	d, iyh
	ld	e, iyl
	ex	de, hl
	ld	e, a
	call	__lmulu
	ld	(ix - 10), hl
	ld	(ix - 17), e                    ; 1-byte Folded Spill
	ld	iy, (ix - 6)
	ld	hl, (iy + 10)
	ld	iy, (ix - 6)
	ld	de, (iy + 14)
	ld	bc, (ix - 13)
	add.sis	hl, bc
	add.sis	hl, de
	ld	e, 0
	ld	(ix - 1), e
	ld	bc, (ix - 3)
	ld	b, h
	ld	c, l
	ld	hl, (ix - 10)
	ld	e, (ix - 17)                    ; 1-byte Folded Reload
	call	__ldivu
	push	hl
	pop	bc
	sbc.sis	hl, hl
	adc.sis	hl, bc
	jr	z, .LBB86_39
; %bb.36:
	ld.sis	de, 10000
	ld	l, c
	ld	h, b
	or	a, a
	sbc.sis	hl, de
	jr	nc, .LBB86_38
; %bb.37:                               ; %Roll.exit
	ld	hl, 10000
	push	hl
	ld	hl, (ix + 18)
	ld	(ix - 6), bc
	call	__indcallhl
	pop	de
	ld	de, (ix - 6)
	or	a, a
	sbc.sis	hl, de
	jr	nc, .LBB86_39
	.local	.LBB86_38
.LBB86_38:                              ; %Roll.exit.thread
	or	a, a
	sbc	hl, hl
	ld	l, (ix - 14)                    ; 1-byte Folded Reload
	ld	bc, 6
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
	ld	(ix - 7), a                     ; 1-byte Folded Spill
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	.local	.LBB86_39
.LBB86_39:                              ; %Roll.exit.thread4
	ld	a, (ix - 7)                     ; 1-byte Folded Reload
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end86
.Lfunc_end86:
	.size	_Transport, .Lfunc_end86-_Transport
                                        ; -- End function
	.section	.text._Migrate,"ax",@progbits
	.globl	_Migrate                        ; -- Begin function Migrate
	.type	_Migrate,@function
_Migrate:                               ; @Migrate
; %bb.0:
	ld	hl, -23
	call	__frameset
	ld	iy, (ix + 9)
	ld	e, 0
	ld	a, (iy + 33)
	or	a, a
	jp	z, .LBB87_28
; %bb.1:
	ld	a, (iy + 34)
	or	a, a
	jp	nz, .LBB87_28
; %bb.2:
	ld	a, (iy + 8)
	inc	a
	ld	l, 7
	and	a, l
	ld	l, a
	or	a, a
	jp	nz, .LBB87_28
; %bb.3:
	ld	iy, (ix + 12)
	ld	hl, (iy + 26)
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	jp	z, .LBB87_28
; %bb.4:                                ; %.preheader.preheader
	ld	d, 0
	ld	l, -1
	ld	bc, 12
	ld	(ix - 6), bc
	ld	iy, 10
	ld	(ix - 9), iy
	ld	bc, 124
	ld	iyl, d
	ld	(ix - 13), hl
	ld	a, l
	ld	(ix - 10), d                    ; 1-byte Folded Spill
	.local	.LBB87_5
.LBB87_5:                               ; %.preheader
                                        ; =>This Inner Loop Header: Depth=1
	ld	hl, (ix - 6)
	or	a, a
	sbc	hl, bc
	jr	z, .LBB87_12
; %bb.6:                                ;   in Loop: Header=BB87_5 Depth=1
	ld	hl, (ix + 6)
	ld	bc, (ix - 6)
	add	hl, bc
	ld	hl, (hl)
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	push	bc
	pop	hl
	jr	nz, .LBB87_8
; %bb.7:                                ;   in Loop: Header=BB87_5 Depth=1
	ld	bc, 16
	jr	.LBB87_11
	.local	.LBB87_8
.LBB87_8:                               ;   in Loop: Header=BB87_5 Depth=1
	ld	(ix - 20), a                    ; 1-byte Folded Spill
	inc	d
	or	a, a
	sbc	hl, hl
	ld	(ix - 19), d                    ; 1-byte Folded Spill
	ld	l, d
	push	hl
	ld	hl, (ix + 15)
	push	af
	ld	a, iyl
	ld	(ix - 16), a                    ; 1-byte Folded Spill
	pop	af
	call	__indcallhl
	push	af
	ld	a, (ix - 16)                    ; 1-byte Folded Reload
	ld	iyl, a
	pop	af
	pop	de
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	ld	a, iyl
	jr	z, .LBB87_10
; %bb.9:                                ;   in Loop: Header=BB87_5 Depth=1
	ld	a, (ix - 20)                    ; 1-byte Folded Reload
	.local	.LBB87_10
.LBB87_10:                              ;   in Loop: Header=BB87_5 Depth=1
	ld	e, 0
	ld	bc, 16
	ld	hl, (ix - 6)
	ld	d, (ix - 19)                    ; 1-byte Folded Reload
	.local	.LBB87_11
.LBB87_11:                              ;   in Loop: Header=BB87_5 Depth=1
	add	hl, bc
	inc	iyl
	ld	(ix - 6), hl
	ld	bc, 124
	jr	.LBB87_5
	.local	.LBB87_12
.LBB87_12:
	or	a, a
	sbc	hl, hl
	cp	a, -1
	jp	z, .LBB87_28
; %bb.13:
	ld	l, a
	ld	iy, (ix + 12)
	ld	de, (iy + 26)
	xor	a, a
	ld	(ix - 3), a
	ld	bc, (ix - 5)
	ld	b, d
	ld	c, e
	ld	de, 0
	ld	a, e
	ld	(ix - 23), hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de, hl
	ld	iy, (ix + 6)
	add	iy, de
	ld	(ix - 6), iy
	ld	de, (iy + 12)
	ld	(ix - 19), de
	ld	l, 0
	ld	(ix - 2), l
	ld	hl, (ix - 4)
	ld	h, d
	ld	l, e
	ld	e, a
	call	__lmulu
	ld	(ix - 16), hl
	ld	(ix - 20), e                    ; 1-byte Folded Spill
	ld	iy, (ix - 6)
	ld	hl, (iy + 10)
	ld	iy, (ix - 6)
	ld	de, (iy + 14)
	ld	bc, (ix - 19)
	add.sis	hl, bc
	add.sis	hl, de
	ld	c, 0
	ld	(ix - 1), c
	ld	bc, (ix - 3)
	ld	b, h
	ld	c, l
	ld	hl, (ix - 16)
	ld	e, (ix - 20)                    ; 1-byte Folded Reload
	call	__ldivu
	push	hl
	pop	bc
	sbc.sis	hl, hl
	adc.sis	hl, bc
	jr	nz, .LBB87_15
	.local	.LBB87_14
.LBB87_14:
	ld	e, 0
	jp	.LBB87_28
	.local	.LBB87_15
.LBB87_15:
	ld.sis	de, 10000
	ld	l, c
	ld	h, b
	or	a, a
	sbc.sis	hl, de
	jr	nc, .LBB87_17
; %bb.16:                               ; %Roll.exit
	ld	hl, 10000
	push	hl
	ld	hl, (ix + 15)
	ld	(ix - 6), bc
	call	__indcallhl
	pop	de
	ld	de, (ix - 6)
	or	a, a
	sbc.sis	hl, de
	jr	nc, .LBB87_14
	.local	.LBB87_17
.LBB87_17:                              ; %Roll.exit.thread
	ld	hl, _neighbors
	ld	de, (ix - 23)
	add	hl, de
	ld	d, (hl)
	ld	bc, 7
	xor	a, a
	ld	(ix - 16), a                    ; 1-byte Folded Spill
	ld	e, a
	ld	iy, 0
	.local	.LBB87_18
.LBB87_18:                              ; =>This Inner Loop Header: Depth=1
	lea	hl, iy + 0
	or	a, a
	sbc	hl, bc
	jr	z, .LBB87_26
; %bb.19:                               ;   in Loop: Header=BB87_18 Depth=1
	ld	hl, 1
	ld	(ix - 6), iy
	ld	c, iyl
	call	__ishl
	ld	a, l
	and	a, d
	ld	l, a
	or	a, a
	jr	z, .LBB87_21
; %bb.20:                               ;   in Loop: Header=BB87_18 Depth=1
	ld	hl, (ix + 6)
	ld	bc, (ix - 9)
	add	hl, bc
	ld	hl, (hl)
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	jr	nz, .LBB87_22
	.local	.LBB87_21
.LBB87_21:                              ;   in Loop: Header=BB87_18 Depth=1
	ld	bc, 16
	jr	.LBB87_25
	.local	.LBB87_22
.LBB87_22:                              ;   in Loop: Header=BB87_18 Depth=1
	ld	(ix - 19), d                    ; 1-byte Folded Spill
	ld	a, (ix - 16)                    ; 1-byte Folded Reload
	inc	a
	or	a, a
	sbc	hl, hl
	ld	(ix - 16), a                    ; 1-byte Folded Spill
	ld	l, a
	push	hl
	ld	hl, (ix + 15)
	call	__indcallhl
	pop	de
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	ld	a, (ix - 10)                    ; 1-byte Folded Reload
	jr	z, .LBB87_24
; %bb.23:                               ;   in Loop: Header=BB87_18 Depth=1
	ld	hl, (ix - 13)
	ld	a, l
	.local	.LBB87_24
.LBB87_24:                              ;   in Loop: Header=BB87_18 Depth=1
	ld	l, a
	ld	(ix - 13), hl
	ld	e, 0
	ld	bc, 16
	ld	d, (ix - 19)                    ; 1-byte Folded Reload
	.local	.LBB87_25
.LBB87_25:                              ;   in Loop: Header=BB87_18 Depth=1
	ld	iy, (ix - 6)
	inc	iy
	ld	hl, (ix - 9)
	add	hl, bc
	inc	(ix - 10)
	ld	(ix - 9), hl
	ld	bc, 7
	jr	.LBB87_18
	.local	.LBB87_26
.LBB87_26:
	ld	hl, (ix - 13)
	ld	a, l
	cp	a, -1
	jr	z, .LBB87_28
; %bb.27:
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
	.local	.LBB87_28
.LBB87_28:                              ; %Roll.exit.thread3
	ld	a, e
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end87
.Lfunc_end87:
	.size	_Migrate, .Lfunc_end87-_Migrate
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
	jp	z, .LBB88_7
; %bb.1:
	ld	a, (iy + 34)
	or	a, a
	jp	nz, .LBB88_7
; %bb.2:
	ld	a, (iy + 32)
	cp	a, 2
	jp	nz, .LBB88_7
; %bb.3:
	ld	a, (iy + 36)
	cp	a, 3
	jp	nc, .LBB88_7
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
	jp	c, .LBB88_7
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
	jp	z, .LBB88_7
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
	.local	.LBB88_7
.LBB88_7:
	ld	a, c
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end88
.Lfunc_end88:
	.size	_SporeBurst, .Lfunc_end88-_SporeBurst
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
	jp	z, .LBB89_16
; %bb.1:
	ld	a, l
	ld	de, 0
	.local	.LBB89_2
.LBB89_2:                               ; =>This Inner Loop Header: Depth=1
	ld	bc, 132
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	jp	z, .LBB89_15
; %bb.3:                                ;   in Loop: Header=BB89_2 Depth=1
	ld	iy, (ix + 9)
	add	iy, de
	bit	0, (iy + 5)
	jr	z, .LBB89_5
; %bb.4:                                ;   in Loop: Header=BB89_2 Depth=1
	ld	bc, 6
	jp	.LBB89_14
	.local	.LBB89_5
.LBB89_5:                               ;   in Loop: Header=BB89_2 Depth=1
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
	jr	z, .LBB89_7
; %bb.6:                                ;   in Loop: Header=BB89_2 Depth=1
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
	.local	.LBB89_7
.LBB89_7:                               ; %Percentage.exit1
                                        ;   in Loop: Header=BB89_2 Depth=1
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
	jr	z, .LBB89_9
; %bb.8:                                ; %Percentage.exit1
                                        ;   in Loop: Header=BB89_2 Depth=1
	ld.sis	de, 0
	.local	.LBB89_9
.LBB89_9:                               ; %Percentage.exit1
                                        ;   in Loop: Header=BB89_2 Depth=1
	add.sis	hl, de
	ld	iy, (ix - 3)
	ld	e, (iy + 4)
	ld	d, 0
	or	a, a
	sbc.sis	hl, de
	jp	c, .LBB89_12
; %bb.10:                               ;   in Loop: Header=BB89_2 Depth=1
	ld	hl, 10000
	push	hl
	ld	hl, (ix + 18)
	call	__indcallhl
	pop	de
	ld.sis	de, 800
	or	a, a
	sbc.sis	hl, de
	jp	nc, .LBB89_12
; %bb.11:                               ;   in Loop: Header=BB89_2 Depth=1
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
	jr	.LBB89_13
	.local	.LBB89_12
.LBB89_12:                              ;   in Loop: Header=BB89_2 Depth=1
	ld	a, (ix - 4)                     ; 1-byte Folded Reload
	.local	.LBB89_13
.LBB89_13:                              ;   in Loop: Header=BB89_2 Depth=1
	ld	bc, 6
	ld	de, (ix - 7)
	.local	.LBB89_14
.LBB89_14:                              ;   in Loop: Header=BB89_2 Depth=1
	ex	de, hl
	add	hl, bc
	ex	de, hl
	jp	.LBB89_2
	.local	.LBB89_15
.LBB89_15:
	ld	l, a
	.local	.LBB89_16
.LBB89_16:                              ; %.loopexit
	ld	a, l
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end89
.Lfunc_end89:
	.size	_ClosePorts, .Lfunc_end89-_ClosePorts
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
	jr	nz, .LBB90_2
; %bb.1:
	ld.sis	hl, 0
	jr	.LBB90_3
	.local	.LBB90_2
.LBB90_2:
	or	a, a
	sbc	hl, hl
	ld	l, e
	ld	h, d
	ld	(ix - 3), hl
	call	_random
	ld	bc, (ix - 3)
	call	__iremu
	.local	.LBB90_3
.LBB90_3:
                                        ; kill: def $hl killed $hl killed $uhl
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end90
.Lfunc_end90:
	.size	_GameRandom, .Lfunc_end90-_GameRandom
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
	jp	nz, .LBB91_14
; %bb.1:
	ld	iy, -720878
	ld.sis	bc, 1
	ld	l, (iy)
	ld	h, (iy + 1)
	call	__sand
	bit	0, l
	jp	nz, .LBB91_15
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
	jr	nz, .LBB91_16
; %bb.3:
	ld	l, (iy)
	ld	h, (iy + 1)
	ld	a, l
	bit	4, a
	jr	nz, .LBB91_17
; %bb.4:
	ld	l, (iy)
	ld	h, (iy + 1)
	ld	a, l
	bit	3, a
	jr	nz, .LBB91_18
; %bb.5:
	ld	l, (iy)
	ld	h, (iy + 1)
	ld	a, l
	bit	2, a
	jr	nz, .LBB91_19
; %bb.6:
	ld	l, (iy)
	ld	h, (iy + 1)
	ld	e, -128
	ld	a, l
	and	a, e
	ld	l, a
	or	a, a
	jr	nz, .LBB91_20
; %bb.7:
	ld	l, (iy)
	ld	h, (iy + 1)
	ld	a, l
	bit	6, a
	jr	nz, .LBB91_21
; %bb.8:
	ld	hl, -720866
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	hl
	ld	a, e
	bit	1, a
	jr	nz, .LBB91_22
; %bb.9:
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	hl
	ld	a, e
	bit	2, a
	jr	nz, .LBB91_23
; %bb.10:
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	hl
	ld	a, e
	bit	3, a
	jr	nz, .LBB91_24
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
	jr	nz, .LBB91_25
; %bb.12:
	call	_ScannedKeyDown
	bit	0, a
	jr	nz, .LBB91_26
; %bb.13:
	xor	a, a
	ret
	.local	.LBB91_14
.LBB91_14:
	ld	a, 6
	ret
	.local	.LBB91_15
.LBB91_15:
	ld	a, 7
	ret
	.local	.LBB91_16
.LBB91_16:
	ld	a, 5
	ret
	.local	.LBB91_17
.LBB91_17:
	ld	a, 8
	ret
	.local	.LBB91_18
.LBB91_18:
	ld	a, 9
	ret
	.local	.LBB91_19
.LBB91_19:
	ld	a, 11
	ret
	.local	.LBB91_20
.LBB91_20:
	ld	a, 10
	ret
	.local	.LBB91_21
.LBB91_21:
	ld	a, 12
	ret
	.local	.LBB91_22
.LBB91_22:
	ld	a, 1
	ret
	.local	.LBB91_23
.LBB91_23:
	ld	a, 2
	ret
	.local	.LBB91_24
.LBB91_24:
	ld	a, 3
	ret
	.local	.LBB91_25
.LBB91_25:
	ld	a, 4
	ret
	.local	.LBB91_26
.LBB91_26:
	ld	a, 13
	ret
	.local	.Lfunc_end91
.Lfunc_end91:
	.size	_ReadKey, .Lfunc_end91-_ReadKey
                                        ; -- End function
	.section	.text._ScannedKeyDown,"ax",@progbits
	.type	_ScannedKeyDown,@function       ; -- Begin function ScannedKeyDown
_ScannedKeyDown:                        ; @ScannedKeyDown
; %bb.0:
	ld	hl, 1
	ld	iy, -720878
	ld	bc, 8
	.local	.LBB92_1
.LBB92_1:                               ; =>This Inner Loop Header: Depth=1
	push	hl
	pop	de
	or	a, a
	sbc	hl, bc
	jr	z, .LBB92_3
; %bb.2:                                ;   in Loop: Header=BB92_1 Depth=1
	ld	c, (iy)
	ld	b, (iy + 1)
	push	de
	pop	hl
	inc	hl
	lea	iy, iy + 2
	ld	a, c
	ld	bc, 8
	or	a, a
	jr	z, .LBB92_1
	.local	.LBB92_3
.LBB92_3:
	ex	de, hl
	or	a, a
	sbc	hl, bc
                                        ; kill: def $a killed $a
	sbc	a, a
	ret
	.local	.Lfunc_end92
.Lfunc_end92:
	.size	_ScannedKeyDown, .Lfunc_end92-_ScannedKeyDown
                                        ; -- End function
	.section	.text._ReleaseKeys,"ax",@progbits
	.globl	_ReleaseKeys                    ; -- Begin function ReleaseKeys
	.type	_ReleaseKeys,@function
_ReleaseKeys:                           ; @ReleaseKeys
; %bb.0:
	.local	.LBB93_1
.LBB93_1:                               ; =>This Inner Loop Header: Depth=1
	call	_kb_Scan
	call	_ScannedKeyDown
	bit	0, a
	jr	nz, .LBB93_1
; %bb.2:
	ld	a, 1
	ld	(_canpress), a
	ret
	.local	.Lfunc_end93
.Lfunc_end93:
	.size	_ReleaseKeys, .Lfunc_end93-_ReleaseKeys
                                        ; -- End function
	.section	.text._WaitKey,"ax",@progbits
	.globl	_WaitKey                        ; -- Begin function WaitKey
	.type	_WaitKey,@function
_WaitKey:                               ; @WaitKey
; %bb.0:
	call	_ReleaseKeys
	.local	.LBB94_1
.LBB94_1:                               ; =>This Inner Loop Header: Depth=1
	call	_ReadKey
	ld	l, a
	or	a, a
	jr	z, .LBB94_1
; %bb.2:
	ld	a, l
	ret
	.local	.Lfunc_end94
.Lfunc_end94:
	.size	_WaitKey, .Lfunc_end94-_WaitKey
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
	.local	.Lfunc_end95
.Lfunc_end95:
	.size	_EndModal, .Lfunc_end95-_EndModal
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
	jr	nz, .LBB96_2
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
	jr	.LBB96_4
	.local	.LBB96_2
.LBB96_2:
	cp	a, 4
	jp	nz, .LBB96_5
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
	.local	.LBB96_4
.LBB96_4:
	ld	a, 1
                                        ; kill: def $l killed $l killed $hl
	ld	(iy), l
	jr	.LBB96_6
	.local	.LBB96_5
.LBB96_5:
	xor	a, a
	.local	.LBB96_6
.LBB96_6:
	pop	ix
	ret
	.local	.Lfunc_end96
.Lfunc_end96:
	.size	_MenuMove, .Lfunc_end96-_MenuMove
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
	jr	z, .LBB97_2
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
	ld	bc, _.str.202
	ld	de, 10
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (ix - 3)
	jr	.LBB97_3
	.local	.LBB97_2
.LBB97_2:
	ld	bc, _.str.1.203
	.local	.LBB97_3
.LBB97_3:
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
	.local	.Lfunc_end97
.Lfunc_end97:
	.size	_MenuItem, .Lfunc_end97-_MenuItem
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
	.local	.Lfunc_end98
.Lfunc_end98:
	.size	_Text, .Lfunc_end98-_Text
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
	.local	.LBB99_1
.LBB99_1:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB99_2 Depth 2
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
	.local	.LBB99_2
.LBB99_2:                               ;   Parent Loop BB99_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ld	hl, (ix - 8)
	or	a, a
	sbc	hl, bc
	jr	z, .LBB99_6
; %bb.3:                                ;   in Loop: Header=BB99_2 Depth=2
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
	jr	z, .LBB99_5
; %bb.4:                                ;   in Loop: Header=BB99_2 Depth=2
	ld	hl, 0
	push	hl
	pop	bc
	.local	.LBB99_5
.LBB99_5:                               ;   in Loop: Header=BB99_2 Depth=2
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
	jr	.LBB99_2
	.local	.LBB99_6
.LBB99_6:                               ;   in Loop: Header=BB99_1 Depth=1
	ld	hl, 211
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, _.str.2.210
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 226
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, _.str.3.211
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	call	_gfx_SwapDraw
	call	_WaitKey
	ld	l, a
	cp	a, 5
	jr	z, .LBB99_10
; %bb.7:                                ;   in Loop: Header=BB99_1 Depth=1
	ld	a, l
	cp	a, 6
	jr	z, .LBB99_9
; %bb.8:                                ;   in Loop: Header=BB99_1 Depth=1
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
	jp	.LBB99_1
	.local	.LBB99_9
.LBB99_9:
	ld	a, -1
	ld	(ix - 2), a                     ; 1-byte Folded Spill
	.local	.LBB99_10
.LBB99_10:                              ; %.loopexit
	call	_EndModal
	ld	a, (ix - 2)                     ; 1-byte Folded Reload
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end99
.Lfunc_end99:
	.size	_ChooseMenu, .Lfunc_end99-_ChooseMenu
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
	.local	.Lfunc_end100
.Lfunc_end100:
	.size	_BeginScreen, .Lfunc_end100-_BeginScreen
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
	.local	.LBB101_1
.LBB101_1:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB101_4 Depth 2
                                        ;     Child Loop BB101_20 Depth 2
	ld	a, e
	or	a, a
	jp	z, .LBB101_22
; %bb.2:                                ;   in Loop: Header=BB101_1 Depth=1
	ld	a, d
	or	a, a
	jp	z, .LBB101_22
; %bb.3:                                ; %.preheader.preheader
                                        ;   in Loop: Header=BB101_1 Depth=1
	dec	d
	ld	(ix - 64), d
	ld	bc, 0
	ld	(ix - 60), bc
	ld	(ix - 63), iy
	ld	(ix - 57), hl
	.local	.LBB101_4
.LBB101_4:                              ; %.preheader
                                        ;   Parent Loop BB101_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ld	(ix - 51), bc
	ld	a, e
	or	a, a
	jr	z, .LBB101_11
; %bb.5:                                ; %.preheader
                                        ;   in Loop: Header=BB101_4 Depth=2
	ld	hl, (ix - 60)
	ld	bc, 47
	or	a, a
	sbc	hl, bc
	jr	nc, .LBB101_11
; %bb.6:                                ;   in Loop: Header=BB101_4 Depth=2
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
	jr	c, .LBB101_10
; %bb.7:                                ;   in Loop: Header=BB101_4 Depth=2
	ld	a, e
	cp	a, 32
	ld	de, (ix - 60)
	push	de
	pop	hl
	jr	z, .LBB101_9
; %bb.8:                                ;   in Loop: Header=BB101_4 Depth=2
	ld	hl, (ix - 51)
	.local	.LBB101_9
.LBB101_9:                              ;   in Loop: Header=BB101_4 Depth=2
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
	jr	.LBB101_4
	.local	.LBB101_10
.LBB101_10:                             ;   in Loop: Header=BB101_1 Depth=1
	ld	iy, (ix - 63)
	.local	.LBB101_11
.LBB101_11:                             ;   in Loop: Header=BB101_1 Depth=1
	ld	c, -1
	ld	d, 0
	ld	hl, (ix - 51)
	add	hl, bc
	or	a, a
	sbc	hl, bc
	ld	l, c
	jr	nz, .LBB101_13
; %bb.12:                               ;   in Loop: Header=BB101_1 Depth=1
	ld	l, d
	.local	.LBB101_13
.LBB101_13:                             ;   in Loop: Header=BB101_1 Depth=1
	ld	a, e
	or	a, a
	ld	a, c
	jr	nz, .LBB101_15
; %bb.14:                               ;   in Loop: Header=BB101_1 Depth=1
	ld	a, d
	.local	.LBB101_15
.LBB101_15:                             ;   in Loop: Header=BB101_1 Depth=1
	and	a, l
	ld	l, a
	bit	0, l
	ld	bc, (ix - 51)
	jr	nz, .LBB101_17
; %bb.16:                               ;   in Loop: Header=BB101_1 Depth=1
	ld	bc, (ix - 60)
	.local	.LBB101_17
.LBB101_17:                             ;   in Loop: Header=BB101_1 Depth=1
	push	bc
	pop	hl
	ld	de, 2
	or	a, a
	sbc	hl, de
	jr	nc, .LBB101_19
; %bb.18:                               ;   in Loop: Header=BB101_1 Depth=1
	ld	bc, 1
	.local	.LBB101_19
.LBB101_19:                             ;   in Loop: Header=BB101_1 Depth=1
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
	.local	.LBB101_20
.LBB101_20:                             ;   Parent Loop BB101_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	ld	e, (iy + 1)
	inc	iy
	ld	a, e
	cp	a, 32
	jr	z, .LBB101_20
; %bb.21:                               ;   in Loop: Header=BB101_1 Depth=1
	ld	hl, (ix - 57)
	ld	bc, 12
	add	hl, bc
	ld	d, (ix - 64)                    ; 1-byte Folded Reload
	jp	.LBB101_1
	.local	.LBB101_22
.LBB101_22:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end101
.Lfunc_end101:
	.size	_WrapText, .Lfunc_end101-_WrapText
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
	ld	hl, _.str.4.214
	push	hl
	call	_MenuItem
	pop	hl
	pop	hl
	pop	hl
	call	_gfx_SwapDraw
	.local	.LBB102_1
.LBB102_1:                              ; =>This Inner Loop Header: Depth=1
	call	_WaitKey
	ld	l, -5
	add	a, l
	ld	l, a
	cp	a, 2
	jr	nc, .LBB102_1
; %bb.2:
	call	_ReleaseKeys
	or	a, a
	sbc	hl, hl
	ld	(-917504), hl
	xor	a, a
	ld	(-917501), a
	pop	ix
	ret
	.local	.Lfunc_end102
.Lfunc_end102:
	.size	_Message, .Lfunc_end102-_Message
                                        ; -- End function
	.section	.text._QueueNews,"ax",@progbits
	.globl	_QueueNews                      ; -- Begin function QueueNews
	.type	_QueueNews,@function
_QueueNews:                             ; @QueueNews
; %bb.0:
	call	__frameset0
	ld	a, (_news_count)
	cp	a, 8
	jr	nc, .LBB103_2
; %bb.1:
	ld	bc, 7
	ld	iy, _news
	or	a, a
	sbc	hl, hl
	push	hl
	pop	de
	ld	e, a
	ld	a, (_news_head)
	ld	l, a
	add	hl, de
	call	__iand
	ld	bc, 48
	call	__imulu
	ex	de, hl
	add	iy, de
	ld	hl, (ix + 6)
	push	hl
	ld	hl, _.str.5.217
	push	hl
	ld	hl, 48
	push	hl
	push	iy
	call	_snprintf
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, _news_count
	inc	(hl)
	.local	.LBB103_2
.LBB103_2:
	pop	ix
	ret
	.local	.Lfunc_end103
.Lfunc_end103:
	.size	_QueueNews, .Lfunc_end103-_QueueNews
                                        ; -- End function
	.section	.text._ResetGameState,"ax",@progbits
	.globl	_ResetGameState                 ; -- Begin function ResetGameState
	.type	_ResetGameState,@function
_ResetGameState:                        ; @ResetGameState
; %bb.0:
	ld	hl, -3
	call	__frameset
	ld	bc, 0
	.local	.LBB104_1
.LBB104_1:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB104_3 Depth 2
	ld	de, 7
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	jr	z, .LBB104_8
; %bb.2:                                ;   in Loop: Header=BB104_1 Depth=1
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
	.local	.LBB104_3
.LBB104_3:                              ;   Parent Loop BB104_1 Depth=1
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
	jr	nc, .LBB104_7
; %bb.4:                                ;   in Loop: Header=BB104_3 Depth=2
	ld	hl, (iy + 3)
	push	hl
	pop	bc
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	z, .LBB104_6
; %bb.5:                                ;   in Loop: Header=BB104_3 Depth=2
	push	bc
	pop	hl
	add	hl, de
	ld	(hl), -1
	.local	.LBB104_6
.LBB104_6:                              ;   in Loop: Header=BB104_3 Depth=2
	inc	de
	or	a, a
	sbc	hl, hl
	jr	.LBB104_3
	.local	.LBB104_7
.LBB104_7:                              ;   in Loop: Header=BB104_1 Depth=1
	push	iy
	call	_RecountRegion
	pop	hl
	ld	bc, (ix - 3)
	inc	bc
	jr	.LBB104_1
	.local	.LBB104_8
.LBB104_8:
	xor	a, a
	ld	(_disease), a
	ld	iy, _disease
	lea	hl, iy + 0
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
	ld	hl, _.str.61.251
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
	ld	hl, _effects
	push	hl
	ld	hl, _disease
	push	hl
	call	_CalculateEffects
	pop	hl
	pop	hl
	ld	l, 0
	ld	a, l
	ld	(_connection), a
	ld	(_destination_port), a
	ld	(_source_port), a
	xor	a, a
	ld	(_canpress), a
	ld	a, l
	ld	(_news_age), a
	ld	(_news_count), a
	ld	(_news_head), a
	ld	(_news), a
	ld	hl, _news
	push	hl
	pop	de
	inc	de
	ld	bc, 383
	ldir
	pop	hl
	pop	ix
	ret
	.local	.Lfunc_end104
.Lfunc_end104:
	.size	_ResetGameState, .Lfunc_end104-_ResetGameState
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
	jp	z, .LBB105_33
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
	jr	nz, .LBB105_6
; %bb.2:
	ld	hl, (ix - 18)
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	z, .LBB105_4
; %bb.3:
	ld	a, 0
	jr	.LBB105_5
	.local	.LBB105_4
.LBB105_4:
	ld	a, -1
	.local	.LBB105_5
.LBB105_5:
	bit	0, a
	jp	nz, .LBB105_33
	.local	.LBB105_6
.LBB105_6:
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
	.local	.LBB105_7
.LBB105_7:                              ; =>This Inner Loop Header: Depth=1
	push	bc
	pop	hl
	or	a, a
	sbc	hl, de
	jp	z, .LBB105_30
; %bb.8:                                ;   in Loop: Header=BB105_7 Depth=1
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
	jr	nz, .LBB105_11
; %bb.9:                                ;   in Loop: Header=BB105_7 Depth=1
	ld	iy, _region
	ld	bc, (ix - 12)
	add	iy, bc
	lea	de, iy + 0
	ld	a, (iy + 8)
	ld	iy, (ix - 15)
	ld	c, (iy + 8)
	cp	a, c
	jp	nc, .LBB105_23
; %bb.10:                               ;   in Loop: Header=BB105_7 Depth=1
	or	a, a
	sbc	hl, hl
	push	hl
	pop	iy
	ld	l, c
	lea	bc, iy + 0
	ld	c, a
	jr	.LBB105_14
	.local	.LBB105_11
.LBB105_11:                             ;   in Loop: Header=BB105_7 Depth=1
	push	bc
	pop	hl
	ld	de, 1
	or	a, a
	sbc	hl, de
	jr	nz, .LBB105_16
; %bb.12:                               ;   in Loop: Header=BB105_7 Depth=1
	ld	iy, _region
	ld	bc, (ix - 12)
	add	iy, bc
	lea	de, iy + 0
	ld	c, (iy + 8)
	ld	iy, (ix - 15)
	ld	a, (iy + 8)
	cp	a, c
	jp	nc, .LBB105_23
; %bb.13:                               ;   in Loop: Header=BB105_7 Depth=1
	ld	iy, 0
	ld	iyl, a
	or	a, a
	sbc	hl, hl
	ld	l, c
	lea	bc, iy + 0
	.local	.LBB105_14
.LBB105_14:                             ;   in Loop: Header=BB105_7 Depth=1
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
	.local	.LBB105_15
.LBB105_15:                             ;   in Loop: Header=BB105_7 Depth=1
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
	jp	.LBB105_24
	.local	.LBB105_16
.LBB105_16:                             ;   in Loop: Header=BB105_7 Depth=1
	ld	bc, (ix - 18)
	push	bc
	pop	hl
	ld	de, -1
	or	a, a
	sbc	hl, de
	jr	nz, .LBB105_19
; %bb.17:                               ;   in Loop: Header=BB105_7 Depth=1
	ld	iy, _region
	ld	bc, (ix - 12)
	add	iy, bc
	lea	de, iy + 0
	ld	a, (iy + 9)
	ld	iy, (ix - 15)
	ld	c, (iy + 9)
	cp	a, c
	jr	nc, .LBB105_23
; %bb.18:                               ;   in Loop: Header=BB105_7 Depth=1
	or	a, a
	sbc	hl, hl
	push	hl
	pop	iy
	ld	l, c
	lea	bc, iy + 0
	ld	c, a
	jr	.LBB105_22
	.local	.LBB105_19
.LBB105_19:                             ;   in Loop: Header=BB105_7 Depth=1
	push	bc
	pop	hl
	ld	de, 1
	or	a, a
	sbc	hl, de
	ld	bc, 10000
	ld	hl, (ix - 3)
	jr	nz, .LBB105_25
; %bb.20:                               ;   in Loop: Header=BB105_7 Depth=1
	ld	iy, _region
	ld	bc, (ix - 12)
	add	iy, bc
	lea	de, iy + 0
	ld	c, (iy + 9)
	ld	iy, (ix - 15)
	ld	a, (iy + 9)
	cp	a, c
	jr	nc, .LBB105_23
; %bb.21:                               ;   in Loop: Header=BB105_7 Depth=1
	ld	iy, 0
	ld	iyl, a
	or	a, a
	sbc	hl, hl
	ld	l, c
	lea	bc, iy + 0
	.local	.LBB105_22
.LBB105_22:                             ;   in Loop: Header=BB105_7 Depth=1
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
	jp	.LBB105_15
	.local	.LBB105_23
.LBB105_23:                             ;   in Loop: Header=BB105_7 Depth=1
	ld	bc, (ix - 6)
	ld	hl, 10000
	.local	.LBB105_24
.LBB105_24:                             ;   in Loop: Header=BB105_7 Depth=1
	push	af
	ld	a, (ix - 19)                    ; 1-byte Folded Reload
	ld	iyh, a
	pop	af
	.local	.LBB105_25
.LBB105_25:                             ;   in Loop: Header=BB105_7 Depth=1
	push	hl
	pop	de
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	ld	(ix - 3), de
	jp	m, .LBB105_27
; %bb.26:                               ;   in Loop: Header=BB105_7 Depth=1
	push	bc
	pop	de
	.local	.LBB105_27
.LBB105_27:                             ;   in Loop: Header=BB105_7 Depth=1
	ld	(ix - 6), de
	ld	hl, (ix - 3)
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	ld	a, iyh
	jp	m, .LBB105_29
; %bb.28:                               ;   in Loop: Header=BB105_7 Depth=1
	ld	a, (ix - 20)                    ; 1-byte Folded Reload
	.local	.LBB105_29
.LBB105_29:                             ;   in Loop: Header=BB105_7 Depth=1
	ld	hl, (ix - 12)
	ld	bc, 16
	add	hl, bc
	inc	iyh
	push	hl
	pop	bc
	ld	de, 112
	jp	.LBB105_7
	.local	.LBB105_30
.LBB105_30:
	ld	bc, 5000
	ld	hl, (ix - 6)
	or	a, a
	sbc	hl, bc
	call	pe, __setflag
	jp	p, .LBB105_32
; %bb.31:
	ld	(_session+4), a
	.local	.LBB105_32
.LBB105_32:
	xor	a, a
	ld	(_canpress), a
	.local	.LBB105_33
.LBB105_33:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end105
.Lfunc_end105:
	.size	_UpdateSelectedRegion, .Lfunc_end105-_UpdateSelectedRegion
                                        ; -- End function
	.section	.text._ActionsMenu,"ax",@progbits
	.globl	_ActionsMenu                    ; -- Begin function ActionsMenu
	.type	_ActionsMenu,@function
_ActionsMenu:                           ; @ActionsMenu
; %bb.0:
	ld	hl, -117
	call	__frameset
	ld	l, 6
	ld	c, 1
	lea	de, ix - 86
	ld	(ix - 92), de
	ld	(ix - 1), 0
	ld	a, (_disease+32)
	cp	a, 2
	ld	e, 0
	ld	a, c
	jr	z, .LBB106_2
; %bb.1:
	ld	a, e
	.local	.LBB106_2
.LBB106_2:
	lea	de, ix - 65
	ld	(ix - 95), de
	add	a, l
	ld	l, a
	ld	iy, 0
	ld	(ix - 114), hl
	ex	de, hl
	ld	iyl, e
	ex	de, hl
	lea	hl, iy + 0
	ld	de, -2
	add	hl, de
	ld	bc, 3
	call	__imulu
	push	hl
	pop	bc
	ld	de, (ix - 92)
	push	de
	pop	hl
	add	hl, bc
	ld	(ix - 107), hl
	lea	hl, iy + 0
	dec	hl
	ld	(ix - 117), hl
	ld	bc, 3
	call	__imulu
	push	hl
	pop	bc
	ex	de, hl
	add	hl, bc
	ld	(ix - 110), hl
	lea	hl, iy + 0
	ld	bc, 3
	call	__imulu
	ld	(ix - 89), hl
	.local	.LBB106_3
.LBB106_3:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB106_11 Depth 2
	ld	hl, _.str.6.220
	ld	(ix - 86), hl
	ld	hl, _.str.7.221
	ld	(ix - 83), hl
	ld	hl, _.str.8.222
	ld	(ix - 80), hl
	ld	a, (_session+8)
	or	a, a
	ld	hl, _.str.10.223
	jr	z, .LBB106_5
; %bb.4:                                ;   in Loop: Header=BB106_3 Depth=1
	ld	hl, _.str.9.224
	.local	.LBB106_5
.LBB106_5:                              ;   in Loop: Header=BB106_3 Depth=1
	ld	(ix - 77), hl
	ld	a, (_disease+36)
	cp	a, 3
	jr	nc, .LBB106_7
; %bb.6:                                ;   in Loop: Header=BB106_3 Depth=1
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
	ld	hl, _.str.11.225
	push	hl
	ld	hl, 64
	push	hl
	ld	hl, (ix - 95)
	push	hl
	call	_snprintf
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	jr	.LBB106_8
	.local	.LBB106_7
.LBB106_7:                              ;   in Loop: Header=BB106_3 Depth=1
	ld	de, (ix - 95)
	ld	hl, _.str.12.226
	ld	bc, 29
	ldir
	.local	.LBB106_8
.LBB106_8:                              ;   in Loop: Header=BB106_3 Depth=1
	ld	a, (_disease+32)
	cp	a, 2
	jr	nz, .LBB106_10
; %bb.9:                                ;   in Loop: Header=BB106_3 Depth=1
	ld	hl, (ix - 95)
	ld	(ix - 74), hl
	.local	.LBB106_10
.LBB106_10:                             ;   in Loop: Header=BB106_3 Depth=1
	ld	hl, _.str.13.227
	ld	iy, (ix - 107)
	ld	(iy), hl
	ld	hl, _.str.14.228
	ld	iy, (ix - 110)
	ld	(iy), hl
	ld	hl, _.str.15.229
	push	hl
	call	_BeginScreen
	pop	hl
	ld	a, (ix - 1)
	or	a, a
	sbc	hl, hl
	ld	(ix - 111), a                   ; 1-byte Folded Spill
	ld	l, a
	ld	bc, 3
	call	__imulu
	ld	(ix - 98), hl
	ld	hl, 38
	push	hl
	pop	iy
	or	a, a
	sbc	hl, hl
	.local	.LBB106_11
.LBB106_11:                             ;   Parent Loop BB106_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	push	hl
	pop	bc
	ld	hl, (ix - 89)
	or	a, a
	sbc	hl, bc
	jr	z, .LBB106_15
; %bb.12:                               ;   in Loop: Header=BB106_11 Depth=2
	ld	hl, (ix - 92)
	add	hl, bc
	ld	de, (hl)
	ld	hl, (ix - 98)
	ld	(ix - 104), bc
	or	a, a
	sbc	hl, bc
	ld	hl, -1
	jr	z, .LBB106_14
; %bb.13:                               ;   in Loop: Header=BB106_11 Depth=2
	ld	hl, 0
	.local	.LBB106_14
.LBB106_14:                             ;   in Loop: Header=BB106_11 Depth=2
	push	hl
	push	iy
	push	de
	ld	(ix - 101), iy
	call	_MenuItem
	ld	iy, (ix - 101)
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (ix - 104)
	ld	de, 3
	add	hl, de
	ld	de, 24
	add	iy, de
	jr	.LBB106_11
	.local	.LBB106_15
.LBB106_15:                             ;   in Loop: Header=BB106_3 Depth=1
	ld	hl, 211
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, _.str.2.210
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 226
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, _.str.16.230
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	call	_gfx_SwapDraw
	call	_WaitKey
	ld	e, a
	cp	a, 6
	jp	z, .LBB106_32
; %bb.16:                               ;   in Loop: Header=BB106_3 Depth=1
	ld	a, e
	cp	a, 5
	jr	nz, .LBB106_18
; %bb.17:                               ;   in Loop: Header=BB106_3 Depth=1
	ld	a, (ix - 111)                   ; 1-byte Folded Reload
	or	a, a
	jp	z, .LBB106_32
	.local	.LBB106_18
.LBB106_18:                             ;   in Loop: Header=BB106_3 Depth=1
	ld	hl, (ix - 114)
	push	hl
	pea	ix - 1
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
	jp	nz, .LBB106_3
; %bb.19:                               ;   in Loop: Header=BB106_3 Depth=1
	bit	0, l
	jp	nz, .LBB106_3
; %bb.20:                               ;   in Loop: Header=BB106_3 Depth=1
	ld	l, (ix - 1)
	ld	a, l
	cp	a, 1
	jr	nz, .LBB106_22
; %bb.21:                               ;   in Loop: Header=BB106_3 Depth=1
	call	_EvolutionMenu
	jp	.LBB106_3
	.local	.LBB106_22
.LBB106_22:                             ;   in Loop: Header=BB106_3 Depth=1
	ld	a, l
	cp	a, 2
	jr	nz, .LBB106_24
; %bb.23:                               ;   in Loop: Header=BB106_3 Depth=1
	call	_RegionInfo
	jp	.LBB106_3
	.local	.LBB106_24
.LBB106_24:                             ;   in Loop: Header=BB106_3 Depth=1
	ld	a, l
	cp	a, 3
	jr	nz, .LBB106_26
; %bb.25:                               ;   in Loop: Header=BB106_3 Depth=1
	ld	a, (_session+8)
	ld	l, 1
	xor	a, l
	ld	l, a
	ld	(_session+8), a
	jp	.LBB106_3
	.local	.LBB106_26
.LBB106_26:                             ;   in Loop: Header=BB106_3 Depth=1
	ld	a, (_disease+32)
	ld	e, a
	ld	a, l
	cp	a, 4
	jr	nz, .LBB106_29
; %bb.27:                               ;   in Loop: Header=BB106_3 Depth=1
	ld	a, e
	cp	a, 2
	jr	nz, .LBB106_29
; %bb.28:                               ;   in Loop: Header=BB106_3 Depth=1
	call	_SporeMenu
	jp	.LBB106_3
	.local	.LBB106_29
.LBB106_29:                             ;   in Loop: Header=BB106_3 Depth=1
	ld	de, (ix - 117)
	ld	a, e
	cp	a, l
	ld	a, 1
	ld	l, a
	jr	z, .LBB106_31
; %bb.30:                               ;   in Loop: Header=BB106_3 Depth=1
	ld	a, 0
	ld	l, a
	.local	.LBB106_31
.LBB106_31:                             ;   in Loop: Header=BB106_3 Depth=1
	inc	l
	push	hl
	call	_SaveExit
	ld	e, a
	pop	hl
	or	a, a
	jp	z, .LBB106_3
	jr	.LBB106_33
	.local	.LBB106_32
.LBB106_32:
	ld	e, 0
	.local	.LBB106_33
.LBB106_33:
	ld	(ix - 89), e
	call	_EndModal
	ld	a, (ix - 89)                    ; 1-byte Folded Reload
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end106
.Lfunc_end106:
	.size	_ActionsMenu, .Lfunc_end106-_ActionsMenu
                                        ; -- End function
	.section	.text._SaveExit,"ax",@progbits
	.type	_SaveExit,@function             ; -- Begin function SaveExit
_SaveExit:                              ; @SaveExit
; %bb.0:
	call	__frameset0
	call	_SaveData
	bit	0, a
	jr	z, .LBB107_2
	.local	.LBB107_1
.LBB107_1:
	ld	a, (ix + 6)
	jp	.LBB107_10
	.local	.LBB107_2
.LBB107_2:                              ; %.preheader.preheader
	ld	hl, _.str.39.231
	ld	de, _SaveExit.choices
	ld	bc, 0
	ld	iy, 3
	.local	.LBB107_3
.LBB107_3:                              ; %.preheader
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
	jr	c, .LBB107_9
; %bb.4:                                ;   in Loop: Header=BB107_3 Depth=1
	ld	a, l
	cp	a, 1
	jr	nz, .LBB107_6
; %bb.5:                                ;   in Loop: Header=BB107_3 Depth=1
	call	_SaveData
	bit	0, a
	ld	hl, _.str.39.231
	ld	de, _SaveExit.choices
	ld	bc, 0
	ld	iy, 3
	jr	nz, .LBB107_1
	jr	.LBB107_3
	.local	.LBB107_6
.LBB107_6:                              ;   in Loop: Header=BB107_3 Depth=1
	ld	a, l
	cp	a, 2
	ld	hl, _.str.39.231
	ld	de, _SaveExit.choices
	ld	bc, 0
	ld	iy, 3
	jr	nz, .LBB107_3
; %bb.7:                                ;   in Loop: Header=BB107_3 Depth=1
	push	bc
	ld	hl, 2
	push	hl
	ld	hl, _SaveExit.confirm
	push	hl
	ld	hl, _.str.41.232
	push	hl
	call	_ChooseMenu
	ld	iy, 3
	ld	bc, 0
	ld	de, _SaveExit.choices
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, _.str.39.231
	cp	a, 1
	jr	nz, .LBB107_3
; %bb.8:
	ld	a, 2
	jr	.LBB107_10
	.local	.LBB107_9
.LBB107_9:
	xor	a, a
	.local	.LBB107_10
.LBB107_10:                             ; %.loopexit
	pop	ix
	ret
	.local	.Lfunc_end107
.Lfunc_end107:
	.size	_SaveExit, .Lfunc_end107-_SaveExit
                                        ; -- End function
	.section	.text._contagion_game_main,"ax",@progbits
	.globl	_contagion_game_main            ; -- Begin function contagion_game_main
	.type	_contagion_game_main,@function
_contagion_game_main:                   ; @contagion_game_main
; %bb.0:
	ld	hl, -91
	call	__frameset
	ld	l, 28
	ld	(ix - 75), l
	ld	(ix - 74), h
	lea	hl, ix - 40
	ld	(ix - 78), hl
	lea	hl, ix - 52
	ld	(ix - 55), hl
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
	ld.sis	hl, 515
	ld	iy, -917456
	ld	(iy), l
	ld	(iy + 1), h
	.local	.LBB108_1
.LBB108_1:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB108_10 Depth 2
                                        ;     Child Loop BB108_21 Depth 2
                                        ;       Child Loop BB108_22 Depth 3
                                        ;     Child Loop BB108_37 Depth 2
                                        ;       Child Loop BB108_38 Depth 3
                                        ;         Child Loop BB108_39 Depth 4
                                        ;     Child Loop BB108_87 Depth 2
                                        ;       Child Loop BB108_88 Depth 3
                                        ;     Child Loop BB108_107 Depth 2
	ld	hl, _.str.17.237
	push	hl
	call	_BeginScreen
	pop	hl
	ld	hl, 42
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, _.str.18.238
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
	ld	hl, _.str.19.239
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
	jr	z, .LBB108_3
; %bb.2:                                ;   in Loop: Header=BB108_1 Depth=1
	ld	e, 0
	.local	.LBB108_3
.LBB108_3:                              ;   in Loop: Header=BB108_1 Depth=1
	ld	a, e
	rrc	a
	sbc	a, a
	ld	l, a
	ld	bc, _.str.20.240
	ld	(ix - 52), bc
	bit	0, e
	jr	nz, .LBB108_7
; %bb.4:                                ;   in Loop: Header=BB108_1 Depth=1
	ld	a, (_disease+34)
	or	a, a
	ld	de, _.str.21.241
	jr	z, .LBB108_6
; %bb.5:                                ;   in Loop: Header=BB108_1 Depth=1
	ld	de, _.str.22.242
	.local	.LBB108_6
.LBB108_6:                              ;   in Loop: Header=BB108_1 Depth=1
	ld	(ix - 49), de
	.local	.LBB108_7
.LBB108_7:                              ;   in Loop: Header=BB108_1 Depth=1
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
	ld	bc, _.str.14.228
	ld	(hl), bc
	ld	a, (ix - 43)
	ld	(ix - 73), iy
	cp	a, iyl
	jr	c, .LBB108_9
; %bb.8:                                ;   in Loop: Header=BB108_1 Depth=1
	xor	a, a
	.local	.LBB108_9
.LBB108_9:                              ;   in Loop: Header=BB108_1 Depth=1
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
	.local	.LBB108_10
.LBB108_10:                             ;   Parent Loop BB108_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	jr	z, .LBB108_14
; %bb.11:                               ;   in Loop: Header=BB108_10 Depth=2
	ld	(ix - 61), de
	ld	hl, (ix - 55)
	add	hl, bc
	ld	de, (hl)
	ld	hl, (ix - 58)
	ld	(ix - 67), bc
	or	a, a
	sbc	hl, bc
	ld	hl, -1
	jr	z, .LBB108_13
; %bb.12:                               ;   in Loop: Header=BB108_10 Depth=2
	ld	hl, 0
	.local	.LBB108_13
.LBB108_13:                             ;   in Loop: Header=BB108_10 Depth=2
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
	jr	.LBB108_10
	.local	.LBB108_14
.LBB108_14:                             ;   in Loop: Header=BB108_1 Depth=1
	ld	hl, 207
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, _.str.2.210
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 224
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, _.str.23.243
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	call	_gfx_SwapDraw
	call	_WaitKey
	ld	e, a
	cp	a, 6
	jr	nz, .LBB108_17
; %bb.15:                               ;   in Loop: Header=BB108_1 Depth=1
	ld	hl, (ix - 70)
	ld	a, l
	.local	.LBB108_16
.LBB108_16:                             ; %.loopexit
                                        ;   in Loop: Header=BB108_1 Depth=1
	ld	(ix - 43), a
	jp	.LBB108_1
	.local	.LBB108_17
.LBB108_17:                             ;   in Loop: Header=BB108_1 Depth=1
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
	jp	nz, .LBB108_1
; %bb.18:                               ;   in Loop: Header=BB108_1 Depth=1
	bit	0, l
	jp	nz, .LBB108_1
; %bb.19:                               ;   in Loop: Header=BB108_1 Depth=1
	ld	l, (ix - 43)
	ld	a, l
	or	a, a
	jp	nz, .LBB108_33
; %bb.20:                               ; %.preheader.preheader
                                        ;   in Loop: Header=BB108_1 Depth=1
	xor	a, a
	ld	(ix - 58), a                    ; 1-byte Folded Spill
	.local	.LBB108_21
.LBB108_21:                             ; %.preheader
                                        ;   Parent Loop BB108_1 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB108_22 Depth 3
	ld	hl, _.str.52.244
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
	.local	.LBB108_22
.LBB108_22:                             ;   Parent Loop BB108_1 Depth=1
                                        ;     Parent Loop BB108_21 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
	push	hl
	pop	bc
	ld	de, 72
	or	a, a
	sbc	hl, de
	jr	z, .LBB108_26
; %bb.23:                               ;   in Loop: Header=BB108_22 Depth=3
	ld	hl, (ix - 67)
	or	a, a
	sbc	hl, bc
	ld	(ix - 61), iy
	jr	nz, .LBB108_25
; %bb.24:                               ;   in Loop: Header=BB108_22 Depth=3
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
	.local	.LBB108_25
.LBB108_25:                             ;   in Loop: Header=BB108_22 Depth=3
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
	jr	.LBB108_22
	.local	.LBB108_26
.LBB108_26:                             ;   in Loop: Header=BB108_21 Depth=2
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
	ld	hl, _.str.53.245
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 225
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, _.str.54.246
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	call	_gfx_SwapDraw
	call	_WaitKey
	ld	l, a
	cp	a, 3
	jr	nz, .LBB108_28
; %bb.27:                               ;   in Loop: Header=BB108_21 Depth=2
	ld	e, 2
	ld	a, (ix - 58)
	add	a, e
	ld	e, a
	jr	.LBB108_30
	.local	.LBB108_28
.LBB108_28:                             ;   in Loop: Header=BB108_21 Depth=2
	ld	a, l
	cp	a, 4
	ld	e, (ix - 58)                    ; 1-byte Folded Reload
	jr	nz, .LBB108_32
; %bb.29:                               ;   in Loop: Header=BB108_21 Depth=2
	inc	e
	.local	.LBB108_30
.LBB108_30:                             ;   in Loop: Header=BB108_21 Depth=2
	ld	a, e
	ld	c, 3
	call	__bremu
	ld	e, a
	.local	.LBB108_31
.LBB108_31:                             ;   in Loop: Header=BB108_21 Depth=2
	ld	(ix - 58), e
	ld	a, l
	cp	a, 5
	jp	nz, .LBB108_21
	jr	.LBB108_36
	.local	.LBB108_32
.LBB108_32:                             ;   in Loop: Header=BB108_21 Depth=2
	ld	a, l
	cp	a, 6
	jp	z, .LBB108_104
	jr	.LBB108_31
	.local	.LBB108_33
.LBB108_33:                             ;   in Loop: Header=BB108_1 Depth=1
	ld	de, 0
	ld	e, l
	ld	hl, (ix - 70)
	or	a, a
	sbc	hl, de
	jp	nz, .LBB108_78
; %bb.34:                               ;   in Loop: Header=BB108_1 Depth=1
	ld	hl, 2
	push	hl
	call	_SaveExit
	pop	hl
	cp	a, 2
	ld	l, -1
	jp	z, .LBB108_80
; %bb.35:                               ;   in Loop: Header=BB108_1 Depth=1
	ld	l, 0
	jp	.LBB108_80
	.local	.LBB108_36
.LBB108_36:                             ;   in Loop: Header=BB108_1 Depth=1
	call	_ResetGameState
	ld	a, (ix - 58)                    ; 1-byte Folded Reload
	ld	(_disease+32), a
	ld	hl, _effects
	push	hl
	ld	hl, _disease
	push	hl
	call	_CalculateEffects
	pop	hl
	pop	hl
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
	.local	.LBB108_37
.LBB108_37:                             ;   Parent Loop BB108_1 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB108_38 Depth 3
                                        ;         Child Loop BB108_39 Depth 4
	or	a, a
	sbc	hl, hl
	ld	l, d
	ld	(ix - 84), hl
	ld	(ix - 88), d
	.local	.LBB108_38
.LBB108_38:                             ;   Parent Loop BB108_1 Depth=1
                                        ;     Parent Loop BB108_37 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB108_39 Depth 4
	ld	hl, _.str.57.247
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
	.local	.LBB108_39
.LBB108_39:                             ;   Parent Loop BB108_1 Depth=1
                                        ;     Parent Loop BB108_37 Depth=2
                                        ;       Parent Loop BB108_38 Depth=3
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
	jp	z, .LBB108_43
; %bb.40:                               ;   in Loop: Header=BB108_39 Depth=4
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
	jr	nz, .LBB108_42
; %bb.41:                               ;   in Loop: Header=BB108_39 Depth=4
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
	.local	.LBB108_42
.LBB108_42:                             ;   in Loop: Header=BB108_39 Depth=4
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
	jp	.LBB108_39
	.local	.LBB108_43
.LBB108_43:                             ;   in Loop: Header=BB108_38 Depth=3
	ld	a, (ix - 61)                    ; 1-byte Folded Reload
	cp	a, 38
	ld	hl, -1
	jr	z, .LBB108_45
; %bb.44:                               ;   in Loop: Header=BB108_38 Depth=3
	ld	hl, 0
	.local	.LBB108_45
.LBB108_45:                             ;   in Loop: Header=BB108_38 Depth=3
	push	hl
	ld	hl, 181
	push	hl
	ld	hl, _.str.58.248
	push	hl
	call	_MenuItem
	pop	hl
	pop	hl
	pop	hl
	ld	hl, (ix - 84)
	push	hl
	ld	hl, _.str.59.249
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
	ld	hl, _.str.60.250
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 229
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, _.str.54.246
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	call	_gfx_SwapDraw
	call	_WaitKey
	ld	l, a
	cp	a, 6
	jp	z, .LBB108_103
; %bb.46:                               ;   in Loop: Header=BB108_38 Depth=3
	ld	a, (ix - 61)                    ; 1-byte Folded Reload
	cp	a, 38
                                        ; kill: def $a killed $a
	sbc	a, a
	ld	e, a
	ld	a, l
	cp	a, 1
	ld	h, -1
	jr	z, .LBB108_48
; %bb.47:                               ;   in Loop: Header=BB108_38 Depth=3
	ld	h, 0
	.local	.LBB108_48
.LBB108_48:                             ;   in Loop: Header=BB108_38 Depth=3
	ld	a, (ix - 61)                    ; 1-byte Folded Reload
	or	a, a
	ld	c, 37
	ld	iy, _disease+37
	jr	z, .LBB108_50
; %bb.49:                               ;   in Loop: Header=BB108_38 Depth=3
	ld	c, (ix - 61)                    ; 1-byte Folded Reload
	dec	c
	.local	.LBB108_50
.LBB108_50:                             ;   in Loop: Header=BB108_38 Depth=3
	ld	a, h
	and	a, e
	ld	e, a
	bit	0, e
	jr	nz, .LBB108_52
; %bb.51:                               ;   in Loop: Header=BB108_38 Depth=3
	ld	c, (ix - 61)                    ; 1-byte Folded Reload
	.local	.LBB108_52
.LBB108_52:                             ;   in Loop: Header=BB108_38 Depth=3
	ld	a, l
	cp	a, 2
	ld	h, -1
	jr	z, .LBB108_54
; %bb.53:                               ;   in Loop: Header=BB108_38 Depth=3
	ld	h, 0
	.local	.LBB108_54
.LBB108_54:                             ;   in Loop: Header=BB108_38 Depth=3
	ld	a, c
	cp	a, 38
                                        ; kill: def $a killed $a
	sbc	a, a
	ld	d, a
	ld	a, c
	inc	a
	cp	a, 38
	ld	e, 0
	jr	z, .LBB108_56
; %bb.55:                               ;   in Loop: Header=BB108_38 Depth=3
	ld	e, a
	.local	.LBB108_56
.LBB108_56:                             ;   in Loop: Header=BB108_38 Depth=3
	ld	a, h
	and	a, d
	ld	h, a
	bit	0, h
	jr	nz, .LBB108_58
; %bb.57:                               ;   in Loop: Header=BB108_38 Depth=3
	ld	e, c
	.local	.LBB108_58
.LBB108_58:                             ;   in Loop: Header=BB108_38 Depth=3
	ld	a, l
	cp	a, 3
	ld	d, (ix - 88)                    ; 1-byte Folded Reload
	jr	nz, .LBB108_64
; %bb.59:                               ;   in Loop: Header=BB108_38 Depth=3
	ld	a, e
	cp	a, 10
	jr	nc, .LBB108_61
; %bb.60:                               ;   in Loop: Header=BB108_38 Depth=3
	ld	c, e
	jr	.LBB108_62
	.local	.LBB108_61
.LBB108_61:                             ;   in Loop: Header=BB108_38 Depth=3
	ld	c, -10
	ld	a, e
	add	a, c
	ld	c, a
	.local	.LBB108_62
.LBB108_62:                             ;   in Loop: Header=BB108_38 Depth=3
	ld	a, e
	cp	a, 38
	ld	e, 30
	jr	z, .LBB108_64
; %bb.63:                               ;   in Loop: Header=BB108_38 Depth=3
	ld	e, c
	.local	.LBB108_64
.LBB108_64:                             ;   in Loop: Header=BB108_38 Depth=3
	ld	a, e
	cp	a, 28
	ld	c, e
	jp	c, .LBB108_66
; %bb.65:                               ;   in Loop: Header=BB108_38 Depth=3
	ld	c, (ix - 75)
	ld	b, (ix - 74)
                                        ; kill: def $c killed $c killed $bc
	.local	.LBB108_66
.LBB108_66:                             ;   in Loop: Header=BB108_38 Depth=3
	ld	a, l
	cp	a, 4
	jr	z, .LBB108_68
; %bb.67:                               ;   in Loop: Header=BB108_38 Depth=3
	ld	(ix - 61), e                    ; 1-byte Folded Spill
	jr	.LBB108_69
	.local	.LBB108_68
.LBB108_68:                             ;   in Loop: Header=BB108_38 Depth=3
	ld	h, 10
	ld	a, c
	add	a, h
	ld	c, a
	ld	(ix - 61), c
	.local	.LBB108_69
.LBB108_69:                             ;   in Loop: Header=BB108_38 Depth=3
	ld	bc, 0
	ld	a, l
	cp	a, 5
	jr	nz, .LBB108_71
; %bb.70:                               ;   in Loop: Header=BB108_38 Depth=3
	ld	a, (ix - 61)                    ; 1-byte Folded Reload
	cp	a, 38
	jr	z, .LBB108_84
	.local	.LBB108_71
.LBB108_71:                             ;   in Loop: Header=BB108_38 Depth=3
	ld	a, d
	cp	a, 19
	jr	nc, .LBB108_73
; %bb.72:                               ;   in Loop: Header=BB108_38 Depth=3
	ld	a, l
	cp	a, 5
	jr	z, .LBB108_76
	.local	.LBB108_73
.LBB108_73:                             ;   in Loop: Header=BB108_38 Depth=3
	ld	a, d
	or	a, a
	jp	z, .LBB108_38
; %bb.74:                               ;   in Loop: Header=BB108_38 Depth=3
	ld	a, l
	cp	a, 10
	jp	nz, .LBB108_38
; %bb.75:                               ;   in Loop: Header=BB108_37 Depth=2
	dec	d
	jr	.LBB108_77
	.local	.LBB108_76
.LBB108_76:                             ;   in Loop: Header=BB108_37 Depth=2
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
	.local	.LBB108_77
.LBB108_77:                             ;   in Loop: Header=BB108_37 Depth=2
	ld	c, d
	lea	hl, iy + 0
	add	hl, bc
	ld	(hl), 0
	jp	.LBB108_37
	.local	.LBB108_78
.LBB108_78:                             ;   in Loop: Header=BB108_1 Depth=1
	ld	a, (_disease+34)
	or	a, a
	jr	nz, .LBB108_83
	.local	.LBB108_79
.LBB108_79:                             ;   in Loop: Header=BB108_1 Depth=1
	call	_Play
	ld	l, a
	.local	.LBB108_80
.LBB108_80:                             ;   in Loop: Header=BB108_1 Depth=1
	ld	a, (_disease+33)
	or	a, a
	ld	a, 1
	jr	nz, .LBB108_82
; %bb.81:                               ;   in Loop: Header=BB108_1 Depth=1
	ld	a, 0
	.local	.LBB108_82
.LBB108_82:                             ;   in Loop: Header=BB108_1 Depth=1
	ld	(ix - 43), a
	bit	0, l
	jp	z, .LBB108_1
	jp	.LBB108_112
	.local	.LBB108_83
.LBB108_83:                             ;   in Loop: Header=BB108_1 Depth=1
	call	_ResultScreen
	jp	.LBB108_104
	.local	.LBB108_84
.LBB108_84:                             ;   in Loop: Header=BB108_1 Depth=1
	ld	a, d
	or	a, a
	jr	nz, .LBB108_86
; %bb.85:                               ;   in Loop: Header=BB108_1 Depth=1
	lea	de, iy + 0
	ld	hl, _.str.61.251
	ld	bc, 9
	ldir
	.local	.LBB108_86
.LBB108_86:                             ;   in Loop: Header=BB108_1 Depth=1
	ld	a, 80
	ld	(_session+6), a
	ld	l, 60
	.local	.LBB108_87
.LBB108_87:                             ;   Parent Loop BB108_1 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB108_88 Depth 3
	ld	a, l
	ld	(_session+7), a
	.local	.LBB108_88
.LBB108_88:                             ;   Parent Loop BB108_1 Depth=1
                                        ;     Parent Loop BB108_87 Depth=2
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
	ld	hl, _.str.55.252
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 219
	push	hl
	ld	hl, 4
	push	hl
	ld	hl, _.str.56.253
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
	jr	z, .LBB108_103
; %bb.89:                               ;   in Loop: Header=BB108_88 Depth=3
	ld	a, (_session+6)
	ld	e, a
	ld	a, l
	cp	a, 1
	jr	nz, .LBB108_91
; %bb.90:                               ;   in Loop: Header=BB108_88 Depth=3
	ld	a, e
	or	a, a
	ld	a, -1
	jr	nz, .LBB108_93
	.local	.LBB108_91
.LBB108_91:                             ;   in Loop: Header=BB108_88 Depth=3
	ld	a, l
	cp	a, 2
	jr	nz, .LBB108_94
; %bb.92:                               ;   in Loop: Header=BB108_88 Depth=3
	ld	a, e
	cp	a, -97
	ld	a, 1
	jr	nc, .LBB108_94
	.local	.LBB108_93
.LBB108_93:                             ;   in Loop: Header=BB108_88 Depth=3
	add	a, e
	ld	e, a
	ld	(_session+6), a
	.local	.LBB108_94
.LBB108_94:                             ;   in Loop: Header=BB108_88 Depth=3
	ld	a, (_session+7)
	ld	c, a
	ld	a, l
	cp	a, 3
	jr	nz, .LBB108_96
; %bb.95:                               ;   in Loop: Header=BB108_88 Depth=3
	ld	a, c
	or	a, a
	jr	nz, .LBB108_100
	.local	.LBB108_96
.LBB108_96:                             ;   in Loop: Header=BB108_88 Depth=3
	ld	a, l
	cp	a, 4
	jr	nz, .LBB108_98
; %bb.97:                               ;   in Loop: Header=BB108_88 Depth=3
	ld	a, c
	cp	a, 119
	jr	c, .LBB108_101
	.local	.LBB108_98
.LBB108_98:                             ;   in Loop: Header=BB108_88 Depth=3
	ld	a, l
	cp	a, 5
	jp	nz, .LBB108_88
; %bb.99:                               ;   in Loop: Header=BB108_88 Depth=3
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
	jp	z, .LBB108_88
	jr	.LBB108_106
	.local	.LBB108_100
.LBB108_100:                            ;   in Loop: Header=BB108_87 Depth=2
	ld	a, -1
	jr	.LBB108_102
	.local	.LBB108_101
.LBB108_101:                            ;   in Loop: Header=BB108_87 Depth=2
	ld	a, 1
	.local	.LBB108_102
.LBB108_102:                            ;   in Loop: Header=BB108_87 Depth=2
	add	a, c
	ld	l, a
	jp	.LBB108_87
	.local	.LBB108_103
.LBB108_103:                            ;   in Loop: Header=BB108_1 Depth=1
	call	_ResetGameState
	.local	.LBB108_104
.LBB108_104:                            ; %.loopexit
                                        ;   in Loop: Header=BB108_1 Depth=1
	ld	a, (_disease+33)
	or	a, a
	ld	a, 1
	jp	nz, .LBB108_16
; %bb.105:                              ; %.loopexit
                                        ;   in Loop: Header=BB108_1 Depth=1
	ld	a, 0
	jp	.LBB108_16
	.local	.LBB108_106
.LBB108_106:                            ;   in Loop: Header=BB108_1 Depth=1
	ld	a, (_disease+30)
	ld	iyh, a
	ld	iyl, 0
	ld	bc, 0
	.local	.LBB108_107
.LBB108_107:                            ;   Parent Loop BB108_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	push	bc
	pop	hl
	ld	de, 7
	or	a, a
	sbc	hl, de
	jr	z, .LBB108_111
; %bb.108:                              ;   in Loop: Header=BB108_107 Depth=2
	ld	hl, 1
	call	__ishl
	ld	e, iyh
	ld	a, l
	and	a, e
	ld	l, a
	or	a, a
	jr	z, .LBB108_110
; %bb.109:                              ;   in Loop: Header=BB108_107 Depth=2
	ld	a, iyl
	ld	(_session+4), a
	.local	.LBB108_110
.LBB108_110:                            ;   in Loop: Header=BB108_107 Depth=2
	inc	bc
	inc	iyl
	jr	.LBB108_107
	.local	.LBB108_111
.LBB108_111:                            ;   in Loop: Header=BB108_1 Depth=1
	ld	a, 1
	ld	(_disease+33), a
	call	_ReleaseKeys
	or	a, a
	sbc	hl, hl
	ld	(-917504), hl
	xor	a, a
	ld	(-917501), a
	jp	.LBB108_79
	.local	.LBB108_112
.LBB108_112:
	call	_gfx_End
	or	a, a
	sbc	hl, hl
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end108
.Lfunc_end108:
	.size	_contagion_game_main, .Lfunc_end108-_contagion_game_main
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
	.local	.LBB109_1
.LBB109_1:                              ; =>This Inner Loop Header: Depth=1
	ld	hl, (ix - 3)
	push	bc
	pop	de
	or	a, a
	sbc	hl, bc
	jr	z, .LBB109_3
; %bb.2:                                ;   in Loop: Header=BB109_1 Depth=1
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
	jr	.LBB109_1
	.local	.LBB109_3
.LBB109_3:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end109
.Lfunc_end109:
	.size	_InitializeMap, .Lfunc_end109-_InitializeMap
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
	.local	.LBB110_1
.LBB110_1:                              ; =>This Inner Loop Header: Depth=1
	push	de
	pop	hl
	or	a, a
	sbc	hl, bc
	jr	z, .LBB110_3
; %bb.2:                                ;   in Loop: Header=BB110_1 Depth=1
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
	jr	.LBB110_1
	.local	.LBB110_3
.LBB110_3:
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end110
.Lfunc_end110:
	.size	_DrawMap, .Lfunc_end110-_DrawMap
                                        ; -- End function
	.section	.text._Play,"ax",@progbits
	.type	_Play,@function                 ; -- Begin function Play
_Play:                                  ; @Play
; %bb.0:
	ld	hl, -156
	call	__frameset
	lea	hl, ix - 86
	ld	de, -132
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	ld	de, -129
	lea	hl, ix + 0
	add	hl, de
	ld	de, -139
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	call	_ReleaseKeys
	or	a, a
	sbc	hl, hl
	ld	(-917504), hl
	xor	a, a
	ld	de, -136
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), a                     ; 1-byte Folded Spill
	.local	.LBB111_1
.LBB111_1:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB111_13 Depth 2
                                        ;     Child Loop BB111_16 Depth 2
                                        ;     Child Loop BB111_21 Depth 2
                                        ;     Child Loop BB111_34 Depth 2
	xor	a, a
	ld	(-917501), a
	ld	a, (_disease+34)
	or	a, a
	jp	nz, .LBB111_56
; %bb.2:                                ;   in Loop: Header=BB111_1 Depth=1
	call	_ReadKey
	ld	e, a
	or	a, a
	jr	nz, .LBB111_6
	.local	.LBB111_3
.LBB111_3:                              ;   in Loop: Header=BB111_1 Depth=1
	ld	a, e
	or	a, a
	ld	a, 1
	jr	z, .LBB111_5
; %bb.4:                                ;   in Loop: Header=BB111_1 Depth=1
	ld	a, 0
	.local	.LBB111_5
.LBB111_5:                              ;   in Loop: Header=BB111_1 Depth=1
	ld	(_canpress), a
	jr	.LBB111_9
	.local	.LBB111_6
.LBB111_6:                              ;   in Loop: Header=BB111_1 Depth=1
	ld	a, (_canpress)
	bit	0, a
	jr	z, .LBB111_9
; %bb.7:                                ;   in Loop: Header=BB111_1 Depth=1
	ld	l, -5
	ld	a, e
	add	a, l
	ld	l, a
	cp	a, 2
	ld	bc, -135
	lea	iy, ix + 0
	push	af
	add	iy, bc
	pop	af
	ld	(iy + 0), e
	jp	nc, .LBB111_55
; %bb.8:                                ;   in Loop: Header=BB111_1 Depth=1
	call	_ActionsMenu
	ld	bc, -135
	lea	iy, ix + 0
	add	iy, bc
	ld	e, (iy + 0)                     ; 1-byte Folded Reload
	ld	l, a
	or	a, a
	jp	nz, .LBB111_58
	jr	.LBB111_3
	.local	.LBB111_9
.LBB111_9:                              ;   in Loop: Header=BB111_1 Depth=1
	ld	hl, _GameRandom
	push	hl
	ld	hl, _effects
	push	hl
	ld	hl, _session+5
	push	hl
	ld	hl, _region
	push	hl
	call	_StepWorldRegion
	ld	de, -135
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), a                     ; 1-byte Folded Spill
	pop	hl
	pop	hl
	pop	hl
	pop	hl
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
	call	_Transport
	ld	hl, 21
	add	hl, sp
	ld	sp, hl
	ld	l, 1
	and	a, l
	ld	l, a
	ld	(_connection), a
	ld	de, -135
	lea	iy, ix + 0
	push	af
	add	iy, de
	pop	af
	bit	0, (iy + 0)                     ; 1-byte Folded Reload
	jp	z, .LBB111_27
; %bb.10:                               ;   in Loop: Header=BB111_1 Depth=1
	ld	hl, _GameRandom
	push	hl
	ld	hl, _effects
	push	hl
	ld	hl, _disease
	push	hl
	ld	hl, _region
	push	hl
	call	_Migrate
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, _GameRandom
	push	hl
	ld	hl, _disease
	push	hl
	call	_Mutate
	pop	hl
	pop	hl
	cp	a, -1
	jr	z, .LBB111_12
; %bb.11:                               ;   in Loop: Header=BB111_1 Depth=1
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	de, -135
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	ld	hl, _effects
	push	hl
	ld	hl, _disease
	push	hl
	call	_CalculateEffects
	pop	hl
	pop	hl
	ld	de, -135
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	ld	bc, 22
	call	__imulu
	ex	de, hl
	ld	hl, _traits
	add	hl, de
	ld	hl, (hl)
	push	hl
	ld	hl, _.str.64.254
	push	hl
	ld	hl, 48
	push	hl
	ld	de, -132
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_snprintf
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	de, -132
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_QueueNews
	pop	hl
	.local	.LBB111_12
.LBB111_12:                             ; %.preheader20
                                        ;   in Loop: Header=BB111_1 Depth=1
	ld	iy, _region+10
	or	a, a
	sbc	hl, hl
	.local	.LBB111_13
.LBB111_13:                             ;   Parent Loop BB111_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	push	hl
	pop	bc
	ld	de, 42
	or	a, a
	sbc	hl, de
	jr	z, .LBB111_15
; %bb.14:                               ;   in Loop: Header=BB111_13 Depth=2
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 11)
	pop	ix
	add	hl, bc
	ex	de, hl
	lea	hl, iy + 0
	push	ix
	lea	ix, ix - 128
	ld	(ix - 7), bc
	pop	ix
	ld	bc, 6
	ldir
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 7)
	pop	ix
	ld	de, 6
	add	hl, de
	lea	iy, iy + 16
	jr	.LBB111_13
	.local	.LBB111_15
.LBB111_15:                             ;   in Loop: Header=BB111_1 Depth=1
	ld	hl, _effects
	push	hl
	ld	de, -139
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _disease
	push	hl
	call	_AdvanceDisease
	pop	hl
	pop	hl
	pop	hl
	ld	l, 1
	ld	de, -135
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), a                     ; 1-byte Folded Spill
	and	a, l
	ld	l, a
	bit	0, l
	ld	hl, _.str.65.255
	push	hl
	call	nz, _QueueNews
	pop	hl
	ld	de, -135
	lea	iy, ix + 0
	push	af
	add	iy, de
	pop	af
	bit	1, (iy + 0)                     ; 1-byte Folded Reload
	ld	hl, _.str.66.256
	push	hl
	call	nz, _QueueNews
	pop	hl
	ld	de, -135
	lea	iy, ix + 0
	push	af
	add	iy, de
	pop	af
	bit	2, (iy + 0)                     ; 1-byte Folded Reload
	ld	hl, _.str.67.257
	push	hl
	call	nz, _QueueNews
	pop	hl
	ld	de, -135
	lea	iy, ix + 0
	push	af
	add	iy, de
	pop	af
	bit	3, (iy + 0)                     ; 1-byte Folded Reload
	ld	hl, _.str.68.258
	push	hl
	call	nz, _QueueNews
	pop	hl
	ld	de, -135
	lea	iy, ix + 0
	push	af
	add	iy, de
	pop	af
	bit	4, (iy + 0)                     ; 1-byte Folded Reload
	ld	hl, _.str.69.259
	push	hl
	call	nz, _QueueNews
	pop	hl
	ld	de, -135
	lea	iy, ix + 0
	push	af
	add	iy, de
	pop	af
	bit	5, (iy + 0)                     ; 1-byte Folded Reload
	ld	hl, _.str.70.260
	push	hl
	call	nz, _QueueNews
	pop	hl
	ld	de, -135
	lea	iy, ix + 0
	push	af
	add	iy, de
	pop	af
	bit	6, (iy + 0)                     ; 1-byte Folded Reload
	ld	hl, _.str.71.261
	push	hl
	call	nz, _QueueNews
	pop	hl
	ld	de, 0
	xor	a, a
	ld	bc, -135
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), a                     ; 1-byte Folded Spill
	.local	.LBB111_16
.LBB111_16:                             ;   Parent Loop BB111_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	push	de
	pop	hl
	ld	bc, 132
	or	a, a
	sbc	hl, bc
	jp	z, .LBB111_20
; %bb.17:                               ;   in Loop: Header=BB111_16 Depth=2
	ld	iy, _port
	add	iy, de
	bit	0, (iy + 5)
	jp	z, .LBB111_19
; %bb.18:                               ;   in Loop: Header=BB111_16 Depth=2
	ld	hl, 1
	ld	c, (iy + 2)
	call	__ishl
                                        ; kill: def $l killed $l killed $uhl
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 7
	ld	c, (iy + 0)
	ld	a, c
	or	a, l
	ld	c, a
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 7
	ld	(iy + 0), c
	.local	.LBB111_19
.LBB111_19:                             ;   in Loop: Header=BB111_16 Depth=2
	ex	de, hl
	ld	de, 6
	add	hl, de
	ex	de, hl
	jp	.LBB111_16
	.local	.LBB111_20
.LBB111_20:                             ;   in Loop: Header=BB111_1 Depth=1
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
	ld	bc, -135
	lea	iy, ix + 0
	add	iy, bc
	ld	a, (iy + 0)
	xor	a, e
	ld	e, a
	ld	a, l
	and	a, e
	ld	iyh, a
	ld	bc, 0
	ld	iyl, b
	.local	.LBB111_21
.LBB111_21:                             ;   Parent Loop BB111_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	push	bc
	pop	hl
	ld	de, 7
	or	a, a
	sbc	hl, de
	jr	z, .LBB111_25
; %bb.22:                               ;   in Loop: Header=BB111_21 Depth=2
	ld	hl, 1
	call	__ishl
	ld	e, iyh
	ld	a, l
	and	a, e
	ld	l, a
	or	a, a
	ld	l, 1
	jr	nz, .LBB111_24
; %bb.23:                               ;   in Loop: Header=BB111_21 Depth=2
	ld	l, 0
	.local	.LBB111_24
.LBB111_24:                             ;   in Loop: Header=BB111_21 Depth=2
	ld	a, iyl
	add	a, l
	ld	iyl, a
	inc	bc
	jr	.LBB111_21
	.local	.LBB111_25
.LBB111_25:                             ;   in Loop: Header=BB111_1 Depth=1
	ld	a, iyl
	or	a, a
	jr	z, .LBB111_27
; %bb.26:                               ;   in Loop: Header=BB111_1 Depth=1
	or	a, a
	sbc	hl, hl
	ex	de, hl
	ld	e, iyl
	ex	de, hl
	push	hl
	ld	hl, _.str.72.262
	push	hl
	ld	hl, 48
	push	hl
	ld	de, -132
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_snprintf
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	de, -132
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_QueueNews
	pop	hl
	.local	.LBB111_27
.LBB111_27:                             ;   in Loop: Header=BB111_1 Depth=1
	call	_DrawMap
	ld	a, (_session+8)
	or	a, a
	jp	nz, .LBB111_31
; %bb.28:                               ;   in Loop: Header=BB111_1 Depth=1
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
	push	ix
	lea	ix, ix - 128
	ld	(ix - 7), hl
	pop	ix
	ld	a, (iy + 9)
	or	a, a
	sbc	hl, hl
	push	hl
	pop	de
	ld	l, a
	add	hl, hl
	push	ix
	lea	ix, ix - 128
	ld	(ix - 14), hl
	pop	ix
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
	ld	de, -142
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -135
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_gfx_Rectangle
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	.local	.LBB111_29
.LBB111_29:                             ; %.loopexit
                                        ;   in Loop: Header=BB111_1 Depth=1
	ld	hl, _region
	push	hl
	ld	de, -129
	lea	iy, ix + 0
	add	iy, de
	pea	iy + 0
	call	_CountWorld
	pop	hl
	pop	hl
	ld	bc, -129
	lea	iy, ix + 0
	add	iy, bc
	ld	de, (iy + 0)
	ld	bc, (ix - 127)
	ld	hl, (ix - 125)
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 26
	ld	(iy + 0), hl
                                        ; kill: def $hl killed $hl killed $uhl
	add.sis	hl, bc
	ld	bc, -156
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), l
	ld	(iy + 1), h
	add.sis	hl, de
	ld	de, -135
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), l
	ld	(iy + 1), h
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
	ld	hl, _.str.73.263
	push	hl
	ld	hl, 80
	push	hl
	ld	de, -132
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_snprintf
	ld	hl, 21
	add	hl, sp
	ld	sp, hl
	ld	hl, 4
	push	hl
	push	hl
	ld	de, -132
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	a, (_news_count)
	or	a, a
	jp	nz, .LBB111_44
; %bb.30:                               ;   in Loop: Header=BB111_1 Depth=1
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
	jp	.LBB111_46
	.local	.LBB111_31
.LBB111_31:                             ;   in Loop: Header=BB111_1 Depth=1
	ld	hl, 7
	push	hl
	call	_gfx_SetColor
	pop	hl
	ld	a, (_connection)
	bit	0, a
	jp	z, .LBB111_33
; %bb.32:                               ;   in Loop: Header=BB111_1 Depth=1
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
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 7
	ld	(iy + 0), hl
	push	de
	pop	iy
	ld	a, (iy + 1)
	push	bc
	pop	hl
	ld	l, a
	add	hl, hl
	ld	de, -142
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
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
	ld	de, -142
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -135
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_gfx_Line
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	.local	.LBB111_33
.LBB111_33:                             ; %.preheader
                                        ;   in Loop: Header=BB111_1 Depth=1
	or	a, a
	sbc	hl, hl
	.local	.LBB111_34
.LBB111_34:                             ;   Parent Loop BB111_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	push	hl
	pop	bc
	ld	de, 132
	or	a, a
	sbc	hl, de
	jp	z, .LBB111_29
; %bb.35:                               ;   in Loop: Header=BB111_34 Depth=2
	ld	hl, _port
	push	hl
	pop	iy
	ld	de, -142
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), bc
	add	iy, bc
	ld	de, -135
	lea	hl, ix + 0
	add	hl, de
	ld	(hl), iy
	bit	0, (iy + 5)
	ld	a, 64
	ld	l, a
	jr	nz, .LBB111_37
; %bb.36:                               ;   in Loop: Header=BB111_34 Depth=2
	ld	a, 7
	ld	l, a
	.local	.LBB111_37
.LBB111_37:                             ;   in Loop: Header=BB111_34 Depth=2
	push	hl
	call	_gfx_SetColor
	pop	hl
	ld	de, -135
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	ld	l, (iy + 3)
	ld	e, 1
	ld	a, l
	and	a, e
	ld	e, a
	bit	0, e
	jp	z, .LBB111_39
; %bb.38:                               ;   in Loop: Header=BB111_34 Depth=2
	ld	a, (iy)
	ld	de, 0
	push	de
	pop	hl
	ld	l, a
	add	hl, hl
	push	hl
	pop	bc
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 23
	ld	(iy + 0), bc
	push	ix
	lea	ix, ix - 128
	ld	iy, (ix - 7)
	pop	ix
	ld	a, (iy + 1)
	push	de
	pop	iy
	ld	iyl, a
	add	iy, iy
	lea	hl, iy + 0
	ld	de, -3
	add	hl, de
	push	ix
	lea	ix, ix - 128
	ld	(ix - 17), hl
	pop	ix
	push	bc
	pop	hl
	add	hl, de
	push	ix
	lea	ix, ix - 128
	ld	(ix - 20), hl
	pop	ix
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
	ld	de, -148
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -145
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -151
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_gfx_FillTriangle
	ld	de, -135
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	l, (iy + 3)
	.local	.LBB111_39
.LBB111_39:                             ;   in Loop: Header=BB111_34 Depth=2
	bit	1, l
	jr	z, .LBB111_41
; %bb.40:                               ;   in Loop: Header=BB111_34 Depth=2
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
	push	ix
	lea	ix, ix - 128
	ld	iy, (ix - 7)
	pop	ix
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
	ld	de, -135
	lea	hl, ix + 0
	add	hl, de
	ld	iy, (hl)
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	.local	.LBB111_41
.LBB111_41:                             ;   in Loop: Header=BB111_34 Depth=2
	bit	0, (iy + 5)
	jp	z, .LBB111_43
; %bb.42:                               ;   in Loop: Header=BB111_34 Depth=2
	ld	hl, 255
	push	hl
	call	_gfx_SetColor
	pop	hl
	ld	de, -135
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	ld	a, (hl)
	or	a, a
	sbc	hl, hl
	ld	l, a
	add	hl, hl
	ld	de, -145
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	ld	de, -3
	add	hl, de
	ld	bc, -148
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), hl
	ld	bc, -135
	lea	hl, ix + 0
	add	hl, bc
	ld	iy, (hl)
	ld	a, (iy + 1)
	ld	iy, 0
	ld	iyl, a
	add	iy, iy
	lea	hl, iy + 0
	lea	bc, iy + 0
	add	hl, de
	ld	de, -135
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), hl
	ld	de, 3
	push	ix
	lea	ix, ix - 128
	ld	iy, (ix - 17)
	pop	ix
	add	iy, de
	push	bc
	pop	hl
	add	hl, de
	push	hl
	push	iy
	ld	de, -135
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -148
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_gfx_Line
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	.local	.LBB111_43
.LBB111_43:                             ;   in Loop: Header=BB111_34 Depth=2
	ld	de, -142
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	ld	de, 6
	add	hl, de
	jp	.LBB111_34
	.local	.LBB111_44
.LBB111_44:                             ;   in Loop: Header=BB111_1 Depth=1
	ld	a, (_news_head)
	or	a, a
	sbc	hl, hl
	ld	l, a
	ld	bc, 48
	call	__imulu
	ex	de, hl
	ld	hl, _news
	add	hl, de
	ld	de, 20
	push	de
	ld	de, 4
	push	de
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, _news_age
	inc	(hl)
	ld	a, (hl)
	cp	a, 100
	jr	c, .LBB111_46
; %bb.45:                               ;   in Loop: Header=BB111_1 Depth=1
	xor	a, a
	ld	(_news_age), a
	ld	a, (_news_head)
	inc	a
	ld	l, 7
	and	a, l
	ld	l, a
	ld	(_news_head), a
	ld	hl, _news_count
	dec	(hl)
	.local	.LBB111_46
.LBB111_46:                             ;   in Loop: Header=BB111_1 Depth=1
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
	push	ix
	lea	ix, ix - 128
	ld	(ix - 14), hl
	pop	ix
	ld	bc, (iy + 10)
	ld	de, (iy + 12)
	ld	l, e
	ld	h, d
	push	ix
	lea	ix, ix - 128
	ld	(ix - 20), bc
	pop	ix
	add.sis	hl, bc
	ld	bc, (iy + 14)
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 17
	ld	(iy + 0), bc
	add.sis	hl, bc
	ld	bc, -151
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), l
	ld	(iy + 1), h
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	ld	hl, 0
	jr	z, .LBB111_48
; %bb.47:                               ;   in Loop: Header=BB111_1 Depth=1
	ld	iy, 0
	lea	hl, iy + 0
	ld	l, e
	ld	h, d
	ld	bc, 100
	call	__imulu
	lea	bc, iy + 0
	push	de
	pop	iy
	push	ix
	lea	ix, ix - 128
	ld	e, (ix - 23)
	ld	d, (ix - 22)
	pop	ix
	ld	c, e
	ld	b, d
	lea	de, iy + 0
	call	__idivu
	.local	.LBB111_48
.LBB111_48:                             ; %Percentage.exit
                                        ;   in Loop: Header=BB111_1 Depth=1
	ld	bc, 255
	call	__iand
	ld	bc, -151
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), hl
	ld	bc, -148
	lea	iy, ix + 0
	add	iy, bc
	ld	hl, (iy + 0)
                                        ; kill: def $hl killed $hl killed $uhl
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 17
	ld	bc, (iy + 0)
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
	jr	z, .LBB111_50
; %bb.49:                               ;   in Loop: Header=BB111_1 Depth=1
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
	.local	.LBB111_50
.LBB111_50:                             ; %Percentage.exit8
                                        ;   in Loop: Header=BB111_1 Depth=1
	ld	de, 255
	push	de
	pop	bc
	call	__iand
	push	hl
	ld	de, -151
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	de, -142
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	ld	hl, _.str.74.264
	push	hl
	ld	hl, 80
	push	hl
	ld	de, -132
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
	ld	hl, 207
	push	hl
	ld	hl, 4
	push	hl
	ld	de, -132
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	de, -135
	lea	iy, ix + 0
	add	iy, de
	ld	c, (iy + 0)
	ld	b, (iy + 1)
	sbc.sis	hl, hl
	adc.sis	hl, bc
	ld	hl, 0
	push	hl
	pop	de
	jr	z, .LBB111_52
; %bb.51:                               ;   in Loop: Header=BB111_1 Depth=1
	ld	iy, 0
	lea	hl, iy + 0
	push	ix
	lea	ix, ix - 128
	ld	e, (ix - 28)
	ld	d, (ix - 27)
	pop	ix
	ld	l, e
	ld	h, d
	ld	de, 100
	push	de
	pop	bc
	call	__imulu
	lea	de, iy + 0
	push	ix
	lea	ix, ix - 128
	ld	c, (ix - 7)
	ld	b, (ix - 6)
	pop	ix
	ld	e, c
	ld	d, b
	push	de
	pop	bc
	call	__idivu
	ld	bc, 255
	call	__iand
	push	ix
	lea	ix, ix - 128
	ld	(ix - 7), hl
	pop	ix
	push	ix
	lea	ix, ix - 128
	ld	hl, (ix - 26)
	pop	ix
	ex	de, hl
	ld	iyl, e
	ld	iyh, d
	ex	de, hl
	lea	hl, iy + 0
	ld	bc, 100
	call	__imulu
	push	de
	pop	bc
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 7
	ld	de, (iy + 0)
	call	__idivu
	.local	.LBB111_52
.LBB111_52:                             ; %Percentage.exit10
                                        ;   in Loop: Header=BB111_1 Depth=1
	ld	bc, 255
	call	__iand
	push	hl
	push	de
	ld	hl, _.str.75.265
	push	hl
	ld	hl, 80
	push	hl
	ld	de, -132
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
	ld	hl, 219
	push	hl
	ld	hl, 4
	push	hl
	ld	de, -132
	lea	iy, ix + 0
	add	iy, de
	ld	hl, (iy + 0)
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 231
	push	hl
	ld	hl, 4
	push	hl
	ld	hl, _.str.76.266
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	call	_gfx_SwapDraw
	ld	hl, (_session)
	ld	a, (_session+3)
	ld	d, a
	ld	bc, -135
	lea	iy, ix + 0
	add	iy, bc
	ld	(iy + 0), hl
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
	jr	nc, .LBB111_54
; %bb.53:                               ;   in Loop: Header=BB111_1 Depth=1
	ld	hl, (-917504)
	ld	a, (-917501)
	ld	e, a
	lea	iy, ix + 0
	lea	iy, iy - 128
	lea	iy, iy - 7
	ld	bc, (iy + 0)
	ld	a, d
	call	__ladd
	ld	a, e
	.local	.LBB111_54
.LBB111_54:                             ;   in Loop: Header=BB111_1 Depth=1
	ld	(_session), hl
	ld	(_session+3), a
	or	a, a
	sbc	hl, hl
	ld	(-917504), hl
	jp	.LBB111_1
	.local	.LBB111_55
.LBB111_55:                             ;   in Loop: Header=BB111_1 Depth=1
	ld	a, e
	cp	a, 5
	call	c, _UpdateSelectedRegion
	ld	bc, -135
	lea	iy, ix + 0
	add	iy, bc
	ld	e, (iy + 0)                     ; 1-byte Folded Reload
	jp	.LBB111_3
	.local	.LBB111_56
.LBB111_56:
	call	_SaveData
	bit	0, a
	ld	hl, _.str.63.268
	push	hl
	ld	hl, _.str.62.267
	push	hl
	call	z, _Message
	pop	hl
	pop	hl
	ld	a, (_disease+34)
	or	a, a
	call	nz, _ResultScreen
	call	_ReleaseKeys
	.local	.LBB111_57
.LBB111_57:
	ld	de, -136
	lea	iy, ix + 0
	add	iy, de
	ld	a, (iy + 0)                     ; 1-byte Folded Reload
	ld	sp, ix
	pop	ix
	ret
	.local	.LBB111_58
.LBB111_58:
	ld	a, l
	cp	a, 2
	jr	z, .LBB111_60
; %bb.59:
	ld	a, 0
	jr	.LBB111_61
	.local	.LBB111_60
.LBB111_60:
	ld	a, -1
	.local	.LBB111_61
.LBB111_61:
	ld	de, -136
	lea	iy, ix + 0
	add	iy, de
	ld	(iy + 0), a
	jr	.LBB111_57
	.local	.Lfunc_end111
.Lfunc_end111:
	.size	_Play, .Lfunc_end111-_Play
                                        ; -- End function
	.section	.text._main,"ax",@progbits
	.globl	_main                           ; -- Begin function main
	.type	_main,@function
_main:                                  ; @main
; %bb.0:
	ld	hl, -56
	call	__frameset
	ld	hl, 5525059
	ld	de, 5526341
	ld.sis	bc, 48
	ld	(ix - 8), hl
	ld	(ix - 5), de
	ld	(ix - 2), c
	ld	(ix - 1), b
	call	_gfx_Begin
	ld	hl, 1
	push	hl
	call	_gfx_SetDraw
	pop	hl
	call	_InitializeMap
	call	_ResetGameState
	ld	hl, _.str.25.284
	push	hl
	ld	hl, _.str.24.283
	push	hl
	call	_ti_Open
	ld	e, a
	pop	hl
	pop	hl
	or	a, a
	jr	z, .LBB112_5
; %bb.1:
	ld	(ix - 36), de
	push	de
	call	_ti_IsArchived
	pop	de
	ld	de, 2
	push	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	jr	nz, .LBB112_3
; %bb.2:
	ld	hl, 0
	jr	.LBB112_4
	.local	.LBB112_3
.LBB112_3:
	ld	hl, -1
	.local	.LBB112_4
.LBB112_4:
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	hl, (ix - 36)
	push	hl
	call	_ti_Close
	pop	hl
	call	_LoadData
	ld	l, a
	ld	de, 3
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	de, _expected
	ld	hl, _disease
	ld	bc, 58
	ldir
	ld	de, _expected_session
	ld	hl, _session
	ld	bc, 9
	ldir
	call	_SaveData
	ld	l, a
	ld	de, 4
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	hl, 5
	push	hl
	call	_RestoreCheck
	pop	hl
	.local	.LBB112_5
.LBB112_5:
	lea	hl, ix - 8
	ld	(ix - 39), hl
	lea	hl, ix - 21
	ld	(ix - 46), hl
	lea	hl, ix - 27
	ld	(ix - 43), hl
	lea	hl, ix - 33
	ld	(ix - 36), hl
	ld	hl, _.str.24.283
	push	hl
	call	_ti_Delete
	pop	hl
	ld	hl, _.str.26.285
	push	hl
	call	_ti_Delete
	pop	hl
	ld	hl, _.str.27.286
	push	hl
	call	_ti_Delete
	pop	hl
	call	_ResetGameState
	ld	l, 8
	xor	a, a
	ld	(ix - 40), a                    ; 1-byte Folded Spill
	ld	e, a
	.local	.LBB112_6
.LBB112_6:                              ; =>This Inner Loop Header: Depth=1
	ld	a, l
	or	a, a
	jr	z, .LBB112_8
; %bb.7:                                ;   in Loop: Header=BB112_6 Depth=1
	ld	(ix - 49), l                    ; 1-byte Folded Spill
	ld	l, 48
	ld	a, e
	or	a, l
	ld	l, a
	ld	(ix - 2), l
	ld	hl, (ix - 39)
	push	hl
	ld	(ix - 50), e                    ; 1-byte Folded Spill
	call	_ti_Delete
	ld	e, (ix - 50)                    ; 1-byte Folded Reload
	pop	hl
	ld	l, (ix - 49)                    ; 1-byte Folded Reload
	inc	e
	dec	l
	jr	.LBB112_6
	.local	.LBB112_8
.LBB112_8:
	ld	a, 1
	ld	(_disease+33), a
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
	ld	a, 4
	ld	(_session+5), a
	ld	a, 2
	ld	(_session+4), a
	dec	a
	ld	(_session+8), a
	ld	hl, 12345
	ld	(_session), hl
	dec	a
	ld	(_session+3), a
	ld	de, _expected
	ld	hl, _disease
	ld	bc, 58
	ldir
	ld	de, _expected_session
	ld	hl, _session
	ld	bc, 9
	ldir
	call	_SaveData
	ld	l, a
	ld	de, 10
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	hl, 11
	push	hl
	call	_RestoreCheck
	pop	hl
	call	_SaveData
	ld	l, a
	ld	de, 20
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	hl, _.str.24.283
	push	hl
	call	_Corrupt
	pop	hl
	ld	hl, 21
	push	hl
	call	_RestoreCheck
	pop	hl
	call	_SaveData
	ld	l, a
	ld	de, 30
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	hl, _.str.24.283
	push	hl
	call	_ti_Delete
	pop	hl
	ld	hl, 31
	push	hl
	call	_RestoreCheck
	pop	hl
	call	_SaveData
	ld	l, a
	ld	de, 40
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	a, 8
	ld	e, 0
	.local	.LBB112_9
.LBB112_9:                              ; =>This Inner Loop Header: Depth=1
	ld	(ix - 49), a                    ; 1-byte Folded Spill
	or	a, a
	jp	z, .LBB112_18
; %bb.10:                               ;   in Loop: Header=BB112_9 Depth=1
	or	a, a
	sbc	hl, hl
	push	hl
	ld	(ix - 50), e                    ; 1-byte Folded Spill
	call	_os_MemChk
	ld	a, (ix - 50)                    ; 1-byte Folded Reload
	push	hl
	pop	iy
	pop	hl
	lea	hl, iy + 0
	ld	de, 1500
	or	a, a
	sbc	hl, de
	jp	c, .LBB112_18
; %bb.11:                               ;   in Loop: Header=BB112_9 Depth=1
	ld	de, -1024
	add	iy, de
	lea	hl, iy + 0
	ld	de, 60000
	or	a, a
	sbc	hl, de
	jr	c, .LBB112_13
; %bb.12:                               ;   in Loop: Header=BB112_9 Depth=1
	ld	iy, 60000
	.local	.LBB112_13
.LBB112_13:                             ;   in Loop: Header=BB112_9 Depth=1
	ld	(ix - 56), iy
	ld	l, 48
	or	a, l
	ld	l, a
	ld	(ix - 2), l
	ld	hl, _.str.28.287
	push	hl
	ld	hl, (ix - 39)
	push	hl
	call	_ti_Open
	ld	e, a
	pop	hl
	pop	hl
	ld	hl, 50
	push	hl
	ld	(ix - 53), de
	or	a, a
	ld	hl, -1
	jr	nz, .LBB112_15
; %bb.14:                               ;   in Loop: Header=BB112_9 Depth=1
	ld	hl, 0
	.local	.LBB112_15
.LBB112_15:                             ;   in Loop: Header=BB112_9 Depth=1
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	hl, (ix - 53)
	push	hl
	ld	hl, (ix - 56)
	push	hl
	call	_ti_Resize
	pop	de
	pop	de
	ld	de, 51
	push	de
	ld	de, (ix - 56)
	or	a, a
	sbc	hl, de
	ld	hl, -1
	jr	z, .LBB112_17
; %bb.16:                               ;   in Loop: Header=BB112_9 Depth=1
	ld	hl, 0
	.local	.LBB112_17
.LBB112_17:                             ;   in Loop: Header=BB112_9 Depth=1
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	hl, (ix - 53)
	push	hl
	call	_ti_Close
	pop	hl
	ld	e, (ix - 50)                    ; 1-byte Folded Reload
	inc	e
	ld	a, (ix - 49)                    ; 1-byte Folded Reload
	dec	a
	jp	.LBB112_9
	.local	.LBB112_18
.LBB112_18:
	call	_SaveData
	ld	l, 1
	xor	a, l
	ld	l, a
	ld	de, 52
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	l, 8
	xor	a, a
	ld	e, a
	.local	.LBB112_19
.LBB112_19:                             ; =>This Inner Loop Header: Depth=1
	ld	a, l
	or	a, a
	jr	z, .LBB112_21
; %bb.20:                               ;   in Loop: Header=BB112_19 Depth=1
	ld	(ix - 49), l                    ; 1-byte Folded Spill
	ld	l, 48
	ld	a, e
	or	a, l
	ld	l, a
	ld	(ix - 2), l
	ld	hl, (ix - 39)
	push	hl
	ld	(ix - 50), e                    ; 1-byte Folded Spill
	call	_ti_Delete
	ld	e, (ix - 50)                    ; 1-byte Folded Reload
	pop	hl
	ld	l, (ix - 49)                    ; 1-byte Folded Reload
	inc	e
	dec	l
	jr	.LBB112_19
	.local	.LBB112_21
.LBB112_21:
	ld	hl, 53
	push	hl
	call	_RestoreCheck
	pop	hl
	call	_SaveData
	ld	l, a
	ld	de, 57
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	hl, _.str.24.283
	push	hl
	call	_Corrupt
	pop	hl
	ld	hl, 60
	push	hl
	call	_RestoreCheck
	pop	hl
	ld	hl, _.str.26.285
	push	hl
	call	_Corrupt
	pop	hl
	call	_LoadData
	ld	l, 1
	xor	a, l
	ld	l, a
	ld	de, 70
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	a, (_disease+33)
	ld	hl, _disease+20
	ld	hl, (hl)
	ld.sis	de, 12
                                        ; kill: def $hl killed $hl killed $uhl
	or	a, a
	sbc.sis	hl, de
	ld	l, -1
	ld	e, d
	ld	c, l
	jr	z, .LBB112_23
; %bb.22:
	ld	c, e
	.local	.LBB112_23
.LBB112_23:
	or	a, a
	ld	a, l
	jr	z, .LBB112_25
; %bb.24:
	ld	a, e
	.local	.LBB112_25
.LBB112_25:
	and	a, c
	ld	c, a
	ld	a, (_session+5)
	or	a, a
	jr	z, .LBB112_27
; %bb.26:
	ld	l, e
	.local	.LBB112_27
.LBB112_27:
	ld	a, c
	and	a, l
	ld	l, a
	ld	de, 71
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	hl, _region
	push	hl
	pea	ix - 15
	call	_CountWorld
	pop	hl
	pop	hl
	ld	hl, (ix - 15)
	ld	de, 72
	push	de
	ld.sis	de, 4410
                                        ; kill: def $hl killed $hl killed $uhl
	or	a, a
	sbc.sis	hl, de
	ld	hl, -1
	ld	(ix - 49), hl
	jr	z, .LBB112_29
; %bb.28:
	ld	hl, 0
	.local	.LBB112_29
.LBB112_29:
	push	hl
	call	_Check
	pop	hl
	pop	hl
	call	_SaveData
	ld	l, a
	ld	de, 73
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	hl, _native_check
	ld.sis	de, 1000
	ld	(hl), e
	inc	hl
	ld	(hl), d
	ld	hl, _.str.29.288
	push	hl
	call	_BeginScreen
	pop	hl
	ld	hl, 50
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, _.str.30.289
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 75
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, _.str.31.290
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	ld	hl, 100
	push	hl
	ld	hl, 8
	push	hl
	ld	hl, _.str.32.291
	push	hl
	call	_Text
	pop	hl
	pop	hl
	pop	hl
	call	_gfx_SwapDraw
	call	_WaitKey
	call	_ResetGameState
	ld	a, 1
	ld	(_disease+33), a
	ld	hl, _region
	push	hl
	ld	hl, (ix - 46)
	push	hl
	call	_CountWorld
	pop	hl
	pop	hl
	push	hl
	push	hl
	dec	sp
	ex	de, hl
	ld	hl, 0
	add	hl, sp
	ex	de, hl
	inc	de
	ld	bc, 6
	ld	hl, (ix - 46)
	ldir
	ld	hl, _disease
	push	hl
	call	_EvaluateOutcome
	pop	hl
	pop	hl
	pop	hl
	inc	sp
	ld	a, (_disease+34)
	ld	hl, 1001
	push	hl
	cp	a, 2
	ld	hl, -1
	jr	z, .LBB112_31
; %bb.30:
	ld	hl, 0
	.local	.LBB112_31
.LBB112_31:
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	hl, _native_check
	ld.sis	de, 1001
	ld	(hl), e
	inc	hl
	ld	(hl), d
	call	_ResultScreen
	call	_ResetGameState
	ld	a, 1
	ld	(_disease+33), a
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
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, _disease+22
	ld.sis	de, 10000
	ld	(hl), e
	inc	hl
	ld	(hl), d
	ld	hl, _region
	push	hl
	ld	hl, (ix - 43)
	push	hl
	call	_CountWorld
	pop	hl
	pop	hl
	push	hl
	push	hl
	dec	sp
	ex	de, hl
	ld	hl, 0
	add	hl, sp
	ex	de, hl
	inc	de
	ld	hl, (ix - 43)
	ld	bc, 6
	ldir
	ld	hl, _disease
	push	hl
	call	_EvaluateOutcome
	pop	hl
	pop	hl
	pop	hl
	inc	sp
	ld	a, (_disease+34)
	ld	hl, 1002
	push	hl
	cp	a, h
	jr	z, .LBB112_33
; %bb.32:
	ld	hl, 0
	ld	(ix - 49), hl
	.local	.LBB112_33
.LBB112_33:
	ld	hl, (ix - 49)
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	hl, _native_check
	ld.sis	de, 1002
	ld	(hl), e
	inc	hl
	ld	(hl), d
	call	_ResultScreen
	ld	de, 7
	ld	bc, 0
	push	bc
	pop	iy
	.local	.LBB112_34
.LBB112_34:                             ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB112_36 Depth 2
	lea	hl, iy + 0
	or	a, a
	sbc	hl, de
	jr	z, .LBB112_41
; %bb.35:                               ;   in Loop: Header=BB112_34 Depth=1
	ld	(ix - 43), iy
	lea	hl, iy + 0
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de, hl
	ld	iy, _region
	add	iy, de
	push	bc
	pop	de
	.local	.LBB112_36
.LBB112_36:                             ;   Parent Loop BB112_34 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
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
	jr	nc, .LBB112_40
; %bb.37:                               ;   in Loop: Header=BB112_36 Depth=2
	ld	hl, (iy + 3)
	push	hl
	pop	bc
	add	hl, de
	ld	a, (hl)
	or	a, a
	jr	z, .LBB112_39
; %bb.38:                               ;   in Loop: Header=BB112_36 Depth=2
	push	bc
	pop	hl
	add	hl, de
	ld	(hl), 64
	.local	.LBB112_39
.LBB112_39:                             ;   in Loop: Header=BB112_36 Depth=2
	inc	de
	jr	.LBB112_36
	.local	.LBB112_40
.LBB112_40:                             ;   in Loop: Header=BB112_34 Depth=1
	push	iy
	call	_RecountRegion
	pop	hl
	ld	iy, (ix - 43)
	inc	iy
	ld	bc, 0
	ld	de, 7
	jr	.LBB112_34
	.local	.LBB112_41
.LBB112_41:
	xor	a, a
	ld	(_disease+34), a
	ld	hl, _region
	push	hl
	ld	hl, (ix - 36)
	push	hl
	call	_CountWorld
	pop	hl
	pop	hl
	push	hl
	push	hl
	dec	sp
	ex	de, hl
	ld	hl, 0
	add	hl, sp
	ex	de, hl
	inc	de
	ld	bc, 6
	ld	hl, (ix - 36)
	ldir
	ld	hl, _disease
	push	hl
	call	_EvaluateOutcome
	pop	hl
	pop	hl
	pop	hl
	inc	sp
	ld	a, (_disease+34)
	ld	hl, 1003
	push	hl
	cp	a, 1
	jr	z, .LBB112_43
; %bb.42:
	ld	hl, 0
	jr	.LBB112_44
	.local	.LBB112_43
.LBB112_43:
	ld	hl, -1
	.local	.LBB112_44
.LBB112_44:
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	hl, _native_check
	push	hl
	pop	iy
	ld.sis	hl, 1003
	ld	(iy), l
	ld	(iy + 1), h
	call	_ResultScreen
	call	_ResetGameState
	ld	a, 2
	ld	(_disease+32), a
	dec	a
	ld	(_disease+33), a
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
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	ld	hl, _disease+20
	ld.sis	de, 1000
	ld	(hl), e
	inc	hl
	ld	(hl), d
	ld	a, 2
	ld	(_disease+35), a
	ld	hl, _disease+22
	ld.sis	de, 9000
	ld	(hl), e
	inc	hl
	ld	(hl), d
	ld	hl, 100
	ld	(_disease+8), hl
	xor	a, a
	ld	(_disease+11), a
	ld	hl, 50
	ld	(_disease+12), hl
	ld	(_disease+15), a
	ld	hl, _effects
	push	hl
	ld	hl, _disease
	push	hl
	call	_CalculateEffects
	pop	hl
	pop	hl
	ld.sis	hl, 1100
	ld	iy, _native_check
	ld	(iy), l
	ld	(iy + 1), h
	.local	.LBB112_45
.LBB112_45:                             ; =>This Inner Loop Header: Depth=1
	ld	hl, (_disease)
	ld	a, (_disease+3)
	ld	e, a
	ld	iy, (_disease+4)
	ld	a, (_disease+7)
	ld	d, a
	ld	a, (_disease+36)
	ld	(ix - 36), a                    ; 1-byte Folded Spill
	ld	bc, -1
	ld	a, b
	call	__lcmpu
	jr	nz, .LBB112_48
; %bb.46:                               ;   in Loop: Header=BB112_45 Depth=1
	lea	hl, iy + 0
	ld	e, d
	ld	bc, 127
	xor	a, a
	call	__lcmpu
	jr	nz, .LBB112_48
; %bb.47:                               ;   in Loop: Header=BB112_45 Depth=1
	ld	a, (ix - 36)                    ; 1-byte Folded Reload
	cp	a, 3
	jr	z, .LBB112_49
	.local	.LBB112_48
.LBB112_48:                             ;   in Loop: Header=BB112_45 Depth=1
	ld	hl, _.str.33.292
	push	hl
	call	_BeginScreen
	pop	hl
	call	_gfx_SwapDraw
	call	_WaitKey
	call	_ActionsMenu
	jr	.LBB112_45
	.local	.LBB112_49
.LBB112_49:
	ld	a, 1
	ld	(_disease+32), a
	ld	hl, _native_check
	ld.sis	de, 1200
	ld	(hl), e
	inc	hl
	ld	(hl), d
	ld	d, 16
	ld	e, -1
	scf
	sbc	hl, hl
	.local	.LBB112_50
.LBB112_50:                             ; =>This Inner Loop Header: Depth=1
	ld	bc, 1048576
	xor	a, a
	call	__land
	push	hl
	pop	bc
	ld	a, e
	ld	l, d
	call	__lshru
	ld	a, c
	or	a, a
	jr	z, .LBB112_52
; %bb.51:                               ;   in Loop: Header=BB112_50 Depth=1
	ld	hl, _.str.34.293
	push	hl
	call	_BeginScreen
	pop	hl
	call	_gfx_SwapDraw
	call	_WaitKey
	call	_ActionsMenu
	ld	d, 16
	ld	hl, (_disease)
	ld	a, (_disease+3)
	ld	e, a
	jr	.LBB112_50
	.local	.LBB112_52
.LBB112_52:
	call	_ResetGameState
	ld	a, 2
	ld	(_disease+32), a
	dec	a
	ld	(_disease+33), a
	ld	hl, _disease+20
	push	hl
	pop	iy
	ld.sis	hl, 0
	ld	(iy), l
	ld	(iy + 1), h
	ld	hl, _native_check
	ld.sis	de, 1300
	ld	(hl), e
	inc	hl
	ld	(hl), d
	call	_ActionsMenu
	ld	hl, _disease+20
	ld	hl, (hl)
	ld	a, (_disease+36)
	or	a, a
	ld	a, -1
	ld	c, 0
	ld	e, a
	jr	z, .LBB112_54
; %bb.53:
	ld	e, c
	.local	.LBB112_54
.LBB112_54:
	add.sis	hl, bc
	or	a, a
	sbc.sis	hl, bc
	jr	z, .LBB112_56
; %bb.55:
	ld	a, c
	.local	.LBB112_56
.LBB112_56:
	and	a, e
	ld	l, a
	ld	de, 1301
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	hl, _disease+20
	ld.sis	de, 100
	ld	(hl), e
	inc	hl
	ld	(hl), d
	ld	a, (_region+6)
	ld	iyl, a
	ld	a, (_region+7)
	ld	de, 0
	.local	.LBB112_57
.LBB112_57:                             ; =>This Inner Loop Header: Depth=1
	ld	bc, 0
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
	jr	nc, .LBB112_61
; %bb.58:                               ;   in Loop: Header=BB112_57 Depth=1
	ld	c, iyl
	ld	iy, (_region+3)
	lea	hl, iy + 0
	add	hl, de
	ld	b, a
	ld	a, (hl)
	or	a, a
	ld	a, b
	jr	z, .LBB112_60
; %bb.59:                               ;   in Loop: Header=BB112_57 Depth=1
	add	iy, de
	ld	(iy), -32
	ld	a, (_region+6)
	ld	c, a
	ld	a, (_region+7)
	.local	.LBB112_60
.LBB112_60:                             ;   in Loop: Header=BB112_57 Depth=1
	inc	de
	ld	iyl, c
	jr	.LBB112_57
	.local	.LBB112_61
.LBB112_61:
	ld	hl, _region
	push	hl
	call	_RecountRegion
	pop	hl
	ld	hl, _native_check
	ld.sis	de, 1400
	ld	(hl), e
	inc	hl
	ld	(hl), d
	call	_ActionsMenu
	ld	hl, _disease+20
	ld	hl, (hl)
	ld	a, (_disease+36)
	or	a, a
	ld	a, -1
	ld	d, 0
	ld	e, a
	jr	z, .LBB112_63
; %bb.62:
	ld	e, d
	.local	.LBB112_63
.LBB112_63:
                                        ; kill: def $hl killed $hl killed $uhl
	ld.sis	bc, 100
	or	a, a
	sbc.sis	hl, bc
	jr	z, .LBB112_65
; %bb.64:
	ld	a, d
	.local	.LBB112_65
.LBB112_65:
	and	a, e
	ld	l, a
	ld	de, 1401
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	call	_ResetGameState
	ld	a, 1
	ld	(_disease+33), a
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
	pop	hl
	pop	hl
	pop	hl
	pop	hl
	call	_SaveData
	ld	l, a
	ld	de, 1450
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	l, 8
	xor	a, a
	ld	e, a
	.local	.LBB112_66
.LBB112_66:                             ; =>This Inner Loop Header: Depth=1
	ld	(ix - 36), l                    ; 1-byte Folded Spill
	ld	a, l
	or	a, a
	jp	z, .LBB112_75
; %bb.67:                               ;   in Loop: Header=BB112_66 Depth=1
	or	a, a
	sbc	hl, hl
	push	hl
	ld	(ix - 43), e                    ; 1-byte Folded Spill
	call	_os_MemChk
	ld	a, (ix - 43)                    ; 1-byte Folded Reload
	push	hl
	pop	iy
	pop	hl
	lea	hl, iy + 0
	ld	de, 1500
	or	a, a
	sbc	hl, de
	jp	c, .LBB112_75
; %bb.68:                               ;   in Loop: Header=BB112_66 Depth=1
	ld	de, -1024
	add	iy, de
	lea	hl, iy + 0
	ld	de, 60000
	or	a, a
	sbc	hl, de
	jr	c, .LBB112_70
; %bb.69:                               ;   in Loop: Header=BB112_66 Depth=1
	ld	iy, 60000
	.local	.LBB112_70
.LBB112_70:                             ;   in Loop: Header=BB112_66 Depth=1
	ld	(ix - 49), iy
	ld	l, 48
	or	a, l
	ld	l, a
	ld	(ix - 2), l
	ld	hl, _.str.28.287
	push	hl
	ld	hl, (ix - 39)
	push	hl
	call	_ti_Open
	ld	e, a
	pop	hl
	pop	hl
	ld	hl, 1451
	push	hl
	ld	(ix - 46), de
	or	a, a
	ld	hl, -1
	jr	nz, .LBB112_72
; %bb.71:                               ;   in Loop: Header=BB112_66 Depth=1
	ld	hl, 0
	.local	.LBB112_72
.LBB112_72:                             ;   in Loop: Header=BB112_66 Depth=1
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	hl, (ix - 46)
	push	hl
	ld	hl, (ix - 49)
	push	hl
	call	_ti_Resize
	pop	de
	pop	de
	ld	de, 1452
	push	de
	ld	de, (ix - 49)
	or	a, a
	sbc	hl, de
	ld	hl, -1
	jr	z, .LBB112_74
; %bb.73:                               ;   in Loop: Header=BB112_66 Depth=1
	ld	hl, 0
	.local	.LBB112_74
.LBB112_74:                             ;   in Loop: Header=BB112_66 Depth=1
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	hl, (ix - 46)
	push	hl
	call	_ti_Close
	pop	hl
	ld	e, (ix - 43)                    ; 1-byte Folded Reload
	inc	e
	ld	l, (ix - 36)                    ; 1-byte Folded Reload
	dec	l
	jp	.LBB112_66
	.local	.LBB112_75
.LBB112_75:
	ld	hl, _native_check
	ld.sis	de, 1500
	ld	(hl), e
	inc	hl
	ld	(hl), d
	ld	hl, 2
	push	hl
	call	_SaveExit
	pop	hl
	ld	hl, 1501
	push	hl
	or	a, a
	ld	hl, -1
	ld	de, 0
	jr	z, .LBB112_77
; %bb.76:
	ex	de, hl
	.local	.LBB112_77
.LBB112_77:
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	hl, _native_check
	ld.sis	de, 1600
	ld	(hl), e
	inc	hl
	ld	(hl), d
	ld	hl, 2
	push	hl
	call	_SaveExit
	pop	hl
	ld	hl, 1601
	push	hl
	cp	a, 2
	ld	hl, -1
	jr	z, .LBB112_79
; %bb.78:
	ld	hl, 0
	.local	.LBB112_79
.LBB112_79:
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	l, 8
	.local	.LBB112_80
.LBB112_80:                             ; =>This Inner Loop Header: Depth=1
	ld	a, l
	or	a, a
	jr	z, .LBB112_82
; %bb.81:                               ;   in Loop: Header=BB112_80 Depth=1
	ld	(ix - 36), l                    ; 1-byte Folded Spill
	ld	l, 48
	ld	a, (ix - 40)
	or	a, l
	ld	l, a
	ld	(ix - 2), l
	ld	hl, (ix - 39)
	push	hl
	call	_ti_Delete
	pop	hl
	ld	l, (ix - 36)                    ; 1-byte Folded Reload
	inc	(ix - 40)
	dec	l
	jr	.LBB112_80
	.local	.LBB112_82
.LBB112_82:
	ld	hl, _native_check
	ld.sis	de, 2000
	ld	(hl), e
	inc	hl
	ld	(hl), d
	ld	hl, _.str.35.294
	push	hl
	call	_BeginScreen
	pop	hl
	call	_gfx_SwapDraw
	.local	.LBB112_83
.LBB112_83:                             ; =>This Inner Loop Header: Depth=1
	call	_kb_Scan
	jr	.LBB112_83
	.local	.Lfunc_end112
.Lfunc_end112:
	.size	_main, .Lfunc_end112-_main
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
	jr	z, .LBB113_2
; %bb.1:
	ld	sp, ix
	pop	ix
	ret
	.local	.LBB113_2
.LBB113_2:
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
	ld	hl, _.str.81.295
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
	.local	.LBB113_3
.LBB113_3:                              ; =>This Inner Loop Header: Depth=1
	call	_kb_Scan
	jr	.LBB113_3
	.local	.Lfunc_end113
.Lfunc_end113:
	.size	_Check, .Lfunc_end113-_Check
                                        ; -- End function
	.section	.text._RestoreCheck,"ax",@progbits
	.type	_RestoreCheck,@function         ; -- Begin function RestoreCheck
_RestoreCheck:                          ; @RestoreCheck
; %bb.0:
	ld	hl, -10
	call	__frameset
	call	_ResetGameState
	call	_LoadData
	ld	l, a
	ld	de, (ix + 6)
	push	de
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	hl, 58
	push	hl
	ld	hl, _expected
	push	hl
	ld	hl, _disease
	push	hl
	call	_memcmp
	pop	de
	pop	de
	pop	de
	ld	de, (ix + 6)
                                        ; kill: def $de killed $de killed $ude def $ude
	inc.sis	de
	push	de
	add	hl, bc
	or	a, a
	sbc	hl, bc
	ld	hl, -1
	ld	(ix - 10), hl
	jr	z, .LBB114_2
; %bb.1:
	ld	hl, 0
	.local	.LBB114_2
.LBB114_2:
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	hl, 9
	push	hl
	ld	hl, _expected_session
	push	hl
	ld	hl, _session
	push	hl
	call	_memcmp
	pop	de
	pop	de
	pop	de
	ld	iy, (ix + 6)
                                        ; kill: def $iy killed $iy killed $uiy def $uiy
	ld.sis	de, 2
	add.sis	iy, de
	push	iy
	add	hl, bc
	or	a, a
	sbc	hl, bc
	ld	hl, -1
	jr	z, .LBB114_4
; %bb.3:
	ld	hl, 0
	.local	.LBB114_4
.LBB114_4:
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	hl, _region
	push	hl
	pea	ix - 7
	call	_CountWorld
	pop	hl
	pop	hl
	ld	de, (ix - 7)
	ld	hl, (ix - 5)
	add.sis	hl, de
	ld	de, (ix - 3)
	add.sis	hl, de
	ld	iy, (ix + 6)
	ld.sis	de, 3
	add.sis	iy, de
	push	iy
	ld.sis	de, 4410
                                        ; kill: def $hl killed $hl killed $uhl
	or	a, a
	sbc.sis	hl, de
	jr	z, .LBB114_6
; %bb.5:
	ld	hl, 0
	ld	(ix - 10), hl
	.local	.LBB114_6
.LBB114_6:
	ld	hl, (ix - 10)
	push	hl
	call	_Check
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end114
.Lfunc_end114:
	.size	_RestoreCheck, .Lfunc_end114-_RestoreCheck
                                        ; -- End function
	.section	.text._Corrupt,"ax",@progbits
	.type	_Corrupt,@function              ; -- Begin function Corrupt
_Corrupt:                               ; @Corrupt
; %bb.0:
	ld	hl, -4
	call	__frameset
	ld	hl, (ix + 6)
	ld	de, _.str.28.287
	push	de
	push	hl
	call	_ti_Open
	ld	e, a
	pop	hl
	pop	hl
	ld	(ix - 1), 0
	ld	hl, 90
	push	hl
	ld	(ix - 4), de
	or	a, a
	ld	hl, -1
	ld	de, 0
	jr	nz, .LBB115_2
; %bb.1:
	ex	de, hl
	.local	.LBB115_2
.LBB115_2:
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	hl, (ix - 4)
	push	hl
	ld	hl, 1
	push	hl
	push	hl
	pea	ix - 1
	call	_ti_Write
	pop	de
	pop	de
	pop	de
	pop	de
	ld	de, 91
	push	de
	ld	de, 1
	or	a, a
	sbc	hl, de
	ld	hl, -1
	jr	z, .LBB115_4
; %bb.3:
	ld	hl, 0
	.local	.LBB115_4
.LBB115_4:
	push	hl
	call	_Check
	pop	hl
	pop	hl
	ld	hl, (ix - 4)
	push	hl
	call	_ti_Close
	ld	sp, ix
	pop	ix
	ret
	.local	.Lfunc_end115
.Lfunc_end115:
	.size	_Corrupt, .Lfunc_end115-_Corrupt
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

	.section	.rodata._affected_thresholds,"a",@progbits
	.balign	1
	.local	_affected_thresholds
_affected_thresholds:
	.ascii	"\001\005\n\024#2FZd"

	.section	.rodata._death_thresholds,"a",@progbits
	.balign	1
	.local	_death_thresholds
_death_thresholds:
	.ascii	"\001\n\0312KZ"

	.section	.rodata._cure_thresholds,"a",@progbits
	.balign	1
	.local	_cure_thresholds
_cure_thresholds:
	.ascii	"\0312KZ"

	.section	.rodata._.str.4,"a",@progbits
	.balign	1
	.local	_.str.4
_.str.4:
	.asciz	"EVOLUTION: CHOOSE CATEGORY"

	.section	.rodata._categories,"a",@progbits
	.balign	1
	.local	_categories
_categories:
	d24	_.str.42
	d24	_.str.43
	d24	_.str.44

	.section	.rodata._.str.1.5,"a",@progbits
	.balign	1
	.local	_.str.1.5
_.str.1.5:
	.asciz	"DNA %u"

	.section	.rodata._branch_labels,"a",@progbits
	.balign	1
	.local	_branch_labels
_branch_labels:
	d24	_.str.45
	d24	_.str.46
	d24	_.str.47
	d24	_.str.48
	d24	_.str.49
	d24	_.str.50
	d24	_.str.51
	d24	_.str.52
	d24	_.str.53
	d24	_.str.54
	d24	0
	d24	0
	d24	0
	d24	0
	d24	_.str.55
	d24	_.str.56
	d24	_.str.57
	d24	_.str.58
	d24	_.str.59
	d24	0
	d24	0

	.section	.rodata._.str.2.6,"a",@progbits
	.balign	1
	.local	_.str.2.6
_.str.2.6:
	.asciz	"Aerosol"

	.section	.rodata._.str.3.7,"a",@progbits
	.balign	1
	.local	_.str.3.7
_.str.3.7:
	.asciz	"Reservoirs"

	.section	.rodata._.str.4.8,"a",@progbits
	.balign	1
	.local	_.str.4.8
_.str.4.8:
	.asciz	"Vector"

	.section	.rodata._.str.5,"a",@progbits
	.balign	1
	.local	_.str.5
_.str.5:
	.asciz	"Cost %u  * owned  + ready  L lock  $ DNA"

	.section	.rodata._.str.6,"a",@progbits
	.balign	1
	.local	_.str.6
_.str.6:
	.asciz	"Arrows: move   Enter: details"

	.section	.rodata._.str.7,"a",@progbits
	.balign	1
	.local	_.str.7
_.str.7:
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

	.section	.rodata._.str.8,"a",@progbits
	.balign	1
	.local	_.str.8
_.str.8:
	.asciz	"Healthy %u   Active %u   Dead %u"

	.section	.rodata._.str.9,"a",@progbits
	.balign	1
	.local	_.str.9
_.str.9:
	.asciz	"Ever affected %u"

	.section	.rodata._.str.10,"a",@progbits
	.balign	1
	.local	_.str.10
_.str.10:
	.asciz	"Mixed gameplay ratings (0-4)"

	.section	.rodata._.str.11,"a",@progbits
	.balign	1
	.local	_.str.11
_.str.11:
	.asciz	"Heat %u   Cold %u"

	.section	.rodata._.str.12,"a",@progbits
	.balign	1
	.local	_.str.12
_.str.12:
	.asciz	"Humidity %u   Aridity %u"

	.section	.rodata._.str.13,"a",@progbits
	.balign	1
	.local	_.str.13
_.str.13:
	.asciz	"Urban %u   Rural %u"

	.section	.rodata._.str.14,"a",@progbits
	.balign	1
	.local	_.str.14
_.str.14:
	.asciz	"Healthcare %u"

	.section	.rodata._.str.15,"a",@progbits
	.balign	1
	.local	_.str.15
_.str.15:
	.asciz	"Effective spread: %u.%02u%%"

	.section	.rodata._.str.16,"a",@progbits
	.balign	1
	.local	_.str.16
_.str.16:
	.asciz	"Travel endpoints closed: %u/%u"

	.section	.rodata._.str.19,"a",@progbits
	.balign	1
	.local	_.str.19
_.str.19:
	.asciz	"FUNGUS: SPORE BURST"

	.section	.rodata._.str.20,"a",@progbits
	.balign	1
	.local	_.str.20
_.str.20:
	.asciz	"All three charges spent."

	.section	.rodata._.str.21,"a",@progbits
	.balign	1
	.local	_.str.21
_.str.21:
	.asciz	"DNA %u   Charge %u/3 costs %u"

	.section	.rodata._.str.22,"a",@progbits
	.balign	1
	.local	_.str.22
_.str.22:
	.asciz	"Seeds healthy land; ignores closures."

	.section	.rodata._.str.23,"a",@progbits
	.balign	1
	.local	_.str.23
_.str.23:
	.asciz	"%c %s: %u healthy"

	.section	.rodata._.str.24,"a",@progbits
	.balign	1
	.local	_.str.24
_.str.24:
	.asciz	"Up/Down: choose   Enter: release"

	.section	.rodata._.str.25,"a",@progbits
	.balign	1
	.local	_.str.25
_.str.25:
	.asciz	"Clear: back to actions"

	.section	.rodata._.str.26,"a",@progbits
	.balign	1
	.local	_.str.26
_.str.26:
	.asciz	"No spore charges remain."

	.section	.rodata._.str.27,"a",@progbits
	.balign	1
	.local	_.str.27
_.str.27:
	.asciz	"No healthy land in this region."

	.section	.rodata._.str.28,"a",@progbits
	.balign	1
	.local	_.str.28
_.str.28:
	.asciz	"Not enough DNA for this charge."

	.section	.rodata._.str.29,"a",@progbits
	.balign	1
	.local	_.str.29
_.str.29:
	.asciz	"Spore burst seeded healthy land."

	.section	.rodata._.str.30,"a",@progbits
	.balign	1
	.local	_.str.30
_.str.30:
	.asciz	"One healthy cell seeded."

	.section	.rodata._.str.31,"a",@progbits
	.balign	1
	.local	_.str.31
_.str.31:
	.asciz	"No valid destination. Nothing spent."

	.section	.rodata._.str.32,"a",@progbits
	.balign	1
	.local	_.str.32
_.str.32:
	.asciz	"EXTINCTION: VICTORY"

	.section	.rodata._.str.33,"a",@progbits
	.balign	1
	.local	_.str.33
_.str.33:
	.asciz	"OUTBREAK ENDED"

	.section	.rodata._.str.34,"a",@progbits
	.balign	1
	.local	_.str.34
_.str.34:
	.asciz	"%s / %s"

	.section	.rodata._.str.35,"a",@progbits
	.balign	1
	.local	_.str.35
_.str.35:
	.asciz	"Completed world cycles: %lu"

	.section	.rodata._.str.36,"a",@progbits
	.balign	1
	.local	_.str.36
_.str.36:
	.asciz	"Healthy %u%%  Active %u%%  Dead %u%%"

	.section	.rodata._.str.37,"a",@progbits
	.balign	1
	.local	_.str.37
_.str.37:
	.asciz	"Ever affected %u%%   Cure %u.%02u%%"

	.section	.rodata._.str.38,"a",@progbits
	.balign	1
	.local	_.str.38
_.str.38:
	.asciz	"No living land cells remain."

	.section	.rodata._.str.39,"a",@progbits
	.balign	1
	.local	_.str.39
_.str.39:
	.asciz	"Humanity completed the cure."

	.section	.rodata._.str.40,"a",@progbits
	.balign	1
	.local	_.str.40
_.str.40:
	.asciz	"The last active infection died while healthy land survived."

	.section	.rodata._.str.41,"a",@progbits
	.balign	1
	.local	_.str.41
_.str.41:
	.asciz	"Main Menu (Enter / Clear)"

	.section	.rodata._.str.42,"a",@progbits
	.balign	1
	.local	_.str.42
_.str.42:
	.asciz	"TRANSMISSION"

	.section	.rodata._.str.43,"a",@progbits
	.balign	1
	.local	_.str.43
_.str.43:
	.asciz	"SYMPTOMS"

	.section	.rodata._.str.44,"a",@progbits
	.balign	1
	.local	_.str.44
_.str.44:
	.asciz	"ABILITIES"

	.section	.rodata._.str.45,"a",@progbits
	.balign	1
	.local	_.str.45
_.str.45:
	.asciz	"Air"

	.section	.rodata._.str.46,"a",@progbits
	.balign	1
	.local	_.str.46
_.str.46:
	.asciz	"Water"

	.section	.rodata._.str.47,"a",@progbits
	.balign	1
	.local	_.str.47
_.str.47:
	.asciz	"Live"

	.section	.rodata._.str.48,"a",@progbits
	.balign	1
	.local	_.str.48
_.str.48:
	.asciz	"Rod"

	.section	.rodata._.str.49,"a",@progbits
	.balign	1
	.local	_.str.49
_.str.49:
	.asciz	"Insect"

	.section	.rodata._.str.50,"a",@progbits
	.balign	1
	.local	_.str.50
_.str.50:
	.asciz	"Bird"

	.section	.rodata._.str.51,"a",@progbits
	.balign	1
	.local	_.str.51
_.str.51:
	.asciz	"Blood"

	.section	.rodata._.str.52,"a",@progbits
	.balign	1
	.local	_.str.52
_.str.52:
	.asciz	"Respiratory"

	.section	.rodata._.str.53,"a",@progbits
	.balign	1
	.local	_.str.53
_.str.53:
	.asciz	"Digestive"

	.section	.rodata._.str.54,"a",@progbits
	.balign	1
	.local	_.str.54
_.str.54:
	.asciz	"Systemic"

	.section	.rodata._.str.55,"a",@progbits
	.balign	1
	.local	_.str.55
_.str.55:
	.asciz	"Heat"

	.section	.rodata._.str.56,"a",@progbits
	.balign	1
	.local	_.str.56
_.str.56:
	.asciz	"Cold"

	.section	.rodata._.str.57,"a",@progbits
	.balign	1
	.local	_.str.57
_.str.57:
	.asciz	"Medical"

	.section	.rodata._.str.58,"a",@progbits
	.balign	1
	.local	_.str.58
_.str.58:
	.asciz	"Harden"

	.section	.rodata._.str.59,"a",@progbits
	.balign	1
	.local	_.str.59
_.str.59:
	.asciz	"Shuffle"

	.section	.rodata._.str.60,"a",@progbits
	.balign	1
	.local	_.str.60
_.str.60:
	.asciz	"EVOLUTION DETAILS"

	.section	.rodata._.str.61,"a",@progbits
	.balign	1
	.local	_.str.61
_.str.61:
	.asciz	"DNA %u   Cost %u   State %c"

	.section	.rodata._.str.62,"a",@progbits
	.balign	1
	.local	_.str.62
_.str.62:
	.asciz	"Requires:"

	.section	.rodata._.str.63,"a",@progbits
	.balign	1
	.local	_.str.63
_.str.63:
	.asciz	"None"

	.section	.rodata._.str.64,"a",@progbits
	.balign	1
	.local	_.str.64
_.str.64:
	.asciz	"Discovered + positive cure progress"

	.section	.rodata._.str.65,"a",@progbits
	.balign	1
	.local	_.str.65
_.str.65:
	.asciz	"Devolve preview:"

	.section	.rodata._.str.66,"a",@progbits
	.balign	1
	.local	_.str.66
_.str.66:
	.asciz	"Purchase preview:"

	.section	.rodata._.str.67,"a",@progbits
	.balign	1
	.local	_.str.67
_.str.67:
	.asciz	"INF %u>%u  SEV %u>%u"

	.section	.rodata._.str.68,"a",@progbits
	.balign	1
	.local	_.str.68
_.str.68:
	.asciz	"LETH %u>%u%%  RES %u>%u%%"

	.section	.rodata._reshuffle_reductions,"a",@progbits
	.balign	2
	.globl	_reshuffle_reductions
_reshuffle_reductions:
	dw	1500                            ; 0x5dc
	dw	2500                            ; 0x9c4

	.section	.rodata._.str.69,"a",@progbits
	.balign	1
	.local	_.str.69
_.str.69:
	.asciz	"Reshuffle already used this run."

	.section	.rodata._.str.70,"a",@progbits
	.balign	1
	.local	_.str.70
_.str.70:
	.asciz	"Cure %u.%02u > %u.%02u%%"

	.section	.rodata._.str.71,"a",@progbits
	.balign	1
	.local	_.str.71
_.str.71:
	.asciz	"Base air %u>%u%%  sea %u>%u%%"

	.section	.rodata._.str.72,"a",@progbits
	.balign	1
	.local	_.str.72
_.str.72:
	.asciz	"Base birds %u>%u%% per 8 cycles"

	.section	.rodata._.str.73,"a",@progbits
	.balign	1
	.local	_.str.73
_.str.73:
	.asciz	"Local spread %u.%02u > %u.%02u%%"

	.section	.rodata._.str.74,"a",@progbits
	.balign	1
	.local	_.str.74
_.str.74:
	.asciz	"Purchase: %u DNA%s"

	.section	.rodata._.str.75,"a",@progbits
	.balign	1
	.local	_.str.75
_.str.75:
	.asciz	" (owned)"

	.section	.rodata._.str.76,"a",@progbits
	.balign	1
	.local	_.str.76
_.str.76:
	.asciz	" (locked)"

	.section	.rodata._.str.77,"a",@progbits
	.balign	1
	.local	_.str.77
_.str.77:
	.asciz	" (need DNA)"

	.section	.rodata._.str.78,"a",@progbits
	.balign	1
	.local	_.str.78
_.str.78:
	.asciz	"Devolve: %u DNA%s"

	.section	.rodata._.str.79,"a",@progbits
	.balign	1
	.local	_.str.79
_.str.79:
	.asciz	" (need owned leaf)"

	.section	.rodata._.str.80,"a",@progbits
	.balign	1
	.local	_.str.80
_.str.80:
	.asciz	"Back"

	.section	.rodata._.str.81,"a",@progbits
	.balign	1
	.local	_.str.81
_.str.81:
	.asciz	"Already owned."

	.section	.rodata._.str.82,"a",@progbits
	.balign	1
	.local	_.str.82
_.str.82:
	.asciz	"Requirements not met."

	.section	.rodata._.str.83,"a",@progbits
	.balign	1
	.local	_.str.83
_.str.83:
	.asciz	"Not enough DNA."

	.section	.rodata._.str.84,"a",@progbits
	.balign	1
	.local	_.str.84
_.str.84:
	.asciz	"Purchased."

	.section	.rodata._.str.85,"a",@progbits
	.balign	1
	.local	_.str.85
_.str.85:
	.asciz	"Select an owned leaf symptom."

	.section	.rodata._.str.86,"a",@progbits
	.balign	1
	.local	_.str.86
_.str.86:
	.asciz	"Devolved. No refund."

	.section	.rodata._.str.94,"a",@progbits
	.balign	1
	.local	_.str.94
_.str.94:
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

	.section	.rodata._.str.102,"a",@progbits
	.balign	1
	.local	_.str.102
_.str.102:
	.zero	1

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

	.section	.rodata._.str.4.99,"a",@progbits
	.balign	1
	.local	_.str.4.99
_.str.4.99:
	.asciz	"Special characters"

	.section	.rodata._.str.5.100,"a",@progbits
	.balign	1
	.local	_.str.5.100
_.str.5.100:
	.asciz	"ERROR"

	.section	.rodata._.str.6.101,"a",@progbits
	.balign	1
	.local	_.str.6.101
_.str.6.101:
	.asciz	"You attempted to use a character reserved by OPTIX. Nice try, bucko."

	.section	.rodata._.str.7.104,"a",@progbits
	.balign	1
	.local	_.str.7.104
_.str.7.104:
	.asciz	"\000\000\000\000\000\000\000\000\000\000\000WRMH\000\000?\000VQLG\000\000.ZUPKFC\000 YTOJEB\000\000XSNIDA\000\000\000\000\000\000\000\000\000"

	.section	.rodata._.str.8.105,"a",@progbits
	.balign	1
	.local	_.str.8.105
_.str.8.105:
	.asciz	"\000\000\000\000\000\000\000\000\000\000\000wrmh\000\000?\000vqlg\000\000.zupkfc\000 ytojeb\000\000xsnida\000\000\000\000\000\000\000\000\000"

	.section	.rodata._.str.9.106,"a",@progbits
	.balign	1
	.local	_.str.9.106
_.str.9.106:
	.asciz	"\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000-369)\000\000\000.258(\000\000\0000147,\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"

	.section	.rodata.___const.optix_GetStringInput.keys,"a",@progbits
	.balign	1
	.local	___const.optix_GetStringInput.keys
___const.optix_GetStringInput.keys:
	d24	_.str.7.104
	d24	_.str.8.105
	d24	_.str.9.106

	.section	.bss._optix_stringinput,"aw",@nobits
	.balign	1
	.globl	_optix_stringinput
_optix_stringinput:
	.zero	3

	.section	.rodata._.str.10.103,"a",@progbits
	.balign	1
	.local	_.str.10.103
_.str.10.103:
	.asciz	"%d/%d"

	.section	.bss._optix_button,"aw",@nobits
	.balign	1
	.globl	_optix_button
_optix_button:
	.zero	3

	.section	.rodata._.str.11.107,"a",@progbits
	.balign	1
	.local	_.str.11.107
_.str.11.107:
	.asciz	"ERROR 01"

	.section	.rodata._.str.12.108,"a",@progbits
	.balign	1
	.local	_.str.12.108
_.str.12.108:
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

	.section	.rodata._.str.111,"a",@progbits
	.balign	1
	.local	_.str.111
_.str.111:
	.asciz	"Air I"

	.section	.rodata._.str.1.112,"a",@progbits
	.balign	1
	.local	_.str.1.112
_.str.1.112:
	.asciz	"Base air travel +12%; dry spread +2.2%/rating."

	.section	.rodata._.str.2.113,"a",@progbits
	.balign	1
	.local	_.str.2.113
_.str.2.113:
	.asciz	"Air II"

	.section	.rodata._.str.3.114,"a",@progbits
	.balign	1
	.local	_.str.3.114
_.str.3.114:
	.asciz	"Water I"

	.section	.rodata._.str.4.115,"a",@progbits
	.balign	1
	.local	_.str.4.115
_.str.4.115:
	.asciz	"Base sea travel +12%; humid spread +2.2%/rating."

	.section	.rodata._.str.5.116,"a",@progbits
	.balign	1
	.local	_.str.5.116
_.str.5.116:
	.asciz	"Water II"

	.section	.rodata._.str.6.117,"a",@progbits
	.balign	1
	.local	_.str.6.117
_.str.6.117:
	.asciz	"Livestock I"

	.section	.rodata._.str.7.118,"a",@progbits
	.balign	1
	.local	_.str.7.118
_.str.7.118:
	.asciz	"Rural spread +2.8% per rating."

	.section	.rodata._.str.8.119,"a",@progbits
	.balign	1
	.local	_.str.8.119
_.str.8.119:
	.asciz	"Livestock II"

	.section	.rodata._.str.9.120,"a",@progbits
	.balign	1
	.local	_.str.9.120
_.str.9.120:
	.asciz	"Rodents I"

	.section	.rodata._.str.10.121,"a",@progbits
	.balign	1
	.local	_.str.10.121
_.str.10.121:
	.asciz	"Urban spread +2.8% per rating."

	.section	.rodata._.str.11.122,"a",@progbits
	.balign	1
	.local	_.str.11.122
_.str.11.122:
	.asciz	"Rodents II"

	.section	.rodata._.str.12.123,"a",@progbits
	.balign	1
	.local	_.str.12.123
_.str.12.123:
	.asciz	"Insects I"

	.section	.rodata._.str.13.124,"a",@progbits
	.balign	1
	.local	_.str.13.124
_.str.13.124:
	.asciz	"Warm spread +2.8% per rating."

	.section	.rodata._.str.14.125,"a",@progbits
	.balign	1
	.local	_.str.14.125
_.str.14.125:
	.asciz	"Insects II"

	.section	.rodata._.str.15.126,"a",@progbits
	.balign	1
	.local	_.str.15.126
_.str.15.126:
	.asciz	"Birds I"

	.section	.rodata._.str.16.127,"a",@progbits
	.balign	1
	.local	_.str.16.127
_.str.16.127:
	.asciz	"Neighbor migration; small general spread."

	.section	.rodata._.str.17.128,"a",@progbits
	.balign	1
	.local	_.str.17.128
_.str.17.128:
	.asciz	"Birds II"

	.section	.rodata._.str.18.129,"a",@progbits
	.balign	1
	.local	_.str.18.129
_.str.18.129:
	.asciz	"Blood I"

	.section	.rodata._.str.19.130,"a",@progbits
	.balign	1
	.local	_.str.19.130
_.str.19.130:
	.asciz	"Spread +1.5%; weak healthcare adds more."

	.section	.rodata._.str.20.131,"a",@progbits
	.balign	1
	.local	_.str.20.131
_.str.20.131:
	.asciz	"Blood II"

	.section	.rodata._.str.21.132,"a",@progbits
	.balign	1
	.local	_.str.21.132
_.str.21.132:
	.asciz	"Aerosol Persistence"

	.section	.rodata._.str.22.133,"a",@progbits
	.balign	1
	.local	_.str.22.133
_.str.22.133:
	.asciz	"Base air/sea +10%; spread +3%."

	.section	.rodata._.str.23.134,"a",@progbits
	.balign	1
	.local	_.str.23.134
_.str.23.134:
	.asciz	"Animal Reservoirs"

	.section	.rodata._.str.24.135,"a",@progbits
	.balign	1
	.local	_.str.24.135
_.str.24.135:
	.asciz	"Bridges sparse urban/rural areas; +6% spread."

	.section	.rodata._.str.25.136,"a",@progbits
	.balign	1
	.local	_.str.25.136
_.str.25.136:
	.asciz	"Vector Adaptation"

	.section	.rodata._.str.26.137,"a",@progbits
	.balign	1
	.local	_.str.26.137
_.str.26.137:
	.asciz	"Cold vector spread; migration +2%."

	.section	.rodata._.str.27.138,"a",@progbits
	.balign	1
	.local	_.str.27.138
_.str.27.138:
	.asciz	"Cough"

	.section	.rodata._.str.28.139,"a",@progbits
	.balign	1
	.local	_.str.28.139
_.str.28.139:
	.asciz	"Early spread; small detection risk."

	.section	.rodata._.str.29.140,"a",@progbits
	.balign	1
	.local	_.str.29.140
_.str.29.140:
	.asciz	"Sneezing"

	.section	.rodata._.str.30.141,"a",@progbits
	.balign	1
	.local	_.str.30.141
_.str.30.141:
	.asciz	"More spread; modest detection risk."

	.section	.rodata._.str.31.142,"a",@progbits
	.balign	1
	.local	_.str.31.142
_.str.31.142:
	.asciz	"Pneumonia"

	.section	.rodata._.str.32.143,"a",@progbits
	.balign	1
	.local	_.str.32.143
_.str.32.143:
	.asciz	"Stronger symptoms; some deaths."

	.section	.rodata._.str.33.144,"a",@progbits
	.balign	1
	.local	_.str.33.144
_.str.33.144:
	.asciz	"Respiratory Failure"

	.section	.rodata._.str.34.145,"a",@progbits
	.balign	1
	.local	_.str.34.145
_.str.34.145:
	.asciz	"High lethality; strong human response."

	.section	.rodata._.str.35.146,"a",@progbits
	.balign	1
	.local	_.str.35.146
_.str.35.146:
	.asciz	"Nausea"

	.section	.rodata._.str.36.147,"a",@progbits
	.balign	1
	.local	_.str.36.147
_.str.36.147:
	.asciz	"Vomiting"

	.section	.rodata._.str.37.148,"a",@progbits
	.balign	1
	.local	_.str.37.148
_.str.37.148:
	.asciz	"Diarrhea"

	.section	.rodata._.str.38.149,"a",@progbits
	.balign	1
	.local	_.str.38.149
_.str.38.149:
	.asciz	"Systemic Collapse"

	.section	.rodata._.str.39.150,"a",@progbits
	.balign	1
	.local	_.str.39.150
_.str.39.150:
	.asciz	"Rash"

	.section	.rodata._.str.40.151,"a",@progbits
	.balign	1
	.local	_.str.40.151
_.str.40.151:
	.asciz	"Fever"

	.section	.rodata._.str.41.152,"a",@progbits
	.balign	1
	.local	_.str.41.152
_.str.41.152:
	.asciz	"Immune Suppression"

	.section	.rodata._.str.42.153,"a",@progbits
	.balign	1
	.local	_.str.42.153
_.str.42.153:
	.asciz	"Organ Failure"

	.section	.rodata._.str.43.154,"a",@progbits
	.balign	1
	.local	_.str.43.154
_.str.43.154:
	.asciz	"Heat Adaptation I"

	.section	.rodata._.str.44.155,"a",@progbits
	.balign	1
	.local	_.str.44.155
_.str.44.155:
	.asciz	"Reduce heat penalty by 45%."

	.section	.rodata._.str.45.156,"a",@progbits
	.balign	1
	.local	_.str.45.156
_.str.45.156:
	.asciz	"Heat Adaptation II"

	.section	.rodata._.str.46.157,"a",@progbits
	.balign	1
	.local	_.str.46.157
_.str.46.157:
	.asciz	"Reduce heat penalty by another 45%."

	.section	.rodata._.str.47.158,"a",@progbits
	.balign	1
	.local	_.str.47.158
_.str.47.158:
	.asciz	"Cold Adaptation I"

	.section	.rodata._.str.48.159,"a",@progbits
	.balign	1
	.local	_.str.48.159
_.str.48.159:
	.asciz	"Reduce cold penalty by 45%."

	.section	.rodata._.str.49.160,"a",@progbits
	.balign	1
	.local	_.str.49.160
_.str.49.160:
	.asciz	"Cold Adaptation II"

	.section	.rodata._.str.50.161,"a",@progbits
	.balign	1
	.local	_.str.50.161
_.str.50.161:
	.asciz	"Reduce cold penalty by another 45%."

	.section	.rodata._.str.51.162,"a",@progbits
	.balign	1
	.local	_.str.51.162
_.str.51.162:
	.asciz	"Medical Resistance I"

	.section	.rodata._.str.52.163,"a",@progbits
	.balign	1
	.local	_.str.52.163
_.str.52.163:
	.asciz	"Reduce healthcare penalty by 45%."

	.section	.rodata._.str.53.164,"a",@progbits
	.balign	1
	.local	_.str.53.164
_.str.53.164:
	.asciz	"Medical Resistance II"

	.section	.rodata._.str.54.165,"a",@progbits
	.balign	1
	.local	_.str.54.165
_.str.54.165:
	.asciz	"Reduce healthcare penalty by another 45%."

	.section	.rodata._.str.55.166,"a",@progbits
	.balign	1
	.local	_.str.55.166
_.str.55.166:
	.asciz	"Genetic Hardening I"

	.section	.rodata._.str.56.167,"a",@progbits
	.balign	1
	.local	_.str.56.167
_.str.56.167:
	.asciz	"Slow future research by 30%."

	.section	.rodata._.str.57.168,"a",@progbits
	.balign	1
	.local	_.str.57.168
_.str.57.168:
	.asciz	"Genetic Hardening II"

	.section	.rodata._.str.58.169,"a",@progbits
	.balign	1
	.local	_.str.58.169
_.str.58.169:
	.asciz	"Slow research by another 30%."

	.section	.rodata._.str.59.170,"a",@progbits
	.balign	1
	.local	_.str.59.170
_.str.59.170:
	.asciz	"Genetic Reshuffle I"

	.section	.rodata._.str.60.171,"a",@progbits
	.balign	1
	.local	_.str.60.171
_.str.60.171:
	.asciz	"Once: remove 15 cure percentage points."

	.section	.rodata._.str.61.172,"a",@progbits
	.balign	1
	.local	_.str.61.172
_.str.61.172:
	.asciz	"Genetic Reshuffle II"

	.section	.rodata._.str.62.173,"a",@progbits
	.balign	1
	.local	_.str.62.173
_.str.62.173:
	.asciz	"Once: remove 25 cure percentage points."

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

	.section	.rodata._.str.202,"a",@progbits
	.balign	1
	.local	_.str.202
_.str.202:
	.asciz	">"

	.section	.rodata._.str.1.203,"a",@progbits
	.balign	1
	.local	_.str.1.203
_.str.1.203:
	.asciz	" "

	.section	.rodata._.str.2.210,"a",@progbits
	.balign	1
	.local	_.str.2.210
_.str.2.210:
	.asciz	"Up/Down: select   Enter: confirm"

	.section	.rodata._.str.3.211,"a",@progbits
	.balign	1
	.local	_.str.3.211
_.str.3.211:
	.asciz	"Clear: back"

	.section	.rodata._.str.4.214,"a",@progbits
	.balign	1
	.local	_.str.4.214
_.str.4.214:
	.asciz	"Back (Enter / Clear)"

	.section	.bss._news_count,"aw",@nobits
	.balign	1
	.local	_news_count
_news_count:
	.zero	1

	.section	.bss._news,"aw",@nobits
	.balign	1
	.local	_news
_news:
	.zero	384

	.section	.bss._news_head,"aw",@nobits
	.balign	1
	.local	_news_head
_news_head:
	.zero	1

	.section	.rodata._.str.5.217,"a",@progbits
	.balign	1
	.local	_.str.5.217
_.str.5.217:
	.asciz	"%s"

	.section	.bss._region,"aw",@nobits
	.balign	2
	.globl	_region
_region:
	.zero	112

	.section	.bss._disease,"aw",@nobits
	.balign	2
	.globl	_disease
_disease:
	.zero	58

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

	.section	.bss._effects,"aw",@nobits
	.balign	2
	.globl	_effects
_effects:
	.zero	28

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

	.section	.bss._news_age,"aw",@nobits
	.balign	1
	.local	_news_age
_news_age:
	.zero	1

	.section	.rodata._.str.6.220,"a",@progbits
	.balign	1
	.local	_.str.6.220
_.str.6.220:
	.asciz	"Resume"

	.section	.rodata._.str.7.221,"a",@progbits
	.balign	1
	.local	_.str.7.221
_.str.7.221:
	.asciz	"Evolution"

	.section	.rodata._.str.8.222,"a",@progbits
	.balign	1
	.local	_.str.8.222
_.str.8.222:
	.asciz	"Region Details"

	.section	.rodata._.str.9.224,"a",@progbits
	.balign	1
	.local	_.str.9.224
_.str.9.224:
	.asciz	"Travel View: ON (toggle)"

	.section	.rodata._.str.10.223,"a",@progbits
	.balign	1
	.local	_.str.10.223
_.str.10.223:
	.asciz	"Travel View: OFF (toggle)"

	.section	.rodata._.str.11.225,"a",@progbits
	.balign	1
	.local	_.str.11.225
_.str.11.225:
	.asciz	"Spore Burst: %u left, %u DNA"

	.section	.rodata._spore_costs,"a",@progbits
	.balign	1
	.globl	_spore_costs
_spore_costs:
	.ascii	"\n\020\030"

	.section	.rodata._.str.12.226,"a",@progbits
	.balign	1
	.local	_.str.12.226
_.str.12.226:
	.asciz	"Spore Burst: no charges left"

	.section	.rodata._.str.13.227,"a",@progbits
	.balign	1
	.local	_.str.13.227
_.str.13.227:
	.asciz	"Save & Main Menu"

	.section	.rodata._.str.14.228,"a",@progbits
	.balign	1
	.local	_.str.14.228
_.str.14.228:
	.asciz	"Save & Quit"

	.section	.rodata._.str.15.229,"a",@progbits
	.balign	1
	.local	_.str.15.229
_.str.15.229:
	.asciz	"PAUSED: ACTIONS"

	.section	.rodata._.str.16.230,"a",@progbits
	.balign	1
	.local	_.str.16.230
_.str.16.230:
	.asciz	"Clear: resume"

	.section	.rodata._.str.17.237,"a",@progbits
	.balign	1
	.local	_.str.17.237
_.str.17.237:
	.asciz	"CONTAGION CE 2.0"

	.section	.rodata._.str.18.238,"a",@progbits
	.balign	1
	.local	_.str.18.238
_.str.18.238:
	.asciz	"Seven regions. One extinction objective."

	.section	.rodata._.str.19.239,"a",@progbits
	.balign	1
	.local	_.str.19.239
_.str.19.239:
	.asciz	"Spread quietly, earn DNA, then evolve lethal symptoms before humanity completes its cure."

	.section	.rodata._.str.20.240,"a",@progbits
	.balign	1
	.local	_.str.20.240
_.str.20.240:
	.asciz	"New Game"

	.section	.rodata._.str.21.241,"a",@progbits
	.balign	1
	.local	_.str.21.241
_.str.21.241:
	.asciz	"Continue"

	.section	.rodata._.str.22.242,"a",@progbits
	.balign	1
	.local	_.str.22.242
_.str.22.242:
	.asciz	"Results"

	.section	.rodata._.str.23.243,"a",@progbits
	.balign	1
	.local	_.str.23.243
_.str.23.243:
	.asciz	"Clear: select Save & Quit"

	.section	.rodata._.str.24.283,"a",@progbits
	.balign	1
	.local	_.str.24.283
_.str.24.283:
	.asciz	"CNTGN2"

	.section	.rodata._.str.25.284,"a",@progbits
	.balign	1
	.local	_.str.25.284
_.str.25.284:
	.asciz	"r"

	.section	.bss._expected,"aw",@nobits
	.balign	2
	.local	_expected
_expected:
	.zero	58

	.section	.bss._expected_session,"aw",@nobits
	.balign	1
	.local	_expected_session
_expected_session:
	.zero	9

	.section	.rodata._.str.26.285,"a",@progbits
	.balign	1
	.local	_.str.26.285
_.str.26.285:
	.asciz	"CNTGN2B"

	.section	.rodata._.str.27.286,"a",@progbits
	.balign	1
	.local	_.str.27.286
_.str.27.286:
	.asciz	"CNTGN2T"

	.section	.rodata._.str.28.287,"a",@progbits
	.balign	1
	.local	_.str.28.287
_.str.28.287:
	.asciz	"w"

	.section	.bss._native_check,"aw",@nobits
	.balign	2
	.globl	_native_check
_native_check:
	.zero	2

	.section	.rodata._.str.29.288,"a",@progbits
	.balign	1
	.local	_.str.29.288
_.str.29.288:
	.asciz	"PASS: NATIVE SAVE CHECKS"

	.section	.rodata._.str.30.289,"a",@progbits
	.balign	1
	.local	_.str.30.289
_.str.30.289:
	.asciz	"Roundtrip, partial cycle, backup"

	.section	.rodata._.str.31.290,"a",@progbits
	.balign	1
	.local	_.str.31.290
_.str.31.290:
	.asciz	"Corrupt/missing primary, archive"

	.section	.rodata._.str.32.291,"a",@progbits
	.balign	1
	.local	_.str.32.291
_.str.32.291:
	.asciz	"Full RAM, interrupted copy, reset"

	.section	.rodata._.str.33.292,"a",@progbits
	.balign	1
	.local	_.str.33.292
_.str.33.292:
	.asciz	"FUNDED UI TEST FIXTURE"

	.section	.rodata._.str.34.293,"a",@progbits
	.balign	1
	.local	_.str.34.293
_.str.34.293:
	.asciz	"VIRUS DEVOLUTION FIXTURE"

	.section	.rodata._.str.35.294,"a",@progbits
	.balign	1
	.local	_.str.35.294
_.str.35.294:
	.asciz	"PASS: MENU AND SAVE CHECKS"

	.section	.rodata._SaveExit.choices,"a",@progbits
	.balign	1
	.local	_SaveExit.choices
_SaveExit.choices:
	d24	_.str.36.235
	d24	_.str.37.236
	d24	_.str.38.234

	.section	.rodata._.str.36.235,"a",@progbits
	.balign	1
	.local	_.str.36.235
_.str.36.235:
	.asciz	"Return to game/menu"

	.section	.rodata._.str.37.236,"a",@progbits
	.balign	1
	.local	_.str.37.236
_.str.37.236:
	.asciz	"Retry save"

	.section	.rodata._.str.38.234,"a",@progbits
	.balign	1
	.local	_.str.38.234
_.str.38.234:
	.asciz	"Quit Without Saving"

	.section	.rodata._.str.39.231,"a",@progbits
	.balign	1
	.local	_.str.39.231
_.str.39.231:
	.asciz	"SAVE FAILED: FREE CALCULATOR RAM"

	.section	.rodata._SaveExit.confirm,"a",@progbits
	.balign	1
	.local	_SaveExit.confirm
_SaveExit.confirm:
	d24	_.str.40.233
	d24	_.str.38.234

	.section	.rodata._.str.40.233,"a",@progbits
	.balign	1
	.local	_.str.40.233
_.str.40.233:
	.asciz	"Go back"

	.section	.rodata._.str.41.232,"a",@progbits
	.balign	1
	.local	_.str.41.232
_.str.41.232:
	.asciz	"DISCARD UNSAVED PROGRESS?"

	.section	.rodata._InitializeMap.names,"a",@progbits
	.balign	1
	.local	_InitializeMap.names
_InitializeMap.names:
	d24	_.str.42.276
	d24	_.str.43.277
	d24	_.str.44.278
	d24	_.str.45.279
	d24	_.str.46.280
	d24	_.str.47.281
	d24	_.str.48.282

	.section	.rodata._.str.42.276,"a",@progbits
	.balign	1
	.local	_.str.42.276
_.str.42.276:
	.asciz	"Africa"

	.section	.rodata._.str.43.277,"a",@progbits
	.balign	1
	.local	_.str.43.277
_.str.43.277:
	.asciz	"Asia"

	.section	.rodata._.str.44.278,"a",@progbits
	.balign	1
	.local	_.str.44.278
_.str.44.278:
	.asciz	"Europe"

	.section	.rodata._.str.45.279,"a",@progbits
	.balign	1
	.local	_.str.45.279
_.str.45.279:
	.asciz	"Greenland"

	.section	.rodata._.str.46.280,"a",@progbits
	.balign	1
	.local	_.str.46.280
_.str.46.280:
	.asciz	"North America"

	.section	.rodata._.str.47.281,"a",@progbits
	.balign	1
	.local	_.str.47.281
_.str.47.281:
	.asciz	"South America"

	.section	.rodata._.str.48.282,"a",@progbits
	.balign	1
	.local	_.str.48.282
_.str.48.282:
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

	.section	.rodata._.str.49.273,"a",@progbits
	.balign	1
	.local	_.str.49.273
_.str.49.273:
	.asciz	"Balanced. No automatic mutations. Recommended for your first outbreak."

	.section	.rodata._.str.50.274,"a",@progbits
	.balign	1
	.local	_.str.50.274
_.str.50.274:
	.asciz	"Free symptom mutations can help spread, but raise discovery risk. Devolution costs more."

	.section	.rodata._.str.51.275,"a",@progbits
	.balign	1
	.local	_.str.51.275
_.str.51.275:
	.asciz	"Weaker human travel. Three paid spore bursts can seed any region with healthy land."

	.section	.rodata.___const.StartGame.descriptions,"a",@progbits
	.balign	1
	.local	___const.StartGame.descriptions
___const.StartGame.descriptions:
	d24	_.str.49.273
	d24	_.str.50.274
	d24	_.str.51.275

	.section	.rodata._.str.52.244,"a",@progbits
	.balign	1
	.local	_.str.52.244
_.str.52.244:
	.asciz	"NEW GAME: DISEASE TYPE"

	.section	.rodata._disease_names,"a",@progbits
	.balign	1
	.globl	_disease_names
_disease_names:
	d24	_.str
	d24	_.str.1
	d24	_.str.2

	.section	.rodata._.str.53.245,"a",@progbits
	.balign	1
	.local	_.str.53.245
_.str.53.245:
	.asciz	"Up/Down: type   Enter: choose"

	.section	.rodata._.str.54.246,"a",@progbits
	.balign	1
	.local	_.str.54.246
_.str.54.246:
	.asciz	"Clear: cancel"

	.section	.rodata._.str.55.252,"a",@progbits
	.balign	1
	.local	_.str.55.252
_.str.55.252:
	.asciz	"Select healthy land for your first case."

	.section	.rodata._.str.56.253,"a",@progbits
	.balign	1
	.local	_.str.56.253
_.str.56.253:
	.asciz	"Arrows: move  Enter: seed  Clear: cancel"

	.section	.rodata._NameDisease.alphabet,"a",@progbits
	.balign	1
	.local	_NameDisease.alphabet
_NameDisease.alphabet:
	.asciz	"ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789 -"

	.section	.rodata._.str.57.247,"a",@progbits
	.balign	1
	.local	_.str.57.247
_.str.57.247:
	.asciz	"NAME YOUR DISEASE"

	.section	.rodata._.str.58.248,"a",@progbits
	.balign	1
	.local	_.str.58.248
_.str.58.248:
	.asciz	"Done"

	.section	.rodata._.str.59.249,"a",@progbits
	.balign	1
	.local	_.str.59.249
_.str.59.249:
	.asciz	"%u/19 characters   Del: erase"

	.section	.rodata._.str.60.250,"a",@progbits
	.balign	1
	.local	_.str.60.250
_.str.60.250:
	.asciz	"Arrows: select   Enter: add / done"

	.section	.rodata._.str.61.251,"a",@progbits
	.balign	1
	.local	_.str.61.251
_.str.61.251:
	.asciz	"Pathogen"

	.section	.rodata._.str.62.267,"a",@progbits
	.balign	1
	.local	_.str.62.267
_.str.62.267:
	.asciz	"SAVE FAILED"

	.section	.rodata._.str.63.268,"a",@progbits
	.balign	1
	.local	_.str.63.268
_.str.63.268:
	.asciz	"Unable to save. Your last validated save is retained. Free calculator storage and try again."

	.section	.rodata._.str.64.254,"a",@progbits
	.balign	1
	.local	_.str.64.254
_.str.64.254:
	.asciz	"Mutation: %s"

	.section	.rodata._traits,"a",@progbits
	.balign	2
	.globl	_traits
_traits:
	d24	_.str.111
	d24	_.str.1.112
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
	d24	_.str.2.113
	d24	_.str.1.112
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
	d24	_.str.3.114
	d24	_.str.4.115
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
	d24	_.str.5.116
	d24	_.str.4.115
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
	d24	_.str.6.117
	d24	_.str.7.118
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
	d24	_.str.8.119
	d24	_.str.7.118
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
	d24	_.str.9.120
	d24	_.str.10.121
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
	d24	_.str.11.122
	d24	_.str.10.121
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
	d24	_.str.12.123
	d24	_.str.13.124
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
	d24	_.str.14.125
	d24	_.str.13.124
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
	d24	_.str.15.126
	d24	_.str.16.127
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
	d24	_.str.17.128
	d24	_.str.16.127
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
	d24	_.str.18.129
	d24	_.str.19.130
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
	d24	_.str.20.131
	d24	_.str.19.130
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
	d24	_.str.21.132
	d24	_.str.22.133
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
	d24	_.str.23.134
	d24	_.str.24.135
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
	d24	_.str.25.136
	d24	_.str.26.137
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
	d24	_.str.27.138
	d24	_.str.28.139
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
	d24	_.str.29.140
	d24	_.str.30.141
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
	d24	_.str.31.142
	d24	_.str.32.143
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
	d24	_.str.33.144
	d24	_.str.34.145
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
	d24	_.str.35.146
	d24	_.str.28.139
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
	d24	_.str.36.147
	d24	_.str.30.141
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
	d24	_.str.37.148
	d24	_.str.32.143
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
	d24	_.str.38.149
	d24	_.str.34.145
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
	d24	_.str.39.150
	d24	_.str.28.139
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
	d24	_.str.40.151
	d24	_.str.30.141
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
	d24	_.str.41.152
	d24	_.str.32.143
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
	d24	_.str.42.153
	d24	_.str.34.145
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
	d24	_.str.43.154
	d24	_.str.44.155
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
	d24	_.str.45.156
	d24	_.str.46.157
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
	d24	_.str.47.158
	d24	_.str.48.159
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
	d24	_.str.49.160
	d24	_.str.50.161
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
	d24	_.str.51.162
	d24	_.str.52.163
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
	d24	_.str.53.164
	d24	_.str.54.165
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
	d24	_.str.55.166
	d24	_.str.56.167
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
	d24	_.str.57.168
	d24	_.str.58.169
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
	d24	_.str.59.170
	d24	_.str.60.171
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
	d24	_.str.61.172
	d24	_.str.62.173
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

	.section	.rodata._.str.65.255,"a",@progbits
	.balign	1
	.local	_.str.65.255
_.str.65.255:
	.asciz	"Outbreak discovered."

	.section	.rodata._.str.66.256,"a",@progbits
	.balign	1
	.local	_.str.66.256
_.str.66.256:
	.asciz	"Cure research has begun."

	.section	.rodata._.str.67.257,"a",@progbits
	.balign	1
	.local	_.str.67.257
_.str.67.257:
	.asciz	"Public response is escalating."

	.section	.rodata._.str.68.258,"a",@progbits
	.balign	1
	.local	_.str.68.258
_.str.68.258:
	.asciz	"Cure milestone: 25%."

	.section	.rodata._.str.69.259,"a",@progbits
	.balign	1
	.local	_.str.69.259
_.str.69.259:
	.asciz	"Cure milestone: 50%."

	.section	.rodata._.str.70.260,"a",@progbits
	.balign	1
	.local	_.str.70.260
_.str.70.260:
	.asciz	"Cure milestone: 75%."

	.section	.rodata._.str.71.261,"a",@progbits
	.balign	1
	.local	_.str.71.261
_.str.71.261:
	.asciz	"Cure milestone: 90%."

	.section	.rodata._.str.72.262,"a",@progbits
	.balign	1
	.local	_.str.72.262
_.str.72.262:
	.asciz	"New travel restrictions: %u regions."

	.section	.rodata._.str.73.263,"a",@progbits
	.balign	1
	.local	_.str.73.263
_.str.73.263:
	.asciz	"DNA %u   Cure %u%%   Cycle %lu"

	.section	.rodata._responses,"a",@progbits
	.balign	1
	.local	_responses
_responses:
	d24	_.str.77.269
	d24	_.str.78.270
	d24	_.str.79.271
	d24	_.str.80.272

	.section	.rodata._.str.74.264,"a",@progbits
	.balign	1
	.local	_.str.74.264
_.str.74.264:
	.asciz	"%s: active %u%%  dead %u%%"

	.section	.rodata._.str.75.265,"a",@progbits
	.balign	1
	.local	_.str.75.265
_.str.75.265:
	.asciz	"World affected %u%%   dead %u%%"

	.section	.rodata._.str.76.266,"a",@progbits
	.balign	1
	.local	_.str.76.266
_.str.76.266:
	.asciz	"Arrows: region   Enter/Clear: actions"

	.section	.rodata._.str.77.269,"a",@progbits
	.balign	1
	.local	_.str.77.269
_.str.77.269:
	.asciz	"Undetected"

	.section	.rodata._.str.78.270,"a",@progbits
	.balign	1
	.local	_.str.78.270
_.str.78.270:
	.asciz	"Discovered"

	.section	.rodata._.str.79.271,"a",@progbits
	.balign	1
	.local	_.str.79.271
_.str.79.271:
	.asciz	"Research underway"

	.section	.rodata._.str.80.272,"a",@progbits
	.balign	1
	.local	_.str.80.272
_.str.80.272:
	.asciz	"Escalating response"

	.section	.rodata._.str.81.295,"a",@progbits
	.balign	1
	.local	_.str.81.295
_.str.81.295:
	.asciz	"FAIL native save check %u"

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
	.extern	_strcat
	.extern	_llvm.uadd.with.overflow.i24
	.extern	__ishru
	.extern	_llvm.usub.sat.i16
	.extern	__Unwind_SjLj_Unregister
	.extern	__sremu
	.extern	_llvm.memset.p0.i64
	.extern	__sneg
	.extern	_os_GetCSC
	.extern	__lsub
	.extern	__lcmpzero
	.extern	_memchr
	.extern	_llvm.abs.i24
	.extern	_ti_Open
	.extern	_ti_Seek
	.extern	__ladd
	.extern	_llvm.umin.i24
	.extern	__idivu
	.extern	__lxor
	.extern	__indcallhl
	.extern	_llvm.eh.sjlj.lsda
	.extern	_free
	.extern	_ti_Delete
	.extern	__iand
	.extern	__lnot
	.extern	_ti_Resize
	.extern	_ti_Close
	.extern	_memcmp
	.extern	__bremu
	.extern	_gfx_VertLine
	.extern	_gfx_Rectangle
	.extern	_gfx_Blit
	.extern	__sdivs
	.extern	__iremu
	.extern	__sdivu
	.extern	_llvm.umin.i8
	.extern	_llvm.memset.p0.i24
	.extern	_gfx_End
	.extern	_gfx_FillTriangle
	.extern	_llvm.frameaddress.p0
	.extern	_gfx_ScaledTransparentSprite_NoClip
	.extern	__lshl
	.extern	__lremu
	.extern	__sand
	.extern	_kb_AnyKey
	.extern	_sprintf
	.extern	__lcmpu
	.extern	__indcall
	.extern	_gfx_SetTextScale
	.extern	_gfx_PrintChar
	.extern	__ishru_1
	.extern	__lcmps
	.extern	_gfx_SetTextBGColor
	.extern	__sshru
	.extern	__frameset
	.extern	_os_MemChk
	.extern	_llvm.eh.sjlj.callsite
	.extern	_gfx_Circle
	.extern	_ti_Write
	.extern	__lmulu
	.extern	__sshl
	.extern	__smulu
	.extern	__ldivu
	.extern	_llvm.smin.i24
	.extern	_gfx_FillRectangle
	.extern	_ti_IsArchived
	.extern	_llvm.lifetime.end.p0
	.extern	__sor
	.extern	__idivs
	.extern	_kb_Scan
	.extern	__land
	.extern	_llvm.umax.i8
	.extern	_srand
	.extern	_gfx_Line
	.extern	_ti_Read
	.extern	_malloc
	.extern	_gfx_GetStringWidth
	.extern	_snprintf
	.extern	_strcpy
	.extern	__setflag
	.extern	_llvm.smax.i32
	.extern	_gfx_TransparentSprite
	.extern	_llvm.stacksave.p0
	.extern	_llvm.lifetime.start.p0
	.extern	_gfx_SetTextTransparentColor
	.extern	__lshru
	.extern	__ixor
	.extern	_llvm.eh.sjlj.functioncontext
	.extern	_ti_GetSize
	.extern	_memcpy
	.extern	_llvm.umin.i32
	.extern	_realloc
	.extern	__srems
	.extern	_llvm.umax.i24
	.extern	_gfx_FillScreen
	.extern	_gfx_PrintStringXY
	.extern	_gfx_SetColor
	.extern	_llvm.memcpy.p0.p0.i24
	.extern	_llvm.eh.sjlj.setup.dispatch
	.extern	_gfx_SetTextXY
	.extern	_llvm.stackrestore.p0
	.extern	_gfx_SetTextFGColor
	.extern	_gfx_Begin
	.extern	__bdivu
	.extern	_gfx_SetTransparentColor
	.extern	_gfx_SwapDraw
	.extern	__lor
	.extern	_random
	.extern	__imulu
	.extern	__frameset0
	.extern	__Unwind_SjLj_Register
	.extern	__bshl
	.extern	_gfx_SetDraw
	.extern	__ishl
