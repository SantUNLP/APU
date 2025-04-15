{

Realizar un programa que lea números enteros desde teclado. La lectura debe finalizar cuando se
ingrese el número 100, el cual debe procesarse. Informar en pantalla:
◦ El número máximo leído.
◦ El número mínimo leído.
◦ La suma total de los números leídos.

}


program p1p2_ej5;
var
    num,min,max,i,sum:integer;
begin
    max:=-9999;
    min:=9999;
    sum:=0;
    repeat
        writeln('Ingresar número: '); readln(num);
        sum:=sum+num;
        if (num > max) then
            max:=num;
        if (num < min) then
            min:=num;
    until (num = 100);
    writeln('El máximo es: ',max);
    writeln('El mínimo es: ',min);
    writeln('La suma es: ',sum);
end.