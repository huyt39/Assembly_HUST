.data
A: .word 3, 9, 2, 4, 3, 5
Aend: .word
.text
la $a0, A
la $a1, Aend
li $s0, 0
li $s1, -1
dem:
beq $a1, $a0, size
addi $a1, $a1, -4
addi $s0, $s0, 1
j dem
size: 
addi $t0, $s0, -1
loop1:
addi $s1, $s1, 1
li $s2, 0
beq $s1, $t0, Exit
loop2:
sub $t2, $t0, $s1
beq $s2, $t2, loop1

if_swap:
sll $t3, $s2, 2
add $s3, $a0, $t3
lw $v0, 0($s3)
addi $s3, $s3, 4
lw $v1, 0($s3)
sle $t4, $v0, $v1
beq $t4, $zero, swap
addi $s2, $s2, 1
j loop2
swap: 
sw $v0, 0($s3)
addi $s3, $s3, -4
sw $v1, 0($s3)
addi $s2, $s2, 1
j loop2
Exit:
li $v0, 10
syscall