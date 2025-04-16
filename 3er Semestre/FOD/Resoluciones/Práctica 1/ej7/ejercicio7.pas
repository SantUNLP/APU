program ej7;
type
	novela = record
		cod:integer;
		nom:string;
		gen:string;
		precio:real;
	end;
	aNovela = file of novela;

procedure leerNovela(var n:novela);
begin
	write('Ingresar codigo: ');readln(n.cod);
	if (n.cod > 0) then begin
		write('Ingresar nombre: ');readln(n.nom);
		write('Ingresar genero: ');readln(n.gen);
		write('Ingresar precio: ');readln(n.precio);
	end;
end;

procedure crearArchivoNovelas();
var
	n:novela;
	aN:Text;
begin
	assign(aN,'novelas.txt');
	rewrite(aN);
	leerNovela(n);
	while (n.cod > 0) do begin
		with n do begin
			writeln(aN,cod,' ',precio:0:2,' ',gen);
			writeln(aN,nom);
		end;
		leerNovela(n);
	end;
	close(aN);
end;

procedure cargarArchivoBinario(var aBN:aNovela);
var
n:novela;
aN:text;
begin;
	assign(aN,'novelas.txt');
	reset(aN);
	rewrite(aBN);
	while(not eof(aN)) do begin
		with n do begin
			readln(aN,cod,precio,gen);
			readln(aN,nom);
			write(aBN,n);
		end;
	end;
	close(aN); close(aBN);
end;

procedure agregarNovela(var aBN:aNovela);
var
	n:novela;
begin
	leerNovela(n);
	reset(aBN);
	while (n.cod > 0) do begin
		write(aBN,n);
		leerNovela(n);
	end;
	close(aBN);
end;

procedure modificar(var aBN:aNovela;n:novela);
begin
	seek(aBN,filePos(aBN)-1);
	write(aBN,n);
end;

procedure modificarNovela(var aBN:aNovela);
var
	n,aux:novela;
	existe:boolean;
begin
	existe:=false;
	reset(aBN);
	leerNovela(n);
	while (not eof(aBN)) and (not existe) do begin
		read(aBN,aux);
		if (aux.cod = n.cod) then existe:=true;
	end;
	if (existe) then modificar(aBN,n)
	else writeln('No existe la novela');
	close(aBN);
end;

procedure exportarATexto(var aBN:aNovela);
var
	n:novela;
	aN:Text;
begin
	assign(aN,'novelas.txt');
	rewrite(aN); reset(aBN);
	while (not eof(aBN)) do begin
		read(aBN,n);
		with n do begin
			writeln(aN,cod,' ',precio:0:2,' ',gen);
			writeln(aN,nom);
		end;	
	end;
	close(aN); close(aBN);
end;

procedure menuArchivoBinario();
var
	aBN: aNovela;
	opc:integer;
	ruta:string;
begin
	write('Ingresar nombre del archivo binario: '); readln(ruta);
	assign(aBN,ruta);
	writeln('0: terminar');
	writeln('1: cargar archivo binario');
	writeln('2: agregar novela');
	writeln('3: modificar novela');
	writeln('4: exportar binario a texto');
	write('Ingresar opcion: '); readln(opc);
	while (opc > 0) do begin
		case opc of
		1: cargarArchivoBinario(aBN);
		2: agregarNovela(aBN);
		3: modificarNovela(aBN);
		4: exportarATexto(aBN);
		end;
		writeln('0: terminar');
		writeln('1: cargar archivo binario');
		writeln('2: agregar novela');
		writeln('3: modificar novela');
		writeln('4: exportar binario a texto');
		write('Ingresar opcion: '); readln(opc);
	end;
end;
	
procedure menu();
var
	opc:integer;
begin
	writeln('0: Finalizar programa');
	writeln('1: crear archivo texto');
	writeln('2: menu archivo binario');
	write('Ingresar opcion: '); readln(opc);	
	while (opc > 0) do begin
		case opc of
		1: crearArchivoNovelas();
		2: menuArchivoBinario();
		end;
		writeln('0: Finalizar programa');
		writeln('1: crear archivo texto');
		writeln('2: menu archivo binario');
		write('Ingresar opcion: '); readln(opc);
	end;
end;
	
begin
	menu()
end.
