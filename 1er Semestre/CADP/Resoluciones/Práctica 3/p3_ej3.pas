{

El Ministerio de Educación desea realizar un relevamiento de las 2400 escuelas primarias de la provincia de Bs. As,
con el objetivo de evaluar si se cumple la proporción de alumnos por docente calculada por la UNESCO para el año
2015 (1 docente cada 23,435 alumnos). Para ello, se cuenta con información de: CUE (código único de
establecimiento), nombre del establecimiento, cantidad de docentes, cantidad de alumnos, localidad. Se pide
implementar un programa que procese la información y determine:
● Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por UNESCO.
● CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos.
El programa debe utilizar:
a) Un módulo para la lectura de la información de la escuela.
b) Un módulo para determinar la relación docente-alumno (esa relación se obtiene del cociente entre la cantidad
de alumnos y la cantidad de docentes).

}

program p3_ej3;
type
    escuela = record
        cue:integer;
        nombre:string;
        docente:integer;
        alumno:integer;
        localidad:string;
    end;

procedure leerescuela(var e:escuela);
begin
    writeln('Ingresar CUE de la escuela: '); readln(e.cue);
    writeln('Ingresar nombre de la escuela: '); readln(e.nombre);
    writeln('Ingresar docentes de la escuela: '); readln(e.docente);
    writeln('Ingresar alumnos de la escuela: '); readln(e.alumno);
    writeln('Ingresar localidad de la escuela: '); readln(e.localidad);
end;

function cociente(e:escuela):real;
begin
    cociente:=e.alumno DIV e.docente;
end;

procedure procesar(rel:real;var relesc1,relesc2:real ; e:escuela ;var em1,em2:escuela);
begin
    if (rel > relesc1) then begin
        relesc2:=relesc1;
        relesc1:=rel;
        em2:=em1;
        em1:=e;
        end
    else if (rel > relesc2) then begin
        relesc2:=rel;
        em2:=e;
        end
end;

var
    escue,emejor1,emejor2:escuela;
    i,cantsup:integer;
    relac,relescue1,relescue2:real;
begin
    cantsup:=0; // Inicializo el contador
    relescue1:=-1; relescue2:= -1; // Inicializo los maximos para la relación
    for i:=1 to 3 do begin // Cambiarlo a 2400
    leerescuela(escue); // inciso a
    relac:= cociente(escue); // inciso b
    if(relac > 23.435) then // Si se cumple es pq es mayor a la sugerida por la UNESCO
        cantsup:=cantsup+1;
    procesar(relac,relescue1,relescue2,escue,emejor1,emejor2); // Saco las dos escuelas con mayor relacion
    end;
    writeln('Cantidad de escuelas con relacion superior a la sugerida por la UNESCO: ','|',cantsup,'|');
    writeln('CUE y nombre de las escuelas con mejor relación:');
    writeln('|CUE 1: ',emejor1.cue,'|NOMBRE 1: ',emejor1.nombre,'|');
    writeln('|CUE 2: ',emejor2.cue,'|NOMBRE 2: ',emejor2.nombre,'|');
    
end.