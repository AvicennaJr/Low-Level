.globl _start
.section .data
first_value:
	.quad 4
second_value:
	.quad 6
final_result:
	.quad 0

.section .text
_start:
	movq first_value, %rbx # load values to register
	movq second_value, %rcx

	addq %rbx, %rcx # perform computation

	movq %rcx, final_result # store result to memory
	movq $60, %rax
	movq final_result, %rdi # return value to operating system
	syscall
