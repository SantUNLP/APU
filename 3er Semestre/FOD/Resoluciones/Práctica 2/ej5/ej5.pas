{
Suponga que trabaja en una oficina donde está montada una LAN (red local). La misma fue
construida sobre una topología de red que conecta 5 máquinas entre sí y todas las
máquinas se conectan con un servidor central. Semanalmente cada máquina genera un
archivo de logs informando las sesiones abiertas por cada usuario en cada terminal y por
cuánto tiempo estuvo abierta. Cada archivo detalle contiene los siguientes campos:
cod_usuario, fecha, tiempo_sesion. Debe realizar un procedimiento que reciba los archivos
detalle y genere un archivo maestro con los siguientes datos: cod_usuario, fecha,
tiempo_total_de_sesiones_abiertas.
Notas:
● Cada archivo detalle está ordenado por cod_usuario y fecha.
● Un usuario puede iniciar más de una sesión el mismo día en la misma máquina, o
inclusive, en diferentes máquinas.
● El archivo maestro debe crearse en la siguiente ubicación física: /var/log.
}

program ej5;
const
	fechaAlta = 'ZZZZ';
	valorAlto = 9999;
	df = 5;
type
	
	logs = record
		cod_usuario : integer;
		fecha : string;
		tiempo_sesion : integer;
	end;
	
	fileLogs = file of logs;
	
	vectorDetalles = array [1..df] of fileLogs;
	
	vectorRegistros = array [1..df] of logs;

procedure leer(var d:fileLogs;var r:logs);
begin
	if (not eof(d)) then
		read(d,r)
	else
		r.cod_usuario := valorAlto;
end;

procedure abrirDetalles(var vD:vectorDetalles; var vR:vectorRegistros);
var
	ruta:string;
	i:integer;
begin
	for i:=1 to df do begin
		readln(ruta);
		assign(vD[i],ruta);
		reset(vD[i]);
		leer(vD[i],vR[i]);
	end;
end;	

procedure cerrarDetalles(var vD:vectorDetalles);
var
	i:integer;
begin
	for i:=1 to df do
		close(vD[i]);
end;

procedure minimo(var vD:vectorDetalles; var vR:vectorRegistros; var min:logs);
var
	i,pos:integer;
begin
	min.fecha := fechaAlta;
	min.cod_usuario := valorAlto;
	for i:=1 to df do begin
		if (vR[i].cod_usuario < min.cod_usuario) or ((vR[i].cod_usuario = min.cod_usuario) and (vR[i].fecha < min.fecha)) then begin
			min := vR[i];
			pos := i;
		end;
	end;
	if (min.cod_usuario <> valorAlto) then leer(vD[pos],vR[pos]);
end;
	
procedure procesarArchivos(var fM:fileLogs; var vD:vectorDetalles);	
var
	vR : vectorRegistros;
	min,aux : logs;
begin
	assign(fM,'archivo_Maestro.dat');
	rewrite(fM);
	abrirDetalles(vD,vR);
	minimo(vD,vR,min);
	while (min.cod_usuario <> valorAlto) do begin
		aux.cod_usuario := min.cod_usuario;
		aux.fecha := min.fecha;
		aux.tiempo_sesion := 0;
		while (min.fecha = aux.fecha) and (min.cod_usuario = aux.cod_usuario) do begin
			aux.tiempo_sesion := aux.tiempo_sesion + min.tiempo_sesion;
			minimo(vD,vR,min);
		end;
		write(fM,aux);
	end;
	writeln('se creo el maestro correctamente');
	cerrarDetalles(vD);
	close(fM);
end;
	
var
	maestro : fileLogs;
	vDetalles : vectorDetalles;
begin
	procesarArchivos(maestro,vDetalles);
end.
