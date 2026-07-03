program redictadoNetflix;
const
	df = 8;
type
	
	rangoGenero = 1..df;
	
	pelicula = record
		cod: integer;
		genero: rangoGenero;
		promedio: real;
	end;
	
	lista = ^nodo;
	nodo = record
		dato: pelicula;
		sig: lista;
	end;
	
	regLista = record
		pri: lista;
		ult: lista;
	end;
	
	reg = record
		cod: integer;
		promedio: real;
	end;
	
	vectorGeneros = array [rangoGenero] of regLista;
	vecMax = array [rangoGenero] of reg;
	
	
	procedure LeerPelicula (var p:pelicula);
	begin
		writeln('hola');
		readln(p.cod);
		if (p.cod <> -1) then begin
			p.genero:= random(8 - 1) + 1;
			p.promedio:= random(1000);
		end;
	end;
	
	procedure AgregarAtras ({var} reg: regLista; p: pelicula);
	var
		aux: lista;
	begin
		new(aux);
		aux^.dato:= p;
		aux^.sig:= nil;
		if (reg.pri = nil) then
			reg.pri:= aux
		else
			reg.ult^.sig:= aux;
		reg.ult:= aux;
	end;
	
	
	procedure CargarVecGeneros (var vg: vectorGeneros);   //PUNTO A
	var
		p:pelicula;
	begin
		LeerPelicula(p);
		while (p.cod <> -1) do begin
			AgregarAtras(vg[p.genero], p);
			LeerPelicula(p);
		end;
	end;
	
	
	procedure InicializarVec (var vm: vecMax);
	var
		i: integer;
	begin
		for i:= 1 to 8 do begin
			vm[i].cod:= 0;
			vm[i].promedio:= 0;
		end;
	end;
	
	
	procedure BuscarMaximo(var codMax: integer; var promMax: real; l: lista);
	begin
		promMax:= -1;
		while (l <> nil) do begin
			if (l^.dato.promedio > promMax) then begin
				promMax:= l^.dato.promedio;
				codMax:= l^.dato.cod;
			end;
		end;
	end;
	
	
	procedure CargarMaximos(var vm: vecMax; vg: vectorGeneros);  //PUNTO B
	var
		i, codMax: integer;
		promMax: real;
	begin
		for i:= 1 to 8 do begin
			BuscarMaximo(codMax, promMax, vg[i].pri);
			vm[i].cod:= codMax;
			vm[i].promedio:= promMax;
		end;
	end;
	
	
	procedure OrdenSeleccion(var vm: vecMax);  //PUNTO C
	var
		i, j, pos: integer;
		dato: reg;
	begin
		for i:= 1 to df-1 do begin
			pos:= i;
			for j:= i+1 to df do begin
				if (vm[j].promedio < vm[pos].promedio) then
					pos:= j;
			end;
			dato:= vm[pos];
			vm[pos]:= vm[i];
			vm[i]:= dato;
		end;
	end;
	
	
var
	vg: vectorGeneros;
	vm: vecMax;
begin
	randomize;
	CargarVecGeneros(vg);  //PUNTO A
	InicializarVec(vm);
	CargarMaximos(vm, vg);  //PUNTO B
	OrdenSeleccion(vm);  //PUNTO C
	writeln('El codigo con mayor puntaje es: ', vm[8].cod, ' y el codigo con menor puntaje es: ', vm[1].cod);
end.	
