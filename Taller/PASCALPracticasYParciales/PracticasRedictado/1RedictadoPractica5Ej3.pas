program redictado;
type
	
	rangoRubro = 1..10;
	
	producto = record
		cod: integer;
		rubro: rangoRubro;
		stock: integer;
		precio: real;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: producto;
		HI: arbol;
		HD: arbol;
	end;
	
	vector = array [rangoRubro] of arbol;
	
	reg = record
		codMax: integer;
		stockMax: integer;
	end;
	
	vecMaximos = array [rangoRubro] of reg;
	
	vecProd = array [rangoRubro] of integer;
	
	
	procedure InicializarVector(var v: vector);
	var
		i: integer;
	begin
		for i:= 1 to 10 do
			v[i]:= nil;
	end;
	
	
	procedure LeerProducto(var p: producto);
	begin
		readln(p.cod);
		if (p.cod <> 0) then begin
			p.rubro:= random(10) + 1;
			p.stock:= random(500);
			p.precio:= random(2000);
		end;
	end;
	
	
	procedure InsertarElemento(var a: arbol; p: producto);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato:= p;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else begin
			if (p.cod < a^.dato.cod) then
				InsertarElemento(a^.HI, p)
			else
				InsertarElemento(a^.HD, p);
		end;
	end;
	
	
	procedure CargarVector(var v: vector);  // PUNTO A
	var
		p: producto;
	begin
		InicializarVector(v);
		writeln('ingrese un cod');
		LeerProducto(p);
		while (p.cod <> 0) do begin
			InsertarElemento(v[p.rubro], p);
			LeerProducto(p);
		end;
	end;
	
	
	procedure ImprimirArbol(a: arbol);
	begin
		if (a <> nil) then begin
			ImprimirArbol(a^.HI);
			writeln('cod: ', a^.dato.cod);
			//rubro:  no es necesario
			writeln('stock: ', a^.dato.precio);
			writeln('precio: ', a^.dato.stock);
			ImprimirArbol(a^.HD);
		end;
	end;
	
	
	procedure ImprimirVector(v: vector);
	var
		i: integer;
	begin
		for i:= 1 to 10 do begin
			writeln('-rubro: ', i);
			ImprimirArbol(v[i]);
		end;
	end;
	
	
	function BuscarCodigoRecursivo(a: arbol; unCod: integer): boolean;
	begin
		if (a = nil) then
			BuscarCodigoRecursivo:= false
		else
			if (a^.dato.cod = unCod) then
				BuscarCodigoRecursivo:= true
			else
				if (a^.dato.cod < unCod) then
					BuscarCodigoRecursivo:= BuscarCodigoRecursivo(a^.HI, unCod)
				else
					BuscarCodigoRecursivo:= BuscarCodigoRecursivo(a^.HD, unCod);
	end;
	
	
	
	function BuscarCodigo(v: vector; unRubro, unCod: integer): boolean;  // PUNTO B
	var
		encontre: boolean;
	begin
		encontre:= BuscarCodigoRecursivo(v[unRubro], unCod);
		if (encontre) then
			BuscarCodigo:= true
		else
			BuscarCodigo:= false
	end;
	
	
	procedure InicializarVector2(var vmax:vecMaximos);
	var
		i: integer;
	begin
		for i:= 1 to 10 do begin
			vmax[i].codMax:= 0;
			vmax[i].stockMax:= 0;
		end;	
	end;
	
	
	procedure ObtenerCodMaximo(a: arbol; var regMax: reg);
	begin
		if (a <> nil) then begin
			if (a^.HD = nil) then begin   // llegue al ultimo
				regMax.codMax:= a^.dato.cod;
				regMax.stockMax:= a^.dato.stock;
			end
			else
				ObtenerCodMaximo(a^.HD, regMax);
		end
		else begin
			regMax.codMax:= 0;
			regMax.stockMax:= 0;
		end;
	end;
	
	
	procedure ObtenerMaximos(v: vector; var vmax: vecMaximos);  // PUNTO C
	var
		i: integer;
		regMax: reg;
	begin
		InicializarVector2(vmax);
		for i:= 1 to 10 do begin
			ObtenerCodMaximo(v[i], regMax);
			vmax[i]:= regMax;
		end;
	end;
	
	
	procedure ImprimirVector2(vmax: vecMaximos);
	var
		i: integer;
	begin
		for i:= 1 to 10 do begin
			writeln('rubro: ', i);
			writeln('cod maximo: ', vmax[i].codMax);
			writeln('stock maximo: ', vmax[i].stockMax);
		end;	
	end;
	
	
	function ObtenerCantProductos(a: arbol; cotaInf, cotaSup: integer): integer;
	begin
		if (a = nil) then
			ObtenerCantProductos:= 0
		else
			if (a^.dato.cod > cotaInf) then
				if (a^.dato.cod < cotaSup) then
					ObtenerCantProductos:= ObtenerCantProductos(a^.HI, cotaInf, cotaSup) + ObtenerCantProductos(a^.HD, cotaInf, cotaSup) + 1
				else
					ObtenerCantProductos:= ObtenerCantProductos(a^.HI, cotaInf, cotaSup) 
			else
				ObtenerCantProductos:= ObtenerCantProductos(a^.HD, cotaInf, cotaSup) 
	end;
	
	
	procedure ObtenerProductos(v: vector; var vp: vecProd; cotaInf, cotaSup: integer);
	var
		i, cantProd: integer;
	begin
		for i:= 1 to 10 do begin
			cantProd:= 0;
			cantProd:= ObtenerCantProductos(v[i], cotaInf, cotaSup);
			vp[i]:= cantProd;
		end;
	end;
	
	
	procedure InicializarVector3(var vp: vecProd);
	var
		i: integer;
	begin
		for i:= 1 to 10 do 
			vp[i]:= 0;
	end;	
		
	
	procedure ObtenerProductosEntreDosCodigos(v: vector; var vp: vecProd);  // PUNTO D
	var
		cotaInf, cotaSup: integer;
	begin
		InicializarVector3(vp);
		writeln('ingrese la cota inferior');
		readln(cotaInf);
		writeln('ingrese la cota superior');
		readln(cotaSup);
		ObtenerProductos(v, vp, cotaInf, cotaSup);
	end;	
	
	
	procedure ImprimirVector3(vp: vecProd);
	var
		i: integer;
	begin
		for i:= 1 to 10 do begin
			writeln('rubro: ', i);
			writeln('cant ', vp[i]);
		end;
	end;
	
var
	v: vector;
	unRubro, unCod: integer;
	existe: boolean;
	vmax: vecMaximos;
	vp: vecProd;
begin
	randomize;
	CargarVector(v);   // PUNTO A
	ImprimirVector(v);
	writeln('ingrese un rubro');
	readln(unRubro);
	writeln('ingrese un cod');
	readln(unCod);
	existe:= BuscarCodigo(v, unRubro, unCod);   // PUNTO B
	//writeln(existe);
	ObtenerMaximos(v, vmax);   // PUNTO C
	//ImprimirVector2(vmax);
	ObtenerProductosEntreDosCodigos(v, vp);   // PUNTO D
	//ImprimirVector3(vp);
end.
