{
    3. Una empresa de transporte de caudales desea optimizar el servicio que brinda a sus clientes. Para ello,
cuenta con información sobre todos los viajes realizados durante el mes de marzo. De cada viaje se cuenta
con la siguiente información: día del mes (de 1 a 31), monto de dinero transportado y distancia recorrida
por el camión (medida en kilómetros).
a. Realizar un programa que lea y almacene la información de los viajes (a lo sumo 200). La lectura finaliza
cuando se ingresa una distancia recorrida igual a 0 km, que no debe procesarse.
b. Realizar un módulo que reciba el vector generado en a) e informe:
- El monto promedio transportado de los viajes realizados
- La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero.
- La cantidad de viajes realizados cada día del mes.
c. Realizar un módulo que reciba el vector generado en a) y elimine todos los viajes cuya distancia
recorrida sea igual a 100 km.
Nota: para realizar el inciso b, el vector debe recorrerse una única vez.
}

program p4p2_ej3;
const
    DF = 200;
type
    dias = 1..31;
    viaje = record
        dia:dias;
        monto:real;
        distancia:integer;
    end;
    vviajes = array [1..DF] of viaje;
    vdias = array [dias] of integer;

procedure InicializarVector(var vecdias:vdias);
var
    i:integer;
begin
    for i:=1 to 31 do begin
        vecdias[i]:=0;
        end;
end;

procedure LeerViaje(var aux:viaje);
begin
    writeln('Ingresar distancia: '); readln(aux.distancia);
    if (aux.distancia <> 0) then begin
        writeln('Ingresar dia: '); readln(aux.dia);
        writeln('Ingresar monto: '); readln(aux.monto);
    end;
end;

procedure CargarVector(var vecvi:vviajes; var DL:integer);
var
    aux:viaje;
begin
    LeerViaje(aux);
    while (DL < DF) and (aux.distancia <> 0) do begin
        DL:=DL+1;
        vecvi[DL]:=aux;
        LeerViaje(aux);
    end;
end;

procedure CalcularMin(rviajes:viaje;var minviaje:viaje);
begin
    if (rviajes.monto < minviaje.monto) then
        minviaje:=rviajes;
end;

procedure Procesar(vecvi:vviajes;DL:integer;vecdias:vdias);
var
    montototal:real;
    i:integer;
    minviaje:viaje;
begin
    montototal:=0;
    minviaje.monto:=9999;
    for i:=1 to DL do begin
        montototal:=montototal+vecvi[i].monto;
        CalcularMin(vecvi[i],minviaje);
        vecdias[vecvi[i].dia]:=vecdias[vecvi[i].dia]+1;
    end;
    writeln('Monto promedio: ',montototal/DL:0:2);
    writeln('Distancia y Dia en el que se registro menor dinero: ',minviaje.distancia,' ',minviaje.dia);
    for i:=1 to 31 do begin
        write(vecdias[i],',');
    end;
        writeln('');
end;

procedure Eliminar100KM(var vecvi:vviajes; var DL:integer);
var
    i,j:integer;
begin
    for i:=1 to DL do begin
        if(vecvi[i].distancia = 100) then begin // Si la distancia es 100, elimino el contenido de ese vaije
            vecvi[i]:=vecvi[i+1];
            DL:=DL-1;
            for j:=i to DL do begin // Si elimine, corro hacia la izquierda el vector
                vecvi[j]:=vecvi[j+1];
            end;
            writeln('Se elimino con exito');
            end
        else
            writeln('No se elimino');
    end;
end;

var
    vecvi:vviajes;
    DL:integer;
    vecdias:vdias;
begin
    DL:=0;
    InicializarVector(vecdias);
    CargarVector(vecvi,DL); // Inciso A
    Procesar(vecvi,DL,vecdias); // Inciso B
    Eliminar100KM(vecvi,DL); // Inciso C
end.


