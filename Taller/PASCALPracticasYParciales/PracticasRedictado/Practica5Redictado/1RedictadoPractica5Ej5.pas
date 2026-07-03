program redictado;
type
	
	compra = record
		cod: integer;
		codCli: integer;
		mes: integer;
	end;
	
//---------------------------//

	regLista = record
		codCli: integer;
		mes: integer;
	end;
	
	lista = ^nodo1;
	nodo1 = record
		dato: regLista;
		sig: lista;
	end;
	
	regCompra = record
		cod: integer;
		l: lista;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: regCompra;
		HI: arbol;
		HD: arbol;
	end;
	
	
	procedure LeerCompra(var c: compra);
	begin
		readln(c.codCli);
		if (c.codCli <> 0) then begin
			c.cod:= random(30) + 1;
			c.mes:= random(12) + 1;
		end;
	end;
	
	
	procedure AgregarAdelante(var l: lista; c: compra);
	var
		aux: lista;
	begin
		new(aux);
		aux^.dato.codCli:= c.codCli;
		aux^.dato.mes:= c.mes;
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
					InsertarElemento(a^.HD, c)
		end;			
	end;
	
	
	procedure CargarArbol(var a: arbol);  // PUNTO A
	var
		c: compra;
	begin
		a:= nil;
		writeln('inrgese un cod cliente');
		LeerCompra(c);
		while (c.codCli <> 0) do begin
			InsertarElemento(a, c);
			LeerCompra(c);
		end;
	end;	
	
	
	procedure ImprimirLista(l: lista);
	begin
		while (l <> nil) do begin
			writeln('cod cliente: ', l^.dato.codCli);
			writeln('mes: ', l^.dato.mes);
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
	
	
	procedure ObtenerLista(a: arbol; unCod: integer; var lcod: lista);  // PUNTO B
	begin
		if (a = nil) then 
			lcod:= nil
		else
			if (a^.dato.cod = unCod) then
				lcod:= a^.dato.l
			else
				if (a^.dato.cod > unCod) then
					ObtenerLista(a^.HI, unCod, lcod)
				else
					ObtenerLista(a^.HD, unCod, lcod)
	end;
	
	
	function ObtenerCantClientes(lcod: lista; unMes: integer): integer;  // PUNTO C
	begin
		if (lcod = nil) then 
			ObtenerCantClientes:= 0
		else begin
			if (lcod^.dato.mes = unMes) then
				ObtenerCantClientes:= ObtenerCantClientes(lcod^.sig, unMes) + 1
			else
				ObtenerCantClientes:= ObtenerCantClientes(lcod^.sig, unMes);
		end;
	end;
	
	
var
	a: arbol;
	unCod, unMes, cantCli: integer;
	lcod: lista; 
begin
	randomize;
	CargarArbol(a);   // PUNTO A
	ImprimirArbol(a);
	writeln('ingrese un cod');
	readln(unCod);
	ObtenerLista(a, unCod, lcod);   // PUNTO B  anda raro
	ImprimirLista(lcod);
	writeln('ingrese un mes');
	readln(unMes);
	cantCli:= ObtenerCantClientes(lcod, unMes);   // PUNTO C
	writeln(cantCli);
end.
