.data
p: .word 3
n: .word 5
.text



lui $3,0x1001		
lw $5,0($3)		# $5 = p
lw $6,4($3)		# $6 = n
addi $29,$29,-8		
sw $5,0($29)		#passage des parametres
sw $6,4($29)
jal puissance		# puissance(p)
addi $29,$29,8		# depilage
ori $4,$2,0		# $4 = val retour

ori $2,$0,1		#affichage
syscall
ori $2,$0,10		#exit
syscall


puissance:
addi $29,$29,-28		#empilement
sw $31,24($29)
sw $5,20($29)
sw $6,16($29)
sw $7,12($29)
sw $8,8($29)
sw $9,4($29)  #res
sw $1,0($29)

lw $5,28($29)		#recupirer parametres
lw $6,32($29)	

ori $1,$0,1		# $1 = 1
beq $6,$0,then		# jump si n == 0
beq $6,$1,then2		# jump si n == 1

sra $7,$6,1		# n/2
addi $29,$29,-8		
sw $5,0($29)		#passage des parametres
sw $7,4($29)
jal puissance		# puissance(x,n/2)
addi $29,$29,8
ori $9,$2,0
andi $8,$6,0x01

beq $8,$1,then3		# jump si $8 == 1
mult $9,$9		
mflo $2			# res*res
j end2
then3:
mult $9,$9		#res*res
mflo $9
mult $9,$5		#res*res*x
mflo $2
end2:
j end
then:
ori $2,$2,1		# return 1
j end
then2:
ori $2,$5,0		#return x
end:


	
lw $31,24($29)		#restore context
lw $5,20($29)
lw $6,16($29)
lw $7,12($29)
lw $8,8($29)
lw $9,4($29)  
lw $1,0($29)

addi $29,$29,28		#depilement
jr $31