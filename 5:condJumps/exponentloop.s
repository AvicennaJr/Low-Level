.globl _start 

.section .text
_start:
	movq $2, %rbx # base value
	movq $5, %rcx # hold current exp count

	movq $1, %rax # store accumulated value

	cmpq $0, %rcx # if exponent is zero, we are done
	je complete

mainloop:
	mulq %rbx # multiply accumulated value by base
	loopq mainloop # decrement %rcx, and go back to loop if %rcx is not zero yet

complete:
	movq %rax, %rdi # move value to %rdi so we can return it
	movq $60, %rax
	syscall
