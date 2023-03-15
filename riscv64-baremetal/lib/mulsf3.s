	.file	"mulsf3.c"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.globl	__clzsi2
	.align	2
	.globl	__mulsf3
	.type	__mulsf3, @function
__mulsf3:
	addi	sp,sp,-48
	sw	s1,36(sp)
	srli	s1,a0,23
	sw	s0,40(sp)
	sw	s5,20(sp)
	slli	s0,a0,9
	sw	ra,44(sp)
	sw	s2,32(sp)
	sw	s3,28(sp)
	sw	s4,24(sp)
	sw	s6,16(sp)
	andi	s1,s1,0xff
	srli	s0,s0,9
	srli	s5,a0,31
	beqz	s1,.L2
	li	a5,255
	beq	s1,a5,.L3
	slli	s0,s0,3
	li	a5,67108864
	or	s0,s0,a5
	addi	s1,s1,-127
	li	s3,0
	li	s6,0
.L4:
	srli	a5,a1,23
	slli	s4,a1,9
	andi	a5,a5,0xff
	srli	s4,s4,9
	srli	s2,a1,31
	beqz	a5,.L5
.L50:
	li	a4,255
	beq	a5,a4,.L6
	slli	s4,s4,3
	addi	a5,a5,-127
	li	a4,67108864
	or	s4,s4,a4
	add	s1,s1,a5
	li	a1,0
.L7:
	xor	a3,s5,s2
	li	a5,15
	mv	a4,a3
	addi	a2,s1,1
	bgtu	s3,a5,.L10
	lui	a5,%hi(.L12)
	addi	a5,a5,%lo(.L12)
	slli	s3,s3,2
	add	s3,s3,a5
	lw	a5,0(s3)
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L12:
	.word	.L10
	.word	.L47
	.word	.L47
	.word	.L14
	.word	.L15
	.word	.L15
	.word	.L30
	.word	.L14
	.word	.L15
	.word	.L30
	.word	.L15
	.word	.L14
	.word	.L13
	.word	.L13
	.word	.L13
	.word	.L30
	.text
.L6:
	addi	s1,s1,255
	bnez	s4,.L9
	ori	s3,s3,2
	li	a1,2
	j	.L7
.L14:
	mv	a4,s2
.L47:
	mv	s0,s4
	mv	s6,a1
.L15:
	li	a5,2
	beq	s6,a5,.L19
	li	a5,3
	beq	s6,a5,.L30
	li	a5,1
	mv	a3,a4
	bne	s6,a5,.L18
	li	a0,0
	li	a4,0
.L11:
	slli	s0,a0,23
	or	s0,s0,a4
	slli	a0,a3,31
	lw	ra,44(sp)
	or	a0,s0,a0
	lw	s0,40(sp)
	lw	s1,36(sp)
	lw	s2,32(sp)
	lw	s3,28(sp)
	lw	s4,24(sp)
	lw	s5,20(sp)
	lw	s6,16(sp)
	addi	sp,sp,48
	jr	ra
.L30:
	li	a3,0
	li	a0,255
	li	a4,4194304
	j	.L11
.L2:
	bnez	s0,.L49
	srli	a5,a1,23
	slli	s4,a1,9
	andi	a5,a5,0xff
	li	s3,4
	li	s1,0
	li	s6,1
	srli	s4,s4,9
	srli	s2,a1,31
	bnez	a5,.L50
.L5:
	bnez	s4,.L8
	ori	s3,s3,1
	li	a1,1
	j	.L7
.L3:
	bnez	s0,.L27
	li	s3,8
	li	s1,255
	li	s6,2
	j	.L4
.L10:
	li	a7,65536
	addi	a4,a7,-1
	srli	a1,s0,16
	srli	a6,s4,16
	and	s0,s0,a4
	and	s4,s4,a4
	mul	a0,s4,s0
	mul	s4,a1,s4
	srli	a4,a0,16
	mul	s0,a6,s0
	add	a5,s0,s4
	add	a5,a4,a5
	mul	a1,a1,a6
	bleu	s4,a5,.L17
	add	a1,a1,a7
.L17:
	li	a6,65536
	addi	a6,a6,-1
	and	a4,a5,a6
	slli	a4,a4,16
	and	a0,a0,a6
	add	a4,a4,a0
	slli	s0,a4,6
	srli	a5,a5,16
	snez	s0,s0
	srli	a4,a4,26
	add	a5,a5,a1
	or	a4,s0,a4
	slli	a5,a5,6
	or	s0,a5,a4
	slli	a4,a5,4
	bgez	a4,.L29
	srli	a5,s0,1
	andi	s0,s0,1
	or	s0,a5,s0
.L18:
	addi	a5,a2,127
	blez	a5,.L21
	andi	a4,s0,7
	beqz	a4,.L22
	andi	a4,s0,15
	li	a1,4
	beq	a4,a1,.L22
	addi	s0,s0,4
.L22:
	slli	a4,s0,4
	bgez	a4,.L23
	li	a5,-134217728
	addi	a5,a5,-1
	and	s0,s0,a5
	addi	a5,a2,128
.L23:
	li	a4,254
	bgt	a5,a4,.L31
	slli	s0,s0,6
	srli	a4,s0,9
	andi	a0,a5,0xff
	j	.L11
.L19:
	mv	a3,a4
	li	a0,255
	li	a4,0
	j	.L11
.L13:
	mv	a4,s5
	j	.L15
.L9:
	ori	s3,s3,3
	li	a1,3
	j	.L7
.L8:
	mv	a0,s4
	call	__clzsi2
	addi	a5,a0,-5
	sub	s1,s1,a0
	sll	s4,s4,a5
	addi	s1,s1,-118
	li	a1,0
	j	.L7
.L27:
	li	s3,12
	li	s1,255
	li	s6,3
	j	.L4
.L49:
	mv	a0,s0
	sw	a1,12(sp)
	call	__clzsi2
	addi	a5,a0,-5
	li	s1,-118
	lw	a1,12(sp)
	sll	s0,s0,a5
	sub	s1,s1,a0
	li	s3,0
	li	s6,0
	j	.L4
.L21:
	li	a1,1
	sub	a1,a1,a5
	beqz	a5,.L24
	li	a5,27
	li	a0,0
	li	a4,0
	bgt	a1,a5,.L11
.L24:
	addi	a5,a2,158
	sll	a5,s0,a5
	snez	a5,a5
	srl	s0,s0,a1
	or	s0,s0,a5
	andi	a5,s0,7
	beqz	a5,.L25
	andi	a5,s0,15
	li	a4,4
	beq	a5,a4,.L25
	addi	s0,s0,4
.L25:
	slli	a5,s0,5
	bgez	a5,.L51
	li	a0,1
	li	a4,0
	j	.L11
.L31:
	li	a0,255
	li	a4,0
	j	.L11
.L29:
	mv	a2,s1
	j	.L18
.L51:
	slli	s0,s0,6
	srli	a4,s0,9
	li	a0,0
	j	.L11
	.size	__mulsf3, .-__mulsf3
	.ident	"GCC: () 9.3.0"
