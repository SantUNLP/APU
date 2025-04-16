{
Se desea modelar la información necesaria para un sistema de recuentos de casos de covid
para el ministerio de salud de la provincia de buenos aires.
Diariamente se reciben archivos provenientes de los distintos municipios, la información
contenida en los mismos es la siguiente: código de localidad, código cepa, cantidad de
casos activos, cantidad de casos nuevos, cantidad de casos recuperados, cantidad de casos
fallecidos.
El ministerio cuenta con un archivo maestro con la siguiente información: código localidad,
nombre localidad, código cepa, nombre cepa, cantidad de casos activos, cantidad de casos
nuevos, cantidad de recuperados y cantidad de fallecidos.
Se debe realizar el procedimiento que permita actualizar el maestro con los detalles
recibidos, se reciben 10 detalles. Todos los archivos están ordenados por código de
localidad y código de cepa.
Para la actualización se debe proceder de la siguiente manera:
1. Al número de fallecidos se le suman el valor de fallecidos recibido del detalle.
2. Idem anterior para los recuperados.
3. Los casos activos se actualizan con el valor recibido en el detalle.
4. Idem anterior para los casos nuevos hallados.
Realice las declaraciones necesarias, el programa principal y los procedimientos que
requiera para la actualización solicitada e informe cantidad de localidades con más de 50
casos activos (las localidades pueden o no haber sido actualizadas)
}

program ej6;
const
	df = 2;
	cepaAlto = 9999;
	codAlto = 9999;
type
	municipio = record
		cod:integer;
		cepa:integer;
		activos:integer;
		nuevos:integer;
		recuperados:integer;
		fallecidos:integer;
	end;

	maestro = record
		cod:integer;
		nom:string;
		cepa:integer;
		activos:integer;
		nuevos:integer;
		recuperados:integer;
		fallecidos:integer;
	end;
	
	fileMaestro = file of maestro;
	fileDetalle = file of municipio;
	
	vectorDetalles = array [1..df] of fileDetalle;
	vectorRegistros = array [1..df] of municipio;

procedure leer(var d:fileDetalle; var r:municipio);
begin
	if (not eof(d)) then
		read(d,r)
	else
		r.cod := codAlto;
end;

procedure cargarDetalles(var vD:vectorDetalles; var vR:vectorRegistros);
var
	i:integer;
	ruta:string;
begin
	for i:=1 to df do begin
		readln(ruta);
		assign(vD[i],ruta+'.dat');
		reset(vD[i]);
		leer(vD[i],vR[i]);
	end;
end;

procedure minimo (var vD:vectorDetalles; var vR:vectorRegistros; var min:municipio);
var
	i,pos:integer;
begin
	min.cepa := cepaAlto;
	min.cod := codAlto;
	for i:=1 to df do begin
		if (vR[i].cod < min.cod) or ((vR[i].cod = min.cod) and (vR[i].cepa < min.cepa)) then begin
			min := vR[i];
			pos := i;
		end;
	end;
	if (min.cod <> codAlto) then leer(vD[pos],vR[pos]);
end;

procedure cerrarDetalles(var vD:vectorDetalles);
var
	i:integer;
begin
	for i:=1 to df do close(vD[i]);
end;

procedure procesarArchivos(var aM:fileMaestro; var vD:vectorDetalles);
var
	cantLocalidades:integer;
	vR:vectorRegistros;
	min: municipio;
	datoM : maestro;
begin
	cantLocalidades:=0;
	assign(aM,'archivo_maestro.dat');
	reset(aM);
	cargarDetalles(vD,vR);
	minimo(vD,vR,min);
	while (min.cod <> codAlto) do begin
		read(aM,datoM);
		while (min.cod = datoM.cod) and (min.cepa = datoM.cepa) do begin
			datoM.fallecidos := datoM.fallecidos + min.fallecidos;
			datoM.recuperados := datoM.recuperados + min.recuperados;
			datoM.activos := min.activos;
			datoM.nuevos := min.nuevos;
			minimo(vD,vR,min);
		end;
		while(min.cod <> datoM.cod) and (min.cepa <> datoM.cepa) do begin
			if (datoM.activos > 50) then cantLocalidades:=cantLocalidades+1;
			read(aM,datoM);
		end;
		seek(aM,filePos(aM)-1);
		write(aM,datoM);
		if (datoM.activos > 50) then cantLocalidades:=cantLocalidades+1;
	end;
	cerrarDetalles(vD);
	close(aM);
	writeln('Cantidad de localidades con mas de 50 casos activos: ',cantLocalidades);
end; 
	
var
	archivoMaestro : fileMaestro;
	vecDetalles : vectorDetalles;
begin
	procesarArchivos(archivoMaestro,vecDetalles);
end.
