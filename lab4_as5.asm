.text
addi $s0, $zero, 9
addi $s1, $zero, 512
addi $t0, $zero, 1
loop:
beq $s1, $t0, exit #neu so nhan $s1=1 thi ket thuc
sll $s0, $s0, 1 #tang gia tri $s0 len 2 lan
srl $s1, $s1, 1 #giam gia tri $s1 xuong 2 lan
j loop
exit:
 add $t3, $zero, $s0 