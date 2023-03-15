	.file	"addsf3.c"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.globl	__clzsi2
	.align	2
	.globl	__addsf3
	.type	__addsf3, @function
__addsf3:
	li	a3,8388608
	addi	sp,sp,-16
	srli	a4,a0,23
	addi	a3,a3,-1
	srli	a2,a1,23
	and	a6,a3,a0
	sw	s1,4(sp)
	and	a3,a3,a1
	andi	s1,a4,0xff
	sw	s2,0(sp)
	andi	a2,a2,0xff
	srli	s2,a0,31
	sw	ra,12(sp)
	sw	s0,8(sp)
	srli	a1,a1,31
	mv	a5,a6
	mv	a4,s1
	mv	t1,s2
	slli	t3,a6,3
	slli	a0,a3,3
	sub	a7,s1,a2
	beq	s2,a1,.L99
	blez	a7,.L22
	beqz	a2,.L100
	li	a5,255
	beq	s1,a5,.L8
	li	a5,67108864
	or	a0,a0,a5
.L26:
	li	a4,27
	li	a5,1
	bgt	a7,a4,.L27
	li	a4,32
	sub	a4,a4,a7
	sll	a4,a0,a4
	srl	a5,a0,a7
	snez	a4,a4
	or	a5,a5,a4
.L27:
	sub	a5,t3,a5
.L25:
	slli	a4,a5,5
	bgez	a4,.L19
	li	s0,67108864
	addi	s0,s0,-1
	and	s0,a5,s0
.L39:
	mv	a0,s0
	call	__clzsi2
	addi	a0,a0,-5
	sll	a5,s0,a0
	bgt	s1,a0,.L40
	sub	a4,a0,s1
	addi	s0,a4,1
	li	a4,32
	sub	a4,a4,s0
	sll	a4,a5,a4
	snez	a4,a4
	srl	a5,a5,s0
	or	a5,a5,a4
	li	s1,0
.L21:
.L41:
	andi	a4,a5,7
	beqz	a4,.L42
.L46:
	andi	a4,a5,15
	li	a3,4
	beq	a4,a3,.L42
	addi	a5,a5,4
.L42:
	slli	a4,a5,5
	bgez	a4,.L43
	addi	a4,s1,1
	li	a3,255
	mv	t1,s2
	beq	a4,a3,.L20
	slli	a5,a5,6
	srli	a5,a5,9
	andi	a4,a4,0xff
.L18:
	lw	ra,12(sp)
	lw	s0,8(sp)
	slli	a0,a4,23
	or	a5,a0,a5
	slli	a0,t1,31
	lw	s1,4(sp)
	lw	s2,0(sp)
	or	a0,a5,a0
	addi	sp,sp,16
	jr	ra
.L22:
	beqz	a7,.L28
	sub	a6,a2,s1
	bnez	s1,.L29
	beqz	t3,.L56
	addi	a6,a6,-1
	beqz	a6,.L101
	li	a5,255
	bne	a2,a5,.L31
.L58:
	mv	s2,a1
.L96:
	mv	a6,a3
.L8:
	beqz	a6,.L102
.L64:
	li	t1,0
	li	a4,255
	li	a5,4194304
	j	.L18
.L99:
	blez	a7,.L3
	beqz	a2,.L103
	li	a5,255
	beq	s1,a5,.L8
	li	a5,67108864
	or	a0,a0,a5
.L9:
	li	a4,27
	li	a5,1
	bgt	a7,a4,.L10
	li	a4,32
	sub	a4,a4,a7
	sll	a4,a0,a4
	srl	a5,a0,a7
	snez	a4,a4
	or	a5,a5,a4
.L10:
	add	a5,a5,t3
.L7:
	slli	a4,a5,5
	bgez	a4,.L19
	addi	s1,s1,1
	li	a4,255
	beq	s1,a4,.L20
	li	a3,2113929216
	srli	a4,a5,1
	addi	a3,a3,-1
	andi	a5,a5,1
	and	a4,a4,a3
	or	a5,a4,a5
	j	.L41
.L100:
	beqz	a0,.L45
	addi	a7,a7,-1
	sub	a5,t3,a0
	beqz	a7,.L25
	li	a5,255
	bne	s1,a5,.L26
	j	.L8
.L28:
	addi	a2,s1,1
	andi	a2,a2,254
	bnez	a2,.L33
	bnez	s1,.L34
	beqz	t3,.L104
	beqz	a0,.L18
	sub	a5,t3,a0
	slli	a3,a5,5
	bgez	a3,.L36
	sub	a5,a0,t3
	mv	s2,a1
	j	.L41
.L103:
	beqz	a0,.L45
	addi	a7,a7,-1
	add	a5,t3,a0
	beqz	a7,.L7
	li	a5,255
	bne	s1,a5,.L9
	j	.L8
.L11:
	addi	s1,s1,1
	andi	a2,s1,254
	bnez	a2,.L16
	bnez	a4,.L17
	beqz	t3,.L52
	beqz	a0,.L18
	add	a5,t3,a0
	slli	a4,a5,5
	li	s1,0
	bgez	a4,.L19
	li	a4,-67108864
	addi	a4,a4,-1
	and	a5,a5,a4
	li	s1,1
.L19:
	andi	a4,a5,7
	bnez	a4,.L46
.L43:
	srli	a6,a5,3
.L45:
	li	a5,255
	beq	s1,a5,.L8
	slli	a5,a6,9
	srli	a5,a5,9
	andi	a4,s1,0xff
	mv	t1,s2
	j	.L18
.L102:
	mv	t1,s2
.L20:
	li	a4,255
	li	a5,0
	j	.L18
.L3:
	beqz	a7,.L11
	sub	a5,a2,s1
	bnez	s1,.L12
	beqz	t3,.L48
	addi	a5,a5,-1
	beqz	a5,.L105
	li	a4,255
	beq	a2,a4,.L96
.L14:
	li	a3,27
	li	a4,1
	bgt	a5,a3,.L15
	li	a4,32
	sub	a4,a4,a5
	sll	a4,t3,a4
	srl	a5,t3,a5
	snez	a4,a4
	or	a4,a5,a4
.L15:
	add	a5,a4,a0
	mv	s1,a2
	j	.L7
.L40:
	li	a4,-67108864
	addi	a4,a4,-1
	sub	s1,s1,a0
	and	a5,a5,a4
	j	.L41
.L33:
	sub	s0,t3,a0
	slli	a5,s0,5
	bltz	a5,.L106
	bnez	s0,.L39
	li	t1,0
	li	a4,0
	li	a5,0
	j	.L18
.L29:
	li	a5,255
	beq	a2,a5,.L58
	li	a5,67108864
	or	t3,t3,a5
.L31:
	li	a4,27
	li	a5,1
	bgt	a6,a4,.L32
	li	a4,32
	sub	a4,a4,a6
	sll	a4,t3,a4
	srl	a5,t3,a6
	snez	a4,a4
	or	a5,a5,a4
.L32:
	sub	a5,a0,a5
	mv	s1,a2
	mv	s2,a1
	j	.L25
.L12:
	li	a4,255
	beq	a2,a4,.L96
	li	a4,67108864
	or	t3,t3,a4
	j	.L14
.L16:
	li	a5,255
	beq	s1,a5,.L20
	add	a5,t3,a0
	srli	a5,a5,1
	j	.L19
.L106:
	sub	s0,a0,t3
	mv	s2,a1
	j	.L39
.L56:
	mv	a6,a3
	mv	s1,a2
	mv	s2,a1
	j	.L45
.L34:
	bnez	t3,.L37
	beqz	a0,.L64
	mv	s2,a1
	j	.L96
.L17:
	beqz	t3,.L96
.L37:
	beqz	a0,.L8
	j	.L64
.L101:
	sub	a5,a0,t3
	mv	s1,a2
	mv	s2,a1
	j	.L25
.L104:
	beqz	a0,.L61
	mv	t1,a1
	mv	a5,a3
	j	.L18
.L48:
	mv	a6,a3
	mv	s1,a2
	j	.L45
.L36:
	bnez	a5,.L19
.L61:
	li	t1,0
	li	a5,0
	j	.L18
.L52:
	mv	a5,a3
	j	.L18
.L105:
	add	a5,t3,a0
	mv	s1,a2
	j	.L7
	.size	__addsf3, .-__addsf3
	.ident	"GCC: () 9.3.0"
