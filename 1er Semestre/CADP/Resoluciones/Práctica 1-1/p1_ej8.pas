{

                            Online Pascal Compiler.
                Code, Compile, Run and Debug Pascal program online.
Write your code in this editor and press "Run" button to execute it.

Realizar un programa que lea tres caracteres, e informe si los tres eran letras vocales o si al menos
uno de ellos no lo era. Por ejemplo, si se leen los caracteres “a e o” deberá informar “Los tres son
vocales”, y si se leen los caracteres “z a g” deberá informar “al menos un carácter no era vocal”.

}


program p1_ej8;
var
    cont:integer;
    car1,car2,car3:char;
begin
    cont:=0;
    writeln('Ingresar primer caracter: '); readln(car1);
    writeln('Ingresar segundo caracter: '); readln(car2);
    writeln('Ingresar tercer caracter: '); readln(car3);
    if(car1 = 'a') or (car1 = 'e') or (car1 = 'i') or (car1 = 'o') or (car1 = 'u') then
        cont:=cont+1;
    if(car2 = 'a') or (car2 = 'e') or (car2 = 'i') or (car2 = 'o') or (car2 = 'u') then
        cont:=cont+1;
    if(car3 = 'a') or (car3 = 'e') or (car3 = 'i') or (car3 = 'o') or (car3 = 'u') then
        cont:=cont+1;
    if (cont = 0) then
        writeln('Ninguno es vocal')
    else
        if (cont < 3) then
            writeln('Al menos uno es vocal')
        else
            writeln('Los tres son vocales');
end.

