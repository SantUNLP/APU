
program p4_ej7;
const
    dimF=9;
type
    vnumeros=array[0..dimF] of integer;
    
procedure cargarvector(var vn:vnumeros);
var
    i:integer;
begin
    for i:=1 to dimF do begin
        vn[i]:=0;
    end;
end;

procedure procesarvector(var vn:vnumeros;n:integer);
var
    dig:integer;
begin
    while (n <> 0) do begin
        dig:=n mod 10;
        vn[dig]:=vn[dig]+1;
        n:= n div 10;
    end;
end;

procedure informar(vn:vnumeros);
var
    i,maxl,numl,dimL:integer;
    vaux:vnumeros;
begin
    dimL:=0;
    maxl:=0;
    for i:=1 to dimF do begin
        if (vn[i] > 0) then
        writeln('Ocurrencias del numero: ',i,' son: ',vn[i])
        else if (vn[i] = 0) then begin
            dimL:=dimL+1;
            vaux[dimL]:=i;
            end;
        if (vn[i] > maxl) then begin
            maxl:=vn[i];
            numl:=i;
        end;
    end;
    writeln('El mayor numero leido fue: ',numl);
    write('Numeros sin ocurrencias:');
    for i:=0 to dimL do begin
        write(' ',vaux[i]);
    end;
end;

var
    num:integer;
    vnum:vnumeros;
begin
    cargarvector(vnum);
    writeln('Ingresar un numero');
    readln(num);
    while (num <> -1) do begin
        procesarvector(vnum,num);
        writeln('Ingresar un numero');
        readln(num);
    end;
        informar(vnum);
end.
