.data
A: .word 1, -2, 6, -4, 5, -7
.text
li $s1, -1
la $s2, A
li $s3, 6
li $s4, 1
li $s5  0
li $s6, 0
li $s7, 1
loop:
add $s1, $s1, $s4
add $t1, $s1, $s1
add $t1, $t1, $t1
add $t1, $t1, $s2
lw $t0, 0($t1)
start:
slt $t6, $t0, $zero
bne $t6, $zero, else
slt $t7, $t0, $s5
beq $t7, $s6, case_0
beq $t7, $s7, case_1
j default
case_0:
add $s5, $t0, $zero
case_1:
j continue
default:
continue:
j endif
else:
mul $t0, $t0, -1
slt $t7, $t0, $s5
beq $t7, $s6, case_0
beq $t7, $s7, case_1
j default
endif:
bne $s1, $s3, loop