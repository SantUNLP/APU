{
    1. a. Dado un vector de enteros de a lo sumo 500 valores, realice un módulo que reciba dicho vector y un valor
n y retorne si n se encuentra en el vector o no.
b. Modifique el módulo del inciso a. considerando ahora que el vector se encuentra ordenado de manera
ascendente.
}

program p4p2_ej1;
const
    dimF=500;
type
    vnumeros=array[1..dimF] of integer;
    
procedure cargarV(var vn:vnumeros; var dimL:integer);
var
    num:integer;
begin
    readln(num);
    while (num <> -1) and (dimL < dimF) do begin
        dimL:=dimL+1;
        vn[dimL]:=num;
        readln(num);
    end;
end;

function busqueda(vn:vnumeros;x:integer;dimL:integer):boolean;
var
    i:integer; ok:boolean;
begin
    ok:=false;
    for i:=1 to dimL do begin
        if (vn[i] = x) then
            ok:=true;
    end;
    busqueda:=ok;
end;

var
    vnum:vnumeros;
    n,dl:integer;
begin
    dl:=0;
    cargarV(vnum,dl);
    readln(n);
    if (busqueda(vnum,n,dl) = true) then
        writeln('Se encontro')
    else
        writeln('No se encontro');
end.