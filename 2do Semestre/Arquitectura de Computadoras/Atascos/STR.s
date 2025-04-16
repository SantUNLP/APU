.data
res: .word 0
.code
add.d f1, f0, f0
sd r1, res(r0)
dadd r1, r0, r0
halt