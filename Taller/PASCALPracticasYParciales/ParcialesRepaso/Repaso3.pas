program Repaso3;
type
	
	rangoMes = 1..12;
	
	compra = record
		codJuego: integer;
		codCli: integer;
		mes: rangoMes;
	end;
	
//--------------------//
	
	datos = record
		codCli: integer;
		mes: rangoMes;
	end;
	
	lista = ^nodo2;
	nodo2 = record
		dato: datos;
		sig: lista;
	end;
	
//--------------------//	
	
	regArbol = record
		codJuego: integer;
		l: lista;
	end;

	arbol = ^nodo1;
	nodo1 = record
		dato: regArbol;
		HI: arbol;
		HD: arbol;
	end;
	
//--------------------//		
	
	procedure LeerCompra(var c: compra);
	begin
		writeln('Ingrese un codigo de cliente');
		readln(c.codCli);
		if (c.codCli <> 0) then begin
			c.codJuego:= random(200);
			c.codCli:= random(300);
			c.mes:= random(12) + 1;
		end;
	end;
	
	procedure AgregarAdelante(var l:lista; c: compra);
	var
		aux: lista;
	begin
		new(aux);
		aux^.dato.codCli:= c.codCli;
		aux^.dato.mes:= c.mes;
		aux^.sig:= l;
		l:= aux;
	end;
	
	procedure InsertarElemento(var a: arbol; c:compra);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato.codJuego := c.codJuego;
			a^.dato.l:= nil;
			AgregarAdelante(a^.dato.l, c);
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else begin
			if (c.codJuego < a^.dato.codJuego) then 
				InsertarElemento(a^.HI, c)
			else
				if (c.codJuego > a^.dato.codJuego) then
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
		while (c.codCli <> 0) do begin
			InsertarElemento(a, c);
			LeerCompra(c);
		end;
	end;
	
	procedure BuscarCompra(a:arbol; codigoV: integer; var listaBuscada: lista);  // PUNTO B
	begin
		if (a = nil) then
			listaBuscada:= nil
		else begin
			if (a^.dato.codJuego = codigoV) then
				listaBuscada:= a^.dato.l
			else
				if (a^.dato.codJuego > codigoV) then
					BuscarCompra(a^.HI, codigoV, listaBuscada)
				else
					BuscarCompra(a^.HD, codigoV, listaBuscada);
		end;
	end;
	
	function CantClientesMes(l: lista; mes: integer): integer;  // PUNTO C
	begin
		if (l = nil) then
			CantClientesMes:= 0
		else begin
			if (l^.dato.mes = mes) then
				CantClientesMes:= CantClientesMes(l^.sig, mes) + 1
			else
				CantClientesMes:= CantClientesMes(l^.sig, mes);
		end;
	end;
	
var
	a: arbol;
	codigoV, mes: integer;
	listaBuscada: lista;
begin
	randomize;
	CargarArbol(a);  // PUNTO A
	writeln('Ingrese un codigo de videojuego');
	readln(codigoV);
	BuscarCompra(a, codigoV, listaBuscada);  // PUNTO B
	if (listaBuscada <> nil) then begin                      //lo hago para que no busque si la lista no se encontro
		writeln('Ingrese un mes');
		readln(mes);
		writeln(CantClientesMes(listaBuscada, mes));  // PUNTO C
	end;
end.
