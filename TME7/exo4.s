.data 
.byte 0x31,0x32,0x33,0x34,0x35,0x36,0x00
.text


lui $3,0x1001

ori $2, $0, 4    #appel system pour afficher une chaine de caractere
or $4, $0, $3
syscall

ori $2,$0,11
ori $4,$0, 0x20  #affichage espace
syscall

lbu, $5,2($3)  #affichage 3 eme caractere
ori $2,$0,1
or $4,$0,$5
syscall

ori $2,$0,11
ori $4,$0, 0x20  #affichage espace
syscall

addi $5,$5,-48 # methode convert ascii to decimal
ori $2,$0,1 # affichage 
or $4,$0,$5
syscall


ori $2,$0,11
ori $4,$0, 0x20  #affichage espace
syscall

lbu, $6,3($3)  # lecture de 4 
addi $6,$6,-48 # methode convert ascii to decimal
ori $2,$0,1 # affichage 
or $4,$0,$6
syscall

ori $2,$0,10
syscall