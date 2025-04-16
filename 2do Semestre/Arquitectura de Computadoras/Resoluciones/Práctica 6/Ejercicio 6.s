.data
color: .byte 0,0,0,0
CONTROL: .word32 0x10000
DATA: .word32 0x10008

.code

lwu $s6, CONTROL($zero) ; $s6 = dirección de CONTROL
lwu $s7, DATA($zero) ; $s7 = dirección de DATA

daddi $t0, $zero, 7 ; $t0 = 7 -> función 7: limpiar pantalla gráfica

sd $t0, 0($s6) ; CONTROL recibe 7 y limpia la pantalla gráfica
daddi $t0, $zero, 8 ; $t0 = 8 -> función 8: pedir un número

jal pedir_num

sb $s1, 4($s7) ; DATA+4 recibe el valor de coordenada
sb $s2, 5($s7) ; DATA+5 recibe el valor de coordenada

lwu $s2, color($zero) ; $s2 = valor de color a pintar

sw $s2, 0($s7) ; DATA recibe el valor del color a pintar

daddi $t0, $zero, 5 ; $t0 = 5 -> función 5: salida gráfica

sd $t0, 0($s6) ; CONTROL recibe 5 y produce el dibujo del punto

halt

pedir_num:
daddi $t1, $0, 4 ; Contador para pedir colores + transparencia
daddi $t2, $0, 0 ; Inicializo indice
sd $t0, 0($s6)
lb $s1, 0($s7) ; Cargo el DATO ingresado en $s1 = y

sd $t0, 0($s6)
lb $s2, 0($s7) ; Cargo el DATO ingresado en $s2 = x

lazo: daddi $t1, $t1, -1
sd $t0, 0($s6) ; PIDO DATO
lb $t3, 0($s7) ; LEO DATO
sb $t3, color($t2)
daddi $t2, $t2, 1
bnez $t1, lazo
jr $ra