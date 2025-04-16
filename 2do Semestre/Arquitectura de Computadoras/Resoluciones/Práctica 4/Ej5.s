.data
  cant: .word 8 
  datos: .word 1, 2, 3, 4, 5, 6, 7, 8 
  res: .word 0  
.code  
 dadd  r1, r0, r0  
 ld  r2, cant(r0) 
 loop: ld  r3, datos(r1)
 daddi r1, r1, 8
 daddi r2, r2, -1
 dsll  r3, r3, 1
 sd  r3, res(r1)
 bnez  r2, loop
 halt

 # Con la opción de Delay Slot activada solamente se producen (25) Atascos RAW y (0) Atascos Branch Taken
 # Sin la opción de Delay Slot activada solamente se producen (25) Atascos RAW y (7) Atascos Branch Taken

 # Sin el NOP y Delay Slot activado, se ejecuta el HALT lo que hace que termine el programa

 # 1er Comentario: (88) Ciclos (59) Instrucciones (1492) CPI
 # 2do Comentario: (88) Ciclos (52) Instrucciones (1692) CPI
 # 3er Comentario: (17) Ciclos (9) Instrucciones (1889) CPI

