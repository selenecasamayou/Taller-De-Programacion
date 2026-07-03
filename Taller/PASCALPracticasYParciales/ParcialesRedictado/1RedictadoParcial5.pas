program RedictadoParcial5;
type
	
	rangoDia = 1..30;
	rangoMes = 1..12;
	
	compra = record
		cod: integer;
		codCli: integer;
		dia: rangoDia;
		mes: rangoMes;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: compra;
		HI: arbol;
		HD: arbol;
	end;
	
	vector = array [rangoMes] of arbol;
	
	
	procedure InicializarVector(var v: vector);
	var
		i: integer;
	begin
		for i:= 1 to 12 do
			v[i]:= nil;
	end;
	
	
	procedure LeerCompra(var c: compra);
	begin
		readln(c.codCli);
		if (c.codCli <> 0) then begin
			c.cod:= random(100);
			c.dia:= random(30) + 1;
			c.mes:= random(12) + 1;
		end;
	end;
	
	
	procedure InsertarElemento(var a: arbol; c: compra);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato:= c;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else begin
			if (c.cod < a^.dato.cod) then
				InsertarElemento(a^.HI, c)
			else
				InsertarElemento(a^.HD, c);
		end;
	end;
		
	
	procedure CargarVector(var v: vector);  // PUNTO A
	var
		c: compra;
	begin
		InicializarVector(v);
		writeln('ingrese un cod de cliente');
		LeerCompra(c);
		while (c.codCli <> 0) do begin
			InsertarElemento(v[c.mes], c);
			LeerCompra(c);
		end;
	end; 
	
	
	procedure ImprimirArbol(a: arbol);
	begin
		if (a <> nil) then begin
			ImprimirArbol(a^.HI);
			writeln('cod compra: ', a^.dato.cod);
			writeln('cod cliente: ', a^.dato.codCli);
			writeln('dia: ', a^.dato.dia);
			ImprimirArbol(a^.HD);
		end;
	end;
	
	
	procedure ImprimirVector(v: vector);
	var
		i: integer;
	begin
		for i:= 1 to 12 do begin
			writeln('mes: ', i);
			ImprimirArbol(v[i]);
		end;
	end; 
	
	
	function RecorrerArbol(a: arbol): integer;
	begin
		if (a = nil) then
			RecorrerArbol:= 0
		else
			RecorrerArbol:= RecorrerArbol(a^.HI) + RecorrerArbol(a^.HD) + 1;
	end;
	
	
	procedure ObtenerMesMaximo(v: vector; diml: integer; var mesMax, cantComprasMax: integer);  // PUNTO B
	var
		cantCompras: integer;
	begin
		if (diml > 0) then begin
			cantCompras:= RecorrerArbol(v[diml]);
			if (cantCompras > cantComprasMax) then begin
				cantComprasMax:= cantCompras;
				mesMax:= diml;
			end;
			ObtenerMesMaximo(v, diml-1, mesMax, cantComprasMax);
		end;
	end;
	
	
	function BuscarCodigo(a: arbol; unCod: integer): boolean;
	begin
		if (a = nil) then
			BuscarCodigo:= false
		else begin
			if (a^.dato.cod = unCod) then
				BuscarCodigo:= true
			else
				if (a^.dato.cod < unCod) then
					BuscarCodigo:= BuscarCodigo(a^.HI, unCod)
				else
					BuscarCodigo:= BuscarCodigo(a^.HD, unCod);
		end;
	end;
	
	
	function BuscarProducto(v: vector; unMes, unCod: integer): String;  // PUNTO C
	var
		encontre: boolean;
	begin
		encontre:= BuscarCodigo(v[unMes], unCod);
		if (encontre) then
			BuscarProducto:= 'fue comprado'
		else
			BuscarProducto:= 'no fue comprado';
	end;
	
	
var
	v: vector;
	diml, mesMax, cantComprasMax, unMes, unCod: integer;
	codComprado: String;
begin
	randomize;
	CargarVector(v);   // PUNTO A
	ImprimirVector(v);
	diml:= 8;
	cantComprasMax:= -1;
	ObtenerMesMaximo(v, diml, mesMax, cantComprasMax);   // PUNTO B
	//writeln('mes max: ', mesMax, ' cantidad: ', cantComprasMax);
	writeln('ingrese un mes y un numero');
	readln(unMes);
	readln(unCod);
	codComprado:= BuscarProducto(v, unMes, unCod);   // PUNTO C
	writeln(codComprado);
end.	
