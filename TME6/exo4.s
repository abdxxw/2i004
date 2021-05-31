.data
.text

#operations logiques
ori $3, $0, 0x00FF   #$3 = 0x00FF 
ori $4, $0, 0xFFF0   #$4 = 0xFFF0
and $5, $4, $3       #$5 = 0xF0 
xor $6, $4, $3       #$6 = 0xFF0F 
xor $6, $6, $6       #$6 = 0
# decalages
ori $4, $0, 25
sll $5, $4, 1        # $5 = 0x32
sll $6, $4, 2        # $6 = 0x64
sll $7, $4, 3        # $7 = 0xC8
srl $5, $4, 1        # $5 = 0x0C
srl $5, $4, 2        # $5 = 0x06
srl $5, $4, 3        # $5 = 0x03
addi $4, $0, -25
srl  $5, $4, 1       # $5 = 0x7FFFFFE3
srl  $6, $4, 2       # $6 = 0x3FFFFFF9
sra  $15, $4, 1      # $15 = 0xFFFFFFF3
sra  $16, $4, 2      # $16 = 0xFFFFFFF9
sra  $17, $4, 3      # $17 = 0xFFFFFFFC
#comparaisons
ori $4, $0, 2
ori $3, $0, 4
slt $6, $3, $4       # $6 = 0
slt $7, $4, $3       # $7 = 1
ori $2, $0, 10
syscall

