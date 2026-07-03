program RepasoParcial6;
const
	df = 15;
type
	
	rangoModelo = 1..15;
	
	repuesto = record
		codMarca: integer;
		codModelo: rangoModelo;
		stock: integer;
		anio: integer;
	end;
	
//------------------------------//
	
	regLista = record
		stock: integer;
		anio: integer;
	end;
	
	lista = ^nodo1;
	nodo1 = record
		dato: regLista;
		sig: lista;
	end;
	
	vecModelo = array [1..df] of lista;
	
	regArbol = record
		codMarca: integer;
		vm: vecModelo; 
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: regArbol;
		HI: arbol;
		HD: arbol;
	end;
	
//------------------------------//

	repuesto2 = record
		codModelo: rangoModelo;
		stock: integer;
		anio: integer;
	end;
	
	lista2 = ^nodo2;
	nodo2 = record
		dato: repuesto2;
		sig: lista2;
	end;

//------------------------------//	
	
	procedure LeerRepuesto(var r: repuesto);
	begin
		r.codMarca:= random(100);
		if (r.codMarca <> 0) then begin
			r.codModelo:= random(15) + 1;
			r.stock:= random(30);
			r.anio:= random(1000) + 1;
		end;	
	end;
	
	procedure InicializarVector(var vm: vecModelo);
	var
		i: integer;
	begin
		for i:= 1 to df do
			vm[i]:= nil;
	end;
	
	procedure CargarVector(var l: lista; r: repuesto); // AGREGAR ADELNATE
	var
		aux: lista;
	begin
		new(aux);
		aux^.dato.stock:= r.stock;
		aux^.dato.anio:= r.anio;
		aux^.sig:= l;
		l:= aux;
	end;
	
	procedure InsertarElemento(var a: arbol; r: repuesto);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato.codMarca:= r.codMarca;
			InicializarVector(a^.dato.vm);
			CargarVector(a^.dato.vm[r.codModelo], r);
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else begin
			if (r.codMarca < a^.dato.codMarca) then
				InsertarElemento(a^.HI, r)
			else
				if (r.codMarca > a^.dato.codMarca) then
					InsertarElemento(a^.HD, r)
				else
					CargarVector(a^.dato.vm[r.codModelo], r);
		end;
	end;
	
	procedure CargarArbol(var a: arbol);  // PUNTO A
	var
		r: repuesto;
	begin
		a:= nil;
		LeerRepuesto(r);
		while (r.codMarca <> 0) do begin
			InsertarElemento(a, r);
			LeerRepuesto(r);
		end;
	end;	
	
	procedure AgregarAtras(reg: regLista; codModelo: integer; var l2, ult: lista2);
	var
		aux: lista2;
	begin
		new(aux);
		aux^.dato.codModelo:= codModelo;
		aux^.dato.stock:= reg.stock;
		aux^.dato.anio:= reg.anio;
		aux^.sig:= l2;
		if (l2 = nil) then
			l2:= aux
		else
			aux^.sig:= ult;
		ult:= aux;
	end;
	
	procedure RecorrerLista(l: lista; codModelo: integer; var l2: lista2);
	var
		ult: lista2;
	begin
		while (l <> nil) do begin
			if (l^.dato.stock < 3) then
				AgregarAtras(l^.dato, codModelo, l2, ult);
			l:= l^.sig;	
		end;
	end;
	
	procedure RecorrerVectorModelos(vm: vecModelo; var l2: lista2);
	var
		i: integer;
	begin
		for i:= 1 to df do begin
			//if (i = codigoMarca) then begin
			if (vm[i] <> nil) then 
				RecorrerLista(vm[i], i, l2);
		end;			
	end;
	
	procedure CargarListaMarca(a: arbol; var l2: lista2; codigoMarca: integer);  // PUNTO B
	begin
		if (a <> nil) then begin
			if (a^.dato.codMarca = codigoMarca) then
				RecorrerVectorModelos(a^.dato.vm, l2)
			else begin
				if (a^.dato.codMarca < codigoMarca) then
					CargarListaMarca(a^.HI, l2, codigoMarca)
				else
					CargarListaMarca(a^.HD, l2, codigoMarca);
			end;
		end;
	end;
	
	function CantRepuestos(l2: lista2): integer;  // PUNTO C
	begin
		if (l2 = nil) then 
			CantRepuestos:= 0
		else
			if (l2^.dato.stock = 1) then
				CantRepuestos:= CantRepuestos(l2^.sig) + 1
			else
				CantRepuestos:= CantRepuestos(l2^.sig);
		end;	
	
var
	a: arbol;
	l2: lista2;
	codigoMarca, cantRepuestosCumple: integer;
begin
	randomize;
	CargarArbol(a);  // PUNTO A
	writeln('ingrese un codigo de marca');
	readln(codigoMarca);
	CargarListaMarca(a, l2, codigoMarca);  // PUNTO B
	cantRepuestosCumple:= CantRepuestos(l2);  // PUNTO C
	writeln(cantRepuestosCumple);  
end.
