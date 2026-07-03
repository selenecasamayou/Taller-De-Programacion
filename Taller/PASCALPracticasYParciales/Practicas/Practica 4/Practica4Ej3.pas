{a. Almacenar los productos vendidos en una estructura eficiente para la búsqueda por
código de producto. De cada producto deben quedar almacenados su código, la
cantidad total de unidades vendidas y el monto total. De cada venta se lee código de
venta, código del producto vendido, cantidad de unidades vendidas y precio unitario. El
ingreso de las ventas finaliza cuando se lee el código de venta -1.
b. Imprimir el contenido del árbol ordenado por código de producto.
c. Retornar el código de producto con mayor cantidad de unidades vendidas.
d. Retornar la cantidad de códigos que existen en el árbol que son menores que un valor
que se recibe como parámetro.
e. Retornar el monto total entre todos los códigos de productos comprendidos entre dos
valores recibidos (sin incluir) como parámetros.
}
program tuVieja;   // armo un arbol de productos y lo cargo leyendo las ventas
type
  producto = record
    cod:integer;
    cantvendidastotal:integer;
    montotal:real;
  end;
  
  venta = record
    codigoventa: integer;
    codigoproducto: integer;
    cantvendidas: integer;
    precioxuni: real;
  end;
  
  arbol = ^nodo;
  nodo = record
    dato: producto;
    HI: arbol;
    HD: arbol;
  end;   
  
  
  procedure LeerVenta (var v:venta);
  begin
    readln(v.codigoventa);
    if (v.codigoventa <> -1) then begin
       v.codigoproducto:= random(100) + 1;
      // writeln(v.codigoproducto);
       v.cantvendidas:= random(15) + 1;
       v.precioxuni:= random(1000) + 1;
    end;
  end;
  
  
  procedure InsertarElemento (var a:arbol; var p:producto;  v:venta);
  begin
    if (a = nil) then begin  // caso base
      new(a);
      p.cod:= v.codigoproducto;
      p.cantvendidastotal:= v.cantvendidas;    // es la misma porque es el primero
      p.montotal:= v.precioxuni * v.cantvendidas;    //  en la primera carga se ponen los mismos datos que en el registro, son como la base
      a^.dato:= p;
      a^.HI:= nil;
      a^.HD:= nil;
    end
    else
      if (a^.dato.cod = v.codigoproducto) then begin
        a^.dato.cantvendidastotal:= a^.dato.cantvendidastotal + v.cantvendidas;  // le voy sumando las ventas con ese codigo al producto
        a^.dato.montotal:=  a^.dato.montotal + (v.precioxuni * v.cantvendidas);
      end
      else begin
        if (v.codigoproducto < a^.dato.cod) then 
          InsertarElemento(a^.HI, p, v)
        else
          InsertarElemento(a^.HD, p, v);
      end;
  end;
  
  
  procedure CargarArbol (var a:arbol);
  var
    p:producto;
    v:venta;
  begin
    a:= nil;
    LeerVenta(v);
    while (v.codigoventa <> -1) do begin
      InsertarElemento(a,p,v);
      LeerVenta(v);
    end;
  end;
  
  
  procedure ImprimirArbol (a:arbol);
  begin
    if (a <> nil) then begin
      ImprimirArbol(a^.HI);
      writeln('El codigo del producto es: ', a^.dato.cod);  
      writeln('La cantidad total de unidades vendidas es: ', a^.dato.cantvendidastotal);  
      writeln('El monto total es: ', a^.dato.montotal:2:2);  
      ImprimirArbol(a^.HD);
    end;
  end;

  procedure CantVendidaMax (a:arbol; var max, codmax:integer);
  begin
    if (a = nil) then
       max:= -1
    else begin
       CantVendidaMax(a^.HI, max, codmax);
       if (a^.dato.cantvendidastotal > max) then begin
          max:= a^.dato.cantvendidastotal;
          codmax:= a^.dato.cod;
      end;
       CantVendidaMax(a^.HD, max, codmax);
    end;
  end;


  procedure ObtenerMaximo (a:arbol);
  var
    max, codmax: integer;
  begin
    max:= -1;
    CantVendidaMax(a,max, codmax);
    writeln('El codigo con mas cantidad de unidades vendidas es: ', codmax);
  end;


  function BuscarCodigos (a:arbol; cod:integer): integer;
  begin
    if (a = nil) then 
      BuscarCodigos:= 0
    else begin
      if (a^.dato.cod < cod) then  // si cumple
        BuscarCodigos:= BuscarCodigos(a^.HI, cod) + BuscarCodigos(a^.HD, cod) + 1
      else
        BuscarCodigos:= BuscarCodigos(a^.HI, cod);  // para que no vaya por la rama derecha
    end;
  end;


  function ObtenerMontoTotal (a:arbol; cotainf, cotasup: integer): real;
  begin
    if (a = nil) then
      ObtenerMontoTotal:= 0   // caso base
    else begin
      if (a^.dato.cod > cotainf) then begin
        if (a^.dato.cod < cotasup) then
          ObtenerMontoTotal:= ObtenerMontoTotal(a^.HI, cotainf, cotasup) + ObtenerMontoTotal(a^.HD, cotainf, cotasup) + a^.dato.montotal
        else
          ObtenerMontoTotal:= ObtenerMontoTotal(a^.HI, cotainf, cotasup);
      end
      else
        ObtenerMontoTotal:= ObtenerMontoTotal(a^.HD, cotainf, cotasup);
    end;
  end;


  procedure ObtenerMontoTotalEntreDosCodigos(a:arbol);
  var
    cotainf, cotasup: integer;
    montotal: real;
  begin
    writeln('ingrese el rango');
    readln(cotainf);
    readln(cotasup);
    montotal:= ObtenerMontoTotal(a, cotainf, cotasup);
    writeln('El monto entre el codigo ', cotainf, ' y el codigo ', cotasup, ' es: ', montotal:2:2);
  end;


var
  a:arbol;
  cod:integer;
begin
  randomize;
  CargarArbol(a);  // punto A
  ImprimirArbol(a);  // punto B
  ObtenerMaximo(a);  // punto C 
  readln(cod);  
  writeln('La cantidad de codigos es: ', BuscarCodigos(a,cod));  // punto D 
  ObtenerMontoTotalEntreDosCodigos(a);   // punto E
end.
