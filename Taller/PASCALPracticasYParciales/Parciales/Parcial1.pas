program parcial1;
type
  
  rangoGenero = 1..15;
  
  libro = record
    ISBN: integer;
    anio: integer;
    codautor: integer;
    codgenero: rangoGenero;
  end;
  
  lista = ^nodo2;
  nodo2 = record
    dato: libro;
    sig: lista;
  end;
  
  codigos = record
    codautor: integer;
    l: lista;
  end;
  
  arbol = ^nodo;
  nodo = record
    dato: codigos;
    HI: arbol;
    HD: arbol;
  end;
 
//--------------------//

  datos = record
    cod: integer;
    cantlibros: integer
  end;
  
  lista2 = ^nodo3;
  nodo3 = record
    dato: datos;
    sig: lista2;
  end;

  
  procedure LeerLibro (var l:libro);
  begin
    writeln('ingrese un ISBN');
    readln(l.ISBN);
    if (l.ISBN <> 0) then begin
      l.anio:= random (2000-1000+ 1) + 1000;
       writeln('ingrese un codigo de autor');
       readln(l.codautor);
    //  l.codautor:= random (100) + 1;
      l.codgenero:= random (15) + 1;
    end;
  end;
  
  
  procedure AgregarAdelante (var li:lista; l:libro);
  var
    aux: lista;
  begin
    new(aux);
    aux^.dato:= l;
    aux^.sig:= li;
    li:= aux;
  end;
  
  
  procedure InsertarElemento (var a:arbol; l:libro);
  begin
    if (a = nil) then begin
      new(a);
      a^.dato.codautor:= l.codautor;
      a^.dato.l:= nil;
      AgregarAdelante(a^.dato.l, l);
      a^.HI:= nil;
      a^.HD:= nil;
    end
    else begin
      if (l.codautor < a^.dato.codautor) then
         InsertarElemento(a^.HI, l)
      else
        if (l.codautor > a^.dato.codautor) then
           InsertarElemento(a^.HD, l)
         else
           AgregarAdelante(a^.dato.l, l);
    end;
  end;
  
  
  procedure CargarArbol (var a:arbol);
  var
    l:libro;
  begin
    a:= nil;
    LeerLibro(l);
    while (l.ISBN <> 0) do begin
      InsertarElemento(a, l);
      LeerLibro(l);
    end;
  end;


  procedure ImprimirLista (l:lista);
  begin
    while (l <> nil) do begin
      writeln('El ISBN es: ', l^.dato.ISBN);
      writeln('El anio es: ', l^.dato.anio);
      writeln('El codigo de genero es: ', l^.dato.codgenero);
      l:= l^.sig;
    end;
  end;
  

  procedure ImprimirArbol (a:arbol);
  begin
    if (a <> nil) then begin
      ImprimirArbol(a^.HI);
      writeln('El codigo de autor es: ', a^.dato.codautor);
      ImprimirLista(a^.dato.l);
      ImprimirArbol(a^.HD);
    end;
  end;

  
  function ContarLibros (l:lista): integer;
  var
    cant: integer;
  begin
    cant:= 0;
    while (l <> nil) do begin
      cant:= cant + 1;
      l:= l^.sig;
    end;
    ContarLibros:= cant;
  end;
  
  
  procedure AgregarAdelante2 (var l2:lista2; cantlibro:integer; autor:integer);
  var
    aux: lista2; 
  begin
    new(aux);
    aux^.dato.cod:= autor;
    aux^.dato.cantlibros:= cantlibro;
    aux^.sig:= l2;
    l2:= aux;
  end;
 
  procedure BuscarCodigo (a:arbol; codigo: integer; var l2:lista2); 
  var
    cantlibro: integer;
  begin
     if (a <> nil) then begin 
       cantlibro:= 0;
       if (codigo < a^.dato.codautor) then begin  // cumple
          cantlibro:= ContarLibros(a^.dato.l);
          writeln('cantlibro :', cantlibro);
          AgregarAdelante2(l2, cantlibro, a^.dato.codautor);
          BuscarCodigo(a^.HI, codigo, l2);
       end
       else
          BuscarCodigo(a^.HD, codigo, l2);
     end;     
  end;


  procedure ObtenerMaximo (l2:lista2; var codmax, cantmax: integer);
  begin
    if (l2 = nil) then  // caso base
      cantmax:= -1
    else begin
      if (l2^.dato.cantlibros > cantmax) then begin
        cantmax:= l2^.dato.cantlibros;
        codmax:= l2^.dato.cod;
      end;
      ObtenerMaximo(l2^.sig, codmax, cantmax);
    end;
  end;


var  
  a: arbol;
  l2: lista2;
  codigo, codmax, cantmax:integer;
begin
  randomize;
  CargarArbol(a);  // punto A
  ImprimirArbol(a);
  writeln('ingrese un codigo');
  readln(codigo);
  l2:= nil;
  BuscarCodigo(a, codigo, l2);  // punto B
  ObtenerMaximo(l2, codmax, cantmax);   // punto C
  writeln(codmax, ' y ', cantmax);
end.  
