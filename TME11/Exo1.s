.data
p: .word 5
.text



lui $3,0x1001		
lw $5,0($3)		# $5 = p
addi $29,$29,-4		
sw $5,0($29)		#passage des parametres
jal fact		# fact(p)
addi $29,$29,4		# depilage
ori $4,$2,0		# $4 = val retour

ori $2,$0,1		#affichage
syscall
ori $2,$0,10		#exit
syscall


fact:
addi $29,$29,-12		#empilement
sw $31,8($29)
sw $5,4($29)
sw $6,0($29)
lw $5,12($29)		#recupirer parametres

beq $5,$0,then		# jump si n == 0
addi $6,$5,-1		# n-1
addi $29,$29,-4		
sw $6,0($29)		#passage des parametres
jal fact		# fact(n-1)
addi $29,$29,4
mult $2,$5		# n * fact(n-1)
mflo $2
j end
then:
ori $2,$2,1
end:

lw $31,8($29)		#restore context
lw $5,4($29)
lw $6,0($29)
addi $29,$29,12		#depilement
jr $31