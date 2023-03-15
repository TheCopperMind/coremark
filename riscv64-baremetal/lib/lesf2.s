	.file	"lesf2.c"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	__lesf2
	.type	__lesf2, @function
__lesf2:
	srli	a3,a0,23
	li	a4,8388608
	addi	a4,a4,-1
	srli	a2,a1,23
	andi	a3,a3,0xff
	li	a6,255
	and	a7,a4,a0
	srli	a5,a0,31
	and	a4,a4,a1
	andi	a2,a2,0xff
	srli	a0,a1,31
	beq	a3,a6,.L50
	beq	a2,a6,.L18
	bnez	a3,.L19
	seqz	a1,a7
	bnez	a2,.L10
	bnez	a4,.L10
	li	a0,0
	bnez	a7,.L9
.L1:
	ret
.L50:
	bnez	a7,.L21
	bne	a2,a3,.L19
.L18:
	bnez	a4,.L21
	bnez	a3,.L8
	seqz	a1,a7
.L10:
	bnez	a1,.L46
.L8:
	beq	a5,a0,.L51
.L9:
	li	a0,1
	beqz	a5,.L1
.L41:
	li	a0,-1
	ret
.L21:
	li	a0,2
	ret
.L46:
	beqz	a0,.L41
	ret
.L19:
	bnez	a2,.L8
	bnez	a4,.L8
	j	.L9
.L51:
	bgt	a3,a2,.L43
	blt	a3,a2,.L46
	bgtu	a7,a4,.L43
	bltu	a7,a4,.L46
	li	a0,0
	ret
.L43:
	bnez	a0,.L41
	li	a0,1
	ret
	.size	__lesf2, .-__lesf2
	.globl	__ltsf2
	.set	__ltsf2,__lesf2
	.ident	"GCC: () 9.3.0"
