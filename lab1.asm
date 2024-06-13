.data # Vung du lieu, chua cac khai bao bien
x:        .word    0x01020304    # bien x, khoi tao gia tri
message:  .asciiz  "Bo mon Ky thuat May tinh"
.text
   la $a0, message
   li   $v0, 4
   syscall
   addi $t1,$zero,2
   addi $t2,$zero,3
   add  $t0, $t1, $t2
# Vung lenh, chua cac lenh hop ngu
#Dua dia chi bien mesage vao thanh ghi a0 #Gan thanh ghi $v0 = 4
#Goi ham so v0, ham so 4, la ham print
     #Thanh ghi $t1 = 2
     #Thanh ghi $t2 = 3
     #Thanh ghi t- = $t1 + $t2