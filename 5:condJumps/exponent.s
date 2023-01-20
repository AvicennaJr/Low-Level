.globl _start

# this will calculate 2^5

.section .text
_start:
	# %rbx will hold the base
	 movq $2, %rbx

	# %rcx will hold the current exponent count
	movq $5, %rcx

	# store the accumulated value in %rax
	movq $1, %rax

mainloop:
	# adding zero will allow us to use the flags to determine if %rcx has a zero to begin with
	addq $0, %rcx

	# if the exponent is zero, we are done
	jz complete # jz will jump will jump if the previous is zero 

	# otherwise, multiply the accumulated value by our base
	mulq %rbx

	 # decrease the counter
	decq %rcx

	#Go back to the mainloop
	jmp mainloop

complete:
	# move the accumulated value to %rdi so we can return it
	movq %rax, %rdi

	# call the "exit" system call as usual
	movq $60, %rax
	syscall
