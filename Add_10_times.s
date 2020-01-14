.data
prompt:
	.asciiz "Please enter the value: "
result:
	.asciiz "The result is: "

.text
main:
	li $t9, 0 # initialize a variable for SUM
	li $t8, 1 # initialize a counter
	li $t7, 10 # initialize a limit to 10
	li $t6, 0 # initialize a checker if the value is a - or +
	li $t5, 1 # intialize a number 1 and 0 to compare if the magnitude
	li $t4, 0 #
repeat:
	li $v0, 4 #print string
	la $a0, prompt 
	syscall #print the asciiz
	
	li $v0, 5 # change the register $v0 to constant 5 which reads the integer that user put
	syscall # do above action

	move $t0, $v0  
	
	slt $t6, $t0, 0 #if t0 is less than 0 $t6 == 1
	
	beq $t6, $zero, pos #if t6 is 0 == t0 is positive
	

		sub $t0, $zero, $t0
	pos:
		add $t9, $t9, $t0	
		addi $t8, $t8, 1	
		ble $t8, $t7, repeat

main2: 
	li $v0, 4 # load immediate(constant 4) which means to print string
	la $a0, result #load address of result to $a0
	syscall # do above action
	li $v0, 1 #print integer
	move $a0, $t9 # move the sum to print later
	syscall
	jr $ra


	