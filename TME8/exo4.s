.data
V:	.word 6
tab:	.word 5,8,9,4,2,6,1,-1
.text
	xor $4,$4,$4 # nb = 0
	lui $3,0x1001
	lw $5,0($3) 	#$5 = V
boucle:
	lw $6,4($3)	#$6 = tab[i]
	addi $7,$0,-1	#$7 = -1
	beq $7,$6,end		# jump si tab[i] == -1
	slt $8,$6,$5		# 1 si tab[i] < V
	beq $8, $0,notif	# jump si tab[i]>= V
	addi $4,$4,1		#nb++
notif:
	addi $3,$3,4		#i++
	j boucle
end:
	ori $2,$0,1		#affichage nb( deja dans $4)
	syscall
	ori $2,$0,10		#return 0
	syscall
	
	
	
	
	