program RepasoParcial1;
type
	
	rangoDia = 1..31;
	
	compra = record
		codCli: integer;
		dia: rangoDia;
		cantProd: integer;
		monto: real;
	end;
	
//----------------------------//
	
	datos = record
		dia: rangoDia;
		cantProd: integer;
		monto: real;
	end;
	
	lista = ^nodo1;
	nodo1 = record
		dato: datos;
		sig: lista;
	end;
	
//----------------------------//	
	
	regArbol = record
		codCli: integer;
		l: lista;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: regArbol;
		HI: arbol;
		HD: arbol;
	end;
	
//----------------------------//
	
	procedure LeerCompra(var c: compra);
	begin
		c.cantProd:= random(300);
		if (c.cantProd <> 0) then begin
			c.codCli:= random(100);
			c.dia:= random(31) + 1;
			c.monto:= random(2000);
		end;
	end;
	
	procedure AgregarAdelante(var l: lista; c: compra);
	var
		aux: lista;
	begin
		new(aux);
		aux^.dato.dia:= c.dia;
		aux^.dato.cantProd:= c.cantProd;
		aux^.dato.monto:= c.monto;
		aux^.sig:= l;
		l:= aux;
	end;
	
	procedure InsertarElemento(var a: arbol; c:compra);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato.codCli:= c.codCli;
			a^.dato.l:= nil;
			AgregarAdelante(a^.dato.l, c);
			a^.HI:= nil;
			a^.HD:= nil;
		end	
		else begin
			if (c.codCli < a^.dato.codCli) then
				InsertarElemento(a^.HI, c)
			else
				if (c.codCli > a^.dato.codCli) then
					InsertarElemento(a^.HD, c)
				else
					AgregarAdelante(a^.dato.l, c);
		end;
	end;
	
	procedure CargarArbol(var a: arbol);  // PUNTO A	
	var
		c: compra;
	begin
		a:= nil;
		LeerCompra(c);
		while (c.cantProd <> 0) do begin
			InsertarElemento(a, c);
			LeerCompra(c);
		end;
	end;
	
	procedure AgregarAdelante2 (var l, listaCompras: lista);
	var
		aux: lista;
	begin
		new(aux);
		aux^.dato.dia:= l^.dato.dia;
		aux^.dato.cantProd:= l^.dato.cantProd;
		aux^.dato.monto:= l^.dato.monto;
		aux^.sig:= listaCompras;
		listaCompras:= aux;
	end;
	
	procedure BuscarCompra(a: arbol; var listaCompras: lista; cod: integer);  // PUNTO B
	begin
		if (a <> nil) then begin
			if (a^.dato.codCli = cod) then
				AgregarAdelante2(a^.dato.l, listaCompras)
			else begin
				if (cod < a^.dato.codCli) then
					BuscarCompra(a^.HI, listaCompras, cod)
				else
					BuscarCompra(a^.HD, listaCompras, cod);
			end;
		end;
	end;
	
	procedure ObtenerMontoMaximo(l: lista; var montoMax: real; var cantMax: integer);  // PUNTO C
	begin
		if (l = nil) then
			cantMax:= 0
		else begin
			if (l^.dato.cantProd > cantMax) then begin
				cantMax:= l^.dato.cantProd;
				montoMax:= l^.dato.monto;
			end;
			ObtenerMontoMaximo(l^.sig, montoMax, cantMax);
		end;
	end;
	
	procedure ImprimirLista(l: lista);
	begin
		while (l <> nil) do begin
			writeln(l^.dato.dia);
			writeln(l^.dato.cantProd);
			writeln(l^.dato.monto);
			l:=l^.sig;
		end;
	end;
	
	procedure ImprimirArbol (a:arbol);
	begin
		if (a <> nil) then begin
			ImprimirArbol(a^.HI);
			writeln('El codigo del cliente es: ', a^.dato.codCli);
			ImprimirLista(a^.dato.l);    
			ImprimirArbol(a^.HD);
		end;
	end;
	
var
	a: arbol;
	listaCompras: lista;
	cod, cantMax: integer;
	montoMax: real;
begin
	randomize;
	CargarArbol(a);  // PUNTO A	
	ImprimirArbol(a);
	cod:= random(100);
	listaCompras:= nil;
	BuscarCompra(a, listaCompras, cod); // PUNTO B	
	cantMax:= -1;
	ObtenerMontoMaximo(listaCompras, montoMax, cantMax);  // PUNTO C
	writeln('El monto de la compra con mas cantidad de productos es: ', montoMax);  // PUNTO C
end.
