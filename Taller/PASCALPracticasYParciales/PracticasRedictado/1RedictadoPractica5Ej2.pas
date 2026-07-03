program redictado;
type
	
	rangoanio = 2015..2024;
	
	auto = record
		patente: integer;
		aniofabri: rangoanio;
		marca: String; 
		color: integer;  // para poder usar el random
		modelo: integer;
	end;
		
	arbol = ^nodo;
	nodo = record
		dato: auto;
		HI: arbol;
		HD: arbol;
	end;
	
//------------------------------//	
	
	regLista = record
		patente: integer;
		color: integer;
	end;
	
	lista = ^nodo1;
	nodo1 = record
		dato: regLista;
		sig: lista;
	end;
	
	reg = record
		marca: String;
		l: lista;
	end;
	
	arbol2 = ^nodo2;
	nodo2 = record
		dato: reg;
		HI: arbol2;
		HD: arbol2;
	end;
	
//------------------------------//	
	
	regVec = record
		patente: integer;
		marca: String; 
		color: integer;  // para poder usar el random
		modelo: integer;
	end;
	
	lista2 = ^nodo3;
	nodo3 = record
		dato: regVec;
		sig: lista2;
	end;
	
	vecAnio = array [rangoanio] of lista2;
	
	
	procedure LeerAuto(var a: auto);
	begin
		readln(a.marca);
		if (a.marca <> 'MMM') then begin
			a.patente:= random(1000);
			a.anioFabri:= random(2024 - 2015 + 1)+ 2015;
			a.color:= random(50);
			a.modelo:= random(100);
		end;
	end;
	
	
	procedure AgregarAdelante(var l: lista; a: auto);
	var
		aux: lista;
	begin
		new(aux);
		aux^.dato.patente:= a.patente;
		aux^.dato.color:= a.color;
		aux^.sig:= l;
		l:= aux;
	end;
	
	
	procedure InsertarElemento2(var a2: arbol2; a: auto);
	begin
		if (a2 = nil) then begin
			new(a2);
			a2^.dato.marca:= a.marca;
			a2^.dato.l:= nil;
			AgregarAdelante(a2^.dato.l, a);
			a2^.HI:= nil;
			a2^.HD:= nil;
		end
		else begin
			if (a.marca = a2^.dato.marca) then
				AgregarAdelante(a2^.dato.l, a)
			else
				if (a.marca < a2^.dato.marca) then
					InsertarElemento2(a2^.HI, a)
				else
					InsertarElemento2(a2^.HD, a);
		end;
	end;
	
	
	procedure InsertarElemento1(var a1: arbol; a: auto);
	begin
		if (a1 = nil) then begin
			new(a1);
			a1^.dato:= a;
			a1^.HI:= nil;
			a1^.HD:= nil;
		end
		else begin
			if (a.patente < a1^.dato.patente) then
				InsertarElemento1(a1^.HI, a)
			else
				InsertarElemento1(a1^.HD, a);
		end;		
	end;
	
	
	procedure CargarArboles(var a1: arbol; var a2: arbol2);  // PUNTO A-I-II
	var
		a: auto;
	begin
		a1:= nil;
		a2:= nil;
		writeln('ingrese una marca');
		LeerAuto(a);
		while (a.marca <> 'MMM') do begin
			InsertarElemento1(a1, a);
			InsertarElemento2(a2, a);
			LeerAuto(a);
		end;
	end;	
	
	
	procedure ImprimirArbol(a1: arbol);
	begin
		if (a1 <> nil) then begin
			ImprimirArbol(a1^.HI);
			writeln('patente: ', a1^.dato.patente);
			writeln('año: ', a1^.dato.anioFabri);
			writeln('marca: ', a1^.dato.marca);
			writeln('color: ', a1^.dato.color);
			writeln('modelo: ', a1^.dato.modelo);
			ImprimirArbol(a1^.HD);
		end;
	end;
	
	
	procedure ImprimirLista(l: lista);
	begin
		while (l <> nil) do begin
			writeln('patente: ', l^.dato.patente);
			writeln('color: ', l^.dato.color);
			l:= l^.sig;
		end;
	end;
	
	
	procedure ImprimirArbol2(a2: arbol2);
	begin
		if (a2 <> nil) then begin
			ImprimirArbol2(a2^.HI);
			writeln('marca: ', a2^.dato.marca);
			ImprimirLista(a2^.dato.l);
			ImprimirArbol2(a2^.HD);
		end;
	end;
	
	
	function ObtenerAutosMarca(a1: arbol; marca: String): integer;  // PUNTO B
	begin
		if (a1 = nil) then
			ObtenerAutosMarca:= 0
		else
			if (a1^.dato.marca = marca) then
				ObtenerAutosMarca:= ObtenerAutosMarca(a1^.HI, marca) + ObtenerAutosMarca(a1^.HD, marca) + 1
			else
				ObtenerAutosMarca:= ObtenerAutosMarca(a1^.HI, marca) + ObtenerAutosMarca(a1^.HD, marca);
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
	
	
	function ObtenerAutosMarca2(a2: arbol2; marca: String): integer;  // PUNTO C
	begin
		if (a2 = nil) then
			ObtenerAutosMarca2:= 0
		else 
			if (a2^.dato.marca = marca) then 
				ObtenerAutosMarca2:= RecorrerLista(a2^.dato.l)
			else
				if (a2^.dato.marca < marca) then
					ObtenerAutosMarca2:= ObtenerAutosMarca2(a2^.HI, marca)
				else
					ObtenerAutosMarca2:= ObtenerAutosMarca2(a2^.HD, marca);
	end;
	
	
	procedure InicializarVector(var va: vecAnio);
	var
		i: integer;
	begin
		for i:= 2015 to 2024 do
			va[i]:= nil
	end;
		
	
	procedure ModificarRegistro(var rv: regVec; a: auto);  // pongo los datos del registro original en el registro de la lista del vector
	begin
		rv.patente:= a.patente;
		rv.marca:= a.marca; 
		rv.color:= a.color;  
		rv.modelo:= a.modelo;
	end;
	
	
	procedure AgregarAdelante2(var L2: lista2; rv: regVec);
	var
		aux: lista2;
	begin
		new(aux);
		aux^.dato:= rv;
		aux^.sig:= L2;
		L2:= aux;
	end;
		

	procedure CargarVector(var va: vecAnio; a1: arbol);  // PUNTO D
	var
		rv: regVec;
	begin
		if (a1 <> nil) then begin
			CargarVector(va, a1^.HI);
			ModificarRegistro(rv, a1^.dato);
			AgregarAdelante2(va[a1^.dato.anioFabri], rv);  // = L
			CargarVector(va, a1^.HD);
		end;
	end;
	
	
	procedure ImprimirListaRegistro(L2: lista2);
	begin
		while (L2 <> nil) do begin
			writeln('patente: ', L2^.dato.patente);
			writeln('marca: ', L2^.dato.marca);
			writeln('color: ', L2^.dato.color);
			writeln('modelo: ', L2^.dato.modelo);
			L2:= L2^.sig;
		end;
	end;
	
	
	procedure ImprimirVector(va: vecAnio);
	var
		i: integer;
	begin
		for i:= 2015 to 2024 do begin
			writeln('año: ', i);
			ImprimirListaRegistro(va[i]);
		end;
	end;
	
	
	function BuscarPatente(a1: arbol; patente: integer): integer;  // PUNTO E
	begin
		if (a1 = nil) then
			BuscarPatente:= 0
		else
			if (a1^.dato.patente = patente) then
				BuscarPatente:= a1^.dato.modelo
			else
				if (a1^.dato.patente < patente) then
					BuscarPatente:= BuscarPatente(a1^.HI, patente)
				else
					BuscarPatente:= BuscarPatente(a1^.HD, patente);
	end;
	
	
	function RecorrerListaPatente(l: lista; patente: integer): integer;
	var
		ok: boolean;
	begin
		ok:= false;
		while ((l <> nil) and (not ok)) do begin
			if (l^.dato.patente = patente) then begin
				ok:= true;
				RecorrerListaPatente:= l^.dato.color;
			end	
			else
				l:= l^.sig;
		end;
		if (not ok) then   // pregunto si salio porque lo encontro o porque se termino la lista
			RecorrerListaPatente:= -1;
	end;
	
	
	function BuscarPatente2(a2: arbol2; patente: integer): integer;  // PUNTO F , se que es un String pero me es mas comodo con un integer
	var
		encontreColor: integer;
	begin
		if (a2 = nil) then
			BuscarPatente2:= 0
		else begin
			encontreColor:= RecorrerListaPatente(a2^.dato.l, patente);
			if (encontreColor = -1) then  // no lo encontre
				BuscarPatente2:= BuscarPatente2(a2^.HI, patente) + BuscarPatente2(a2^.HD, patente)
			else
				BuscarPatente2:= encontreColor;  // devuelvo el color
		end;
	end;
	
	
var
	a1: arbol;
	a2: arbol2;
	marca: String;
	cantAutos1, cantAutos2, patente, modelo, color: integer;
	va: vecAnio;
begin
	randomize;
	CargarArboles(a1, a2);   // PUNTO A-I-II
	ImprimirArbol(a1);
	writeln('//////////////////////////////////');
	ImprimirArbol2(a2);
	writeln('//////////////////////////////////');
	{writeln('ingrese una marca');
	readln(marca);
	cantAutos1:= ObtenerAutosMarca(a1, marca);   // PUNTO B
	writeln(cantAutos1);
	writeln('ingrese una marca');
	readln(marca);
	cantAutos2:= ObtenerAutosMarca2(a2, marca);   // PUNTO C
	writeln(cantAutos2);}
	InicializarVector(va);
	CargarVector(va, a1);   // PUNTO D
	//ImprimirVector(va);
	writeln('ingrese una patente');
	readln(patente);
	modelo:= BuscarPatente(a1, patente);   // PUNTO E
	writeln(modelo);
	writeln('ingrese una patente');
	readln(patente);
	color:= BuscarPatente2(a2, patente);   // PUNTO F
	writeln(color);
end.
