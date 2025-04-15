{2. Escribir un programa que:
a. Implemente un módulo que genere aleatoriamente información de ventas de un comercio.
Para cada venta generar código de producto, fecha y cantidad de unidades vendidas. Finalizar
con el código de producto 0. Un producto puede estar en más de una venta. Se pide:
i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
producto. Los códigos repetidos van a la derecha.
ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la
cantidad total de unidades vendidas.
iii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la lista de
las ventas realizadas del producto.
Nota: El módulo debe retornar TRES árboles.
b. Implemente un módulo que reciba el árbol generado en i. y una fecha y retorne la cantidad
total de productos vendidos en la fecha recibida.
c. Implemente un módulo que reciba el árbol generado en ii. y retorne el código de producto
con mayor cantidad total de unidades vendidas.
d. Implemente un módulo que reciba el árbol generado en iii. y retorne el código de producto
con mayor cantidad de ventas}

program p3ej2;

type
	dias = 1..31;
	meses = 1..12;
	anios = 2000..2024;
	fec = record
		dia:dias;
		mes:meses;
		anio:anios;
	end;

	venta = record
		cod:integer;
		fecha:fec;
		cantvendida:integer;
	end;
	
	ventasinfec = record
		cod:integer;
		cantvend:integer;
	end;
	
	ventasincod=record
		fecha:fec;
		cantvend:integer;
	end;
	
	lista=^nodoventas;
	
	nodoventas = record
		dato:ventasincod;
		sig:lista;
	end;
	
	rlistas = record
		codig:integer;
		listaventas:lista;
	end;
	
	arbol=^nodoarbol;
	
	nodoarbol = record
		dato:venta;
		HI:arbol;
		HD:arbol;
	end;
	
	arbol2=^nodoarbolsinfec;
	
	nodoarbolsinfec = record
		dato:ventasinfec;
		HI:arbol2;
		HD:arbol2;
	end;
	
	arbol3=^nodoarbolsincod;
	
	nodoarbolsincod = record
		dato:rlistas;
		HI:arbol3;
		HD:arbol3;
	end;

procedure cargarfecha(var f:fec);
begin
	f.dia:=random(31)+1;
	f.mes:=random(12)+1;
	f.anio:=random(25)+2000;
end;

procedure generarventa(var v:venta);
begin
	v.cod:=random(100);
	cargarfecha(v.fecha);
	v.cantvendida:=random(100);
end;

procedure agregar(var a:arbol; d:venta);
begin
	if (a = NIL) then begin
		new(a);
		a^.dato:=d; a^.HI:=NIL; a^.HD:=NIL;
	end
	else begin
		if (d.cod = a^.dato.cod) then
			agregar(a^.HD,d)
		else begin
			if (d.cod < a^.dato.cod) then
				agregar(a^.HI,d)
			else
				agregar(a^.HD,d);
		end
	end		
end;

procedure agregarsegundo(var a2:arbol2; d:venta);
begin
	if (a2 = NIL) then begin
		new(a2);
		a2^.dato.cod:=d.cod;
		a2^.dato.cantvend:=d.cantvendida;
		a2^.HI:=NIL; a2^.HD:=NIL;
	end
	else begin
		if (d.cod = a2^.dato.cod) then
			a2^.dato.cantvend:=a2^.dato.cantvend+d.cantvendida
		else begin
			if (d.cod < a2^.dato.cod) then
				agregarsegundo(a2^.HI,d)
			else
				agregarsegundo(a2^.HD,d);
		end
	end		
end;

procedure agregaradelante (var l:lista; dato:ventasincod);
var
	nue:lista;
begin
	new(nue);
	nue^.dato:=dato; nue^.sig:=l;
	l:=nue;
end;

procedure agregartercero(var a3:arbol3; d:venta);
var
	l:lista;
	ven:ventasincod;
begin
	if (a3 = NIL) then begin
		new(a3);
		a3^.dato.listaventas:=NIL;
		ven.fecha:=d.fecha;
		ven.cantvend:=d.cantvendida;
		agregaradelante(l,ven);
		a3^.HI:=NIL; a3^.HD:=NIL;
	end
	else begin
		if (d.cod = a3^.dato.codig) then
			agregaradelante(l,ven)
		else begin
			if (d.cod < a3^.dato.codig) then
				agregartercero(a3^.HI,d)
			else
				agregartercero(a3^.HD,d);
		end
	end		
end;

procedure cargarArbol(var a:arbol;var a2:arbol2; var a3:arbol3);
var
	v:venta;
begin
	generarventa(v);
	while (v.cod <> 0) do begin
		agregar(a,v);
		agregarsegundo(a2,v);
		agregartercero(a3,v);
		generarventa(v);
	end;
end;

procedure leerf(var f:fec);
begin
	writeln('DIA'); readln(f.dia);
	writeln('MES'); readln(f.mes);
	writeln('ANIO'); readln(f.anio);
end;

procedure recorrer(a:arbol;d:fec,var cant:integer);
begin
		if (a <> NIL) then begin
			recorrer(a^.HI,d);
			// aca va una funcion
			recorrer(a^.HD,d);
		end;
end;

var
	a:arbol;
	a2:arbol2;
	a3:arbol3;
	date:fec;
	produs:integer;
begin
	randomize;
	a:=NIL;
	a2:=NIL;
	a3:=NIL;
	produs:=0;
	leerf(date);
	cargarArbol(a,a2,a3);
	recorrer(a,date);
end.
