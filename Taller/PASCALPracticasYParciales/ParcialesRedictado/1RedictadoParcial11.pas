program RedictadoParcial11;
type
	
	rangoDia = 1..30;
	rangoCategoria = 1..5;
	
	compra = record
		cod: integer;
		codCli: integer;
		dia: rangoDia;
		categoria: rangoCategoria;
	end;
	
//----------------------------------//	
	
	regLista = record
		codCli: integer;
		dia: rangoDia;
		categoria: rangoCategoria;
	end;
	
	lista = ^nodo1;
	nodo1 = record
		dato: regLista;
		sig: lista;
	end;
	
	regArbol = record
		cod: integer;
		l: lista;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: regArbol;
		HI: arbol;
		HD: arbol;
	end;
	
	vector = array [rangoCategoria] of integer;
	
	
	procedure InicializarVector(var v: vector);
	var
		i: integer;
	begin
		for i:= 1 to 5 do
			v[i]:= 0;
	end;
	
	
	procedure LeerCompra(var c: compra);
	begin
		readln(c.codCli);
		if (c.codCli <> 0) then begin
			c.cod:= random(100);
			c.dia:= random(30) + 1;
			c.categoria:= random(5) + 1;
		end;	
	end;
	
	
	procedure AgregarAdelante(var l: lista; c: compra);
	var
		aux: lista;
	begin
		new(aux);
		aux^.dato.codCli:= c.codCli;
		aux^.dato.dia:= c.dia;
		aux^.dato.categoria:= c.categoria;
		aux^.sig:= l;
		l:= aux;
	end;
	
	
	procedure InsertarElemento(var a: arbol; c: compra);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato.cod:= c.cod;
			a^.dato.l:= nil;
			AgregarAdelante(a^.dato.l, c);
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else begin
			if (c.cod = a^.dato.cod) then
				AgregarAdelante(a^.dato.l, c)
			else
				if (c.cod < a^.dato.cod) then
					InsertarElemento(a^.HI, c)
				else
					InsertarElemento(a^.HD, c);
		end;
	end;
	
	
	procedure CargarEstructuras(var a: arbol; var v: vector);  // PUNTO A
	var
		c: compra;
	begin
		a:= nil;
		InicializarVector(v);
		writeln('ingrese un cod cliente');
		LeerCompra(c);
		while (c.codCli <> 0) do begin
			InsertarElemento(a, c);
			v[c.categoria]:= v[c.categoria] + 1;
			LeerCompra(c);
		end;
	end;
	
	
	procedure ImprimirLista(l: lista);
	begin
		while (l <> nil) do begin
			writeln('cod cliente: ', l^.dato.codCli);
			writeln('dia: ', l^.dato.dia);
			writeln('categoria: ', l^.dato.categoria);
			l:= l^.sig;
		end;
	end;
	
	
	procedure ImprimirArbol(a: arbol);
	begin
		if (a <> nil) then begin
			ImprimirArbol(a^.HI);
			writeln('cod: ', a^.dato.cod);
			ImprimirLista(a^.dato.l);
			ImprimirArbol(a^.HD);
		end;
	end;
	
	
	procedure ImprimirVector(v: vector);
	var
		i: integer;
	begin
		for i:= 1 to 5 do begin
			writeln('categoria: ', i);
			writeln('cant entregas: ', v[i]);
		end;
	end;
	
	
	function RecorrerLista(l: lista; unCodCli: integer): integer;
	var
		cantCumple: integer;
	begin
		cantCumple:= 0;
		while (l <> nil) do begin
			if (l^.dato.codCli = unCodCli) then
				cantCumple:= cantCumple + 1;
			l:= l^.sig;
		end;
		RecorrerLista:= cantCumple;
	end;
	
	
	function ObtenerCantEntregas(a: arbol; unCodCli, cotaInf, cotaSup: integer): integer;
	begin
		if (a = nil) then
			ObtenerCantEntregas:= 0
		else begin
			if (a^.dato.cod > cotaInf) then
				if (a^.dato.cod < cotaSup) then
					ObtenerCantEntregas:= ObtenerCantEntregas(a^.HI, unCodCli, cotaInf, cotaSup) +ObtenerCantEntregas(a^.HD, unCodCli, cotaInf, cotaSup) + RecorrerLista(a^.dato.l, unCodCli)
				else
					ObtenerCantEntregas:= ObtenerCantEntregas(a^.HI, unCodCli, cotaInf, cotaSup)
			else
				ObtenerCantEntregas:= ObtenerCantEntregas(a^.HD, unCodCli, cotaInf, cotaSup);
		end;
	end;
	
	
	procedure ObtenerCantEntregasEntreDosCodigos(a: arbol; unCodCli: integer; var cantEntregas: integer);  // PUNTO B
	var
		cotaInf, cotaSup: integer;
	begin
		writeln('ingrese cota inferior');
		readln(cotaInf);
		writeln('ingrese cota superior');
		readln(cotaSup);
		cantEntregas:= ObtenerCantEntregas(a, unCodCli, cotaInf, cotaSup);
	end;
	
	
	function BuscarCategoria(v: vector; unaCantEntregas: integer; diml: integer): boolean;  // PUNTO C
	begin
		if (diml = 0) then
			BuscarCategoria:= false
		else
			if (v[diml] = unaCantEntregas) then
				BuscarCategoria:= true
			else
				BuscarCategoria:= BuscarCategoria(v, unaCantEntregas, diml-1)
	end;
	
	
var
	a: arbol;
	v: vector;
	unCodCli, cantEntregas, unaCantEntregas, diml: integer;
	existe: boolean;
begin
	randomize;
	CargarEstructuras(a, v);   // PUNTO A
	ImprimirArbol(a);
	writeln('-----------------------');
	ImprimirVector(v);
	writeln('ingrese un cod cliente');
	readln(unCodCli);
	ObtenerCantEntregasEntreDosCodigos(a, unCodCli, cantEntregas);   // PUNTO B
	writeln(cantEntregas);
	writeln('ingrese una cant de entregas');
	readln(unaCantEntregas);
	diml:= 5;
	existe:= BuscarCategoria(v, unaCantEntregas, diml);   // PUNTO C
	writeln(existe);
end.	
