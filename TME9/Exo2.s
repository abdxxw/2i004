.data
n:		.word 5
espace:	.byte 0x20
etoile:	.byte 0x2A
image:	.space 12
		.space 12
		.space 12
		.space 12
		.space 12
fin_char:	.byte 0x00
# @ image[i][j] = (i*(2*n+2)+j )+@deb
.text

lui $3, 0x1001
lb $18,4($3) # $19 = ' '
lb $19, 5($3) # $18 = '*'
lw $10,0($3) # $10 = n = 5
xor $5,$5,$5 #i=0
addi $4,$3,6 #$4 = @image[0]




for1:
slt $21,$5,$10
beq $21, $0, endfor1 # saut si i>=n

xor $6,$6,$6 #j=0
sub $22,$10,$5# n-i

for2:
slt $21,$6,$22
beq $21, $0, endfor2 # saut si j>=n-i

sll $8,$10,1 #n*2
addi $8,$8,2 #n*2+2
mult $8,$5
mflo $8  # (n*2+2)*i
add $8,$8,$6 # (n*2+2)*i + j
add $8,$8,$4 # $8 = @image[i][j]
sb $18, 0($8) #image[i][j] = espace

sll $8,$10,1 #n*2
addi $8,$8,2 #n*2+2
mult $8,$5
mflo $8  # (n*2+2)*i
sll $9,$10,1 #n*2
sub $9, $9,$6 #n*2-j
add $9,$9,$8 # (n*2+2)*i + (n*2-j)
add $9,$9,$4 # $9 = @image[i][2*n-j]
sb $18, 0($9) #image[i][2*n-j] = espace


addi $6,$6,1 #j++
j for2
endfor2:


sub $22,$10,$5
ori $6,$22,0 #j=n-i
add $22,$10,$5
addi $22,$22,1 # n+i+1

for3:
slt $21,$6,$22
beq $21, $0, endfor3 # saut si j>=n+i+1


sll $8,$10,1 #n*2
addi $8,$8,2 #n*2+2
mult $8,$5
mflo $8  # (n*2+2)*i
add $8,$8,$6 # (n*2+2)*i + j
add $8,$8,$4 # $8 = @image[i][j]
sb $19, 0($8) #image[i][j] = etoile


addi $6,$6,1 #j++
j for3
endfor3:


sll $8,$10,1 #n*2
addi $8,$8,2 #n*2+2
mult $8,$5
mflo $8  # (n*2+2)*i
sll $9,$10,1 #n*2
addi $9, $9,1 #n*2 +1
add $9,$9,$8 # (n*2+2)*i + (n*2 +1)
add $9,$9,$4 # $8 = @image[i][n*2 +1]
ori $23,$0, 0xA
sb $23, 0($9) #image[i][2*n-j] = espace

addi $5,$5,1 #i++
j for1
endfor1:



 #########Affichage##########
ori $2,$0,4
syscall
ori $2,$0,10 #########exit###########
syscall
