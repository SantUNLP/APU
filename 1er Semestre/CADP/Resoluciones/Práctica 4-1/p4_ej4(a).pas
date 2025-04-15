{

4. Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:
a) posicion: dado un número X y el vector de números, retorna la posición del número X en dicho vector,
o el valor -1 en caso de no encontrarse.
b) intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo vector
donde se intercambiaron los valores de las posiciones x e y.
c) sumaVector: retorna la suma de todos los elementos del vector.
d) promedio: devuelve el valor promedio de los elementos del vector.
e) elementoMaximo: retorna la posición del mayor elemento del vector
f) elementoMinimo: retorna la posicion del menor elemento del vector

}
program p4_ej4;
const
    dimF=100;
type
    vnums=array[1..dimF] of integer;
    
procedure cargarv (var vn:vnums);
var
    i:integer;
begin
    for i:=1 to dimF do begin
        vn[i]:=i;
    end;
end;

procedure posicion(vn:vnums;n:integer;var p:integer);
var
    i:integer;
begin
    for i:=1 to dimF do begin
        if (vn[i] = n) then
            p:=i;
    end;
end;

var
    vecn:vnums;
    x,pos:integer;
begin
    pos:=-1;
    cargarv(vecn);
    writeln('Ingresar numero X: '); readln(x);
    posicion(vecn,x,pos);
    if (pos > 0) then
        writeln('Se encontro el numero en la posicion: ',pos)
    else
        writeln(pos);
end.
