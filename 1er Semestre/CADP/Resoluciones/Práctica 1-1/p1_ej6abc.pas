{

Realizar un programa que lea el número de legajo y el promedio de cada alumno de la facultad. La
lectura finaliza cuando se ingresa el legajo -1, que no debe procesarse.

a. La cantidad de alumnos leída (en el ejemplo anterior, se debería informar 2).
b. La cantidad de alumnos cuyo promedio supera 6.5 (en el ejemplo anterior, se debería informar
1).
c. El porcentaje de alumnos destacados (alumnos con promedio mayor a 8.5) cuyo legajo sean
menor al valor 2500 (en el ejemplo anterior se debería informar 0%).


}
program p1_ej6;
var
    legajo,cantalu,cantaludes,cantprom:integer;
    prom,porc:real;
begin
    cantalu:=0;
    cantprom:=0;
    cantaludes:=0;
    porc:=0;
    writeln('Ingresar el legajo del alumno: '); readln(legajo);
    while (legajo <> -1) do begin
        cantalu:=cantalu+1;
        writeln('Ingresar el promedio del alumno: '); readln(prom);
        if (prom > 6.5) then
            cantprom:=cantprom+1;
        if (prom > 8.5) AND (legajo < 2500) then
            cantaludes:=cantaludes+1;
        writeln('LEGAJO: ',legajo);
        writeln('PROMEDIO: ',prom:0:2);
        writeln('Ingresar el legajo del alumno: '); readln(legajo);
    end;
    porc:=cantaludes/cantalu*100;
    writeln('Cantidad de alumnos leída: ',cantalu);
    writeln('Cantidad de alumnos con promedio mayor a 6.5: ',cantprom);
    writeln('Porcentaje de alumnos destacados: ',porc:0:2,'%');
end.
