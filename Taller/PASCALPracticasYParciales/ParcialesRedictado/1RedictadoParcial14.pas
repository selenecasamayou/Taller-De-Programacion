program RedictadoParcial14;
type
	
	rangoSucursal = 1..10;
	
	venta = record
		dni: integer;
		codSucursal: rangoSucursal;
		num: integer;
		monto: real;
	end;
	
//---------------------------------//
		
	regLista = record
		num: integer;
		monto: real;
	end;
	
	lista = ^nodo1;
	nodo1 = record
		dato: regLista;
		sig: lista;
	end;
	
	regArbol = record
		dni: integer;
		l: lista;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: regArbol;
		HI: arbol;
		HD: arbol;
	end;
	
	vector = array [rangoSucursal] of integer;
	
	
	procedure InicializarVector(var v: vector);
	var
		i: integer;
	begin
		for i:= 1 to 10 do
			v[i]:= 0;
	end;
	
	
	procedure LeerVenta(var ve: venta);
	begin
		readln(ve.dni);
		if (ve.dni <> 0) then begin
			ve.codSucursal:= random(10) + 1;
			ve.num:= random(200);
			ve.monto:= random(1000);
		end;
	end;
	
	
	procedure AgregarAdelante(var l: lista; ve: venta);
	var
		aux: lista;
	begin
		new(aux);
		aux^.dato.num:= ve.num;
		aux^.dato.monto:= ve.monto;
		aux^.sig:= l;
		l:= aux;
	end;
	
	
	procedure InsertarElemento(var a: arbol; ve: venta);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato.dni:= ve.dni;
			a^.dato.l:= nil;
			AgregarAdelante(a^.dato.l, ve);
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else
			if (ve.dni = a^.dato.dni) then
				AgregarAdelante(a^.dato.l, ve)
			else
				if (ve.dni < a^.dato.dni) then
					InsertarElemento(a^.HI, ve)
				else
					InsertarElemento(a^.HD, ve)
	end;
	
	
	procedure CargarEstructuras(var a:arbol; var v: vector);  // PUNTO A
	var
		ve: venta;
	begin
		a:= nil;
		InicializarVector(v);
		writeln('ingrese un dni');
		LeerVenta(ve);
		while (ve.dni <> 0) do begin
			InsertarElemento(a, ve);
			v[ve.codSucursal]:= v[ve.codSucursal] + 1;
			LeerVenta(ve);
		end;
	end;
	
	
	procedure ImprimirLista(l: lista);
	begin
		while (l <> nil) do begin
			writeln('num: ', l^.dato.num);
			writeln('monto: ', l^.dato.monto:2:2);
			l:= l^.sig;
		end;
	end;
	
	
	procedure ImprimirArbol(a: arbol);
	begin
		if (a <> nil) then begin
			ImprimirArbol(a^.HI);
			writeln('-dni: ', a^.dato.dni);
			ImprimirLista(a^.dato.l);
			ImprimirArbol(a^.HD);
		end;
	end;
	
	
	procedure ImprimirVector(v: vector);
	var
		i: integer;
	begin
		for i:= 1 to 10 do begin
			writeln('cod sucursal: ', i);
			writeln('cant ventas: ', v[i]);
		end;
	end;
	
	
	function RecorrerLista(l: lista; unMonto: real): integer;
	var
		cant: integer;
	begin
		cant:= 0;
		while (l <> niL) do begin
			if (l^.dato.monto > unMonto) then
				cant:= cant + 1;
			l:= l^.sig;
		end;
		RecorrerLista:= cant;	
	end;
	
	
	function ObtenerCantFacturas(a: arbol; unDni: integer; unMonto: real): integer;  // PUNTO B
	begin
		if (a = nil) then
			ObtenerCantFacturas:= 0
		else begin
			if (a^.dato.dni = unDni) then
				ObtenerCantFacturas:= RecorrerLista(a^.dato.l, unMonto)
			else
				if (unDni < a^.dato.dni) then
					ObtenerCantFacturas:= ObtenerCantFacturas(a^.HI, unDni, unMonto)
				else
					ObtenerCantFacturas:= ObtenerCantFacturas(a^.HD, unDni, unMonto);
		end;
	end;
	
	
	procedure ObtenerMaximoRecursivo(v: vector; var cantVentasMax, codMax: integer; diml: integer);
	begin
		if (diml <> 0) then begin
			if (v[diml] > cantVentasMax) then begin
				cantVentasMax:= v[diml];
				codMax:= diml;
			end;
			ObtenerMaximoRecursivo(v, cantVentasMax, codMax, diml-1);
		end;
	end;
	
	
	procedure ObtenerCodMaximo(v: vector; var codMax: integer);  // PUNTO C
	var
		diml, cantVentasMax: integer;
	begin
		diml:= 10;
		cantVentasMax:= 0;
		ObtenerMaximoRecursivo(v, cantVentasMax, codMax, diml);
	end;
	
var	
	a: arbol;
	v: vector;
	unDni, cantCumple, codMax: integer;
	unMonto: real;
begin
	randomize;
	CargarEstructuras(a, v);   // PUNTO A
	ImprimirArbol(a);
	ImprimirVector(v);
	writeln('ingrese un dni');
	readln(unDni);
	writeln('ingrese un monto');
	readln(unMonto);
	cantCumple:= ObtenerCantFacturas(a, unDni, unMonto);   // PUNTO B
	writeln(cantCumple);
	ObtenerCodMaximo(v, codMax);   // PUNTO C
	writeln(codMax);
end.
