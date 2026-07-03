program Repaso2;
type
	
	rangoanio = 2015..2024;
	
	auto = record
		patente: integer;
		anio: rangoanio;
		marca: string;
		color: string;
		modelo: integer;
	end;
	
	arbol = ^nodo1;
	nodo1 = record
		dato: auto;
		HI: arbol;
		HD: arbol;
	end;
	
//------------------------------//
	
	marcas = record
		patente: integer;
		color: string;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: marcas;
		sig: lista;
	end;
	
	datos = record
		marca: string;   	// criterio de orden   
		l: lista; 		 	// datos a almacenar
	end;
	
	arbol2 = ^nodo2;
	nodo2 = record
		dato: datos;
		HI: arbol2;
		HD: arbol2;
	end;
	
//------------------------------//
	
	regauto = record
		patente: integer;
		marca: string;
		color: string;
		modelo: integer;
	end;
	
	listautos = ^nodo3;
	nodo3 = record
		dato: regauto;
		sig: listautos;
	end;
	
	vector = array [rangoanio] of listautos;
	
//------------------------------//	
	
	procedure LeerAuto(var a: auto);
	begin
		writeln('Ingrese una marca');
		readln(a.marca);
		if (a.marca <> 'MMM') then begin
		  a.patente:= random(1000);
		  a.anio:= random(2024 - 2015 + 1) + 2015;
		  readln(a.color);
		  a.modelo:= random(100) + 1;
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
			if (a.marca < a2^.dato.marca) then
				InsertarElemento2(a2^.HI, a)
			else
				if (a.marca > a2^.dato.marca) then
					InsertarElemento2(a2^.HD, a)
				else
					AgregarAdelante(a2^.dato.l, a);
		end;
	end;
	
	procedure CargarArboles(var a1: arbol; var a2: arbol2);  // PUNTO A.1 y A.2
	var
		a: auto;
	begin
		a1:= nil;
		a2:= nil;
		LeerAuto(a);
		while (a.marca <> 'MMM') do begin
			InsertarElemento1(a1, a);
			InsertarElemento2(a2, a);
		end;
	end;
	
	function CantAutos(a1: arbol; marca: string): integer;  // PUNTO B
	begin
		if (a1 = nil) then  // caso base
			CantAutos:= 0
		else
			if (a1^.dato.marca = marca) then
				CantAutos:= CantAutos(a1^.HI, marca) + CantAutos(a1^.HD, marca) + 1
			else
				CantAutos:= CantAutos(a1^.HI, marca) + CantAutos(a1^.HD, marca);
	end;
	
	function CantMarcas(l: lista): integer;
	var
		cantLista: integer;
	begin
		cantLista:= 0;
		while (l <> nil) do begin
			cantLista:= cantLista + 1;
			l:= l^.sig;
		end;
		CantMarcas:= cantLista;
	end;
	
	function CantAutosOrdenado(a2: arbol2; marca: string): integer;  // PUNTO C
	begin
		if (a2 = nil) then  // caso base
			CantAutosOrdenado:= 0
		else
			if (a2^.dato.marca = marca) then  // recorro toda la lista, porque toda esa lista es de esa marca
				CantAutosOrdenado:= CantMarcas(a2^.dato.l)
			else
				if (a2^.dato.marca < marca) then
					CantAutosOrdenado:= CantAutosOrdenado(a2^.HI, marca)
				else
					CantAutosOrdenado:= CantAutosOrdenado(a2^.HD, marca);
	end;
	
	procedure InicializarVector(var v: vector);
	var
		i: integer;
	begin
		for i:= 2015 to 2024 do
			v[i]:= nil;
	end;
	
	procedure CargarRegistro(a: auto; var ra: regauto);  // pongo los datos del registro original en el registro de la lista del vector
	begin
		ra.patente:= a.patente;
		ra.marca:= a.marca;
		ra.color:= a.color;
		ra.modelo:= a.modelo;
	end;
	
	procedure AgregarAdelante2(var l: listautos; ra: regauto);
	var
		aux: listautos;
	begin
		new(aux);
		aux^.dato:= ra;
		aux^.sig:= l;
		l:= aux;
	end;
	
	procedure CargarVectorAnios(var v: vector; a1: arbol);  // PUNTO D
	var
		ra: regauto;
	begin
		if (a1 <> nil) then begin
			CargarRegistro(a1^.dato, ra);
			AgregarAdelante2(v[a1^.dato.anio], ra);  // accedo al año del vector leido en el arbol y pongo el registro
			CargarVectorAnios(v, a1^.HI);
			CargarVectorAnios(v, a1^.HD);
		end;
	end;
	
	function BuscarPatente(a1: arbol; patente: integer): integer;  // PUNTO E
	begin
		if (a1 = nil) then  // caso base
			BuscarPatente:= 0 
		else begin
			if (patente = a1^.dato.patente) then
				BuscarPatente:= a1^.dato.modelo
			else
				if (patente < a1^.dato.patente) then
					BuscarPatente:= BuscarPatente(a1^.HI, patente)
				else
					BuscarPatente:= BuscarPatente(a1^.HD, patente);
		end;
	end;
	
	function BuscarPatenteLista(l: lista; patente: integer): string;
	var
		encontre: boolean;
	begin
		encontre:= false;
		while ((l <> nil) and (not encontre)) do begin
			if (l^.dato.patente = patente) then begin
				encontre:= true;
				BuscarPatenteLista:= l^.dato.color;
			end
			else
				l:= l^.sig;
		end;
		if (not encontre) then
			BuscarPatenteLista:= 'No estaba';
	end;
	
	function BuscarPatente2(a2: arbol2; patente: integer): string;  // PUNTO F 
	var
		encontre: string;
	begin
		if (a2 = nil) then
			BuscarPatente2:= 'No estaba'
		else begin
			encontre:= BuscarPatenteLista(a2^.dato.l, patente);
			if (encontre = 'No estana') then  // si no estaba en esa lista, accedo a la lista del siguiente nodo del arbol
				BuscarPatente2:= BuscarPatente2(a2^.HI, patente) + BuscarPatente2(a2^.HD, patente)
			else
				BuscarPatente2:= encontre;  // estaba y devuelve el color
		end;
	end;
var
	a1: arbol;
	a2: arbol2;
	v: vector;
	marca: string;
	patente: integer;
begin
	randomize;
	CargarArboles(a1, a2); // PUNTO A.1 y A.2
	writeln('Ingrese una marca');
	readln(marca);
	writeln('La cantidad de autos con esa marca son:', CantAutos(a1, marca));  // PUNTO B
	writeln('La cantidad de autos con esa marca son:', CantAutosOrdenado(a2, marca));  // PUNTO C
	InicializarVector(v);
	CargarVectorAnios(v, a1);  // PUNTO D
	writeln('Ingrese una patente');
	readln(patente);
	writeln('La patente: ', patente, ' tiene como modulo a: ', BuscarPatente(a1, patente));  // PUNTO E
	writeln('ingrese otra patente');
    readln(patente);
    BuscarPatente2(a2, patente);  // PUNTO F
end.
