{a. Implemente un módulo que genere aleatoriamente información de ventas de un comercio.
Para cada venta generar código de producto, fecha y cantidad de unidades vendidas. Finalizar
con el código de producto 0. Un producto puede estar en más de una venta. Se pide:
i. Generar y retornar un árbol binario de búsqueda de ventas ordenado por código de
producto. Los códigos repetidos van a la derecha.
ii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la
cantidad total de unidades vendidas.
iii. Generar y retornar otro árbol binario de búsqueda de productos vendidos ordenado por
código de producto. Cada nodo del árbol debe contener el código de producto y la lista de
las ventas realizadas del productos

B. Implemente un módulo que reciba el árbol generado en i. y una fecha y retorne la cantidad
total de productos vendidos en la fecha recibida.
C. Implemente un módulo que reciba el árbol generado en ii. y retorne el código de producto
con mayor cantidad total de unidades vendidas.
D. Implemente un módulo que reciba el árbol generado en iii. y retorne el código de producto
con mayor cantidad de ventas.
}
program arboles;
type

   venta = record
     cod: integer;
     fecha: integer;
     cantuni: integer;  
   end;
   
   arbol1 = ^nodo1;
   nodo1 = record
     dato: venta;
     HI: arbol1;
     HD: arbol1;
   end;
   
// -------------------------//     
   
   venta2 = record
     cod:integer;
     cantvendidos:integer;   // cantvendidos = cantuni 
   end;
   
   arbol2 = ^nodo2;
   nodo2 = record
     dato: venta2;
     HI: arbol2;
     HD: arbol2;
   end;
   
// -------------------------//   
   
   ListaVenta = ^nodo;
   nodo = record
     dato: integer;        // se le suma la cantventas
     sig: ListaVenta;      // No entiendo nada
   end;

   venta3 = record
     cod:integer;
     LV: ListaVenta;  //ListaVendidos = Venta
   end;         
  
   arbol3 = ^nodo3;
   nodo3 = record
     dato: venta3;
     HI: arbol3;
     HD: arbol3;
   end;
   
   procedure LeerVenta (var v:venta);
   begin
     v.cod:= random(101);
     if (v.cod <> 0) then begin
       v.fecha:= random(30 - 1 + 1) + 1;
       v.cantuni:= random(100 - 0 + 1) + 0;
     end;
   end;
   
   
   procedure InsertarElemento1(var a1: arbol1; v:venta);   // punto A-1
   begin
     if (a1 = nil) then begin  // si esta vacio
       new(a1);
       a1^.dato:= v;
       a1^.HI:= nil;
       a1^.HD:= nil;
     end
     else begin     
       if (v.cod < a1^.dato.cod) then  // si es mas chica que la raiz o el nodo
         InsertarElemento1(a1^.HI, v)
       else 
         InsertarElemento1(a1^.HD, v);  // si es mas grande
     end;
   end;
   
   
   procedure InsertarElemento2 (var a2: arbol2; v:venta);   // punto A-2
   begin
     if (a2 = nil) then begin  // es el primero
       new (a2);
       a2^.dato.cod:= v.cod;
       a2^.dato.cantvendidos:= v.cantuni;  // relleno informacion
       a2^.HI:= nil;
       a2^.HD:= nil;
     end
     else begin
       if (v.cod = a2^.dato.cod) then     // si es el mismo
         a2^.dato.cantvendidos:= a2^.dato.cantvendidos + v.cantuni   // actualizo cantidad vendida
       else
         if (v.cod < a2^.dato.cod) then  // si es mas chica que la raiz o el nodo
         InsertarElemento2(a2^.HI, v)
       else 
         InsertarElemento2(a2^.HD, v);  // si es mas grande
     end;      
   end;
   
   
   procedure AgregarAdelante (var LV:ListaVenta; v:venta);
   var
     nue:ListaVenta;
   begin
     new(nue);
     nue^.dato:= v.cantuni;    // cantventas  // No entiendo nada
     nue^.sig:= LV;
     LV:= nue;
   end;
   
   
   procedure InsertarElemento3 (var a3:arbol3; v:venta);   // punto A-3
   begin
     if (a3 = nil) then begin   // es el primero
       new(a3);
       a3^.dato.cod:= v.cod;
       a3^.dato.LV:= nil;
       AgregarAdelante(a3^.dato.LV, v);  // para guardar el primero
       a3^.HI:= nil;
       a3^.HD:= nil;
     end
     else begin
       if (v.cod < a3^.dato.cod) then   // si es mas chica que la raiz o el nodo
         InsertarElemento3(a3^.HI, v) 
       else
         if (v.cod > a3^.dato.cod) then   // si es mas grande que la raiz o el nodo
           InsertarElemento3(a3^.HD, v)
         else
           AgregarAdelante(a3^.dato.LV, v);  // si es igual agrego a la lista 
       end;
   end;
   
   
 {  
  procedure InsertarElemento3 (var a3:arbol3; v:venta; a2:arbol2);
   begin
     if (a3 = nil) then begin   // es el primero
       new(a3);
       a3^.dato.cod:= v.cod;
       a3^.dato.LV:= nil;
       a3^.HI:= nil;
       a3^.HD:= nil;
     end
     else begin
       if (v.cod < a3^.dato.cod) then   // si es mas chica que la raiz o el nodo
         InsertarElemento3(a3^.HI, v, a2) 
       else
         if (v.cod > a3^.dato.cod) then   // si es mas grande que la raiz o el nodo
           InsertarElemento3(a3^.HD, v, a2)
         else
           AgregarAdelante(a3^.dato.LV, a2^.dato.cantvendidos);  // si es igual agrego a la lista 
       end;
   end; 
   
  } 
     
   procedure CargarArboles (var a1: arbol1; var a2:arbol2; var a3:arbol3);   // punto A-1-2-3
   var
     v:venta;
   begin
     a1:= nil;
     a2:= nil;   
     a3:= nil; 
     LeerVenta(v);
     while (v.cod <> 0) do begin
       InsertarElemento1(a1,v);
       InsertarElemento2(a2,v); 
       InsertarElemento3(a3,v);     
       LeerVenta(v);
     end;
   end;
   

  procedure ImprimirArbol (a1: arbol1);
  begin
    if(a1 <> nil) then begin
      ImprimirArbol(a1^.HI);
      writeln('el cod es: ', a1^.dato.cod);
      writeln('la fecha es: ', a1^.dato.fecha);
      writeln('la cant de unidades es: ', a1^.dato.cantuni);
      ImprimirArbol(a1^.HD);
    end;
  end;


procedure ImprimirArbol2 (a2: arbol2);
  begin
    if(a2 <> nil) then begin
      ImprimirArbol2(a2^.HI);
      writeln('el cod es: ', a2^.dato.cod);
      writeln('la cant de ventas es: ', a2^.dato.cantvendidos);
      ImprimirArbol2(a2^.HD);
    end;
  end;


  procedure ImprimirArbol3 (a3: arbol3);
  begin
    if (a3 <> nil) then begin
      ImprimirArbol3(a3^.HI);
      writeln('el cod es: ', a3^.dato.cod);
      writeln('la cantidad de ventas es: ', a3^.dato.LV^.dato);
      ImprimirArbol3(a3^.HD);
    end;
  end;


  function CalcularVentas (a1:arbol1; fecha:integer): integer;
  var
    cant:integer;
  begin
     if (a1 = nil) then   // caso base
        CalcularVentas:= 0
     else begin
        if(a1^.dato.fecha = fecha) then begin
           cant:= a1^.dato.cantuni;
           CalcularVentas:= CalcularVentas(a1^.HI, fecha) + CalcularVentas(a1^.HD, fecha);
        end
        else
           CalcularVentas:= CalcularVentas(a1^.HI, fecha) + CalcularVentas(a1^.HD, fecha);
     CalcularVentas:= cant;
     end;
  end;


  procedure ObtenerMaximo (a2:arbol2; var max, codmax: integer);  
  begin
    if (a2 <> nil) then begin                  // sigo buscando
      ObtenerMaximo(a2^.HI, max, codmax); 
      if (a2^.dato.cantvendidos > max) then begin       // actualizo
        max:= a2^.dato.cantvendidos;
        codmax:= a2^.dato.cod;
      end;
	  ObtenerMaximo(a2^.HD, max, codmax);     // es indistinto si pongo el HD aca o donde esta el HI
    end;
  end;


  function ContarCantVentas(L:ListaVenta): integer;
  begin
    if (L = nil) then
      ContarCantVentas:= 0
    else
      ContarCantVentas:= ContarCantVentas(L^.sig) + 1;
  end;  


  procedure ObtenerNodoMaximo (a3: arbol3; var max2, codnodomax: integer);  // Accede a cada nodo del arbol y llama a una funcion para contar
  var                                                                       //  la cantidad de nodos que tiene esa lista, a3^.dato.LV.dato
    cantmax: integer;
  begin
    if (a3 <> nil) then begin
      cantmax:= ContarCantVentas(a3^.dato.LV);   // cantidad de ventas de toda la lista 
      if (cantmax > max2) then begin
        max2:= cantmax;
        codnodomax:= a3^.dato.cod;
      end;
      ObtenerNodoMaximo(a3^.HI, max2, codnodomax);
      ObtenerNodoMaximo(a3^.HD, max2, codnodomax);
    end;
  end;


var
   a1: arbol1;
   a2: arbol2;
   a3: arbol3;
   fecha, max, codmax, max2, codnodomax:integer;
begin
   randomize;
   CargarArboles(a1,a2,a3);  // punto A-1-2-3
   ImprimirArbol(a1);
   writeln('///////////////////////');
   ImprimirArbol2(a2);
   writeln('///////////////////////');
   ImprimirArbol3(a3);   // si funca
   readln(fecha);
   writeln('La cantidad total de productos vendidos es: ', CalcularVentas(a1,fecha));  // punto B
   max:= -1;
   ObtenerMaximo(a2,max,codmax);    // punto C 
   writeln('EL codigo de producto maximo es: ', codmax);
   max2:= -1;
   ObtenerNodoMaximo(a3,max2,codnodomax);     // punto D
   writeln('EL codigo de producto con mas nodos es: ', codnodomax);  
end.
