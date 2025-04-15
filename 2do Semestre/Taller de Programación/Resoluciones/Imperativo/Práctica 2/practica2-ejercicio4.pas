{4.- Realizar un programa que lea números y que utilice un módulo recursivo que escriba el
equivalente en binario de un número decimal. El programa termina cuando el usuario ingresa
el número 0 (cero).
Ayuda: Analizando las posibilidades encontramos que: Binario (N) es N si el valor es menor a 2.
¿Cómo obtenemos los dígitos que componen al número? ¿Cómo achicamos el número para la
próxima llamada recursiva? Ejemplo: si se ingresa 23, el programa debe mostrar: 10111}

program p2ej4;

// ARREGLAR ESTO
procedure binario(N:integer);
begin
	if (N = 1) then
		write('1')
	else begin
		binario(N DIV 2);
		write(N MOD 2);
	end
end;

var
	N:integer;
begin
	writeln('Ingresar un numero N'); readln(N);
	while (N <> 0) do begin
		binario(N);
		writeln;
		writeln('Ingresar un numero N'); readln(N);
	end;
end.
