program RepasoParcial4;
const
	df = 5;
type
	
	rangoCategoria = 1..5;
	
	entrega = record
		codComida: integer;
		codCli: integer;
		categoria: rangoCategoria;
	end;

//----------------------------------//
	
	regLista = record
		codCli: integer;
		categoria: rangoCategoria;
	end;
	
	lista = ^nodo1;
	nodo1 = record
		dato: regLista;
		sig: lista;
	end;
	
	regArbol = record
		codComida: integer;
		l: lista;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: regArbol;
		HI: arbol;
		HD: arbol;
	end;
	
//----------------------------------//	
	
	vector = array [1..df] of integer;

//----------------------------------//
	
	procedure ImprimirLista(l: lista);
	begin
		while (l <> nil) do begin
			writeln('cod cliente: ', l^.dato.codCli);
			writeln('categoria: ', l^.dato.categoria);
			l:= l^.sig;
		end;
	end;
	
	procedure ImprimirArbol(a: arbol);
	begin
		if (a <> nil) then begin
			ImprimirArbol(a^.HI);
			writeln('cod comida: ', a^.dato.codComida);
			ImprimirLista(a^.dato.l);
			ImprimirArbol(a^.HD);
		end;
	end;
	
	procedure InicializarVector(var v: vector);
	var
		i: integer;
	begin
		for i:= 1 to 5 do
			v[i]:= 0;
	end;
	
	procedure LeerEntrega(var e: entrega);
	begin
		e.codCli:= random(100);
		if (e.codCli <> 0) then begin
			e.codComida:= random(1000);
			e.categoria:= random(5) + 1;
		end;
	end;
	
	procedure AgregarAdelante(var l: lista; e: entrega);
	var
		aux: lista;
	begin
		new(aux);
		aux^.dato.codCli:= e.codCli;
		aux^.dato.categoria:= e.categoria;
		aux^.sig:= l;
		l:= aux;
	end;
	
	procedure InsertarElemento(var a: arbol; e: entrega);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato.codComida:= e.codComida;
			a^.dato.l:= nil;
			AgregarAdelante(a^.dato.l, e);
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else begin
			if (e.codComida < a^.dato.codComida) then
				InsertarElemento(a^.HI, e)
			else
				if (e.codComida > a^.dato.codComida) then
					InsertarElemento(a^.HD, e)
				else
					AgregarAdelante(a^.dato.l, e);
		end;
	end;
	
	procedure CargarVector(var v: vector; e: entrega);  // PUNTO A 
	begin
		v[e.categoria]:= v[e.categoria] + 1;
	end; 
	
	procedure CargarArbolYVector(var a: arbol; var v: vector);
	var
		e: entrega;
	begin
		a:= nil;
		LeerEntrega(e);
		while (e.codCli <> 0) do begin
			InsertarElemento(a, e);
			CargarVector(v, e);
			LeerEntrega(e);
		end;
	end;
	
	function RecorrerLista(l: lista; codCliente: integer): integer;
	var
		cant: integer;
	begin
		cant:= 0;
		while (l <> nil) do begin
			if (l^.dato.codCli = codCliente) then
				cant:= cant + 1;
			l:= l^.sig;
		end;
		RecorrerLista:= cant;
	end;
	
	function ObtenerCantEntregas(a: arbol;  codInf, codSup, codCliente: integer): integer;
	begin
		if (a = nil) then
			ObtenerCantEntregas:= 0
		else begin
			if (a^.dato.codComida > codInf) then begin
				if (a^.dato.codComida < codSup) then
					ObtenerCantEntregas:= ObtenerCantEntregas(a^.HI, codInf, codSup, codCliente) + ObtenerCantEntregas(a^.HD, codInf, codSup, codCliente) + RecorrerLista(a^.dato.l, codCliente)
				else
					ObtenerCantEntregas:= ObtenerCantEntregas(a^.HI, codInf, codSup, codCliente);
			end
			else
				ObtenerCantEntregas:= ObtenerCantEntregas(a^.HD, codInf, codSup, codCliente);
		end;
	end;
	
	procedure ObtenerCantEntregasEntreDosCodigos(a: arbol; var cantEntregasCli: integer);  // PUNTO B
	var
		codInf, codSup, codCliente: integer;
	begin
		writeln('Ingrese un codigo de comida inferior');
		readln(codInf);
		writeln('Ingrese un codigo de comida superior');
		readln(codSup);
		writeln('Ingrese un codigo de cliente');
		readln(codCliente);
		cantEntregasCli:= 	ObtenerCantEntregas(a, codInf, codSup, codCliente);
		writeln(cantEntregasCli);
	end;
	
	function BuscarCategoria(v: vector; cantEntregas, dim: integer): boolean;  // PUNTO C
	begin
		if (dim = 0) then
			BUscarCategoria:= false	
		else	
			if (v[dim] = cantEntregas) then
				BuscarCategoria:= true
			else
				BuscarCategoria:=BuscarCategoria(v, cantEntregas ,dim-1);
	end;
	
var
	a: arbol;
	v: vector;
	cantEntregasCli, cantEntregas, dim: integer;
	existe: boolean;
begin
	randomize;
	InicializarVector(v);
	CargarArbolYVector(a, v);  // PUNTO A 
	//ImprimirArbol(a);
	ObtenerCantEntregasEntreDosCodigos(a, cantEntregasCli);  // PUNTO B
	writeln('Ingrese una cant de entregas');
	readln(cantEntregas);
	dim:= df;
	existe:= BuscarCategoria(v, cantEntregas, dim);  // PUNTO C
	writeln(existe);
end.	
