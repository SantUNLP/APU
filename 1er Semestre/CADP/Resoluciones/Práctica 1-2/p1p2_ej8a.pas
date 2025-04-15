{

8. Un local de ropa desea analizar las ventas realizadas en el último mes. Para ello se lee por cada día
del mes, los montos de las ventas realizadas. La lectura de montos para cada día finaliza cuando se
lee el monto 0. Se asume un mes de 31 días. Informar la cantidad de ventas por cada día, y el monto
total acumulado en ventas de todo el mes.
a. Modifique el ejercicio anterior para que además informe el día en el que se realizó la mayor
cantidad de ventas

}


program p1p2_ej8;
const
    dia=31;
var
    ventas,diamax,ventasmax,i:integer;
    monto,montoacu:real;
begin
    montoacu:=0;
    ventasmax:=0;
    diamax:=0;
    for i:=1 to dia do begin
        ventas:=0;
        writeln('Leer monto: '); readln(monto);
        while (monto <> 0) do begin
            ventas:=ventas+1;
            montoacu:=montoacu+monto;
            writeln('Leer monto: '); readln(monto);
        end;
        if(ventas > ventasmax) then begin
            ventasmax:=ventas;
            diamax:=i;
            end;
        writeln('Cantidad de ventas: ',ventas);
    end;
    writeln('Monto total acumulado: ',montoacu:0:2);
    writeln('Mayor cantidad de ventas en el día: ',diamax);
end.