program RepasoParcial3;
const
	df = 12;
type
	
	rangoDia = 1..30;
	rangoMes = 1..12;
	
	compra = record
		codCli: integer;
		dia: rangoDia;
		mes: rangoMes;
		monto: real;
	end;
	
//----------------------------------//		
	
	vecMonto = array [rangoMes] of real;
	
	regArbol = record
		codCli: integer;
		vm: vecMonto;
	end;
	
	arbol = ^nodo;
	nodo = record
		dato: regArbol;
		HI: arbol;
		HD: arbol;
	end;

//----------------------------------//		
	
	procedure ImprimirVector(vm: vecMonto);
	var
		i: integer;
	begin
		for i:= 1 to df do
			writeln('monto ', vm[i], ' del mes: ', i);
	end;	
	
	procedure ImprimirArbol(a: arbol);
	begin
		if (a <> nil) then begin
			ImprimirArbol(a^.HI);
			writeln('cod cliente: ', a^.dato.codCli);
			ImprimirVector(a^.dato.vm);
			ImprimirArbol(a^.HD);
		end;
	end;
	
	procedure LeerCompra(var c: compra);
	begin
		c.codCli:= random(1000);
		if (c.codCli <> 0) then begin
			c.dia:= random(30) + 1;
			c.mes:= random(12) + 1;
			c.monto:= random(20000) / (random(10) + 1);
		end;	
	end;
	
	procedure InicializarVector(var vm: vecMonto);
	var
		i: integer;
	begin
		for i:= 1 to 12 do
			vm[i]:= 0;
	end;
	
	procedure InsertarElemento(var a: arbol; c: compra);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato.codCli:= c.codCli;
			InicializarVector(a^.dato.vm);
			a^.dato.vm[c.mes]:= c.monto;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else begin
			if (c.codCli < a^.dato.codCli) then
				InsertarElemento(a^.HI, c)
			else
				if (c.codCli > a^.dato.codCli) then
					InsertarElemento(a^.HD, c)
				else
					a^.dato.vm[c.mes]:= a^.dato.vm[c.mes] + c.monto;
		end;
	end;
	
	procedure CargarArbol(var a: arbol);  // PUNTO A
	var
		c: compra;
	begin
		a:= nil;
		LeerCompra(c);
		while (c.codCli <> 0) do begin
			InsertarElemento(a, c);
			LeerCompra(c);
		end;
	end;
	
	function BuscarMax(vm: vecMonto; var montoMax: real; var mesMax: integer): integer;
	var
		i: integer;
	begin
		for i:= 1 to 12 do begin
			if (vm[i] > montoMax) then begin
				montoMax:= vm[i];
				mesMax:= i;
			end;
		end;
		BuscarMax:= mesMax;
	end;
	
	function ObtenerMesMax(a: arbol; codCliente: integer): integer;  // PUNTO B
	var
		mesMax: integer;
		montoMax: real;
	begin
		montoMax:= -1;
		if (a = nil) then
			ObtenerMesMax:= 0
		else begin 
			if (codCliente = a^.dato.codCli) then begin
				ObtenerMesMax:= BuscarMax(a^.dato.vm, montoMax, mesMax);
			end
			else begin
				if (codCliente < a^.dato.codCli) then
					ObtenerMesMax:= ObtenerMesMax(a^.HI, codCliente)
				else
					ObtenerMesMax:= ObtenerMesMax(a^.HD, codCliente);
			end;
		end;
	end;
	
	function BuscarClientes(a: arbol; mes: integer): integer;  // PUNTO C
	begin
		if (a <> nil) then begin
			if (a^.dato.vm[mes] = 0) then
				BuscarClientes:= BuscarClientes(a^.HI, mes) + BuscarClientes(a^.HD, mes) + 1
			else
				BuscarClientes:= BuscarClientes(a^.HI, mes) + BuscarClientes(a^.HD, mes);
		end;
	end;
	
	
var
	a: arbol;
	codCliente, mes: integer;
begin
	randomize;
	CargarArbol(a);  // PUNTO A
	ImprimirArbol(a);
	writeln('ingrsar cod cliente');
	readln(codCliente);
	writeln('El mes con mas monto del cliente ', codCliente, ' es: ', ObtenerMesMax(a, codCliente));  // PUNTO B
	writeln('ingrsar mes');
	readln(mes);
	writeln('La cant de clientes que no gastaron nada en el mes ', mes, ' fueron: ', BuscarClientes(a, mes));  // PUNTO C
end.	
