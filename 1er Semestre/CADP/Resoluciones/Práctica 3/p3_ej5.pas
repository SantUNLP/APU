{
   Realizar un programa que lea información de autos que están a la venta en una concesionaria. De cada auto se lee:
marca, modelo y precio. La lectura finaliza cuando se ingresa la marca “ZZZ” que no debe procesarse. La
información se ingresa ordenada por marca. Se pide calcular e informar:
a. El precio promedio por marca.
b. Marca y modelo del auto más caro.
}

program p3_ej5;
type
    vehiculo=record
        marca:string;
        modelo:integer;
        precio:real;
    end;

procedure leerauto(var a:vehiculo);
begin
    writeln('Ingresar marca: '); readln(a.marca);
    writeln('Ingresar modelo: '); readln(a.modelo);
    writeln('Ingresar precio: '); readln(a.precio);
end;

procedure procesarauto(a:vehiculo; var amax:vehiculo);
begin
    if (a.precio > amax.precio) then
        amax:=a;
end;

var
    auto,automax:vehiculo;
    maract:string;
    cantautos:integer;
    prom,totalprecio:real;
begin
    automax.precio:=-1;
    cantautos:=0;
    leerauto(auto);
    while (auto.marca <> 'ZZZ') do begin
        prom:=0;
        totalprecio:=0;
        maract:=auto.marca;
        while (auto.marca <> 'ZZZ') AND (auto.marca = maract) do begin
            cantautos:=cantautos+1;
            totalprecio:=totalprecio+auto.precio;
            procesarauto(auto,automax); // Inciso b
            leerauto(auto);
        end;
        prom:=totalprecio/cantautos; // Inciso a
        cantautos:=0;
        writeln('Precio promedio de la marca: ',maract,' es: $',prom:0:2);
    end;
    writeln('Marca y modelo del auto más caro:','|',automax.marca,'|',automax.modelo,'|');
    // Creo que se puede hacer mejor, no se entiende mucho el codigo C:
end.