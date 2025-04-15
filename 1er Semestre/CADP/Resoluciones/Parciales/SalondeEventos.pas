{

Un salon de eventos necesita un programa para administrar la informacion de las reservas
de diciembre de 2023, se dispone de una estructura con la informacion de las reservas. De cada
reserva se conoce: numero de reserva, dni del cliente, dia del evento (1..31), hora de inicio, hora de fin
y categoria de servicio (1..4). Ademas, se dispone de una tabla con el precio por hora de reserva de acuerdo
a cada categoria de servicio

A. generar una estructura con numero y precio total de cada reserva. Esta estructura debe estar ordenada por
numero de reserva
B. informar los dos dias del mes con mayor cantidad de reservas de clientes con DNI par
C. informar el porcentaje de reservas de eventos que inicien antes de las 12hs y se produzcan en la primera
quincena
}
program ParcialEventos;
type
    dias = 1..31;
    categorias = 1..4;
    
    PreciosCat = array [categorias] of real; // Se dispone de una tabla con los precios por categoria
    
    VectorDias = array [dias] of integer; // Inciso B
    
    reserva = record
        num:integer;
        dni: integer;
        dia: dias;
        inicio: integer;
        fin: integer;
        cat:categorias;
    end;
    
    LEventos = ^nodo; // Se dispone de la informacion de las reservas
    
    nodo = record
        dato:reserva;
        sig:LEventos;
    end;
    
    numyprec = record
        num:integer;
        prectot:real;
    end;
    
    LNue = ^Nuenodo; // Inciso A
    
    Nuenodo = record
        dato: numyprec;
        sig:LNue;
    end;

procedure InicializarVContador(var VD:VectorDias);
var
    i:integer;
begin
    for i:=1 to 31 do
        VD[i]:=0;
end;

procedure CargarVPrecios(var VP:PreciosCat);
begin
// Se dispone
end;

procedure CargarLista(var LE:LEventos);
begin
// Se dispone
end;

procedure GenerarNuevaLista(var LN:LNue; Reserva:numyprec);
var
    ant,act,nue:LNue;
begin
    new(nue);
    nue^.dato:=Reserva;
    act:=LN;
    ant:=LN;
    while (act <> NIL) and (act^.dato.num < nue^.dato.num) do begin
        ant:=act;
        act:=act^.sig;
    end;
    if (act = LN) then
        LN:=nue
    else begin
        ant^.sig:=nue;
        nue^.sig:=act;
    end;
end;

function DNIpar(dni:integer):boolean;
var
    dig:integer; espar:boolean;
begin
    espar:=true;
    while (dni <> 0) AND (espar = true) do begin
        dig:=dni MOD 10;
        if (dig MOD 2 = 0) then
            dni:=dni DIV 10
        else
            espar:=false;
    end;
    DNIpar:=espar;
end;

procedure Procesar(LE:LEventos;var LN:LNue; VP:PreciosCat;var VD:VectorDias);
var
    CantReservas,CantQuincena:integer;
    Aux:numyprec;
begin
    CantQuincena:=0; CantReservas:=1; // Aca tira un error si pongo 0, porque no se puede dividir por 0
    while (LE <> NIL) do begin
        Aux.prectot:=0;
        CantReservas:=CantReservas+1;
        if (DNIpar(LE^.dato.dni)) then
            VD[LE^.dato.dia]:=VD[LE^.dato.dia]+1;
        if (LE^.dato.inicio < 12) AND (LE^.dato.dia <= 15) then
            CantQuincena:=CantQuincena+1;
        Aux.prectot:=VP[LE^.dato.cat]*(LE^.dato.fin - LE^.dato.inicio);
        Aux.num:=LE^.dato.num;
        GenerarNuevaLista(LN,Aux); // Inciso A
        LE:=LE^.sig;
    end;
    writeln('Porcentaje de eventos: ',CantQuincena*100/CantReservas:0:2,'%'); // Inciso C
end;

procedure InformarDias(VD:VectorDias);
var
    i,max1,dia1,max2,dia2:integer;
begin
    max1:=-9999; max2:=-9999;
    dia1:=-1; dia2:=-1;
    for i:=1 to 31 do begin
        if (VD[i] > max1) then begin
            max2:=max1;
            dia2:=dia1;
            max1:=VD[i];
            dia1:=i;
        end
        else if (VD[i] > max2) then begin
            max2:=VD[i];
            dia2:=i;
        end;
    end;
    writeln('Los dos dias con mayores reservas de dni par son: ',dia1,' y ',dia2);
end;
var
    LE:LEventos; LN:LNue;
    VPrecios:PreciosCat; VDias:VectorDias;
begin
    LE:=NIL; LN:=NIL;
    InicializarVContador(VDias); // Inciso B
    CargarVPrecios(VPrecios); // Se dispone
    CargarLista(LE); // Se dispone
    Procesar(LE,LN,VPrecios,VDias);
    InformarDias(VDias); // Inciso B
end.
