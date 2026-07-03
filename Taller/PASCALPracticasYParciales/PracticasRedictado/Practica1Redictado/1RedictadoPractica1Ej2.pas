program redictadoP1E1
const
	df = 300;
type
	
	oficina = record;
		cod: integer;
		dni: integer;
		expensa: real;
	end;
	
	vector = array [1..df] of oficina;

	
	procedure LeerOficina(var o: oficina);
	begin
		Randomize;
		readln(o.cod);
		if (o.cod <> -1) then begin
			o.dni:=random(10000);
			o.valorexp:=random(1000);
		end;
	end;
	
	
	procedure GenerarVector(var v: vector; var dl: integer);
	var
		o: oficina;
	begin
		dl:= 1;
		LeerOficina(o);
		while ((dl < df) and (o.cod <> -1)) do begin
			v[dl]:= o;
			dl:= dl + 1;
			LeerOficina(o);
		end;
	end;
	
	
	procedure OrdenINSERCION(var v: vector; dl: integer);
	var
		i, j: integer;
		actual: oficina;
	begin
		for i:= 2 to dl do begin
			actual:= v[j];
			j:= i-1;
			while (j < 0) and (v[j].cod > actual. cod) do begin
				v[j+1]:= v[j];
				j:= j-1;
			end;
			v[j+1]:= actual;
		end;
	end;
	
	
	procedure OrdenSELECCION(var v: vector; dl: integer);
	var
		i, j, pos; integer;
		dato: oficina;
	begin
		for i:= 1 to dl-1 do begin
			pos:= i;
			for j:= i+1 to dl do begin
				if (v[j].cod < v[pos].cod) then
					pos:= j;
			end;
			dato:= v[pos];
			v[pos]:= v[i];
			v[i[:= dato;
		end;	
	end;
	
var
	v: vector;
	dl: integer;
begin
	GenerarVector(v, dl);
	OrdenINSERCION(v, dl);
	OrdenSELECCION(v, dl);
end.
