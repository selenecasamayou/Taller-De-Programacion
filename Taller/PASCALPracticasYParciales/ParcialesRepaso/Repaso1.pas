Program Repaso   // TODO RECURSIVO
const
  df = 300;
type
  
  oficina = record
    cod: integer;
    dni: integer;
    valorExp: real;
  end;
    
  vector = array [1..df] of oficina
  
  procedure LeerOficina (var o: oficina);
  begin
    o.cod:= random(100)
    id (o.cod <> 0)
      ao.dni:= random(1000)
      o.valorExp:= random(5000)
  end;
  
  procedure CargarVectorRecursivo (var v:vector; o:oficina; var dl:integer);
  begin
    LeerOficina(o)
    if ((o.cod <> 0) and (dl < df))
      dl:= dl + 1
      v[dl]:= o;
      CargarVectorRecursivo(v, o, dl)
    end;
  end;
  
  procedure CargarVector (var v:vector; o:oficina; var dl:integer);  // PUNTO A
  begin
    dl:= 0
    CargarVectorRecursivo(v, o, dl)
  end;
  
  procedure OrdenSeleccion (var v:vector; dl:integer);  // PUNTO B
  var
    i, j, pos; integer
    dato: oficina
  begin
    for i:= 1 to dl-1 do begin
      pos:= i;
      for j:= i+1 to dl do begin
        if (v[j].cod < v[pos].cod) 
          pos:= j;
      end;
      dato:= v[pos];
      v[pos]:= v[i];
      v[i]:= dato;
    end;
  end;
  
  procedure BusquedaDicotomicaRecursiva (v: vector; ini, fin, cod:integer; var pos: integer);  // PUNTO C
   var
	medio:integer;
   begin
     medio:= ((fin + ini) div 2);
     if (fin < ini) then
       pos:= 0  // Pide devolver 0 en caso de no encontrarlo
     else
       if (v[medio] = dato) then
		pos:=medio
       else
         if (v[medio] > dato) then
           BusquedaDicotomicaRecursiva(v,ini, medio-1, dato, pos)
         else
           BusquedaDicotomicaRecursiva(v,medio+1, fin, dato, pos);
   end;
   
   function MontoTotal(v:vector; dl:integer; var montoTotal: real): real  // PUNTO D
   begin
     if (dl = 0) then
       MontoTotal:= 0
     else
       MontoTotal:= MontoTotal(v, dl-1) + v[dl].valorExp;
   end;
   
var
  v: vector
  o: oficina
  dl, ini, fin: integer
  montoTotal: real
begin
  randomize;
  CargarVector(v, o, dl)  // PUNTO A
  OrdenSeleccion(v, dl)  // PUNTO B	
  cod:= random(100);
  fin:= dl
  BusquedaDicotomicaRecursiva(v, 1, fin, cod, pos)  // PUNTO C
  writeln('El monto totsl acumulado de las expensas es:', MontoTotal(v, dl): 2: 2)  // PUNTO D
end.
