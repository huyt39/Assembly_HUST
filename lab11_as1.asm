#------------------------------------------------------

# col 0x1 col 0x2 col 0x4 col 0x8

#

# row 0x1 0 1 2 3

# 0x11 0x21 0x41 0x81

#

# row 0x2 4 5 6 7

# 0x12 0x22 0x42 0x82

#

# row 0x4 8 9 a b

# 0x14 0x24 0x44 0x84

#

# row 0x8 c d e f

# 0x18 0x28 0x48 0x88

#

#------------------------------------------------------

# command row number of hexadecimal keyboard (bit 0 to 3)

# Eg. assign 0x1, to get key button 0,1,2,3

# assign 0x2, to get key button 4,5,6,7

# NOTE must reassign value for this address before reading,

# eventhough you only want to scan 1 row

# receive row and column of the key pressed, 0 if not key pressed

# Eg. equal 0x11, means that key button 0 pressed.

# Eg. equal 0x28, means that key button D pressed.

.data

n: .asciiz "\n" 

.text

main: 

li $t1, 0xFFFF0012

li $t2, 0xFFFF0014

li $s0, 0x10

li $t3, 0x01

li $t4, 0x02

li $t5, 0x04

li $t6, 0x08

li $t0, 0

polling: 

beq $t0, 100, exit

sb $t3, 0($t1 ) # must reassign expected row

lb $a0, 0($t2) # read scan code of key button

bne $a0, $0, print

sb $t4, 0($t1)

lb $a0, 0($t2)

bne $a0, $0, print

sb $t5, 0($t1)

lb $a0, 0($t2)

bne $a0, $0, print

sb $t6, 0($t1)

lb $a0, 0($t2)

bne $a0, $0, print

j continue



print: 

li $v0, 34 # print integer (hexa)

syscall

la $a0, n

li $v0, 4

syscall

continue: addi $a0, $t0, 1

sleep: 

li $a0, 3000 # sleep 3000ms

li $v0, 32

syscall

back_to_polling:

j polling

exit:

