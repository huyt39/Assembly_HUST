.eqv MONITOR_SCREEN 0x10010000 #Dia chi bat dau cua bo nho man hinh

.eqv RED 0x00FF0000 #Cac gia tri mau thuong su dung

.eqv BLACK 0x00000000

.text

li $k0, MONITOR_SCREEN #Nap dia chi bat dau cua man hinh

 loop:

 li $t0, RED

 sw $t0, 0($k0)

 nop

 li $v0,32

 li $a0,1000

 syscall

 li $t0, BLACK

 sw $t0, 0($k0)

 nop

 addi $k0,$k0,4

 j loop



