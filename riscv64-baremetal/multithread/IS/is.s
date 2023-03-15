	.file	"is.c"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	thread_start
	.type	thread_start, @function
thread_start:
 #APP
# 37 "../threading.c" 1
	csrr a4, 0xDC1
# 0 "" 2
 #NO_APP
	lui	a5,%hi(_thread_mem_size)
	addi	a3,a5,%lo(_thread_mem_size)
	addi	a4,a4,1
	mul	a4,a4,a3
	lui	a5,%hi(_ram_start)
	addi	a5,a5,%lo(_ram_start)
	add	a5,a4,a5
 #APP
# 43 "../threading.c" 1
	add sp,zero, a5
# 0 "" 2
 #NO_APP
	sub	a5,a5,a3
 #APP
# 44 "../threading.c" 1
	add tp,zero, a5
# 0 "" 2
# 45 "../threading.c" 1
	addi sp,sp,-4
# 0 "" 2
# 46 "../threading.c" 1
	jal main
# 0 "" 2
 #NO_APP
	ret
	.size	thread_start, .-thread_start
	.align	2
	.globl	get_current_thread_id
	.type	get_current_thread_id, @function
get_current_thread_id:
 #APP
# 37 "../threading.c" 1
	csrr a0, 0xDC1
# 0 "" 2
 #NO_APP
	ret
	.size	get_current_thread_id, .-get_current_thread_id
	.align	2
	.globl	update_table
	.type	update_table, @function
update_table:
 #APP
# 52 "../threading.c" 1
	csrw 0x9C0, a0
# 0 "" 2
# 53 "../threading.c" 1
	csrw 0x9C1, a1
# 0 "" 2
# 54 "../threading.c" 1
	csrw 0x9C2, a2
# 0 "" 2
 #NO_APP
	ret
	.size	update_table, .-update_table
	.align	2
	.globl	spawn_thread
	.type	spawn_thread, @function
spawn_thread:
.L6:
 #APP
# 60 "../threading.c" 1
	csrr a5, 0xBC0
# 0 "" 2
 #NO_APP
	beqz	a5,.L6
 #APP
# 52 "../threading.c" 1
	csrw 0x9C0, a0
# 0 "" 2
 #NO_APP
	lui	a5,%hi(thread_start)
	addi	a5,a5,%lo(thread_start)
 #APP
# 53 "../threading.c" 1
	csrw 0x9C1, a5
# 0 "" 2
# 54 "../threading.c" 1
	csrw 0x9C2, 2
# 0 "" 2
# 52 "../threading.c" 1
	csrw 0x9C0, a0
# 0 "" 2
# 53 "../threading.c" 1
	csrw 0x9C1, a2
# 0 "" 2
# 54 "../threading.c" 1
	csrw 0x9C2, 6
# 0 "" 2
# 52 "../threading.c" 1
	csrw 0x9C0, a0
# 0 "" 2
# 53 "../threading.c" 1
	csrw 0x9C1, 1
# 0 "" 2
# 54 "../threading.c" 1
	csrw 0x9C2, 4
# 0 "" 2
# 68 "../threading.c" 1
	csrr a5, 0xBC0
# 0 "" 2
 #NO_APP
	ret
	.size	spawn_thread, .-spawn_thread
	.align	2
	.globl	yield
	.type	yield, @function
yield:
.L10:
 #APP
# 73 "../threading.c" 1
	csrr a5, 0xBC0
# 0 "" 2
 #NO_APP
	beqz	a5,.L10
 #APP
# 37 "../threading.c" 1
	csrr a0, 0xDC1
# 0 "" 2
# 52 "../threading.c" 1
	csrw 0x9C0, a0
# 0 "" 2
# 53 "../threading.c" 1
	csrw 0x9C1, 3
# 0 "" 2
# 54 "../threading.c" 1
	csrw 0x9C2, 4
# 0 "" 2
# 78 "../threading.c" 1
	csrr a5, 0xBC0
# 0 "" 2
 #NO_APP
	ret
	.size	yield, .-yield
	.align	2
	.globl	exit_thread
	.type	exit_thread, @function
exit_thread:
.L14:
 #APP
# 84 "../threading.c" 1
	csrr a5, 0xBC0
# 0 "" 2
 #NO_APP
	beqz	a5,.L14
 #APP
# 37 "../threading.c" 1
	csrr a5, 0xDC1
# 0 "" 2
# 52 "../threading.c" 1
	csrw 0x9C0, a5
# 0 "" 2
# 53 "../threading.c" 1
	csrw 0x9C1, 0
# 0 "" 2
# 54 "../threading.c" 1
	csrw 0x9C2, 4
# 0 "" 2
# 89 "../threading.c" 1
	csrr a5, 0xBC0
# 0 "" 2
 #NO_APP
	ret
	.size	exit_thread, .-exit_thread
	.align	2
	.globl	join
	.type	join, @function
join:
.L19:
 #APP
# 98 "../threading.c" 1
	csrw 0x9C3, 1
# 0 "" 2
 #NO_APP
.L18:
 #APP
# 100 "../threading.c" 1
	csrr a5, 0xBC0
# 0 "" 2
 #NO_APP
	beqz	a5,.L18
 #APP
# 52 "../threading.c" 1
	csrw 0x9C0, a0
# 0 "" 2
# 53 "../threading.c" 1
	csrw 0x9C1, 0
# 0 "" 2
# 54 "../threading.c" 1
	csrw 0x9C2, 3
# 0 "" 2
# 104 "../threading.c" 1
	csrr a5, 0xDC0
# 0 "" 2
# 106 "../threading.c" 1
	csrr a4, 0xBC0
# 0 "" 2
# 107 "../threading.c" 1
	csrw 0x9C3, 1
# 0 "" 2
 #NO_APP
	bnez	a5,.L19
	li	a0,0
	ret
	.size	join, .-join
	.globl	__muldf3
	.globl	__adddf3
	.globl	__fixdfsi
	.globl	__floatsidf
	.globl	__subdf3
	.align	2
	.globl	randlc
	.type	randlc, @function
randlc:
	addi	sp,sp,-96
	sw	s8,56(sp)
	lui	s8,%hi(KS.1557)
	lw	a5,%lo(KS.1557)(s8)
	sw	ra,92(sp)
	sw	s0,88(sp)
	sw	s1,84(sp)
	sw	s2,80(sp)
	sw	s3,76(sp)
	sw	s4,72(sp)
	sw	s5,68(sp)
	sw	s6,64(sp)
	sw	s7,60(sp)
	sw	s9,52(sp)
	sw	s10,48(sp)
	sw	s11,44(sp)
	sw	a0,8(sp)
	sw	a1,12(sp)
	beqz	a5,.L27
	lui	a2,%hi(R23.1558)
	lui	a3,%hi(T23.1560)
	lui	a4,%hi(R46.1559)
	lui	a5,%hi(T46.1561)
	lw	s4,%lo(R23.1558)(a2)
	lw	s3,%lo(R23.1558+4)(a2)
	lw	s2,%lo(T23.1560)(a3)
	lw	s1,%lo(T23.1560+4)(a3)
	lw	s10,%lo(R46.1559)(a4)
	lw	s0,%lo(R46.1559+4)(a4)
	lw	s9,%lo(T46.1561)(a5)
	lw	s5,%lo(T46.1561+4)(a5)
.L25:
	lw	a5,12(sp)
	mv	a2,s4
	mv	a3,s3
	lw	s6,0(a5)
	lw	s7,4(a5)
	mv	a0,s6
	mv	a1,s7
	call	__muldf3
	call	__fixdfsi
	call	__floatsidf
	mv	a2,s2
	mv	a3,s1
	mv	s11,a1
	sw	a0,28(sp)
	call	__muldf3
	mv	a2,a0
	mv	a3,a1
	mv	a0,s6
	mv	a1,s7
	call	__subdf3
	lw	a5,8(sp)
	mv	a2,s4
	mv	a3,s3
	lw	t3,0(a5)
	lw	t4,4(a5)
	mv	s8,a0
	mv	s6,a1
	mv	a0,t3
	mv	a1,t4
	sw	t3,16(sp)
	sw	t4,20(sp)
	call	__muldf3
	call	__fixdfsi
	call	__floatsidf
	mv	a2,s2
	mv	a3,s1
	sw	a0,24(sp)
	sw	a1,12(sp)
	call	__muldf3
	lw	t3,16(sp)
	lw	t4,20(sp)
	mv	a2,a0
	mv	a3,a1
	mv	a0,t3
	mv	a1,t4
	call	__subdf3
	lw	a6,28(sp)
	mv	a5,a0
	mv	s7,a1
	mv	a2,a5
	mv	a3,s7
	mv	a0,a6
	mv	a1,s11
	sw	a5,16(sp)
	call	__muldf3
	lw	a7,12(sp)
	lw	t1,24(sp)
	mv	a6,a0
	mv	a3,a7
	mv	a2,t1
	mv	s11,a1
	mv	a0,s8
	mv	a1,s6
	sw	a6,12(sp)
	call	__muldf3
	lw	a6,12(sp)
	mv	a2,a0
	mv	a3,a1
	mv	a0,a6
	mv	a1,s11
	call	__adddf3
	mv	a2,s4
	mv	a3,s3
	mv	s4,a0
	mv	s3,a1
	call	__muldf3
	call	__fixdfsi
	call	__floatsidf
	mv	a2,s2
	mv	a3,s1
	call	__muldf3
	mv	a2,a0
	mv	a3,a1
	mv	a0,s4
	mv	a1,s3
	call	__subdf3
	mv	a2,s2
	mv	a3,s1
	call	__muldf3
	lw	a5,16(sp)
	mv	s2,a0
	mv	s1,a1
	mv	a2,a5
	mv	a3,s7
	mv	a0,s8
	mv	a1,s6
	call	__muldf3
	mv	a2,a0
	mv	a3,a1
	mv	a0,s2
	mv	a1,s1
	call	__adddf3
	mv	a2,s10
	mv	a3,s0
	mv	s2,a0
	mv	s1,a1
	call	__muldf3
	call	__fixdfsi
	call	__floatsidf
	mv	a2,s9
	mv	a3,s5
	call	__muldf3
	mv	a2,a0
	mv	a3,a1
	mv	a0,s2
	mv	a1,s1
	call	__subdf3
	lw	a6,8(sp)
	mv	a2,s10
	mv	a3,s0
	sw	a0,0(a6)
	sw	a1,4(a6)
	call	__muldf3
	lw	ra,92(sp)
	lw	s0,88(sp)
	lw	s1,84(sp)
	lw	s2,80(sp)
	lw	s3,76(sp)
	lw	s4,72(sp)
	lw	s5,68(sp)
	lw	s6,64(sp)
	lw	s7,60(sp)
	lw	s8,56(sp)
	lw	s9,52(sp)
	lw	s10,48(sp)
	lw	s11,44(sp)
	addi	sp,sp,96
	jr	ra
.L27:
	lui	s10,%hi(.LC0)
	lui	s0,%hi(.LC1)
	lw	s2,%lo(.LC0)(s10)
	lw	s1,%lo(.LC0+4)(s10)
	lw	s6,%lo(.LC1)(s0)
	lw	s7,%lo(.LC1+4)(s0)
	li	s11,23
	mv	s4,s2
	mv	s3,s1
.L24:
	mv	a0,s4
	mv	a1,s3
	mv	a2,s6
	mv	a3,s7
	call	__muldf3
	mv	a2,s2
	mv	a3,s1
	mv	s4,a0
	mv	s3,a1
	mv	a0,s2
	mv	a1,s1
	call	__adddf3
	addi	s11,s11,-1
	mv	s2,a0
	mv	s1,a1
	bnez	s11,.L24
	lw	s5,%lo(.LC0+4)(s10)
	lw	s9,%lo(.LC0)(s10)
	lui	a6,%hi(R23.1558)
	lui	a1,%hi(T23.1560)
	lw	s6,%lo(.LC1)(s0)
	lw	s7,%lo(.LC1+4)(s0)
	sw	s4,%lo(R23.1558)(a6)
	sw	s3,%lo(R23.1558+4)(a6)
	sw	s2,%lo(T23.1560)(a1)
	sw	s1,%lo(T23.1560+4)(a1)
	li	s11,46
	mv	s10,s9
	mv	s0,s5
.L26:
	mv	a0,s10
	mv	a1,s0
	mv	a2,s6
	mv	a3,s7
	call	__muldf3
	mv	a2,s9
	mv	a3,s5
	mv	s10,a0
	mv	s0,a1
	mv	a0,s9
	mv	a1,s5
	call	__adddf3
	addi	s11,s11,-1
	mv	s9,a0
	mv	s5,a1
	bnez	s11,.L26
	lui	a6,%hi(R46.1559)
	lui	a1,%hi(T46.1561)
	li	a3,1
	sw	s10,%lo(R46.1559)(a6)
	sw	s0,%lo(R46.1559+4)(a6)
	sw	s9,%lo(T46.1561)(a1)
	sw	s5,%lo(T46.1561+4)(a1)
	sw	a3,%lo(KS.1557)(s8)
	j	.L25
	.size	randlc, .-randlc
	.align	2
	.globl	create_seq
	.type	create_seq, @function
create_seq:
	addi	sp,sp,-48
	lui	a5,%hi(.LC2)
	sw	s0,40(sp)
	sw	s2,32(sp)
	sw	s3,28(sp)
	lui	s0,%hi(key_array)
	lw	s2,%lo(.LC2)(a5)
	lw	s3,%lo(.LC2+4)(a5)
	sw	s5,20(sp)
	addi	s0,s0,%lo(key_array)
	li	s5,262144
	sw	ra,44(sp)
	sw	s1,36(sp)
	sw	s4,24(sp)
	sw	a0,8(sp)
	sw	a1,12(sp)
	sw	a2,0(sp)
	sw	a3,4(sp)
	add	s5,s0,s5
.L32:
	mv	a1,sp
	addi	a0,sp,8
	call	randlc
	mv	s4,a0
	mv	s1,a1
	addi	a0,sp,8
	mv	a1,sp
	call	randlc
	mv	a2,a0
	mv	a3,a1
	mv	a0,s4
	mv	a1,s1
	call	__adddf3
	mv	s4,a0
	mv	s1,a1
	addi	a0,sp,8
	mv	a1,sp
	call	randlc
	mv	a2,a0
	mv	a3,a1
	mv	a0,s4
	mv	a1,s1
	call	__adddf3
	mv	s4,a0
	mv	s1,a1
	addi	a0,sp,8
	mv	a1,sp
	call	randlc
	mv	a2,a0
	mv	a3,a1
	mv	a0,s4
	mv	a1,s1
	call	__adddf3
	mv	a2,s2
	mv	a3,s3
	call	__muldf3
	call	__fixdfsi
	sw	a0,0(s0)
	addi	s0,s0,4
	bne	s0,s5,.L32
	lw	ra,44(sp)
	lw	s0,40(sp)
	lw	s1,36(sp)
	lw	s2,32(sp)
	lw	s3,28(sp)
	lw	s4,24(sp)
	lw	s5,20(sp)
	addi	sp,sp,48
	jr	ra
	.size	create_seq, .-create_seq
	.align	2
	.globl	full_verify
	.type	full_verify, @function
full_verify:
	lui	a5,%hi(key_buff_ptr_global)
	lui	a2,%hi(key_buff2)
	lw	a0,%lo(key_buff_ptr_global)(a5)
	addi	a2,a2,%lo(key_buff2)
	li	a1,262144
	lui	a5,%hi(key_array)
	add	a1,a2,a1
	addi	a3,a5,%lo(key_array)
.L36:
	lw	a4,0(a2)
	addi	a2,a2,4
	slli	a4,a4,2
	add	a4,a0,a4
	lw	a5,0(a4)
	addi	a5,a5,-1
	sw	a5,0(a4)
	lw	a4,-4(a2)
	slli	a5,a5,2
	add	a5,a3,a5
	sw	a4,0(a5)
	bne	a2,a1,.L36
	li	a1,262144
	addi	a1,a1,-4
	mv	a5,a3
	add	a1,a3,a1
	li	a3,0
.L38:
	lw	a4,0(a5)
	lw	a2,4(a5)
	addi	a5,a5,4
	sgt	a4,a4,a2
	add	a3,a3,a4
	bne	a1,a5,.L38
	bnez	a3,.L35
	lui	a4,%hi(passed_verification)
	lw	a5,%lo(passed_verification)(a4)
	addi	a5,a5,1
	sw	a5,%lo(passed_verification)(a4)
.L35:
	ret
	.size	full_verify, .-full_verify
	.align	2
	.globl	rank
	.type	rank, @function
rank:
	lui	a3,%hi(key_array)
	addi	sp,sp,-32
	addi	a3,a3,%lo(key_array)
	slli	a4,a0,2
	sw	s0,28(sp)
	add	a4,a3,a4
	addi	a5,a0,10
	li	a1,4096
	sw	a0,0(a4)
	slli	a5,a5,2
	addi	a1,a1,-2048
	lui	a4,%hi(test_index_array)
	lui	a2,%hi(partial_verify_vals)
	sub	a1,a1,a0
	li	t1,-8192
	add	a5,a3,a5
	addi	a4,a4,%lo(test_index_array)
	sw	a1,0(a5)
	addi	t4,a2,%lo(partial_verify_vals)
	add	sp,sp,t1
	addi	a1,a4,20
	addi	a2,a2,%lo(partial_verify_vals)
.L43:
	lw	a5,0(a4)
	addi	a2,a2,4
	addi	a4,a4,4
	slli	a5,a5,2
	add	a5,a3,a5
	lw	a5,0(a5)
	sw	a5,-4(a2)
	bne	a4,a1,.L43
	lui	a4,%hi(key_buff1)
	addi	a5,a4,%lo(key_buff1)
	li	a7,8192
	addi	t5,a4,%lo(key_buff1)
	add	a7,a5,a7
	addi	a4,a4,%lo(key_buff1)
.L44:
	sw	zero,0(a4)
	addi	a4,a4,4
	bne	a4,a7,.L44
	addi	a1,sp,16
	li	a2,8192
	li	a4,-8192
	add	a2,a2,a1
	li	t1,8192
	add	a4,a2,a4
	add	t1,t1,a1
.L45:
	sw	zero,0(a4)
	addi	a4,a4,4
	bne	a4,t1,.L45
	li	a2,8192
	addi	a6,sp,16
	li	a4,-8192
	add	a2,a2,a6
	lui	a1,%hi(key_buff2)
	li	t3,262144
	add	a4,a2,a4
	addi	a1,a1,%lo(key_buff2)
	add	t3,a3,t3
	sw	a4,12(sp)
.L46:
	lw	a6,0(a3)
	lw	a2,12(sp)
	addi	a3,a3,4
	slli	a4,a6,2
	add	a4,a2,a4
	lw	a2,0(a4)
	sw	a6,0(a1)
	addi	a1,a1,4
	addi	a2,a2,1
	sw	a2,0(a4)
	bne	a3,t3,.L46
	lw	a4,12(sp)
	lw	a1,0(a4)
	addi	a3,a4,4
	mv	a4,a3
	mv	a2,a1
.L47:
	lw	a6,0(a4)
	addi	a4,a4,4
	add	a2,a2,a6
	sw	a2,-4(a4)
	bne	a4,t1,.L47
	lw	a4,0(a5)
	addi	a5,a5,4
	add	a4,a4,a1
	sw	a4,-4(a5)
	beq	a5,a7,.L48
.L67:
	lw	a4,0(a5)
	lw	a1,0(a3)
	addi	a5,a5,4
	addi	a3,a3,4
	add	a4,a4,a1
	sw	a4,-4(a5)
	bne	a5,a7,.L67
.L48:
	lw	a5,0(t4)
	lui	s0,%hi(passed_verification)
	li	a4,1
	lui	a6,%hi(test_rank_array)
	li	t1,65536
	lw	t0,%lo(passed_verification)(s0)
	li	t2,0
	li	t3,5
	li	t6,2
	addi	a6,a6,%lo(test_rank_array)
	addi	a7,a4,-1
	bgeu	a5,t1,.L50
.L68:
	addi	a3,a5,-1
	slli	a3,a3,2
	slli	a2,a4,2
	add	a3,t5,a3
	add	a2,a2,a6
	mv	a5,a3
	bgtu	a7,t6,.L51
	lw	a5,-4(a2)
	lw	a3,0(a3)
	add	a5,a0,a5
	bne	a3,a5,.L57
	addi	t0,t0,1
	li	t2,1
.L57:
	lw	a5,4(t4)
	addi	a4,a4,1
	addi	t4,t4,4
	addi	a7,a4,-1
	bltu	a5,t1,.L68
.L50:
	bne	a4,t3,.L57
.L53:
	beqz	t2,.L55
	sw	t0,%lo(passed_verification)(s0)
.L55:
	li	a5,10
	bne	a0,a5,.L42
	lui	a5,%hi(key_buff_ptr_global)
	sw	t5,%lo(key_buff_ptr_global)(a5)
.L42:
	li	t1,8192
	add	sp,sp,t1
	lw	s0,28(sp)
	addi	sp,sp,32
	jr	ra
.L51:
	lw	a3,-4(a2)
	lw	a2,0(a5)
	sub	a5,a3,a0
	bne	a2,a5,.L50
	addi	t0,t0,1
	li	t2,1
	bne	a4,t3,.L57
	j	.L53
	.size	rank, .-rank
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	addi	sp,sp,-16
	addi	a2,a5,20
	lui	a3,%hi(test_index_array)
	lui	a4,%hi(test_rank_array)
	sw	ra,12(sp)
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	s2,0(sp)
	addi	a3,a3,%lo(test_index_array)
	addi	a4,a4,%lo(test_rank_array)
	mv	a6,a2
.L70:
	lw	a0,0(a5)
	lw	a1,0(a2)
	addi	a5,a5,4
	sw	a0,0(a3)
	sw	a1,0(a4)
	addi	a3,a3,4
	addi	a2,a2,4
	addi	a4,a4,4
	bne	a5,a6,.L70
	lui	a5,%hi(.LC4)
	lw	a0,%lo(.LC4)(a5)
	lw	a1,%lo(.LC4+4)(a5)
	lui	a5,%hi(.LC3)
	lw	a2,%lo(.LC3)(a5)
	lw	a3,%lo(.LC3+4)(a5)
	lui	s2,%hi(passed_verification)
	li	s0,1
	call	create_seq
	li	a0,1
	call	rank
	li	s1,11
	sw	zero,%lo(passed_verification)(s2)
.L71:
	mv	a0,s0
	addi	s0,s0,1
	call	rank
	bne	s0,s1,.L71
	call	full_verify
	lw	a4,%lo(passed_verification)(s2)
	li	a5,51
	beq	a4,a5,.L72
	sw	zero,%lo(passed_verification)(s2)
.L72:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	lw	s2,0(sp)
	li	a0,0
	addi	sp,sp,16
	jr	ra
	.size	main, .-main
	.globl	C_test_rank_array
	.globl	C_test_index_array
	.globl	B_test_rank_array
	.globl	B_test_index_array
	.globl	A_test_rank_array
	.globl	A_test_index_array
	.globl	W_test_rank_array
	.globl	W_test_index_array
	.globl	S_test_rank_array
	.globl	S_test_index_array
	.comm	test_rank_array,20,4
	.comm	test_index_array,20,4
	.comm	partial_verify_vals,20,4
	.comm	key_buff2,262144,4
	.comm	key_buff1,262144,4
	.comm	key_array,262144,4
	.comm	passed_verification,4,4
	.comm	key_buff_ptr_global,4,4
	.section	.srodata.cst8,"aM",@progbits,8
	.align	3
.LC0:
	.word	0
	.word	1072693248
	.align	3
.LC1:
	.word	0
	.word	1071644672
	.align	3
.LC2:
	.word	0
	.word	1082130432
	.align	3
.LC3:
	.word	3846176768
	.word	1104294044
	.align	3
.LC4:
	.word	2701131776
	.word	1102231984
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	S_test_index_array, @object
	.size	S_test_index_array, 20
S_test_index_array:
	.word	48427
	.word	17148
	.word	23627
	.word	62548
	.word	4431
	.type	S_test_rank_array, @object
	.size	S_test_rank_array, 20
S_test_rank_array:
	.word	0
	.word	18
	.word	346
	.word	64917
	.word	65463
	.type	C_test_rank_array, @object
	.size	C_test_rank_array, 20
C_test_rank_array:
	.word	61147
	.word	882988
	.word	266290
	.word	133997595
	.word	133525895
	.type	C_test_index_array, @object
	.size	C_test_index_array, 20
C_test_index_array:
	.word	44172927
	.word	72999161
	.word	74326391
	.word	129606274
	.word	21736814
	.type	B_test_rank_array, @object
	.size	B_test_rank_array, 20
B_test_rank_array:
	.word	33422937
	.word	10244
	.word	59149
	.word	33135281
	.word	99
	.type	B_test_index_array, @object
	.size	B_test_index_array, 20
B_test_index_array:
	.word	41869
	.word	812306
	.word	5102857
	.word	18232239
	.word	26860214
	.type	A_test_rank_array, @object
	.size	A_test_rank_array, 20
A_test_rank_array:
	.word	104
	.word	17523
	.word	123928
	.word	8288932
	.word	8388264
	.type	A_test_index_array, @object
	.size	A_test_index_array, 20
A_test_index_array:
	.word	2112377
	.word	662041
	.word	5336171
	.word	3642833
	.word	4250760
	.type	W_test_rank_array, @object
	.size	W_test_rank_array, 20
W_test_rank_array:
	.word	1249
	.word	11698
	.word	1039987
	.word	1043896
	.word	1048018
	.type	W_test_index_array, @object
	.size	W_test_index_array, 20
W_test_index_array:
	.word	357773
	.word	934767
	.word	875723
	.word	898999
	.word	404505
	.section	.sbss,"aw",@nobits
	.align	3
	.type	T46.1561, @object
	.size	T46.1561, 8
T46.1561:
	.zero	8
	.type	T23.1560, @object
	.size	T23.1560, 8
T23.1560:
	.zero	8
	.type	R46.1559, @object
	.size	R46.1559, 8
R46.1559:
	.zero	8
	.type	R23.1558, @object
	.size	R23.1558, 8
R23.1558:
	.zero	8
	.type	KS.1557, @object
	.size	KS.1557, 4
KS.1557:
	.zero	4
	.ident	"GCC: () 9.3.0"
