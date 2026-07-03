program redictado;
type
	
	rangoNota = 1..10;
	
	finales = record
		cod: integer;
		fecha: integer;
		nota: rangoNota;
	end;
	
	lista = ^nodo1;
	nodo1 = record
		dato: finales;
		sig: lista;
	end;
	
	alumno = record
		legajo: integer;
		l: lista;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: alumno;
		HI: arbol;
		HD: arbol;
	end;	
	
//---------------------------------------//
	
	reg = record
		legajo: integer;
		prom: real;
	end;
	
	listaprom = ^nodo2;
	nodo2 = record
		dato: reg;
		sig: listaprom;
	end;
	
	
	procedure LeerFinal(var f: finales);
	begin
		f.cod:= random(1000);
		f.fecha:= random(100);
		f.nota:= random(10 - 1 + 1);
	end;
	
	
	procedure AgregarAdelante(var l: lista; f: finales);
	var
		aux: lista;
	begin
		new(aux);
		aux^.dato:= f;
		aux^.sig:= l;
		l:= aux;
	end;
	
	
	procedure InsertarElemento(var a: arbol; legajo: integer; f: finales);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato.legajo:= legajo;
			a^.dato.l:= nil;
			AgregarAdelante(a^.dato.l, f);
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else begin
			if (legajo < a^.dato.legajo) then
				InsertarElemento(a^.HI, legajo, f)
			else
				if (legajo > a^.dato.legajo) then
					InsertarElemento(a^.HD, legajo, f)
				else
					AgregarAdelante(a^.dato.l, f);
		end;			
	end;
	
	
	procedure CargarArbol(var a: arbol);  // PUNTO A
	var
		f: finales;
		al: alumno;
	begin
		a:= nil;
		writeln('ingrese un legajo');
		readln(al.legajo);
		while (al.legajo <> 0) do begin
			LeerFinal(f);
			InsertarElemento(a, al.legajo, f);
			readln(al.legajo);
		end;	
	end;
	
	
	procedure ImprimirLista(l: lista);
	begin
		while (l <> nil) do begin
			writeln('cod: ', l^.dato.cod);
			writeln('fecha: ', l^.dato.fecha);
			writeln('nota: ', l^.dato.nota);
			l:= l^.sig;
		end;
	end;
	
	
	procedure ImprimirArbol(a:arbol);
	begin
		if (a <> nil) then begin
			ImprimirArbol(a^.HI);
			writeln('legajo: ', a^.dato.legajo);
			ImprimirLista(a^.dato.l);
			ImprimirArbol(a^.HD);
		end;
	end;
	
	
	function Cumple(legajo: integer): boolean;
	begin
		if (legajo mod 3 = 0) then
			cumple:= true
		else
			cumple:= false;
	end;
	
	
	function CantLegajo(a: arbol): integer;  // PUNTO B
	begin
		if (a = nil) then
			CantLegajo:= 0
		else begin
			if(Cumple(a^.dato.legajo)) then
				CantLegajo:= CantLegajo(a^.HI) + CantLegajo(a^.HD) + 1
			else
				CantLegajo:= CantLegajo(a^.HI) + CantLegajo(a^.HD);
		end;
	end;
	
	
	function aprobados(l: lista): integer;  // es mejor asi 
	var
		cant: integer;
	begin
		cant:= 0;
		while (l <> nil) do begin
			if (l^.dato.nota >= 4) then
				cant:= cant + 1;
			l:= l^.sig;
		end;
		aprobados:= cant;
	end;
	
	
	procedure CantFinales(a: arbol);  // PUNTO C
	begin
		if (a <> nil) then begin
			CantFinales(a^.HI);
			writeln('Legajo: ', a^.dato.legajo);
			writeln('Cantidad de finales aprobados: ', aprobados(a^.dato.l));
			CantFinales(a^.HD);
		end;
	end;
	
	
	procedure RecorrerListaFinales(l: lista; var cantFinales, sumaNotas: integer);
	begin
		if (l <> nil) then begin
			cantFinales:= cantFinales + 1;
			sumaNotas:= sumaNotas + l^.dato.nota;
			RecorrerListaFinales(l^.sig, cantFinales, sumaNotas);
		end;
	end;
	
	
	function ObtenerPromedio(l: lista): real;
	var
		cantFinales, sumaNotas: integer;
	begin
		RecorrerListaFinales(l, cantFinales, sumaNotas);
		ObtenerPromedio:= (sumaNotas / cantFinales);
	end;
	
	
	procedure AgregarAdelante(var lp: listaprom; legajo: integer; promedio:real);
	var
		aux: listaprom;
	begin
		new(aux);
		aux^.dato.legajo:= legajo;
		aux^.dato.prom:= promedio;
		aux^.sig:= lp;
		lp:= aux;
	end;
	
	
	procedure SuperaPromedio(a: arbol; prom: real; var lp: listaprom);  // PUNTO D
	var
		promedio: real;
	begin
		if (a <> nil) then begin
			promedio:= ObtenerPromedio(a^.dato.l);
			if (promedio > prom) then
				AgregarAdelante(lp, a^.dato.legajo, promedio);
				//writeln('El alumno: ', a^.dato.legajo, ' con promedio: ', promedio, ' supera al promedio ingresado'); 
			SuperaPromedio(a^.HI, prom, lp);
			SuperaPromedio(a^.HD, prom, lp);
		end;
	end;
	
	
var
	a: arbol;
	lp:listaprom;
	cantLegImpar: integer;
	prom: real;
begin	
	randomize;
	CargarArbol(a);   // PUNTO A
	ImprimirArbol(a);
	cantLegImpar:= CantLegajo(a);   // PUNTO B
	//writeln(cantLegImpar);
	CantFinales(a);   // PUNTO C
	writeln('ingrese un promedio');
	readln(prom);
	lp:= nil;
	SuperaPromedio(a, prom, lp);   // PUNTO D
end.
