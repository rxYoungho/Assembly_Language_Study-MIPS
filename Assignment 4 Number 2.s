.data

A: .space 40
B: .space 40
Aprompt: .asciiz "Enter the value of A 10 times: "
Bprompt: .asciiz "Enter the value of B 10 times: "
output: .asciiz "The Output is: "
.text


    main:
        addi $t5, $t5, 0    #$t5 is counter
        la $t0, A
        la $t1, B
    loopA:
        li $v0, 4           
        la $a0, Aprompt     
        syscall             #print the message for array A
        li $v0, 5
        syscall             #read the integer from the user
        sw $v0, 0($t0)      #store the user input to Array A
        addi $t0, $t0, 4   #go to next array index (adding 4 byte)
        addi $t5, $t5, 1    #increment Counter
        bne $t5, 10, loopA  #loopA until counter is 10
        
        li $t5, 0           #$t5 is now counter for B
    loopB:    
        li $v0, 4           
        la $a0, Bprompt     
        syscall             #print the message for array B
        li $v0, 5
        syscall             #read the integer from the user
        sw $v0, 0($t1)      #stroe the user input to Array B
        addi $t1, $t1, 4   #go to next array index (adding 4 byte)
        addi $t5, $t5, 1    #increment Counter
        bne $t5, 10, loopB  #loopB until counter is 10
        
        li $t5, 0           #$t5 is now counter for C
        
    la $t0, A           #Reset the position of the pointer
    la $t1, B           #Reset the position of the pointer
    loopC:
        lw $t2, 0($t0)      #move elements in array A to a register
        addi $t0, $t0, 4    #go to next array index (adding 4 byte)
        lw $t3, 0($t1)      #move elements in array B to a register
        addi, $t1, $t1, 4   #go to next array index (adding 4 byte)
        
        mul $t6, $t2, $t3   #multiply each elements of A and B to $t6 
        add $t4, $t6, $t4   #keep adding the multiplied values to the previous C
        addi $t5, $t5, 1    #increment Counter
        bne $t5, 10, loopC  #loop C until counter is 10
    
    la $a0, output    
    li $v0, 4
    syscall

    move $a0, $t4           #move the result value to print
    li $v0, 1
    syscall
    jr $ra              # Finish
        
        
   