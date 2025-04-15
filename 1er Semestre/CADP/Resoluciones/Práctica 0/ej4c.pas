program practica0punto4c;
const
    PI = 3.14;
var
 diametro,radio,area,perimetro:real;
begin 
 writeln();
///////////////////////// punto 4 a ///////////////////////////////////////////////////////
 writeln ('ingrese el diametro: '); readln(diametro); //pide el diametro al usuario
 radio := (diametro/2); //calcula el radio
 writeln('El radio del circulo es: ',radio:4:2);
 
 /////////////////////////punto 4 b //////////////////////////////////////////////////////
 
 area := ((radioradio)PI); //calcula el area
 writeln('El area del circulo es: ',area:4:2);
 
/////////////////////////punto 4 c ///////////////////////////////////////////////////////

 perimetro := (diametro*PI);  //calcula el perimetro
 writeln('el perimetro es: ',perimetro:4:2);
end.

