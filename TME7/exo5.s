.data 
tab: .word 4,23,12,3,8,1
.text


lui $3,0x1001

lw $5,12($3)     #int s = tab[3]
lw $6,16($3)    #int p = tab[4]


add $6,$6,$5   # p=p+s
addi $5,$5,1   #s = s + 1
sw $5, 0($3)   #tab[0] = s
sw $6, 4($3)   #tab[1] = p
lw $5,20($3)    # s= tab[5]
sw $5, 8($3)   #tab[2] = s

ori $2, $0 , 10
syscall