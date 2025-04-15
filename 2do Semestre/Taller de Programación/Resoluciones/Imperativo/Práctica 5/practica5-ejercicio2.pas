{2. Una agencia dedicada a la venta de autos ha organizado su stock y, tiene la información de
los autos en venta. Implementar un programa que:
a) Genere la información de los autos (patente, año de fabricación (2010..2018), marca y
modelo, finalizando con marca ‘MMM’) y los almacene en dos estructuras de datos:
i. Una estructura eficiente para la búsqueda por patente.
ii. Una estructura eficiente para la búsqueda por marca. Para cada marca se deben
almacenar todos juntos los autos pertenecientes a ella.
b) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne la
cantidad de autos de dicha marca que posee la agencia.
c) Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne
la cantidad de autos de dicha marca que posee la agencia.
d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con
la información de los autos agrupados por año de fabricación.
e) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el
modelo del auto con dicha patente.
f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el
modelo del auto con dicha patente.}

program p5ej2;
const
	corte='MMM';
{a) Genere la información de los autos (patente, año de fabricación (2010..2018), marca y
modelo, finalizando con marca ‘MMM’) y los almacene en dos estructuras de datos:
i. Una estructura eficiente para la búsqueda por patente.
ii. Una estructura eficiente para la búsqueda por marca. Para cada marca se deben
almacenar todos juntos los autos pertenecientes a ella.}
type
	rango=2010..2018;
	
	auto=record
		marca:string;
		patente:string;
		fabricacion:rango;
		modelo:string;
	end;
	
	autoleido=record
		patente:string;
		fabricacion:rango;
		modelo:string;
	end;
	arbolpat=^nodoarbolpat;
	nodoarbolpat=record
		dato:auto;
		HI:arbolpat;
		HD:arbolpat;
	end;
	
	autosinmarca=record
		marca:=string;
		dato:autoleido
	end;
	lista=^nodo;
	nodo=record
		dato:autosinmarca;
		sig:lista;
	end;
	autoconmarca=record
		marca:string;
		elem:lista;
	end;
	elem=record
		marca:string;
		l:lista
	end;
	arbolmarca=^nodoarbolmarca;
	nodoarbolmarca=record
		dato:elem;
		HI:arbolmarca;
		HD:arbolmarca;
	end;

procedure generarAuto(var a:autoleido);
begin
	readln(a.marca);
	if (a.marca <> corte) then begin
		readln(a.patente);
		readln(a.fabricacion);
		readln(a.modelo);
	end;
end;

procedure agregarArbol (var a:arbolpat; dato:autoleido);
begin
	if (a = NIL) then begin
		new(a);
		a^.dato:=dato;
		a^.HI:=NIL; a^.HD:=NIL;
	end
	else begin
		if (dato.patente = a^.dato.patente) then
			a^.dato:=dato
		else
			if(dato.patente < a^.dato.patente) then
				agregarArbol(a^.HI,dato)
			else
				agregarArbol(a^.HD,dato);
	end;
end;

procedure agregarAdelante(var l:lista; auto:autoleido);
var
	nue:lista;
begin
	new(nue);
	nue^.dato.modelo:=auto.modelo; nue^.dato.patente:=auto.patente; nue^.dato.fabricacion:=auto.fabricacion;
	nue^.sig:=l;
	l:=nue;
end;

procedure agregarArbolsegundo(var a2:arbolmarca; dato:autoleido);
begin
	if (a2 = NIL) then begin
		new(a2);
		a2^.dato.elem.l:=NIL;
		a2^.dato.elem.marca:=dato.marca;
		agregarAdelante(a2^.dato.elem.l,dato);
		a2^.HI:=NIL; a2^.HD:=NIL;
	end
	else
end;

procedure cargarArboles (var a:arbolpat; var a2:arbolmarca);
var
	auto:autoleido;
begin
	generarAuto(auto);
	while (auto.marca <> corte) do begin
		agregarArbol(a,auto);
		agregarArbolsegundo(a2,auto);
		generarAuto(auto);
	end;
end;

procedure imprimir(a:arbolpat);
begin
	if (a <> NIL) then begin
		imprimir(a^.HI);
		writeln(a^.dato.patente);
		imprimir(a^.HD);
	end;
end;

var
	a:arbolpat;
	a2:arbolmarca;
begin
	randomize;
	a:=NIL; a2:=NIL;
	cargarArboles(a,a2);
	imprimir(a);
end.
