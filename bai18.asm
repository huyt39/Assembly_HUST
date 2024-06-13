.data
number: .asciiz "so luong phan tu: "
true: .asciiz "true"
false: .asciiz "false"
n: .word 0
a: .space 100   
b: .space 100
comp: .space 10

.text

main:
    li $v0, 4
    la $a0, number
    syscall
   
    li $v0, 5
    syscall
    move $t0, $v0     
    la $t1, a          
    li $t2, 0          
loop_a:
    beq $t2, $t0, read_b  
    li $v0, 5          
    syscall
    sw $v0, 0($t1)    
    addi $t1, $t1, 4   
    addi $t2, $t2, 1   
    j loop_a           

read_b:
    li $v0, 4
    la $a0, number
    syscall
   
    li $v0, 5
    syscall
    move $t0, $v0    

    
    bne $t0, $t2, print_false 

    la $t1, b          
    li $t2, 0         
loop_b:
    beq $t2, $t0, sort_a   
    li $v0, 5          
    syscall
    sw $v0, 0($t1)     
    addi $t1, $t1, 4   
    addi $t2, $t2, 1   
    j loop_b           

sort_a:
    la $t1, a
    li $t2, 0
    j sort_loop_a

sort_loop_a:
    addi $t2, $t2, 1
    blt $t2, $t0, loop_sort_a_end
    lw $t3, 0($t1)
    lw $t4, 4($t1)
    bgt $t3, $t4, swap_a
    addi $t1, $t1, 4
    j sort_loop_a

swap_a:
    sw $t4, 0($t1)
    sw $t3, 4($t1)
    la $t1, a
    li $t2, 0
    j sort_loop_a

loop_sort_a_end:
    la $t1, b
    li $t2, 0
    j sort_b

sort_b:
    addi $t2, $t2, 1
    blt $t2, $t0, loop_sort_b_end
    lw $t3, 0($t1)
    lw $t4, 4($t1)
    bgt $t3, $t4, swap_b
    addi $t1, $t1, 4
    j sort_b

swap_b:
    sw $t4, 0($t1)
    sw $t3, 4($t1)
    la $t1, b
    li $t2, 0
    j sort_b

loop_sort_b_end:
    la $t1, a
    la $t2, b
    li $t3, 0
    j compare

compare:
    lw $t4, 0($t1)
    lw $t5, 0($t2)
    bne $t4, $t5, set_false
    addi $t1, $t1, 4
    addi $t2, $t2, 4
    addi $t3, $t3, 1
    blt $t3, $t0, compare_end
    j set_true

compare_end:
    la $t1, true
    j print_comp

set_false:
    la $t1, false
    j print_comp

set_true:
    la $t1, true
    j print_comp

print_comp:
    la $a0, comp      
    move $a1, $t1      
    jal strcpy         

    li $v0, 4
    la $a0, comp
    syscall

    li $v0, 10
    syscall

print_false:
    la $a0, false
    li $v0, 4
    syscall

strcpy:
    lb $t0, ($a1)      
    beqz $t0, end_strcpy  
    sb $t0, ($a0)      
    addi $a0, $a0, 1   
    addi $a1, $a1, 1   
    j strcpy           

end_strcpy:
    sb $zero, ($a0)    
    jr $ra
