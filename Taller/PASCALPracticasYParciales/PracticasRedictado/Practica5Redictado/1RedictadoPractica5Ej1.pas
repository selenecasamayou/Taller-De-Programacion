program redictado;
const
	df = 300;
type
	
	oficina = record
		cod: integer;
		dni: integer;
		valorExp: real;
	end;
	
	vector = array [1..df] of oficina;
	
	
	procedure LeerOficina(var o: oficina);
	begin
		readln(o.cod);
		if (o.cod <> 0) then begin
			o.dni:= random(100);		
			o.valorExp:= random(1000);
		end; 
	end;
	
	
	procedure CargarVector(var v: vector; var dl: integer);  // PUNTO A
	var
		o: oficina;
	begin
		dl:= 0;
		writeln('ingrese un codigo');
		LeerOficina(o);
		while ((dl < df) and (o.cod <> 0)) do begin
			dl:= dl + 1;
			v[dl]:= o;
			LeerOficina(o);
		end;	
	end;
	
	
	procedure ImprimirVector(v: vector; dl: integer);
	var
		i: integer;
	begin
		for i:= 1 to dl do begin
			writeln('cod: ', v[dl].cod);
			writeln('dni: ', v[dl].dni);
			writeln('valor de expensa: ', v[dl].valorExp);
		end;
	end;
	
	
	procedure OrdenSeleccion(var v: vector; dl: integer);
	var
		i, j, pos: integer;
		dato: oficina;
	begin
		for i:= 1 to dl-1 do begin
			pos:= i;
			for j:= i+1 to dl do begin
				if (v[j].cod < v[pos].cod) then
					pos:= j;
			end;
			dato:= v[pos];
			v[pos]:= v[i];
			v[i]:= dato;
		end;		
	end;
	
	
	procedure BusquedaDicotomicaRecursiva(v: vector; ini, fin, cod: integer; var pos, dni: integer);
	var
		medio: integer;
	begin
		medio:= ((fin + ini) div 2);
		if (fin < ini) then
			pos:= 0
		else begin
			if (v[medio].cod = cod) then begin
				pos:= medio;
				dni:= v[medio].dni;
			end
			else
				if (v[medio].cod < cod) then
					BusquedaDicotomicaRecursiva(v, ini, medio-1, cod, pos, dni)
				else
					BusquedaDicotomicaRecursiva(v, medio+1, fin, cod, pos, dni);
		end;
	end;
	
	
	function MontoTotalExpensas(v: vector; dl: integer): real;
	begin
		if (dl = 0) then
			MontoTotalExpensas:= 0
		else
			MontoTotalExpensas:= MontoTotalExpensas(v, dl-1) + v[dl].valorExp;
	end;
		
	
var
	v: vector;
	dl, ini, fin, cod, pos, dni: integer;
	monTotal: real;
begin
	randomize;
	CargarVector(v, dl);   // PUNTO A
	ImprimirVector(v, dl);
	OrdenSeleccion(v, dl);   // PUNTO B
	writeln('ingrese un valor');
	readln(cod);
	ini:= 1;
	fin:= dl;
	BusquedaDicotomicaRecursiva(v, ini, fin, cod, pos, dni);   // PUNTO C
	writeln('El monto total de las expensas es: ', MontoTotalExpensas(v,dl):2:2);   // punto D
end.
end.
