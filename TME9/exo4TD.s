.data
ch2: .space 50
.text
lui $3,0x1001
ori $2, $0,8
addi $4,$3,50
ori $5,$0,50
syscall

ori $2,$0,11
ori $4,$0, 0x0A  #affichage \n
syscall


addi $4,$3,50

boucle:
lb $5,0($4)
beq $5,$0,end
sb $5,0($3)
addi $4,$4,1
addi $3,$3,1
j boucle
end:
sb $5,0($3)
ori $2,$0,4
lui $4, 0x1001
syscall
ori $2,$0,10
syscall