.data

a: .space 40 ##10 array space

prompt1: .asciiz "put i number less than 10: "
prompt2: .asciiz "put j number less than 10: " ##if j is 9, multiply by 4 = 36th array
prompt3: .asciiz "put integer for A[i]: "
prompt4: .asciiz "put integer for A[j]: "

output: .asciiz "The stored array: "

.text
    main:
        la $t0, a ## load address a to $t0
        
        li $v0, 4
        la $a0, prompt1
        syscall
        li $v0, 5
        syscall ### read integer from user
        mul $t1, $v0, 4 ## multiply 4 to i index
        
        li $v0, 4
        la $a0, prompt2
        syscall
        li $v0, 5
        syscall ### read integer from user
        mul $t2, $v0, 4 ## multiply 4 to j index
        
        li $v0, 4
        la $a0, prompt3
        syscall
        li $v0, 5
        syscall ### read integer from user
       
        add $t1, $t1, $t0 #add value of $t1 to the array -> start from index $t1 = A[$t1/4]
        sw $v0, 0($t1) ## A[i]
        
        li $v0, 4
        la $a0, prompt4
        syscall
        li $v0, 5
        syscall ### read integer from user
        
        add $t2, $t2, $t0
        sw $v0, 4($t2) ## A[j+1] #add value of $t1 to the array -> start from index $t1 = A[$t2/4 + 1]
        
        jr $ra