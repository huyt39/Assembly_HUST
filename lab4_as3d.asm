.text
#ble (branch if less or equal)
li $s1, 1
li $s2, 2
start:
slt $t0, $s2, $s1 #if s2<s1
beq $t0, $zero, else
sub $s3,$s1,$s2 #s3=s1-s2
j endif
else:
add $s3, $s1, $s2 #s3=s1+s2
endif: