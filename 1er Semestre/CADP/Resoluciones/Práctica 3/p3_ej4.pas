{
    Una compañía de telefonía celular debe realizar la facturación mensual de sus 9300 clientes con planes de
consumo ilimitados (clientes que pagan por lo que consumen). Para cada cliente se conoce su código de cliente y
cantidad de líneas a su nombre. De cada línea se tiene el número de teléfono, la cantidad de minutos consumidos
y la cantidad de MB consumidos en el mes. Se pide implementar un programa que lea los datos de los clientes de
la compañía e informe el monto total a facturar para cada uno. Para ello, se requiere:
a. Realizar un módulo que lea la información de una línea de teléfono.
b. Realizar un módulo que reciba los datos de un cliente, lea la información de todas sus líneas (utilizando el
módulo desarrollado en el inciso a. ) y retorne la cantidad total de minutos y la cantidad total de MB a facturar
del cliente.
Nota: para realizar los cálculos tener en cuenta que cada minuto cuesta $3,40 y cada MB consumido cuesta $1,35.
}

program p3_ej4;
type
    cliente=record
        codcli:integer;
        cantlin:integer;
    end;
    linea=record
        num:integer;
        cantmin:integer;
        cantmb:integer;
    end;

procedure leercliente(var c:cliente);
begin
    writeln('Ingresar codigo de cliente: '); readln(c.codcli);
    writeln('Ingresar cantidad de lineas: '); readln(c.cantlin);
end;

procedure leerlinea(var l:linea);
begin
    writeln('Ingresar numero de telefono: '); readln(l.num);
    writeln('Ingresar cantidad de minutos: '); readln(l.cantmin);
    writeln('Ingresar cantidad de MB consumidos: '); readln(l.cantmb);
end;

procedure procesar(l:linea; var tmin,tmb:real);
begin
    tmin:=tmin+l.cantmin;
    tmb:=tmb+l.cantmb;
end;

var
    cli:cliente;
    lin:linea;
    i,j:integer;
    totmin,totmb:real;
begin
    for i:=1 to 1 do begin // Cambiar por 9300
        totmin:=0;
        totmb:=0;
        // Se resetea por cada cliente!
        leercliente(cli); // inciso a
        for j:=1 to cli.cantlin do begin // se puede hacer de otra forma
            leerlinea(lin); // inciso b
            procesar(lin,totmin,totmb); // esto no hace falta hacerlo en un proceso
        end;
        writeln('Monto a facturar de minutos: $',totmin*3.40:0:2);
        writeln('Monto a facutrar de MB: $',totmb*1.35:0:2);
    end;
end.