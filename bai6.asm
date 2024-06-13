.data
array: .word -5, 4, 11, 9, 10, -11
space: .asciiz " "
Out: .asciiz "Cap phan tu lien ke co tich lon nhat la: "

.text
main:
    addi $t0, $zero, 6      #so luong phan tu
    la $t2, array           # load dia chi cua mang vao thanh ghi $t2
    
    lw $s1, 0($t2)          # load gia tri A[0] vao $s1
    lw $s2, 4($t2)          # load gia tri A[1] vao $s2
    mul $t3, $s1, $s2       # tinh A[0]*A[1] va luu vao $t
    
    addi $t2, $t2, 4        # tang i
    
    move $s4, $s1           
    move $s5, $s2           
    li $t1, 1               # luu lai t1=1
    sub $t0, $t0, 1         # giam so phan tu cua mang
    beq $t1, $t0, print     # neu mang co 2 phan tu thi nhay toi print

compare:
    lw $s1, 0($t2)          # lay gia tri cua A[i]
    lw $s2, 4($t2)          # lay gia tri cua A[i+1]
    mul $t4, $s1, $s2       # tinh A[i]*A[i+1]
    addi $t2, $t2, 4        # tang dia chi len 4 de lay gia tri phan tu tiep theo
    
    addi $t1, $t1, 1        # tang bien dem len 1
    
    slt $s3, $t3, $t4       # t3<t4 thi s3=1 
    beq $t1, $t0, print     
    beq $s3, $zero, compare # tuch moi be hon thi compare
    move $s4, $s1           # tich moi lon hon thi hoan doi max 
    move $s5, $s2
    move $t3, $t4
    j compare

print:
    # in ra màn hình
    la $a0, Out
    li $v0, 4
    syscall

    li $v0, 1
    move $a0, $s4
    syscall

    la $a0, space
    li $v0, 4
    syscall

    li $v0, 1
    move $a0, $s5
    syscall

    la $a0, space
    li $v0, 4
    syscall

    li $v0, 10             
    syscall
