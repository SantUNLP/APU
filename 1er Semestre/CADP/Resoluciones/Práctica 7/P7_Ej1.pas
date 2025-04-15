{
Una productora nacional realiza un casting de personas para la selección de actores extras de una
nueva película, para ello se debe leer y almacenar la información de las personas que desean
participar de dicho casting. De cada persona se lee: DNI, apellido y nombre, edad y el código de
género de actuación que prefiere (1: drama, 2: romántico, 3: acción, 4: suspenso, 5: terror). La lectura
finaliza cuando llega una persona con DNI 33555444, la cual debe procesarse.
Una vez finalizada la lectura de todas las personas, se pide:
a. Informar la cantidad de personas cuyo DNI contiene más dígitos pares que impares.
b. Informar los dos códigos de género más elegidos.
c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede no
existir. Invocar dicho módulo en el programa principal.
}


program P7_Ej1;
type
    generos=1..5;
    LActores=^nodo;
pers=record
    dni:integer;
    apeynom:string;
    edad:integer;
    codgen:generos;
end;

nodo=record
dato:pers;
sig:LActores;
end;

Vgeneros=array[generos] of integer;

procedure inicializarvector(var VCG:Vgeneros);
var
    i:integer;
begin
    for i:=1 to 5 do begin
        VCG[i]:=0;
    end;
end;

procedure LeerPersona(var P:pers);
begin
    readln(P.dni);
    readln(P.apeynom);
    readln(P.edad);
    readln(P.codgen);
end;

procedure Agregar(var LA:LActores;P:pers);
var
    nue:LActores;
begin
    new(nue);
    nue^.dato:=P; nue^.sig:=LA;
    LA:=nue;
end;

procedure cargarlista(var LA:LActores);
var
    rpers:pers;
begin
    repeat
        LeerPersona(rpers);
        Agregar(LA, rpers);
    until(rpers.dni = 3355);
end;

function Descomponer(dni:integer):boolean;
var
    dig,imp,par:integer;
begin
    imp:=0; par:=0;
    while (dni <> 0) do begin
        dig:=dni MOD 10;
        if (dig MOD 2 = 0) then
            par:=par+1
        else
            imp:=imp+1;
        dni:=dni DIV 10;
    end;
    Descomponer:=(par > imp);
end;

procedure procesarlista(LA:LActores; var VCG:Vgeneros);
var
    cantPer:integer;
begin
    cantPer:=0;
    while (LA <> NIL) do begin
        VCG[LA^.dato.codgen]:=VCG[LA^.dato.codgen]+1;
        if (Descomponer(LA^.dato.dni)) then
            cantPer:=cantPer+1;
        LA:=LA^.sig;
    end;
    writeln('Cantidad de personas con mas digitos pares que impares en el DNI: ',cantPer);
end;

procedure informargenero(VCG:Vgeneros);
var
    i,max1,max2:integer;
begin
    max1:=-9999; max2:=-9999;
    for i:=1 to 5 do begin
        if (VCG[i] > max1) then begin
            max2:=max1;
            max1:=i;
        end
        else if (VCG[i] > max2) then
            max2:=i;
    end;
    writeln('codigos de genero mas elegidos: ',max1,' y ',max2);
end;

procedure buscaryeliminar(var LA:LActores; DNI:integer);
var
    ant,act:LActores;
begin
    act:=LA;
    while (act <> NIL) and (act^.dato.dni <> dni) do begin
        ant:=act;
        act:=act^.sig;
    end;
    if (act <> NIL) then
        if (act = LA) then begin
            LA:=LA^.sig;
            writeln('Era el primer nodo, se pudo.'); // Validaciones extras, NO NECESARIAS
        end
        else begin
            ant^.sig:=act^.sig;
            dispose(act);
            writeln('Enlace correcto, se pudo.'); // Validaciones extras, NO NECESARIAS
        end
    else
        writeln('No se encontro el dni: ',dni,' en la lista'); // Validaciones extras, NO NECESARIAS
end;

var
    LA:LActores;
    VCodGen:Vgeneros;
    DNI:integer;
begin
    LA:=NIL;
    inicializarvector(VCodGen);
    cargarlista(LA);
    procesarlista(LA,VCodGen);
    informargenero(VCodGen);
    readln(DNI);
    buscaryeliminar(LA,DNI);
end.
