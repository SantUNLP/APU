{

3. Se dispone de un vector con números enteros, de dimensión física dimF y dimensión lógica dimL.
a) Realizar un módulo que imprima el vector desde la primera posición hasta la última.
b) Realizar un módulo que imprima el vector desde la última posición hasta la primera.
c) Realizar un módulo que imprima el vector desde la mitad (dimL DIV 2) hacia la primera posición, y
desde la mitad más uno hacia la última posición.
d) Realizar un módulo que reciba el vector, una posición X y otra posición Y, e imprima el vector desde la
posición X hasta la Y. Asuma que tanto X como Y son menores o igual a la dimensión lógica. Y considere
que, dependiendo de los valores de X e Y, podría ser necesario recorrer hacia adelante o hacia atrás.
e) Utilizando el módulo implementado en el inciso anterior, vuelva a realizar los incisos a, b y c.

}
program Ej3;
const
    DIMF=4;
type
    VEnteros=array[1..DIMF] of integer;
    
procedure CargarVector(var VE:VEnteros;var DIML:integer); // Se dispone
var
    num:integer;
begin
    readln(num);
    while (DIML < DIMF) and (num <> -1) do begin
        DIML:=DIML+1;
        VE[DIML]:=num;
        readln(num);
    end;
end;

procedure ImprimirPrimero(VE:VEnteros; DIML:integer);
var
    i:integer;
begin
    for i:=1 to DIML do begin
        writeln(VE[i]);
    end;
end;

procedure ImprimirUltimo(VE:VEnteros; DIML:integer);
var
    i:integer;
begin
    for i:=DIML downto 1 do begin
        writeln(VE[i]);
    end;
end;

procedure ImprimirMitad(VE:VEnteros;DIML:integer);
var
    i:integer;
begin
    for i:=(DIML DIV 2) downto 1 do begin
        writeln(VE[i]);
    end;
    for i:=(DIML DIV 2)+1 to DIML do begin
        writeln(VE[i]);
    end;
end;

procedure ImprimirXY(VE:VEnteros;DIML,X,Y:integer);
var
    i:integer;
begin
    if (X < Y) then
        for i:=X to Y do
            writeln(VE[i])
    else
        for i:=X downto Y do
            writeln(VE[i]);
        
end;
    
var
    VE:VEnteros;
    DIML,X,Y:integer;
begin
    DIML:=0;
    CargarVector(VE,DIML); // Se dispone
    ImprimirPrimero(VE,DIML);
    ImprimirUltimo(VE,DIML);
    ImprimirMitad(VE,DIML);
    readln(X);
    readln(Y);
    ImprimirXY(VE,DIML,X,Y);
end.
