program redictado;
const
	df = 50;
type
	
	rangoDia = 0..31;   //para el corte de control el 0
	rangoCod = 0..15;
	rangoCant = 0..99;
	
	venta = record
		dia: rangoDia;
		cod: rangoCod;
		cant: rangoCant;
	end;
	
	vector = array [1..df] of venta;
	
	
	procedure LeerVenta(var ve: venta);
	begin
		//ve.dia:= random(32);
		readln(ve.dia);
		if (ve.dia <> 0) then begin
			ve.cod:= random(16);
			writeln('Ingrese una cantidad');
			readln(ve.cant);
		end;
	end;
	
	
	procedure CargarVector(var v: vector; var dl: integer);  //  PUNTO A
	var
		ve: venta;
	begin
		dl:= 0;
		LeerVenta(ve);
		while ((dl < df) and (ve.dia <> 0)) do begin
			dl:= dl + 1;
			v[dl]:= ve;
			LeerVenta(ve);
		end;
	end;
	
	
	procedure ImprimirVector(v: vector; dl: integer);  //  PUNTO B
	var
		i: integer;
	begin
		for i:= 1 to dl do begin
			writeln('Dia ', v[dl].dia);
			writeln('Cod ', v[dl].cod);
			writeln('Cant ', v[dl].cant);
		end;	
	end;
	
	
	procedure OrdenSeleccion(var v: vector; dl: integer);  //  PUNTO C
	var
		i, j, pos: integer;
		dato: venta;
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
	
	
	procedure EliminarEntreValores(var v: vector; var dl: integer; valorInf, valorSup: integer);  //  PUNTO E
	var
		i, ini, fin, aBorrar: integer;
	begin
		ini:= 1;
		while ((ini < dl) and (v[ini].cod < valorInf )) do
			ini:= ini + 1;
		fin:= ini;
		while ((fin <= dl) and (v[fin].cod <= valorSup)) do
			fin:= fin + 1;
		aBorrar:= fin - ini;
		if (aBorrar > 0) then begin
			for i:= fin to dl do begin
				v[ini]:= v[i];
				ini:= ini + 1;
			end;	
			dl:= dl - aBorrar;
		end; 
	end;
	
	
	procedure NuevaEstructura(v:vector; dl: integer);  //  PUNTO G
	begin
	
	end;
	
var
	v: vector;
	dl, valorInf, valorSup: integer;
begin
	Randomize;
	CargarVector(v, dl);  //  PUNTO A
	ImprimirVector(v, dl);  //  PUNTO B
	OrdenSeleccion(v, dl);  //  PUNTO C
	//ImprimirVector(v, dl);  //  PUNTO D
	writeln('ingrese el valor inferior');
	readln(valorInf);
	writeln('ingrese el valor superior');
	readln(valorSup);
	EliminarEntreValores(v, dl, valorInf, valorSup);  //  PUNTO E
	ImprimirVector(v, dl);  //  PUNTO F
	NuevaEstructura(v, dl);  // PUNTO G     ni idea
	ImprimirVector(v, dl);  //  PUNTO H
end.
