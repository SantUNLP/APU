{

                            Online Pascal Compiler.
                Code, Compile, Run and Debug Pascal program online.
Write your code in this editor and press "Run" button to execute it.

Realizar un programa que lea un carácter, que puede ser “+” (suma) o “-” (resta); si se ingresa otro
carácter, debe informar un error y finalizar. Una vez leído el carácter de suma o resta, deberá leerse
una secuencia de números enteros que finaliza con 0. El programa deberá aplicar la operación leída
con la secuencia de números, e imprimir el resultado final.

}


program p1_ej9;
var
    op:char;
    num,res:integer;
begin
    res:=0;
    writeln('Ingresar caracter: '); readln(op);
    if (op = '+') then begin
        writeln('Ingresar un número: '); readln(num);
        while (num <> 0) do begin
            res:=res+num;
            writeln('Ingresar un número: '); readln(num);
        end;
        end
    else
        if (op = '-') then begin
            writeln('Ingresar un número: '); readln(num);
            while (num <> 0) do begin
            res:=num-res;
            writeln('Ingresar un número: '); readln(num);
        end;
        end
    else
        writeln('ERROR');
    writeln('El resultado es: ',res);
end.

