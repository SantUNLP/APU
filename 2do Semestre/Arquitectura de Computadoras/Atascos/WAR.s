.data
num1: .word 8.5
num2: .word 2.5
res: .word 0

.code

l.d f1, num1(r0) ; CARGO en f1 lo que vale num1(r0)
l.d f2, num2(r0) ; CARGO en f2 lo que vale num2(r0)

add.d f3, f1, f2 ; SUMO lo que vale f1 con f2 y lo dejo en f3 en PUNTO FLOTANTE
mul.d f2, f2, f1 ; MULTIPLICO lo que vale f2 con f1 y lo dejo en f2 en PUNTO FLOTANTE
mul.d f4, f2, f1 ; MULTIPLICO lo que vale f2 con f1 y lo dejo en f4 en PUNTO FLOTANTE
s.d f3, res(r0) ; GUARDO lo que hay en f3 y lo dejo en res(r0)
halt ; Instrucción que finaliza el programa