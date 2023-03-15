	.file	"subsf3.c"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.globl	__clzsi2
	.align	2
	.globl	__subsf3
	.type	__subsf3, @function
__subsf3:
	li	a3,8388608
	addi	sp,sp,-16
	srli	a2,a1,23
	addi	a3,a3,-1
	srli	a5,a0,23
	and	a4,a3,a0
	andi	a5,a5,0xff
	and	a3,a3,a1
	andi	a7,a2,0xff
	sw	s1,4(sp)
	sw	s2,0(sp)
	srli	a0,a0,31
	sw	ra,12(sp)
	sw	s0,8(sp)
	li	a6,255
	mv	a2,a4
	mv	s2,a5
	mv	s1,a0
	slli	t1,a4,3
	srli	a1,a1,31
	slli	t3,a3,3
	sub	t4,a5,a7
	beq	a7,a6,.L101
.L2:
	xori	a1,a1,1
	beq	a0,a1,.L102
	blez	t4,.L24
	bnez	a7,.L25
	beqz	t3,.L47
	addi	t4,t4,-1
	sub	a4,t1,t3
	beqz	t4,.L27
	li	a4,255
	beq	a5,a4,.L10
.L28:
	li	a5,27
	li	a4,1
	bgt	t4,a5,.L29
	li	a5,32
	sub	a5,a5,t4
	sll	a5,t3,a5
	srl	a4,t3,t4
	snez	a5,a5
	or	a4,a4,a5
.L29:
	sub	a4,t1,a4
.L27:
	slli	a5,a4,5
	bgez	a5,.L21
	li	s0,67108864
	addi	s0,s0,-1
	and	s0,a4,s0
.L41:
	mv	a0,s0
	call	__clzsi2
	addi	a0,a0,-5
	sll	a4,s0,a0
	bgt	s2,a0,.L42
	sub	a0,a0,s2
	addi	s0,a0,1
	li	a5,32
	sub	a5,a5,s0
	sll	a5,a4,a5
	snez	a5,a5
	srl	a4,a4,s0
	or	a4,a4,a5
	li	s2,0
.L23:
.L43:
	andi	a5,a4,7
	beqz	a5,.L44
.L48:
	andi	a3,a4,15
	li	a5,4
	beq	a3,a5,.L44
	addi	a4,a4,4
.L44:
	slli	a5,a4,5
	bgez	a5,.L45
	addi	a5,s2,1
	li	a3,255
	andi	a0,s1,1
	beq	a5,a3,.L22
	slli	a4,a4,6
	srli	a4,a4,9
	andi	a5,a5,0xff
.L20:
	lw	ra,12(sp)
	lw	s0,8(sp)
	slli	a5,a5,23
	or	a4,a5,a4
	slli	a0,a0,31
	lw	s1,4(sp)
	lw	s2,0(sp)
	or	a0,a4,a0
	addi	sp,sp,16
	jr	ra
.L24:
	beqz	t4,.L30
	sub	a2,a7,a5
	bnez	a5,.L31
	beqz	t1,.L58
	addi	a2,a2,-1
	beqz	a2,.L103
	li	a5,255
	bne	a7,a5,.L33
.L60:
	mv	s1,a1
.L98:
	mv	a2,a3
.L10:
	beqz	a2,.L104
.L66:
	li	a0,0
	li	a5,255
	li	a4,4194304
	j	.L20
.L101:
	beqz	t3,.L2
	beq	a0,a1,.L5
	blez	t4,.L24
.L25:
	li	a4,255
	beq	a5,a4,.L10
	li	a5,67108864
	or	t3,t3,a5
	j	.L28
.L102:
	blez	t4,.L5
	beqz	a7,.L105
	li	a4,255
	beq	a5,a4,.L10
	li	a5,67108864
	or	t3,t3,a5
.L11:
	li	a5,27
	li	a4,1
	bgt	t4,a5,.L12
	li	a5,32
	sub	a5,a5,t4
	sll	a5,t3,a5
	srl	a4,t3,t4
	snez	a5,a5
	or	a4,a4,a5
.L12:
	add	a4,a4,t1
.L9:
	slli	a5,a4,5
	bgez	a5,.L21
	addi	s2,s2,1
	li	a5,255
	beq	s2,a5,.L22
	li	a3,2113929216
	srli	a5,a4,1
	addi	a3,a3,-1
	andi	a4,a4,1
	and	a5,a5,a3
	or	a4,a5,a4
	j	.L43
.L30:
	addi	a6,a5,1
	andi	a6,a6,254
	bnez	a6,.L35
	bnez	a5,.L36
	beqz	t1,.L106
	beqz	t3,.L20
	sub	a4,t1,t3
	slli	a3,a4,5
	bgez	a3,.L38
	sub	a4,t3,t1
	li	s2,0
	mv	s1,a1
	j	.L43
.L105:
	beqz	t3,.L47
	addi	t4,t4,-1
	add	a4,t1,t3
	beqz	t4,.L9
	li	a4,255
	bne	a5,a4,.L11
	j	.L10
.L13:
	addi	s2,a5,1
	andi	a1,s2,254
	bnez	a1,.L18
	bnez	a5,.L19
	beqz	t1,.L54
	beqz	t3,.L20
	add	a4,t1,t3
	slli	a5,a4,5
	li	s2,0
	bgez	a5,.L21
	li	a5,-67108864
	addi	a5,a5,-1
	and	a4,a4,a5
	li	s2,1
.L21:
	andi	a5,a4,7
	bnez	a5,.L48
.L45:
	srli	a2,a4,3
.L47:
	li	a5,255
	beq	s2,a5,.L10
	slli	a4,a2,9
	srli	a4,a4,9
	andi	a5,s2,0xff
	andi	a0,s1,1
	j	.L20
.L104:
	andi	a0,s1,1
.L22:
	li	a5,255
	li	a4,0
	j	.L20
.L5:
	beqz	t4,.L13
	sub	a4,a7,a5
	bnez	a5,.L14
	beqz	t1,.L50
	addi	a4,a4,-1
	beqz	a4,.L107
	li	a5,255
	beq	a7,a5,.L98
.L16:
	li	a3,27
	li	a5,1
	bgt	a4,a3,.L17
	li	a5,32
	sub	a5,a5,a4
	sll	a5,t1,a5
	srl	a4,t1,a4
	snez	a5,a5
	or	a5,a4,a5
.L17:
	add	a4,a5,t3
	mv	s2,a7
	j	.L9
.L42:
	li	a5,-67108864
	addi	a5,a5,-1
	sub	s2,s2,a0
	and	a4,a4,a5
	j	.L43
.L35:
	sub	s0,t1,t3
	slli	a5,s0,5
	bltz	a5,.L108
	bnez	s0,.L41
	li	a0,0
	li	a5,0
	li	a4,0
	j	.L20
.L31:
	li	a5,255
	beq	a7,a5,.L60
	li	a5,67108864
	or	t1,t1,a5
.L33:
	li	a5,27
	li	a4,1
	bgt	a2,a5,.L34
	li	a5,32
	sub	a5,a5,a2
	sll	a5,t1,a5
	srl	a4,t1,a2
	snez	a5,a5
	or	a4,a4,a5
.L34:
	sub	a4,t3,a4
	mv	s2,a7
	mv	s1,a1
	j	.L27
.L14:
	li	a5,255
	beq	a7,a5,.L98
	li	a5,67108864
	or	t1,t1,a5
	j	.L16
.L18:
	li	a5,255
	beq	s2,a5,.L22
	add	a4,t1,t3
	srli	a4,a4,1
	j	.L21
.L108:
	sub	s0,t3,t1
	mv	s1,a1
	j	.L41
.L58:
	mv	a2,a3
	mv	s2,a7
	mv	s1,a1
	j	.L47
.L36:
	bnez	t1,.L39
	beqz	t3,.L66
	mv	s1,a1
	j	.L98
.L19:
	beqz	t1,.L98
.L39:
	beqz	t3,.L10
	j	.L66
.L103:
	sub	a4,t3,t1
	mv	s2,a7
	mv	s1,a1
	j	.L27
.L106:
	beqz	t3,.L63
	mv	a0,a1
	mv	a4,a3
	j	.L20
.L50:
	mv	a2,a3
	mv	s2,a7
	j	.L47
.L38:
	li	s2,0
	bnez	a4,.L21
.L63:
	li	a0,0
	li	a4,0
	j	.L20
.L54:
	mv	a4,a3
	j	.L20
.L107:
	add	a4,t1,t3
	mv	s2,a7
	j	.L9
	.size	__subsf3, .-__subsf3
	.ident	"GCC: () 9.3.0"
