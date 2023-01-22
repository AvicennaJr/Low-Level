.globl _start
.section .data

numberofnumbers: # number of elements we can have
	.quad 7 # we can only have 7 elements

mynumbers:
	.quad 5, 20, 33, 100, 32, 73, 1 # basically a list/array

# below will find the largest value in the list

.section .text
_start:
	# step 1: initialize registers
	movq numberofnumbers, %rcx # put number of elements in array to %rcx
	movq $mynumbers, %rbx # put the address of the first element into %rbx
	movq $0, %rdi # use %rdi to hold the current high value

	# step 2: check preconditions
	cmp $0, %rcx # if there are no numbers stop
	je endloop

# main loop
myloop:
	movq (%rbx), %rax # get the next value (currently pointed to by %rbx)
	cmp %rdi, %rax # if it is not bigger, go to the end of the loop
	jbe loopcontrol

	movq %rax, %rdi # otherwise, store it as the biggest element so far

loopcontrol:
	addq $8, %rbx # change the address in %rbx to point to the next value by adding a byte(8)
	loopq myloop # decrement %rcx and keep going until %rcx is zero

endloop: # clean up and exit
	movq $60, %rax
	syscall
