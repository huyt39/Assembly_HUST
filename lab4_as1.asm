.text
start:
li $s1 0x7FFFFFFF
li $s2 3

li $t0 0 #No overflow is default status
addu $s3, $s1, $s2 #s3=s1+s2
xor $t1, $s1, $s2 #test if $s1 and $s2 have the same sign

bltz $t1, EXIT #if not, exit
slt $t2, $s3, $s1
bltz $s1, NEGATIVE #test if $s1 and $s2 is negative
beq $t2, $zero, EXIT #$s1 and $s2 are positive
#if $s3>$s1 then the result is not overflow
j OVERFLOW

NEGATIVE:
bne $t2, $zero, EXIT #$s1 and $s2 are negative
#if $s3<$s1 then the result is not overflow

OVERFLOW:
li $t0, 1 #the result is overflow
EXIT: 


