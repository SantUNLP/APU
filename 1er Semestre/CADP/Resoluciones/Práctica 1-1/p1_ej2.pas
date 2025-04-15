{

Realizar un programa que lea un número real e imprima su valor absoluto. El valor absoluto de un
número X, se escribe |X|

}
program p1_ej2;
var
num:real;
begin
    writeln('Ingrese un número real: '); readln(num);
    if (num < 0) then begin
        num:=num*-1;
        writeln('El valor absoluto es: ',num:0:2);
        end
    else
        writeln('El número ingresado fue: ',num:0:2);
end.
