.eqv SEVENSEG_LEFT 0xFFFF0011 # Dia chi cua den led 7 doan trai.

 # Bit 0 = doan a; 

 # Bit 1 = doan b; ... 

# Bit 7 = dau .

.data 

a: .byte 0x3f, 0x06, 0x5b, 0x4f, 0x66, 0x6d, 0x7d, 0x07, 0x7f ,0x6f

.text

la $t1, a

li $s1, 0

main:

loop:

 beq $s1,10,loop1

 lb $a0,($t1)

 j SHOW_7SEG_LEFT 

 nop

 

SHOW_7SEG_LEFT: 

 li $t0, SEVENSEG_LEFT 

 sb $a0, 0($t0) 

 nop

 addi $s1,$s1,1

 addi $t1,$t1,1

 li $v0,32

 li $a0,1000

 syscall

 j loop

 

loop1:

 li $s1,0

 la $t1,a

 j loop

