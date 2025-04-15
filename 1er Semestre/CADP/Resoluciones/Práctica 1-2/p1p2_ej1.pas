{
   1. Realizar un programa que lea 10 números enteros e informe la suma total de los números leídos.
a. Modifique el ejercicio 1 para que además informe la cantidad de números mayores a 5

}

program p1p2_ej1;
var
sum,num,i:integer;
begin
    sum:=0;
    for i:=1 to 10 do begin
        writeln('Ingresar un número: '); readln(num);
        sum:=sum+num;
    end;
    writeln('La suma es: ',sum);
end.