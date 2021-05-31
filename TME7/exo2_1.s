.data
v1: .word -1
v2: .word 0xFF
.text

lui $3, 0x1001
lw $5, 0($3) #load
lw $6 4($3)

addi $5,$5,1 #add 1
addi $6,$6,1

sw $5, 0($3) #save 
sw $6 4($3)

ori $2,$0,1 #l appel system 1 pour afficher un entier 
or $4,$0,$5 #affichage v1
syscall
or $4,$0,$6 #affichage v2
syscall
ori $2,$0,10
syscall
