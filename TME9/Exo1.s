.data
ch: .space 11
.text
lui $3,0x1001
xor $5,$5,$5 # cpt =0
ori $10,$0,10
ori $2,$0,5 # scanf nb
syscall
or $6,$0,$2 # q=nb
do1:
div  $6,$10 
mflo $6 # q=q/10
addi $5,$5,1 #cpt++
bne $6,$0, do1

add $4,$3,$5
sb $0,0($4) #ch[cpt] = 0


or $6,$0,$2 # q=nb

do2:

div  $6,$10 
mfhi $7# r= q%10
mflo $6# q = q/10
addi $5,$5,-1 #cpt--
addi $7,$7, 0x30 #r = r+0x30
add $4,$3,$5
sb $7,0($4) #ch[cpt] = r
bgtz $5,do2

ori $4,$3,0
ori $2,$0,4
syscall
ori $2,$0,10
syscall
