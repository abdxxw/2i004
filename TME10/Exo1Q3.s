.data 
ch1:	.asciiz "Une chaine_exemple"
ch2:	.asciiz "1 autre Test"
a: .byte 'a'
z: .byte 'z'

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

addi $3,$3,19			# $3 = @ ch2
addiu $29,$29,-4		#allouer memoire
sw $3,0($29)			#empiler
jal f					#appel a f
addiu $29,$29,4		#depiler

ori $4,$3,0
ori $2,$0,4 		#printf ch
syscall

ori $2,$0,10		# return 0
syscall




f:
addiu $29,$29,-20		#allouer memoire
sw $31,16($29)			#empiler
sw $3,12($29)
sw $5,8($29)
sw $6,4($29)
sw $7,0($29)


xor $7,$7,$7		# i=0

lw $6,20($29)		#recuperer la chaine de caractere 

while:
lb $5,0($6)
beq $5,$0, endwhile		#saut si ch[i] = 0


addiu $29,$29,-4		#allouer memoire
sw $5,0($29)			#empiler
jal min_to_maj			#appel a min_to_maj:
addiu $29,$29,4		#depiler


sb $2,0($6) 			# ch[i] = val de retour


addi $6,$6,1		#i++
j while
endwhile:

	
lw $31,16($29)			#depiler et restore contexte
lw $3,12($29)
lw $5,8($29)
lw $6,4($29)
lw $7,0($29)
addiu $29,$29,20
jr $31			#retour a l adresse suivant de l appel



min_to_maj:

addiu $29,$29,-24		#allouer memoire
sw $31,20($29)			#empiler
sw $3,16($29)
sw $4,12($29)
sw $5,8($29)
sw $6,4($29)
sw $7,0($29)


lb $6,24($29)			#recuperer le char

lui $3,0x1001
lb $4,32($3)		# a
lb $5,33($3)		# z

slt $7,$6,$4	#c<a
bne $7,$0, else
slt $7,$5,$6	#z<c
bne $7,$0, else
addi $2,$6,-0x20		# return c- 0x20
j end
else:
ori $2,$6,0			# return c
end:

lw $31,20($29)			#depiler et restore contexte
lw $3,16($29)
lw $4,12($29)
lw $5,8($29)
lw $6,4($29)		
lw $7,0($29)
addiu $29,$29,24
jr $31			#retour a l adresse suivant de l appel


