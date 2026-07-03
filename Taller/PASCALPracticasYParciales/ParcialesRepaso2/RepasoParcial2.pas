program RepasoParcial2;
type
	
	rangoGenero = 1..15;
	
	libro = record
		ISBN: integer;
		codAutor: integer;
		codGenero: rangoGenero;
	end;
	
//--------------------------------//
	
	datos = record
		ISBN: integer;
		codGenero: rangoGenero;
	end;
	
	lista = ^nodo1;
	nodo1 = record
		dato: datos;
		sig: lista;
	end;
	
//--------------------------------//	
	
	regArbol = record
		codAutor: integer;
		l: lista;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: regArbol;
		HI: arbol;
		HD: arbol;
	end;
	
//--------------------------------//
	
	reg = record
		codAutor: integer;
		cantLibros: integer;
	end;
	
	lista2 = ^nodo2;
	nodo2 = record
		dato: reg;
		sig: lista2;
	end;
	
//--------------------------------//			
	
	procedure LeerLibro(var li: libro);
	begin
		li.ISBN:= random(100);
		if (li.ISBN <> 0) then begin
			li.codAutor:= random(2000) + 1;
			li.codGenero:= random(15) + 1;
		end;
	end;
	
	procedure AgregarAdelante(var l: lista; li: libro);
	var
		aux: lista;
	begin
		new(aux);
		aux^.dato.ISBN:= li.ISBN;
		aux^.dato.codGenero:= li.codGenero;
		aux^.sig:= l;
		l:= aux;
	end;
	
	procedure InsertarElemento(var a: arbol; li: libro);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato.codAutor:= li.codAutor;
			a^.dato.l:= nil;
			AgregarAdelante(a^.dato.l, li);
			a^.HI:= nil;
			a^.HD:= nil
		end	
		else
			if (li.codAutor < a^.dato.codAutor) then
				InsertarElemento(a^.HI, li)
			else
				if (li.codAutor > a^.dato.codAutor) then
					InsertarElemento(a^.HD, li)
				else
					AgregarAdelante(a^.dato.l, li);
	end;
	
	
	procedure CargarArbol(var a: arbol);  // PUNTO A
	var
		li:libro;
	begin
		a:= nil;
		LeerLibro(li);
		while (li.ISBN <> 0) do begin 
			InsertarElemento(a, li);
			LeerLibro(li);
		end;
	end;
	
	procedure ImprimirLista(l: lista);
	begin
		while (l <> nil) do begin
			writeln(l^.dato.ISBN);
			writeln(l^.dato.codGenero);
			l:= l^.sig;
		end;
	end;
	
	procedure ImprimirArbol(a: arbol);
	begin
		if (a <> nil) then begin
			ImprimirArbol(a^.HI);
			writeln(a^.dato.codAutor);
			ImprimirLista(a^.dato.l);
			ImprimirArbol(a^.HD);
		end;
	end;
	
	procedure AgregarAdelante2(codAutor, cantNodos: integer; var listaCod: lista2);
	var
		aux: lista2;
	begin
		new(aux);
		aux^.dato.codAutor:= codAutor;
		aux^.dato.cantLibros:= cantNodos;
		aux^.sig:= listaCod;
		listaCod:= aux;
	end;
	
	procedure RecorrerListaCod(regA: regArbol; var listaCod: lista2; codGen: integer);
	var
		cantNodos: integer;
	begin
		cantNodos:= 0;
		while (regA.l <> nil) do begin
			if (regA.l^.dato.codGenero > codGen) then
				cantNodos:= cantNodos + 1;
			regA.l := regA.l^.sig;
		end;
		AgregarAdelante2(regA.codAutor, cantNodos, listaCod); // asi o mejor pasarle regA.codAutor y regA.l
	end;
	
	procedure CargarLista(a: arbol; var listaCod: lista2; codAu, codGen: integer);  // PUNTO B
	begin
		if (a <> nil) then begin
			if (codAu = a^.dato.codAutor) then
				RecorrerListaCod(a^.dato, listaCod, codGen)
			else begin
				if (codAu < a^.dato.codAutor) then
					CargarLista(a^.HI, listaCod, codAu, codGen)
				else
					CargarLista(a^.HD, listaCod, codAu, codGen);
			end;
		end;	
	end;
	
	procedure ObtenerMaximo(listaCod: lista2; var codAuMax, cantLibrosMax: integer);  // PUNTO C
	begin
		if (listaCod <> nil) then begin
			if (listaCod^.dato.cantLibros > cantLibrosMax) then begin
				cantLibrosMax:= listaCod^.dato.cantLibros;
				codAuMax:= listaCod^.dato.codAutor;
			end;
			ObtenerMaximo(listaCod^.sig, codAuMax, cantLibrosMax); 
		end;
	end;
		
	
var
	a: arbol;
	listaCod: lista2;
	codAu, codGen: integer;
	codAuMax, cantLibrosMax: integer;
begin
	randomize;
	CargarArbol(a);  // PUNTO A
	ImprimirArbol(a);
	writeln('Ingrese un cod de autor');
	readln(codAu);
	writeln('Ingrese un cod de genero (1-15)');
	readln(codGen);
	listaCod:= nil;
	CargarLista(a, listaCod, codAu, codGen);  // PUNTO B
	cantLibrosMax:= -1;
	ObtenerMaximo(listaCod, codAuMax, cantLibrosMax);
	writeln ('El codigo max es: ', codAuMax, ' y la cant de libros es: ', cantLibrosMax);  // PUNTO C
end.
