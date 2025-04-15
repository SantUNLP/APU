{Una librería requiere el procesamiento de la información de sus productos. De cada
producto se conoce el código del producto, código de rubro (del 1 al 8) y precio.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Lea los datos de los productos y los almacene ordenados por código de producto y
agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos finaliza
cuando se lee el precio 0.
b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.
c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que
puede haber más o menos de 30 productos del rubro 3. Si la cantidad de productos del rubro 3
es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto.
d. Ordene, por precio, los elementos del vector generado en c) utilizando alguno de los dos
métodos vistos en la teoría.
e. Muestre los precios del vector resultante del punto d).
f. Calcule el promedio de los precios del vector resultante del punto d).}

program p1ej4;
const
	LIM=8;
type
	rangorubro=1..LIM;
	
	producto=record
		codigo:integer;
		rubro:rangorubro;
		precio:real;
	end;
	
	lProductos=^nodo;
	
	nodo=record
		dato:producto;
		sig:lProductos;
	end;
	
	vLProductos=array[rangorubro] of lProductos;
	
	vProductos=array[1..30] of producto;
	
procedure iniVectorListas(var VL:vLProductos);
var
	i:integer;
begin
	for i:=1 to LIM do
		VL[i]:=NIL;
end;

procedure leerProducto(var P:producto);
begin
	write('Ingresar codigo '); readln(P.codigo);
	write('Ingresar rubro '); readln(P.rubro);
	write('Ingresar precio '); readln(P.precio);
end;

procedure insertarOrdenado(var L:lProductos;P:producto);
var
	ant,act,nue:lProductos;
begin
	new(nue); nue^.dato:=P; nue^.sig:=NIL;
	act:=L;
	while (act <> NIL) AND (act^.dato.codigo < nue^.dato.codigo) do begin
		ant:=act;
		act:=act^.sig;
	end;
	if (act = L) then begin
		nue^.sig:=L;
		L:=nue;
	end
	else begin
		ant^.sig:=nue;
		nue^.sig:=act;
	end;
end;

{a. Lea los datos de los productos y los almacene ordenados por código de producto y
agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos finaliza
cuando se lee el precio 0.}
procedure cargarVectorListas(var VL:vLProductos);
var
	produ:producto;
begin
	leerProducto(produ);
	while (produ.precio <> 0) do begin
		insertarOrdenado(VL[produ.rubro],produ);
		leerProducto(produ);
	end;
end;

{b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.}
procedure imprimirCodigo(VL:vLProductos);
var
	i:integer;
begin
	for i:=1 to LIM do begin
		while (VL[i] <> NIL) do begin
			writeln('CODIGO: ',VL[i]^.dato.codigo,' RUBRO: ',i);
			VL[i]:=VL[i]^.sig;
		end;
	end;
end;

{c. Genere un vector (de a lo sumo 30 elementos) con los productos del rubro 3. Considerar que
puede haber más o menos de 30 productos del rubro 3. Si la cantidad de productos del rubro 3
es mayor a 30, almacenar los primeros 30 que están en la lista e ignore el resto.}
procedure generarVector(VL:vLProductos; var VP:vProductos; var DL:integer);
var
	i:integer;
begin
	while(VL[3] <> NIL) AND (DL < 30) do begin
		DL:=DL+1;
		VP[DL]:=VL[3]^.dato;
		VL[3]:=VL[3]^.sig;
	end;
end;

{d. Ordene, por precio, los elementos del vector generado en c) utilizando alguno de los dos
métodos vistos en la teoría.}
procedure ordenarSeleccion(var VP:vProductos; DL:integer);
var
	i,j,pos:integer;
	item:producto;	
begin
	for i:=1 to LIM-1 do begin {busca el mínimo y guarda en pos la posición}
          pos := i;
          for j := i+1 to LIM do
             if (VP[j].precio > VP[pos].precio) then
				pos:=j;
         {intercambia VP[i] y VP[p]}
         item := VP[pos];   
         VP[pos] := VP[i];   
         VP[i]:= item;
	end;
end;

{e. Muestre los precios del vector resultante del punto d).}
{f. Calcule el promedio de los precios del vector resultante del punto d).}
procedure informar(VP:vProductos; DL:integer);
var
	i:integer;
	total:real;
begin
	total:=0;
	for i:=1 to DL do begin
		total:=total+VP[i].precio;
	end;
	writeln('PROMEDIO: ',total/DL:0:0);
end;

var
	vectorlistas:vLProductos;
	vectorproductos:vProductos;
	dimL:integer;
begin
	dimL:=0;
	iniVectorListas(vectorlistas);
	CargarVectorListas(vectorlistas);
	imprimirCodigo(vectorlistas);
	generarVector(vectorlistas,vectorproductos,dimL);
	ordenarSeleccion(vectorproductos,dimL);
	informar(vectorproductos,dimL);
end.
