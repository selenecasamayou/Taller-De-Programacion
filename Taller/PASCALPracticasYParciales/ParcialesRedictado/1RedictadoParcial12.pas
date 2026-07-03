program redictado;
type
	
	rangoMes = 1..12;
	
	resultado = record
		legajo: integer;
		cod: integer;
		mes: rangoMes;
		anio: integer;
		nota: integer;
	end;
	
	regLista = record
		cod: integer;
		mes: rangoMes;
		anio: integer;
		nota: integer;
	end;
	
	lista = ^nodo1;
	nodo1 = record
		dato: regLista;
		sig: lista;
	end;
	
	regArbol = record
		legajo: integer;
		l: lista;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: regArbol;
		HI: arbol;
		HD: arbol;
	end;
	
	vector = array [101..135] of integer;
	
	
	procedure InicializarVector(var v: vector);
	var
		i: integer;
	begin
		for i:= 101 to 135 do
			v[i]:= 0;
	end;
	
	
	procedure LeerResultado(var r: resultado);
	begin
		readln(r.cod);
		if (r.cod <> 0) then begin
			r.legajo:= random(100);
			r.mes:= random(12) + 1;
			r.anio:= random(135 - 101) + 101;
			r.nota:= random(10) + 1;
		end;
	end;
	
	
	procedure AgregarAdelante(var l: lista; r: resultado);
	var
		aux: lista;
	begin
		new(aux);
		aux^.dato.cod:= r.cod;
		aux^.dato.mes:= r.mes;
		aux^.dato.anio:= r.anio;
		aux^.dato.nota:= r.nota;
		aux^.sig:= l;
		l:= aux;
	end;
	
	
	procedure InsertarElemento(var a: arbol; r: resultado);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato.legajo:= r.legajo;
			a^.dato.l:= nil;
			AgregarAdelante(a^.dato.l, r);
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else begin
			if (r.legajo = a^.dato.legajo) then
				AgregarAdelante(a^.dato.l, r)
			else
				if (r.legajo < a^.dato.legajo) then
					InsertarElemento(a^.HI, r)
				else
					InsertarElemento(a^.HD, r);
		end;
	end;
	
	
	procedure CargarEstructuras(var a: arbol; var v: vector);  // PUNTO A
	var
		r: resultado;
	begin
		a:= nil;
		InicializarVector(v);
		writeln('ingrese un cod');
		LeerResultado(r);
		while (r.cod <> 0) do begin
			InsertarElemento(a, r);
			v[r.cod]:= v[r.cod] + 1;
			LeerResultado(r);
		end;
	end;
	
	
	procedure ImprimirLista(l: lista);
	begin
		while (l <> nil) do begin
			writeln('cod: ', l^.dato.cod);
			writeln('mes: ', l^.dato.mes);
			writeln('año: ', l^.dato.anio);
			writeln('nota: ', l^.dato.nota);
			l:= l^.sig;
		end;
	end;
	
	
	procedure ImprimirArbol(a: arbol);
	begin
		if (a <> nil) then begin
			ImprimirArbol(a^.HI);
			writeln('legajo: ', a^.dato.legajo);
			ImprimirLista(a^.dato.l);
			ImprimirArbol(a^.HD);
		end;
	end;
	
	
	procedure ImprimirVector(v: vector);
	var
		i: integer;
	begin
		for i:= 101 to 135 do begin
			writeln('cod materia: ', i);
			writeln('cant aplazos: ', v[i]);
		end;	
	end;
	
	
	procedure RecorrerNotas(l: lista; var cantNotas, sumaTotal: integer);
	begin
		while (l <> nil) do begin
			if (l^.dato.nota >= 4) then begin
				cantNotas:= cantNotas + 1;
				sumaTotal:= sumaTotal + l^.dato.nota;
			end;
			l:= l^.sig;
		end;
	end;
	
	
	procedure ObtenerPromedioSinAplazos(a: arbol; unLegajo: integer; var cantNotas, sumaTotal: integer);
	begin
		if (a <> nil) then
			if (a^.dato.legajo = unLegajo) then
				RecorrerNotas(a^.dato.l, cantNotas, sumaTotal)
			else
				if (a^.dato.legajo > unLegajo) then
					ObtenerPromedioSinAplazos(a^.HI, unLegajo, cantNotas, sumaTotal)
				else
					ObtenerPromedioSinAplazos(a^.HD, unLegajo, cantNotas, sumaTotal)
	end;
	
	
	procedure ObtenerPromedio(a: arbol; unLegajo: integer; var promedio: real);  // PUNTO B
	var
		cantNotas, sumaTotal: integer;
	begin
		cantNotas:= 0;
		sumaTotal:= 0;
		ObtenerPromedioSinAplazos(a, unLegajo, cantNotas, sumaTotal);
		promedio:= (cantNotas / sumaTotal);
	end;	
	
	
	procedure ObtenerMaximoRecursivo(v: vector; var cantAplazosMax, codMax: integer; diml: integer);  // PUNTO C
	begin
		if (diml <> 100) then begin       // como va de 101 a 135, si llega a 100 termino
			if (v[diml] > cantAplazosMax) then begin
				cantAplazosMax:= v[diml];
				codMax:= diml;
			end;
			ObtenerMaximoRecursivo(v, cantAplazosMax, codMax, diml-1);
		end;	
	end;
	
	
var
	a: arbol;
	v: vector;
	unLegajo, cantAplazosMax, codMax, diml: integer;
	promedio: real;
begin
	randomize;
	CargarEstructuras(a, v);   // PUNTO A
	ImprimirArbol(a);
	//ImprimirVector(v);
	writeln('ingrese un legajo');
	readln(unLegajo);
	ObtenerPromedio(a, unLegajo, promedio);   // PUNTO B
	{cantAplazosMax:= 0;
	diml:= 135;
	ObtenerMaximoRecursivo(v, cantAplazosMax, codMax, diml);   // PUNTO C
	writeln(codMax);}
end.	
