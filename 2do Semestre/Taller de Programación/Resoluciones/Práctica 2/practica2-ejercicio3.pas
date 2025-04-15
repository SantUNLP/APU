{3.- Implementar un programa que invoque a los siguientes módulos.
a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 300
y menores a 1550 (incluidos ambos).
b. Un módulo que reciba el vector generado en a) y lo retorne ordenado. (Utilizar lo realizado
en la práctica anterior)
c. Un módulo que realice una búsqueda dicotómica en el vector, utilizando el siguiente
encabezado:

Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
Nota: El parámetro “pos” debe retornar la posición del dato o -1 si el dato no se encuentra
en el vector}

program p2ej3;
const
	DF=20;
type
	vEnteros = array [1..DF] of integer;

{a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 300
y menores a 1550 (incluidos ambos).}
procedure cargarRecursivo(var V:vEnteros; var DL:integer);
var
	ale:integer;
begin
	ale:=random(1550-300+1)+300;
	if (DL < DF) then begin
		DL:=DL+1;
		V[DL]:=ale;
		cargarRecursivo(V,DL);
	end
end;

procedure ordenarSeleccion(var V:vEnteros; DL:integer);
var
	i,j,pos:integer;
	item:integer;	
begin
	for i:=1 to DL-1 do begin {busca el mínimo y guarda en pos la posición}
          pos := i;
          for j := i+1 to DL do
             if (V[j] < V[pos]) then
				pos:=j;
         {intercambia VP[i] y VP[p]}
         item:= V[pos];   
         V[pos]:= V[i];   
         V[i]:= item;
	end;
end;

procedure busquedaDicotomica (V:vEnteros; ini,fin: indice; dato:integer; var pos: indice);
var
	medio:integer;
begin
	medio := (ini + fin) div 2 ;
    while  (ini <= fin) and (dato <> V[medio]) do begin
		 if (dato < V[medio]) then 
			fin:= medio-1
         else
			ini:= medio+1;
         medio := (ini + fin) div 2 ;
    end;
    if (ini <= fin) and (dato = V[medio]) then
		pos:=medio
	else
		pos:=-1;
end;

var
	V:vEnteros;
	dimL,i,X,p,PRI,ULT:integer;
begin
	randomize;
	dimL:=0;
	cargarRecursivo(V,dimL);
	writeln('DESORDENADO');
	for i:=1 to 20 do
		write('|',V[i]);
	ordenarSeleccion(V,dimL);
	writeln; writeln;
	writeln('ORDENADO');
	for i:=1 to 20 do
		write('|',V[i]);
	writeln; writeln;
	write('Buscar el valor:'); readln(X);
	PRI:=1;
	ULT:=DF;
	busquedaDicotomica(V,PRI,ULT,X,p);
	writeln(p);
end.
