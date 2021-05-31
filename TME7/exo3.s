.data 
ch: .asciiz "coucou"
.text
lui $3,0x1001

lbu $6, 0($3)  # lecture non signed d'un octet ( premier caractere )
lbu $7, 1($3) # lecture non signed d'un octet ( deuxieme caractere )
sb $6, 1($3) # ecriture  d'un octet ( deuxieme caractere ) a l adresse du premier
sb $7, 0($3) # ecriture  d'un octet ( premier caractere ) a ladresse du deuxieme


ori $2, $0, 4    #appel system pour afficher une chaine de caractere
or $4, $0, $3
syscall
ori $2,$0,10
syscall