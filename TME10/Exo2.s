.data
n : .word 2
p : .word 4

.text


lui $3,0x1001
lw $4,0($3)		# n
lw $5,4($3)		# p
ori $6,$0,6		#6

addiu $29,$29,-12		#allouer memoire
sw $4,0($29)			#empiler
sw $5,4($29)			#empiler
sw $6,8($29)			#empiler
jal moyenne			#appel a moyenne
addiu $29,$29,12		#depiler

ori $4,$2,0		# affichage
ori $2,$0,1
syscall
	
ori $2,$0,10		#exit
syscall




moyenne:

addiu $29,$29,-20		#allouer memoire
sw $31,16($29)			#empiler
sw $3,12($29)
sw $4,8($29)
sw $5,4($29)
sw $6,0($29)


lw $4,20($29)			#recuperer les parametres
lw $5,24($29)
lw $6,28($29)

ori $3,$0,3		#$3 = 3
add $2,$4,$5 		# a+b
add $2,$2,$6		#   a+b +c
	
div $2,$3			
mflo $2			#return   a+b+c / 3


lw $31,16($29)		#depiler et restoration contexte
lw $3,12($29)
lw $4,8($29)
lw $5,4($29)
lw $6,0($29)
addiu $29,$29,20


jr $31
