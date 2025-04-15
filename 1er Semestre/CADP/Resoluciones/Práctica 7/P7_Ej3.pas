{
    3. Una remisería dispone de información acerca de los viajes realizados durante el mes de mayo de
2020. De cada viaje se conoce: número de viaje, código de auto, dirección de origen, dirección de
destino y kilómetros recorridos durante el viaje. Esta información se encuentra ordenada por código
de auto y para un mismo código de auto pueden existir 1 o más viajes. Se pide:
a. Informar los dos códigos de auto que más kilómetros recorrieron.
b. Generar una lista nueva con los viajes de más de 5 kilómetros recorridos, ordenada por número
de viaje.
}

program P7_Ej3;
type
    ListaV=^nodo;
    
    viajes=record
        numv:integer;
        codauto:integer;
        dirorig:string;
        dirdest:string;
        km:real;
    end;
    
    nodo=record
        dato:viajes;
        sig:ListaV;
    end;

procedure CargarLista(var LV:ListaV); // Se dispone
begin
end;

procedure ProcesarMax(km:real; cod:integer; var cod1,cod2:integer; var km1,km2:real);
begin
    if (km > km1) then begin
        km2:=km1;
        cod2:=cod1;
        km1:=km;
        cod1:=cod;
        end
    else if (km > km2) then begin
        km2:=km;
        cod2:=cod;
        end
end;

procedure Informar(C1,C2:integer);
begin
    writeln('El codigo del viaje que mas km recorrio es: ',C1, ' y ',C2);
end;

procedure GenerarListaOrdenada(var LNue:listaV; Dato:viajes);
var
    ant,act,nue:listaV;
begin
    new(nue);
    nue^.dato:=Dato; nue^.sig:=nil;
        if (Lnue = nil) then // CASO 1 : MI LISTA ES NIL
            Lnue:=nue
        else begin
            act:=Lnue; ant:=Lnue;
        while (act <> nil) and (act^.dato.numv < nue^.dato.numv) do begin // CASO 2: RECORRO LA LISTA (TIENE DATOS)
            ant:=act;
            act:=act^.sig;
        end;
        end;
        if (act = Lnue) then begin// CASO 2
            nue^.sig:=Lnue;
            Lnue:=nue;
            end
        else
            ant^.sig:=Nue;
            Nue^.sig:=act;
        end;

procedure ProcesarLista(LV:listaV; var LNue:listaV);
var
    codact,codmax1,codmax2:integer;
    KMtotal,km1,km2:real;
begin
    km1:=-9999; km2:=-9999;
    while (LV <> nil) do begin
        codact:=LV^.dato.codauto;
        KMtotal:=0;
        while (LV <> nil) and (LV^.dato.codauto = codact) do begin
            KMtotal:=LV^.dato.km;
            if (LV^.dato.km > 5) then begin
                new(Lnue);
                GenerarListaOrdenada(Lnue,LV^.dato);
            end;
        end;
        ProcesarMax(KMtotal,codact,codmax1,codmax2,km1,km2);
        LV:=LV^.sig;
    end;
    Informar(codmax1,codmax2);
end;
    
var
    LV:ListaV;
    LNue:ListaV;
begin
    LV:=nil; LNue:=nil;
    CargarLista(LV); // Se dispone
    ProcesarLista(LV,LNue); // Inciso A
end.

