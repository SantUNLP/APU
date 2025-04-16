.data

.code

daddi r1, r0, 1
loop: nop
daddi r1, r1, -1
bnez r1, loop
halt
