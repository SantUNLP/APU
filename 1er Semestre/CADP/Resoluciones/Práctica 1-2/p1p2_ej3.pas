{

3. Realizar un programa que lea desde teclado la información de alumnos ingresantes a la carrera
Analista en TIC. De cada alumno se lee nombre y nota obtenida en el módulo EPA (la nota es un
número entre 1 y 10). La lectura finaliza cuando se lee el nombre “Zidane Zinedine“, que debe
procesarse. Al finalizar la lectura informar:
- La cantidad de alumnos aprobados (nota 8 o mayor) y
- la cantidad de alumnos que obtuvieron un 7 como nota
}


program p1p2_ej3;
var
    nombre:string;
    cantap8,cant7,nota: integer;
begin
    cantap8:=0;
    cant7:=0;
    repeat
        writeln('Ingresar nombre: '); readln(nombre);
        writeln('Ingresar nota: '); readln(nota);
        if (nota = 7) then
            cant7:=cant7+1
        else if (nota >= 8) then
            cantap8:=cantap8+1;
    until(nombre = 'Zidane Zinedine');
    writeln('Cantidad de alumnos aprobados con 8 o más: ',cantap8);
    writeln('Cantidad de alumnos aprobados con 7: ',cant7);
end.