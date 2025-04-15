{

6. Realizar un programa que lea información de 200 productos de un supermercado. De cada producto
se lee código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
- Los códigos de los dos productos más baratos.
- La cantidad de productos de más de 16 pesos con código par.

}


program p1p2_ej6;
var
    num,i,cod,codmin1,codmin2,cantprodu:integer;
    prec,precmin1,precmin2:real;
begin
    cantprodu:=0;
    codmin1:=201;
    codmin2:=201;
    precmin1:=9999;
    precmin2:=9999;
    for i:=1 to 3 do begin
        writeln('Ingresar código: '); readln(cod);
        writeln('Ingresar precio: '); readln(prec);
        if (prec < precmin1) then begin
            precmin2:=precmin1;
            precmin1:=prec;
            codmin2:=codmin1;
            codmin1:=cod;
            end
        else if (prec < precmin2) then
            precmin2:=prec;
            codmin2:=cod;
        if (cod MOD 2 = 0) AND (prec > 16) then
            cantprodu:=cantprodu+1
    end;
    writeln('Códigos de los productos más baratos: ',codmin1, ' y ',codmin2);
    writeln('Cantidad de productos con código par y precio mayor a 16: ',cantprodu);
end.