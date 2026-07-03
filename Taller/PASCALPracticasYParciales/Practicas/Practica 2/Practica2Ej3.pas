{3.- Implementar un programa que invoque a los siguientes módulos.
a. Un módulo recursivo que retorne un vector de 20 números enteros “random” mayores a 300
y menores a 1550 (incluidos ambos).
b. Un módulo que reciba el vector generado en a) y lo retorne ordenado. (Utilizar lo realizado
en la práctica anterior)
c. Un módulo que realice una búsqueda dicotómica en el vector, utilizando el siguiente
encabezado:
              Procedure busquedaDicotomica (v: vector; ini,fin: indice; dato:integer; var pos: indice);
}

program vectores;
const
   df = 20;
type
   vector = array [1..df] of integer;
   
   
   procedure CargarVectorRecursivo (var v:vector; var dl:integer);
   var
     valor:integer;
   begin
     valor:= random(1550-350+1)+ 350;
     if (dl < df) then begin
        dl:= dl + 1;
        v[dl]:= valor;
        CargarVectorRecursivo(v,dl);
     end;
   end;
   
   
   procedure CargarVector (var v:vector; var dl:integer);
   begin
      dl:=0;
      CargarVectorRecursivo(v,dl);
   end;
   
  
   procedure ImprimirVector (v:vector; dl:integer);
   var
     i:integer;
   begin
     for i:= 1 to dl do 
        writeln ('numero:', v[i]); 
   end;

   
   procedure OrdenSeleccion (var v:vector; dl:integer);
   var
      i, j, pos, dato:integer;
   begin
      for i:= 1 to dl-1 do begin
        pos:=i;
        for j:= i+1 to dl do begin
          if(v[j] < v[pos]) then
            pos:=j;
        end;
        dato:= v[pos];
        v[pos]:= v[i];
        v[i]:= dato;
      end;
   end;
   
   
   Procedure BusquedaDicotomicaRecursiva (v: vector; ini, fin, dato:integer; var pos: integer);  // usar si o si asi 
   var
	medio:integer;
   begin
     medio:= ((fin + ini) div 2);
     if (fin < ini) then
       pos:= -1
     else
       if (v[medio] = dato) then
		pos:=medio
       else
         if (v[medio] > dato) then
           BusquedaDicotomicaRecursiva(v,ini, medio-1, dato, pos)
         else
           BusquedaDicotomicaRecursiva(v,medio+1, fin, dato, pos);
   end;
         
var
   v:vector;
   dl, ini, fin, dato, pos:integer;
begin
   randomize;
   CargarVector(v,dl);   // punto A
   OrdenSeleccion(v,dl);   // punto B
   ImprimirVector(v,dl);                 // es para ver si se ordeno correctamente el vector
   writeln('ingrese un dato:');
   readln(dato);
   ini:=1;
   fin:=dl;
   BusquedaDicotomicaRecursiva(v,ini,fin,dato,pos);   // punto C 
   if (pos = -1) then
      writeln('el dato no se encontro')     // es para ver si funciono la busqueda dicotomica
   else
      writeln('el dato se encontro y estaba en la posicion: ', pos);
end.
