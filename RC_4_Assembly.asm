.data
	S:	.word 15,2,9,13,5,6,11,8,4,7,14,2,5,13,1,7
	K:	.word 12,14,9,5,10,7,3,1,6,12,13,4,11,15,3,2
	kst:	.space 32
	bin:	.space 32
	size:	.word 8
	
.text
.globl main
	
	main:	
		la x1,S
		la x2,K
		li x3,0
		li x4,16
		li x5,0
	loop:
		bge x3,x4,kstt
		slli x6,x3,2
		add x7,x6,x1
		lw x8,0(x7)
		
		add x9,x6,x2
		lw x11,0(x9)
		
		add x12,x11,x8
		add x25,x5,x12
		rem x5,x25,x4
		
		add x21,x0,x8
		
		slli x13,x5,2
		add x14,x13,x1
		lw x15,0(x14)
		
		
		sw x15,0(x7)
		lw x11,0(x7)
		sw x21,0(x14)
		lw x21,0(x14)
		
		addi x3,x3,1
		j loop
		
	kstt:
		li x1,0 #i1
		li x2,0 #j2
		li x3,0 #c1
		li x4,8
		la x5,S
		li x6,7
		la x7,kst
		li x16,0 #temp
		li x19,0 #t
		
	loop1:	
		bge x3,x6,end	#loop Termination Condition
		addi x1,x1,1	#Initialising Algorithm
		add x1,x1,x0
		rem x1,x1,x4
		
		slli x8,x1,2	#Loading Address
		add x9,x8,x5	#Calculation of Address
		lw x11,0(x9)
		add x12,x2,x11
		rem x2,x12,x4
		
		slli x13,x2,2
		add x14,x13,x5
		lw x15,0(x14)
		
		mv x16,x11
		sw x15,0(x9)
		sw x16,0(x14)
		
		add x18,x15,x11
		rem x19,x18,x4
		
		slli x20,x19,2
		add x21,x20,x5
		lw x22,0(x21)
		
		sw x22,0(x7)
		addi x7,x7,4
		
		addi x3,x3,1
		
		j loop1
		
	end:		
		la x1, kst         # Load address of a
    		lw x2, size       # Load size (8 elements)
		li x3, 0          # i = 0
    		la x12, bin       # Load address of b1

	loop_b:
    		bge x3, x2, end_b  # If i >= size, end
    		li x7, 3          # Start bit extraction (3 down to 0)
    		slli x4, x3, 2    # i * 4
    		add x5, x4, x1    # Address of a[i]
    		lw x6, 0(x5)      # Load a[i]

	loop1_b:
    		blt x7, x0, next  # If x7 < 0, go to next number
    		srl x9, x6, x7    # Shift right by x7 bits
    		andi x11, x9, 1   # Extract LSB
    
    		sb x11, 0(x12)    # Store bit in b1 (use `sb` to store byte)
    		addi x12, x12, 1  # Move to next byte location

    		addi x7, x7, -1   # Decrement bit position
    		j loop1_b          # Repeat for next bit

	next:
    		addi x3, x3, 1    # i++
    		j loop_b          # Repeat for next number

	end_b:
    		la x13, bin      # Load address of bin
    		li x14, 32        # Print only 32 bits (size * 4)
    		li x15, 0         # Index counter

	loop2_b:
    		bge x15, x14, endd # If index >= 32, stop
    		add x18, x15, x13  # Address of b1[index]
    		lbu x19, 0(x18)    # Load byte value

    		mv x10, x19       # Move value for printing
    		li x17, 1         # Print integer syscall
    		ecall

    		li x10, 32        # Print space
    		li x17, 11
    		ecall

    		addi x15, x15, 1  # Increment index
    		j loop2_b           # Repeat

	endd:
    		li x10, 10        # Newline
    		li x17, 11
    		ecall
