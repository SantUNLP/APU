{

                            Online Pascal Compiler.
                Code, Compile, Run and Debug Pascal program online.
Write your code in this editor and press "Run" button to execute it.

Realizar un programa que lea el código, el precio actual y el nuevo precio de los productos de un
almacén. La lectura finaliza al ingresar el producto con el código 32767, el cual debe procesarse.
Para cada producto leído, el programa deberá indicar si el nuevo precio del producto supera en un
10% al precio anterior

}


program p1_ej7;
var
    cod:integer;
    precact,precnue,porc:real;
begin
    repeat
        writeln('Ingresar CODIGO: '); readln(cod);
        writeln('Ingresar PRECIO: '); readln(precact);
        writeln('Ingresar PRECIO NUEVO: '); readln(precnue);
        porc:=precact/10;
        if (precnue = precact+porc) then
            writeln('Supera en el 10%')
        else
            writeln('No supera al 10%');
    until(cod = 32767);
end.

