{El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de
las expensas de dichas oficinas.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
a. Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina
se ingresa el código de identificación, DNI del propietario y valor de la expensa. La lectura
finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.
b. Ordene el vector, aplicando el método de inserción, por código de identificación de la
oficina.
c. Ordene el vector aplicando el método de selección, por código de identificación de la oficina.}

program p1ej2;
const
	dimF=300;
type
	oficina = record
		cod:integer;
		dni:integer;
		valor:real;
	end;
	
	vOficinas=array[1..dimF] of oficina;
	
procedure LeerOficina(var O:oficina);
begin
	writeln('Leer codigo');readln(O.cod);
	if (O.cod <> -1) then begin
		writeln('Leer dni');readln(O.dni);
		writeln('Leer valor');readln(O.valor);
	end;
end;
	
procedure CargarVector(var vO:vOficinas;var DL:integer);
var
	Ofi:oficina;
	i:integer;
begin
	LeerOficina(Ofi);
	while (Ofi.cod <> -1) AND (DL < 50) do begin
		DL:=DL+1;
		vO[DL]:=Ofi;
		LeerOficina(Ofi);
	end;
	for i:=1 to DL do
		writeln('Orden original: ',vO[i].cod);
end;

procedure seleccion (var vO:vOficinas; DL:integer);
Var
 i,j,pos:integer;
 item:oficina;
begin
 for i:=1 to (DL-1) do begin {busca el mínimo y guarda en pos la posición}
          pos := i;
          for j := i+1 to DL do
             if vO[j].cod < vO[pos].cod then
				pos:=j;
         {intercambia v[i] y v[p]}
         item := vO[pos];
         vO[pos] := vO[i];
         vO[i] := item;
 end;
	for i:=1 to DL do
		writeln('Ordenado: ',vO[i].cod);
end;

var
	vO:vOficinas;
	dimL:integer;
begin
	dimL:=0;
	cargarVector(vO,dimL);
	seleccion(vO,dimL);
end.
