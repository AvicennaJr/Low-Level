.globl _start

.section .data

numberofnumbers:
	.quad 7 # number of elements in array

arrayNumbers:
	.quad 4,3,210,38,93,200,77

.section .text
_start:
	# step 1: initialize registers
	movq numberofnumbers, %rcx # put number of elements to rcx
	movq $0, %rbx # put index of first element to rbx
	movq $0, %rdi # let rdi hold the current high value

	# step 2: if there are no numbers stop
	cmp $0, %rcx 
	je endloop

# main loop
arrayLoop:
	movq arrayNumbers(, %rbx, 8), %rax # get the next value in the array index by rbx
	cmp %rdi, %rax # if its not bigger, go to end of the loop
	jbe loopcontrol

	movq %rax, %rdi # otherwise, store this as the biggest element so far

loopcontrol:
	incq %rbx # move rbx to the next index
	loopq arrayLoop # decrement %rcx till its zero

endloop:
	movq $60, %rax
	syscall
