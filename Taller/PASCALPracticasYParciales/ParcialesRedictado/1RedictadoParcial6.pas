program RedictadoParcial6;
type
	
	rangoDia = 1..30;
	rangoDiagnostico = 'A'..'F';
	
	atencion = record
		matricula: integer;
		dni: integer;
		dia: rangoDia;
		diagnostico: char;
	end;
	
	medico = record
		matricula: integer;
		cantAtenciones: integer;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: medico;
		HI: arbol;
		HD: arbol;
	end;
	
	lista = ^nodo1;
	nodo1 = record
		dato: integer;  // dni de pacientes
		sig: lista;
	end;
	
	vector = array [rangoDiagnostico] of lista;
	
	
	procedure InicializarVector(var v: vector);
	var
		i: char;
	begin
		for i:= 'A' to 'F' do
			v[i]:= nil;
	end;
	
	
	procedure LeerAtencion(var at: atencion);
	var
		v: array[1..6] of char = ('A', 'B', 'C', 'D', 'E', 'F');
	begin
		readln(at.dni);
		if (at.dni <> 0) then begin
			at.matricula:= random(1000);
			at.dia:= random(30) + 1;
			at.diagnostico:= v[random(6) + 1];
		end;
	end;
	
	
	procedure InsertarElemento(var a: arbol; at: atencion);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato.matricula:= at.matricula;
			a^.dato.cantAtenciones:= 1;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else begin
			if (at.matricula = a^.dato.matricula) then
				a^.dato.cantAtenciones:= a^.dato.cantAtenciones + 1
			else	
				if (at.matricula < a^.dato.matricula) then
					InsertarElemento(a^.HI, at)
				else
					InsertarElemento(a^.HD, at);
		end;
	end;
	
	
	procedure AgregarAdelante(var l: lista; dni: integer);
	var
		aux: lista;
	begin
		new(aux);
		aux^.dato:= dni;
		aux^.sig:= l;
		l:= aux;
	end;
	
	
	procedure CargarVector(var v: vector; at: atencion);
	begin
		AgregarAdelante(v[at.diagnostico], at.dni);
	end;
	
	
	procedure CargarEstructuras(var a: arbol; var v: vector);  // PUNTO A
	var
		at: atencion;
	begin
		InicializarVector(v);
		writeln('ingrese un dni');
		LeerAtencion(at);
		while (at.dni <> 0) do begin
			InsertarElemento(a, at);
			CargarVector(v, at);
			LeerAtencion(at);
		end;
	end;
	
	
	procedure ImprimirArbol(a: arbol);
	begin
		if (a <> nil) then begin
			ImprimirArbol(a^.HI);
			writeln('matricula: ', a^.dato.matricula);
			writeln('cant atenciones: ', a^.dato.cantAtenciones);
			ImprimirArbol(a^.HD);
		end;
	end;
	
	
	procedure ImprimirLista(l: lista);
	begin
		while (l <> nil) do begin
			writeln('dni: ' , l^.dato);
			l:= l^.sig;
		end;
	end;
	
	
	procedure ImprimirVector(v: vector);
	var
		i: char;
	begin
		for i:= 'A' to 'F' do begin
			writeln('diagnostico ', i);
			ImprimirLista(v[i]);
		end;
	end;
	
	
	function ObtenerCantAtenciones(a: arbol; matricula: integer): integer;  // PUNTO B
	begin
		if (a = nil) then
			ObtenerCantAtenciones:= 0
		else
			if (a^.dato.matricula > matricula) then
				ObtenerCantAtenciones:= ObtenerCantAtenciones(a^.HI, matricula) + ObtenerCantAtenciones(a^.HD, matricula) + a^.dato.cantAtenciones
			else
				ObtenerCantAtenciones:= ObtenerCantAtenciones(a^.HD, matricula);
	end;
	
	
	function RecorrerLista(l: lista): integer;
	var
		cant: integer;
	begin
		cant:= 0;
		while (l <> nil) do begin
			cant:= cant + 1;
			l:= l^.sig;
		end;
		RecorrerLista:= cant;
	end;
	
	
	procedure ObtenerMaximoRecursivo(v: vector; dimf: char; var diagnosticoMax: char; var cantPacientesMax: integer);
	var
		cantPacientes: integer;
	begin
		if (dimf > 'A') then begin
			cantPacientes:= RecorrerLista(v[dimf]);
			if (cantPacientes > cantPacientesMax) then begin
				cantPacientesMax:= cantPacientes;
				diagnosticoMax:= dimf;
			end;
			ObtenerMaximoRecursivo(v, dimf-1, diagnosticoMax, cantPacientesMax);
		end;	
	end;
	
	{if case i of // y da cada resuldado, si A = 1, si B = 2, para recorrer}
	
	
	procedure ObtenerMaximo(v: vector; var diagnosticoMax: char; var cantPacientesMax: integer);  // PUNTO C
	var
		dimf: char;
	begin
		dimf:= 'F';
		ObtenerMaximoRecursivo(v, dimf, diagnosticoMax, cantPacientesMax);
	end;
	
	
var
	a: arbol;
	v: vector;
	matricula, cantAt, cantPacientesMax: integer;
	diagnosticoMax: char;
begin
	randomize;
	CargarEstructuras(a, v);   // PUNTO A
	ImprimirArbol(a);
	ImprimirVector(v);
	writeln('ingrese una matricula');
	readln(matricula);
	cantAt:= ObtenerCantAtenciones(a, matricula);   // PUNTO B
	//writeln(cantAt);
	cantPacientesMax:= -1;
	ObtenerMaximo(v, diagnosticoMax, cantPacientesMax);   // PUNTO C
end.
