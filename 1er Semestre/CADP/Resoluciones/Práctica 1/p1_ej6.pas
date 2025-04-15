{

Realizar un programa que lea el número de legajo y el promedio de cada alumno de la facultad. La
lectura finaliza cuando se ingresa el legajo -1, que no debe procesarse.

}
program p1_ej6;
var
    legajo:integer;
    prom:real;
begin
    writeln('Ingresar el legajo del alumno: '); readln(legajo);
    while (legajo <> -1) do begin
        writeln('Ingresar el promedio del alumno: '); readln(prom);
        writeln('LEGAJO: ',legajo);
        writeln('PROMEDIO: ',prom:0:2);
        writeln('Ingresar el legajo del alumno: '); readln(legajo);
    end;
end.
