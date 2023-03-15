	.file	"init.s"
	.option nopic
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	_start
 	.globl  _stack_top
	.globl   _thread_mem_size
	.globl   _ram_start
	.globl   _thread_start
	.type	_start, @function
	.extern global_mem_pointer

_start:
	lui   sp,%hi(_stack_start) 
	addi  sp,sp,%lo(_stack_start)
	lui   t0,%hi(_thread_mem_size) 
	addi  t0,t0,%lo(_thread_mem_size)
	sub   t0,sp,t0
	add   tp,zero,t0
	addi  sp,sp,-4
	
	lui   a4, 0
 	jal   main
 	ebreak
	

/*
;
	;
	
;;	.file	"init.s"
;;	.option nopic
;;	.text
;;	.align  1
;;	.globl  _start
;; 	.globl  _stack_top
;;	.type   _start, @function
*/
