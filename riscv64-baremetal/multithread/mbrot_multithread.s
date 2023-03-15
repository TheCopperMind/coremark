	.file	"mbrot_multithread.c"
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
	.globl	fill
	.type	fill, @function
fill:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	s2,0(sp)
	sw	ra,12(sp)
	mv	s1,a0
	li	s0,0
	li	s2,65536
.L24:
	mv	a0,s0
	mv	a1,s1
	addi	s0,s0,1
	call	putpix
	bne	s0,s2,.L24
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	lw	s2,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	fill, .-fill
	.align	2
	.globl	fill_multithread
	.type	fill_multithread, @function
fill_multithread:
	addi	sp,sp,-16
	sw	s0,8(sp)
	sw	s1,4(sp)
	slli	s0,a1,14
	li	s1,16384
	sw	ra,12(sp)
	sw	s2,0(sp)
	add	s1,s0,s1
	bgeu	s0,s1,.L27
	mv	s2,a0
.L29:
	mv	a0,s0
	mv	a1,s2
	addi	s0,s0,1
	call	putpix
	bne	s0,s1,.L29
.L27:
	lw	ra,12(sp)
	lw	s0,8(sp)
	lw	s1,4(sp)
	lw	s2,0(sp)
	addi	sp,sp,16
	jr	ra
	.size	fill_multithread, .-fill_multithread
	.globl	__subsf3
	.globl	__mulsf3
	.globl	__addsf3
	.globl	__divsf3
	.globl	__floatunsisf
	.globl	__gtsf2
	.align	2
	.globl	mbrot
	.type	mbrot, @function
mbrot:
	lui	a3,%hi(MinRe_tab)
	slli	a4,a0,2
	addi	a3,a3,%lo(MinRe_tab)
	lui	a5,%hi(MaxRe_tab)
	addi	sp,sp,-96
	add	a3,a3,a4
	addi	a5,a5,%lo(MaxRe_tab)
	add	a5,a5,a4
	sw	s11,44(sp)
	lw	s11,0(a3)
	lw	a0,0(a5)
	lui	a5,%hi(MinIm_tab)
	addi	a5,a5,%lo(MinIm_tab)
	add	a5,a5,a4
	sw	s9,52(sp)
	mv	s9,a1
	mv	a1,s11
	sw	ra,92(sp)
	sw	s0,88(sp)
	sw	s1,84(sp)
	sw	s5,68(sp)
	lw	s1,0(a5)
	sw	s6,64(sp)
	sw	s10,48(sp)
	sw	s2,80(sp)
	sw	s3,76(sp)
	sw	s4,72(sp)
	sw	s7,60(sp)
	sw	s8,56(sp)
	call	__subsf3
	lui	a5,%hi(.LC0)
	lw	a1,%lo(.LC0)(a5)
	slli	a5,s9,15
	mv	s0,a0
	sw	a5,8(sp)
	call	__mulsf3
	lui	a5,%hi(.LC1)
	lw	a1,%lo(.LC1)(a5)
	sw	zero,20(sp)
	li	s6,30
	call	__mulsf3
	mv	a1,s1
	call	__addsf3
	lui	a4,%hi(.LC2)
	lw	a1,%lo(.LC2)(a4)
	mv	a5,a0
	mv	a0,s0
	sw	a5,24(sp)
	mv	s0,a5
	call	__divsf3
	mv	s10,a0
	mv	a1,s1
	mv	a0,s0
	sw	s10,12(sp)
	call	__subsf3
	lui	a5,%hi(.LC3)
	lw	a1,%lo(.LC3)(a5)
	call	__divsf3
	lui	a5,%hi(.LC4)
	lw	s5,%lo(.LC4)(a5)
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	sw	a0,28(sp)
	sw	a5,16(sp)
.L37:
	lw	a0,20(sp)
	li	s7,0
	call	__floatunsisf
	lw	a1,28(sp)
	call	__mulsf3
	mv	a1,a0
	lw	a0,24(sp)
	call	__subsf3
	mv	s4,a0
.L36:
	mv	a0,s7
	call	__floatunsisf
	lw	a1,12(sp)
	mv	s0,s4
	li	s2,0
	call	__mulsf3
	mv	a1,s11
	call	__addsf3
	lw	a5,8(sp)
	mv	s3,a0
	mv	s9,a0
	add	s8,a5,s7
	j	.L34
.L47:
	call	__addsf3
	mv	a1,s0
	call	__mulsf3
	mv	a1,s4
	call	__addsf3
	mv	a1,s10
	mv	s0,a0
	mv	a0,s1
	call	__subsf3
	mv	a1,s3
	call	__addsf3
	addi	s2,s2,1
	mv	s9,a0
	beq	s2,s6,.L46
.L34:
	mv	a1,s9
	mv	a0,s9
	call	__mulsf3
	mv	s1,a0
	mv	a1,s0
	mv	a0,s0
	call	__mulsf3
	mv	a1,a0
	mv	s10,a0
	mv	a0,s1
	call	__addsf3
	mv	a1,s5
	call	__gtsf2
	mv	a3,a0
	mv	a1,s9
	mv	a0,s9
	blez	a3,.L47
	lw	a5,16(sp)
	slli	s2,s2,2
	mv	a0,s8
	add	s2,a5,s2
	lw	a1,0(s2)
	call	putpix
.L38:
	addi	s7,s7,1
	li	a5,256
	bne	s7,a5,.L36
	lw	a5,20(sp)
	lw	a3,8(sp)
	addi	a4,a5,1
	addi	a3,a3,256
	sw	a4,20(sp)
	li	a5,128
	sw	a3,8(sp)
	bne	a4,a5,.L37
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
	li	a0,0
	addi	sp,sp,96
	jr	ra
.L46:
	li	a1,0
	mv	a0,s8
	call	putpix
	j	.L38
	.size	mbrot, .-mbrot
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-16
	sw	ra,12(sp)
	sw	s0,8(sp)
 #APP
# 37 "threading.c" 1
	csrr s0, 0xDC1
# 0 "" 2
 #NO_APP
	beqz	s0,.L51
.L49:
	mv	a1,s0
	li	a0,0
	call	mbrot
	lw	ra,12(sp)
	lw	s0,8(sp)
	li	a0,0
	addi	sp,sp,16
	jr	ra
.L51:
	lui	a1,%hi(main)
	li	a2,0
	addi	a1,a1,%lo(main)
	li	a0,1
	call	spawn_thread
	j	.L49
	.size	main, .-main
	.globl	MinIm_tab
	.globl	MaxRe_tab
	.globl	MinRe_tab
	.globl	cmap
	.comm	py,1,1
	.comm	px,1,1
	.section	.srodata.cst4,"aM",@progbits,4
	.align	2
.LC0:
	.word	1124073472
	.align	2
.LC1:
	.word	998244352
	.align	2
.LC2:
	.word	1132396544
	.align	2
.LC3:
	.word	1123942400
	.align	2
.LC4:
	.word	1082130432
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	cmap, @object
	.size	cmap, 128
cmap:
	.word	4329246
	.word	2626574
	.word	1645063
	.word	1123075
	.word	601857
	.word	407555
	.word	280836
	.word	153605
	.word	25607
	.word	423700
	.word	821804
	.word	1219388
	.word	1618258
	.word	2670692
	.word	3789181
	.word	3791768
	.word	6284725
	.word	8843189
	.word	11335888
	.word	13891820
	.word	14867434
	.word	15843305
	.word	16027608
	.word	16277449
	.word	16461753
	.word	16711850
	.word	15007893
	.word	13369472
	.word	11665515
	.word	10027351
	.word	8454982
	.word	6947636
	.section	.srodata,"a"
	.align	2
	.type	MinIm_tab, @object
	.size	MinIm_tab, 8
MinIm_tab:
	.word	3214514586
	.word	1039159710
	.type	MaxRe_tab, @object
	.size	MaxRe_tab, 8
MaxRe_tab:
	.word	1065353216
	.word	3208818369
	.type	MinRe_tab, @object
	.size	MinRe_tab, 8
MinRe_tab:
	.word	3221225472
	.word	3209421143
	.ident	"GCC: () 9.3.0"
