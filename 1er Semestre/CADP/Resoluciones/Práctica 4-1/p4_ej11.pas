{

El colectivo de fotógrafos ArgenPics desea conocer los gustos de sus seguidores en las redes sociales. Para
ello, para cada una de las 200 fotos publicadas en su página de Facebook, cuenta con la siguiente
información: título de la foto, el autor de la foto, cantidad de Me gusta, cantidad de clics y cantidad de
comentarios de usuarios. Realizar un programa que lea y almacene esta información. Una vez finalizada la
lectura, el programa debe procesar los datos e informar:
a) Título de la foto más vista (la que posee mayor cantidad de clics).
b) Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”.
c) Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página.
}

program p4_ej11;
const
    dimF=2;
type
    fotos=record
        titulo:string;
        autor:string;
        cantmg:integer;
        cantclic:integer;
        cantcom:integer;
    end;
    vfotos=array[1..dimF] of fotos;
    
procedure leerfotos(var f:fotos);
begin
    writeln('Ingresar titulo: '); readln(f.titulo);
    writeln('Ingresar autor: '); readln(f.autor);
    writeln('Ingresar cant mg: '); readln(f.cantmg);
    writeln('Ingresar cant de clics: '); readln(f.cantclic);
    writeln('Ingresar cant comentarios: '); readln(f.cantcom);
end;
    
procedure cargarvector(var vf:vfotos);
var
    i:integer;
    aux:fotos;
begin
    for i:=1 to dimF do begin
        leerfotos(aux);
        vf[i]:=aux;
    end;
end;

procedure procesar(vf:vfotos);
var
    max,i,totalmg:integer;
    titulo:string;
begin
    max:=-1; totalmg:=0;
    for i:=1 to dimF do begin
        if (vf[i].cantclic > max) then begin
            max:=vf[i].cantclic;
            titulo:=vf[i].titulo;
            end;
        if (vf[i].autor = 'Art Vandelay') then
            totalmg:=totalmg+vf[i].cantmg;
    end;
    writeln('Titulo de la foto mas vista: ',titulo);
    writeln('Cantidad de me gusta de Art Vandelay: ',totalmg);
end;

procedure procesarcomen(vf:vfotos);
var
    i:integer;
begin
    for i:=1 to dimF do begin
    writeln('Cantidad de comentarios de la foto ',i,': ',vf[i].cantcom);
    end;
end;

var
    vfot:vfotos;
begin
    cargarvector(vfot); // carga del vector, lectura de las fotos
    procesar(vfot); // inciso a, b
    procesarcomen(vfot); // inciso c
end.
