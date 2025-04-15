{

Realizar un programa que lea 3 números enteros y los imprima en orden descendente.

}
program p1_ej3;
var
num1,num2,num3,aux:integer;
begin
    writeln('Ingresar primer número'); readln(num1);
    writeln('Ingresar segundo número'); readln(num2);
    writeln('Ingresar tercer número'); readln(num3);
    if (num1 = num2) and (num1 = num3) then
        writeln('Son iguales')
    else
    if (num1 < num3) then begin
        aux:=num3; // Auxiliar = Num3
        num3:=num1; // Num3 = Num1
        num1:=aux; // Num1 = Auxiliar
    end;
    if (num1 < num2) then begin
        aux:=num2; // Auxiliar = Num2
        num2:=num1; // Num2 = Num1
        num1:=aux; // Num1 = Auxiliar
    end;
    if (num2 < num3) then begin
        aux:=num3;
        num3:=num2;
        num2:=aux;
    end;
    writeln('Los números ordenados son: ',num1,' ',num2,' ',num3);
end.
