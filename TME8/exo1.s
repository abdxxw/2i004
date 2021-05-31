.data
.text

	ori $5,$0,1	#i=1
	xor $6,$6,$6	#somme=0

for:	slti $7, $5,11	# 1 si i<11
	beq $7,$0 ,endif	#jump si j>=11
	add $6,$6,$5	# somme = somme + i;
	addi $5,$5,1	#i++
	j for
endif:
	or $4,$0,$6	#printf somme
	ori $2,$0,1
	syscall
	ori $2,$0,10 	#return 0
	syscall

