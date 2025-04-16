.data
num1: .word 10
num2: .word 20
res: .word 0
.code
ld r1, num1(r0)
ld r2, num2(r0)
dadd r3, r1, r2
sd r3, res(r0)
halt
