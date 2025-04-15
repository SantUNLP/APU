{
   1. Realizar un programa que lea 10 números enteros e informe la suma total de los números leídos.
a. Modifique el ejercicio 1 para que además informe la cantidad de números mayores a 5

}

program p1p2_ej1;
var
sum,cant,num,i:integer;
begin
    sum:=0;
    for i:=1 to 10 do begin
        writeln('Ingresar un número: '); readln(num);
        sum:=sum+num;
        if (num > 5) then
            cant:=cant+1;
    end;
    writeln('La suma es: ',sum);
    writeln('Cantidad de números mayores a 5: ',cant);
end.