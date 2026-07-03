{4.- Una librería requiere el procesamiento de la información de sus productos. De cada
producto se conoce el código del producto, código de rubro (del 1 al 6) y precio.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
* 
a. Lea los datos de los productos y los almacene ordenados por código de producto y
agrupados por rubro, en una estructura de datos adecuada. El ingreso de los productos finaliza
cuando se lee el precio -1.
* 
b. Una vez almacenados, muestre los códigos de los productos pertenecientes a cada rubro.
* 
c. Genere un vector (de a lo sumo 20 elementos) con los productos del rubro 3. Considerar que
puede haber más o menos de 20 productos del rubro 3. 
* 
d. Ordene, por precio, los elementos del vector generado en c) utilizando alguno de los dos
métodos vistos en la teoría.
* 
e. Muestre los precios del vector resultante del punto d).
* 
f. Calcule el promedio de los precios del vector resultante del punto d).
}
program libreria;
const
   df = 6;
type
   subrango = 1..6;

   producto = record
     cod:integer;
     rubro:subrango;
     precio:real;
   end;
   
   Lista=^nodo;
   nodo = record
     dato:producto;
     sig:Lista;
   end;
   
   vector = array [subrango] of Lista;
   VectoRubro3 = array [1..20] of producto;
   
   
   procedure InicializarVec(var v:vector);
   var
     i:integer;
   begin
     for i:= 1 to df do 
       v[i]:= nil;
   end;
  
   
   procedure LeerProducto (var P:producto);
   begin
     readln(P.precio);
     if (P.precio <> -1) then begin
       P.cod:= random(100);
       readln(P.rubro);
       end;
   end;
   
   
   procedure InsertarOrdenado (var L:lista; P:producto);
   var
     nue, ant, act:Lista;
   begin
     new(nue);
     nue^.dato:= P;
     act:= L;
     ant:= L;
     while (act <> nil) and (P.cod < act^.dato.cod) do begin
       ant:= act;
       act:= act^.sig;
     end;
     if (act = ant) then
       L:= nue
     else
       ant^.sig:= nue;
     nue^.sig:= act;  
   end;
   
   
   procedure CargarVector (var v:vector);
   var
     P:producto;
   begin
     LeerProducto(P);
     while (P.precio <> -1) do begin
       InsertarOrdenado(v[p.rubro],P);
       LeerProducto(P);
     end;
   end;
   
   
    
   procedure ImprimirLista (L:lista);
   begin
      while (L <> nil) do begin       // v[i] = L (en este caso)
        writeln('Codigo:',L^.dato.cod);
        L:= L^.sig;
      end;
   end;
  
 
   procedure ImprimirVectorA (v:vector);
   var
     i:integer;
   begin
     for i:= 1 to df do begin
       writeln('Rubro:',i);      // no hace falta pero es para entenderlo mejor
       ImprimirLista(v[i]);
       v[i]:= v[i] + 1;
     end;
   end;
 
   
   procedure GenerarVector (var VR:VectoRubro3; L:lista; var dl:integer);
   begin
     while (L <> nil) and (dl < df) do begin
       dl:= dl + 1;
       VR[dl]:= L^.dato;
       L:= L^.sig;
     end;
   end;
   
   
   procedure OrdenSeleccion ( var VR:VectoRubro3; dl:integer);
   var
     i, j, pos:integer;
     dato:producto;
   begin
     for i:= 1 to dl-1 do begin
       pos:= i;
       for j:= i+1 to dl do begin
         if (VR[j].precio < VR[pos].precio) then    // si el dato es menor
           pos:= j;                     // guardo pos del minimo
       end;
       dato:= VR[pos];               //  guardo el minimo
       VR[pos]:= VR[i];              //  cambio el minimo por el original
       VR[i]:= dato;                 //  pongo el minimo en orden con un auxiliar
     end;
   end;
   
     
  
   procedure ImprimirVectorB (VR:VectoRubro3; dl:integer);
   var
     i:integer;
   begin
     for i:= 1 to dl do begin
      {writeln('Codigo:',VR[i].cod);         // no hace falta pero es para entenderlo mejor
       writeln('Rubro:',VR[i].rubro);}
       writeln('Precio:',VR[i].precio:2:2);
     end;
   end;


   procedure CalcularProm (VR:VectoRubro3; dl:integer; var prompre:real);
   var
     i, cantotal:integer;
     sumatotal:real;
   begin
     cantotal:= 0;
     sumatotal:= 0;
     for i:= 1 to dl do begin
       sumatotal:= sumatotal + VR[i].precio;
       cantotal:= cantotal + 1;       
     end;            
     prompre:= sumatotal / cantotal;         // prom: sumatotal/cantotal
   end;
  
   
var
   v:vector;
   VR:VectoRubro3;
   dl:integer;
   prompre:real;
begin
   randomize;
   InicializarVec(v);
   CargarVector(v);     // punto A
   ImprimirVectorA(v);    // punto B
   GenerarVector(VR,v[3],dl);   // punto C
   OrdenSeleccion(VR,dl);     // punto D
   ImprimirVectorB(VR,dl);     // punto E
   CalcularProm(VR,dl,prompre);     // punto F
   writeln('Promedio:', prompre:2:2);          // no hace falta pero es para entenderlo mejor
end.
