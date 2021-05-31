.data
N:	.word 3
mat1:	.word 1,1,1 ,1,1,1 ,1,1,1
mat2:	.word 1,1,1 ,1,1,1 ,1,1,1
mat3:	.space 36
.text
lui $3, 0x1001
lw $14,0($3)	#N=3
xor $5,$5,$5	#i=0

boucle1:

slt $20,$5,$14	# i<N
beq $20,$0 end1

xor $6,$6,$6	#j=0
boucle2:

slt $20,$6,$14	# j<N
beq $20,$0 end2

mult $14,$5	#i*N
mflo $7
add $7,$7,$6	#i*N+j
sll $7,$7,2	# (i*N+j)*4
add $7,$7,$3

addi $8,$7,4	#@mat1[i][j]
addi $9,$7,40	#@mat2[i][j]
addi $10,$7,76	#@mat3[i][j]

lw $8,0($8)	#$8 = mat1[i][j]
lw $9,0($9)	#$9 = mat2[i][j]
add $8,$8,$9	# mat1[i][j] + mat2[i][j]
sw $8,0($10)	# mat3[i][j] = mat1[i][j] + mat2[i][j]

ori $4,$8,0
ori $2,$0,1	#affichage la somme
syscall

ori $2,$0,11
ori $4,$0, 0x20  #affichage espace
syscall

addi $6,$6,1	#j++
j boucle2
end2:

ori $2,$0,11
ori $4,$0, 0x0A  #affichage \n
syscall

addi $5,$5,1	#i++
j boucle1
end1:

ori $2,$0,10
syscall

