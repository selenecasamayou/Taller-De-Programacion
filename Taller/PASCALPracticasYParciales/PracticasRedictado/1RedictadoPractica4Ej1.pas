program redictado;
type

	venta = record
		codVenta: integer;
		codProd: integer;
		cantUni: integer;
		precio: real;
	end;	
		
//----------------------------//		
	
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
		if (v.codVenta <> 0) then begin
			v.codProd:= random(100 + 1);
			v.cantUni:= random(500 + 1);
			v.precio:= random(1000 + 1);
		end;
	end;
	
	
	procedure CargarProducto(var p: producto; v: venta);
	begin
		p.cod:= v.codProd;
		p.cantVendida:= v.cantUni;
		p.montoTotal:= v.cantUni * v.precio;
	end;
	
	
	procedure InsertarElemento(var a: arbol; var p: producto; v: venta);
	begin
		if (a =  nil) then begin
			new(a);
			CargarProducto(p, v);
			a^.dato:= p;
			a^.HI:= nil;
			a^.HD:= niL;
		end
		else begin
			if (a^.dato.cod = v.codProd) then begin  //actualizo sus campos
				a^.dato.cantVendida:= a^.dato.cantVendida + v.cantUni;  // hago lo mismo que en CargarProducto
				a^.dato.montoTotal:= a^.dato.montoTotal + (v.cantUni * v.precio);
			end
			else
				if (v.codProd < a^.dato.cod) then
					InsertarElemento(a^.HI, p, v)
				else
					InsertarElemento(a^.HD, p, v)
		end;			
	end;
	
	
	procedure CargarArbol(var a: arbol);
	var
		p: producto;
		v: venta;
	begin
		a:= nil;
		writeln('Ingrese cod de venta');
		LeerVenta(v);
		while (v.codVenta <> 0) do begin
			InsertarElemento(a, p, v);
			LeerVenta(v);
		end;
	end;	
	
	
	procedure ImprimirArbol(a: arbol);
	begin
		if (a <> nil) then begin
			ImprimirArbol(a^.HI);
			writeln('cod :', a^.dato.cod);
			writeln('cant vendida :', a^.dato.cantVendida);
			writeln('monto total :', a^.dato.montoTotal);
			ImprimirArbol(a^.HD);
		end;
	end;
	
	
	function ObtenerMinimo(a: arbol): integer;  // PUNTO C , recorre solo por el HI, por el criterio de orden
	begin
		if (a = nil) then
			ObtenerMinimo:= 9999
		else
			if (a^.HI = nil) then // llegue al ultimo (minimo)
				ObtenerMinimo:= a^.dato.cod
			else
				ObtenerMinimo:= ObtenerMinimo(a^.HI); // sino avanzo
	end;
	
	
	function ObtenerCodigosMenores(a: arbol; valor: integer): integer;  // PUNTO D
	begin
		if (a = nil) then
			ObtenerCodigosMenores:= 0
		else
			if (a^.dato.cod < valor) then
				ObtenerCodigosMenores:= ObtenerCodigosMenores(a^.HI, valor) + ObtenerCodigosMenores(a^.HD, valor) + 1
			else
				ObtenerCodigosMenores:= ObtenerCodigosMenores(a^.HI, valor);
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
					ObtenerMontoTotal:= ObtenerMontoTotal(a^.HI, cotaInf, cotaSup)
			else
				ObtenerMontoTotal:= ObtenerMontoTotal(a^.HD, cotaInf, cotaSup);
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
	codMin, valor, cantCodigos: integer;
	monTotal: real;
begin
	randomize;
	CargarArbol(a);   // PUNTO A
	ImprimirArbol(a);   // PUNTO B
	codMin:= ObtenerMinimo(a);   // PUNTO C
	writeln('ingrese un valor');
	readln(valor);
	cantCodigos:= ObtenerCodigosMenores(a, valor);   // PUNTO D
	ObtenerMontoTotalEntreDosCodigos(a, monTotal);   // PUNTO E
	writeln(monTotal:2:2);
end.	
