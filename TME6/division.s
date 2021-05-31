#Division 84/10

ori $9,$0, 84
ori $10,$0, 10

div $9,$10 #resultat dans lo , reste hi
mflo $11
mfhi $12

ori $4, $11, 0 #affichage resultat
ori $2, $0, 1
syscall

ori $4, $12, 0 #affichage reste
ori $2, $0, 1
syscall

ori $2, $0, 10
syscall