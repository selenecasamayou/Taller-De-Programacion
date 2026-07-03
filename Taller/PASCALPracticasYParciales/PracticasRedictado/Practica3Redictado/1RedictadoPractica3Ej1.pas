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
	
	
	procedure ImprimirArbol2(a: arbol);  // PUNTO B.II
	begin
		if (a <> nil) then begin
			ImprimirArbol2(a^.HD);
			writeln('Num: ', a^.dato.num, ', Nombre: ', a^.dato.nombre, ', Edad: ', a^.dato.edad);
			ImprimirArbol2(a^.HI);
		end;
	end;
	
	
	procedure ObtenerMaximo(a: arbol; var numMax, edadMax: integer);  // PUNTO B.III
	begin
		if (a <> nil) then begin
			ObtenerMaximo(a^.HI, numMax, edadMax);
			if (a^.dato.edad > edadMax) then begin
				edadMax:= a^.dato.edad;
				numMax:= a^.dato.num;
			end;
			ObtenerMaximo(a^.HD, numMax, edadMax);  
		end;
	end;
	
	
	
	procedure ObtenerMaximoRecursivo(a: arbol; var numMax: integer);
	var
		edadMax: integer;
	begin
		edadMax:= -1;
		ObtenerMaximo(a, numMax, edadMax);
	end;	
	
	
	function AumentarEdadImpar(a: arbol): integer;  // PUNTO B.IV
	begin
		if (a = nil) then
			AumentarEdadImpar:= 0
		else begin
			if (a^.dato.edad mod 2 = 1) then begin  // es impar
				a^.dato.edad:= a^.dato.edad + 1;
				AumentarEdadImpar:= AumentarEdadImpar(a^.HI) + AumentarEdadImpar(a^.HD) + 1;
			end
			else	
				AumentarEdadImpar:= AumentarEdadImpar(a^.HI) + AumentarEdadImpar(a^.HD);
		end;
	end;
	
	
	function InformarExistenciaNombreSocio(a: arbol; nom: String): boolean;  // PUNTO B.V
	begin
		if (a = nil) then
			InformarExistenciaNombreSocio:= false
		else
			if (a^.dato.nombre = nom) then
				InformarExistenciaNombreSocio:= true
			else
				InformarExistenciaNombreSocio:= InformarExistenciaNombreSocio(a^.HI, nom) or InformarExistenciaNombreSocio(a^.HD, nom);
	end;
	
	
	function InformarCantidadSocios(a: arbol): integer;  // PUNTO B.VI
	begin
		if (a = nil) then
			InformarCantidadSocios:= 0
		else
			InformarCantidadSocios:= InformarCantidadSocios(a^.HI) + InformarCantidadSocios(a^.HD) + 1;
	end;
	
	
	function InformarSumaDeEdades(a: arbol): integer;
	begin
		if (a = nil) then
			InformarSumaDeEdades:= 0
		else
			InformarSumaDeEdades:= InformarSumaDeEdades(a^.HI) + InformarSumaDeEdades(a^.HD) + a^.dato.edad;
	end;
	
	
	function InformarPromedioDeEdad(a:arbol): real;  // PUNTO B.VII
	var
		cantSocios, sumaEdades: integer;
	begin
		cantSocios:= InformarCantidadSocios(a);
		sumaEdades:= InformarSumaDeEdades(a);
		InformarPromedioDeEdad:= (cantSocios / sumaEdades);
	end;
	
	
var
	a: arbol;
	numMax, cantImpar: integer;
	nom: String;
	encontre: boolean;
begin
	randomize;
	CargarArbol(a);   // PUNTO A
	ImprimirArbol(a);   // PUNTO B.I
	//writeln('/////////////////////////////////////////////////');
	//ImprimirArbol2(a);   // PUNTO B.II
	ObtenerMaximoRecursivo(a, numMax);   // PUNTO B.III
	//writeln(numMax);
	cantImpar:= AumentarEdadImpar(a);   // PUNTO B.IV ¿que?
	writeln(cantImpar);
	//writeln('Ingrese un nombre');
	readln(nom);
	encontre:= InformarExistenciaNombreSocio(a, nom);   // PUNTO B.V
	writeln(encontre);
	writeln('La cantidad de socios es: ', InformarCantidadSocios(a));   // PUNTO B.VI
	writeln('El promedio de edad de los socios es: ', InformarPromedioDeEdad(a));   // PUNTO B.VII
end.	
