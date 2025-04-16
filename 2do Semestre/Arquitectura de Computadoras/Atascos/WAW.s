.data
num1: .word 8.5
num2: .word 2.5
res: .word 0

.code
mul.d f1, f1, f2 ; MULTIPLICO f1 con f2 y lo dejo en f1 (PUNTO FLOTANTE)
add.d f1, f3, f2 ; SUMO f3 con f2 y lo dejo en f1 (PUNTO FLOTANTE)
halt ; Instrucción de fin