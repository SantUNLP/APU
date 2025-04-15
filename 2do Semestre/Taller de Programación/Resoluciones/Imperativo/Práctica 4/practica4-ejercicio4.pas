{4. Una biblioteca nos ha encargado procesar la información de los préstamos realizados
durante el año 2021. De cada préstamo se conoce el ISBN del libro, el número de socio, día
y mes del préstamo y cantidad de días prestados. Implementar un programa con:
a. Un módulo que lea préstamos y retorne 2 estructuras de datos con la información de
los préstamos. La lectura de los préstamos finaliza con ISBN 0. Las estructuras deben
ser eficientes para buscar por ISBN.
i. En una estructura cada préstamo debe estar en un nodo. Los ISBN repetidos
insertarlos a la derecha.
ii. En otra estructura, cada nodo debe contener todos los préstamos realizados al ISBN.
(prestar atención sobre los datos que se almacenan).
b. Un módulo recursivo que reciba la estructura generada en i. y retorne el ISBN más
grande.
c. Un módulo recursivo que reciba la estructura generada en ii. y retorne el ISBN más
pequeño.
d. Un módulo recursivo que reciba la estructura generada en i. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.
e. Un módulo recursivo que reciba la estructura generada en ii. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.
f. Un módulo que reciba la estructura generada en i. y retorne una nueva estructura
ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
que se prestó.
g. Un módulo que reciba la estructura generada en ii. y retorne una nueva estructura
ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
que se prestó.
h. Un módulo recursivo que reciba la estructura generada en g. y muestre su contenido.
i. Un módulo recursivo que reciba la estructura generada en i. y dos valores de ISBN. El
módulo debe retornar la cantidad total de préstamos realizados a los ISBN
comprendidos entre los dos valores recibidos (incluidos).
j. Un módulo recursivo que reciba la estructura generada en ii. y dos valores de ISBN. El
módulo debe retornar la cantidad total de préstamos realizados a los ISBN
comprendidos entre los dos valores recibidos (incluidos).}

program p4ej4;
{4. Una biblioteca nos ha encargado procesar la información de los préstamos realizados
durante el año 2021. De cada préstamo se conoce el ISBN del libro, el número de socio, día
y mes del préstamo y cantidad de días prestados. Implementar un programa con:
a. Un módulo que lea préstamos y retorne 2 estructuras de datos con la información de
los préstamos. La lectura de los préstamos finaliza con ISBN 0. Las estructuras deben
ser eficientes para buscar por ISBN.
i. En una estructura cada préstamo debe estar en un nodo. Los ISBN repetidos
insertarlos a la derecha.
ii. En otra estructura, cada nodo debe contener todos los préstamos realizados al ISBN.
(prestar atención sobre los datos que se almacenan).}
type

	prestamo=record
		socio:integer;
		diaymes:integer;
		diasprestados:integer;
	end;
	
	prestamoleido=record
		ISBN:integer;
		socio:integer;
		diaymes:integer;
		diasprestados:integer;
	end;
	
	lista = ^nodo;
	nodo = record
		elem:prestamo;
		sig:lista;
	end;
	
	prestamolista=record
		ISBN:integer;
		listaP:lista;
	end;
	
	arbolprestamos=^nodoarbol; // ESTE TIENE ISBN
	nodoarbol=record
		dato:prestamoleido;
		HI:arbolprestamos;
		HD:arbolprestamos;
	end;
	
	arbollistas=^nodolistas; // ESTE TIENE LISTAS
	nodolistas=record
		dato:prestamolista;
		HI:arbollistas;
		HD:arbollistas;
	end;
	
	ISBN_Cant=record
		ISBN:integer;
		cant:integer;
	end;
	arbolnue=^nodonuevo;
	nodonuevo=record
		dato:ISBN_Cant;
		HI:arbolnue;
		HD:arbolnue;
	end;

procedure leerPrestamo(var p:prestamoleido);
begin
	p.ISBN:=random(200);
	if (p.ISBN <> 0) then begin
		p.socio:=random(10)+1;
		p.diaymes:=random(10)+1;
		p.diasprestados:=random(31)+1;
	end;
end;

procedure agregarArbol (var a:arbolprestamos; d:prestamoleido);
begin
	if (a = NIL) then begin
		new(a);
		a^.dato:=d;
		a^.HI:=NIL; a^.HD:=NIL;
	end
	else if (d.ISBN < a^.dato.ISBN) then
		agregarArbol(a^.HI,d)
	else
		agregarArbol(a^.HD,d);
end;

procedure agregarAdelante(var l:lista; d:prestamoleido);
var
	nue:lista;
begin
	new(nue);
	nue^.elem.socio:=d.socio; nue^.elem.diaymes:=d.diaymes; nue^.elem.diasprestados:=d.diasprestados;
	nue^.sig:=l;
	l:=nue;
end;

procedure agregarArbolsegundo(var a2:arbollistas; d:prestamoleido);
begin
	if (a2 = NIL) then begin
		new(a2);
		a2^.dato.listaP:=NIL;
		a2^.dato.ISBN:=d.ISBN;
		agregarAdelante(a2^.dato.listaP,d);
		a2^.HI:=NIL; a2^.HD:=NIL;
	end
	else
		if (d.ISBN = a2^.dato.ISBN) then
			agregarAdelante(a2^.dato.listaP,d)
		else
			if (d.ISBN < a2^.dato.ISBN) then
				agregarArbolsegundo(a2^.HI,d)
			else
				agregarArbolsegundo(a2^.HD,d);
end;

procedure cargarArbol(var a:arbolprestamos; var a2:arbollistas);
var
	p:prestamoleido;
begin
	leerPrestamo(p);
	while (p.ISBN <> 0) do begin
		agregarArbol(a,p);
		agregarArbolsegundo(a2,p);
		leerPrestamo(p);
	end;
end;

{b. Un módulo recursivo que reciba la estructura generada en i. y retorne el ISBN más
grande.}
function masgrande(a:arbolprestamos):integer;
begin
	if (a = NIL) then
		masgrande:=0
	else begin
		if (a^.HD = NIL) then
			masgrande:=a^.dato.ISBN
		else
			masgrande:=masgrande(a^.HD);
	end
end;

{c. Un módulo recursivo que reciba la estructura generada en ii. y retorne el ISBN más
pequeño.}
function maspeque(a2:arbollistas):integer;
begin
	if (a2 = NIL) then
		maspeque:=0
	else begin
		if (a2^.HI = NIL) then
			maspeque:=a2^.dato.ISBN
		else
			maspeque:=maspeque(a2^.HI);
	end;
end;

{d. Un módulo recursivo que reciba la estructura generada en i. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.}
function prestamos(a:arbolprestamos;soc:integer):integer;
begin
	if (a = NIL) then
		prestamos:=0
	else begin
		if (a^.dato.socio = soc) then
			prestamos:=prestamos(a^.HI,soc)+prestamos(a^.HD,soc)+1
		else
			prestamos:=prestamos(a^.HI,soc)+prestamos(a^.HD,soc);
	end
end;

function recorrerlista(l:lista;soc:integer):integer;
begin
	if (l = NIL) then
		recorrerlista:=0
	else
		if (l^.elem.socio = soc) then
			recorrerlista:=recorrerlista(l^.sig,soc)+1
		else
			recorrerlista:=recorrerlista(l^.sig,soc);
end;

{e. Un módulo recursivo que reciba la estructura generada en ii. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.}
function prestamoslista(a2:arbollistas;soc:integer):integer;
begin
	if (a2 = NIL) then
		prestamosLista:=0
	else begin
		prestamoslista:=recorrerlista(a2^.dato.listaP,soc)+prestamoslista(a2^.HI,soc)+prestamoslista(a2^.HD,soc);
	end
end;

procedure agregarNuevo (var nue:arbolnue; p:prestamoleido);
begin
	if (nue = NIL) then begin
		new(nue);
		nue^.dato.ISBN:=p.ISBN; nue^.dato.cant:=p.diasprestados;
		nue^.HI:=NIL; nue^.HD:=NIL;
	end
	else
		if (p.ISBN = nue^.dato.ISBN) then
			nue^.dato.cant:=nue^.dato.cant+p.diasprestados
		else
			if (nue^.dato.ISBN < p.ISBN) then
				agregarNuevo(nue^.HI,p)
			else
				agregarNuevo(nue^.HD,p);
			
end;

{f. Un módulo que reciba la estructura generada en i. y retorne una nueva estructura
ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
que se prestó.}
procedure RetornarNuevaEstructura(a:arbolprestamos; var otroa:arbolnue);
begin
	if (a <> NIL) then begin
		agregarNuevo(otroa,a^.dato);
		RetornarNuevaEstructura(a^.HI,otroa);
		RetornarNuevaEstructura(a^.HD,otroa);
	end;
end;
	
{procedure Informar1(a:arbolprestamos);
begin
	if (a <> NIL) then begin
		Informar1(a^.HI);
		write('|',a^.dato.ISBN);
		Informar1(a^.HD);
	end;
end;	
}
		
procedure Informar(otroa:arbolnue);
begin
	if (otroa <> NIL) then begin
		Informar(otroa^.HI);
		writeln('|',otroa^.dato.ISBN,'|',otroa^.dato.cant);
		Informar(otroa^.HD);
	end;
end;

var
	a:arbolprestamos;
	a2:arbollistas;
	anue:arbolnue;
	num:integer;
begin
	randomize;
	a:=NIL;
	a2:=NIL;
	cargarArbol(a,a2);
	writeln('ISBN mas grande: ',masgrande(a));
	writeln;
	writeln('ISBN mas peque:',maspeque(a2));
	writeln;
	write('LEER SOCIO '); readln(num);
	writeln('CANTIDAD DE PRESTAMOS ',prestamos(a,num));
	writeln;
	writeln('CANTIDAD DE PRESTAMOS ',prestamosLista(a2,num));
	RetornarNuevaEstructura(a,anue);
	writeln;
	//Informar(anue);
end.
