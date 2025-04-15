program punteros;
type
cadena = string[50]; // String = 50 Longitud + 1 bytes = 51 bytes
puntero_cadena = ^cadena; // Puntero = 8 Bytes
var
pc: puntero_cadena;
begin
writeln(sizeof(pc), ' bytes'); // Memoria estática = 8 bytes
new(pc);
writeln(sizeof(pc), ' bytes'); // Lo mismo, el new solo reserva memoria dinámica
pc^:= 'un nuevo nombre';
writeln(sizeof(pc), ' bytes'); // Lo mismo, imprime el puntero, no el contenido
writeln(sizeof(pc^), ' bytes'); // La memoria dinámica del NEW ocupa: tamaño del string (50+1 bytes)
pc^:= 'otro nuevo nombre distinto al anterior';
writeln(sizeof(pc^), ' bytes'); // Sigue ocupando la misma memoria dinámica
end.

