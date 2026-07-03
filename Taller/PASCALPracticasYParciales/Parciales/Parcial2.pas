program parcial2;
type

   rangomes = 1..12;
   
   compra = record
     cod: integer;
     numfactura: integer;
     mes: rangomes;
     monto: real;
   end;
   
   vecmonto = array [rangomes] of real;
   
   cliente = record
     cod: integer;
     vector: vecmonto;
   end;
   
   arbol = ^nodo;
   nodo = record
     dato: cliente;
     HI: arbol;
     HD: arbol;
   end;
   

  procedure LeerCompra (var c:compra);
  begin
    writeln('ingrese un codigo');
    readln(c.cod);
    if (c.cod <> 0) then  begin
      c.numfactura:= random(1000) + 1;
      c.mes:= random(12) + 1;
      c.monto:= (1000);
    end;
  end;
  
  
  procedure InicializarVector (var v:vecmonto);
  var
    i:integer;
  begin
    for i:= 1 to 12 do 
      v[i]:= 0;
  end;
  
  
  procedure CargarVector (var v:vecmonto; mes:rangomes; monto:real);
  begin
    v[mes]:= v[mes] + monto;   // para que quede el monto total por mes
  end;
  
  
  procedure InsertarElemento (var a:arbol; c:compra);   // arbol con vectores
  begin
    if (a = nil) then begin
      new(a);
      a^.dato.cod:= c.cod;
      InicializarVector(a^.dato.vector);
	  CargarVector(a^.dato.vector, c.mes, c.monto);
      a^.HI:= nil;
      a^.HD:= nil;
    end
    else begin 
      if (c.cod < a^.dato.cod) then 
         InsertarElemento(a^.HI, c)
      else
        if (c.cod > a^.dato.cod) then
           InsertarElemento(a^.HD, c)
        else
          CargarVector(a^.dato.vector, c.mes, c.monto);
    end;
  end;
  

  procedure CargarArbol (var a:arbol);
  var
    c:compra;
  begin
    a:= nil;
    LeerCompra(c);
    while (c.cod <> 0) do begin
      InsertarElemento(a, c);
      LeerCompra(c);
    end;
  end;


  procedure ImprimirVector (v:vecmonto);
  var
    i: integer;
  begin
    for i:= 1 to 12 do begin
      writeln('Monto total: ', v[i]:0:2);
    end;
  end;
  
  
  procedure ImprimirArbol (a:arbol);
  begin
    if (a <> nil) then begin
      ImprimirArbol(a^.HI);
      writeln('El cod de cliente es: ', a^.dato.cod);
      ImprimirVector(a^.dato.vector);
      ImprimirArbol(a^.HD);     
    end;
  end;

  
  function RecorrerVector (v:vecmonto): integer;
  var
    i, mes:integer;
    max: real;
  begin
    max:= -1;
    for i:= 1 to 12 do begin
      if (v[i] > max) then begin
        max:= v[i];
        mes:= i;  
      end;
    end;
    RecorrerVector:= mes;
  end;
  
    
  function ObtenerMesMaximo (a:arbol; codigo:integer): integer;
  begin
    if (a = nil) then // caso base
      ObtenerMesMaximo:= 0
    else begin
      if (codigo = a^.dato.cod) then 
        ObtenerMesMaximo:= RecorrerVector(a^.dato.vector)
      else 
        if (codigo > a^.dato.cod) then
          ObtenerMesMaximo:= ObtenerMesMaximo(a^.HD, codigo) 
        else
          ObtenerMesMaximo:= ObtenerMesMaximo(a^.HI, codigo);
    end;   
  end;
  

  procedure CantClientesSinGastos (a:arbol; mes:integer; var cantcumple: integer);
  begin
    if (a <> nil) then begin
      if (a^.dato.vector[mes] = 0) then begin // cumple, no hay gastos
        cantcumple:= cantcumple + 1;
      CantClientesSinGastos(a^.HI, mes, cantcumple);
      CantClientesSinGastos(a^.HD, mes, cantcumple);
      end;
    end;
  end;


var
   a:arbol;
   codigo, mes, cantcumple: integer;
begin
   randomize;
   CargarArbol(a);    // punto A
   ImprimirArbol(a);    // solo para corroborar que este bien
   writeln('Ingrese un codigo de ciente');
   readln(codigo);
   writeln('El mes con mas gasto es: ', ObtenerMesMaximo(a, codigo));  // punto B
   writeln('Ingrese un numero de mes');
   readln(mes);
   CantClientesSinGastos(a, mes, cantcumple);  // punto C
   writeln('La cantidad de clientes que no gastaron nada en el mes ', mes, ' fue: ', cantcumple);
end.
