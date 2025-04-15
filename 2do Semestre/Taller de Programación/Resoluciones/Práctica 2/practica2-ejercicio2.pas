{2.- Escribir un programa que:
a. Implemente un módulo recursivo que genere y retorne una lista de números enteros
“random” en el rango 100-200. Finalizar con el número 100.
b. Un módulo recursivo que reciba la lista generada en a) e imprima los valores de la lista en el
mismo orden que están almacenados.
c. Implemente un módulo recursivo que reciba la lista generada en a) e imprima los valores de
la lista en orden inverso al que están almacenados.
d. Implemente un módulo recursivo que reciba la lista generada en a) y devuelva el mínimo
valor de la lista.
e. Implemente un módulo recursivo que reciba la lista generada en a) y un valor y devuelva
verdadero si dicho valor se encuentra en la lista o falso en caso contrario.}

program p2ej2;
type
	lista=^nodo;
	
	nodo=record
		dato:integer;
		sig:lista;
	end;


procedure cargarLista(var L:lista; D:integer);
var
	nue:lista;
begin
	new(nue); nue^.dato:=D; nue^.sig:=L;
	L:=nue;
end;
{a. Implemente un módulo recursivo que genere y retorne una lista de números enteros
“random” en el rango 100-200. Finalizar con el número 100.}
procedure cargarListaRecursivo(var L:lista);
var
	ale:integer;
begin
	ale:=random(200-100+1)+100;
	if (ale <> 100) then begin
		cargarLista(L, ale);
		cargarListaRecursivo(L);
	end;
end;
	
{b. Un módulo recursivo que reciba la lista generada en a) e imprima los valores de la lista en el
mismo orden que están almacenados.}
procedure imprimirRecursivo(L:lista);
begin
	if (L <> NIL) then begin
		write('|',L^.dato);
		imprimirRecursivo(L^.sig);
	end;
end;

{Implemente un módulo recursivo que reciba la lista generada en a) e imprima los valores de
la lista en orden inverso al que están almacenados.}
procedure imprimirRecursivoInverso(L:lista);
begin
	if (L <> NIL) then begin
		imprimirRecursivoInverso(L^.sig);
		write('|',L^.dato);
	end;
end;

{d. Implemente un módulo recursivo que reciba la lista generada en a) y devuelva el mínimo
valor de la lista.}
function minimo(L:lista; M:integer):integer;
begin
	if (L <> NIL) then begin
		if (L^.dato < M) then
			M:=L^.dato;
		Minimo:=Minimo(L^.sig,M);
	end
	else
		Minimo:=M;
end;

{e. Implemente un módulo recursivo que reciba la lista generada en a) y un valor y devuelva
verdadero si dicho valor se encuentra en la lista o falso en caso contrario.}
function busquedaRecursiva(L:lista; V:integer):boolean;
begin
	if (L = NIL) then
		busquedaRecursiva:=false
	else begin
		if (L^.dato = V) then
			busquedaRecursiva:=true
		else
			busquedaRecursiva:=busquedaRecursiva(L^.sig,V);
	end;
end;
var
	L:lista;
	min,valor:integer;
begin
	L:=nil;
	min:=9999;
	randomize;
	cargarListaRecursivo(L);
	imprimirRecursivo(L);
	writeln(); writeln();
	imprimirRecursivoInverso(L);
	writeln(); writeln();
	writeln('El minimo es: ', minimo(L,min));
	write('Valor a buscar (entre 100 y 200): '); readln(valor);
	writeln(busquedaRecursiva(L,valor));
end.
