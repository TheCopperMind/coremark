	.file	"divsf3.c"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.globl	__clzsi2
	.align	2
	.globl	__divsf3
	.type	__divsf3, @function
__divsf3:
	addi	sp,sp,-64
	srli	a5,a0,23
	sw	s1,52(sp)
	sw	s5,36(sp)
	sw	s7,28(sp)
	slli	a3,a0,9
	srli	s1,a0,31
	sw	ra,60(sp)
	sw	s0,56(sp)
	sw	s2,48(sp)
	sw	s3,44(sp)
	sw	s4,40(sp)
	sw	s6,32(sp)
	andi	a5,a5,0xff
	srli	s5,a3,9
	mv	s7,s1
	beqz	a5,.L2
	li	a2,255
	beq	a5,a2,.L3
	slli	a3,s5,3
	li	a2,67108864
	or	s5,a3,a2
	addi	s4,a5,-127
	li	s0,0
	li	s6,0
.L4:
	srli	a5,a1,23
	slli	s3,a1,9
	andi	a5,a5,0xff
	srli	s3,s3,9
	srli	s2,a1,31
	beqz	a5,.L5
	li	a4,255
	beq	a5,a4,.L6
	li	a4,67108864
	slli	s3,s3,3
	addi	a5,a5,-127
	or	s3,s3,a4
	sub	s4,s4,a5
	li	a4,0
.L7:
	or	s0,s0,a4
	lui	a5,%hi(.L11)
	addi	a5,a5,%lo(.L11)
	slli	s0,s0,2
	add	s0,s0,a5
	lw	a5,0(s0)
	xor	s1,s1,s2
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L11:
	.word	.L9
	.word	.L64
	.word	.L32
	.word	.L13
	.word	.L32
	.word	.L46
	.word	.L32
	.word	.L13
	.word	.L64
	.word	.L64
	.word	.L46
	.word	.L13
	.word	.L12
	.word	.L12
	.word	.L12
	.word	.L46
	.text
.L6:
	addi	s4,s4,-255
	bnez	s3,.L66
	li	a4,2
	j	.L8
.L13:
	mv	s5,s3
	mv	s7,s2
	mv	s6,a4
.L12:
	li	a5,1
	beq	s6,a5,.L21
	beqz	s6,.L22
	li	a5,2
	beq	s6,a5,.L23
	li	a5,3
	bne	s6,a5,.L22
.L46:
	li	s1,0
	li	a5,255
	li	a3,4194304
.L15:
	lw	ra,60(sp)
	lw	s0,56(sp)
	slli	a0,a5,23
	slli	s1,s1,31
	or	a0,a0,a3
	lw	s2,48(sp)
	lw	s3,44(sp)
	lw	s4,40(sp)
	lw	s5,36(sp)
	lw	s6,32(sp)
	lw	s7,28(sp)
	or	a0,a0,s1
	lw	s1,52(sp)
	addi	sp,sp,64
	jr	ra
.L23:
	mv	s1,s7
.L64:
	li	a5,255
	li	a3,0
	j	.L15
.L5:
	bnez	s3,.L67
	li	a4,1
.L8:
	or	s0,s0,a4
	lui	a5,%hi(.L30)
	addi	a5,a5,%lo(.L30)
	slli	s0,s0,2
	add	s0,s0,a5
	lw	a5,0(s0)
	xor	s1,s1,s2
	jr	a5
	.section	.rodata
	.align	2
	.align	2
.L30:
	.word	.L64
	.word	.L64
	.word	.L32
	.word	.L31
	.word	.L32
	.word	.L46
	.word	.L32
	.word	.L31
	.word	.L64
	.word	.L64
	.word	.L46
	.word	.L31
	.word	.L12
	.word	.L12
	.word	.L12
	.word	.L46
	.text
.L2:
	bnez	s5,.L68
	li	s0,4
	li	s4,0
	li	s6,1
	j	.L4
.L3:
	bnez	s5,.L34
	li	s0,8
	li	s4,255
	li	s6,2
	j	.L4
.L34:
	li	s0,12
	li	s4,255
	li	s6,3
	j	.L4
.L68:
	mv	a0,s5
	sw	a1,12(sp)
	call	__clzsi2
	addi	a5,a0,-5
	sll	s5,s5,a5
	li	a5,-118
	lw	a1,12(sp)
	sub	s4,a5,a0
	li	s0,0
	li	s6,0
	j	.L4
.L67:
	mv	a0,s3
	call	__clzsi2
	addi	a4,a0,-5
	add	a5,s4,a0
	sll	s3,s3,a4
	addi	s4,a5,118
	li	a4,0
	j	.L7
.L66:
	li	a4,3
	j	.L7
.L32:
	li	a5,0
	li	a3,0
	j	.L15
.L22:
	mv	s1,s7
.L20:
	addi	a4,s4,127
	blez	a4,.L24
	andi	a5,s5,7
	beqz	a5,.L25
	andi	a5,s5,15
	li	a3,4
	beq	a5,a3,.L25
	addi	s5,s5,4
.L25:
	slli	a5,s5,4
	bgez	a5,.L26
	li	a5,-134217728
	addi	a5,a5,-1
	and	s5,s5,a5
	addi	a4,s4,128
.L26:
	li	a5,254
	bgt	a4,a5,.L64
	slli	a3,s5,6
	srli	a3,a3,9
	andi	a5,a4,0xff
	j	.L15
.L21:
	mv	s1,s7
	li	a5,0
	li	a3,0
	j	.L15
.L31:
	mv	s7,s2
	mv	s6,a4
	li	s5,0
	j	.L12
.L24:
	li	a2,1
	sub	a2,a2,a4
	beqz	a4,.L27
	li	a4,27
	li	a5,0
	li	a3,0
	bgt	a2,a4,.L15
.L27:
	addi	a5,s4,158
	sll	a5,s5,a5
	srl	a3,s5,a2
	snez	s5,a5
	or	a3,a3,s5
	andi	a5,a3,7
	beqz	a5,.L28
	andi	a5,a3,15
	li	a4,4
	beq	a5,a4,.L28
	addi	a3,a3,4
.L28:
	slli	a5,a3,5
	bgez	a5,.L69
	li	a5,1
	li	a3,0
	j	.L15
.L9:
	li	a4,65536
	slli	a0,s3,5
	addi	a4,a4,-1
	srli	a5,a0,16
	and	a4,a0,a4
	bgeu	s5,s3,.L16
	divu	a1,s5,a5
	addi	s4,s4,-1
	mv	a2,s5
	li	a3,0
	mul	a6,a4,a1
.L17:
	remu	a2,a2,a5
	slli	a2,a2,16
	or	a3,a2,a3
	bgeu	a3,a6,.L18
	add	a3,a3,a0
	addi	a2,a1,-1
	bgtu	a0,a3,.L39
	bgeu	a3,a6,.L39
	addi	a1,a1,-2
	add	a3,a3,a0
.L18:
	sub	a3,a3,a6
	divu	s5,a3,a5
	remu	a3,a3,a5
	mul	a5,s5,a4
	slli	a4,a3,16
	bgeu	a4,a5,.L19
	add	a4,a4,a0
	addi	a3,s5,-1
	bgtu	a0,a4,.L41
	bleu	a5,a4,.L41
	addi	s5,s5,-2
	add	a4,a4,a0
.L19:
	slli	a3,a1,16
	sub	a4,a4,a5
	or	a3,a3,s5
	snez	a4,a4
	or	s5,a3,a4
	j	.L20
.L16:
	srli	a2,s5,1
	divu	a1,a2,a5
	slli	a3,s5,31
	srli	a3,a3,16
	mul	a6,a4,a1
	j	.L17
.L41:
	mv	s5,a3
	j	.L19
.L39:
	mv	a1,a2
	j	.L18
.L69:
	slli	a3,a3,6
	srli	a3,a3,9
	li	a5,0
	j	.L15
	.size	__divsf3, .-__divsf3
	.ident	"GCC: () 9.3.0"
