.data 
A: .word 1, 2, 3, 4, 5
.text
li $s1, -1
la $s2, A
li $s3 5
li $s4 1
li $s5 0
loop:
add $s1, $s1, $s4
add $t1, $s1, $s1
add $t1, $t1, $t1
add $t1, $t1, $s2
lw $t0, 0 ($t1)
add $s5, $s5, $t0
bne $s1, $s3, loop
# $s1: i 
# $s2: A
# $s3: n
# $s4: step
# $s5: sum
