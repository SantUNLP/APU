{

2. Realice un programa que lea 10 números e informe cuál fue el mayor número leído.
Modifique el programa anterior para que, además de informar el mayor número leído, se
informe el número de orden, dentro de la secuencia, en el que fue leído. Por ejemplo, si se lee la
misma secuencia:
}


program p1p2_ej2a;
var
    num,max,i,pos:integer;
begin
    max:=-99;
    for i:=1 to 10 do begin
        writeln('Ingresar un número: '); readln(num);
        if (num > max) then begin
            max:=num;
            pos:=i;
            end;
    end;
    writeln('El número mayor leído fue: ',max,' en la posición: ',pos);
end.

