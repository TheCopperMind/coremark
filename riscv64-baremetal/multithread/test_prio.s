	.file	"test_prio.c"
	.option nopic
	.attribute arch, "rv32i2p0_m2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.globl	start
	.type	start, @function
start:
 #APP
# 37 "threading.c" 1
	csrr a5, 0xDC1
# 0 "" 2
 #NO_APP
	addi	a5,a5,64
	slli	a5,a5,7
 #APP
# 43 "threading.c" 1
	add sp,sp, a5
# 0 "" 2
# 44 "threading.c" 1
	addi sp,sp,-4
# 0 "" 2
 #NO_APP
	addi	a5,a5,-128
 #APP
# 45 "threading.c" 1
	add tp,tp, a5
# 0 "" 2
# 46 "threading.c" 1
	jal main
# 0 "" 2
 #NO_APP
	ret
	.size	start, .-start
	.align	2
	.globl	get_current_thread_id
	.type	get_current_thread_id, @function
get_current_thread_id:
 #APP
# 37 "threading.c" 1
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
# 52 "threading.c" 1
	csrw 0x9C0, a0
# 0 "" 2
# 53 "threading.c" 1
	csrw 0x9C1, a1
# 0 "" 2
# 54 "threading.c" 1
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
# 60 "threading.c" 1
	csrr a5, 0xBC0
# 0 "" 2
 #NO_APP
	beqz	a5,.L6
 #APP
# 52 "threading.c" 1
	csrw 0x9C0, a0
# 0 "" 2
 #NO_APP
	lui	a5,%hi(start)
	addi	a5,a5,%lo(start)
 #APP
# 53 "threading.c" 1
	csrw 0x9C1, a5
# 0 "" 2
# 54 "threading.c" 1
	csrw 0x9C2, 2
# 0 "" 2
# 52 "threading.c" 1
	csrw 0x9C0, a0
# 0 "" 2
# 53 "threading.c" 1
	csrw 0x9C1, a2
# 0 "" 2
# 54 "threading.c" 1
	csrw 0x9C2, 6
# 0 "" 2
# 52 "threading.c" 1
	csrw 0x9C0, a0
# 0 "" 2
# 53 "threading.c" 1
	csrw 0x9C1, 1
# 0 "" 2
# 54 "threading.c" 1
	csrw 0x9C2, 4
# 0 "" 2
# 68 "threading.c" 1
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
# 73 "threading.c" 1
	csrr a5, 0xBC0
# 0 "" 2
 #NO_APP
	beqz	a5,.L10
 #APP
# 37 "threading.c" 1
	csrr a0, 0xDC1
# 0 "" 2
# 52 "threading.c" 1
	csrw 0x9C0, a0
# 0 "" 2
# 53 "threading.c" 1
	csrw 0x9C1, 3
# 0 "" 2
# 54 "threading.c" 1
	csrw 0x9C2, 4
# 0 "" 2
# 78 "threading.c" 1
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
# 84 "threading.c" 1
	csrr a5, 0xBC0
# 0 "" 2
 #NO_APP
	beqz	a5,.L14
 #APP
# 37 "threading.c" 1
	csrr a5, 0xDC1
# 0 "" 2
# 52 "threading.c" 1
	csrw 0x9C0, a5
# 0 "" 2
# 53 "threading.c" 1
	csrw 0x9C1, 0
# 0 "" 2
# 54 "threading.c" 1
	csrw 0x9C2, 4
# 0 "" 2
# 89 "threading.c" 1
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
# 98 "threading.c" 1
	csrw 0x9C3, 1
# 0 "" 2
 #NO_APP
.L18:
 #APP
# 100 "threading.c" 1
	csrr a5, 0xBC0
# 0 "" 2
 #NO_APP
	beqz	a5,.L18
 #APP
# 52 "threading.c" 1
	csrw 0x9C0, a0
# 0 "" 2
# 53 "threading.c" 1
	csrw 0x9C1, 0
# 0 "" 2
# 54 "threading.c" 1
	csrw 0x9C2, 3
# 0 "" 2
# 104 "threading.c" 1
	csrr a5, 0xDC0
# 0 "" 2
# 106 "threading.c" 1
	csrr a4, 0xBC0
# 0 "" 2
# 107 "threading.c" 1
	csrw 0x9C3, 1
# 0 "" 2
 #NO_APP
	bnez	a5,.L19
	li	a0,0
	ret
	.size	join, .-join
	.align	2
	.globl	do_work
	.type	do_work, @function
do_work:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
 #APP
# 37 "threading.c" 1
	csrr a5, 0xDC1
# 0 "" 2
 #NO_APP
	lui	s0,%hi(test)
.L24:
	lw	a0,%lo(test)(s0)
	call	put_ssd
	j	.L24
	.size	do_work, .-do_work
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
 #APP
# 37 "threading.c" 1
	csrr a5, 0xDC1
# 0 "" 2
 #NO_APP
	beqz	a5,.L31
	li	a0,0
	ret
.L31:
	lui	a1,%hi(main)
	addi	sp,sp,-16
	li	a2,31
	addi	a1,a1,%lo(main)
	li	a0,1
	sw	ra,12(sp)
	call	spawn_thread
	call	do_work
	.size	main, .-main
	.globl	test
	.section	.sdata,"aw"
	.align	2
	.type	test, @object
	.size	test, 4
test:
	.word	2
	.ident	"GCC: () 9.3.0"
