program RepasoParcial5;
const
	df = 10;
type
	
	rangoDia = 1..30;
	rangoDiagnostico = 1..10;
	
	atencion = record
		matricula: integer;
		dni: integer;
		dia: rangoDia;
		diagnostico: rangoDiagnostico;
	end;
	
//------------------------------------//	
	
	regLista = record
		dni: integer;
		dia: rangoDia;
		diagnostico: rangoDiagnostico;
	end;
	
	lista = ^nodo1;
	nodo1 = record
		dato: regLista;
		sig: lista;
	end;
	
	regArbol = record
		matricula: integer;
		l: lista;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: regArbol;
		HI: arbol;
		HD: arbol;
	end;
	
//------------------------------------//
		
	vector = array [1..df] of integer;
	
//------------------------------------//
	
	procedure ImprimirLista(l: lista);
	begin
		while (l <> nil) do begin
			writeln('dni: ', l^.dato.dni);
			writeln('dia: ', l^.dato.dia);
			writeln('diagnostico: ', l^.dato.diagnostico);
			l:= l^.sig;
		end;	
	end;
	
	procedure ImprimirArbol(a: arbol);
	begin
		if (a <> nil) then begin
			ImprimirArbol(a^.HI);
			writeln('matricula: ', a^.dato.matricula);
			ImprimirLista(a^.dato.l);
			ImprimirArbol(a^.HD);
		end;
	end;		
	
	procedure ImprimirVector(v: vector);
	var
		i: integer;
	begin
		for i:= 1 to df do
			writeln('diagnostico: ', i , ' cantidad: ', v[i]);
	end;
	
	procedure LeerAtencion(var at: atencion);
	begin
		at.dni:= random(100);
		if (at.dni <> 0) then begin
			at.matricula:= random(200);
			at.dia:= random(30) + 1;
			at.diagnostico:= random(10) + 1;
		end;
	end;
	
	procedure AgregarAdelante(var l: lista; at: atencion);
	var
		aux: lista;
	begin
		new(aux);
		aux^.dato.dni:= at.dni;
		aux^.dato.dia:= at.dia;
		aux^.dato.diagnostico:= at.diagnostico;
		aux^.sig:= l;
		l:= aux;
	end;
	
	procedure InsertarElemento(var a: arbol; at: atencion);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato.matricula:= at.matricula;
			a^.dato.l:= nil;
			AgregarAdelante(a^.dato.l, at);
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else begin
			if (at.matricula < a^.dato.matricula) then
				InsertarElemento(a^.HI, at)
			else
				if (at.matricula > a^.dato.matricula) then
					InsertarElemento(a^.HD, at)
				else
					AgregarAdelante(a^.dato.l, at);
		end;
	end;
	
	procedure CargarArbol(var a: arbol);  // PUNTO A
	var
		at: atencion;
	begin
		a:= nil;
		LeerAtencion(at);
		while (at.dni <> 0) do begin
			InsertarElemento(a, at);
			LeerAtencion(at);
		end;	
	end;
	
	function RecorrerListaMatricula(l: lista; unDni: integer): integer;
	var
		cantCumple: integer;
	begin
		cantCumple:= 0;
		while (l <> nil) do begin
			cantCumple:= cantCumple + 1;
			l:= l^.sig;
		end;
		RecorrerListaMatricula:= cantCumple;
	end;
	
	function ObtenerCantAtencion(a: arbol; var matriculaInf, matriculaSup, unDni: integer): integer;
	begin
		if (a = nil) then 
			ObtenerCantAtencion:= 0
		else begin
			if (a^.dato.matricula > matriculaInf) then begin
				if (a^.dato.matricula < matriculaSup) then
					ObtenerCantAtencion:= ObtenerCantAtencion(a^.HI, matriculaInf, matriculaSup, unDni) + ObtenerCantAtencion(a^.HD, matriculaInf, matriculaSup, unDni) + RecorrerListaMatricula(a^.dato.l, unDni)
				else
					ObtenerCantAtencion(a^.HI, matriculaInf, matriculaSup, unDni);
			end
			else
				ObtenerCantAtencion(a^.HD, matriculaInf, matriculaSup, unDni);
		end;		
	end;
	
	procedure ObtenerCantAtencionEntreDosCodigos(a: arbol; var cantAtenciones: integer);  // PUNTO B
	var
		matriculaInf, matriculaSup, unDni: integer;
	begin
		writeln('Ingersar una matricula inf');
		readln(matriculaInf);
		writeln('Ingersar una matricula sup');
		readln(matriculaSup);
		writeln('Ingersar un dni');
		readln(unDni);
		cantAtenciones:= ObtenerCantAtencion(a, matriculaInf, matriculaSup, unDni);
		writeln(cantAtenciones);
	end;	
	
	procedure InicializarVector(var v: vector);
	var
		i: integer;
	begin
		for i:= 1 to df do
			v[i]:= 0;
	end;
	
	procedure CargarVector(var v: vector; l: lista);
	begin
		while (l <> nil) do begin
			v[l^.dato.diagnostico]:= v[l^.dato.diagnostico] + 1;
			l:= l^.sig;
		end;
	end;
	
	procedure CargarVectorAtenciones(var v: vector; a: arbol);  // PUNTO C
	begin
		if (a <> nil) then begin
			CargarVectorAtenciones(v, a^.HI);
			CargarVector(v, a^.dato.l);
			CargarVectorAtenciones(v, a^.HD);
		end;
	end;
	
var
	a: arbol;
	v: vector;
	cantAtenciones: integer;
begin
	randomize;
	CargarArbol(a); // PUNTO A
	ImprimirArbol(a);
	ObtenerCantAtencionEntreDosCodigos(a, cantAtenciones); // PUNTO B
	InicializarVector(v);
	CargarVectorAtenciones(v, a);  // PUNTO C
	ImprimirVector(v);
end.
