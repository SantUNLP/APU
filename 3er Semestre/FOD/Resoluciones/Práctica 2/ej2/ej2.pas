{
El encargado de ventas de un negocio de productos de limpieza desea administrar el stock
de los productos que vende. Para ello, genera un archivo maestro donde figuran todos los
productos que comercializa. De cada producto se maneja la siguiente información: código de
producto, nombre comercial, precio de venta, stock actual y stock mínimo. Diariamente se
genera un archivo detalle donde se registran todas las ventas de productos realizadas. De
cada venta se registran: código de producto y cantidad de unidades vendidas. Se pide
realizar un programa con opciones para:
a. Actualizar el archivo maestro con el archivo detalle, sabiendo que:
● Ambos archivos están ordenados por código de producto.
● Cada registro del maestro puede ser actualizado por 0, 1 ó más registros del
archivo detalle.
● El archivo detalle sólo contiene registros que están en el archivo maestro.
b. Listar en un archivo de texto llamado “stock_minimo.txt” aquellos productos cuyo
stock actual esté por debajo del stock mínimo permitido.
}

program ej2;
const
	valorAlto = 9999;
type
	producto = record
		codP : integer;
		nombre : string;
		precio : real;
		stockActual : integer;
		stockMin : integer;
	end;
	
	venta = record
		codP : integer;
		unidades : integer;
	end;
	
	fileMaestro = file of producto;
	fileDetalle = file of venta;
	
procedure leer(var fD:fileDetalle; var v:venta);
begin
	if (not eof(fD)) then
		read(fD,v)
	else
		v.codP := valorAlto;
end;

procedure leerProducto(var p:producto);
begin
	write('ingrese codigo de producto ');readln(p.codP);
	if(p.codP > 0 ) then begin
		write('ingrese nombre de producto '); readln(p.nombre);
		write('precio '); readln(p.precio);
		write('stock Minimo '); readln(p.stockMin);
		write('stock Actual '); readln(p.stockActual);
	end;
end;

procedure leerVenta(var v:venta);
begin
	writeln('ingrese codigo de venta '); readln(v.codP);
	if (v.codP > 0) then begin
		writeln('ingrese cantidades vendidas: '); readln(v.unidades);
	end;
end;

procedure cargarArchivoMaestro(var fM:fileMaestro);
var
	p:producto;
begin
	rewrite(fM);
	leerProducto(p);
	while (p.codP > 0) do begin
		write(fM,p);
		leerProducto(p);
	end;
	close(fM);
end;

procedure cargarArchivoDetalle(var fD:fileDetalle);
var
	v:venta;
begin
	rewrite(fD);
	leerVenta(v);
	while (v.codP > 0) do begin
		write(fD,v);
		leerVenta(v);
	end;
	close(fD);
end;

procedure procesarArchivos(var fD:fileDetalle;var fM:fileMaestro);
var
	p:producto;
	v:venta;
begin
	reset(fM); reset(fD);
	leer(fD,v);
	while (v.codP <> valorAlto) do begin
		read(fM,p);
		while (v.codP <> valorAlto) and (v.codP = p.codP) do begin
			p.stockActual := p.stockActual - v.unidades;
			leer(fD,v);
		end;
		seek(fM,filePos(fM)-1);
		write(fM,p);
	end;
	writeln('Se actualizo el archivo maestro!');
	close(fD); close(fM);
end;

procedure exportarStockMin(var fM:fileMaestro);
var
	fMin : Text;
	p : producto;
begin
	assign(fMin,'stock_minimo.txt');
	rewrite(fMin); reset(fM);
	while (not eof(fM)) do begin
		read(fM,p);
		if (p.stockActual < p.stockMin) then writeln(fMin,p.codP,' ',p.precio:0:2,' ',p.stockActual,' ',p.stockMin,' ',p.nombre);
	end;
	writeln('Exportado con exito!');
	close(fM); close(fMin);
end;

var
	fDetalle : fileDetalle;
	fMaestro : fileMaestro;
	opc : integer;
begin
	assign(fDetalle,'ventas.dat');
	assign(fMaestro,'productos.dat');
	writeln('1: crear Maestro y Detalle');
	writeln('2: procesar Maestro y Detalle');
	writeln('3: exportar Minimos');
	write('Ingresar opcion: '); readln(opc);
	writeln;
	if (opc <= 0) or (opc > 3) then
		writeln('Opcion invalida')
	else if (opc = 1) then begin
		cargarArchivoMaestro(fMaestro);
		cargarArchivoDetalle(fDetalle);
	end
	else if (opc = 2) then
			procesarArchivos(fDetalle,fMaestro)
		else if (opc = 3) then
			exportarStockMin(fMaestro);
end.
