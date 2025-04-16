{
A partir de información sobre la alfabetización en la Argentina, se necesita actualizar un
archivo que contiene los siguientes datos: nombre de provincia, cantidad de personas
alfabetizadas y total de encuestados. Se reciben dos archivos detalle provenientes de dos
agencias de censo diferentes, dichos archivos contienen: nombre de la provincia, código de
localidad, cantidad de alfabetizados y cantidad de encuestados. Se pide realizar los módulos
necesarios para actualizar el archivo maestro a partir de los dos archivos detalle.
NOTA: Los archivos están ordenados por nombre de provincia y en los archivos detalle
pueden venir 0, 1 ó más registros por cada provincia.
}

program ej3;
const
	valorAlto = '9999';
type
	datos = record
		nom : string[20];
		cantAt : integer;
		cantEt : integer;
	end;
	censo = record
		nom : string[20];
		cod : integer;
		cantA : integer;
		cantE : integer;
	end;
	
	fileDetalle = file of censo;
	
	fileMaestro = file of datos;

var
	regm : datos;
	r:censo;
	fM : fileMaestro;
	fD1,fD2 : fileDetalle;

procedure leer(var fD:fileDetalle;var dato:censo);
begin
	if (not eof(fD))then
		read(fD,dato)
	else
		dato.nom := valorAlto;
end;
	
procedure procesar(var fM:fileMaestro; var fD:fileDetalle);
begin
	reset(fM); reset(fD);
	leer(fD,r); read(fM,regm);
	while (r.nom <> valorAlto) do begin
		while (r.nom <> valorAlto) and (regm.nom = r.nom) do begin
			regm.cantAt := regm.cantAt + r.cantA;
			regm.cantEt := regm.cantEt + r.cantE;
			leer(fD,r);
		end;
		
		seek(fM,filePos(fM)-1);
		write(fM,regm);
		if (not eof(fM)) then
			read(fM,regm);
	end;
	writeln('Se actualizo el maestro');
	close(fM); close(fD);
end;
begin
	assign(fM,'archivo_censos.dat');
	assign(fD1,'archivo_censados1.dat');
	assign(fD2,'archivo_censados2.dat');
	procesar(fM,fD1);
	procesar(fM,fD2);
end.
