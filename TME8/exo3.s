.data
ch:	.asciiz "abcdef"
.text
	xor $4,$4,$4 #size = 0
	lui $3, 0x1001	#$3 = ch
boucle:
	lbu $5,0($3)	#$5 = ch[i]
	beq	$5,$0, end	#jump si ch[i] = '\0'
	addi $4,$4,1	#size++
	addi $3, $3, 1 # i++
	j boucle	#retour au debut
end:
	ori $2,$0,1	#afficher size
	syscall
	ori $2,$0,10	#return 0
	syscall
	
