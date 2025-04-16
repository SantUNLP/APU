.data
CAD1: .asciiz "hola"
CAD2: .asciiz "lafuente"
RES: .word 0
.code


daddi $t0, $zero, CAD1 ; Dir. start CAD1
daddi $t1, $zero; CAD2 ; Dir. start CAD2}
jal CADENAS
sd $v0, RES($zero)
halt

	CADENAS:	ld $t2, 0($t0) ; $t2 = letra 1ra cadena
				ld $t3, 0$($t1) ; $t3 = letra 2da cadena
