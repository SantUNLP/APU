{

2. Realice un programa que resuelva los siguientes incisos:
a. Lea nombres de alumnos y los almacene en un vector de a lo sumo 500 elementos. La lectura finaliza
cuando se lee el nombre ‘ZZZ’, que no debe procesarse.
b. Lea un nombre y elimine la primera ocurrencia de dicho nombre en el vector.
c. Lea un nombre y lo inserte en la posición 4 del vector.
d. Lea un nombre y lo agregue al vector.
Nota: Realizar todas las validaciones necesarias.

}


program p4p2_ej2;
const
    dimF=500;
type
    vnombres=array[1..dimF] of string;

procedure leervector(var vn:vnombres;var DL:integer);
var
    nom:string;
begin
    writeln('Ingresar un nombre:'); readln(nom);
    while (nom <> 'ZZZ') and (DL < dimF) do begin
        DL:=DL+1;
        vn[DL]:=nom;
        writeln('Ingresar un nombre:'); readln(nom);
    end;
end;

procedure eliminar(var vn:vnombres;var DL:integer;elim:string);
var
    i,aux:integer;
    encontro:boolean;
begin
    encontro:=false;
    aux:=1;
    while (encontro = false) and (aux <= DL) do begin
        if (vn[aux] = elim) then begin
            encontro:=true;
            vn[aux]:='';
            DL:=DL-1;
            end
        else
            aux:=aux+1;
    end;
    for i:=aux to (DL-1) do begin
        vn[i]:=vn[i+1];
    end;
    
    if (encontro = true) then
        writeln('Se elimino')
    else
        writeln('No se ha encontrado');
end;

procedure insertar(var vn:vnombres;ni:string;var DL:integer);
var
    i:integer;
begin
    if(DL < 4) then begin
        vn[4]:=ni+' <- INSERTADO';
        DL:=4;
        end
    else
        if (DL+1 < dimF) then begin
        for i:=DL downto 4 do begin
            vn[DL+1]:=vn[DL];
        end;
        vn[4]:=ni+' <- INSERTADO';
        end
end;

procedure agregar(var vn:vnombres;na:string;var DL:integer);
begin
    if (DL+1 < dimF) then begin
        DL:=DL+1;
        vn[DL]:=na+' <- AGREGADO';
        end
    else
        writeln('NO SE PUEDE AGREGAR - Dimension Fisica Completa');
        
end;


var
    vnom:vnombres;
    nelimin,ninsert,nagreg:string;
    dimL,i:integer;
begin
    dimL:=0;
    leervector(vnom,dimL);
    writeln('Ingresar un nombre para eliminarlo: '); readln(nelimin);
    eliminar(vnom,dimL,nelimin);
    writeln('Ingresar un nombre para insertarlo: '); readln(ninsert);
    insertar(vnom,ninsert,dimL);
    writeln('Ingresar un nombre para agregarlo: '); readln(nagreg);
    agregar(vnom,nagreg,dimL);
    writeln('------------------------------------------');
    writeln('Si hay espacios vacios es porque tiene basura!');
    for i:=1 to dimL do begin // verifico que se hayan hecho los incisos a. eliminar b. insertar c. agregar
        writeln(vnom[i]);
    end;
end.

