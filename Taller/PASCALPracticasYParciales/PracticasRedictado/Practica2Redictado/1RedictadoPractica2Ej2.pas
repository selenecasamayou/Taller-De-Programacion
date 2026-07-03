program redictado;
type
	
	lista = ^nodo;
	nodo = record
		dato: integer;
		sig: lista;
	end;
	
	
	procedure AgregarAdelante(var l: lista; num: integer);
	var
		aux: lista;
	begin
		new(aux);
		aux^.dato:= num;
		aux^.sig:= l;
		l:= aux;
	end;
	
	
	procedure CargarListaRecursiva(var l: lista);  // PUNTO A
	var
		num: integer;
	begin
		num:= random(200 - 100 + 1) + 100;
		if (num <> 100) then begin
			AgregarAdelante(l, num);
			CargarListaRecursiva(l^.sig);
		end;
	end;
	
	
	procedure CargarLista(var l: lista);
	begin
		l:= nil;
		CargarListaRecursiva(l);
	end;
	
	
	procedure ImprimirListaRecursiva(l: lista);  // PUNTO B
	begin
		if (l <> nil) then begin
			writeln(l^.dato);
			ImprimirListaRecursiva(l^.sig);
		end;
	end;	
	
	
	procedure ImprimirListaRecursivaInversa(l: lista);  // PUNTO C
	begin
		if (l <> nil) then begin
			ImprimirListaRecursivaInversa(l^.sig);
			writeln(l^.dato);
		end;
	end;
	
	
	function BuscarMinimoRecursivo(l: lista): integer;  // PUNTO D
	var
		min: integer;
	begin
		if (l <> nil) then begin
			min:= BuscarMinimoRecursivo(l^.sig);  // comparo con mi nodo siguiente
			if (l^.dato < min) then 
				BuscarMinimoRecursivo:= l^.dato  // preguntar para que me expliquen porque no entendi bien
			else
				BuscarMinimoRecursivo:= min;
		end
		else
			BuscarMinimoRecursivo:= 9999;  // si no tengo nodo siguiente, este toma el valor 9999
	end;
	
	
	function BuscarValorRecursivo(l: lista; valor: integer): boolean;  // PUNTO E
	begin
		if (l = nil) then                                   // primer caso: caso base
			BuscarValorRecursivo:= false   
		else begin
			if (l^.dato = valor) then                       // segundo caso: mi objetivo
				BuscarValorRecursivo:= true
			else
				BuscarValorRecursivo:= BuscarValorRecursivo(l^.sig, valor);      // tercer caso: sigo buscando
		end;
	end;
	
	
var
	l: lista;
	min, valor: integer;
	encontre: boolean;
begin
	randomize;
	CargarLista(l);   // PUNTO A
	ImprimirListaRecursiva(l);   // PUNTO B
	writeln('-----------------------------------------');  // solo para que quede bien en pantalla grafica
	ImprimirListaRecursivaInversa(l);   // PUNTO C
	writeln('-----------------------------------------');
	min:= BuscarMinimoRecursivo(l);   // PUNTO D
	writeln(min);  // innecesario
	writeln('ingrese un valor');
	readln(valor);
	encontre:= BuscarValorRecursivo(l, valor);   // PUNTO E
	writeln(encontre);  // innecesario
end.
