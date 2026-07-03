program redictado;
type
	
	venta = record
		cod: integer;
		fecha: integer;
		cant: integer;
	end;
	
	arbol1 = ^nodo1;
	nodo1 = record
		dato: venta;
		HI: arbol1;
		HD: arbol1;
	end;
	
//--------------------------//	
	
	venta2 = record
		cod: integer;
		cant: integer;
	end;
	
	arbol2 = ^nodo2;
	nodo2 = record
		dato: venta2;
		HI: arbol2;
		HD: arbol2;
	end;
	
//--------------------------//	
	
	lista = ^nodo;
	nodo = record
		dato: integer;
		sig: lista;
	end;
	
	venta3 = record
		cod: integer;
		l: lista;
	end;
	
	arbol3 = ^nodo3;
	nodo3 = record
		dato: venta3; 
		HI: arbol3;
		HD: arbol3;
	end;
		
	
	procedure LeerVenta(var v: venta);
	begin
		v.cod:= random(100);
		if (v.cod <> 0) then begin
			v.fecha:= random(31 - 1 + 1) + 1;
			v.cant:= random(1000);
		end;
	end;
	
	
	procedure InsertarElemento1(var a1: arbol1; v: venta);
	begin
		if (a1 = nil) then begin
			new(a1);
			a1^.dato:= v;
			a1^.HI:= nil;
			a1^.HD:= nil;
		end
		else begin
			if (v.cod < a1^.dato.cod) then
				InsertarElemento1(a1^.HI, v)
			else
				InsertarElemento1(a1^.HD, v)
		end;
	end;
	
	
	procedure InsertarElemento2(var a2: arbol2; v: venta);
	begin
		if (a2 = nil) then begin
			new(a2);
			a2^.dato.cod:= v.cod;
			a2^.dato.cant:= v.cant;
			a2^.HI:= nil;
			a2^.HD:= nil;
		end	
		else begin
			if (v.cod = a2^.dato.cod) then
				a2^.dato.cant:= a2^.dato.cant + v.cant  // actualizo cantidad vendida
			else
				if (v.cod < a2^.dato.cod) then 
					InsertarElemento2(a2^.HI, v)
				else
					InsertarElemento2(a2^.HD, v);
		end;
	end;
	
	
	procedure AgregarAdelante(var l: lista; v: venta);
	var
		aux: lista;
	begin
		new(aux);
		aux^.dato:= v.cant;
		aux^.sig:= l;
		l:= aux;
	end;
	
	
	procedure InsertarElemento3(var a3: arbol3; v: venta);
	begin
		if (a3 = nil) then begin   // es el primero
			new(a3);
			a3^.dato.cod:= v.cod;
			a3^.dato.l:= nil;
			AgregarAdelante(a3^.dato.l, v);   // para guardar el primero
			a3^.HI:= nil;
			a3^.HD:= nil;
		end
		else begin
			if (v.cod < a3^.dato.cod) then    // si es mas chica que la raiz o el nodo
				InsertarElemento3(a3^.HI, v)
			else
				if (v.cod > a3^.dato.cod) then    // si es mas grande que la raiz o el nodo
					InsertarElemento3(a3^.HD, v)
				else
					AgregarAdelante(a3^.dato.l, v);   // si es igual agrego a la lista 
		end;
	end;
	
	
	procedure CargarArboles(var a1: arbol1; var a2: arbol2; var a3:arbol3);  // PUNTO A-1-2-3
	var
		v: venta;
	begin
		a1:= nil;
		a2:= nil;
		a3:= nil;
		LeerVenta(v);
		while (v.cod <> 0) do begin
			InsertarElemento1(a1, v);
			InsertarElemento2(a2, v);
			InsertarElemento3(a3, v);
			LeerVenta(v);
		end;
	end;
	
	
	procedure ImprimirArbol(a1: arbol1);
	begin
		if (a1 <> nil) then begin
			ImprimirArbol(a1^.HI);
			writeln('cod: ', a1^.dato.cod);
			writeln('fecha: ', a1^.dato.fecha);
			writeln('cant: ', a1^.dato.cant);
			ImprimirArbol(a1^.HD);
		end;	
	end;
	
	
	procedure ImprimirArbol2(a2: arbol2);
	begin
		if (a2 <> nil) then begin
			ImprimirArbol2(a2^.HI);
			writeln('cod: ', a2^.dato.cod);
			writeln('cant: ', a2^.dato.cant);
			ImprimirArbol2(a2^.HD);
		end;	
	end;
	
	
	procedure ImprimirLista(l: lista);
	begin
		while(l <> nil) do begin
			writeln('cant: ', l^.dato);
			l:= l^.sig;
		end;
	end;
	
	
	procedure ImprimirArbol3(a3: arbol3);
	begin
		if (a3 <> nil) then begin
			ImprimirArbol3(a3^.HI);
			writeln('cod: ', a3^.dato.cod);
			ImprimirLista(a3^.dato.l);
			ImprimirArbol3(a3^.HD);
		end;
	end;
	
	
	function CalcularVentas(a1: arbol1; fecha: integer): integer;  // PUNTO B
	begin
		if (a1 = nil) then
			CalcularVentas:= 0
		else
			if (a1^.dato.fecha = fecha) then
				CalcularVentas:= CalcularVentas(a1^.HI, fecha) + CalcularVentas(a1^.HD, fecha) + a1^.dato.cant
			else
				CalcularVentas:= CalcularVentas(a1^.HI, fecha) + CalcularVentas(a1^.HD, fecha);
		
	end;
	
	
	procedure ObtenerMaximoRecursivo(a2: arbol2; var codmax, cantmax: integer);  // PUNTO C
	begin
		if (a2 <> nil) then begin
			ObtenerMaximoRecursivo(a2^.HI, codmax, cantmax);
			if (a2^.dato.cant > cantmax) then begin
				cantmax:= a2^.dato.cant;
				codmax:= a2^.dato.cod;
			end;
			ObtenerMaximoRecursivo(a2^.HD, codmax, cantmax);
		end;	
	end;
	
	
	function ContarCantVentas(l: lista): integer;
	begin
		if (l = nil) then
			ContarCantVentas:= 0
		else
			ContarCantVentas:= ContarCantVentas(l^.sig) + 1;  // cuento los nodos que tiene la lista
	end;
	
	
	procedure ObtenerNodoMaximo(a3: arbol3; var codNodoMax, cantmax2: integer);  // PUNTO D
	var
		cantnodos: integer;
	begin
		if (a3 <> nil) then begin
			cantnodos:= ContarCantVentas(a3^.dato.l);
			if (cantnodos > cantmax2) then begin
				cantmax2:= cantnodos;
				codNodoMax:= a3^.dato.cod;
			end;
			ObtenerNodoMaximo(a3^.HI, codNodoMax, cantmax2);
			ObtenerNodoMaximo(a3^.HD, codNodoMax, cantmax2);
		end;
	end;
	
	
var
	a1: arbol1;
	a2: arbol2;
	a3: arbol3;
	fecha, cantVendida, cantmax, codmax, codNodoMax, cantmax2: integer;
begin
	CargarArboles(a1, a2, a3);   // PUNTO A-1-2-3
	ImprimirArbol(a1);
    writeln('///////////////////////');
    ImprimirArbol2(a2);
    writeln('///////////////////////');
    ImprimirArbol3(a3);   // si funca
    readln(fecha);
    cantVendida:= CalcularVentas(a1, fecha);   // PUNTO B
    writeln('La cantidad vendida es: ', cantVendida);
    cantmax:= -1;
    ObtenerMaximoRecursivo(a2, codmax, cantmax);   // PUNTO C
    writeln('El codigo con mas cant vendida es: ', codmax);
    cantmax2:= -1;
    ObtenerNodoMaximo(a3, codNodoMax, cantmax2);
    writeln('El codigo con mas cant vendida (nodos) es: ', codNodoMax);   // PUNTO D
end.	
