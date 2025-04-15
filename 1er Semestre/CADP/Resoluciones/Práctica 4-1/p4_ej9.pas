{
Realizar un programa que lea y almacene la información de 400 alumnos ingresantes a la Facultad de
Informática de la UNLP en el año 2020. De cada alumno se lee: nro de inscripción, DNI, apellido, nombre y
año de nacimiento. Una vez leída y almacenada toda la información, calcular e informar:
a) El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
b) Apellido y nombre de los dos alumnos de mayor edad.

9. Modificar la solución del punto anterior considerando que el programa lea y almacene la información de a
lo sumo 400 alumnos. La lectura finaliza cuando se ingresa el DNI -1 (que no debe procesarse).
}

program p4_ej8;
const
    dimF=2;
type
    alumno=record
        insc:integer;
        dni:integer;
        ape:string;
        nom:string;
        nac:integer;
    end;
    valumno=array[1..dimF] of alumno;
    
function procesardni(dni:integer):boolean;
var
    dig:integer;
begin
    while (dni <> 0) do begin
        dig:=dni mod 10;
        if (dig mod 2 = 0) then
            procesardni:=true
        else
            procesardni:=false;
        dni:= dni div 10;
    end;
end;

procedure leeralu(var a:alumno);
begin
    writeln('ingresar inscripcion: '); readln(a.insc);
    writeln('ingresar dni: '); readln(a.dni);
    writeln('ingresar ape: '); readln(a.ape);
    writeln('ingresar nom: '); readln(a.nom);
    writeln('ingresar nac: '); readln(a.nac);
end;
    
procedure cargarv(var va:valumno; var cantp:integer; var dimL:integer);
var
    auxalu:alumno;
begin
    leeralu(auxalu);
    while (auxalu.dni <> -1) and (dimL < dimF) do begin
        dimL:=dimL+1;
        va[dimL]:=auxalu;
        if (procesardni(auxalu.dni) = true) then
            cantp:=cantp+1;
        leeralu(auxalu);
    end;
end;

procedure procesarnyp(va:valumno;var a1,a2:alumno;dimL:integer);
var
    i:integer;
begin
    for i:=1 to dimL do begin
        if (va[i].nac > a1.nac) then begin
            a2:=a1;
            a1:=va[i];
            end
        else if (va[i].nac > a2.nac) then
            a2:=va[i];
    end;
end;
    
var
    valu:valumno;
    alu1,alu2:alumno;
    cantpares,dL:integer;
begin
    dL:=0;
    alu1.nac:=-1; alu2.nac:=-1;
    cantpares:=0;
    cargarv(valu,cantpares,dL);
    procesarnyp(valu,alu1,alu2,dL);
    writeln((cantpares/dL*100):0:0,'%');
    writeln(alu1.ape,' ',alu1.nom);
    writeln(alu2.ape,' ',alu2.nom);
end.