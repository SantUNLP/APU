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
		writeln(vO[i].cod);
end;

procedure insercion (var vO:vOficinas; DL:integer);
Var
 i,j,actual:integer;
begin
 for i:= 2 to DL do begin 
     actual:= vO[i].cod;
     j:= i-1; 
     while (j > 0) and (vO[j].cod > actual) do      
       begin
         vO[j+1]:= vO[j];
         j:= j-1;                  
       end;  
     vO[j+1].cod:= actual; 
 end;
	for i:=1 to DL do
		writeln(vO[i].cod);
end;

var
	vO:vOficinas;
	dimL:integer;
begin
	dimL:=0;
	cargarVector(vO,dimL);
	insercion(vO,dimL);
end.
