	.file	"floatsisf.c"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.globl	__clzsi2
	.align	2
	.globl	__floatsisf
	.type	__floatsisf, @function
__floatsisf:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	beqz	a0,.L9
	srai	a4,a0,31
	xor	s1,a4,a0
	sub	s1,s1,a4
	mv	a5,a0
	mv	a0,s1
	srli	s0,a5,31
	call	__clzsi2
	li	a5,158
	sub	a5,a5,a0
	li	a4,150
	mv	a3,a0
	bgt	a5,a4,.L4
	li	a4,8
	andi	a0,a5,0xff
	ble	a3,a4,.L18
	addi	a3,a3,-8
	sll	s1,s1,a3
.L18:
	slli	s1,s1,9
	srli	s1,s1,9
	j	.L2
.L9:
	li	s0,0
	li	a0,0
	li	s1,0
.L2:
	lw	ra,12(sp)
	slli	a5,s0,31
	lw	s0,8(sp)
	slli	a0,a0,23
	or	a0,a0,s1
	or	a0,a0,a5
	lw	s1,4(sp)
	addi	sp,sp,16
	jr	ra
.L4:
	li	a4,153
	ble	a5,a4,.L6
	addi	a0,a0,27
	li	a4,5
	sll	a0,s1,a0
	sub	a4,a4,a3
	srl	s1,s1,a4
	snez	a0,a0
	or	s1,s1,a0
.L6:
	li	a4,5
	ble	a3,a4,.L7
	addi	a4,a3,-5
	sll	s1,s1,a4
.L7:
	li	a2,-67108864
	addi	a2,a2,-1
	andi	a1,s1,7
	and	a4,s1,a2
	beqz	a1,.L8
	andi	s1,s1,15
	li	a1,4
	beq	s1,a1,.L8
	addi	a4,a4,4
	slli	a1,a4,5
	bgez	a1,.L8
	li	a5,159
	and	a4,a4,a2
	sub	a5,a5,a3
.L8:
	slli	s1,a4,6
	srli	s1,s1,9
	andi	a0,a5,0xff
	j	.L2
	.size	__floatsisf, .-__floatsisf
	.ident	"GCC: () 9.3.0"
