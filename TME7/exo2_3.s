.data
.byte 0xFF
.text
lui $3,0x1001
lb $7,0($3)    #load signed
lbu $8, 0($3) #load unsigned

ori $2,$0,1 #l appel system 1 pour afficher un entier 
or $4,$0,$7 #affichage v1
syscall
or $4,$0,$8 #affichage v2
syscall
ori $2,$0,10
syscall
