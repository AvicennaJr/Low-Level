.globl _start

.section .data

elements:
	.quad 7

array:
	.quad 87, 20,12, 98, 122, 8, 69

.section .text

_start:
	movq elements, %rcx
	movq $0, %rdi

	cmp $0, %rcx #if rcx is 0 end stop
	je endloop

arrayLoop:
	movq array-8(, %rcx, 8), %rax # get the next value index by %rcx
	
	cmp %rdi, %rax # if it ain't big, end the loop
	jbe loopcontrol

	movq %rax, %rdi # otherwise give rdi the larger value

loopcontrol:
	loopq arrayLoop

endloop:
	movq $60, %rax
	syscall
