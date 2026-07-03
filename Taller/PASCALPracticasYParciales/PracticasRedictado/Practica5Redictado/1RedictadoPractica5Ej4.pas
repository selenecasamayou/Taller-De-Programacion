program redictado;
type
	
	reclamo = record
		cod: integer;
		dni: integer;
		anio: integer;
		tipo: integer;
	end;
	
//----------------------------//	
	
	regLista = record
		cod: integer;
		anio: integer;
		tipo: integer;
	end;
	
	lista = ^nodo1;
	nodo1 = record
		dato: regLista;
		sig: lista;
	end;
	
	regArbol = record
		dni: integer;
		cantReclamos: integer;
		l: lista; 
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: regArbol;
		HI: arbol;
		HD: arbol;
	end;

//----------------------------//
	
	listaCod = ^nodoCod;
	nodoCod = record
		dato: integer;
		sig: listaCod;
	end;
	
	procedure LeerReclamo(var r: reclamo);
	begin
		readln(r.cod);
		if (r.cod <> 0) then begin
			r.dni:= random(100);
			r.anio:= random(2026 - 2011)+ 2011; 
			r.tipo:= random(20);
		end;	
	end;
	
	
	procedure AgregarAdelante(var l: lista; r: reclamo);
	var
		aux: lista;
	begin
		new(aux);
		aux^.dato.cod:= r.cod;
		aux^.dato.anio:= r.anio;
		aux^.dato.tipo:= r.tipo;
		aux^.sig:= l;
		l:= aux;
	end;
	
	
	procedure InsertarElemento(var a: arbol; r: reclamo);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato.dni:= r.dni;
			a^.dato.cantReclamos:= 1;
			a^.dato.l:= nil;
			AgregarAdelante(a^.dato.l, r);
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else begin
			if (r.dni = a^.dato.dni) then begin
				a^.dato.cantReclamos:= a^.dato.cantReclamos + 1;
				AgregarAdelante(a^.dato.l, r);
			end
			else
				if (r.dni < a^.dato.dni) then
					InsertarElemento(a^.HI, r)
				else
					InsertarElemento(a^.HD, r);
		end;
	end;
	
	
	procedure CargarArbol(var a: arbol);  // PUNTO A
	var
		r: reclamo;
	begin
		a:= nil;
		writeln('ingrese un cod');
		LeerReclamo(r);
		while (r.cod <> 0) do begin
			InsertarElemento(a, r);
			LeerReclamo(r);
		end;
	end;
	
	
	procedure ImprimirLista(l: lista);
	begin
		while (l <> nil) do begin
			writeln('cod: ', l^.dato.cod);
			writeln('año: ', l^.dato.anio);
			writeln('tipo: ', l^.dato.tipo);
			l:= l^.sig;
		end;
	end;
	
	
	procedure ImprimirArbol(a: arbol);
	begin
		if (a <> nil) then begin
			ImprimirArbol(a^.HI);
			writeln('dni: ', a^.dato.dni);
			writeln('cant de reclamos: ', a^.dato.cantReclamos);
			ImprimirLista(a^.dato.l);
			ImprimirArbol(a^.HD);
		end;
	end;
	
	
	function ObtenerCantReclamos(a: arbol; unDni: integer): integer;   // PUNTO B
	begin
		if (a = nil) then
			ObtenerCantReclamos:= 0
		else
			if (a^.dato.dni = unDni) then
				ObtenerCantReclamos:= a^.dato.cantReclamos
			else
				if (a^.dato.dni > unDni) then
					ObtenerCantReclamos:= ObtenerCantReclamos(a^.HI, unDni)
				else
					ObtenerCantReclamos:= ObtenerCantReclamos(a^.HD, unDni)
	end;
	
	
	function ObtenerCantReclamosEntreDos(a: arbol; cotaInf, cotaSup: integer): integer;
	begin
		if (a = nil) then
			ObtenerCantReclamosEntreDos:= 0
		else
			if (a^.dato.dni > cotaInf) then
				if (a^.dato.dni < cotaSup) then
					ObtenerCantReclamosEntreDos:= ObtenerCantReclamosEntreDos(a^.HI, cotaInf, cotaSup) + ObtenerCantReclamosEntreDos(a^.HD, cotaInf, cotaSup) + a^.dato.cantReclamos
				else
					ObtenerCantReclamosEntreDos:= ObtenerCantReclamosEntreDos(a^.HI, cotaInf, cotaSup)
			else
				ObtenerCantReclamosEntreDos:= ObtenerCantReclamosEntreDos(a^.HD, cotaInf, cotaSup)
	end;
	
	
	procedure ObtenerCantReclamosEntreDosCodigos(a: arbol; var cantReclamosCumple: integer);  // PUNTO C
	var
		cotaInf, cotaSup: integer;
	begin
		writeln('ingrese cota inferior');
		readln(cotaInf);
		writeln('ingrese cota superior');
		readln(cotaSup);
		cantReclamosCumple:= ObtenerCantReclamosEntreDos(a, cotaInf, cotaSup);
	end;
	
	
	procedure AgregarAdelante2(var lcod: listaCod; cod: integer);
	var
		aux: listaCod;
	begin
		new(aux);
		aux^.dato:= cod;
		aux^.sig:= lcod;
		lcod:= aux;
	end;
	
	
	procedure RecorrerLista(l: lista; unAnio: integer; var lcod: listaCod);
	begin
		while (l <> nil) do begin
			if (l^.dato.anio = unAnio) then
				AgregarAdelante2(lcod, l^.dato.cod);
			l:= l^.sig;
		end;	
	end;
	
	
	procedure BuscarCodigos(a: arbol; unAnio: integer; var lcod: listaCod);  // PUNTO D
	begin
		if (a <> nil) then begin
			BuscarCodigos(a^.HI, unAnio, lcod);
			RecorrerLista(a^.dato.l, unAnio, lcod);
			BuscarCodigos(a^.HD, unAnio, lcod);
		end;
	end;
	
	
	procedure ImprimirLista2(lcod: listaCod);
	begin
		while (lcod <> nil ) do begin
			writeln('cod: ', lcod^.dato);
			lcod:= lcod^.sig;
		end;
	end;
	
	
var
	a: arbol;
	unDni, cantReclamos, cantReclamosCumple, unAnio: integer;
	lcod: listaCod;
begin
	randomize;
	CargarArbol(a);   // PUNTO A
	ImprimirArbol(a);
	{writeln('ingrese un dni');
	readln(unDni);
	cantReclamos:= ObtenerCantReclamos(a, unDni);   // PUNTO B
	writeln(cantReclamos);
	ObtenerCantReclamosEntreDosCodigos(a, cantReclamosCumple);   // PUNTO C
	writeln(cantReclamosCumple);}
	writeln('ingrese un año');
	readln(unAnio);
	BuscarCodigos(a, unAnio, lcod);   // PUNTO D
	ImprimirLista2(lcod);
end.
