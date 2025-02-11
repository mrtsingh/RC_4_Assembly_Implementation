.data
.text
.globl main

	main:	li x1, 0x6A09E667 #H
		li x2, 0xBB67AE85 #K
		add x3,x0,x1 #Y
		li x4, 0x12345678 #Message or X
		li x7,0
		li x17,8
		li x11,0
		li x21,4
		
	loop:	bge x7,x17,next
		srli x5,x4,7
		add x6,x5,x3
		xor x4,x6,x2
		slli x8,x3,2
		xor x3,x8,x4
		addi x7,x7,1
		j loop
		
	next:	xor x9,x3,x4
		xor x1,x1,x9
	
	loop_2:	bge x11,x21,end
		slli x12,x1,2
		srli x13,x1,7
		add x14,x13,x2
		xor x1,x14,x12
		addi x11,x11,1
		j loop_2
	
	end:	mv x10,x1
		li x17,34
		ecall
		li x17,10
		ecall
		