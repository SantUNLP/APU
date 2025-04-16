.data
TablaF: .double 2.5, -5.2, 8.2, 1.4, -0.5,0.0
Cero: .double 0.0
.code

daddi $t0, $zero, 0 ; Inicializo la cantidad de positivos
daddi $a0, $zero, TablaF ; $a0 = dir. start TablaF
l.d f2, Cero($zero) ; f2 = 0.0 (para comparar si llegue al final de la tabla)

jal Recibir_Car
sd $a0, CanPos($zero)
halt

Recibir_Car:

ES_POSITIVO:
	Loop: l.d f1, 0($t0)
	daddi $t0, $t0, 8
	c.lt.d f1, f2
	bc1t no_es_p
	daddi $a0, $a0, 1
	no_es_p: c.eq.d f1, f2
	bc1f Loop
fin: jr $ra