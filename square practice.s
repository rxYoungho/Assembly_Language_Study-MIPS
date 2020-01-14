.data

prompt: 
	.asciiz "How many integers will you write?:"
prompt2:
	.asciiz "Put numbers:"
.text
	main:
		add $t1, 1 #counter 2
		li $v0, 4
		la $a0, prompt #prompt user iput
		syscall 
		li $v0, 5 # read integer
		syscall
		move $t0, $v0 #move the read integer to counter
	repeat:	
		li $v0, 4
		la $a0, prompt2
		syscall		
		li $v0, 5
		syscall # read integers continuously
        move $t2, $v0
        addi $t0, $t0, 1 
        ble $t1, $t0, repeat
        
   suqare:
        mul $t2, $v0, $v0
        move $a0, $t2
		li $v0, 1
		syscall
        
    jr $ra
		
		