program RedictadoParcial7;
type
	
	rangoDia = 1..30;
	rangoMes = 1..12;
	
	regFecha = record
		dia: rangoDia;
		mes: rangoMes;
		anio: integer;
	end;
	
	venta = record
		cuil: integer;
		monto: real;
		fecha: regFecha;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: venta;
		HI: arbol;
		HD: arbol;
	end;
	
	vector = array [rangoMes] of arbol;
	
	vecAnios = array [rangoMes] of integer;
	
	
	procedure InicializarVector(var v: vector);
	var
		i: integer;
	begin
		for i:= 1 to 12 do
			v[i]:= nil;
	end;
	
	
	procedure LeerVenta(var ve: venta);
	begin
		readln(ve.cuil);
		if (ve.cuil <> -1) then begin
			ve.monto:= random(1000);
			ve.fecha.dia:= random(30) + 1;
			ve.fecha.mes:= random(12) + 1;
			ve.fecha.anio:= random(2000);
		end;
	end;
	
	
	procedure InsertarElemento(var a: arbol; ve: venta);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato:= ve;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else begin
			if (ve.cuil < a^.dato.cuil) then
				InsertarElemento(a^.HI, ve)
			else
				InsertarElemento(a^.HD, ve)
		end;
	end;
	
	
	procedure CargarVector(var v: vector);  // PUNTO A
	var
		ve: venta;
	begin
		writeln('ingrese una CUIL');
		LeerVenta(ve);
		while (ve.cuil <> -1) do begin
			InsertarElemento(v[ve.fecha.mes], ve);
			LeerVenta(ve);
		end;
	end;
	
	
	procedure ImprimirArbol(a: arbol);
	begin
		if (a <> nil) then begin
			ImprimirArbol(a^.HI);
			writeln('cuil: ', a^.dato.cuil);
			writeln('monto: ', a^.dato.monto:2:2);
			writeln('dia: ', a^.dato.fecha.dia);
			writeln('mes: ', a^.dato.fecha.mes);
			writeln('año: ', a^.dato.fecha.anio);
			ImprimirArbol(a^.HD);
		end;
	end;
	
	
	procedure ImprimirVector(v: vector);
	var
		i: integer;
	begin
		for i:= 1 to 12 do begin
			writeln('-mes: ', i);
			ImprimirArbol(v[i]);
		end;
	end;
	
	
	procedure InsertarElemento2(var a2: arbol; ve: venta);
	begin
		if (a2 = nil) then begin
			new(a2);
			a2^.dato:= ve;
			a2^.HI:= nil;
			a2^.HD:= nil;
		end
		else begin
			if (ve.fecha.anio < a2^.dato.fecha.anio) then
				InsertarElemento2(a2^.HI, ve)
			else
				InsertarElemento2(a2^.HD, ve);
		end;
	end;
	
	
	procedure RecorrerArbol(a: arbol; var a2: arbol; unMonto: real);
	begin
		if (a <> nil) then begin
			RecorrerArbol(a^.HI, a2, unMonto);
			if (a^.dato.monto > unMonto) then
				InsertarElemento2(a2, a^.dato);
			RecorrerArbol(a^.HD, a2, unMonto);
		end;
	end;
	
	
	procedure ObtenerArbolNuevo(v: vector; var a2: arbol; unMonto: real);  // PUNTO B
	var
		i: integer;
	begin
		for i:= 1 to 12 do 
			RecorrerArbol(v[i], a2, unMonto);
	end;
	
	
	procedure ObtenerCantVentas(a2: arbol; var va: vecAnios; cotaInf, cotaSup: integer);
	begin
		if (a2 <> nil) then begin
			if (a2^.dato.fecha.anio > cotaInf) then
				if (a2^.dato.fecha.anio < cotaSup) then begin
					ObtenerCantVentas(a2^.HI, va, cotaInf, cotaSup);
					va[a2^.dato.fecha.mes]:= va[a2^.dato.fecha.mes] + 1;
					ObtenerCantVentas(a2^.HD, va, cotaInf, cotaSup);
				end
				else
					ObtenerCantVentas(a2^.HI, va, cotaInf, cotaSup)
			else
				ObtenerCantVentas(a2^.HD, va, cotaInf, cotaSup);
		end;
	end;
	
	
	procedure InicializarVector2(var va: vecAnios);
	var
		i: integer;
	begin
		for i:= 1 to 12 do
			va[i]:= 0;
	end;
	
	
	procedure ObtenerCantVentasEntreDosAnios(a2: arbol; var va: vecAnios);  // PUNTO C
	var
		cotaInf, cotaSup: integer;
	begin
		writeln('ingrese la cota inferior');
		readln(cotaInf);
		writeln('ingrese la cota superior');
		readln(cotaSup);
		ObtenerCantVentas(a2, va, cotaInf, cotaSup);
	end;
	
	
	procedure ImprimirVector2(va: vecAnios);
	var
		i: integer;
	begin
		for i:= 1 to 12 do begin
			writeln('mes: ', i);
			writeln('cant: ', va[i]);
		end;
	end;
	
	
var
	v: vector;
	a2: arbol;
	unMonto: real;
	va: vecAnios;
begin
	randomize;
	InicializarVector(v); // en nil
	CargarVector(v);   // PUNTO A
	ImprimirVector(v);
	writeln('ingrese un monto');
	readln(unMonto);
	ObtenerArbolNuevo(v, a2, unMonto);   // PUNTO B
	writeln('----------------------------');
	ImprimirArbol(a2); 
	InicializarVector2(va);
	ObtenerCantVentasEntreDosAnios(a2, va);   // PUNTO C
	writeln('----------------------------');
	ImprimirVector2(va);
end.	
