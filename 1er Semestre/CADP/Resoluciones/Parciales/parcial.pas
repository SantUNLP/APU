{
    Una empresa de venta de tickets de tren está analizando la
    información de los viajes realizados por sus trenes
    durante el año 2022. Para ello, se dispone de una estructura
    de datos con la información de todos los viajes.
    De cada viaje se conoce el código de tren, el mes en que se realizó
    el viaje (entre 1 y 12), la cantidad de pasajeros que viajaron,
    y el código de la ciudad de destino (entre 1 y 20). La información se
    encuentra ordenada por código de tren.
    Además, la empresa dispone de una estructura de datos con información
    del costo del ticket por ciudad destino.
    
    A. Generar una lista que tenga por cada código del tren, la cantidad de viajes realizados
    B. Informe el mes con mayor monto recaudado
    C. COMPLETO: Informe el promedio de pasajeros por cada tren entre todos sus viajes
}

program PARCIAL;
type // Declaración de todos los tipos de datos que necesito para resolver los incisos
// Otros tipos de datos seran LOCALES a los procesos
    Rangomes=1..12;
    Rangociu=1..20;
    
    Lviaje=^Nodov;
    
    Lnueva=^Nodonue;
    
    Viajes=record
        Codtren:integer;
        Mes:RangoMes;
        Cantpas:integer;
        Codciu:Rangociu;
    end;
    
    Codyviaje=record
        Codtren:integer;
        Cantviaje:integer;
    end;
    
    Vcosto=array [Rangociu] of real;
    Vmes=array [RangoMes] of real;
    
    Nodov=record
        Dato:Viajes;
        Sig:Lviaje;
    end;
    
    Nodonue=record
        Dato:Codyviaje;
        Sig:Lnueva;
    end;

procedure InicializarVmeses(var VM:vmes);
var
    i:integer;
begin
    for i:=1 to 12 do begin
        VM[i]:=0;
    end;
end;

procedure CargarVprecios(var VP:Vcosto);
begin
    //SE DISPONE
end;

procedure CargarLviajes(var LV:Lviaje);
begin
    // SE DISPONE
end;

procedure GenerarLista(var LN:Lnueva; Dato:Codyviaje);
var
    Ant,Act,Nue:Lnueva;
begin
    new(Nue);
    Nue^.Dato:=Dato;
    Nue^.Sig:=LN;
    LN:=Nue;
end;
    
procedure Procesar(LV:Lviaje; var LN:Lnueva; var VM:Vmes; var VP:Vcosto);
var
    Totalpas,Cantv,Codact:integer;
    Rcodyviaje:Codyviaje;
    Prom:real;
begin
    while (LV <> NIL) do begin
        Codact:=LV^.Dato.Codtren;
        Cantv:=0; Totalpas:=0; Prom:=0;
        while (LV <> NIL) AND (LV^.Dato.Codtren = Codact) do begin
            Cantv:=Cantv+1;
            Totalpas:=Totalpas+LV^.Dato.Cantpas;
            VM[LV^.Dato.Mes]:=VM[LV^.Dato.Mes]+VP[LV^.Dato.Codciu]*LV^.Dato.Cantpas;
            LV:=LV^.Sig;
        end;
        Prom:=Totalpas/Cantv;
        Rcodyviaje.Codtren:=Codact;
        Rcodyviaje.Cantviaje:=Cantv;
        // Uso este registro como auxiliar!
        GenerarLista(LN,Rcodyviaje); // Inciso A
        Writeln('El promedio de pasajeros entre todos sus viajes es: ',Prom:0:2); // Inciso C
    end;
end;

procedure ProcesarVmeses(VM:Vmes);
var
    Maxmonto:real;
    Maxmes:RangoMes;
    i:integer;
begin
    Maxmonto:=-9999;
    for i:=1 to 12 do begin
        if(VM[i] > Maxmonto) then begin
            Maxmonto:=VM[i];
            Maxmes:=i;
        end;
    end;
    writeln('El mes con mayor monto es: ',Maxmes,' con monto de: ',Maxmonto:0:2);
end;
    
var
    LV:Lviaje; LN:Lnueva;
    VP:Vcosto; VM:Vmes;
    // VP = Vector de Precios
    // VM = Vector de meses (para inciso B)
begin
    LV:=NIL; LN:=NIL;
    InicializarVmeses(VM); // Es un vector contador!
    CargarVprecios(VP); // SE DISPONE DE LA ESTRUCTURA
    CargarLviajes(LV); // SE DISPONE DE LA INFORMACIÓN
    Procesar(LV,LN,VM,VP); // Inciso A y C
    ProcesarVmeses(VM); // Inciso B
end.