{
    Un fabricante de dispositivos electronicos desea procesar informacion de los repuestos
    que compro. De cada repuesto conoce su: codigo, precio, codigo de marca (entre 1 y 130)
    y nombre del pais que proviene. El fabricante dispone de una estructura de datos con la informacion
    de los repuestos, ordenados por nombre de pais.
    Realizar un programa que:
    A. Lea el codigo y el nombre de las 130 marcas con las que trabaja, y las almacene en una estructura
    de datos. La información se ingresa sin ningun orden en particular.
    B. Una vez completada la carga, procese la informacion de los repuestos e informe:
        1. La cantidad de paises a los que se le compro mas de 100 repuestos.
        2. Para cada marca, nombre de la marca y el precio del producto mas barato.
        3. COMPLETO: La cantidad de repuestos que no poseen ningun cero en su codigo.
    Implemente el programa principal que invoque a los modulos de los incisos a y b, e imprima los resultados
}

Program Parcial2024TEMA2;
const
    DIMF=130;
type
    rangomarca=1..130;
    
    ListaRepuestos=^nodo;
    
    repuesto=record
        cod:integer;
        prec:real;
        codmarc:rangomarca;
        pais:string;
    end;
    
    nodo=record
        dato:repuesto;
        sig:ListaRepuestos;
    end;
    
    Vmarcas=array [1..DIMF] of string;
    
    Vminimos=array [1..DIMF] of real;
    
procedure CargarVectorDeMarcas(var VM:Vmarcas);
var
    i:integer;
    codmarca:rangomarca;
    marca:string;
begin
    for i:=1 to DIMF do begin
        readln(codmarca); // se puede hacer un proceso para leer
        readln(marca);
        VM[codmarca]:=marca;
    end;
end;

procedure InicializarVectorMinimos(var VMMin:Vminimos);
var
    i:integer;
begin
    for i:=1 to DIMF do begin
        VMMin[i]:=9999;
    end;
end;

procedure CargarLista(var LR:ListaRepuestos);
begin
    // SE DISPONE
end;

function Descomponer(cod:integer):boolean;
var
    dig:integer;
    ok:boolean;
begin
    ok:=true;
    while (cod <> 0) and (ok = true) do begin
        dig:=cod MOD 10;
        if (dig = 0) then
            ok:=false
        else
            cod:=cod DIV 10;
    end;
    Descomponer:=ok;
end;

procedure ProcesarPrecios(prec:real;vprec:real);
begin
    if (prec < vprec) then begin
        vprec:=prec;
    end;
end;

procedure Procesar(LR:ListaRepuestos;VM:Vmarcas; var VMMin:Vminimos; var CantP,CantR:integer);
var
    PaisAct:string;
    Contador:integer;
begin
    while (LR <> NIL) do begin
        PaisAct:=LR^.dato.pais;
        Contador:=0;
        while (LR <> NIL) AND (LR^.dato.pais = PaisAct) do begin
            Contador:=Contador+1;
            if (Descomponer(LR^.dato.cod)) then
                CantR:=CantR+1;
            ProcesarPrecios(LR^.dato.prec,VMMin[LR^.dato.codmarc]);
            LR:=LR^.sig;
        end;
            if(Contador > 100) then
                CantP:=CantP+1;
    end;
end;

procedure Informar(CantP,CantR:integer; VMMin:Vminimos; VM:Vmarcas);
var
    i:integer;
begin
    writeln('Cantidad de paises a los que se le vendio mas de 100 repuestos: ',CantP);
    writeln('Cantidad de repuestos sin ningun 0 en su codigo: ',CantR);
    for i:=1 to DIMF do begin
        writeln('MARCA: ',VM[i]);
        writeln('PRECIO: ',VMMin[i]);
    end;
end;
    
var
    LR:ListaRepuestos;
    VM:Vmarcas; VMMin:Vminimos;
    CantPaises,CantRepuestos:integer;
begin
    LR:=NIL;
    CantPaises:=0; CantRepuestos:=0;
    CargarVectorDeMarcas(VM); // INCISO A
    InicializarVectorMinimos(VMMin); // PARA INCISO B-2
    CargarLista(LR); // SE DISPONE
    Procesar(LR,VM,VMMin,CantPaises,CantRepuestos); // INCISO B-1, B-2, B-3
    Informar(CantPaises,CantRepuestos,VMMin,VM); // Informar Inciso B
end.
