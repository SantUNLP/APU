{

7. Realizar un programa que lea desde teclado información de autos de carrera. Para cada uno de los
autos se lee el nombre del piloto y el tiempo total que le tomó finalizar la carrera. En la carrera
participaron 100 autos. Informar en pantalla:
- Los nombres de los dos pilotos que finalizaron en los dos primeros puestos.
- Los nombres de los dos pilotos que finalizaron en los dos últimos puestos

}


program p1p2_ej7;
var
    piloto,pmax1,pmax2,pmin1,pmin2:string;
    tiempo,i,tmax1,tmax2,tmin1,tmin2:integer;
begin
    tmax1:=-1; tmax2:=-1;
    tmin1:=9999; tmin2:=9999;
    for i:=1 to 5 do begin
        writeln('Ingresar nombre del piloto: '); readln(piloto);
        writeln('Ingresar tiempo de finalización: '); readln(tiempo);
        if (tiempo > tmax1) then begin
            tmax2:=tmax1;
            tmax1:=tiempo;
            pmax2:=pmax1;
            pmax1:=piloto;
        end
        else if (tiempo > tmax2) then begin
            tmax2:=tiempo;
            pmax2:=piloto;
        end;
        if (tiempo < tmin1) then begin
            tmin2:=tmin1;
            tmin1:=tiempo;
            pmin2:=pmin1;
            pmin1:=piloto;
        end
        else if (tiempo < tmin2) then begin
            tmin2:=tiempo;
            pmin2:=piloto;
        end
    end;
    writeln('Los dos pilotos que terminaron primero son: ',pmin1,' y ',pmin2);
    writeln('Los dos pilotos que terminaron ultimos son: ',pmax1,' y ',pmax2);
end.

