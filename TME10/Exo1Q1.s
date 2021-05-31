.data 
ch:	.asciiz "machainech"
.text

lui $3, 0x1001
ori $4,$3,0		#printf ch
ori $2,$0,4
syscall


ori $2,$0,11
ori $4,$0, 0x0A  #affichage \n
syscall

ori $4,$3,0

while:
lb $5,0($3)
beq $5,$0, endwhile		#saut si ch[i] = 0
addi $5,$5,-0x20		# ch[i] - 0x20
sb $5,0($3) 			# ch[i] = ch[i] - 0x20
addi $3,$3,1		#i++
j while
endwhile:

ori $2,$0,4 #printf ch
syscall

ori $2,$0,10		# return 0
syscall