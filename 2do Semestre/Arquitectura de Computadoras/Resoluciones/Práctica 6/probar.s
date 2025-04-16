.data
A: .word 10
B: .word 12
D: .word 0

.code
ld r1, A(r0)
ld r2, B(r0)
daddi r4, r0, 0
bne r1, r2, noigu
daddi r4, r0, 2
noigu:
halt