{2.- Escribir un programa que:
a. Implemente un módulo recursivo que genere y retorne una lista de números enteros
“random” en el rango 100-200. Finalizar con el número 100.
b. Un módulo recursivo que reciba la lista generada en a) e imprima los valores de la lista en el
mismo orden que están almacenados.
c. Implemente un módulo recursivo que reciba la lista generada en a) e imprima los valores de
la lista en orden inverso al que están almacenados.
d. Implemente un módulo recursivo que reciba la lista generada en a) y devuelva el mínimo
valor de la lista.
e. Implemente un módulo recursivo que reciba la lista generada en a) y un valor y devuelva
verdadero si dicho valor se encuentra en la lista o falso en caso contrario.
}

program modulos;
type
   Lista = ^nodo;
   nodo = record
     dato:integer;
     sig:Lista;
   end;
   
   
   procedure AgregarAdelante(var L:Lista; num:integer);
   var
     nue:lista;
   begin
     new(nue);
     nue^.dato:= num;
     nue^.sig:= L;
     L:= nue;
   end;
   
   
   procedure CargarListaRecursiva (var L:Lista);    // Los datos me quedan almacenados del ultimo al primero
   var
     num:integer;
   begin
     num:= random(200-100+1)+ 100;
     if (num <> 100) then begin
        AgregarAdelante(L,num);
        CargarListaRecursiva(L);
     end;
   end;
   
  
   procedure ImprimirListaRecursiva(L:Lista);     // Imprimo en orden
   begin
     if (L <> nil) then begin
       write(L^.dato,'-');
       ImprimirListaRecursiva(L^.sig);
     end;
   end;


  procedure ImprimirListaRecursivaInversa (L:Lista);
  begin
     if (L <> nil) then begin
       ImprimirListaRecursivaInversa(L^.sig);
       write(L^.dato,'-');
     end;
   end;

  
  function ObtenerMinimo (L:Lista): integer;
  var
    min:integer;
  begin
	if (L <> nil) then begin
		min:= ObtenerMinimo(L^.sig);
		if (L^.dato < min)then
			ObtenerMinimo:= L^.dato
		else
			ObtenerMinimo:= min
	end
    else
		ObtenerMinimo:= 9999
    end;


  function BuscarElem (L:Lista; valor:integer): boolean;
  begin
	if (L= nil) then
	   BuscarElem:= False
	else
	   if (l^.dato = valor) then
		 BuscarElem:= true
	   else
		 BuscarElem:= BuscarElem(l^.sig,valor);
  end;
	
		
var
   L:Lista;
   numMin, valor:integer;
   encontre:boolean;
begin
   randomize;
   L:=nil;
   CargarListaRecursiva(L);   // punto A
   ImprimirListaRecursiva(L);   // punto B
   writeln('___');
   ImprimirListaRecursivaInversa(L);   // punto C
   writeln('hola');
   numMin:= ObtenerMinimo(L);   // punto D  
   writeln(numMin);
   readln(valor);
   encontre:= BuscarElem(L,valor);   // punto E 
   writeln(encontre);
end.
