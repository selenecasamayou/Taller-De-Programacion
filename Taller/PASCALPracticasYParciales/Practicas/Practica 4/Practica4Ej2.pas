{Descargar el programa ImperativoEjercicioClase3.pas de la clase anterior e incorporar lo
necesario para:
i. Informar el número de socio más grande. Debe invocar a un módulo recursivo que
retorne dicho valor.
ii. Informar los datos del socio con el número de socio más chico. Debe invocar a un
módulo recursivo que retorne dicho socio.
iii. Leer un valor entero e informar si existe o no existe un socio con ese valor. Debe
invocar a un módulo recursivo que reciba el valor leído y retornar verdadero o falso.
iv. Leer dos valores e informar la cantidad de socios cuyos códigos se encuentran
comprendidos entre los valores leídos. Debe invocar a un módulo recursivo que reciba
los valores leídos y retorne la cantidad solicitada.
     SE REFIERE AL PROGRAMA YA RESUELTO, NO VACIO  }

Program ImperativoClase3;

type rangoEdad = 12..100;
     cadena15 = string [15];
     socio = record
               numero: integer;
               nombre: cadena15;
               edad: rangoEdad;
             end;
     arbol = ^nodoArbol;
     nodoArbol = record
                    dato: socio;
                    HI: arbol;
                    HD: arbol;
                 end;
     
     
procedure GenerarArbol (var a: arbol);
{ Implementar un modulo que almacene informacion de socios de un club en un arbol binario de busqueda. De cada socio se debe almacenar numero de socio, 
nombre y edad. La carga finaliza con el numero de socio 0 y el arbol debe quedar ordenado por numero de socio. La informacion de cada socio debe generarse
aleatoriamente. }

  Procedure CargarSocio (var s: socio);   // punto A
  var 
     vNombres:array [0..9] of string = ('Ana', 'Jose', 'Luis', 'Ema', 'Ariel', 'Pedro', 'Lena', 'Lisa', 'Martin', 'Lola'); 
  begin
    s.numero:= random (51) * 100;
    If (s.numero <> 0) then begin
           s.nombre:= vNombres[random(10)];
           s.edad:= 12 + random (79);
    end;
  end;  
  
  Procedure InsertarElemento (var a: arbol; elem: socio);
  Begin
    if (a = nil) then begin
           new(a);
           a^.dato:= elem; 
           a^.HI:= nil; 
           a^.HD:= nil;
    end
    else begin
       if (elem.numero < a^.dato.numero) then 
           InsertarElemento(a^.HI, elem)
       else 
           InsertarElemento(a^.HD, elem); 
    end;
  End;

var unSocio: socio;  
Begin
  writeln;
  writeln ('----- Ingreso de socios y armado del arbol ----->');
  writeln;
  a:= nil;
  CargarSocio (unSocio);
  while (unSocio.numero <> 0)do begin
    InsertarElemento (a, unSocio);
    CargarSocio (unSocio);
  end;
 writeln;
 writeln ('//////////////////////////////////////////////////////////');
 writeln;
end;


procedure InformarSociosOrdenCreciente (a: arbol);   // punto B-1
{ Informar los datos de los socios en orden creciente. }
  
  procedure InformarDatosSociosOrdenCreciente (a: arbol);
  begin
    if (a <> nil) then begin 
		InformarDatosSociosOrdenCreciente (a^.HI);
		writeln ('Numero: ', a^.dato.numero, ' Nombre: ', a^.dato.nombre, ' Edad: ', a^.dato.edad);
		InformarDatosSociosOrdenCreciente (a^.HD);
	end;		
  end;

Begin
 writeln;
 writeln ('----- Socios en orden creciente por numero de socio ----->');
 writeln;
 InformarDatosSociosOrdenCreciente (a);
 writeln;
 writeln ('//////////////////////////////////////////////////////////');
 writeln;
end;


procedure InformarSociosOrdenDecreciente (a:arbol);
begin
   if (a <> nil) then begin
      InformarSociosOrdenDecreciente (a^.HD);
      writeln('Numero: ', a^.dato.numero, ' Nombre: ', a^.dato.nombre, ' Edad: ', a^.dato.edad);
      InformarSociosOrdenDecreciente (a^.HI)
   end; 
end;


procedure InformarNumeroSocioConMasEdad (a: arbol);   // punto B-3
{ Informar el numero de socio con mayor edad. Debe invocar a un modulo recursivo que retorne dicho valor.  }

     procedure actualizarMaximo(var maxValor,maxElem : integer; nuevoValor, nuevoElem : integer);
	begin
	  if (nuevoValor >= maxValor) then
	  begin
		maxValor := nuevoValor;
		maxElem := nuevoElem;
	  end;
	end;
	
	procedure NumeroMasEdad (a: arbol; var maxEdad: integer; var maxNum: integer);
	begin
	   if (a <> nil) then
	   begin
		  actualizarMaximo(maxEdad,maxNum,a^.dato.edad,a^.dato.numero);
		  numeroMasEdad(a^.hi, maxEdad,maxNum);
		  numeroMasEdad(a^.hd, maxEdad,maxNum);
	   end; 
	end;

var 
  maxEdad, maxNum: integer;
begin
  writeln;
  writeln ('----- Informar Numero Socio Con Mas Edad ----->');
  writeln;
  maxEdad := -1;
  NumeroMasEdad (a, maxEdad, maxNum);
  if (maxEdad = -1) then 
     writeln ('Arbol sin elementos')
  else begin
         writeln;
         writeln ('Numero de socio con mas edad: ', maxNum);
         writeln;
       end;
  writeln;
  writeln ('//////////////////////////////////////////////////////////');
  writeln;
end;


procedure AumentarEdadNumeroImpar (a: arbol);   // punto B-4
{Aumentar en 1 la edad de los socios con edad impar e informar la cantidad de socios que se les aumento la edad.}
  
  function AumentarEdad (a: arbol): integer;
  var 
     resto: integer;
  begin
     if (a = nil) then 
        AumentarEdad:= 0
     else begin
            resto:= a^.dato.edad mod 2;
            if (resto = 1) then 
               a^.dato.edad:= a^.dato.edad + 1;
            AumentarEdad:= resto + AumentarEdad (a^.HI) + AumentarEdad (a^.HD);
          end;  
  end;
  
  
begin
  writeln;
  writeln ('----- Cantidad de socios con edad aumentada ----->');
  writeln;
  writeln ('Cantidad: ', AumentarEdad (a));
  writeln;
  writeln;
  writeln ('//////////////////////////////////////////////////////////');
  writeln;
end;
  
  
function InformarExistenciaNombreSocio (a:arbol; nombre:string): boolean; // IMPORTANTE (CODIGO MULTIUSO PARA BUSCAR ALGO Y RETORNAR V/F)
begin                                            // punto B-5
  if (a = nil) then
    InformarExistenciaNombreSocio:= False
  else
    if (a^.dato.nombre = nombre) then
      InformarExistenciaNombreSocio:= True
    else begin
         InformarExistenciaNombreSocio:= InformarExistenciaNombreSocio(a^.HI,nombre) or InformarExistenciaNombreSocio(a^.HD,nombre);
    end;   // como no buscamos por criterio de orden, se recorre todo el arbol. Se busca por izquierda o por derecha
end;


function InformarCantidadSocios (a:arbol): integer;  // punto B-6
begin
   if (a = nil) then   // caso base
      InformarCantidadSocios:= 0
   else
      InformarCantidadSocios:= InformarCantidadSocios(a^.HI) + InformarCantidadSocios(a^.HD) + 1;   
end;


function InformarPromedioDeEdad (a:arbol): integer;
begin
   if (a = nil) then   // caso base
     InformarPromedioDeEdad:= 0
   else 
     InformarPromedioDeEdad:= InformarPromedioDeEdad(a^.HI) + InformarPromedioDeEdad(a^.HD) + a^.dato.edad;  
end;

procedure CalcularProm (a:arbol);  // punto B-7 
var
   cantsocios, sumaedad:integer;
begin
   cantsocios:= InformarCantidadSocios(a);
   if (cantsocios = 0) then
     writeln('No hay socios')
   else begin
     sumaedad:= InformarPromedioDeEdad(a);
     writeln ('Promedio: ', sumaedad/cantsocios);
   end;
end;


  function SocioMax (a:arbol): integer;
  begin
    if (a = nil) then  // caso base
      SocioMax:= -1
    else begin
      if (a^.HD = nil) then  // si llegue al final y no hay mas hijo derecho
        SocioMax:= a^.dato.numero
      else
        SocioMax:= SocioMax(a^.HD);
    end;  
  end;


  procedure ObtenerMinimo (a:arbol; var min:integer; var nombremin:cadena15; var edadmin:rangoEdad);
  begin
    if (a <> nil) then begin
      ObtenerMinimo(a^.HI, min, nombremin, edadmin);
      if (a^.dato.numero < min) then begin   // actualizo
        min:= a^.dato.numero;
        nombremin:= a^.dato.nombre;
        edadmin:= a^.dato.edad;
      end;       
      ObtenerMinimo(a^.HD, min, nombremin, edadmin);
    end;
  end;


  procedure SocioMin (a:arbol);
  var
    min:integer;
    nombremin:cadena15; 
    edadmin:rangoEdad; 
  begin
    min:= 9999;
    ObtenerMinimo(a, min, nombremin, edadmin);
    writeln('Los datos del socio minimo son:  Numero: ', min, ' Nombre: ', nombremin, ' Edad: ', edadmin);
  end;
  

  function BuscarNumeroSocio (a:arbol; numero:integer): boolean;
  begin
    if (a = nil) then        // caso base
      BuscarNumeroSocio:= false
    else begin
      if (a^.dato.numero = numero) then   // lo encontre
        BuscarNumeroSocio:= true
      else 
        if (a^.dato.numero > numero) then                        
          BuscarNumeroSocio:= BuscarNumeroSocio(a^.HI, numero)
        else
          BuscarNumeroSocio:= BuscarNumeroSocio(a^.HD, numero);
    end;
  end;


  procedure InformarNumeroSocio (a: arbol; numero:integer);
  var
    encontre: boolean;
  begin
    encontre:= BuscarNumeroSocio(a, numero);
    if (encontre) then
       writeln('Se encontro el numero de socio: ', encontre)
    else 
       writeln('No se encontro el numero de socio: ', encontre)
  end;


  function ObtenerSociosEntreDosNumeros (a:arbol; cotainf, cotasup:integer): integer;
  begin 
    if (a = nil) then   // caso base
      ObtenerSociosEntreDosNumeros:= 0
    else begin
      if (a^.dato.numero > cotainf) then begin
        if (a^.dato.numero < cotasup) then   // esta en el rango
           ObtenerSociosEntreDosNumeros:= ObtenerSociosEntreDosNumeros(a^.HI, cotainf, cotasup) 
                                             + ObtenerSociosEntreDosNumeros(a^.HD, cotainf, cotasup) + 1
        else
          ObtenerSociosEntreDosNumeros:= ObtenerSociosEntreDosNumeros(a^.HI, cotainf, cotasup);
      end
      else 
         ObtenerSociosEntreDosNumeros:= ObtenerSociosEntreDosNumeros(a^.HD, cotainf, cotasup);
     end;
  end;


var 
  a: arbol; 
  nombre: string;
  encontre: boolean;
  numero, cotainf, cotasup: integer;
Begin
  randomize;
  GenerarArbol (a);  // punto A
  InformarSociosOrdenCreciente (a);   // punto B-1
  InformarSociosOrdenDecreciente (a);   // punto B-2
  InformarNumeroSocioConMasEdad (a);   // punto B-3
  AumentarEdadNumeroImpar (a);   // punto B-4
  readln(nombre);
  encontre:= InformarExistenciaNombreSocio(a,nombre);   // punto B-5
  if (encontre) then  // procedimiento informar queda mejor
     writeln('Se encontro el socio: ', encontre)
  else 
     writeln('No se encontro el socio: ', encontre);   
  writeln('La cantidad de socios es: ', InformarCantidadSocios(a));   // punto B-6
  CalcularProm(a);   // punto B-7
  writeln('El socio con el numero maximo es: ', SocioMax(a));   // punto I
  SocioMin(a);      // punto II
  readln(numero);
  InformarNumeroSocio(a, numero);   // punto III
  writeln('Ingrese el numero inferior y despues el numero superior');
  readln(cotainf);
  readln(cotasup);
  writeln ('La cantidad de socios que estan en el rango es: ',ObtenerSociosEntreDosNumeros(a,cotainf,cotasup));    // punto IV
End.

