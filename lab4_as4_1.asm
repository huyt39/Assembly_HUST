.text
start:
li $s1 0x234
li $s2 3

li $t0 0 #No overflow is default status
addu $s3, $s1, $s2 #s3=s1+s2
xor $t1, $s1, $s2 #test if $s1 and $s2 have the same sign

bltz $t1, EXIT #if not, exit
xor $t2, $s3, $s1
bltz $t2, OVERFLOW #$s3, $s1 doesn't have same sign

j EXIT
OVERFLOW:
li $t0, 1 #the result is overflow
EXIT: