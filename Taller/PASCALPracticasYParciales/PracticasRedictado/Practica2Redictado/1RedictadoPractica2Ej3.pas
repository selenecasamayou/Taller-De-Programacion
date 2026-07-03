program redictado;
const
	df = 20;
type
	
	vector = array [1..df] of integer;
	
	
	procedure CargarVectorRecursivo(var v: vector; var dl: integer);
	var
		numero: integer;
	begin
		numero:= random(1550 - 300 + 1) + 300;
		if (dl < df) then begin
			dl:= dl + 1;
			v[dl]:= numero;
			CargarVectorRecursivo(v, dl);
		end;
	end;
	
	
	procedure CargarVector(var v: vector; var dl: integer);  // PUNTO A
	begin
		dl:= 0;
		CargarVectorRecursivo(v, dl);
	end;
	
	
	procedure OrdenSeleccion(var v: vector; dl: integer);  // PUNTO B
	var
		i, j, pos, dato: integer;
	begin
		for i:= 1 to dl-1 do begin
			pos:= i;
			for j:= i+1 to dl do begin
				if (v[j] < v[pos]) then
					pos:= j;
			end;
			dato:= v[pos];
			v[pos]:= v[i];
			v[i]:= dato;
		end;
	end;
	
	
	procedure ImprimirVector(v: vector; dl: integer);
	var
		i: integer;
	begin
		for i:= 1 to dl do
			writeln(v[i]);
	end;
	
	
	procedure BusquedaDicotomicaRecursiva(v:vector; ini, fin, dato: integer; var pos: integer);   // PUNTO C
	var
		medio: integer;
	begin
		medio:= ((fin + ini) div 2);
		if (fin < ini) then                  // si mi vector esta vacio
			pos:= - 1
		else
			if (v[medio] = dato) then        // si encuentro el dato
				pos:= medio
			else
				if (v[medio] > dato) then    // si esta en la segunda mitad
					BusquedaDicotomicaRecursiva(v, ini, medio-1, dato, pos)
				else                         // si esta en la primera mitad
					BusquedaDicotomicaRecursiva(v, medio+1, fin, dato, pos);
	end;	
	
		
var
	v: vector;
	dl, ini, fin, dato, pos: integer;
begin
	randomize;
	CargarVector(v, dl);   // PUNTO A
	OrdenSeleccion(v, dl);   // PUNTO B
	ImprimirVector(v, dl);
	writeln('Ingresar un numero');
	readln(dato);
	ini:= 1;
	fin:= dl;
	BusquedaDicotomicaRecursiva(v, ini, fin, dato, pos);    // PUNTO C
	if (pos = -1) then
		writeln('El dato no se encontro')
	else
		writeln('El dato se encontro, y estaba en la posicion: ', pos);
end.
