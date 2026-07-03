program redictado;
type
	
	socio = record
		num: integer;
		nombre: String;
		edad: integer;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: socio;
		HI: arbol;
		HD: arbol;
	end;
	
	
	procedure LeerSocio(var s: socio);
	var 
     vNombres:array [0..9] of string = ('Ana', 'Jose', 'Luis', 'Ema', 'Ariel', 'Pedro', 'Lena', 'Lisa', 'Martin', 'Lola'); 
	begin
		writeln('ingrese un num');
		readln(s.num);
		if (s.num <> 0) then begin
			s.nombre:= vNombres[random(10)];
			s.edad:= random(100 + 1);
		end;
	end;
	
	
	procedure InsertarElemento(var a: arbol; s: socio);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato:= s;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else begin
			if (s.num < a^.dato.num) then
				InsertarElemento(a^.HI, s)
			else
				InsertarElemento(a^.HD, s)
		end;
	end;
	
	
	
	procedure CargarArbol(var a: arbol);  // PUNTO A
	var
		s: socio;
	begin
		a:= nil;
		LeerSocio(s);
		while (s.num <> 0) do begin
			InsertarElemento(a, s);
			LeerSocio(s);
		end;
	end;
	
	
	procedure ImprimirArbol(a: arbol);  // PUNTO B.I
	begin
		if (a <> nil) then begin
			ImprimirArbol(a^.HI);
			writeln('Num: ', a^.dato.num, ', Nombre: ', a^.dato.nombre, ', Edad: ', a^.dato.edad);
			ImprimirArbol(a^.HD);
		end;
	end;
	
	
	function ObtenerMaximoRecursivo(a: arbol): integer;
	begin
		if (a = nil) then
			ObtenerMaximoRecursivo:= -1
		else
			if(a^.HD = nil) then
				ObtenerMaximoRecursivo:= a^.dato.num
			else
				ObtenerMaximoRecursivo:= ObtenerMaximoRecursivo(a^.HD);
	end;
	
	
	procedure ObtenerMinimoRecursivo(a: arbol; var nombreMin: String; var edadMin, nuMin: integer);
	begin
		if (a <> nil) then begin
			if (a^.dato.num < nuMin) then begin
				nuMin:= a^.dato.num;
				nombreMin:= a^.dato.nombre;
				edadMin:= a^.dato.edad;
			end;
			ObtenerMinimoRecursivo(a^.HI, nombreMin, edadMin, nuMin);
		end;
	end;
	
	
	function ObtenerSocio(a: arbol; numero: integer): boolean;
	begin
		if (a = nil) then
			ObtenerSocio:= false
		else begin
			if (a^.dato.num = numero) then
				ObtenerSocio:= true
			else
				ObtenerSocio:= ObtenerSocio(a^.HI, numero) or ObtenerSocio(a^.HD, numero);
		end;
	end;
	
	
	function ObtenerCantSocios(a: arbol; cotaInf, cotaSup: integer): integer;
	begin
		if (a = nil) then
			ObtenerCantSocios:= 0
		else begin
			if (a^.dato.num > cotaInf) then
				if (a^.dato.num < cotaSup) then
					ObtenerCantSocios:= ObtenerCantSocios(a^.HI, cotaInf, cotaSup) + ObtenerCantSocios(a^.HD, cotaInf, cotaSup) + 1
				else
					ObtenerCantSocios:= ObtenerCantSocios(a^.HI, cotaInf, cotaSup)
			else
				ObtenerCantSocios:= ObtenerCantSocios(a^.HD, cotaInf, cotaSup);
		end;
	end;
	
	
	procedure ObtenerSociosEntreDosCodigos(a: arbol; var cantSocios: integer);
	var
		cotaInf, cotaSup: integer;
	begin
		writeln('ingrese cota inferior');
		readln(cotaInf);
		writeln('ingrese cota superior');
		readln(cotaSup);
		cantSocios:= ObtenerCantSocios(a, cotaInf, cotaSup);
	end;
	
	
var
	a: arbol;
	nuMax, edadMin, nuMin, numero, cantSocios: integer;
	nombreMin: String;
	existe: boolean;
begin
	randomize;
	CargarArbol(a);   // EJ 3.1
	ImprimirArbol(a);   	
	nuMax:= ObtenerMaximoRecursivo(a);   // PUNTO I
	writeln(nuMax);
	nuMin:= 9999;
	ObtenerMinimoRecursivo(a, nombreMin, edadMin, nuMin);   // PUNTO II
	writeln('El nombre del socio con el numero mas chico es: ', nombreMin, ' y su edad: ', edadMin);
	writeln('ingrese un valor');
	readln(numero);
	existe:= ObtenerSocio(a, numero);   // PUNTO III
	if (existe) then
		writeln('El socio existe')
	else
		writeln('El socio no existe');
	ObtenerSociosEntreDosCodigos(a, cantSocios);   // PUNTO IV
	writeln(cantSocios);
end.
