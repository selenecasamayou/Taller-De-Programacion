program redictado;
type
	
	libro = record
		ISBN: integer;
		codAutor: integer;
		genero: integer;
	end;
	
	regArbol = record
		codAutor: integer;
		cantLibros: integer;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: regArbol;
		HI: arbol;
		HD: arbol;
	end;
	
	regVector = record
		genero: integer;
		cantLibros: integer;
	end;
	
	vecGeneros = array [1..7] of regVector;
	
	procedure InicializarVector(var vg: vecGeneros);
	var
		i: integer;
	begin
		for i:= 1 to 7 do begin
			vg[i].genero:= i;
			vg[i].cantLibros:= 0;
		end;
	end;
		
	
	procedure LeerLibro(var l: libro);
	begin
		readln(l.ISBN);
		if (l.ISBN <> 0) then begin
			l.codAutor:= random(100);
			l.genero:= random(7) + 1;
		end;
	end;
	
	
	procedure InsertarElemento(var a: arbol; l: libro);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato.codAutor:= l.codAutor;
			a^.dato.cantLibros:= 1;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else begin
			if (l.codAutor = a^.dato.codAutor) then
				a^.dato.cantLibros:= a^.dato.cantLibros + 1
			else
				if (l.codAutor < a^.dato.codAutor) then
					InsertarElemento(a^.HI, l)
				else
					InsertarElemento(a^.HD, l);
		end;
	end;
		
		
	procedure CargarEstructuras(var a: arbol; var vg: vecGeneros);   // PUNTO A
	var
		l: libro;
	begin
		a:= nil;
		InicializarVector(vg);
		writeln('ingrese un ISBN');
		LeerLibro(l);
		while (l.ISBN <> 0) do begin
			InsertarElemento(a, l);
			vg[l.genero].cantLibros:= vg[l.genero].cantLibros + 1;
			LeerLibro(l);
		end;
	end;
	
	
	procedure ImprimirArbol(a: arbol);
	begin
		if (a <> nil) then begin
			ImprimirArbol(a^.HI);
			writeln('cod: ', a^.dato.codAutor);
			writeln('cant libros: ', a^.dato.cantLibros);
			ImprimirArbol(a^.HD);
		end;
	end;
	
	
	procedure ImprimirVector(vg: vecGeneros);
	var
		i: integer;
	begin
		for i:= 1 to 7 do begin
			writeln('genero: ', i);
			writeln('cant libros: ', vg[i].cantLibros);
		end;	
	end;
	
	
	procedure OrdenSeleccion(var vg: vecGeneros; diml: integer; var genero: String);  // PUNTO B
	var
		i, j, pos, codGenero: integer;
		dato: regVector;
		v: array [1..7] of string = ('literario', 'filosofía', 'arte', 'biología', 'computación', 'medicina', 'ingeniería');
		
	begin
		for i:= 1 to diml-1 do begin
			pos:= i;
			for j:= i+1 to diml do begin
				if (vg[j].cantLibros < vg[pos].cantLibros) then
					pos:= j;
			end;
			dato:= vg[pos];
			vg[pos]:= vg[i];
			vg[i]:= dato;
		end;
		codGenero:= vg[7].genero;
		genero:= v[codGenero];
	end;
	
	
	function ObtenerCantLibros(a: arbol; cotaInf, cotaSup: integer): integer;
	begin
		if (a = nil) then
			ObtenerCantLibros:= 0
		else begin
			if (a^.dato.codAutor >= cotaInf) then 
				if (a^.dato.codAutor <= cotaSup) then
					ObtenerCantLibros:= ObtenerCantLibros(a^.HI, cotaInf, cotaSup) + ObtenerCantLibros(a^.HD, cotaInf, cotaSup) + a^.dato.cantLibros
				else
					ObtenerCantLibros:= ObtenerCantLibros(a^.HI, cotaInf, cotaSup)
			else
				ObtenerCantLibros:= ObtenerCantLibros(a^.HD, cotaInf, cotaSup);
		end;
	end;
	
	
	procedure ObtenerCantLibrosEntreDosCodigos(a: arbol; var cantLibros: integer);  // PUNTO C
	var
		cotaInf, cotaSup: integer;
	begin
		writeln('ingrese cota inferior');
		readln(cotaInf);
		writeln('ingrese cota superior');
		readln(cotaSup);
		cantLibros:= ObtenerCantLibros(a, cotaInf, cotaSup);
	end;
	
	
var
	a: arbol;
	vg: vecGeneros;
	diml, cantLibros: integer;
	genero: String;
begin	
	randomize;
	CargarEstructuras(a, vg);   // PUNTO A
	ImprimirArbol(a);
	writeln('-------------------------------');
	ImprimirVector(vg);
	diml:= 7;
	OrdenSeleccion(vg, diml, genero);   // PUNTO B
	writeln('-------------------------------');
	ImprimirVector(vg);
	writeln(genero);
	ObtenerCantLibrosEntreDosCodigos(a, cantLibros);   // PUNTO C
	writeln(cantLibros);
end.	
