{

Welcome to GDB Online.
GDB online is an online compiler and debugger tool for C, C++, Python, Java, PHP, Ruby, Perl,
C#, OCaml, VB, Swift, Pascal, Fortran, Haskell, Objective-C, Assembly, HTML, CSS, JS, SQLite, Prolog.
Code, Compile, Run and Debug online from anywhere in world.

}
program P6_Ej3a;
type
lista = ^nodo;
nodo = record
num : integer;
sig : lista;
end;
procedure agregarAtras(var PI,PU: lista; v: integer);
var
    nuevo: lista;
begin
    new(nuevo);
    nuevo^.num := v;
    nuevo^.sig := nil;
    if (PI = nil) then begin // Cuando la lista esta vacia
        PI := nuevo;
        PU := nuevo;
        end
    else begin
        PU^.sig:=nuevo;
        PU:=nuevo;
        end
end;

procedure Imprimir(l:lista);
begin
    while(l <> nil) do begin
        writeln(l^.num);
        l:=l^.sig;
    end;
end;

procedure Incrementar(var l:lista;v:integer);
begin
    while (l <> nil) do begin
        l^.num:=l^.num+v;
        writeln(l^.num);
        l:=l^.sig;
    end;
end;

var
pri, ult : lista;
valor : integer;
begin
    pri := nil;
    ult := nil;
    writeln('Ingrese un numero');
    readln(valor);
    while (valor <> 0) do begin
        agregarAtras(pri, ult, valor); // Va leyendo numeros y los añade al campo num de la lista
        writeln('Ingrese un numero');
        readln(valor);
    end;
    Imprimir(pri); // Imprime los valores de la lista, en orden en el que fueron agregados
    writeln('Ingresar un valor para incrementar'); readln(valor);
    Incrementar(pri,valor); // Imprime con el incremento
end.