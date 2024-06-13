.data
test: .asciiz "Ho Tuan Huy\n20225856."
.text
li $v0, 4
la $a0, test
syscall 