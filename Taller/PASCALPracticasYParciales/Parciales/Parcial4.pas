program parcial4;
type

   rangodia = 1..31;
  
   compra = record
     cod:integer;
     dia: rangodia;
     cantprod:integer;
     monto:real;
   end;
   
//---------------------//

   cliente = record
     dia: rangodia;
     cantprod:integer;
     monto:real;
   end;

   lista = ^nodo2;
   nodo2 = record
     dato: cliente;
     sig: lista;
   end;   
   
   
   regcompra = record
     cod:integer;
     l:lista;
   end;
   
   arbol = ^nodo;
   nodo = record
     dato: regcompra;
     HI: arbol;
     HD: arbol;
   end;
     
   
  procedure LeerCompra (var c:compra);
  begin
    readln(c.cantprod);
    //c.cantprod:= random(30);
    if (c.cantprod <> 0) then begin
      c.cod:= random(99) + 1;
      c.monto:= random(8000) + 150.80;
      c.dia:= random(31) + 1;
    end; 
  end;
     
     
   procedure AsignarRegistro (c:compra; var cli:cliente);
   begin
      cli.dia:= c.dia;
      cli.cantprod:= c.cantprod;
      cli.monto:= c.monto;
   end;
  
  
  procedure AgregarAdelante(var l:lista; cli:cliente);
  var
    aux:lista;
  begin
    new(aux);
    aux^.dato:= cli;
    aux^.sig:= l;
    l:= aux;
  end;
     
     
  procedure InsertarElemento (var a:arbol; c:compra; var cli:cliente);
  begin
    if (a = nil) then begin
      new(a);
      AsignarRegistro(c, cli);   // para cargar despues de la lista
      a^.dato.cod:= c.cod;
      a^.dato.l:= nil;
      AgregarAdelante(a^.dato.l , cli);
      a^.HI:= nil;
      a^.HD:= nil;
    end
    else begin
      if (c.cod < a^.dato.cod) then
        InsertarElemento(a^.HI, c, cli)
      else
        if (c.cod > a^.dato.cod) then
          InsertarElemento(a^.HD, c, cli)
        else
          AgregarAdelante(a^.dato.l, cli);
    end;
  end; 
     
  
  procedure CargarArbol (var a:arbol);
  var
    c:compra;
    cli:cliente;
  begin
    a:= nil;
    LeerCompra(c);
    while (c.cantprod <> 0) do begin
      InsertarElemento(a, c, cli);
      LeerCompra(c);
    end;
  end;
   
   
   procedure ImprimirLista (l:lista);
   begin
     while (l <> nil) do begin
       writeln('El dia es: ', l^.dato.dia);
       writeln('La cantidad es: ', l^.dato.cantprod);
       writeln('El monto es: ', l^.dato.monto:0:2);
       l:= l^.sig;
     end;
   end;
   
  
  procedure ImprimirArbol(a:arbol);
  begin
    if (a <> nil) then begin
      ImprimirArbol(a^.HI);
      writeln('El codigo del cliente es: ', a^.dato.cod);
      ImprimirLista(a^.dato.l);
      ImprimirArbol(a^.HD);
    end;
  end;
  
 { 
  function RecorrerListaCompras(l:lista): integer;
  var
    cant: integer;
  begin
    cant:= 0;
    while (l <> nil) do begin
      cant:= cant + 1;
      l:= l^.sig;
    end;
    RecorrerListaCompras:= cant;
  end;
}  
  
  procedure ComprasCliente (a:arbol; codigo:integer; var l2:lista);
  begin
    if (a = nil) then
      l2:= nil
    else begin
      if (codigo = a^.dato.cod) then
        l2:= a^.dato.l
      else
        if (codigo < a^.dato.cod) then
          ComprasCliente(a^.HI, codigo, l2)
        else
          ComprasCliente(a^.HD, codigo, l2);
    end;
  end;
  
  
  procedure ObtenerMaximo (l2:lista; var max:integer; var montomax:real);
  begin
    if (l2 <> nil) then begin
      if (l2^.dato.cantprod > max) then begin
        max:= l2^.dato.cantprod;
        montomax:= l2^.dato.monto;
      end;
      ObtenerMaximo(l2^.sig, max, montomax);
    end;
  end;
  
  
var
   a:arbol;
   l2:lista;
   codigo, max:integer;
   montomax:real;
begin
   CargarArbol(a);  // punto A
   ImprimirArbol(a);
   writeln('Ingrese un codigo');
   readln(codigo);
   ComprasCliente(a, codigo, l2);   // punto B
 //writeln('La cantidad de compras del cliente: ',ImprimirLista2(l2));  es solo para corroborar, ya borre la funcion
   max:= -1;
   ObtenerMaximo(l2, max, montomax);   // punto C
   writeln('El monto max es: ', montomax:0:2, ' con ', max, ' cantidad de productos');
end.
