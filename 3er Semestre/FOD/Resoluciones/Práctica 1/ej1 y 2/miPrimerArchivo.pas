program miPrimerArchivo;
type
	st20 = string[20];
	archivo = file of integer;
var
	arc:archivo;
	num:integer;
	nombreArc:st20;
begin
	writeln('Ingresar nombre del archivo');
	readln(nombreArc);
	assign(arc,nombreArc); // <- Asigna la ruta en la que se almacena el archivo
	rewrite(arc); // <- Crea archivo
	writeln('Ingrese numeros distintos de 0');
	readln(num);
	while (num <> 30000) do begin
		write(arc,num); // <- Escribe el dato sobre el archivo
		readln(num);
	end;
	close(arc);
	reset(arc); // <- Abre el archivo
	while not(EOF(arc)) do begin
		read(arc,num); // <- Me quedo el dato del archivo
		write(num,' ');
	end;
	close(arc); // <- Cierro el archivo
end.
