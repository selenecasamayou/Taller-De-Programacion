{Netflix ha publicado la lista de películas que estarán disponibles durante el mes de
septiembre de 2025. De cada película se conoce: código de película, código de género (1:
acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélico, 7: documental y 8: terror) y
puntaje promedio otorgado por las críticas.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
* 
a. Lea los datos de películas, los almacene por orden de llegada y agrupados por código de
género, y retorne en una estructura de datos adecuada. La lectura finaliza cuando se lee el
código de la película -1.
* 
b. Genere y retorne en un vector, para cada género, el código de película con mayor puntaje
obtenido entre todas las críticas, a partir de la estructura generada en a)..
* 
c. Ordene los elementos del vector generado en b) por puntaje utilizando alguno de los dos
métodos vistos en la teoría.
* 
d. Muestre el código de película con mayor puntaje y el código de película con menor puntaje,
del vector obtenido en el punto c)
}

program netflix;
const
   df= 8;
type
   subrango = 1..8;

   pelicula = record
     cod:integer;
     genero:subrango;
     puntajeprom:real;
   end;
   
   Lista = ^nodo;
   nodo = record
     dato:pelicula;
     sig:Lista;
   end;
   
   reglista = record
     L:lista;          // primer elemento
     ult:lista;
   end;
   
   vector = array [subrango] of reglista;
   vecontador = array [subrango] of integer;
   
   procedure InicializarVec (var v:vector);
   var
     i:integer;
   begin
     for i:= 1 to 8 do
       v[i].L:= nil;
       v[i].ult:= nil;
   end;
   
   
   procedure LeerPelicula (var P:pelicula);
   begin
	 writeln('hola');
     readln(P.cod);
     if (P.cod <> -1) then begin
       P.genero:= random(8)+1;
       readln(P.puntajeprom);
     end;
   end;
  
  
  procedure AgregarAtras(var RL:reglista; P:pelicula);   
  var
    nue:Lista;
  begin
    new(nue);
    nue^.dato:= P;
    nue^.sig:= nil;
    if (RL.L = nil) then
      RL.L:= nue             // accede al reglista, de ahi accede al primer elementom
    else
      RL.ult^.sig:= nue;     // accede al reglista, de ahi accede al ultimo elemento
    RL.ult:= nue;
  end;
  
  
  procedure CargarDatos(var v:vector);
  var
    P:pelicula;
  begin
    InicializarVec(v);
    LeerPelicula(P);
    while (P.cod <> -1) do begin
      AgregarAtras(v[P.genero],P);
      LeerPelicula(P);
    end;
  end;
  
  
  function CodMax (L:lista): integer;
  var
    max:real;
  begin
    max:=-1;
    if (L^.dato.puntajeprom > max) then
      max:= L^.dato.puntajeprom;
      Codmax:= L^.dato.cod;
  end;
  
  
  procedure RecorrerVec (v:vector; var vecont:vecontador);
  var
    i:integer;
  begin
    for i:= 1 to 8 do begin
      vecont[i]:= CodMax(v[i].L);
    end;
  end;
  
  
  procedure OrdenSeleccion (var vecont:vecontador);
   var
     i, j, pos, dato:integer;
   begin
     for i:= 1 to df-1 do begin
       pos:=i;
       for j:= i+1 to df do begin
         if (vecont[j] < vecont[pos]) then
           pos:= j;
       end;
       dato:= vecont[pos];
       vecont[pos]:= vecont[i];
       vecont[i]:= dato;
      end;
   end;
   
   
var
   v:vector;
   vecont:vecontador;
begin
   randomize;
   CargarDatos(v);     //punto A
   RecorrerVec(v,vecont);     //punto B
   OrdenSeleccion(vecont);    //punto C
   writeln('El codigo de pelicula con mayor puntaje es:', vecont[8], 'y el codigo de pelicula con menor puntaje es:', vecont[1]);  //punto D
end.

