{
Se quiere optimizar la gestión del consumo de yerba mate en distintas provincias de
Argentina. Para ello, se cuenta con un archivo maestro que contiene la siguiente
información: código de provincia, nombre de la provincia, cantidad de habitantes y cantidad
total de kilos de yerba consumidos históricamente.
Cada mes, se reciben 16 archivos de relevamiento con información sobre el consumo de
yerba en los distintos puntos del país. Cada archivo contiene: código de provincia y cantidad
de kilos de yerba consumidos en ese relevamiento. Un archivo de relevamiento puede
contener información de una o varias provincias, y una misma provincia puede aparecer
cero, una o más veces en distintos archivos de relevamiento.
Tanto el archivo maestro como los archivos de relevamiento están ordenados por código de
provincia.
Se desea realizar un programa que actualice el archivo maestro en base a la nueva
información de consumo de yerba. Además, se debe informar en pantalla aquellas
provincias (código y nombre) donde la cantidad total de yerba consumida supere los 10.000
kilos históricamente, junto con el promedio consumido de yerba por habitante. Es importante
tener en cuenta tanto las provincias actualizadas como las que no fueron actualizadas.
Nota: cada archivo debe recorrerse una única vez.
}

program ej8;
const
	valorAlto = 9999;
	df = 3;
type
	yerba = record
		cod:integer;
		nom:string;
		cantHabitantes:integer;
		cantKilos:integer;
	end;
	
	relevamiento = record
		cod:integer;
		cantConsumida:integer;
	end;
	
	fileMaestro = file of yerba;
	fileDetalle = file of relevamiento;
	
	vectorDetalles = array[1..df] of fileDetalle;
	vectorRegistros = array[1..df] of relevamiento;

procedure leer(var d:fileDetalle; var r:relevamiento);
begin
	if(not eof(d)) then
		read(d,r)
	else
		r.cod := valorAlto;
end;

procedure leerMaestro(var m:fileMaestro;var y:yerba);
begin
	if (not eof(m)) then
		read(m,y)
	else
		y.cod := valorAlto;
end;

procedure cargarDetalles(var vD:vectorDetalles; var vR:vectorRegistros);
var
	i:integer;
begin
	for i:=1 to df do begin
		reset(vD[i]);
		leer(vD[i],vR[i]);
	end;
end;

procedure cerrarDetalles(var vD:vectorDetalles);
var
	i:integer;
begin
	for i:=1 to df do close(vD[i]);
end;

procedure minimo(var vD:vectorDetalles; var vR:vectorRegistros; var min:relevamiento);
var
	i:integer;
	pos:integer;
begin
	min.cod := valorAlto;
	for i:=1 to df do begin
		if (vR[i].cod < min.cod) then begin
			min := vR[i];
			pos:=i;
		end;
	end;
	if (min.cod <> valorAlto) then leer(vD[pos],vR[pos]);
end;

procedure procesarArchivos(var fM:fileMaestro; var vD:vectorDetalles);
var
	datoM:yerba;
	vR:vectorRegistros;
	min:relevamiento;
begin
	reset(fM);
	cargarDetalles(vD,vR);
	minimo(vD,vR,min);
	while (min.cod <> valorAlto) do begin
		leerMaestro(fM,datoM);
		while (min.cod = datoM.cod) do begin
			datoM.cantKilos := datoM.cantKilos + min.cantConsumida;
			minimo(vD,vR,min);
		end;
		while (datoM.cod <> min.cod) do begin
			writeln('promedio: ',datoM.cantKilos/datoM.cantHabitantes);
			if (datoM.cantKilos > 10000) then begin
				writeln(datoM.cod,' ',datoM.nom);
				read(fM,datoM);
			end;
		end;
		writeln('promedio: ',datoM.cantKilos/datoM.cantHabitantes);
		if(datoM.cantKilos > 10000) then
			writeln(datoM.cod,' ',datoM.nom);
		seek(fM,filepos(fM)-1);
		write(fM,datoM);
	end;
	writeln('Se actualizo el maestro!');
	cerrarDetalles(vD);
	close(fM);
end;

var
	archivoMaestro:fileMaestro;
	archivosDetalles : vectorDetalles;
	i:integer;
	ruta:string;
begin
	assign(archivoMaestro,'consumo_yerba.dat');
	for i:=1 to df do begin
		readln(ruta);
		assign(archivosDetalles[i],ruta+'.dat');
	end;
	procesarArchivos(archivoMaestro,archivosDetalles);	
end.
