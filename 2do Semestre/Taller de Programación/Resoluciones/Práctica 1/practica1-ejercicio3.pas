{Netflix ha publicado la lista de películas que estarán disponibles durante el mes de
diciembre de 2022. De cada película se conoce: código de película, código de género (1: acción,
2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélico, 7: documental y 8: terror) y puntaje
promedio otorgado por las críticas.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Lea los datos de películas, los almacene por orden de llegada y agrupados por código de
género, y retorne en una estructura de datos adecuada. La lectura finaliza cuando se lee el
código de la película -1.
b. Genere y retorne en un vector, para cada género, el código de película con mayor puntaje
obtenido entre todas las críticas, a partir de la estructura generada en a)..
c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos
métodos vistos en la teoría.
d. Muestre el código de película con mayor puntaje y el código de película con menor puntaje,
del vector obtenido en el punto c).}

program p1ej3;
type
	genero=1..8;
	lpeliculas=^nodo;
	
	pelicula=record
		cod:integer;
		codg:genero;
		puntaje:real;
	end;
	
	nodo=record
		dato:pelicula;
		sig:lpeliculas;
	end;
	
	noditos = record
		pri:lpeliculas;
		ult:lpeliculas;
	end;
	
	vPeliculas = array[genero] of noditos;
	
	codypun = record
		cod:integer;
		pun:real;
	end;
	
	vPuntaje=array[genero] of codypun;
	
procedure iniVectorlistas(var vPelis:vPeliculas);
var
	i:integer;
begin
	for i:=1 to 8 do
		vPelis[i].pri:=NIL;
end;
	
procedure inicializarVector(var VP:vPuntaje);
var
	i:integer;
begin
	for i:=1 to 8 do begin
		VP[i].cod:=0;
		VP[i].pun:=0;
	end;
end;

procedure leerPeli(var P:pelicula);
begin
	write('LEER CODIGO: ');readln(P.cod);
	if (P.cod <> -1) then begin
		write('LEER GENERO: ');readln(P.codg);
		write('LEER PUNTAJE: ');readln(P.puntaje);
	end;	
end;

procedure agregarAtras(var PI,PU:lpeliculas; P:pelicula);
var
	nue:lpeliculas;
begin
	new(nue); nue^.dato:=P; nue^.sig:=NIL;
	if (PI = NIL) then
		PI:=nue
	else
		PU^.sig:=nue;
	PU:=nue;
end;

{a. Lea los datos de películas, los almacene por orden de llegada y agrupados por código de
género, y retorne en una estructura de datos adecuada. La lectura finaliza cuando se lee el
código de la película -1.}
procedure cargarVecLista(var vPelis:vPeliculas);
var
	peli:pelicula;
begin
	leerPeli(peli);
	while (peli.cod <> -1) do begin
		agregarAtras(vPelis[peli.codg].pri,vPelis[peli.codg].ult, peli); //En la posición del género de la peli, voy a hacer un agregar atras para mantener el orden, manejo el vector como si fuese una lista.
		leerPeli(peli);
	end;
end;
{b. Genere y retorne en un vector, para cada género, el código de película con mayor puntaje
obtenido entre todas las críticas, a partir de la estructura generada en a)..}
procedure procesarPeliculas(vPelis:vPeliculas; var vPun:vPuntaje);
var
	i:integer;
begin
	for i:=1 to 8 do begin
		while (vPelis[i].pri <> NIL) do begin
			if (vPelis[i].pri^.dato.puntaje > vPun[i].pun) then begin
				vPun[i].pun:=vPelis[i].pri^.dato.puntaje;
				vPun[i].cod:=vPelis[i].pri^.dato.cod;
			end;
			vPelis[i].pri:=vPelis[i].pri^.sig;
		end;
	end;
end;

{c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos
métodos vistos en la teoría.}
procedure ordenarSeleccion(var vPun:vPuntaje);
var i,j,pos:integer;
	item:codypun;	
begin
	for i:=1 to 8-1 do begin {busca el mínimo y guarda en pos la posición}
          pos := i;
          for j := i+1 to 8 do
             if (vPun[j].pun < vPun[pos].pun) then
				pos:=j;
         {intercambia vPun[i] y vPun[p]}
         item := vPun[pos];   
         vPun[pos] := vPun[i];   
         vPun[i]:= item;
	end;
end;

{d. Muestre el código de película con mayor puntaje y el código de película con menor puntaje,
del vector obtenido en el punto c).}
procedure Imprimir(vPun:vPuntaje);
begin
	writeln('|MAYOR PUNTAJE','|CODIGO ',vPun[8].cod,'|PUNTAJE ',vPun[8].pun:0:0,'|');
	writeln('|MENOR PUNTAJE','|CODIGO ',vPun[1].cod,'|PUNTAJE ',vPun[1].pun:0:0,'|');
end;


var
	vPelis:vPeliculas;
	vPun:vPuntaje;
begin
	iniVectorlistas(vPelis);
	inicializarVector(vPun);
	cargarVecLista(vPelis);
	procesarPeliculas(vPelis,vPun);
	ordenarSeleccion(vPun);
	Imprimir(vPun);
end.
