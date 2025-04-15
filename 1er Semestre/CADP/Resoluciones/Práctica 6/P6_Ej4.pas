{

4. Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
a. Máximo: recibe la lista como parámetro y retorna el elemento de valor máximo.
b. Mínimo: recibe la lista como parámetro y retorna el elemento de valor mínimo.
c. Múltiplos: recibe como parámetros la lista L y un valor entero A, y retorna la cantidad de elementos de la
lista que son múltiplos de A.

}
program P6_Ej4;
type
lista = ^nodo;
nodo = record
num : integer;
sig : lista;
end;
procedure agregarAdelante(var L: lista; v: integer);
var
aux : lista;
begin
    new(aux);
    aux^.num := v;
    aux^.sig := L;
    L := aux;
end;

procedure Imprimir(l:lista);
begin
    while(l <> nil) do begin
        writeln(l^.num);
        l:=l^.sig;
    end;
end;

procedure MaximoEnLista(L:lista;var Max:integer);
begin
    Max:=-9999;
    while (L <> nil) do begin
        if(L^.num > Max) then
            Max:=L^.num;
        L:=L^.sig;
    end;
end;

procedure MinimoEnLista(L:lista;var Min:integer);
begin
    Min:=9999;
    while (L <> nil) do begin
        if(L^.num < Min) then
            Min:=L^.num;
        L:=L^.sig;
    end;
end;

procedure Multiplo(L:lista;M:integer;var C:integer);
begin
    while (L <> nil) do begin
        if (L^.num MOD M = 0) then
            C:=C+1;
        L:=L^.sig;
    end;
end;

var
pri : lista;
valor, max, min, mul, cant : integer;
begin
    cant:=0;
    pri := nil;
    writeln('Ingrese un numero');
    readln(valor);
while (valor <> 0) do begin
    agregarAdelante(pri, valor); // Va leyendo numeros y los añade al campo num de la lista
    writeln('Ingrese un numero');
    readln(valor);
end;
    MaximoEnLista(pri,max);
    MinimoEnLista(pri,min);
    writeln('Ingresar un valor entero: ');
    readln(mul);
    Multiplo(pri,mul,cant);
    writeln('El maximo es: ',max);
    writeln('El minimo es: ',min);
    writeln('Cantidad de multiplos de: ',mul,' es ',cant);
end.