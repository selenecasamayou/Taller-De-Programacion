{a. Almacenar los productos vendidos en una estructura eficiente para la búsqueda por código de producto. De cada producto deben quedar almacenados su código, la cantidad total de unidades vendidas y el monto total. De cada venta se cargan código de venta, código del producto vendido, cantidad de unidades vendidas y precio unitario. El ingreso de las ventas finaliza cuando se lee el código de venta 0.
b. Imprimir el contenido del árbol ordenado por código de producto.
c. Retornar el menor código de producto.
d. Retornar la cantidad de códigos que existen en el árbol que son menores que un valor que se recibe como parámetro.
e. Retornar el monto total entre todos los códigos de productos comprendidos entre dos valores recibidos (sin incluir) como parámetros.

}

Program ImperativoClase4;

type 
      venta = record
               codigoVenta: integer;
               codigoProducto: integer;
               cantUnidades: integer;
               precioUnitario: real;
             end;
     productoVendido = record
                         codigo: integer;
                         cantTotalUnidades: integer;
                         montoTotal: real;
                       end;
     arbol = ^nodoArbol;
     nodoArbol = record
                    dato: productoVendido;
                    HI: arbol;
                    HD: arbol;
                 end;
     
procedure ModuloA (var a: arbol);   // punto A
{ Almacene los productos vendidos en una estructura eficiente para la búsqueda por código de producto. De cada producto deben quedar almacenados la cantidad total 
de unidades vendidas y el monto total. }

   Procedure CargarVenta (var v: venta);
   begin
     v.codigoVenta:= random (51) * 100;
     If (v.codigoVenta <> 0) then begin
         v.codigoProducto:= random (100) + 1;
         v.cantUnidades:= random(15) + 1;
         v.precioUnitario:= (100 + random (100))/2;
     end;
  end;  
  
  Procedure InsertarElemento (var a: arbol; elem: venta);
  var p: productoVendido;
     
     Procedure ArmarProducto (var p: productoVendido; v: venta);
     begin
       p.codigo:= v.codigoProducto;
       p.cantTotalUnidades:= v.cantUnidades;
       p.montoTotal:= v.cantUnidades * v.precioUnitario;
     end;
  
  Begin
    if (a = nil) 
    then begin
           new(a);
           ArmarProducto (p, elem);
           a^.dato:= p; 
           a^.HI:= nil; 
           a^.HD:= nil;
         end
    else if (elem.codigoProducto = a^.dato.codigo) then begin
             a^.dato.cantTotalUnidades:= a^.dato.cantTotalUnidades + elem.cantUnidades;
             a^.dato.montoTotal:= a^.dato.montoTotal + (elem.cantUnidades * elem.precioUnitario);
         end
         else
            if (elem.codigoProducto < a^.dato.codigo) then 
                 InsertarElemento(a^.HI, elem)
            else 
                 InsertarElemento(a^.HD, elem); 
  End;

var 
  unaVenta: venta;  
Begin
  writeln;
  writeln ('----- Ingreso de ventas y armado de arbol de productos ----->');
  writeln;
  a:= nil;
  CargarVenta (unaVenta);
  while (unaVenta.codigoVenta <> 0) do begin
     InsertarElemento (a, unaVenta);
     CargarVenta (unaVenta);
  end;
  writeln;
  writeln ('-----------------------------------------------');
  writeln;
end;

procedure ModuloB (a: arbol);   // punto B
{ Imprima el contenido del árbol ordenado por código de producto.}
  procedure ImprimirArbol (a: arbol);
  begin
    if (a <> nil)then begin
        if (a^.HI <> nil) then 
           ImprimirArbol (a^.HI);
        writeln ('Codigo producto: ', a^.dato.codigo, ' cantidad unidades: ', a^.dato.cantTotalUnidades, ' monto total: ', a^.dato.montoTotal:2:2);
        if (a^.HD <> nil) then 
           ImprimirArbol (a^.HD);
    end;
  end;

begin
  writeln;
  writeln ('----- Modulo B ----->');
  writeln;
  if ( a = nil) then 
     writeln ('Arbol vacio')
  else 
     ImprimirArbol (a);
  writeln;
  writeln ('-----------------------------------------------');
  writeln;
end;

procedure ModuloC (a: arbol);   // punto C
{Retornar el menor código de producto.}

  function ObtenerMinimo (a: arbol): integer;
  begin
    if (a = nil) then 
       ObtenerMinimo:= 9999
    else 
       if (a^.HI = nil) then 
           ObtenerMinimo:= a^.dato.codigo
       else 
           ObtenerMinimo:= ObtenerMinimo (a^.HI)
  end;
   
var 
  menorCodigo: integer;
begin
  writeln;
  writeln ('----- Modulo C ----->');
  writeln;
  write ('Menor codigo de producto: ');
  writeln;
  menorCodigo:= ObtenerMinimo (a);
  if (menorCodigo = 9999) then 
     writeln ('Arbol vacio')
  else begin
       writeln;
       writeln ('El codigo menor es ', menorCodigo); 
       writeln;
  end;
  writeln;
  writeln ('-----------------------------------------------');
  writeln;
end;

procedure ModuloD (a: arbol);   // punto D  
{ Retornar la cantidad de códigos que existen en el árbol que son menores que un valor que se recibe como parámetro }
  
  function CantidadDeCodigosMenores (a: arbol; cod: integer): integer;  
  begin
    if (a = nil) then      // caso base
      CantidadDeCodigosMenores:= 0
    else begin
      if (a^.dato.codigo < cod) then      //  si es menor, lo sumo y me fijo si sus hijos tambien cumplen
        CantidadDeCodigosMenores:= CantidadDeCodigosMenores(a^.HI, cod) + CantidadDeCodigosMenores(a^.HD, cod) + 1  
      else
        CantidadDeCodigosMenores:= CantidadDeCodigosMenores(a^.HI, cod);   //  si no es menor, me fijo si su HI cumple
    end;
  end;
   
var 
  cantidad, unCodigo: integer;
begin
  writeln;
  writeln ('----- Modulo D ----->');
  writeln;
  write ('Ingresar un codigo: ');
  readln (unCodigo);
  cantidad:= CantidadDeCodigosMenores (a, unCodigo);
  writeln;
  writeln ('La cantidad de codigos menores al codigo ', unCodigo, ' es: ', cantidad);
  writeln;
  writeln;
  writeln ('-----------------------------------------------');
  writeln;
end;

procedure ModuloE (a: arbol);   // punto E  
{ Contenga un módulo que reciba la estructura generada en el punto a y dos códigos de producto y retorne el monto total entre todos los códigos de productos 
comprendidos entre los dos valores recibidos (sin incluir). }
  
  function ObtenerMontoTotalEntreDosCodigos (a: arbol; codigo1, codigo2: integer): real; // = ObetenerMontoTotalEntreCotainfCotasup
  begin
    if (a = nil) then                       // supongamos codigo1= 30 y codigo2= 80
      ObtenerMontoTotalEntreDosCodigos:= 0      // caso base
    else begin
      if (codigo1 < a^.dato.codigo) then  begin    // si es mas grande que codigo1 (30)
         if (codigo2 > a^.dato.codigo) then                           //  si es mas chico que codigo2 (80)
            ObtenerMontoTotalEntreDosCodigos:= ObtenerMontoTotalEntreDosCodigos (a^.HI, codigo1, codigo2)       
                                              +  ObtenerMontoTotalEntreDosCodigos (a^.HD, codigo1, codigo2) 
                                               + a^.dato.montoTotal
         else
            ObtenerMontoTotalEntreDosCodigos:= ObtenerMontoTotalEntreDosCodigos (a^.HI, codigo1, codigo2);  // si no esta en el rango osea
      end                                                                                                   // (se pasa de 80), pero su  HI si puede estar               
      else 
         ObtenerMontoTotalEntreDosCodigos:= ObtenerMontoTotalEntreDosCodigos (a^.HD, codigo1, codigo2);   // si no esta en el rango osea
    end;                                                                                                  // (no llega a 30), pero su  HD si puede llegar
  end;
  
{  
  function ObtenerMontoTotalCotaInf (a: arbol; codigo1: integer): real; // CUANDO TENGO EL "30"
  begin
    if (a = nil) then
      ObtenerMontoTotalCotaInf:= 0
    else begin
      if (codigo1 < a^.dato.codigo) then  
            ObtenerMontoTotalEntreDosCodigos:= ObtenerMontoTotalEntreDosCodigos (a^.HI, codigo1)  
                                              +  ObtenerMontoTotalEntreDosCodigos (a^.HD, codigo1) 
                                               + a^.dato.montoTotal
      else
         ObtenerMontoTotalEntreDosCodigos:= ObtenerMontoTotalEntreDosCodigos (a^.HD, codigo1);
    end;
  end;
  
  
  function ObtenerMontoTotalCotaSup (a: arbol; codigo2: integer): real;   // CUANDO TENGO EL "80"
  begin
    if (a = nil) then
      ObtenerMontoTotalCotaSup:= 0
    else begin
        if (codigo2 > a^.dato.codigo) then 
            ObtenerMontoTotalEntreDosCodigos:= ObtenerMontoTotalEntreDosCodigos (a^.HI, codigo2)  
                                              +  ObtenerMontoTotalEntreDosCodigos (a^.HD, codigo2) 
                                               + a^.dato.montoTotal
         else
            ObtenerMontoTotalEntreDosCodigos:= ObtenerMontoTotalEntreDosCodigos (a^.HI, codigo2);
     end;
  end;
 } 
   
var 
  codigo1, codigo2: integer;
  montoTotal: real;
begin
  writeln;
  writeln ('----- Modulo E ----->');
  writeln;
  write ('Ingrese primer codigo de producto: ');
  readln (codigo1);
  write ('Ingrese segundo codigo de producto (mayor al primer codigo): ');
  readln (codigo2);
  writeln;
  montoTotal:= ObtenerMontoTotalEntreDosCodigos (a, codigo1, codigo2);
  if (montoTotal = 0) then 
     writeln ('No hay codigos entre ', codigo1, ' y ', codigo2)
  else begin
       writeln;
       writeln ('El monto total entre el codigo: ', codigo1, ' y el codigo : ', codigo2, ' es: ', montoTotal:2:2); 
       writeln;
  end;
  writeln;
  writeln ('-----------------------------------------------');
  writeln;
end;

var 
  a: arbol; 
Begin
  randomize;
  ModuloA (a);
  ModuloB (a);
  ModuloC (a);
  ModuloD (a);
  ModuloE (a);   
End.
