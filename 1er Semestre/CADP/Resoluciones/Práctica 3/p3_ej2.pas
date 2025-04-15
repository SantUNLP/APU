{

2. El registro civil de La Plata ha solicitado un programa para analizar la distribución de casamientos
durante el año 2019. Para ello, cuenta con información de las fechas de todos los
casamientos realizados durante ese año.
a) Analizar y definir un tipo de dato adecuado para almacenar la información de la fecha de cada casamiento.
b) Implementar un módulo que lea una fecha desde teclado y la retorne en un parámetro cuyo tipo es el definido
en el inciso a).
c) Implementar un programa que lea la fecha de todos los casamientos realizados en 2019. La lectura finaliza al
ingresar el año 2020, que no debe procesarse, e informe la cantidad de casamientos realizados durante los
meses de verano (enero, febrero y marzo) y la cantidad de casamientos realizados en los primeros 10 días de
cada mes. Nota: utilizar el módulo realizado en b) para la lectura de fecha.

}

program p3_ej2;
type
fechacasamiento=record
    dia:integer;
    meses:integer;
    anio:integer;
end;

procedure leerfechas(var fe:fechacasamiento);
begin
    writeln('Ingresar día del casamiento: '); 
    readln(fe.dia);
    writeln('Ingrese el mes del casamiento');
    readln(fe.meses);
    writeln('Ingrese el añio del casamiento');
    read(fe.anio);
end;

procedure cantmeses(fe:fechacasamiento; var contmeses:integer; var contdias10:integer);
begin
 if(fe.meses >=1) and (fe.meses <=3) then
   contmeses:=contmeses + 1;
 if(fe.dia >= 1) and (fe.dia <= 10) then
   contdias10:=contdias10 + 1;
end;

var
    fecha:fechacasamiento;
    contmeses,contprimeros10:integer;
begin
    contmeses:=0;
    contprimeros10:=0;
    leerfechas(fecha);
    while (fecha.anio <> 2020) do begin
    if (fecha.anio = 2019) then
        cantmeses(fecha,contmeses,contprimeros10);
    leerfechas(fecha);
    end;
writeln('La cantidad de casamientos en los meses de verano enero| febrero| marzo fueron: ', contmeses);
writeln('La cantidad de casamientos en los primeros 10 dias de todos los meses del año fueron: ', contprimeros10);
end.