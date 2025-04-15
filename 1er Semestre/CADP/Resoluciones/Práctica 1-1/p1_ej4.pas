{

Realizar un programa que lea un número real X. Luego, deberá leer números reales hasta que se
ingrese uno cuyo valor sea exactamente el doble de X (el primer número leído).

}
program p1_ej4;
var
X,num:real;
begin
    num:=0;
    writeln('Ingresar un número real: '); readln(X);
    while (num*2 <> X) do begin
        writeln('Ingresar un nuevo valor: '); readln(num);
    end;
end.
