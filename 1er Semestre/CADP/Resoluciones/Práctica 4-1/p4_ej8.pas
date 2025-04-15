{
Realizar un programa que lea y almacene la información de 400 alumnos ingresantes a la Facultad de
Informática de la UNLP en el año 2020. De cada alumno se lee: nro de inscripción, DNI, apellido, nombre y
año de nacimiento. Una vez leída y almacenada toda la información, calcular e informar:
a) El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
b) Apellido y nombre de los dos alumnos de mayor edad.
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
    
procedure cargarv(var va:valumno; var cantp:integer);
var
    auxalu:alumno;
    i:integer;
begin
    for i:=1 to dimf do begin
        writeln('Ingresar numero de inscripcion: '); readln(auxalu.insc);
        writeln('Ingresar dni: '); readln(auxalu.dni);
        if (procesardni(auxalu.dni) = true) then
            cantp:=cantp+1;
        writeln('ingresar apellido: '); readln(auxalu.ape);
        writeln('ingresar nombre: '); readln(auxalu.nom);
        writeln('ingresar nacimiento: ');readln(auxalu.nac);
        va[i]:=auxalu;
    end;
end;

procedure procesarnyp(va:valumno;var a1,a2:alumno);
var
    i:integer;
begin
    for i:=1 to dimF do begin
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
    cantpares:integer;
begin
    alu1.nac:=-1; alu2.nac:=-1;
    cantpares:=0;
    cargarv(valu,cantpares);
    procesarnyp(valu,alu1,alu2);
    writeln((cantpares/dimF*100):0:0,'%');
    writeln(alu1.ape,' ',alu1.nom);
    writeln(alu2.ape,' ',alu2.nom);
end.