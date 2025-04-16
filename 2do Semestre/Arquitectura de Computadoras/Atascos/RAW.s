.data
num1: .word 10
num2: .word 15
res: .word 0

.code

ld r1, num1(r0) ; CARGO en r1 lo que vale num1(r0), donde r0 me indica el índice
ld r2, num2(r0) ; CARGO en r2 lo que vale num2(r0), donde r0 me indica el índice

dadd r3, r1, r2 ; SUMO lo que vale r1 con r2 y lo dejo en r3
sd r3, res(r0) ; GUARDO lo que hay en r3 y lo dejo en res(r0), donde r0 nuevamente, me indica el índice
halt ; Instrucción que finaliza el programa