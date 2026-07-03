program redictadoParcial3;
type
	
	paquete = record
		cod: integer;
		dniEmisor: integer;
		dniReceptor: integer;
		cantObjetos: integer;
		peso: real;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: paquete;
		HI: arbol;
		HD: arbol;
	end;
	
//-----------------------------//
	
	lista = ^nodo1;
	nodo1 = record
		dato: paquete;
		sig: lista;
	end;
	
	
	procedure LeerPaquete(var p: paquete);
	begin
		readln(p.cod);
		if (p.cod <> 0) then begin
			p.dniEmisor:= random(1000);
			p.dniReceptor:= random(1000);
			p.cantObjetos:= random(150);
			p.peso:= random(200);
		end;
	end;
	
	
	procedure InsertarElemento(var a: arbol; p: paquete);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato:= p;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else begin
			if (p.peso < a^.dato.peso) then 
				InsertarElemento(a^.HI, p)
			else
				InsertarElemento(a^.HD, p)
		end;
	end;
	
	
	procedure CargarArbol(var a: arbol);  // PUNTO A
	var
		p: paquete;
	begin
		writeln('ingrese un cod');
		LeerPaquete(p);
		while (p.cod <> 0) do begin
			InsertarElemento(a, p);
			LeerPaquete(p);
		end;
	end;
	
	
	procedure ImprimirArbol(a: arbol);
	begin
		if (a <> nil) then begin
			ImprimirArbol(a^.HI);
			writeln('cod: ', a^.dato.cod);
			writeln('dni emisor: ', a^.dato.dniEmisor);
			writeln('dni receptor: ', a^.dato.dniReceptor);
			writeln('cant objetos: ', a^.dato.cantObjetos);
			writeln('peso: ', a^.dato.peso:2:2);
			ImprimirArbol(a^.HD);
		end;
	end;
	
	
	procedure AgregarAdelante(var l: lista; p: paquete);
	var
		aux: lista;
	begin
		new(aux);
		aux^.dato:= p;
		aux^.sig:= l;
		l:= aux;
	end;
	
	
	procedure ObtenerLista (a: arbol; var l: lista; cotaInf, cotaSup: real);
	begin
		if (a <> nil) then	begin
			if (a^.dato.peso > cotaInf) then
				if (a^.dato.peso < cotaSup) then begin
					AgregarAdelante(l, a^.dato);
					ObtenerLista(a^.HI, l, cotaInf, cotaSup);
					ObtenerLista(a^.HD, l, cotaInf, cotaSup);
				end	
				else
					ObtenerLista(a^.HI, l, cotaInf, cotaSup)
			else
				ObtenerLista(a^.HD, l, cotaInf, cotaSup);
		end;
	end; 
	
	
	procedure ObtenerListaEntreDosCodigos(a: arbol; var l: lista);  // PUNTO B
	var
		cotaInf, cotaSup: real;
	begin
		writeln('ingrese cota inferior');
		readln(cotaInf);
		writeln('ingrese cota superior');
		readln(cotaSup);
		l:= nil;
		ObtenerLista(a, l, cotaInf, cotaSup);
	end;
	
	
	procedure ObtenerMaximo(a: arbol; var paqMax: paquete; var cantMax: integer);  // PUNTO C
	begin
		if (a <> nil) then begin
			ObtenerMaximo(a^.HI, paqMax, cantMax);
			if (a^.dato.cantObjetos > cantMax) then begin
				cantMax:= a^.dato.cantObjetos;
				paqMax.cod:= a^.dato.cod;
				paqMax.dniEmisor:= a^.dato.dniEmisor;
				paqMax.dniReceptor:= a^.dato.dniReceptor;
				paqMax.peso:= a^.dato.peso;
			end;
			ObtenerMaximo(a^.HD, paqMax, cantMax);
		end;
	end;
	
var
	a: arbol;
	l: lista;
	paqMax: paquete;
	cantMax: integer;
begin
	randomize;
	CargarArbol(a);   // PUNTO A
	ImprimirArbol(a);
	ObtenerListaEntreDosCodigos(a, l);    // PUNTO B
	cantMax:= -1;
	ObtenerMaximo(a, paqMax, cantMax);   // PUNTO C
	writeln('cantMax: ', cantMax);
	writeln('cod: ', paqMax.cod);
	writeln('dni emisor: ', paqMax.dniEmisor);
	writeln('dni receptor: ', paqMax.dniReceptor);
	writeln('peso: ', paqMax.peso:2:2);
end.	
