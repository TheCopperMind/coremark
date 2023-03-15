	.file	"floatunsisf.c"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.globl	__clzsi2
	.align	2
	.globl	__floatunsisf
	.type	__floatunsisf, @function
__floatunsisf:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	beqz	a0,.L8
	mv	s0,a0
	call	__clzsi2
	li	a5,158
	sub	a5,a5,a0
	li	a4,150
	bgt	a5,a4,.L3
	li	a4,8
	andi	a5,a5,0xff
	ble	a0,a4,.L17
	addi	a0,a0,-8
	sll	s0,s0,a0
.L17:
	slli	s0,s0,9
	srli	s0,s0,9
	slli	a0,a5,23
	lw	ra,12(sp)
	or	a0,a0,s0
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
.L8:
	li	a5,0
	li	s0,0
	slli	a0,a5,23
	lw	ra,12(sp)
	or	a0,a0,s0
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
.L3:
	li	a4,153
	ble	a5,a4,.L5
	addi	a4,a0,27
	li	a3,5
	sll	a4,s0,a4
	sub	a3,a3,a0
	snez	a4,a4
	srl	s0,s0,a3
	or	s0,a4,s0
.L5:
	li	a4,5
	ble	a0,a4,.L6
	addi	a4,a0,-5
	sll	s0,s0,a4
.L6:
	li	a3,-67108864
	addi	a3,a3,-1
	andi	a2,s0,7
	and	a4,s0,a3
	beqz	a2,.L7
	andi	s0,s0,15
	li	a2,4
	beq	s0,a2,.L7
	addi	a4,a4,4
	slli	a2,a4,5
	bgez	a2,.L7
	li	a5,159
	and	a4,a4,a3
	sub	a5,a5,a0
.L7:
	slli	s0,a4,6
	andi	a5,a5,0xff
	srli	s0,s0,9
	slli	a0,a5,23
	lw	ra,12(sp)
	or	a0,a0,s0
	lw	s0,8(sp)
	addi	sp,sp,16
	jr	ra
	.size	__floatunsisf, .-__floatunsisf
	.ident	"GCC: () 9.3.0"
