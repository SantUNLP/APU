{
Se cuenta con un archivo que posee información de las ventas que realiza una empresa a
los diferentes clientes. Se necesita obtener un reporte con las ventas organizadas por
cliente. Para ello, se deberá informar por pantalla: los datos personales del cliente, el total
mensual (mes por mes cuánto compró) y finalmente el monto total comprado en el año por el
cliente. Además, al finalizar el reporte, se debe informar el monto total de ventas obtenido
por la empresa.
El formato del archivo maestro está dado por: cliente (cod cliente, nombre y apellido), año,
mes, día y monto de la venta. El orden del archivo está dado por: cod cliente, año y mes.
Nota: tenga en cuenta que puede haber meses en los que los clientes no realizaron
compras. No es necesario que informe tales meses en el reporte
}

program ej9;
const
	valorAlto=9999;
type
	ventas = record
		cod:integer;
		nom:string;
		ape:string;
		anio:integer;
		mes:integer;
		dia:integer;
		monto:real;
	end;
	
	fileMaestro = file of ventas;
	
procedure leer(var fM:fileMaestro; var v:ventas);
begin
	if (not eof(fM)) then
		read(fM,v)
	else
		v.cod := valorAlto;
end;	
	
procedure procesarVentas(var fM:fileMaestro);
var
	v,aux:ventas;
	montoMensual:real;
	montoAnual:real;
	montoTotal:real;
begin
	montoTotal:=0;
	reset(fM);
	leer(fM,v);
	while (v.cod <> valorAlto) do begin
		writeln('Cliente: ',v.cod,' ',v.nom,' ',v.ape);
		aux.cod:=v.cod;
		while (v.cod = aux.cod) do begin
			aux.anio := v.anio;
			montoAnual:=0;
			while (v.cod = aux.cod) and (v.anio = aux.anio) do begin
				writeln('Monto mensual');
				aux.mes:=v.mes;
				montoMensual:=0;
				while (v.cod = aux.cod) and (v.anio = aux.anio) and (v.mes = aux.mes) do begin
					montoMensual := montoMensual + v.monto;
					leer(fM,v);
				end;
				writeln('$',montoMensual:0:2);
				montoAnual := montoAnual + montoMensual;
			end;
			writeln('Monto anual');
			writeln('$',montoAnual:0:2);
			montoTotal:= montoTotal + montoAnual;
		end;
	end;
	writeln('Monto total de la empresa ');
	writeln('$',montoTotal:0:2);
	writeln('Fin del reporte!');
	close(fM);
end;

var
	archivoMaestro:fileMaestro;
begin
	assign(archivoMaestro,'ventas.dat');
	procesarVentas(archivoMaestro);
end.
