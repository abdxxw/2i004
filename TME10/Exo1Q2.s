.data 
ch1:	.asciiz "machaineprems"
ch2:	.asciiz "deuxiemechaine"

.text

lui $3, 0x1001			#$3 = @ch1

addiu $29,$29,-4		#allouer memoire
sw $3,0($29)			#empiler
jal f					#appel a f
addiu $29,$29,4		#depiler
ori $4,$3,0
ori $2,$0,4 #printf ch
syscall



ori $2,$0,11
ori $4,$0, 0x0A  #affichage \n
syscall

addi $3,$3,14		# $3 = @ ch2
addiu $29,$29,-4		#allouer memoire
sw $3,0($29)			#empiler
jal f					#appel a f
addiu $29,$29,4		#depiler

ori $4,$3,0
ori $2,$0,4 #printf ch
syscall

ori $2,$0,10		# return 0
syscall




f:
addiu $29,$29,-12		#allouer memoire
sw $31,8($29)			#empiler
sw $3,4($29)
sw $5,0($29)

lw $6,12($29)		#recuperer la chaine de caractere 

while:
lb $5,0($6)
beq $5,$0, endwhile		#saut si ch[i] = 0
addi $5,$5,-0x20		# ch[i] - 0x20
sb $5,0($6) 			# ch[i] = ch[i] - 0x20
addi $6,$6,1		#i++
j while
endwhile:

lw $31,8($29)			#depiler et restore contexte
lw $3,4($29)
lw $5,0($29)

jr $31			#retour a l adresse suivant de l appel


