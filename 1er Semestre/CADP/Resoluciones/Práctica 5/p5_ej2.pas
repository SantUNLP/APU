program punteros;
type
cadena = string[9];
producto = record // 24 Bytes
codigo: integer; // 6 bytes
descripcion: cadena; // 10 bytes
precio: real; // 8 bytes
end;
puntero_producto = ^producto; // 8 bytes
var
p: puntero_producto;
prod: producto;
begin
writeln(sizeof(p), ' bytes'); // ME = 8 por puntero
writeln(sizeof(prod), ' bytes'); // ME = 24 = 6 + 10 + 8
new(p);
writeln(sizeof(p), ' bytes'); // ME = 8 por puntero
p^.codigo := 1;
p^.descripcion := 'nuevo producto'; // HAY UN ERROR EN LA LONGITUD
writeln(sizeof(p^), ' bytes'); // MD = 24 bytes (Lo que ocupa el registro)
p^.precio := 200;
writeln(sizeof(p^), ' bytes'); // MD = 24
prod.codigo := 2;
prod.descripcion := 'otro nuevo producto'; // HAY UN ERROR EN LA LONGITUD
writeln(sizeof(prod), ' bytes'); // MD = 24
// PRUEBA
writeln(p^.descripcion);
writeln(prod.descripcion);
end.
