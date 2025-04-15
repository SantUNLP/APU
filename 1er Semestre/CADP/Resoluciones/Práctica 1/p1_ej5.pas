{

Realizar un programa que lea un número real X. Luego, deberá leer números reales hasta que se
ingrese uno cuyo valor sea exactamente el doble de X (el primer número leído).

Modifique el ejercicio anterior para que, luego de leer el número X, se lean a lo sumo 10 números
reales. La lectura deberá finalizar al ingresar un valor que sea el doble de X, o al leer el décimo
número, en cuyo caso deberá informarse “No se ha ingresado el doble de X”
}
program p1_ej5;
var
cont:integer;
X,num:real;
begin
    num:=0;
    cont:=0;
    writeln('Ingresar un número real: '); readln(X);
    while (num*2 <> X) AND (cont <> 10) do begin
        writeln('Ingresar un nuevo valor: '); readln(num);
        cont:=cont+1;
    end;
    if (cont = 10) then
        writeln('No se leyó el doble de X')
    else
        writeln('Se leyó el doble de X');
end.
