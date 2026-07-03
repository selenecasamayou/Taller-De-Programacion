program redictado;
type
	
	venta = record
		codVenta: integer;
		codProd: integer;
		cant: integer;
		precio: real;
	end;
	
//---------------------------//	
	
	producto = record
		cod: integer;
		cantVendida: integer;
		montoTotal: real;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: producto;
		HI: arbol;
		HD: arbol;
	end;
	
	
	procedure LeerVenta(var v: venta);
	begin
		readln(v.codVenta);
		if (v.codVenta <> -1) then begin
			v.codProd:= random(100);
			v.cant:= random(1000);
			v.precio:= random(500);
		end;
	end; 
	
	
	procedure CargarProducto(var p:producto; v: venta);
	begin
		p.cod:= v.codProd;
		p.cantVendida:= v.cant;
		p.montoTotal:= v.cant * v.precio;
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
			if (p.cod = a^.dato.cod) then begin  // si es el mismo producto, se actualizan sus campos
				a^.dato.cantVendida:= a^.dato.cantVendida + p.cantVendida;
				a^.dato.montoTotal:= a^.dato.montoTotal + p.montoTotal; // = (v.cant * v.precio)
			end
			else
				if (p.cod < a^.dato.cod) then
					InsertarElemento(a^.HI, p)
				else
					InsertarElemento(a^.HD, p)
		end;			
	end;
	
	
	procedure CargarArbol(var a: arbol);  // PUNTO A
	var
		p: producto;
		v: venta;
	begin
		a:= nil;
		writeln('Ingrese un codigo de venta');
		LeerVenta(v);
		CargarProducto(p, v);
		while (v.codVenta <> -1) do begin
			InsertarElemento(a, p);
			CargarProducto(p, v);
		end;
	end;
	
	
	procedure ImprimirArbol(a: arbol);  // PUNTO B
	begin
		if (a <> nil) then begin
			ImprimirArbol(a^.HI);
			writeln('Cod: ', a^.dato.cod);
			writeln('Cantidad vendida: ', a^.dato.cantVendida);
			writeln('Monto total: ', a^.dato.montoTotal:2:2);
			ImprimirArbol(a^.HD);
		end;
	end;
	
	
	procedure ObtenerMaximoRecursivo(a: arbol; var codProdMax, cantVendidaMax: integer);
	begin
		if (a <> nil) then begin
			if (a^.dato.cantVendida > cantVendidaMax) then begin
				cantVendidaMax:= a^.dato.cantVendida;
				codProdMax:= a^.dato.cod;
			end;
			ObtenerMaximoRecursivo(a^.HI, codProdMax, cantVendidaMax);
			ObtenerMaximoRecursivo(a^.HD, codProdMax, cantVendidaMax);
		end;	
	end;
	
	
	procedure ObtenerMaximo(a: arbol; var codProdMax: integer);  // PUNTO C
	var
		cantVendidaMax: integer;
	begin
		cantVendidaMax:= -1;
		ObtenerMaximoRecursivo(a, codProdMax, cantVendidaMax);
	end;
	
	
	function ObtenerCodigos(a: arbol; valor: integer): integer;  // PUNTO D
	begin
		if (a = nil) then
			ObtenerCodigos:= 0
		else
			if (a^.dato.cod < valor) then
				ObtenerCodigos:= ObtenerCodigos(a^.HI, valor) + ObtenerCodigos(a^.HD, valor) + 1
			else
				ObtenerCodigos:= ObtenerCodigos(a^.HI, valor);  // preguntar si esta bien, yo se que si 
	end;
	
	
	function ObtenerMontoTotal(a: arbol; cotaInf, cotaSup: integer): real;
	begin
		if (a = nil) then
			ObtenerMontoTotal:= 0
		else begin
			if (a^.dato.cod > cotaInf) then
				if (a^.dato.cod < cotaSup) then
					ObtenerMontoTotal:= ObtenerMontoTotal(a^.HI, cotaInf, cotaSup) + ObtenerMontoTotal(a^.HD, cotaInf, cotaSup) + a^.dato.montoTotal
				else
					ObtenerMontoTotal(a^.HI, cotaInf, cotaSup)
			else
				ObtenerMontoTotal(a^.HD, cotaInf, cotaSup)
		end;		
	end;
	
	
	procedure ObtenerMontoTotalEntreDosCodigos(a: arbol; var monTotal: real);  // PUNTO E
	var
		cotaInf, cotaSup: integer;
	begin	
		writeln('ingrese cota inferior');
		readln(cotaInf);
		writeln('ingrese cota superior');
		readln(cotaSup);
		monTotal:= ObtenerMontoTotal(a, cotaInf, cotaSup);
	end;	
	
var
	a: arbol;
	codProdMax, valor, cantCod: integer;
	monTotal: real;
begin
	CargarArbol(a);   // PUNTO A
	ImprimirArbol(a);   // PUNTO B
	ObtenerMaximo(a, codProdMax);   // PUNTO C
	writeln('El codigo con mayor cantidad de unidades vendidas es: ', codProdMax);
	writeln('ingrese un valor');
	readln(valor);
	cantCod:= ObtenerCodigos(a, valor);   // PUNTO D
	ObtenerMontoTotalEntreDosCodigos(a, monTotal);
	writeln('El monto entre el codigo es: ', monTotal:2:2);   // PUNTO E
end.
