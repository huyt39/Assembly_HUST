.data
text1: .asciiz "The sum of "
text2: .asciiz " and "
text3: .asciiz " is "
.text
li $s0, 3
li $s1, 9
add $s2, $s0, $s1

li $v0, 4
la $a0, text1
syscall

li $v0, 1
add $a0, $zero, $s0
syscall

li $v0, 4
la $a0, text2
syscall

li $v0, 1
add $a0, $zero, $s1
syscall

li $v0, 4
la $a0, text3
syscall

li $v0, 1
add $a0, $zero, $s2
syscall
