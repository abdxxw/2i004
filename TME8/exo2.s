.data
.text
	
	
	ori $4,$0,8	#a = 123
	ori $5,$0,6	#b = 245
	
	beq $4, $5, end_while 	#jump si a == b 
	slt $6,$5, $4 	# 1 si b<a
	bne $6,$0,then	#jump si b<a
	sub $5, $5, $4		#b=b-a
	j end_if
then:
	sub $4,$4,$5		#a=a-b
end_if:
end_while:
	ori $2,$0,1	#afficher a ( deja dans $4 )
	syscall
	ori $2,$0,10	#return 0
	syscall
	
	
