{
Se dispone de un archivo maestro con información de los alumnos de la Facultad de
Informática. Cada registro del archivo maestro contiene: código de alumno, apellido, nombre,
cantidad de cursadas aprobadas y cantidad de materias con final aprobado. El archivo
maestro está ordenado por código de alumno.
Además, se tienen dos archivos detalle con información sobre el desempeño académico de
los alumnos: un archivo de cursadas y un archivo de exámenes finales. El archivo de
cursadas contiene información sobre las materias cursadas por los alumnos. Cada registro
incluye: código de alumno, código de materia, año de cursada y resultado (solo interesa si la
cursada fue aprobada o desaprobada). Por su parte, el archivo de exámenes finales
contiene información sobre los exámenes finales rendidos. Cada registro incluye: código de
alumno, código de materia, fecha del examen y nota obtenida. Ambos archivos detalle
están ordenados por código de alumno y código de materia, y pueden contener 0, 1 o
más registros por alumno en el archivo maestro. Un alumno podría cursar una materia
muchas veces, así como también podría rendir el final de una materia en múltiples
ocasiones.
Se debe desarrollar un programa que actualice el archivo maestro, ajustando la cantidad
de cursadas aprobadas y la cantidad de materias con final aprobado, utilizando la
información de los archivos detalle. Las reglas de actualización son las siguientes:

● Si un alumno aprueba una cursada, se incrementa en uno la cantidad de cursadas
aprobadas.
● Si un alumno aprueba un examen final (nota >= 4), se incrementa en uno la cantidad
de materias con final aprobado.
Notas:
● Los archivos deben procesarse en un único recorrido.
● No es necesario comprobar que no haya inconsistencias en la información de los
archivos detalles. Esto es, no puede suceder que un alumno apruebe más de una
vez la cursada de una misma materia (a lo sumo la aprueba una vez), algo similar
ocurre con los exámenes finales.
}

program ej7;
const
	valorAlto = 9999;
type
	alumnos = record
		cod:integer;
		ape:string;
		nom:string;
		cursadas:integer;
		finales:integer;
	end;
	
	cursadas = record
		cod:integer;
		codMateria:integer;
		anio:integer;
		resultado:boolean;
	end;
	
	finales = record
		cod:integer;
		codMateria:integer;
		fecha:string;
		nota:integer;
	end;
	
	fileMaestro = file of alumnos;
	fileCursadas = file of cursadas;
	fileFinales = file of finales;

procedure leerCursada(var dC:fileCursadas; var c:cursadas);
begin
	if (not eof(dC)) then
		read(dC,c)
	else
		c.cod := valorAlto;
end;

procedure leerFinales(var dF:fileFinales; var f:finales);
begin
	if (not eof(dF)) then
		read(dF,f)
	else
		f.cod := valorAlto;
end;

procedure leerAlumno(var fM:fileMaestro; var a:alumnos);
begin
	if (not eof(fM)) then
		read(fM,a)
	else
		a.cod := valorAlto;
end;

procedure procesarArchivos(var fM:fileMaestro; var dC:fileCursadas; var dF:fileFinales);
var
	c:cursadas; f:finales;
	a:alumnos;
begin
	reset(fM); reset(dC); reset(dF);
	leerAlumno(fM,a);
	leerCursada(dC,c); leerFinales(dF,f);
	while (not eof(fM)) do begin
		while(a.cod = c.cod) do begin
			if(c.resultado)then a.cursadas := a.cursadas + 1;
			leerCursada(dC,c);
		end;
		while(a.cod = f.cod) do begin
			if(f.nota >= 4) then a.finales := a.finales + 1;
			leerFinales(dF,f);
		end;
		seek(fM,filepos(fM)-1);
		write(fM,a);
	end;
	writeln('Archivo maestro actualizado!');
	close(fM); close(dC); close(dF);
end;
	
var
	archivoMaestro : fileMaestro;
	archivoCursadas : fileCursadas;
	archivoFinales : fileFinales;
begin
	assign(archivoMaestro,'alumnos.dat');
	assign(archivoCursadas,'cursadas.dat');
	assign(archivoFinales,'finales.dat');
	procesarArchivos(archivoMaestro,archivoCursadas,archivoFinales);
end.
