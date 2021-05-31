#Afficher 137

ori $16,$0, 137
or $4, $0, $16
ori $2,$0,1
syscall

ori $2, $0, 10
syscall