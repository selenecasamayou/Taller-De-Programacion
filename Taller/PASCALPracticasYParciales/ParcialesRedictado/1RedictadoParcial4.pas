program RedictadoParcial4;
const
	df = 8;
type
	
	rangoMaterial = 1..8;
	
	artesania = record
		num: integer;
		dniArtesano: integer;
		cod: rangoMaterial;
	end;
	
//-----------------------------//
	
	regLista = record
		num: integer;
		cod: rangoMaterial;
	end;
	
	lista = ^nodo1;
	nodo1 = record
		dato: regLista;
		sig: lista;
	end;
	
	reg = record
		dniArtesano: integer;
		l: lista;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: reg;
		HI: arbol;
		HD: arbol;
	end;
	
//-----------------------------//

	regVec = record
		codMaterial: integer;
		cant: integer;
	end;
	
	vecMaterial = array [rangoMaterial] of regVec;
	
	
	procedure InicializarVector(var vm: vecMaterial);
	var
		i: integer;
	begin
		for i:= 1 to 8 do begin
			vm[i].codMaterial:= i;
			vm[i].cant:= 0;
		end;	
	end;
	
	
	procedure LeerArtesania(var ar: artesania);
	begin
		readln(ar.dniArtesano);
		if (ar.dniArtesano <> 0) then begin
			ar.num:= random(100);
			ar.cod:= random(8) + 1; 
		end;
	end;
	
	
	procedure AgregarAdelante(var l: lista; ar: artesania);
	var
		aux: lista;
	begin
		new(aux);
		aux^.dato.num:= ar.num;
		aux^.dato.cod:= ar.cod;
		aux^.sig:= l;
		l:= aux;
	end;
	
	
	procedure InsertarElemento(var a: arbol; ar: artesania);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato.dniArtesano:= ar.dniArtesano;
			a^.dato.l:= nil;
			AgregarAdelante(a^.dato.l, ar);
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else begin
			if (ar.dniArtesano = a^.dato.dniArtesano) then
				AgregarAdelante(a^.dato.l, ar)
			else
				if (ar.dniArtesano < a^.dato.dniArtesano) then
					InsertarElemento(a^.HI, ar)
				else
					InsertarElemento(a^.HD, ar);
		end;
	end;
	
	
	procedure CargarVector(var vm: vecMaterial; ar: artesania);
	begin
		vm[ar.cod].cant:= vm[ar.cod].cant + 1;  // el cod de materal no cambia
		//vm[ar.cod].codMaterial:= ar.cod;
	end;
	
	
	procedure CargarEstructuras(var a: arbol; var vm: vecMaterial);  // PUNTO A
	var
		ar: artesania;
	begin
		writeln('ingrese un dni');
		LeerArtesania(ar);
		while (ar.dniArtesano <> 0) do begin
			InsertarElemento(a, ar);
			CargarVector(vm, ar);
			LeerArtesania(ar);
		end;
	end;
	
	
	procedure ImprimirLista(l: lista);
	begin
		while (l <> nil) do begin
			writeln('numero: ', l^.dato.num);
			writeln('cod material: ', l^.dato.cod);
			l:= l^.sig;
		end;
	end;
	
	
	procedure ImprimirArbol(a: arbol);
	begin
		if (a <> nil) then begin
			ImprimirArbol(a^.HI);
			writeln('dni artesano: ', a^.dato.dniArtesano);
			ImprimirLista(a^.dato.l);
			ImprimirArbol(a^.HD);
		end;
	end;
	
	
	procedure ImprimirVector(vm: vecMaterial);
	var
		i: integer;
	begin
		for i:= 1 to 8 do begin
			writeln('cod: ', vm[i].codMaterial);
			writeln('cant: ', vm[i].cant);
		end;	
	end;
	
	
	function ObtenerCantDni(a: arbol; unDni: integer): integer;  // PUNTO B
	begin
		if (a = nil) then
			ObtenerCantDni:= 0
		else
			if (a^.dato.dniArtesano < unDni) then
				ObtenerCantDni:= ObtenerCantDni(a^.HI, unDni) + ObtenerCantDni(a^.HD, unDni) + 1
			else
				ObtenerCantDni:= ObtenerCantDni(a^.HI, unDni);
	end;
	
	
	procedure OrdenSeleccion(var vm: vecMaterial; var nombreMaterial: integer);  // es un integer por comodidad, seria un ¨String¨  // PUNTO C
	var
		i, j, pos: integer;
		dato: regVec;
	begin
		for i:= 1 to df-1 do begin
			pos:= i;
			for j:= i+1 to df do begin
				if (vm[j].cant < vm[pos].cant) then
					pos:= j;
			end;
			dato:= vm[pos];
			vm[pos]:= vm[i];
			vm[i]:= dato;
		end;
		nombreMaterial:= vm[8].codMaterial;
	end;
	
	
var
	a: arbol;
	vm: vecMaterial;
	unDni, cantDniMenor, nombreMaterial: integer;
begin
	randomize;
	InicializarVector(vm);
	CargarEstructuras(a, vm);   // PUNTO A
	ImprimirArbol(a);
	ImprimirVector(vm);
	writeln('ingrese otro dni');
	readln(unDni);
	cantDniMenor:= ObtenerCantDni(a, unDni);   // PUNTO B
	//writeln(cantDniMenor);
	OrdenSeleccion(vm, nombreMaterial);   // PUNTO C
	writeln(nombreMaterial);
	ImprimirVector(vm);
end.	
