{

10. Realizar un programa que lea y almacene el salario de los empleados de una empresa de turismo (a lo
sumo 300 empleados). La carga finaliza cuando se lea el salario 0 (que no debe procesarse) o cuando se
completa el vector. Una vez finalizada la carga de datos se pide:
a) Realizar un módulo que incremente el salario de cada empleado en un 15%. Para ello, implementar un
módulo que reciba como parámetro un valor real X, el vector de valores reales y su dimensión lógica y
retorne el mismo vector en el cual cada elemento fue multiplicado por el valor X.
b) Realizar un módulo que muestre en pantalla el sueldo promedio de los empleados de la empresa.
}


program p4_ej10;
const
    dimF=300;
type
    vempleado=array[1..dimF] of real;

procedure cargarvector(var ve:vempleado; var dl:integer);
var
    sueldo:real;
begin
    dl:=0;
    writeln('Ingresar un sueldo: '); readln(sueldo);
    while (dl < dimF) and (sueldo <> 0) do begin
        dl:=dl+1;
        ve[dl]:=sueldo;
        writeln('Ingresar un sueldo: '); readln(sueldo);
    end;
end;

procedure incremento(var ve:vempleado;dl:integer;inc:real);
var
    i:integer;
begin
    for i:=1 to dl do begin
        ve[i]:=ve[i]*inc;
    end;
end;

procedure promedio(ve:vempleado;dl:integer);
var
    total:real;
    i:integer;
begin
    total:=0;
    for i:=1 to dl do begin
        total:=total+ve[i];
    end;
    writeln('Sueldo promedio: ',total/dl:0:2,'$');
end;

var
    vemp:vempleado;
    dimL:integer;
    valor:real;
begin
    cargarvector(vemp,dimL); // lectura del vector
    writeln('Ingresar un valor X'); readln(valor);
    incremento(vemp,dimL,valor); // inciso a
    promedio(vemp,dimL);
end.

