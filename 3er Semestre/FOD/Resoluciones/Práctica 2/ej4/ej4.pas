{

Se cuenta con un archivo de productos de una cadena de venta de alimentos congelados.
De cada producto se almacena: código del producto, nombre, descripción, stock disponible,
stock mínimo y precio del producto.
Se recibe diariamente un archivo detalle de cada una de las 30 sucursales de la cadena. Se
debe realizar el procedimiento que recibe los 30 detalles y actualiza el stock del archivo
maestro. La información que se recibe en los detalles es: código de producto y cantidad
vendida. Además, se deberá informar en un archivo de texto: nombre de producto,
descripción, stock disponible y precio de aquellos productos que tengan stock disponible por
debajo del stock mínimo. Pensar alternativas sobre realizar el informe en el mismo
procedimiento de actualización, o realizarlo en un procedimiento separado (analizar
ventajas/desventajas en cada caso).

Nota: todos los archivos se encuentran ordenados por código de productos. En cada detalle
puede venir 0 o N registros de un determinado producto.

}

program ej4;
const
	valorAlto = 9999;
type
	producto = record
		codP : integer;
		nombre : string;
		desc : string;
		stockAct : integer;
		stockMin : integer;
		precio : real;
	end;
	
	venta = record
		codP : integer;
		cantVentas : integer;
	end;

	fileProductos = file of producto;
	fileVentas = file of venta;
	
	vectorVentas = array [1..30] of fileVentas;
	vectorRegistros = array [1..30] of venta;

procedure leer (var d:fileVentas;var v:venta);
begin
	if (not eof(d)) then
		read(d,v)
	else
		v.codP := valorAlto;
end;

procedure minimo(var vecD:vectorVentas; var vecR:vectorRegistros; var min:venta);
var
	i,pos:integer;
begin
	min.codP := valorAlto;
	for i:=1 to 3 do
		if (vecR[i].codP < min.codP) then begin
			min := vecR[i];
			pos := i;
		end;
	if (min.codP <> valorAlto) then
		leer(vecD[pos],vecR[pos]);
end;

procedure asignarRuta(var v:vectorVentas);
var
	i:integer;
	nombre : string;
begin
	for i:=1 to 3 do begin
		readln(nombre);
		assign(v[i],nombre);
	end;
end;

procedure leerDetalles(var v:vectorVentas; var vreg:vectorRegistros);
var
	i:integer;
begin
	for i:=1 to 3 do begin
		reset(v[i]);
		leer(v[i],vreg[i]);
	end;
end;

procedure exportarTexto (var m:fileProductos);
var
	stockTexto : Text;
	p : producto;
begin
	assign(stockTexto,'stock_Minimo.txt');
	rewrite(stockTexto);
	while (not eof(m)) do begin
		read(m,p);
		if (p.stockAct < p.stockMin) then
			writeln(stockTexto,p.nombre,' ',p.desc,' ',p.stockAct,' ',p.precio:0:2);
	end;
	writeln('reporte creado!');
	close(stockTexto);
end;

procedure procesarArchivos(var mProductos:fileProductos; var vDetalles:vectorVentas);
var
	i:integer;
	p:producto;
	min:venta;
	vRegistros : vectorRegistros;
begin
	assign(mProductos,'maestroProductos.dat');
	reset(mProductos);
	asignarRuta(vDetalles);
	leerDetalles(vDetalles,vRegistros);
	minimo(vDetalles,vRegistros,min);
	while (min.codP <> valorAlto) do begin
		read(mProductos,p);
		while (min.codP <> valorAlto) and (min.codP = p.codP) do begin
			p.stockAct := p.stockAct - min.cantVentas;
			minimo(vDetalles,vRegistros,min);
		end;
		while (min.codP <> p.codP) do read(mProductos,p);
		seek(mProductos,filePos(mProductos)-1);
		write(mProductos,p);
	end;
	for i:=1 to 3 do close(vDetalles[i]);
	exportarTexto(mProductos);
	close(mProductos);
	writeln('maestro actualizado!');
end;
var
	fMaestro : fileProductos;
	vDetalle : vectorVentas;
begin
	procesarArchivos(fMaestro,vDetalle);
end.
