{5. Realizar un programa para una tienda de celulares, que presente un menú con
opciones para:
a. Crear un archivo de registros no ordenados de celulares y cargarlo con datos
ingresados desde un archivo de texto denominado “celulares.txt”. Los registros
correspondientes a los celulares deben contener: código de celular, nombre,
descripción, marca, precio, stock mínimo y stock disponible.
b. Listar en pantalla los datos de aquellos celulares que tengan un stock menor al
stock mínimo.
c. Listar en pantalla los celulares del archivo cuya descripción contenga una
cadena de caracteres proporcionada por el usuario.
d. Exportar el archivo creado en el inciso a) a un archivo de texto denominado
“celulares.txt” con todos los celulares del mismo. El archivo de texto generado
podría ser utilizado en un futuro como archivo de carga (ver inciso a), por lo que
debería respetar el formato dado para este tipo de archivos en la NOTA 2.}

program ej5;
type
	celular = record
		codC:integer;
		nom:string;
		desc:string;
		marca:string;
		precio:real;
		stockMin:integer;
		stockDisponible:integer;
	end;
	
	aCelulares = file of celular;	
	
procedure leer(var c:celular);
begin
	with c do begin
		write('ingresar codigo ');readln(codC);
		if(codC > 0) then begin
			write('ingresar nombre ');readln(nom);
			write('ingresar descripcion ');readln(desc);
			write('ingresar marca ');readln(marca);
			write('ingresar precio ');readln(precio);
			write('ingresar stock minimo ');readln(stockMin);
			write('ingresar stock disponible ');readln(stockDisponible);
		end;
	end;
end;

procedure crearArchivoCelulares();
var
	aCTXT: Text;
	c:celular;
begin
	assign(aCTXT,'celulares.txt');
	rewrite(aCTXT);
	leer(c);
	while(c.codC > 0) do begin
		with c do begin
			writeln(aCTXT,codC,' ',precio:0:2,' ',marca);
			writeln(aCTXT,stockDisponible,' ',stockMin,' ',desc);
			writeln(aCTXT,nom);
		end;
		leer(c);
	end;
	close(aCTXT);
end;

procedure cargarCelulares();
var
	aC:aCelulares;
	aCTXT: Text;
	ruta:string;
	c:celular;
begin
	write('ingresar ruta '); readln(ruta);
	assign(aCTXT,'celulares.txt'); assign(aC,ruta);
	reset(aCTXT); rewrite(aC);
	while (not eof(aCTXT)) do begin
		with c do begin
			readln(aCTXT,codC,precio,marca);
			readln(aCTXT,stockDisponible,stockMin,desc);
			readln(aCTXT,nom);
			write(aC,c);
		end;
	end;
	close(aCTXT); close(aC);
end;

procedure imprimir (c:celular);
begin
	with c do begin
		writeln('[',codC,'] ',nom,' | ',desc,' | ',marca,' $',precio:0:2,' | ',stockDisponible,' / ',stockMin,' |');
	end;
end;

procedure opcionB(var aC:aCelulares);
var
	c:celular;
begin
	reset(aC);
	while (not eof(aC)) do begin
		read(aC,c);
		if (c.stockDisponible < c.stockMin) then imprimir(c);
	end;
	close(aC);
end;

procedure opcionC(var aC:aCelulares);
var
	desc:string;
	c:celular;
begin
	reset(aC);
	write('ingresar descripcion '); readln(desc);
	while (not eof(aC)) do begin
		read(aC,c);
		if (' '+desc = c.desc) then imprimir(c);
	end;
	close(aC);
end;
procedure opcionD(var aC:aCelulares);
var
	aCTXT:Text;
	c:celular;
begin
	assign(aCTXT,'celulares.txt');
	reset(aC); rewrite(aCTXT);
	while (not eof(aC)) do begin
		read(aC,c);
		with c do begin
			writeln(aCTXT,codC,' ',precio:0:2,' ',marca);
			writeln(aCTXT,' ',stockDisponible,' ',stockMin);
			writeln(aCTXT,nom);
		end;
	end;
	close(aC); close(aCTXT);
	writeln('Archivo exportado con exito!');
end;

procedure agregarCelular(var aC:aCelulares);
var
	c:celular;
begin
	leer(c);
	reset(aC);
	seek(aC,fileSize(aC));
	while(c.codC > 0) do begin
		write(aC,c);
		leer(c);
	end;
	close(aC);
end;

procedure modificarStock(var aC:aCelulares);
var
	encontro:boolean;
	c:celular;
	nombre:string;
	stockDisponible:integer;
begin
	encontro:=false;
	write('ingresar nombre '); readln(nombre);
	write('ingresar stock '); readln(stockDisponible);
	reset(aC);
	while (not eof(aC)) and (not encontro) do begin
		read(aC,c);
		if(c.nom = nombre) then begin
			seek(aC,filePos(aC)-1);
			c.stockDisponible := c.stockDisponible + stockDisponible;
			write(aC,c);
			encontro:=true;
			writeln('Se modifico el stock del celular ',nombre);
		end;
	end;
	close(aC);
end;

procedure exportarSinStock(var aC:aCelulares);
var
	aSinStock: Text;
	c:celular;
begin
	assign(aSinStock,'sinStock.txt');
	reset(aC); rewrite(aSinStock);
	while (not eof(aC)) do begin
		read(aC,c);
		if(c.StockDisponible = 0) then begin
			with c do begin
				writeln(aSinStock,codC,' ',precio:0:2,' ',marca);
				writeln(aSinStock,' ',stockDisponible,' ',stockMin);
				writeln(aSinStock,nom);
			end;
		end;
	end;
	writeln('Archivo exportado con exito!');
	close(aC); close(aSinStock);
end;

procedure utilizarArchivo();
var
	aC:aCelulares;
	ruta:string;
	opcion:integer;
begin
	write('ingresar ruta '); readln(ruta);
	Assign(aC,ruta);
	writeln('/////////////////////////////////////////////////////////////');
	writeln('1: imprimir celulares < stock min');
	writeln('2: imprimir celulares descripcion');
	writeln('3: exportar archivo celulares a txt');
	writeln('4: agregar celulares');
	writeln('5: modificar stock');
	writeln('6: exportar archivo celulares sin stock');
	write('ingresar opcion '); readln(opcion);
	if (opcion < 0) or (opcion > 6) then writeln('ERROR')
	else
		case opcion of
			1: opcionB(aC);
			2: opcionC(aC);
			3: opcionD(aC);
			4: agregarCelular(aC);
			5: modificarStock(aC);
			6: exportarSinStock(aC);
		end;
end;
	
procedure Opciones();
var
	opcion:integer;
begin
	writeln('/////////////////////////////////////////////////////////////');
	writeln('0: FINALIZAR');
	writeln('1: cargar celulares');
	writeln('2: crear archivo');
	writeln('3: utilizar archivo');
	write('ingresar opcion: '); readln(opcion);
	while(opcion <> 0) do begin
		if (opcion < 0) or (opcion > 3) then writeln('ERROR')
		else
		case opcion of
		1: crearArchivoCelulares();
		2: cargarCelulares();
		3: utilizarArchivo();
		end;
		writeln('/////////////////////////////////////////////////////////////');
		writeln('0: FINALIZAR');
		writeln('1: cargar celulares');
		writeln('2: crear archivo');
		writeln('3: utilizar archivo');
		write('ingresar opcion: '); readln(opcion);
	end;
end;
begin
	Opciones();
end.
