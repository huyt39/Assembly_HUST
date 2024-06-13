.text
#abs
li $s0, -5
start:
slt $t0, $s0, $zero
bne $t0, $zero, else
j endif
else:
sub $s1, $zero, $s0
endif: