{

Realizar un programa que lea información de centros de investigación de Universidades Nacionales. De cada
centro se lee su nombre abreviado (ej. LIDI, LIFIA, LINTI), la universidad a la que pertenece, la cantidad de
investigadores y la cantidad de becarios que poseen. La información se lee de forma consecutiva por universidad y
la lectura finaliza al leer un centro con 0 investigadores, que no debe procesarse. Informar:
● Cantidad total de centros para cada universidad.
● Universidad con mayor cantidad de investigadores en sus centros.
● Los dos centros con menor cantidad de becarios.

}
program p3_ej7;
type
    ciun = record
        nom:string;
        uni:string;
        inv:integer;
        beca:integer;
    end;
    
procedure leerlab(var c:ciun); 
begin
    writeln('Ingresar nombre: '); readln(c.nom);
    writeln('Ingresar universidad: '); readln(c.uni);
    writeln('Ingresar investigadores: '); readln(c.inv);
    writeln('Ingresar becarios: '); readln(c.beca);
end;

procedure procesarcentro(c:ciun; tinv:integer; var umax:ciun);
begin
    if (tinv > umax.inv) then
        umax:=c;
end;

procedure procesarbecados(c:ciun; var cm1,cm2:ciun);
begin
    if (c.beca < cm1.beca) then begin
        cm2:=cm1;
        cm1:=c;
        end
    else if (c.beca < cm2.beca) then
        cm2:=c;
end;

var
    centro,cmin1,cmin2,unimax:ciun;
    centroact,uniact:string;
    cantcent,totalinv:integer;
begin
    unimax.inv:=-1;
    cmin1.beca:=9999; cmin2.beca:=9999;
    leerlab(centro);
    while (centro.inv <> 0) do begin
        uniact:=centro.uni;
        cantcent:=0;
        totalinv:=0;
        while (centro.uni = uniact) and (centro.inv <> 0) do begin
            cantcent:=cantcent+1;
            totalinv:=totalinv+centro.inv;
            procesarcentro(centro,totalinv,unimax);
            procesarbecados(centro,cmin1,cmin2);
            leerlab(centro);
        end;
        writeln('Cantidad de centros de la universidad: ',uniact,' ',cantcent);
    end;
    writeln('Universidad con mayor cantidad de investigadores: ',unimax.uni,' ',unimax.inv);
    writeln('Los dos centros con menor cantidad de becados: ');
    writeln(cmin1.nom,' ',cmin1.uni,' ',cmin2.nom,' ',cmin2.uni);
end.
