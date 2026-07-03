program redictadoParcial2;
type
	
	encomienda = record
		dniEmisor: integer;
		dniReceptor: integer;
		ciudad: integer;   // seria String;
		peso: real;
	end;
	
//----------------------------------//
	
	regLista = record
		pesoTotal: real;
		cantTotal: integer;
	end;
	
	lista = ^nodo1;
	nodo1 = record
		dato: regLista;
		sig: lista;
	end;
	
	reg = record
		ciudad: integer;
		l: lista;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: reg;
		HI: arbol;
		HD: arbol;
	end;
	
	
	procedure LeerEncomienda(var e: encomienda);
	begin
		readln(e.peso);
		if (e.peso <> 0) then begin
			e.dniEmisor:= random(1000);
			e.dniReceptor:= random(1000);
			e.ciudad:= random(100);
		end;
	end;
	
	
	procedure AgregarAdelante(var l: lista; e: encomienda);
	var
		aux: lista;
	begin
		new(aux);
		aux^.dato.pesoTotal:= e.peso;
		aux^.dato.cantTotal:= 1;
		aux^.sig:= l;
		l:= aux;
	end;
	
	
	procedure InsertarElemento(var a: arbol; e: encomienda);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato.ciudad:= e.ciudad; // aca sw carga
			a^.dato.l:= nil;
			AgregarAdelante(a^.dato.l, e);
			a^.HI:= nil;
			a^.HD:= nil
		end
		else begin
			if (e.ciudad = a^.dato.ciudad) then begin
				a^.dato.l^.dato.pesoTotal:= a^.dato.l^.dato.pesoTotal + e.peso;
				a^.dato.l^.dato.cantTotal:= a^.dato.l^.dato.cantTotal + 1;
			end
			else
				if (e.ciudad < a^.dato.ciudad) then
					InsertarElemento(a^.HI, e)
				else
					InsertarElemento(a^.HD, e)
		end;
	end;
	
	
	procedure CargarRegistro(var rl: regLista; e: encomienda);
	begin
		rl.pesoTotal:= e.peso;
		rl.cantTotal:= 1;
	end;
	
	
	procedure CargarArbol(var a: arbol);  // PUNTO A
	var
		e: encomienda;
		rl: regLista;
	begin
		writeln('ingrese un peso');
		LeerEncomienda(e);
		while (e.peso <> 0) do begin
			CargarRegistro(rl, e);  // o aca 
			InsertarElemento(a, e);
			LeerEncomienda(e);
		end;
	end;
	
	
	procedure ImprimirLista(l: lista);
	begin
		while (l <> nil) do begin
			writeln('peso total: ', l^.dato.pesoTotal);
			writeln('cantidad total: ', l^.dato.cantTotal);
			l:= l^.sig;
		end;
	end;
	
	
	procedure ImprimirArbol(a: arbol);
	begin
		if (a <> nil) then begin
			ImprimirArbol(a^.HI);
			writeln('ciudad: ', a^.dato.ciudad);
			ImprimirLista(a^.dato.l);
			ImprimirArbol(a^.HD);
		end;
	end;
	
	
	procedure AgregarAdelante2(var l2: lista; reg: regLista);
	var
		aux: lista;
	begin
		new(aux);
		aux^.dato:= reg;
		aux^.sig:= l2;
		l2:= aux;
	end;
	
	
	procedure RecorrerLista(l: lista; var l2: lista; valorX: integer);
	begin
		while (l <> nil) do begin
			if (l^.dato.cantTotal > valorX) then 
				AgregarAdelante2(l2, l^.dato);  // esto seria un insertar ordenado
			l:= l^.sig;
		end;
	end;
	
	
	procedure CargarListaMaxima(a: arbol; var l2: lista; valorX: integer);  // PUNTO B
	begin
		if (a <> nil) then begin
			CargarListaMaxima(a^.HI, l2, valorX);
			RecorrerLista(a^.dato.l, l2, valorX);
			CargarListaMaxima(a^.HD, l2, valorX);
		end;
	end;
	
	
	procedure ObtenerCiudadN(a: arbol; nombreCiudadN: integer; var regN: regLista);
	begin
		if (a <> nil) then begin
			if (a^.dato.ciudad = nombreCiudadN) then
				regN:= a^.dato.l^.dato
			else
				if (a^.dato.ciudad < nombreCiudadN) then
					ObtenerCiudadN(a^.HI, nombreCiudadN, regN)
				else
					ObtenerCiudadN(a^.HD, nombreCiudadN, regN)
		end;
	end;
	
	
var
	a: arbol;
	l2: lista;
	valorX, nombreCiudadN: integer;
	regN: regLista;
begin
	randomize;
	CargarArbol(a);   // PUNTO A
	ImprimirArbol(a);
	writeln('---------------------------');
	readln(valorX);
	CargarListaMaxima(a, l2, valorX);   // PUNTO B
	ImprimirLista(l2);
	readln(nombreCiudadN);
	ObtenerCiudadN(a, nombreCiudadN, regN);
end.	
