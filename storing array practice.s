.data

test: .word 

prompt: 
    .asciiz "Put a value for a: "

.text
    main:
        li $v0, 4
        la $a0, prompt
        syscall
        li $v0, 5 #read value
        syscall
        sw $v0, test
        lw $a0, test
        
        li $v0, 1
        syscall
        
   jr $ra