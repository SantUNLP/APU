program ej3;
type
	empleado = record
		numEmp:integer;
		ape:string;
		nom:string;
		edad:integer;
		dni:string;
	end;
	arcEmpleados = file of empleado;

procedure imprimir(E:empleado);
begin
	writeln('[',E.numEmp,'] ',E.nom,' ',E.ape,' | ',E.edad,' | ',E.dni);
	writeln;
end;

procedure leer(var E:empleado);
begin
	write('ingresar apellido '); readln(E.ape);
	if (E.ape <> 'fin')then begin
		write('ingresar numero empleado '); readln(E.numEmp);
		write('ingresar nombre '); readln(E.nom);
		write('ingresar edad '); readln(E.edad);
		write('ingresar dni '); readln(E.dni);
	end;
end;

procedure crearArchivo(var arc:arcEmpleados);
var
	E:empleado;
	ruta:string;
begin
	writeln('ingresar ruta');
	readln(ruta);
	Assign(arc,ruta);
	rewrite(arc);
	leer(E);
	while (E.ape <> 'fin') do begin
		write(arc,E);
		leer(E);
	end;
	close(arc);
end;

procedure opcionA(var arcE:arcEmpleados);
var
	nom,ape:string;
	E:empleado;
begin
	reset(arcE);
	writeln('ingresar nombre y apellido');
	writeln;
	readln(nom); readln(ape);
	writeln;
	while (not eof(arce)) do begin
		read(arcE,E);
		if (E.nom = nom) or (E.ape = ape) then
			imprimir(E);
	end;
	close(arcE);
end;

procedure opcionB(var arcE:arcEmpleados);
var
	E:empleado;
begin
	reset(arcE);
	while (not eof(arcE)) do begin
		read(arcE,E);
		imprimir(E);
	end;
	close(arcE);
end;

procedure opcionC(var arcE:arcEmpleados);
var
	E:empleado;
begin
	reset(arcE);
	while (not eof(arcE)) do begin
		read(arcE,E);
		if (E.edad > 70) then
			imprimir(E);
	end;
	close(arcE);
end;

procedure opcionAgregar(var arc:arcEmpleados);
var
	existe:boolean;
	E,aux:empleado;
begin
	leer(E);
	reset(arc);
	while (E.ape <> 'fin') do begin
		existe:=false;
		while (not eof(arc)) and (not existe) do begin
			read(arc,aux);
			if(aux.numEmp = E.numEmp) then begin
				writeln('El empleado ya existe');
				existe:=true;
			end;
		end;
		if(not existe) then write(arc,E);
		seek(arc,0);
		leer(E);
	end;
	close(arc);
end;

procedure opcionEdad (var arc:arcEmpleados);
var
	edad,codigo:integer;
	aux:empleado;
begin
	reset(arc);
	write('Ingresar codigo de empleado a modificar '); readln(codigo);
	read(arc,aux);
	while (not eof(arc)) do begin
		read(arc,aux);
		if (codigo = aux.numEmp) then begin
			write('Ingresar edad '); readln(edad);
			seek(arc,(filepos(arc)-1));
			aux.edad := edad;
			write(arc,aux);
		end;
	end;
	close(arc);
end;

procedure opcionExportarTodos(var arc:arcEmpleados);
var
	arcTexto:Text;
	aux:empleado;
begin
	assign(arcTexto,'todos_empleados.txt');
	reset(arc);
	rewrite(arcTexto);
	while(not eof(arc)) do begin
		read(arc,aux);
		with aux do writeln(arcTexto,numEmp,' ',nom,' ',ape,' ',edad,' ',dni);
	end;
	close(arc); close(arcTexto);
end;

procedure opcionExportarSinDNI(var arc:arcEmpleados);
var
	arcDNI:Text;
	aux:empleado;
begin
	assign(arcDNI,'faltaDNIEmpleado.txt');
	reset(arc);
	rewrite(arcDNI);
	while(not eof(arc)) do begin
		read(arc,aux);
		if (aux.dni = '00') then with aux do writeln(arcDNI,numEmp,' ',nom,' ',ape,' ',edad,' ',dni);
	end;
	close(arc); close(arcDNI);
end;

procedure utilizarArchivo();
var
	arc:arcEmpleados;
	ruta:string;
	opcion:integer;
begin
	write('ingresar ruta '); readln(ruta);
	Assign(arc,ruta);
	writeln('se abrio el archivo ',ruta);
	writeln;
	writeln('1: listar nombre/apellido');
	writeln('2: listar empleados');
	writeln('3: listar jubilados');
	writeln('4: agregar empleado');
	writeln('5: modificar edad');
	writeln('6: expotar todos los empleados');
	writeln('7: exportar empleados sin dni');
	writeln;
	write('Ingresar opcion para listar '); readln(opcion);
	writeln;
	if (opcion < 0) or (opcion > 7) then writeln('ERROR')
	else
		case opcion of
			1: opcionA(arc);
			2: opcionB(arc);
			3: opcionC(arc);
			4: opcionAgregar(arc);
			5: opcionEdad(arc);
			6: opcionExportarTodos(arc);
			7: opcionExportarSinDNI(arc);
	end;
end;

procedure Opciones();
var
	opcion:integer;
	arcE:arcEmpleados;
begin
	writeln('elegir una opcion');
	writeln('1: crear'); 
	writeln('2: utilizar');
	writeln('0: terminar');
	write('ingresar opcion: ');readln(opcion);
	while (opcion <> 0) do begin
		if (opcion > 3) or (opcion < 0) then begin
			writeln;
			writeln('ERROR');
			writeln;
		end
		else
			case opcion of
			1: crearArchivo(arcE);
			2: utilizarArchivo();
			end;
		writeln('elegir una opcion');
		writeln('1: crear'); 
		writeln('2: utilizar');
		writeln('0: terminar');
		write('ingresar opcion: ');readln(opcion);
	end;
end;
begin
	Opciones();
end.
