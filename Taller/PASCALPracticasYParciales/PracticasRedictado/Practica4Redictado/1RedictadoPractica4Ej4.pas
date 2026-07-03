program redictado;
type
	
	subrango = 1..31; // o sino como string, pero no podria hacer un random
	
	prestamo = record
		ISBN: integer;
		num: integer;
		diaYmes: subrango;
		cantDias: integer;
	end;
	
	arbol1 = ^nodo1;    // estructura I
	nodo1 = record
		dato: prestamo;
		HI: arbol1;
		HD: arbol1;
	end;
	
//------------------------//	

	prest = record     // todos los campos menos el ISBN
		num: integer;
		diaYmes: subrango;
		cantDias: integer;
	end;

	lista = ^nodo;
	nodo = record
		dato: prest;
		sig: lista;
	end;
	
	regLista = record
		ISBN: integer;
		l: lista
	end;
	
	arbol2 = ^nodo2;
	nodo2 = record
		dato: regLista;
		HI: arbol2;
		HD: arbol2;
	end;
	
//------------------------//
	
	regPrestamo = record
		ISBN: integer;
		cantPrestamos: integer;
	end;
	
	Lista2 = ^nodo22;
	nodo22 = record
		dato: regPrestamo;
		sig: Lista2;
	end;
	
//------------------------//	
	
	procedure LeerPrestamo(var p: prestamo);
	begin
		readln(p.ISBN);
		if (p.ISBN <> 0) then begin
			p.num:= random(100);
			p.diaYmes:= random (31 - 1 + 1);
			p.cantDias:= random (30) + 1;
		end;
	end;
	
	
	procedure InsertarElemento1(var a1: arbol1; p: prestamo);
	begin
		if (a1 = nil) then begin
			new(a1);
			a1^.dato:= p;
			a1^.HI:= nil;
			a1^.HD:= nil;
		end
		else begin
			if (p.ISBN < a1^.dato.ISBN) then
				InsertarElemento1(a1^.HI, p)
			else
				InsertarElemento1(a1^.HD, p);
		end;
	end;
	
	
	procedure AgregarAdelante(var l: lista; p: prestamo);
	var
		aux: lista;
	begin
		new(aux);
		aux^.dato.num:= p.num;
		aux^.dato.diaYmes:= p.diaYmes;
		aux^.dato.cantDias:= p.cantDias;
		aux^.sig:= l;
		l:= aux;
	end;
	
	
	procedure InsertarElemento2(var a2: arbol2; p: prestamo);
	begin
		if (a2 = nil) then begin
			new(a2);
			a2^.dato.ISBN:= p.ISBN;
			AgregarAdelante(a2^.dato.l, p);
			a2^.HI:= nil;
			a2^.HD:= nil;
		end
		else begin
			if (p.ISBN = a2^.dato.ISBN) then
				AgregarAdelante(a2^.dato.l ,p)
			else
				if (p.ISBN < a2^.dato.ISBN) then
					InsertarElemento2(a2^.HI, p)
				else
					InsertarElemento2(a2^.HD, p);
		end;
	end;
	
	
	procedure CargarArboles(var a1: arbol1; var a2: arbol2);  // PUNTO A-I-II
	var
		p: prestamo;
	begin
		a1:= nil;
		a2:= nil;
		writeln('Ingrese un ISBN');
		LeerPrestamo(p);
		while (p.ISBN <> 0) do begin
			InsertarElemento1(a1, p);
			InsertarElemento2(a2, p);
			LeerPrestamo(p);
		end;
	end;
	
	
	procedure ImprimirArbol1(a1: arbol1);
	begin
		if (a1 <> nil) then begin
			ImprimirArbol1(a1^.HI);
			writeln('ISBN: ', a1^.dato.ISBN);
			writeln('num: ', a1^.dato.num);
			writeln('dia y mes: ', a1^.dato.diaYmes);
			writeln('cant de dias: ', a1^.dato.cantDias);
			ImprimirArbol1(a1^.HD)
		end;
	end;
	
	
	procedure ImprimirLista(l: lista);
	begin
		while (l <> nil) do begin
			writeln('num: ', l^.dato.num);
			writeln('dia y mes: ', l^.dato.diaYmes);
			writeln('cant de dias: ', l^.dato.cantDias);
			l:= l^.sig;
		end;
	end;
	
	
	procedure ImprimirArbol2(a2: arbol2);
	begin
		if (a2 <> nil) then begin
			ImprimirArbol2(a2^.HI);
			writeln('ISBN: ', a2^.dato.ISBN);
			ImprimirLista(a2^.dato.l);
			ImprimirArbol2(a2^.HD);
		end;
	end;
	
	
	function ObtenerMaximoRecursivo(a1: arbol1): integer;  // PUNTO B
	begin
		if (a1 = nil) then
			ObtenerMaximoRecursivo:= -1
		else
			if (a1^.HD = nil) then
				ObtenerMaximoRecursivo:= a1^.dato.ISBN
			else
				ObtenerMaximoRecursivo:= ObtenerMaximoRecursivo(a1^.HD);
	end;
	
	
	function ObtenerMinimoRecursivo(a2: arbol2): integer;  // PUNTO C
	begin
		if (a2 = nil) then
			ObtenerMinimoRecursivo:= 9999
		else
			if(a2^.HI = nil) then
				ObtenerMinimoRecursivo:= a2^.dato.ISBN
			else
				ObtenerMinimoRecursivo:= ObtenerMinimoRecursivo(a2^.HI);
	end;
	
	
	function ObtenerCantPrestamos(a1: arbol1; numero: integer): integer;  // PUNTO D
	begin
		if (a1 = nil) then
			ObtenerCantPrestamos:= 0
		else
			if (a1^.dato.num = numero) then
				ObtenerCantPrestamos:= ObtenerCantPrestamos(a1^.HI, numero) + ObtenerCantPrestamos(a1^.HD, numero) + 1
			else
				ObtenerCantPrestamos:= ObtenerCantPrestamos(a1^.HI, numero) + ObtenerCantPrestamos(a1^.HD, numero);
	end;
	
	
	function RecorrerLista(l: lista; numero: integer): integer;
	var
		cant: integer;
	begin
		cant:= 0;
		while (l <> nil) do begin
			if (l^.dato.num = numero) then
				cant:= cant + 1;
			l:= l^.sig;
		end;
		RecorrerLista:= cant;
	end;
	
	
	function ObtenerCantPrestamos2(a2: arbol2; numero: integer): integer;  // PUNTO E
	begin
		if (a2 = nil) then
			ObtenerCantPrestamos2:= 0
		else
			ObtenerCantPrestamos2:= ObtenerCantPrestamos2(a2^.HI, numero) + ObtenerCantPrestamos2(a2^.HD, numero) + RecorrerLista(a2^.dato.l, numero);
	end;
	
//----------------------------------------------------------------------------//	
	
	procedure AgregarAdelante2(var L2: Lista2; reg: regPrestamo);
	var
		aux: Lista2;
	begin
		new(aux);
		aux^.dato:= reg;
		aux^.sig:= L2;
		L2:= aux;
	end;
	
	
	procedure InsertarElementoLista(a1: arbol1; var L2: lista2);
	var
		reg: regPrestamo;
	begin
		if (L2 = nil) or (L2^.dato.ISBN <> a1^.dato.ISBN) then begin // pregunto si es el primmero o no es igual 
			reg.ISBN:= a1^.dato.ISBN;                        // armo el registro aca para poder reutilizar el agregar adelante
			reg.cantPRestamos:= 1;
			AgregarAdelante2(L2, reg);
		end
		else
			L2^.dato.cantPrestamos:= L2^.dato.cantPrestamos + 1;   // if (L = ISBN)
		
	end;
	
	
	procedure CargarLista(a1: arbol1; var L2: Lista2);   // PUNTO F
	begin
		if (a1 <> nil) then begin
			CargarLista(a1^.HD, L2);        // recorro de mayor a menor para poder hacer un agregar adelante
			InsertarElementoLista(a1, L2);
			CargarLista(a1^.HI, L2);
		end;
	end;
	
	
	function RecorrerLista2(l: lista): integer;
	var
		cant: integer;
	begin
		cant:= 0;
		while (l <> nil) do begin
			cant:= cant + 1;
			l:= l^.sig;
		end;	
		RecorrerLista2:= cant;
	end;
	
	
	procedure CargarLista2(a2: arbol2; var L3: Lista2);  // PUNTO G
	var
		cantNodos: integer;
		reg: regPrestamo;
	begin
		if (a2 <> nil) then begin
			CargarLista2(a2^.HD, L3);
			cantNodos:= RecorrerLista2(a2^.dato.l);   
			reg.ISBN:= a2^.dato.ISBN;                // armo el registro aca para poder reutilizar el agregar adelante
			reg.cantPrestamos:= cantNodos;
			AgregarAdelante2(L3, reg);       // como tengo todos los prestamos del ISBN en un nodo, no hace falta que haga el 
			CargarLista2(a2^.HI, L3);        // insertar lista
		end;
	end; 
	
//----------------------------------------------------------------------------//	
	
	function ObtenerPrestamo(a1: arbol1; cotaInf, cotaSup: integer): integer;
	begin
		if (a1 =  nil) then
			ObtenerPrestamo:= 0
		else begin
			if (a1^.dato.ISBN > cotaInf) then
				if (a1^.dato.ISBN < cotaSup) then
					ObtenerPrestamo:= ObtenerPrestamo(a1^.HI, cotaInf, cotaSup) + ObtenerPrestamo(a1^.HD, cotaInf, cotaSup) + 1
				else
					ObtenerPrestamo:= ObtenerPrestamo(a1^.HI, cotaInf, cotaSup)
			else
				ObtenerPrestamo:= ObtenerPrestamo(a1^.HD, cotaInf, cotaSup)
		end;
	end;
	
	
	procedure ObtenerPrestamoEntreDosCodigos(a1: arbol1; var cantPres1: integer);  // PUNTO I
	var
		cotaInf, cotaSup: integer;
	begin
		writeln('ingrese cota inferior');
		readln(cotaInf);
		writeln('ingrese cota superior');
		readln(cotaSup);
		cantPres1:= ObtenerPrestamo(a1, cotaInf, cotaSup);
	end;
	
	
	function RecorrerListaPrestamos(l: lista): integer;
	var
		cantCumple: integer;
	begin
		cantCumple:= 0;
		while (l <> nil) do begin
			cantCumple:= cantCumple + 1;
			l:= l^.sig;
		end;
		RecorrerListaPrestamos:= cantCumple;
	end;
	
	
	function ObtenerPrestamo2(a2: arbol2; cotaInf, cotaSup: integer): integer;
	begin
		if (a2 = nil) then
			ObtenerPrestamo2:= 0
		else begin
			if (a2^.dato.ISBN > cotaInf) then
				if (a2^.dato.ISBN < cotaSup) then
					ObtenerPrestamo2:= ObtenerPrestamo2(a2^.HI, cotaInf, cotaSup) + ObtenerPrestamo2(a2^.HD, cotaInf, cotaSup) + RecorrerListaPrestamos(a2^.dato.l)
				else
					ObtenerPrestamo2:= ObtenerPrestamo2(a2^.HI, cotaInf, cotaSup)
			else
				ObtenerPrestamo2:= ObtenerPrestamo2(a2^.HD, cotaInf, cotaSup);
		end;
	end;
	
	
	procedure ObtenerPrestamoEntreDosCodigos2(a2: arbol2; var cantPres2: integer);  // PUNTO J
	var
		cotaInf, cotaSup: integer;
	begin	
		writeln('ingrese cota inferior');
		readln(cotaInf);
		writeln('ingrese cota superior');
		readln(cotaSup);
		cantPres2:= ObtenerPrestamo2(a2, cotaInf, cotaSup);
	end;
	
	
	procedure ImprimirListaRecursiva(L3: Lista2);   // PUNTO H 
	begin
		if (L3 <> nil) then begin
			writeln('ISBN: ', L3^.dato.ISBN);
			writeln('cant de prestamos: ', L3^.dato.cantPrestamos);
			ImprimirListaRecursiva(L3^.sig);
		end;
	end;
	
	
var
	a1: arbol1;
	a2: arbol2;
	L2, L3: Lista2; 
	ISBNmax, ISBNmin, numero, cantPrestamos1, cantPrestamos2, cantPres1, cantPres2: integer;
begin
	randomize;
	CargarArboles(a1, a2);   // PUNTO A-I-II
	ImprimirArbol1(a1);
	writeln('////////////////////////////');
	ImprimirArbol2(a2);
	writeln('////////////////////////////');
	ISBNmax:= ObtenerMaximoRecursivo(a1);   // PUNTO B
	//writeln(ISBNmax);
	ISBNmin:= ObtenerMinimoRecursivo(a2);   // PUNTO C
	//writeln(ISBNmin);
	{writeln('ingrese un numero');
	readln(numero);
	cantPrestamos1:= ObtenerCantPrestamos(a1, numero);   // PUNTO D
	writeln(cantPrestamos1);
	writeln('ingrese un numero');
	readln(numero);
	cantPrestamos2:= ObtenerCantPrestamos2(a2, numero);   // PUNTO E
	writeln(cantPrestamos2);}
	L2:= nil;
	L3:= nil;
	CargarLista(a1, L2);   // PUNTO F
	ImprimirListaRecursiva(L2);
	writeln('////////////////////////////');
	CargarLista2(a2, L3);   // PUNTO G
	ImprimirListaRecursiva(L3);   // PUNTO H 
	{ObtenerPrestamoEntreDosCodigos(a1, cantPres1);   // PUNTO I
	writeln(cantPres1);
	ObtenerPrestamoEntreDosCodigos2(a2, cantPres2);   // PUNTO J
	writeln(cantPres2);}
end.
