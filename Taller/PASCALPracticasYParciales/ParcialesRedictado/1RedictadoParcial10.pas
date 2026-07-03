program RedictadoParcial10;
type
	
	rangoDia = 1..30;
	rangoMes = 1..12;
	
	compra = record
		cod: integer;
		dia: rangoDia;
		mes: rangoMes;
		monto: real;
	end;
	
	vector = array [rangoMes] of real;
	
	reg = record
		cod: integer;
		v: vector;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: reg;
		HI: arbol;
		HD: arbol;
	end;
	
	
	procedure LeerCompra(var c: compra);
	begin
		readln(c.cod);
		if (c.cod <> 0) then begin
			c.dia:= random(30) + 1;
			c.mes:= random(12) + 1;
			c.monto:= random(2000);
		end;
	end;
	
	
	procedure InicializarVector(var v: vector);
	var
		i: integer;
	begin
		for i:= 1 to 12 do
			v[i]:= 0;
	end;
	
	
	procedure InsertarElemento(var a: arbol; c: compra);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato.cod:= c.cod;
			InicializarVector(a^.dato.v);
			a^.dato.v[c.mes]:= c.monto;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else begin
			if (c.cod = a^.dato.cod) then
				a^.dato.v[c.mes]:= a^.dato.v[c.mes] + c.monto
			else
				if (c.cod < a^.dato.cod) then
					InsertarElemento(a^.HI, c)
				else
					InsertarElemento(a^.HD, c);
		end;
	end;
	
	
	procedure CargarArbol(var a: arbol);  // PUNTO A
	var
		c: compra;
	begin
		a:= nil;
		writeln('ingrese un cod');
		LeerCompra(c);
		while (c.cod <> 0) do begin
			InsertarElemento(a, c);
			LeerCompra(c);
		end;
	end;
	
	
	procedure ImprimirVector(v: vector);
	var
		i: integer;
	begin
		for i:= 1 to 12 do begin
			writeln('mes: ', i);
			writeln('monto: ', v[i]:2:2);
		end;
	end;
	
	
	procedure ImprimirArbol(a: arbol);
	begin
		if (a <> nil) then begin
			ImprimirArbol(a^.HI);
			writeln('cod: ', a^.dato.cod);
			ImprimirVector(a^.dato.v);
			ImprimirArbol(a^.HD);
		end;
	end;
	
	
	function ObtenerMaximoRecursivo(v: vector; var montoMax: real): integer;
	var
		i, mesMax: integer;
	begin
		for i:= 1 to 12 do begin
			if (v[i] > montoMax) then begin
				montoMax:= v[i];
				mesMax:= i;
			end;
		end;
		ObtenerMaximoRecursivo:= mesMax;	
	end;
	
	
	function RecorrerArbol(a: arbol; unCod: integer; var montoMax: real): integer;
	begin
		if (a = nil) then 
			RecorrerArbol:= 0
		else
			if (a^.dato.cod = unCod) then
				RecorrerArbol:= ObtenerMaximoRecursivo(a^.dato.v, montoMax)
			else
				if (a^.dato.cod < unCod) then
					RecorrerArbol:= RecorrerArbol(a^.HI, unCod, montoMax)
				else
					RecorrerArbol:= RecorrerArbol(a^.HD, unCod, montoMax)
	end;
	
	
	procedure ObtenerMaximo(a: arbol; unCod: integer; var mesMax: integer);  // PUNTO B
	var
		montoMax: real; 
	begin
		montoMax:= -1;
		mesMax:= RecorrerArbol(a, unCod, montoMax);
	end;
		
	
	function ObtenerCantClientes(a: arbol; unMes: integer): integer;  // PUNTO C
	begin
		if (a = nil) then
			ObtenerCantClientes:= 0
		else
			if (a^.dato.v[unMes] = 0) then
				ObtenerCantClientes:= ObtenerCantClientes(a^.HI, unMes) + ObtenerCantClientes(a^.HD, unMes) + 1
			else
				ObtenerCantClientes:= ObtenerCantClientes(a^.HI, unMes) + ObtenerCantClientes(a^.HD, unMes)
	end;
	
	
var
	a: arbol;
	unCod, mesMax, unMes, cantCumple: integer;
begin
	randomize;
	CargarArbol(a);   // PUNTO A
	ImprimirArbol(a);
	writeln('ingrese un cod');
	readln(unCod);
	ObtenerMaximo(a, unCod, mesMax);   // PUNTO B no funciona si no es el primero
	writeln(mesMax);
	writeln('ingrese un mes');
	readln(unMes);
	cantCumple:= ObtenerCantClientes(a, unMes);   // PUNTO C
	writeln(cantCumple);
end.	
