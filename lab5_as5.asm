.data 
a: .asciiz "nhap chuoi:"
b: .asciiz "chuoi dao:"
c: .space 100
d: .space 100
.text
li $s4, 19
li $s0, 0

la $a1, c
la $a2, d

input_loop:
li $v0, 12
syscall
beq $v0, 10, end_input
add $t1, $s0, $a1
sb $v0, 0($t1)
addi $s0, $s0, 1
bgt $s0, $s4, end_input
j input_loop
end_input:
strcpy:
addi $s0, $s0, -1
add $s1, $zero, $zero
addi $s4, $zero, -1
loop1:
beq $s0, $s4, end1
add $t1, $s0, $a1
lb $t2, 0($t1)
add $t3, $s1, $a2
sb $t2, 0($t3)
addi $s0, $s0, -1
addi $s1, $s1, 1
j loop1
end1:
li $v0, 59
la $a0, b
la $a1, d
syscall