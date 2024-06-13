start:
li $s1 2
li $s2 7
slt $t0, $s2, $s1
bne $t0, $zero, else
addi $t1, $t1, 1
addi $t3, $zero, 2
j endif
else: 
addi $t2, $t2, -1
add $t3, $t3, $t3
endif: