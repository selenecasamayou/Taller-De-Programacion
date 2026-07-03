program redictadoLibreria;
type
	
	rangoRubro = 1..6;
	
	producto = record
		cod: integer;
		rubro: rangoRubro;
		precio: real;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: producto;
		sig: lista;
	end;
	
	vector = array [rangoRubro] of lista;
	vecRubro3 = array [1..20] of producto;
	
	
	procedure InicializarVec(var v: vector);
	var
		i: integer;
	begin
		for i:= 1 to 6 do
			v[i]:= nil;
	end;
	
	
	procedure LeerProducto(var p:producto);
	begin
		readln(p.precio);
		if (p.precio <> -1) then begin
			p.cod:= random(100);
			writeln('Ingresar rubro');
			readln(p.rubro);
		end;
	end;
	
	
	procedure InsertarOrdenado(var l: lista; p:producto);
	var
		nue, ant, act: lista;
	begin
		new(nue);
		nue^.dato:= p;
		act:= l;
		ant:= l;
		while (act <> nil) and (p.cod < act^.dato.cod) do begin
			ant:= act;
			act:= act^.sig;
		end; 
		if (act = ant) then
			l:= nue
		else
			ant^.sig:= nue;
		nue^.sig:= act;
	end;
	
	
	procedure CargarVector(var v: vector);   //  PUNTO A
	var
		p: producto;
	begin
		LeerProducto(p);
		while (p.precio <> -1) do begin
			InsertarOrdenado(v[p.rubro], p);
			LeerProducto(p);
		end;
	end;
	
	
	procedure ImprimirLista(l:lista);
	begin
		while (l <> nil) do begin
			writeln('codigo: ', l^.dato.cod);
			l:= l^.sig;
		end;
	end;
	
	
	procedure ImprimirVector(v: vector);  //  PUNTO B
	var
		i: integer;
	begin
		for i:= 1 to 6 do begin
			writeln('Rubro: ', i);
			ImprimirLista(v[i]);
		end;	
	end;
	
	procedure GenerarVector(var vr: vecRubro3; l: lista; var dl: integer);  //  PUNTO C
	begin
		while ((l <> nil) and (dl < 20)) do begin
			dl:= dl + 1;
			vr[dl]:= l^.dato;
			l:= l^.sig;
		end;
	end;
	
	
	procedure OrdenSeleccion(var vr: vecRubro3; dl: integer);  //  PUNTO D
	var
		i, j, pos: integer;
		dato: producto;
	begin
		for i:= 1 to dl-1 do begin
			pos:= i;
			for j:= i+1 to dl do begin
				if (vr[j].precio < vr[pos].precio) then
					pos:= j;
			end;		
			dato:= vr[pos];
			vr[pos]:= vr[i];
			vr[i]:= dato;
		end;
	end;
	
	
	procedure ImprimirVector2(vr: vecRubro3; dl: integer);  //  PUNTO E
	var
		i: integer;
	begin
		for i:= 1 to dl do begin
			{writeln('Codigo:',VR[i].cod);         // no hace falta pero es para entenderlo mejor
			writeln('Rubro:',VR[i].rubro);}
			writeln('Precio:',VR[i].precio:2:2);
		end;
	end;
	
	
	procedure CalcularProm(vr: vecRubro3; dl: integer; var promedio: real);  //  PUNTO F
	var
		sumatotal: real;
		canTotal, i: integer;
	begin
		sumatotal:= 0;
		canTotal:= 0;
		for i:= 1 to dl do begin
			sumatotal:= sumatotal + vr[i].precio;
			canTotal:= canTotal + 1;
		end;
		promedio:= sumatotal/canTotal;
	end;
	
var
	v: vector;
	vr: vecRubro3;
	dl: integer;
	promedio: real;
begin
	randomize;
	InicializarVec(v);
	CargarVector(v);  //  PUNTO A
	ImprimirVector(v);  //  PUNTO B
	dl:= 0;
	GenerarVector(vr, v[3], dl);  //  PUNTO C
	OrdenSeleccion(vr, dl);  //  PUNTO D
	ImprimirVector2(vr, dl);  //  PUNTO E
	CalcularProm(vr, dl, promedio);  //  PUNTO F
	writeln('El promedio de los precios es: ', promedio:2:2); 
end.	
