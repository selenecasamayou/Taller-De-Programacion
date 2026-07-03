program RepasoParcial7;
const
	df = 12;
type
	
	rangoMes = 1..12;
	
	atencion = record
		matricula: integer;
		dni: integer;
		mes: rangoMes;
		cod: char;
	end;
	
//--------------------------//	
	
	regArbol = record
		dni: integer;
		cod: char;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: regArbol;
		HI: arbol;
		HD: arbol;
	end;
	
	vector = array [rangoMes] of arbol;
	
//--------------------------//		
	
	procedure LeerAtencion(var at: atencion);
	var
		v: array [1..5] of char = ('L', 'M', 'N', 'O', 'P');
	begin
		at.matricula:= random(1000);
		if (at.matricula <> 0) then begin
			at.dni:= random(100);
			at.mes:= random(12) + 1;
			at.cod:= v[random(5) + 1];
		end;	
	end;
	
	procedure InicializarVector(var v: vector);
	var
		i: integer;
	begin
		for i:= 1 to df do
			v[i]:= nil;
	end;
	
	procedure CargarArbol(var a: arbol; at: atencion);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato.dni:= at.dni;
			a^.dato.cod:= at.cod;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else begin
			if (at.dni < a^.dato.dni) then
				CargarArbol(a^.HI, at)
			else
				CargarArbol(a^.HD, at);
		end;
	end;
	
	procedure CargarVector(var v: vector);  // PUNTO A
	var
		at: atencion;
	begin	
		LeerAtencion(at);
		while (at.matricula <> 0) do begin
			CargarArbol(v[at.mes], at);
			LeerAtencion(at);
		end;
	end;
		
	function BuscarMesMax(a: arbol): integer;
	begin
		if (a <> nil) then
			BuscarMesMax:= BuscarMesMax(a^.HI) + BuscarMesMax(a^.HD) + 1;
	end;		
			
	procedure ObtenerMesMax(v: vector; dim: integer; var mesAtencionesMax, cantMax: integer);  // PUNTO B
	var
		cantAtencion: integer;
	begin
		if (dim > 0) then begin
			if (v[dim] <> nil) then begin
				cantAtencion:= BuscarMesMax(v[dim]);
				if (cantAtencion > cantMax) then begin
					cantMax:= cantAtencion;
					mesAtencionesMax:= dim;
				end;
			end;	
			ObtenerMesMax(v, dim-1, mesAtencionesMax, cantMax);
		end;	
	end;
	
	function BuscarPaciente(a: arbol; dni: integer): boolean;
	begin
		if (a <> nil) then
			BuscarPaciente:= false
		else begin	
			if (a^.dato.dni = dni) then
				BuscarPaciente:= true
			else begin
				if (a^.dato.dni < dni) then
					BuscarPaciente:= BuscarPaciente(a^.HI, dni)
				else
					BuscarPaciente:= BuscarPaciente(a^.HD, dni);
			end;
		end;	
	end;
	
	procedure BuscarDni(v: vector; var atendido: boolean);
	var
		i, dni: integer;
		
	begin
		atendido:= false;
		i:= 1;
		writeln('Ingrese un dni');
		readln(dni);
		while ((i < df) and (atendido = false)) do begin
			//if (v[i] <> nil) then  LO SACO PORQUE YA PREGUNTA EN EL CASO BASE
			atendido:= BuscarPaciente(v[i], dni);
			i:= i + 1;	
		end;	
	end;		
var
	v: vector;
	mesAtencionesMax, cantMax, dim: integer;
	atendido: boolean;
begin
	InicializarVector(v);
	CargarVector(v);  // PUNTO A
	dim:= df;
	cantMax:= -1;
	ObtenerMesMax(v, dim, mesAtencionesMax, cantMax);  // PUNTO B
	writeln('El mes con mas atenciones es: ', mesAtencionesMax);
	BuscarDni(v, atendido);
	if (atendido) then
		writeln('El paciene fue atendido')
	else
		writeln('El paciene no fue atendido')
end.
