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
# 108 "threading.c" 1
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
# 112 "threading.c" 1
	add sp,zero, a5
# 0 "" 2
 #NO_APP
	sub	a5,a5,a3
 #APP
# 113 "threading.c" 1
	add tp,zero, a5
# 0 "" 2
# 114 "threading.c" 1
	addi sp,sp,-4
# 0 "" 2
 #NO_APP
	lui	a5,%hi(.LANCHOR0)
	slli	a4,a4,2
	addi	a5,a5,%lo(.LANCHOR0)
	add	a5,a5,a4
	lw	a4,0(a5)
 #APP
# 116 "threading.c" 1
	mv a0, a4
# 0 "" 2
 #NO_APP
	lw	a5,128(a5)
 #APP
# 117 "threading.c" 1
	jalr ra, a5
# 0 "" 2
 #NO_APP
	lui	a5,%hi(exit_thread)
	addi	a5,a5,%lo(exit_thread)
 #APP
# 118 "threading.c" 1
	jalr ra, a5
# 0 "" 2
 #NO_APP
.L2:
	j	.L2
	.size	_thread_start, .-_thread_start
	.align	2
	.globl	thread_print_char
	.type	thread_print_char, @function
thread_print_char:
 #APP
# 39 "threading.c" 1
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
	beq	a5,zero,.L5
.L7:
 #APP
# 46 "threading.c" 1
	csrw 0xBC1, a5
# 0 "" 2
 #NO_APP
	lbu	a5,1(a0)
	addi	a0,a0,1
	bne	a5,zero,.L7
.L5:
	ret
	.size	thread_print, .-thread_print
	.align	2
	.globl	do_work
	.type	do_work, @function
do_work:
	tail	thread_print
	.size	do_work, .-do_work
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"Exiting thread"
	.text
	.align	2
	.globl	exit_thread
	.type	exit_thread, @function
exit_thread:
	addi	sp,sp,-16
	sw	ra,12(sp)
.L14:
 #APP
# 78 "threading.c" 1
	csrr a5, 0xBC0
# 0 "" 2
 #NO_APP
	beq	a5,zero,.L14
	lui	a0,%hi(.LC0)
	addi	a0,a0,%lo(.LC0)
	call	thread_print
 #APP
# 53 "threading.c" 1
	csrr a5, 0xDC1
# 0 "" 2
# 59 "threading.c" 1
	csrw 0x9C0, a5
# 0 "" 2
# 60 "threading.c" 1
	csrw 0x9C1, 0
# 0 "" 2
# 61 "threading.c" 1
	csrw 0x9C2, 4
# 0 "" 2
# 84 "threading.c" 1
	csrr a5, 0xBC0
# 0 "" 2
 #NO_APP
	lw	ra,12(sp)
	addi	sp,sp,16
	jr	ra
	.size	exit_thread, .-exit_thread
	.align	2
	.globl	get_current_thread_id
	.type	get_current_thread_id, @function
get_current_thread_id:
 #APP
# 53 "threading.c" 1
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
# 59 "threading.c" 1
	csrw 0x9C0, a0
# 0 "" 2
# 60 "threading.c" 1
	csrw 0x9C1, a1
# 0 "" 2
# 61 "threading.c" 1
	csrw 0x9C2, a2
# 0 "" 2
 #NO_APP
	ret
	.size	update_table, .-update_table
	.align	2
	.globl	yield
	.type	yield, @function
yield:
.L21:
 #APP
# 67 "threading.c" 1
	csrr a5, 0xBC0
# 0 "" 2
 #NO_APP
	beq	a5,zero,.L21
 #APP
# 53 "threading.c" 1
	csrr a0, 0xDC1
# 0 "" 2
# 59 "threading.c" 1
	csrw 0x9C0, a0
# 0 "" 2
# 60 "threading.c" 1
	csrw 0x9C1, 1
# 0 "" 2
# 61 "threading.c" 1
	csrw 0x9C2, 4
# 0 "" 2
# 72 "threading.c" 1
	csrr a5, 0xBC0
# 0 "" 2
 #NO_APP
	ret
	.size	yield, .-yield
	.align	2
	.globl	join_thread
	.type	join_thread, @function
join_thread:
.L26:
 #APP
# 92 "threading.c" 1
	csrw 0x9C3, 1
# 0 "" 2
 #NO_APP
.L25:
 #APP
# 94 "threading.c" 1
	csrr a5, 0xBC0
# 0 "" 2
 #NO_APP
	beq	a5,zero,.L25
 #APP
# 59 "threading.c" 1
	csrw 0x9C0, a0
# 0 "" 2
# 60 "threading.c" 1
	csrw 0x9C1, 0
# 0 "" 2
# 61 "threading.c" 1
	csrw 0x9C2, 3
# 0 "" 2
# 98 "threading.c" 1
	csrr a5, 0xDC0
# 0 "" 2
# 100 "threading.c" 1
	csrr a4, 0xBC0
# 0 "" 2
 #NO_APP
	bne	a5,zero,.L26
	li	a0,0
	ret
	.size	join_thread, .-join_thread
	.align	2
	.globl	spawn_thread
	.type	spawn_thread, @function
spawn_thread:
.L31:
 #APP
# 126 "threading.c" 1
	csrr a5, 0xBC0
# 0 "" 2
 #NO_APP
	beq	a5,zero,.L31
	lui	a5,%hi(.LANCHOR0)
	slli	a4,a0,2
	addi	a5,a5,%lo(.LANCHOR0)
	add	a5,a5,a4
	sw	a1,128(a5)
	sw	a3,0(a5)
 #APP
# 59 "threading.c" 1
	csrw 0x9C0, a0
# 0 "" 2
 #NO_APP
	lui	a5,%hi(_thread_start)
	addi	a5,a5,%lo(_thread_start)
 #APP
# 60 "threading.c" 1
	csrw 0x9C1, a5
# 0 "" 2
# 61 "threading.c" 1
	csrw 0x9C2, 2
# 0 "" 2
# 59 "threading.c" 1
	csrw 0x9C0, a0
# 0 "" 2
# 60 "threading.c" 1
	csrw 0x9C1, a2
# 0 "" 2
# 61 "threading.c" 1
	csrw 0x9C2, 6
# 0 "" 2
# 59 "threading.c" 1
	csrw 0x9C0, a0
# 0 "" 2
# 60 "threading.c" 1
	csrw 0x9C1, 1
# 0 "" 2
# 61 "threading.c" 1
	csrw 0x9C2, 4
# 0 "" 2
# 137 "threading.c" 1
	csrr a5, 0xBC0
# 0 "" 2
 #NO_APP
	ret
	.size	spawn_thread, .-spawn_thread
	.section	.rodata.str1.4
	.align	2
.LC1:
	.string	"Hello, world!"
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	lui	a5,%hi(.LC1)
	addi	a5,a5,%lo(.LC1)
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
.L35:
	mv	a0,s0
	mv	a3,sp
	addi	s0,s0,1
	li	a2,1
	mv	a1,s1
	call	spawn_thread
	bne	s0,s2,.L35
	li	s0,1
	li	s1,32
.L36:
	mv	a0,s0
	addi	s0,s0,1
	call	join_thread
	bne	s0,s1,.L36
	mv	a0,sp
	call	thread_print
.L37:
	j	.L37
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
