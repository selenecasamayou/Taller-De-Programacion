program parcial3;
type
  
  rango = 1..10;
  
  venta = record
    dni: integer;
    codigo: rango;
    numfactura: integer;
    monto: real;
  end;

//-----------------------// 
  
  compra = record
    numfac: integer;
    monto: real;
  end;
  
  lista = ^nodo2;
  nodo2 = record
    dato:compra;
    sig:lista;
  end;
  
  
  regventa = record
    dni: integer;
    l: lista;
  end;
  
  arbol = ^nodo;
  nodo = record
    dato: regventa;
    HI: arbol;
    HD: arbol;
  end;
  
//----------------------//

  vecodigo = array [rango] of integer;
  
  
  procedure InicializarVector (var vc:vecodigo);
  var
    i: integer;
  begin
    for i:= 1 to 10 do 
      vc[i]:= 0;
  end;
  
  
  procedure LeerVenta (var v:venta);
  begin
    writeln('Ingrese un dni');
    readln(v.dni);
    if (v.dni <> 0) then begin
      v.codigo:= random (10) + 1;
      v.numfactura:= random (100) + 1;
      v.monto:= random (1000);
    end;
  end;
  
  
  procedure AgregarAdelante (var l:lista; c:compra);
  var
    aux: lista;
  begin
    new(aux);
    aux^.dato:= c;
    aux^.sig:= l;
    l:= aux;
  end;
  
  
  procedure InsertarElemento (var a:arbol; var c:compra; v:venta);
  begin
    if (a = nil) then begin
      new(a);
      c.numfac:= v.numfactura;
      c.monto:= v.monto;
      a^.dato.dni:= v.dni;
      a^.dato.l:= nil;
      AgregarAdelante(a^.dato.l, c);
      a^.HI:= nil;
      a^.HD:= nil;
    end
    else begin
      if (v.dni < a^.dato.dni) then
        InsertarElemento(a^.HI, c, v)
      else begin
        if (v.dni > a^.dato.dni) then 
          InsertarElemento(a^.HD, c, v)
        else
          AgregarAdelante(a^.dato.l, c);
      end;
    end;
  end;
  
    
  procedure CargarArbol (var a:arbol; var vc:vecodigo);
  var
    v:venta;
    c:compra;
  begin
    a:= nil;
    LeerVenta(v);     
    while (v.dni <> 0) do begin
      InsertarElemento(a, c, v);   // cargo arbol y lista,   PUNTO I
      vc[v.codigo]:= vc[v.codigo] + 1;   // voy cargando el vector,   PUNTO II
      LeerVenta(v);
    end;
  end;
  
  
  function RecorrerListaCompras (l:lista; monto:real): integer;
  begin
    if (l = nil) then
      RecorrerListaCompras:= 0
    else begin
      if (l^.dato.monto > monto) then   // si lo supera
        RecorrerListaCompras:= RecorrerListaCompras(l^.sig, monto) + 1
      else
        RecorrerListaCompras:= RecorrerListaCompras(l^.sig, monto);
    end;
  end;
  
  
  function CantFacturas (a:arbol; monto:real; dni:integer): integer;  // recorro arbol para encontrar el dni
  begin
    if (a = nil) then
      CantFacturas:= 0
    else begin
      if (dni = a^.dato.dni) then
       CantFacturas:= RecorrerListaCompras(a^.dato.l , monto)   // recorro la lista
      else 
        if (dni < a^.dato.dni) then
          CantFacturas:= CantFacturas(a^.HI, monto, dni)
        else
          CantFacturas:= CantFacturas(a^.HD, monto, dni);
    end;     
  end;
   
  
  procedure ObtenerMaximo (vc: vecodigo; var codmax:integer; dimL:integer);
  var
    max:integer;
  begin
    max:= -1;
    if (dimL <> 0) then begin
      ObtenerMaximo(vc, codmax, dimL-1);
      if (vc[dimL] > vc[max]) then begin
        writeln(diml);
        writeln(vc[diml]);
        max:= vc[dimL];
        codmax:= dimL;
      end;
    end;
  end;
  
  
var
  a:arbol;
  vc:vecodigo;
  monto:real;
  dni, cantidadfacturas, codmax:integer;
begin
  randomize;
  InicializarVector(vc);
  CargarArbol(a, vc);   // punto A
  writeln('Ingrese un monto');
  readln(monto);
  writeln('Ingrese un dni');
  readln(dni);
  cantidadfacturas:= CantFacturas(a, monto, dni);   // punto B
  writeln('La cantidad de facturas que superan el monto es: ', cantidadfacturas);  // para comprobar
  ObtenerMaximo(vc, codmax, 10);   // punto C  , el 10 lo uso por la diml
  writeln('El codigo maximo es: ', codmax);   // para comprobar
end.
