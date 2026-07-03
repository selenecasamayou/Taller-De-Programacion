program RedictadoParcial13;
type
	
	rangoMes = 1..12;
	
	compra = record
		cod: integer;
		num: integer;
		mes: rangoMes;
		monto: real;
	end;
	
	vector = array [rangoMes] of real;
	
	regArbol = record
		cod: integer;
		v: vector;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: regArbol;
		HI: arbol;
		HD: arbol;
	end;
	
	
	procedure LeerCompra(var c: compra);
	begin
		readln(c.cod);
		if (c.cod <> 0) then begin
			c.num:= random(200);
			c.mes:= random(12) + 1;
			c.monto:= random(500);
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
			writeln('-cod: ', a^.dato.cod);
			ImprimirVector(a^.dato.v);
			ImprimirArbol(a^.HD);
		end;
	end;
	
	
	procedure BuscarMesMax(v: vector; var montoMax: real; var mesMax: integer);
	var
		i: integer;
	begin
		for i:= 1 to 12 do begin
			if (v[i] > montoMax) then begin
				montoMax:= v[i];
				mesMax:= i;
			end;
		end;
	end;			
	
	
	procedure ObtenerMesMaximo(a: arbol; unCod: integer; var montoMax: real; var mesMax: integer);  // PUNTO B
	begin
		if (a <> nil) then begin
			if (a^.dato.cod = unCod) then
				BuscarMesMax(a^.dato.v, montoMax, mesMax)
			else
				if (unCod < a^.dato.cod) then
					ObtenerMesMaximo(a^.HI, unCod, montoMax, mesMax)
				else
					ObtenerMesMaximo(a^.HD, unCod, montoMax, mesMax);
		end;
	end; 
	
	
	function BuscarClientesSinGastos(a: arbol; unMes: integer): integer;   // PUNTO C
	begin
		if (a = nil) then
			BuscarClientesSinGastos:= 0
		else
			if (a^.dato.v[unMes] = 0) then
				BuscarClientesSinGastos:= BuscarClientesSinGastos(a^.HI, unMes) + BuscarClientesSinGastos(a^.HD, unMes) + 1
			else
				BuscarClientesSinGastos:= BuscarClientesSinGastos(a^.HI, unMes) + BuscarClientesSinGastos(a^.HD, unMes);
	end; 
	
	
var
	a: arbol;
	unCod, mesMax, unMes, cantClientes: integer;
	montoMax: real;
begin
	randomize;
	CargarArbol(a);   // PUNTO A
	ImprimirArbol(a);
	writeln('ingrese un cod');
	readln(unCod);
	montoMax:= -1;
	ObtenerMesMaximo(a, unCod, montoMax, mesMax);   // PUNTO B
	writeln(mesMax);
	writeln('ingrese un mes');
	readln(unMes);
	cantClientes:= BuscarClientesSinGastos(a, unMes);   // PUNTO C
	writeln(cantClientes);
end.
