#Division Multiplication avec lecture des operandes appel system 5
ori $2, $0, 5
syscall
or $9,$0,$2

ori $2, $0, 5
syscall
or $10,$0,$2


div $9,$10 #resultat dans lo , reste hi
mflo $11
mfhi $12


mult $11,$10       # 10 est dans $10
mflo $13            #on est le resultat dans $13
add $13,$13,$12     # on ajoute le reste de div (4)

ori $4, $13, 0 #affichage resultat multip
ori $2, $0, 1
syscall

ori $2, $0, 10
syscall