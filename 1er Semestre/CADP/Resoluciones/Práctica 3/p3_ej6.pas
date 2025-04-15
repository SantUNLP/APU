{

Una empresa importadora de microprocesadores desea implementar un sistema de software para analizar la
información de los productos que mantiene actualmente en stock. Para ello, se conoce la siguiente información de
los microprocesadores: marca (Intel, AMD, NVidia, etc), línea (Xeon, Core i7, Opteron, Atom, Centrino, etc.),
cantidad de cores o núcleos de procesamiento (1, 2, 4, 8), velocidad del reloj (medida en Ghz) y tamaño en
nanómetros (nm) de los transistores (14, 22, 32, 45, etc.). La información de los microprocesadores se lee de
forma consecutiva por marca de procesador y la lectura finaliza al ingresar un procesador con 0 cores (que no
debe procesarse). Se pide implementar un programa que lea información de los microprocesadores de la empresa
importadora e informe:

● Marca y línea de todos los procesadores de más de 2 cores con transistores de a lo sumo 22 nm.
● Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm.
● Cantidad de procesadores multicore (de más de un core) de Intel o AMD, cuyos relojes alcancen velocidades de
al menos 2 Ghz.

}

program p3_ej5;
type
    micproc = record
        marca:string;
        linea:string;
        core:integer;
        reloj:real;
        tam:integer;
    end;
    
procedure leermicrop(var mp:micproc);
begin
    writeln('Ingresar marca:'); readln(mp.marca);
    writeln('Ingresar linea:'); readln(mp.linea);
    writeln('Ingresar core:'); readln(mp.core);
    writeln('Ingresar reloj:'); readln(mp.reloj);
    writeln('Ingresar tam:'); readln(mp.tam);
end;

procedure procesarmyl (mp:micproc);
begin
    if (mp.core > 2) and (mp.tam >= 22) then begin
        writeln('MARCA: ',mp.marca,' MODELO: ',mp.linea);
    end;
end;

procedure calcularmax(cont:integer; mp:micproc; var mic1,mic2:micproc; var max1,max2:integer);
begin
    if (cont > max1) and (mp.tam = 14) then begin
            max2:=max1;
            max1:=cont;
            mic2:=mic1;
            mic1:=mp;
            end
        else if (cont > max2) and (mp.tam = 14) then begin
            max2:=cont;
            mic2:=mp;
            end;
end;

function calcularcore(mp:micproc):boolean;
begin
    if (mp.marca = 'intel') or (mp.marca = 'amd') and (mp.core > 1) and (mp.reloj >= 2) then
        calcularcore:=true
    else
        calcularcore:=false;
end;

var
    micp,micpm1,micpm2:micproc;
    maxproc1,maxproc2,contproc,cantmult:integer;
    marcaact:string;
begin
    maxproc1:=-1; maxproc2:=-1;
    cantmult:=0;
    leermicrop(micp);
    while (micp.core <> 0) do begin
        marcaact:=micp.marca;
        contproc:=0;
        while (micp.marca = marcaact) and (micp.core <> 0) do begin
            contproc:=contproc+1;
            procesarmyl(micp);
            if (calcularcore(micp) = true) then
                cantmult:=cantmult+1;
            calcularmax(contproc,micp,micpm1,micpm2,maxproc1,maxproc2);
            leermicrop(micp);
        end;
    end;
    writeln('Las dos marcas con la mayor cantidad de microprocesadores con transitores de 14nm son:');
    writeln(micpm1.marca,' y ',micpm2.marca);
    writeln('Cantidad de procesadores Intel o AMD Multicore: ',cantmult);
end.
