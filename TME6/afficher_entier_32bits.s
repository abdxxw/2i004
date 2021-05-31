#afficher entier 32bits (65537)
lui $16, 1
addi $16,$16,1

or $4, $0, $16
ori $2,$0,1
syscall


ori $2, $0, 10
syscall