program redictadoParcial1;
type

	rangoGenero = 1..15;
	 
	libro = record                  // se usa para leer
		ISBN: integer;
		anioEd: integer;
		codAutor: integer;
		codGenero: rangoGenero;
	end;
	
//--------------------------------//	
	
	regLista = record
		ISBN: integer;
		anioEd: integer;
		codGenero: rangoGenero;
	end;
	
	lista = ^nodo1;
	nodo1 = record
		dato: regLista;
		sig: lista;
	end;
	
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
	
	listaAutor = ^nodo3;
	nodo3 = record
		dato: reg;
		sig: listaAutor;
	end;
	
	procedure LeerLibro(var li: libro);
	begin
		readln(li.ISBN);
		if (li.ISBN <> 0) then begin
			li.anioEd:= random(2026 - 2015 + 1) + 2015; 
			li.codAutor:= random(10);
			li.codGenero:= random(15) + 1;
		end;
	end;
	
	
	{procedure CargarLibro(var rl: regLista; li: libro);
	begin
		writeln(1);
		//rl.ISBN:= li.ISBN;
		writeln(1);
		rl.anioEd:= li.anioEd;
		rl.codGenero:= li.codGenero;
	end;}
	
	
	procedure AgregarAdelante(var l: lista; li: libro);
	var
		aux: lista;
	begin
		new(aux);
		//CargarLibro(l^.dato, li);  // para que quede mejor visualmente, porque se rompe????
		aux^.dato.ISBN:= li.ISBN;
		aux^.dato.anioEd:= li.anioEd;
		aux^.dato.codGenero:= li.codGenero;
		aux^.sig:= l;
		l:= aux;
	end;
	
	
	procedure InsertarElemento(var a: arbol; li: libro);
	begin
		if (a = nil) then  begin
			new(a);
			a^.dato.codAutor:= li.codAutor;
			a^.dato.l:= nil;
			AgregarAdelante(a^.dato.l, li);
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else begin
			if (li.codAutor = a^.dato.codAutor) then
				AgregarAdelante(a^.dato.l, li)
			else
				if (li.codAutor < a^.dato.codAutor) then
					InsertarElemento(a^.HI, li)
				else
					InsertarElemento(a^.HD, li);
		end;
	end;
	
	
	procedure CargarArbol(var a: arbol);
	var
		li: libro;
	begin
		a:= niL;
		writeln('ingrese un ISBN');
		LeerLibro(li);
		while (li.ISBN <> 0) do begin
			InsertarElemento(a, li);
			LeerLibro(li);
		end;
	end;
	
	
	procedure ImprimirLista(l: lista);
	begin
		while (l <> nil) do begin
			writeln('ISBN: ', l^.dato.ISBN);
			writeln('año edicion: ', l^.dato.anioEd);
			writeln('cod Genero: ', l^.dato.codGenero);
			l:= l^.sig;
		end;
	end;
		
		
	procedure ImprimirArbol(a: arbol);
	begin
		if (a <> nil) then begin
			ImprimirArbol(a^.HI);
			writeln('cod Autor: ', a^.dato.codAutor);
			ImprimirLista(a^.dato.l);
			ImprimirArbol(a^.HD);
		end;
	end;
		
	
	function RecorrerLista(l: lista): integer;
	var
		cantNodos: integer;
	begin
		cantNodos:= 0;
		while (l <> nil) do begin
			cantNodos:= cantNodos + 1;
			l:= l^.sig;
		end;
		RecorrerLista:= cantNodos;
	end;	
	
	
	procedure AgregarAdelante2(var la: listaAutor; codAutor, cantLibros: integer);
	var
		aux: listaAutor;
	begin
		new(aux);
		aux^.dato.codAutor:= codAutor;
		aux^.dato.cantLibros:= cantLibros;
		aux^.sig:= la;
		la:= aux;
	end;
		
		
	procedure CargarLista(a: arbol; var la: listaAutor; codigo: integer);
	var
		cantLibros: integer;
	begin
		if (a <> nil) then begin
			if (a^.dato.codAutor > codigo) then begin
				cantLibros:= RecorrerLista(a^.dato.l);
				writeln('a ',cantLibros);    //simplemente era para saber si funcionaba bien
				AgregarAdelante2(la, a^.dato.codAutor, cantLibros);
				CargarLista(a^.HI, la, codigo);
				CargarLista(a^.HD, la, codigo);
			end
			else	
				if (a^.dato.codAutor < codigo) then    // porque esta ordenada por codigo de autor
					CargarLista(a^.HD, la, codigo);
		end;
	end;
		
	
	procedure ObtenerMaximoRecursivo(la: listaAutor; var codMax, cantMax: integer);
	begin
		if (la <> nil) then begin
			if (la^.dato.cantLibros > cantMax) then begin
				cantMax:= la^.dato.cantLibros;
				codMax:= la^.dato.codAutor;
			end;
			ObtenerMaximoRecursivo(la^.sig, codMax, cantMax);
		end;
	end;
		
	
	procedure ObtenerMaximo(la: listaAutor; var codMax, cantMax: integer);
	begin
		cantMax:= 0;
		ObtenerMaximoRecursivo(la, codMax, cantMax);
	end;	
		
	
var
	a: arbol;
	la: listaAutor;
	codigo, codMax, cantMax: integer;
begin
	randomize;
	CargarArbol(a);   // PUNTO A
	ImprimirArbol(a);
	writeln('ingrese un codigo de autor');
	readln(codigo);
	CargarLista(a, la, codigo);   // PUNTO B
	ObtenerMaximo(la, codMax, cantMax);   // PUNTO C    
	writeln('El codigo max es: ', codMax, ' con la cantidad de libros de: ', cantMax);
end.
