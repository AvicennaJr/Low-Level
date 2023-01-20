# playing with different Registers

.section .text
.globl _start
_start:
	movq $3, %rbp
	movq %rbp, %rbx
	movq $10, %rax
	mulq %rbp
	addq $1, %rax
	movq %rax, %rdi
	movq $60, %rax
	syscall
