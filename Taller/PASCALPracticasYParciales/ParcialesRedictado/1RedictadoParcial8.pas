program RedictadoParcial8;
type
	
	rangoEnvio = 1..4;
	
	paquete = record
		cod: integer;
		tipoEnvio: rangoEnvio;
		dniEmisor: integer;
		dniReceptor: integer;
		peso: real;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: paquete;
		HI: arbol;
		HD: arbol;
	end;
	
	vector = array [rangoEnvio] of arbol;
	
	
	procedure InicializarVector(var v: vector);
	var
		i: integer;
	begin
		for i:= 1 to 4 do
			v[i]:= nil;
	end;
	
	
	procedure LeerPaquete(var p: paquete);
	begin
		readln(p.cod);
		if (p.cod <> 0) then begin
			p.tipoEnvio:= random(4) + 1;
			p.dniEmisor:= random(3) + 1;
			p.dniReceptor:=random(100);
			p.peso:= random(500);
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
	
	
	procedure CargarVector(var v: vector);  // PUNTO A
	var
		p: paquete;
	begin
		InicializarVector(v);
		writeln('ingrese un cod');
		LeerPaquete(p);
		while (p.cod <> 0) do begin
			InsertarElemento(v[p.tipoEnvio], p);
			LeerPaquete(p);
		end;
	end;
	
	
	procedure ImprimirArbol(a: arbol);
	begin
		if (a <> nil) then begin
			ImprimirArbol(a^.HI);
			writeln('cod: ', a^.dato.cod);
			writeln('tipo envio: ', a^.dato.tipoEnvio);
			writeln('dni emisor: ', a^.dato.dniEmisor);
			writeln('dni receptor: ', a^.dato.dniReceptor);
			writeln('peso: ', a^.dato.peso:2:2);
			ImprimirArbol(a^.HD);
		end;
	end;
	
	
	procedure ImprimirVector(v: vector);
	var
		i: integer;
	begin
		for i:= 1 to 4 do begin
			writeln('-tipo: ', i);
			ImprimirArbol(v[i]);
		end;	
	end;		
	
	
	procedure ObtenerPaqueteMaximoRecursivo(a: arbol; var paqueteMax: paquete);  // PUNTO B
	begin
		if (a <> nil) then  //if (a^.dato.peso > pesoMax) then begin
			if (a^.HD = nil) then // significa que llegue al final
				//pesoMax:= a^.dato.peso;
				paqueteMax:= a^.dato
			else
				ObtenerPaqueteMaximoRecursivo(a^.HD, paqueteMax)
	end;
	
	
	function ObtenerCantPaquetesEmisor(a: arbol; unDni: integer): integer;  // PUNTO C
	begin
		if (a = nil ) then
			ObtenerCantPaquetesEmisor:= 0
		else
			if (a^.dato.dniEmisor = unDni) then
				ObtenerCantPaquetesEmisor:= ObtenerCantPaquetesEmisor(a^.HI, unDni) + ObtenerCantPaquetesEmisor(a^.HD, unDni) + 1
			else
				ObtenerCantPaquetesEmisor:= ObtenerCantPaquetesEmisor(a^.HI, unDni) + ObtenerCantPaquetesEmisor(a^.HD, unDni);
	end;
	
	
var
	v: vector;
	tipoEnvio: integer;
	paqueteMax: paquete;
	unDni, paquetesEnviados: integer;
begin
	randomize;
	CargarVector(v);   // PUNTO A
	ImprimirVector(v);
	writeln('ingrese un tipo de envio');
	readln(tipoEnvio);
	ObtenerPaqueteMaximoRecursivo(v[tipoEnvio], paqueteMax);   // PUNTO B
	{writeln('cod: ', paqueteMax.cod);
	writeln('tipo envio: ', paqueteMax.tipoEnvio);		
	writeln('dni emisor: ', paqueteMax.dniEmisor);
	writeln('dni receptor: ', paqueteMax.dniReceptor);
	writeln('peso: ', paqueteMax.peso:2:2);}
	writeln('ingrese un tipo de envio');
	readln(tipoEnvio);
	writeln('ingrese un dni');
	readln(unDni);
	paquetesEnviados:= ObtenerCantPaquetesEmisor(v[tipoEnvio], unDni);   // PUNTO C
	writeln(paquetesEnviados);
end.
