{
5. Realizar un programa que lea y almacene la información de productos de un supermercado. De cada
producto se lee: código, descripción, stock actual, stock mínimo y precio. La lectura finaliza cuando se ingresa
el código -1, que no debe procesarse. Una vez leída y almacenada toda la información, calcular e informar:
a. Porcentaje de productos con stock actual por debajo de su stock mínimo.
b. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares.
c. Código de los dos productos más económicos.
}
program P6_Ej5;
type

listaP = ^nodo;

producto = record
    cod:integer;
    desc:string;
    stockact:integer;
    stockmin:integer;
    prec:real;
    end;

nodo = record
    prod:producto;
    sig:listaP;
    end;
    
procedure agregarAdelante(var LP:listaP;P:producto);
var
    aux:listaP;
begin
    new(aux);
    aux^.prod:=P; aux^.sig:=LP;
    LP:=aux;
end;

procedure leerproducto(var P:producto);
begin
    writeln('Leer codigo: '); readln(P.cod);
    if (P.cod <> -1) then begin
        writeln('Leer descripcion: '); readln(p.desc);
        writeln('Leer stock actual: '); readln(p.stockact);
        writeln('Leer stock minimo: '); readln(p.stockmin);
        writeln('Leer precio: '); readln(p.prec);
    end
end;

procedure cargarlista(var LP:listaP);
var
    P:producto;
begin
    leerproducto(P);
    while (P.cod <> -1) do begin
        agregarAdelante(LP,P);
        leerproducto(P);
    end;
end;

function Descomponer(cod:integer;desc:string):boolean;
var
    dig,par:integer;
begin
    par:=0;
    while (cod <> 0) do begin
        dig:= cod MOD 10;
        if (dig MOD 2 = 0) then
            par:=par+1;
        cod:= cod DIV 10;
    end;
    descomponer:=(par >= 3);
end;

procedure calcularminimos(cod:integer;prec:real;var m1,m2:integer; var p1,p2:real);
begin
    if (prec < p1) then begin
        p2:=p1;
        p1:=prec;
        m2:=m1;
        m1:=cod;
        end
    else if (prec < p2) then begin
        p2:=prec;
        m2:=cod;
    end
        
end;

procedure recorrerlista(LP:listaP);
var
    cantProd,menorStock,min1,min2:integer;
    prec1,prec2:real;
begin
    prec1:= 9999; prec2:=9999;
    cantProd:=0; menorStock:=0;
    while (LP <> nil) do begin
        cantProd:=cantProd+1;
        if(LP^.prod.stockact < LP^.prod.stockmin) then
            menorStock:=menorStock+1;
        if(Descomponer(LP^.prod.cod,LP^.prod.desc)) then // INCISO B
            writeln('Descripcion: ',LP^.prod.desc)
        else
            writeln(LP^.prod.cod,' No tiene 3 digitos pares');
        calcularminimos(LP^.prod.cod,LP^.prod.prec,min1,min2,prec1,prec2); // INCISO C
        LP:=LP^.sig;
    end;
    writeln('Producto minimo 1: ',min1);
    writeln('Producto minimo 2: ',min2);
    writeln('Porcentaje: ',menorStock*100/cantProd:0:0,'%'); // INCISO A
end;

var
    LP:listaP;
begin
    LP:=nil;
    cargarlista(LP);
    recorrerlista(LP);
end.
