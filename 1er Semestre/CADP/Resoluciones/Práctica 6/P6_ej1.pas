{

Welcome to GDB Online.
GDB online is an online compiler and debugger tool for C, C++, Python, Java, PHP, Ruby, Perl,
C#, OCaml, VB, Swift, Pascal, Fortran, Haskell, Objective-C, Assembly, HTML, CSS, JS, SQLite, Prolog.
Code, Compile, Run and Debug online from anywhere in world.

}
program JugamosConListas;
type
lista = ^nodo;
nodo = record
num : integer;
sig : lista;
end;
procedure armarNodo(var L: lista; v: integer);
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

procedure Incrementar(var l:lista;v:integer);
begin
    while (l <> nil) do begin
        l^.num:=l^.num+v;
        writeln(l^.num);
        l:=l^.sig;
    end;
end;

var
pri : lista;
valor : integer;
begin
pri := nil;
writeln('Ingrese un numero');
read(valor);
while (valor <> 0) do begin
armarNodo(pri, valor); // Va leyendo numeros y los añade al campo num de la lista
writeln('Ingrese un numero');
read(valor);
end;
    Imprimir(pri); // Imprime los valores de la lista, aunque en orden inverso
    writeln('Ingresar un valor para incrementar'); readln(valor);
    Incrementar(pri,valor) // Lo mismo pero imprime los valores en orden inverso
end.