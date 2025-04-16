{
Realizar un algoritmo, que utilizando el archivo de números enteros no ordenados
creado en el ejercicio 1, informe por pantalla cantidad de números menores a 1500 y el
promedio de los números ingresados. El nombre del archivo a procesar debe ser
proporcionado por el usuario una única vez. Además, el algoritmo deberá listar el
contenido del archivo en pantalla.
}

program ejercicio2;
type
	st20 = string[20];
	archivo = file of integer;
procedure procesarArchivo(var a:archivo);
var
	num,cant1500,suma:integer;
	prom:real;
begin
	reset(a); writeln('Se abrio el archivo');
	cant1500:=0; suma:=0; prom:=0;
	while NOT(EOF(a)) do begin
		read(a,num);
		if (num < 1500) then cant1500:=cant1500+1;
		suma:=suma+num;
		write(num,' ');
	end;
	prom:=suma/fileSize(a);
	writeln;
	writeln('El promedio es: ',prom:0:2);
	writeln('Cantidad de menores a 1500: ',cant1500);
	close(a); writeln('Se cerro el archivo');
end;

var
	arc:archivo;
	nombreArc:st20;
begin
	writeln('ingresar nombre del archivo a procesar');
	readln(nombreArc);
	Assign(arc,nombreArc);
	procesarArchivo(arc);
end.
