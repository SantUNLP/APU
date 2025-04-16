{
Una empresa posee un archivo con información de los ingresos percibidos por diferentes
empleados en concepto de comisión, de cada uno de ellos se conoce: código de empleado,
nombre y monto de la comisión. La información del archivo se encuentra ordenada por
código de empleado y cada empleado puede aparecer más de una vez en el archivo de
comisiones.
Realice un procedimiento que reciba el archivo anteriormente descrito y lo compacte. En
consecuencia, deberá generar un nuevo archivo en el cual, cada empleado aparezca una
única vez con el valor total de sus comisiones.
NOTA: No se conoce a priori la cantidad de empleados. Además, el archivo debe ser
recorrido una única vez.
}

program ej1;
const
	valorAlto = 9999;
type
	empleado = record
		codE : integer;
		nombre:string;
		monto:real;
	end;

procedure leer (var fEmp:Text; var e:empleado);
begin
	if (not eof(fEmp)) then
		readln(fEmp,e.codE,e.monto,e.nombre)
	else
		e.codE := valorAlto;
end;

procedure procesarArchivo (var fEmp:Text);
var
	eLeido, eFinal : empleado; mTotal : real;
	fCompacto : Text;
begin
	assign(fCompacto,'compacto.txt');
	reset(fEmp); rewrite(fCompacto);
	leer(fEmp,eLeido);
	while (eLeido.codE <> valorAlto) do begin
		mTotal := 0;
		eFinal.codE := eLeido.codE;
		eFinal.nombre := eLeido.nombre;
		while (eLeido.codE <> valorAlto) and (eLeido.codE = eFinal.codE) do begin
			mTotal := mTotal + eLeido.monto;
			leer(fEmp,eLeido);
		end;
		eFinal.monto := mTotal;
		writeln(fCompacto,eFinal.codE,' ',eFinal.monto:2:2,eFinal.nombre);
	end;
	writeln('se compacto el archivo con exito');
	close(fEmp); close(fCompacto);
end;

var
	fEmpleados:Text;
begin
	assign(fEmpleados,'comisiones.txt');
	procesarArchivo(fEmpleados);
end.
