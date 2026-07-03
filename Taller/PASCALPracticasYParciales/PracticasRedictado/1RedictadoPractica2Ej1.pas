program redictado;
const
	df = 5;
type
	
	vector = array [1..df] of integer;
	
	
	procedure CargarVectorRecursivo(var v: vector; var dl: integer);
	var
		numero: integer;
	begin
		numero:= 10 + random(155 - 10) + 1;  // Porque es desde 10 a 15
		if ((dl < df) and (numero <> 20)) then begin
			dl:= dl + 1;
			v[dl]:= numero;
			CargarVectorRecursivo(v, dl);
		end;	
	end;
	
	
	procedure CargarVector(var v:vector; var dl: integer);  // PUNTO A
	begin
		dl:= 0;
		CargarVectorRecursivo(v, dl);
	end;
	
	
	procedure ImprimirVector(v: vector; dl: integer);  // PUNTO B
	var
		i: integer;
	begin
		for i:= 1 to dl do
			writeln(v[i]);
	end;
	
	
	procedure ImprimirVectorRecursivo(v: vector; dl: integer);  // PUNTO C
	begin
		if (dl > 0) then begin
			ImprimirVectorRecursivo(v, dl-1);
			writeln(v[dl])
		end;
	end;
	
	
	function SumarValoresParRecursivo(v: vector; dl: integer): integer;
	begin
		if (dl <= 0) then 
			SumarValoresParRecursivo:= 0
		else
			if ((v[pos] mod 2) = 0) then  // si es par
				SumarValoresParRecursivo:= SumarValoresParRecursivo (v, dl, pos + 1) + v[pos]  // se suma y pasa al siguiente
			else
				SumarValoresParRecursivo:= SumarValoresParRecursivo(v, dl, pos+1)
	end;
	
	
	function ObtenerMaximoRecursivo(v: vector; dl: integer): integer;  // PUNTO E
	var
		max: integer;
	begin
		max:= -1;
		if (dl = 0) then  // CASO BASE
			ObtenerMaximoRecursivo:= -1
		else begin
			max:= ObtenerMaximoRecursivo(v, dl-1);  // voy al inicio del vector
			if (v[dl] > max) then
				max:= v[dl];
			ObtenerMaximoRecursivo:= max;	// y aca no devuelve max hasta que ve el ultimo elemento del vector, no?
		end;
	end;
		
		
	function BuscarValorRecursivo(v: vector; dl, valor: integer): boolean;  // PUNTO F
	var
		ok: boolean;
	begin
		ok:= false;
		if ((dl > 0) and (v[dl] <> valor)) then
			ok:= BuscarValorRecursivo(v, dl-1, valor)  // se podria poner BuscarValorRecursivo:= ??
		else
			if (v[dl] = valor) then
				ok:= true;
		BuscarValorRecursivo:= ok;
	end;	
	
	
	procedure DescomponerDigitosRecursivo(numero: integer);
	begin
		if (numero <> 0) then begin
			DescomponerDigitosRecursivo(numero div 10);   // primero va hasta el primer digito y empieza a imprimir
			writeln(numero mod 10);   // si quisiera imprimir desde el ultimo al primer digito, el writeln va primero
		end;
	end;
	
	
	procedure ImprimirDigitosRecursivo(v: vector; dl: integer);  // PUNTO G
	begin
		if (dl > 0) then  begin
			DescomponerDigitosRecursivo(v[dl]);  // hace un numero
			ImprimirDigitosRecursivo(v, dl-1);  // y con esto avanza
		end;
	end;
	
	
var
	v: vector;
	dl, suma, max, valor: integer;
	encontre: boolean;
begin
	randomize;
	CargarVector(v, dl);   // PUNTO A
	ImprimirVector(v, dl);   // PUNTO B
	writeln('------------------------------------------');
	ImprimirVectorRecursivo(v, dl);   // PUNTO C
	suma:= SumarValoresParRecursivo(v, dl);   // PUNTO D
	writeln('------------------------------------------');
	writeln(suma);
	max:= ObtenerMaximoRecursivo(v, dl);   // PUNTO E
	valor:= 10 + random(155 - 10) + 1; 
	encontre:= BuscarValorRecursivo(v, dl, valor);   // PUNTO F
	ImprimirDigitosRecursivo(v, dl);   // PUNTO G
end.
