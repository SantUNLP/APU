{

2. Realice un programa que lea 10 números e informe cuál fue el mayor número leído.
}


program p1p2_ej2;
var
    num,max,i:integer;
begin
    max:=-99;
    for i:=1 to 10 do begin
        writeln('Ingresar un número: '); readln(num);
        if (num > max) then
            max:=num;
    end;
    writeln('El número mayor leído fue: ',max);
end.

