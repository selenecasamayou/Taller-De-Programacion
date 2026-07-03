program Repaso4;
type
	
	rangoCod = 1..7;
	
	libro = record
		ISBN: integer;
		codAutor: integer;
		codGenero: rangoCod;
	end;
	
//--------------------------//
	
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
	
	vecGeneros = array [rangoCod] of integer;
	
//--------------------------//
	
	procedure InicializarVector(var vg: vecGeneros);
	var
		i: integer;
	begin
		for i:= 1 to 7 do 
			vg[i]:= 0;
	end;
	
	procedure LeerLibro(var l: libro);
	begin
		l.ISBN:= random(100);
		if (l.ISBN <> 0) then begin
			l.codAutor:= random(300) + 100;
			l.codGenero:= random(7) + 1;
		end;
	end;
	
	procedure InsertarElementos(var a: arbol; var vg: vecGeneros; l: libro);
	begin
		if (a = nil) then begin  // estructura 1
			new(a);
			a^.dato.codAutor:= l.codAutor;
			a^.dato.cantLibros:= a^.dato.cantLibros + 1;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else begin
			if (l.codAutor < a^.dato.codAutor) then
				InsertarElementos(a^.HI, vg, l)
			else
				InsertarElementos(a^.HD, vg, l);
		end;
		vg[l.codGenero]:= vg[l.codGenero] + 1;  // estructura 2
	end;
	
	procedure CargarArbolYVector(var a: arbol; var vg: vecGeneros);   // PUNTO A
	var
		l:libro;
	begin
		a:= nil;
		LeerLibro(l);
		while (l.ISBN <> 0) do begin
			InsertarElementos(a, vg, l);
			LeerLibro(l);
		end;
	end;
	
	function ObtenerGeneroMax(vg: vecGeneros): integer;  // PUNTO B
	var
		i: integer;
		generoMax, cantMax: integer;
	begin
	    cantMax:= -1;
		for i:= 1 to 7 do begin
			if (vg[i] > cantMax) then begin
				cantMax:= vg[i];
				generoMax:= i;    // ya se que lo hice de integers, pero "serian strings"
			end;	
		end;
		ObtenerGeneroMax:= generoMax;
	end;
	
	function ObtenerCantLibros(a: arbol; codInf, codSup: integer): integer;
	begin
		if (a = nil) then
			ObtenerCantLibros:= 0
		else begin
			if (a^.dato.codAutor >= codInf) then begin
				if (a^.dato.codAutor <= codSup) then
					ObtenerCantLibros:= ObtenerCantLibros(a^.HI, codInf, codSup) + ObtenerCantLibros(a^.HD, codInf, codSup) + 1
				else
					ObtenerCantLibros:= ObtenerCantLibros(a^.HI, codInf, codSup);
			end
			else
				ObtenerCantLibros:= ObtenerCantLibros(a^.HD, codInf, codSup);
		end;
	end;
	
	procedure ObtenerCantLibrosEntreDosCodigos(a: arbol);  // PUNTO C
	var
		codInf, codSup, cantTotal: integer;
	begin
		readln(codInf);
		readln(codSup);
		cantTotal:= ObtenerCantLibros(a, codInf, codSup);
		writeln('La cantidad de libros entre el codigo ', codInf, ' y el codigo ', codSup, ' es: ', cantTotal);
	end;
	
var
	a: arbol;
	vg: vecGeneros;
begin
	randomize;
	InicializarVector(vg);
	CargarArbolYVector(a, vg);  // PUNTO A
	writeln('El genero maximo es: ', ObtenerGeneroMax(vg));  // PUNTO B
	ObtenerCantLibrosEntreDosCodigos(a);  // PUNTO C
end.
