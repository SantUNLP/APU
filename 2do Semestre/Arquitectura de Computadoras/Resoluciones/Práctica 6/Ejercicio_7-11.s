.data
CONTROL: .word32 0x10000
DATA: .word32 0x10008
COLOR: .byte 0,0,0,0
X: .byte 0
Y: .byte 0

.code

daddi $t4, $0, 50 ; X
daddi $t5, $0, 50 ; Y

lwu $s0, CONTROL($0)
lwu $s1, DATA($0)

lwu $t0, COLOR($0) ; Cargo el color
sw $t0, 0($s1) ; Guardo color en DATA

lbu $t1, X($0) ; Cargo X en $t1
sb $t1, 5($s1) ; Guardo X en DATA

lbu $t2, Y($0) ; Cargo Y en $t2
sb $t2, 4($s1) ; Guardo Y en DATA
daddi $t6, $0, 5 ; Señal 5 = imprimir gráfica
sd $t6, 0($s0) ; Mando la señal gráfica

loopY:
LoopX:
daddi $t0, $t0, 1
sw $t0, 0($s1) ; Guardo color en DATA
daddi $t6, $0, 5 ; Señal 5 = imprimir gráfica
sd $t6, 0($s0) ; Mando la señal gráfica
daddi $t1, $t1, 1
sb $t1, 5($s1)
daddi $t4, $t4, -1
bnez $t4, LoopX
daddi $t2, $t2, 1
sb $t2, 4($s1)
daddi $t4, $0, 50
daddi $t1, $0, 0
sb $t1, 5($s1)
daddi $t5, $t5, -1
bnez $t5, loopY
halt