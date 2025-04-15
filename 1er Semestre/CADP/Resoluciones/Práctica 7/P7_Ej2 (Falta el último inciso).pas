{
    2. Implementar un programa que lea y almacene información de clientes de una empresa aseguradora
automotriz. De cada cliente se lee: código de cliente, DNI, apellido, nombre, código de póliza
contratada (1..6) y monto básico que abona mensualmente. La lectura finaliza cuando llega el cliente
con código 1122, el cual debe procesarse.
La empresa dispone de una tabla donde guarda un valor que representa un monto adicional que el
cliente debe abonar en la liquidación mensual de su seguro, de acuerdo al código de póliza que tiene
contratada.
Una vez finalizada la lectura de todos los clientes, se pide:
a. Informar para cada cliente DNI, apellido, nombre y el monto completo que paga mensualmente
por su seguro automotriz (monto básico + monto adicional).
b. Informar apellido y nombre de aquellos clientes cuyo DNI contiene al menos dos dígitos 9.
c. Realizar un módulo que reciba un código de cliente, lo busque (seguro existe) y lo elimine de la
estructura.
}

program P7_Ej2;
type
    rangoP=1..6;
    
    ListaC = ^nodo;
    
    cliente=record
        cod:integer;
        dni:integer;
        ape:string;
        nom:string;
        codp:rangoP;
        montobas:real;
    end;
    
    nodo=record
        cli:cliente;
        sig:listaC;
    end;
    
    VMonto = array [rangoP] of real;
    
procedure CargarVector(var VM:Vmonto);
var
    i:integer;
    monto:real;
begin
    for i:=1 to 6 do begin
        writeln('Ingresar Monto:'); readln(monto);
        VM[i]:=monto;
    end;
end;

procedure LeerCliente(var C:cliente);
begin
    writeln('Leer CODIGO'); readln(C.cod);
    writeln('Leer DNI'); readln(C.dni);
    writeln('Leer APELLIDO'); readln(C.ape);
    writeln('Leer NOMBRE'); readln(C.nom);
    writeln('Leer POLIZA'); readln(C.codp);
    writeln('Leer MONTO BASICO'); readln(C.montobas);
end;

procedure AgregarAdelante(var LC:ListaC; C:cliente);
var
    aux:ListaC;
begin
    new(aux);
    aux^.cli:=C; aux^.sig:=LC;
    LC:=aux;
end;

procedure CargarLista(var LC:ListaC);
var
    Cli:cliente;
begin
    repeat
        LeerCliente(Cli);
        AgregarAdelante(LC,Cli);
    until(Cli.cod = 1122);
end;

function Descomponer(dni:integer):boolean;
var
    dig,cant9:integer;
begin
    cant9:=0;
    while (dni <> 0) do begin
        dig:= dni MOD 10;
        if (dig = 9) then
            cant9:=cant9+1;
        dni:=dni DIV 10;
    end;
    Descomponer:=(cant9 >= 2);
end;

procedure Informar(LC:ListaC;VM:Vmonto);
var // Para legibilidad, uso variables locales
    dni:integer;
    ape,nom:string;
    montotot:real;
begin
    while (LC <> nil) do begin
        dni:=LC^.cli.dni; ape:= LC^.cli.ape; nom:= LC^.cli.nom;
        montotot:=LC^.cli.montobas+VM[LC^.cli.codp];
        writeln('DNI: ',dni,' APELLIDO: ',ape,' NOMBRE: ',nom,' MONTO TOTAL: ',montotot:0:2);
        if (Descomponer(LC^.cli.dni)) then
            writeln('APELLIDO: ',ape,' NOMBRE: ',nom);
        LC:=LC^.sig;
    end;
end;

var
    LC:ListaC;
    VM:Vmonto;
    codigo:integer;
begin
    LC:=nil;
    CargarVector(VM); // Se dispone
    CargarLista(LC);
    Informar(LC,VM);
    writeln('Ingresar CODIGO de CLIENTE: '); readln(codigo);
    Eliminar(LC,codigo);
end.