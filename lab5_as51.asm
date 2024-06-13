.data 
a: .asciiz "Nhap chuoi:"
b: .asciiz "Chuoi dao:"
c: .space 100
d: .space 100
.text
li $s4, 19
li $s0, 0

la $a1, c
la $a2, d

input_loop:
    li $v0, 12      # syscall 12: read character
    syscall
    beq $v0, 10, end_input  # if newline, end input
    add $t1, $s0, $a1
    sb $v0, 0($t1)  # store character in array c
    addi $s0, $s0, 1
    bgt $s0, $s4, end_input  # check if input exceeds limit
    j input_loop

end_input:
    li $t0, 0       # t0: start index of input string
    add $t1, $s0, $a1  # t1: end index of input string
    addi $t1, $t1, -1
loop1:
    beq $t0, $s0, end1  # end loop when all characters are copied
    lb $t2, 0($t1)   # load character from end of input string
    add $t3, $t2, $zero  # copy character to t3
    add $t4, $s0, $a2  # t4: address in reversed string
    sb $t3, 0($t4)   # store character in reversed string
    addi $t0, $t0, 1  # move to next character in input string
    addi $t1, $t1, -1  # move to previous character in input string
    j loop1

end1:
    li $v0, 4        # syscall 4: print string
    la $a0, b        # load address of output string
    syscall
    li $v0, 4        # syscall 4: print string
    la $a0, d        # load address of reversed string
    syscall

    li $v0, 10       # syscall 10: exit program
    syscall
