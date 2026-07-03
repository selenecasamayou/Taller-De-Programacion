program RedictadoParcial9;
type
	
	rangoAnio = 2011..2024;
	
	finales = record
		legajo: integer;
		nota: integer;
		fecha: rangoAnio;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: finales;
		sig: lista;
	end;
	
	vector = array [rangoAnio] of lista;
	
	arbol = ^nodo1;
	nodo1 = record
		dato: finales;
		HI: arbol;
		HD: arbol;
	end;
	
	
	procedure InicializarVector(var v: vector);
	var
		i: integer;
	begin
		for i:= 2011 to 2024 do
			v[i]:= nil;
	end;
	
	
	procedure LeerFinal(var f: finales);
	begin
		readln(f.legajo);
		if (f.legajo <> -1) then begin
			f.nota:= random(10) + 1;
			f.fecha:= random(2024 - 2011 + 2011) + 1;
		end;
	end;
	
	
	procedure InsertarOrdenado(var l: lista; f: finales);
	var
		aux, ant, act: lista;
	begin
		new(aux);
		aux^.dato:= f;
		act:= l;
		while (act <> nil) and (act^.dato.nota < f.nota) do begin
			ant:= act;
			act:= act^.sig;
		end;
		if (act = l) then
			l:= aux
		else
			ant^.sig:= aux;
		aux^.sig:= act;
	end;
	
	
	procedure CargarVector(var v: vector);  // PUNTO A
	var
		f: finales;
	begin
		InicializarVector(v);
		writeln('ingrese un legajo');
		LeerFinal(f);
		while (f.legajo <> -1) do begin
			InsertarOrdenado(v[f.fecha], f);
			LeerFinal(f);
		end;
	end;
	
	
	procedure ImprimirLista(l: lista);
	begin
		while (l <> nil) do begin
			writeln('legajo: ', l^.dato.legajo);
			writeln('nota: ', l^.dato.nota);
			writeln('año: ', l^.dato.fecha);
			l:= l^.sig;
		end;
	end;
	
	
	procedure ImprimirVector(v: vector);
	var
		i: integer;
	begin
		for i:= 2011 to 2024 do begin
			writeln('-año: ', i);
			ImprimirLista(v[i]);
		end;
	end;
	
	
	procedure InsertarElemento(var a: arbol; f: finales);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato:= f;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else begin
			if (f.legajo < a^.dato.legajo) then
				InsertarElemento(a^.HI, f)
			else
				InsertarElemento(a^.HD, f)
		end;
	end;
	
	
	procedure RecorrerLista(l: lista; var a: arbol; nota: integer);
	begin
		while (l <> nil) and (l^.dato.nota > nota) do begin
			InsertarElemento(a, l^.dato);
			l:= l^.sig;
		end;	
	end;
	
	
	procedure CargarArbol(v: vector; var a: arbol; nota: integer);  // PUNTO B
	var
		i: integer;
	begin
		a:= nil;
		for i:= 2011 to 2024 do begin
			RecorrerLista(v[i], a, nota);
		end;
	end;
	
	
	function ObtenerCantExamenes(a: arbol; legajo: integer): integer;
	begin
		if (a = nil) then
			ObtenerCantExamenes:= 0
		else
			if (a^.dato.legajo = legajo) then
				ObtenerCantExamenes:= ObtenerCantExamenes(a^.HI, legajo) + ObtenerCantExamenes(a^.HD, legajo) + 1
			else
				ObtenerCantExamenes:= ObtenerCantExamenes(a^.HI, legajo) + ObtenerCantExamenes(a^.HD, legajo);
	end;
	
	
var
	v: vector;
	a: arbol;
	nota, legajo, cantExamen: integer;
begin
	randomize;
	CargarVector(v);   // PUNTO A
	ImprimirVector(v);
	writeln('ingrese una nota');
	readln(nota);
	CargarArbol(v, a, nota);   // PUNTO B
	writeln('ingrese un legajo');
	readln(legajo);
	cantExamen:= ObtenerCantExamenes(a, legajo);
	writeln(cantExamen);
end.	
