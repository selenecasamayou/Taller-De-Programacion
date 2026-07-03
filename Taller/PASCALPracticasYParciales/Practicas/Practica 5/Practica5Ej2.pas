{Una agencia dedicada a la venta de autos ha organizado su stock y, tiene la información de
los autos en venta. Implementar un programa que:
a) Genere la información de los autos (patente, año de fabricación (2015..2024), marca,
color y modelo, finalizando con marca ‘MMM’) y los almacene en dos estructuras de
datos:
i. Una estructura eficiente para la búsqueda por patente.
ii. Una estructura eficiente para la búsqueda por marca. Para cada marca se deben
almacenar juntas las patentes y colores de los autos pertenecientes a ella.
b) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne la
cantidad de autos de dicha marca que posee la agencia.
c) Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne
la cantidad de autos de dicha marca que posee la agencia.
d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con
la información de los autos agrupados por año de fabricación.
e) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el
modelo del auto con dicha patente.
f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el
color del auto con dicha patente.
}
program agencia;
type

   rangoanio = 2015..2024;
   
//-------------------//
   
   auto = record
     patente: integer; //string[7];  // para probarlo ponerlo como integer
     anio: rangoanio;
     marca: string;
     color: string;
     modelo: integer;
   end;
   
   arbol1 = ^nodo1;
   nodo1 = record
     dato: auto;
     HI: arbol1;
     HD: arbol1;
   end;
   
//--------------------//   
   
   marcas = record
     patente:integer;
     color:string;
   end;
   
   
   lista = ^nodo;  
   nodo = record  
    dato : marcas;
	sig : lista;
   end; 
   
   
   datos = record
     marca: string;   // criterio de orden
     l: lista          // datos a almacenar
   end;
    
    
   arbol2 = ^nodo2;  
   nodo2 = record
     dato: datos;
     HI: arbol2;
     HD: arbol2;
   end;
   
//--------------------//

  regvec = record
     patente: integer; //string[7];  // para probarlo ponerlo como integer
     marca: string;
     color: string;
     modelo: integer;
   end;
  
  listaV = ^nodoV;
  nodoV = record
    dato: regvec;
    sig: listaV;
  end; 
  
  vecanios = array [2015..2024] of listaV; 
   
   
   procedure LeerAuto (var a:auto);
   begin
     writeln('ingrese una marca');
     readln(a.marca);
     if (a.marca <> 'MMM') then begin
       a.patente:= random(1000);
       a.anio:= random(2024 - 2015 + 1) + 2015;
       readln(a.color);
       a.modelo:= random(100) + 1;
     end;
   end;
   
   
   procedure InsertarElemento1 (var a1:arbol1; a:auto);
   begin
     if (a1 = nil) then begin  // caso base
       new(a1);
       a1^.dato:= a;
       a1^.HI:= nil;
       a1^.HD:= nil;
     end
     else begin  // criterio de orden
       if (a.patente < a1^.dato.patente) then
          InsertarElemento1(a1^.HI, a)
       else
          InsertarElemento1(a1^.HD, a);
     end;
   end;
   
   
   
   procedure AgregarAdelante (var l:lista; a:auto);
   var
     aux:lista;
   begin
     new(aux);
     aux^.dato.patente:= a.patente;
     aux^.dato.color:= a.color;
     aux^.sig:= l;
     l:= aux;   
   end;
   
   
   procedure InsertarElemento2 (var a2:arbol2; a:auto);
   begin
     if (a2 = nil) then begin
       new(a2);
       a2^.dato.marca:= a.marca;
       a2^.dato.l:= nil;
       AgregarAdelante(a2^.dato.l, a);
       a2^.HI:= nil;
       a2^.HD:= nil;
     end
     else begin
       if (a.marca < a2^.dato.marca) then
         InsertarElemento2(a2^.HI, a)
       else
         if (a.marca > a2^.dato.marca) then 
           InsertarElemento2(a2^.HD, a)
         else
           AgregarAdelante(a2^.dato.l, a);
     end;   
   end;
   
   
   procedure CargarArboles(var a1:arbol1; var a2:arbol2);
   var
     a:auto;
   begin
     a1:= nil;
     a2:= nil;
     LeerAuto(a);
     while (a.marca <> 'MMM') do begin
       InsertarElemento1(a1, a);
       InsertarElemento2(a2, a);
       LeerAuto(a);
     end;
   end;
   
  // b) Invoque a un módulo que reciba la estructura generado en a) i y una marca y retorne la
                    //     cantidad de autos de dicha marca que posee la agencia.
   function CantAutos (a1:arbol1; marca:string): integer;
   begin
      if (a1 = nil) then // caso base
         CantAutos:= 0
      else
        if (a1^.dato.marca = marca) then
          CantAutos:= CantAutos(a1^.HI, marca) + CantAutos(a1^.HD, marca) + 1
        else 
          CantAutos:= CantAutos(a1^.HI, marca) + CantAutos(a1^.HD, marca);
   end;
   
  // c) Invoque a un módulo que reciba la estructura generado en a) ii y una marca y retorne
         //la cantidad de autos de dicha marca que posee la agencia.
   
   function CantTotal (l:lista): integer;
   var
     cant:integer;
   begin
     cant:= 0;
     while (l <> nil) do begin
       cant:= cant + 1;
       l:= l^.sig;
     end;
     CantTotal:= cant;
   end;
   
   
   function CantAutosOrdenado (a2:arbol2; marca:string): integer;
   begin
      if (a2 = nil) then // caso base
         CantAutosOrdenado:= 0
      else
        if (a2^.dato.marca = marca) then
          CantAutosOrdenado:= CantTotal(a2^.dato.l)
        else
          if (a2^.dato.marca < marca) then
            CantAutosOrdenado:= CantAutosOrdenado(a2^.HI, marca)
          else 
            CantAutosOrdenado:= CantAutosOrdenado(a2^.HD, marca);
   end;
   
  // d) Invoque a un módulo que reciba el árbol generado en a) i y retorne una estructura con
      //la información de los autos agrupados por año de fabricación
      
   procedure InicializarVector (var va:vecanios);
   var
     i: integer;
   begin
     for i:=2015 to 2024 do
       va[i]:= nil;
   end;
   
   
   procedure ModificarReg (a:auto; var rv:regvec);  // pongo los datos del registro original en el registro de la lista del vector
   begin
     rv.patente:= a.patente;
     rv.marca:= a.marca;
     rv.color:= a.color;
     rv.modelo:= a.modelo;
   end;
   
   
   procedure AgregarAdelante2 (var l:listaV; rv:regvec);
   var
     aux:listaV;
   begin
     new(aux);
     aux^.dato:= rv;
     aux^.sig:= l;
     l:= aux;
   end;
   
   
   procedure CargarVector (var va:vecanios; a1:arbol1); 
   var
     rv: regvec;
   begin
     if (a1 <> nil) then begin
       ModificarReg(a1^.dato, rv);       // v[a1^.dato.anio] = l
       AgregarAdelante2(va[a1^.dato.anio], rv);  // accedo al año del registro del arbol y lo añado al vector
       CargarVector(va, a1^.HI);
       CargarVector(va, a1^.HD);
     end;
   end;
   
   
  // e) Invoque a un módulo que reciba el árbol generado en a) i y una patente y devuelva el
       //modelo del auto con dicha patente.
   
   function BuscarPatente (a1:arbol1; patente:integer): integer;   // busqueda acotada
   begin
     if (a1 = nil) then
       BuscarPatente:= 0
     else begin
       if (a1^.dato.patente = patente) then
         BuscarPatente:= a1^.dato.modelo
       else
         if (a1^.dato.patente > patente) then
           BuscarPatente(a1^.HI, patente)
         else
           BuscarPatente(a1^.HD, patente);
      end;
   end;
   
   
  // f) Invoque a un módulo que reciba el árbol generado en a) ii y una patente y devuelva el
    // color del auto con dicha patente.
   
   function RecorrerListaMarca (l:lista; patente:integer): string;
   var
     encontre: boolean;
   begin
     encontre:= false;
     while (l <> nil) and (not encontre) do begin  // recorro
       if (l^.dato.patente = patente) then  begin
          encontre:= true;
          RecorrerListaMarca:= l^.dato.color;   // lo encuentro
       end
       else
          l:= l^.sig;
     end;
       if (not encontre) then // pregunto si salio porque no lo enctrontro y no porque termino la lista
         RecorrerListaMarca:= 'No estaba';
   end;
   
   
   function BuscarPatente2 (a2:arbol2; patente:integer): string;
   var
     encontre: string;
   begin
     if (a2 = nil) then
       BuscarPatente2:= 'No se encontro'
     else begin
       encontre:= RecorrerListaMarca(a2^.dato.l, patente);  // recorro la lista
         if (encontre = 'No estaba') then          // si no estaba, voy al siguiente nodo del arbol
           BuscarPatente2:= BuscarPatente2(a2^.HI, patente) + BuscarPatente2(a2^.HD, patente)
         else
           BuscarPatente2:= encontre;   // devuelve color
     end;
   end;
   
   
   procedure Buscar (a2:arbol2; patente:integer);   // o poner en una variable llamada resulado BuscarPatente2 
   begin
       if (BuscarPatente2(a2, patente) = 'No se econtro') then
          writeln ('La patente: ', BuscarPatente2(a2, patente))
       else
          writeln ('La patente: ', patente, ' tiene como color: ', BuscarPatente2(a2, patente));  // lo encontro
   end;
   
var
   a1:arbol1;
   a2:arbol2;
   marca:string;
   va:vecanios;
   patente: integer;
begin
   randomize;
   CargarArboles(a1, a2);   // punto A-1 y A-2 
   writeln('ingrese una marca');
   readln(marca);
   writeln('La cantidad de autos es: ', CantAutos(a1, marca));  //punto B
   writeln('La cantidad de autos es: ', CantAutosOrdenado(a2, marca));  //punto C
   InicializarVector(va);   
   CargarVector(va,a1);   // punto D
   writeln('ingrese una patente');
   readln(patente);
   writeln('La patente: ', patente, ' tiene como modelo a: ', BuscarPatente(a1, patente));  // punto E
   writeln('ingrese otra patente');
   readln(patente);
   Buscar(a2, patente);   // punto F
   // SI EN UN VECTOR O UNA LISTA NO PIDEN QUE SEA RECURSIVO, EL MODULO NO TIENE QUE SER RECURSIVO 
end.   
