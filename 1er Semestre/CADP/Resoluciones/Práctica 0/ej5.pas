program practica0punto5b;
const
valorCaram =1.60;
var
cantCaramelos, cantClientes, cantCaramPorCliente, sobra:integer;
gananciaTotal:real;
begin
writeln('Ingrese la cantidad de caramelos: '); readln(cantCaramelos);
writeln('Ingrese la cantidad de clientes: '); readln(cantClientes);
cantCaramPorCliente := (cantCaramelos DIV cantClientes); // divide los caramelos entre
la cantidad de clientes.
sobra := (cantCaramelos MOD cantClientes); // consulta cuantos caramelos sobraron.
writeln('Cada cliente se lleva: ', cantCaramPorCliente,' caramelos y sobran: ',sobra);
//////////////////////////////////////////////////////////////////////////////////////////
gananciaTotal := (valorCaram*cantClientes*cantCaramPorCliente); //calcula la
ganancia total de la venta de los caramelos.
writeln ('La ganancia total es de: $',gananciaTotal:4:2);
end.
