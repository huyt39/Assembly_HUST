#Laboratory Exercise 2, Assignment 6
.data                      # DECLARE VARIABLES
X : .word 5 # Variable X, word type, init value =
 

 
Y: .word -1
Z: .word
.text


la    $t8, X
la    $t9, Y
lw    $t1, 0($t8)
lw    $t2, 0($t9)
# Get the address of X in Data Segment
# Get the address of Y in Data Segment
# $t1 = X
# $t2 = Y
# Calcuate the expression Z = 2X + Y with registers only add $s0,$t1,$t1 #$s0=$t1+$t1=X+X=2X add $s0,$s0,$t2 #$s0=$s0+$t2=2X+Y
# Store result from register to variable Z
la $t7, Z # Get the address of Z in Data Segment sw $s0, 0($t7) # Z = $s0 = 2X + Y