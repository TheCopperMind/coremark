	.file	"test_join.c"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	_thread_start
	.type	_thread_start, @function
_thread_start:
 #APP
# 57 "threading.c" 1
	csrr a4, 0xDC1
# 0 "" 2
 #NO_APP
	lui	a3,%hi(_thread_mem_size)
	addi	a3,a3,%lo(_thread_mem_size)
	addi	a5,a4,1
	mul	a5,a5,a3
	lui	a2,%hi(_ram_start)
	addi	a2,a2,%lo(_ram_start)
	add	a5,a5,a2
 #APP
# 61 "threading.c" 1
	add sp,zero, a5
# 0 "" 2
 #NO_APP
	sub	a5,a5,a3
 #APP
# 62 "threading.c" 1
	add tp,zero, a5
# 0 "" 2
# 63 "threading.c" 1
	addi sp,sp,-4
# 0 "" 2
 #NO_APP
	lui	a5,%hi(.LANCHOR0)
	slli	a4,a4,2
	addi	a5,a5,%lo(.LANCHOR0)
	add	a5,a5,a4
	lw	a4,0(a5)
 #APP
# 65 "threading.c" 1
	mv a0, a4
# 0 "" 2
 #NO_APP
	lw	a5,128(a5)
 #APP
# 66 "threading.c" 1
	jalr zero, a5
# 0 "" 2
 #NO_APP
	ret
	.size	_thread_start, .-_thread_start
	.align	2
	.globl	thread_print_char
	.type	thread_print_char, @function
thread_print_char:
 #APP
# 38 "threading.c" 1
	csrw 0xBC1, a0
# 0 "" 2
 #NO_APP
	ret
	.size	thread_print_char, .-thread_print_char
	.align	2
	.globl	thread_print
	.type	thread_print, @function
thread_print:
	lbu	a5,0(a0)
	beq	a5,zero,.L4
.L6:
 #APP
# 45 "threading.c" 1
	csrw 0xBC1, a5
# 0 "" 2
 #NO_APP
	lbu	a5,1(a0)
	addi	a0,a0,1
	bne	a5,zero,.L6
.L4:
	ret
	.size	thread_print, .-thread_print
	.align	2
	.globl	get_current_thread_id
	.type	get_current_thread_id, @function
get_current_thread_id:
 #APP
# 52 "threading.c" 1
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
# 72 "threading.c" 1
	csrw 0x9C0, a0
# 0 "" 2
# 73 "threading.c" 1
	csrw 0x9C1, a1
# 0 "" 2
# 74 "threading.c" 1
	csrw 0x9C2, a2
# 0 "" 2
 #NO_APP
	ret
	.size	update_table, .-update_table
	.align	2
	.globl	spawn_thread
	.type	spawn_thread, @function
spawn_thread:
.L14:
 #APP
# 79 "threading.c" 1
	csrr a5, 0xBC0
# 0 "" 2
 #NO_APP
	beq	a5,zero,.L14
	lui	a5,%hi(.LANCHOR0)
	slli	a4,a0,2
	addi	a5,a5,%lo(.LANCHOR0)
	add	a5,a5,a4
	sw	a1,128(a5)
	sw	a3,0(a5)
 #APP
# 72 "threading.c" 1
	csrw 0x9C0, a0
# 0 "" 2
 #NO_APP
	lui	a5,%hi(_thread_start)
	addi	a5,a5,%lo(_thread_start)
 #APP
# 73 "threading.c" 1
	csrw 0x9C1, a5
# 0 "" 2
# 74 "threading.c" 1
	csrw 0x9C2, 2
# 0 "" 2
# 72 "threading.c" 1
	csrw 0x9C0, a0
# 0 "" 2
# 73 "threading.c" 1
	csrw 0x9C1, a2
# 0 "" 2
# 74 "threading.c" 1
	csrw 0x9C2, 6
# 0 "" 2
# 72 "threading.c" 1
	csrw 0x9C0, a0
# 0 "" 2
# 73 "threading.c" 1
	csrw 0x9C1, 1
# 0 "" 2
# 74 "threading.c" 1
	csrw 0x9C2, 4
# 0 "" 2
# 90 "threading.c" 1
	csrr a5, 0xBC0
# 0 "" 2
 #NO_APP
	ret
	.size	spawn_thread, .-spawn_thread
	.align	2
	.globl	yield
	.type	yield, @function
yield:
.L18:
 #APP
# 95 "threading.c" 1
	csrr a5, 0xBC0
# 0 "" 2
 #NO_APP
	beq	a5,zero,.L18
 #APP
# 52 "threading.c" 1
	csrr a0, 0xDC1
# 0 "" 2
# 72 "threading.c" 1
	csrw 0x9C0, a0
# 0 "" 2
# 73 "threading.c" 1
	csrw 0x9C1, 1
# 0 "" 2
# 74 "threading.c" 1
	csrw 0x9C2, 4
# 0 "" 2
# 100 "threading.c" 1
	csrr a5, 0xBC0
# 0 "" 2
 #NO_APP
	ret
	.size	yield, .-yield
	.align	2
	.globl	exit_thread
	.type	exit_thread, @function
exit_thread:
.L22:
 #APP
# 106 "threading.c" 1
	csrr a5, 0xBC0
# 0 "" 2
 #NO_APP
	beq	a5,zero,.L22
 #APP
# 52 "threading.c" 1
	csrr a5, 0xDC1
# 0 "" 2
# 72 "threading.c" 1
	csrw 0x9C0, a5
# 0 "" 2
# 73 "threading.c" 1
	csrw 0x9C1, 0
# 0 "" 2
# 74 "threading.c" 1
	csrw 0x9C2, 4
# 0 "" 2
# 111 "threading.c" 1
	csrr a5, 0xBC0
# 0 "" 2
 #NO_APP
	ret
	.size	exit_thread, .-exit_thread
	.align	2
	.globl	do_work
	.type	do_work, @function
do_work:
	addi	sp,sp,-16
	sw	ra,12(sp)
	call	thread_print
	lw	ra,12(sp)
	addi	sp,sp,16
	tail	exit_thread
	.size	do_work, .-do_work
	.align	2
	.globl	join_thread
	.type	join_thread, @function
join_thread:
.L29:
 #APP
# 120 "threading.c" 1
	csrw 0x9C3, 1
# 0 "" 2
 #NO_APP
.L28:
 #APP
# 122 "threading.c" 1
	csrr a5, 0xBC0
# 0 "" 2
 #NO_APP
	beq	a5,zero,.L28
 #APP
# 72 "threading.c" 1
	csrw 0x9C0, a0
# 0 "" 2
# 73 "threading.c" 1
	csrw 0x9C1, 0
# 0 "" 2
# 74 "threading.c" 1
	csrw 0x9C2, 3
# 0 "" 2
# 126 "threading.c" 1
	csrr a5, 0xDC0
# 0 "" 2
# 128 "threading.c" 1
	csrr a4, 0xBC0
# 0 "" 2
 #NO_APP
	bne	a5,zero,.L29
	li	a0,0
	ret
	.size	join_thread, .-join_thread
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"Hello, world!"
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	lui	a5,%hi(.LC0)
	addi	a5,a5,%lo(.LC0)
	lw	a2,0(a5)
	lw	a3,4(a5)
	lw	a4,8(a5)
	lhu	a5,12(a5)
	addi	sp,sp,-32
	sw	s1,20(sp)
	lui	s1,%hi(do_work)
	sw	s0,24(sp)
	sw	s2,16(sp)
	sw	ra,28(sp)
	sw	a2,0(sp)
	sw	a3,4(sp)
	sw	a4,8(sp)
	sh	a5,12(sp)
	addi	s1,s1,%lo(do_work)
	li	s0,1
	li	s2,32
.L34:
	mv	a0,s0
	mv	a3,sp
	addi	s0,s0,1
	li	a2,1
	mv	a1,s1
	call	spawn_thread
	bne	s0,s2,.L34
	mv	a0,sp
	call	do_work
.L35:
	j	.L35
	.size	main, .-main
	.globl	thread_args
	.globl	initial_pc
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	thread_args, @object
	.size	thread_args, 128
thread_args:
	.zero	128
	.type	initial_pc, @object
	.size	initial_pc, 128
initial_pc:
	.zero	128
	.ident	"GCC: (g2ee5e430018) 12.2.0"
