{1.- Implementar un programa que invoque a los siguientes m�dulos.
a. Un m�dulo recursivo que retorne un vector de a lo sumo 15 n�meros enteros �random� mayores a 10 y menores a 155 (incluidos ambos). La carga finaliza con 
el valor 20.
b. Un m�dulo no recursivo que reciba el vector generado en a) e imprima el contenido del vector.
c. Un m�dulo recursivo que reciba el vector generado en a) e imprima el contenido del vector.
d. Un m�dulo recursivo que reciba el vector generado en a) y devuelva la suma de los valores pares contenidos en el vector.
e. Un m�dulo recursivo que reciba el vector generado en a) y devuelva el m�ximo valor del vector.
f. Un m�dulo recursivo que reciba el vector generado en a) y un valor y devuelva verdadero si dicho valor se encuentra en el vector o falso en caso contrario.
g. Un m�dulo que reciba el vector generado en a) e imprima, para cada n�mero contenido en el vector, sus d�gitos en el orden en que aparecen en el n�mero. 
Debe implementarse un m�dulo recursivo que reciba el n�mero e imprima lo pedido. Ejemplo si se lee el valor 142, se debe imprimir 1  4  2
}

Program Clase2MI;
const 
   dimF = 15;
   min = 10;
   max = 155;
type 
   vector = array [1..dimF] of integer;
     

procedure CargarVector (var v: vector; var dimL: integer);    // punto A

   procedure CargarVectorRecursivo (var v: vector; var dimL: integer);
   var
     valor: integer;
   begin
     valor:= min + random (max - min + 1);
     if ((valor <> 20 ) and (dimL < dimF)) then begin
         dimL:= dimL + 1;
         v[dimL]:= valor;
         CargarVectorRecursivo (v, dimL);
     end;
  end;
  
begin
  dimL:= 0;
  CargarVectorRecursivo (v, dimL);
end;


procedure ImprimirVector (v: vector; dimL: integer);   // punto B
var
   i: integer;
begin
     for i:= 1 to dimL do
         write ('----');
     writeln;
     write (' ');
     for i:= 1 to dimL do begin
        write(v[i], ' | ');
     end;
     writeln;
     for i:= 1 to dimL do
         write ('----');
     writeln;
     writeln;
End;     


procedure ImprimirVectorRecursivo (v: vector; dimL: integer);   // punto C
begin    
    if (diml = 1) then begin
         write ('----');
     writeln;
     write (' ');

        write(v[diml], ' | ');

     writeln;
         write ('----');
     writeln;
     writeln;    
    end
    else begin
      ImprimirVectorRecursivo(v,diml-1);
      
       write ('----');
       writeln;
       write (' ');

        write(v[diml], ' | ');

        writeln;
         write ('----');
        writeln;
        writeln;    
    end;
end; 

    
function Sumar (v: vector; dimL: integer): integer;   // punto D

  function SumarRecursivo (v: vector; pos, dimL: integer): integer;
  Begin
     if (pos <= dimL)  then 
       SumarRecursivo:= SumarRecursivo (v, pos + 1, dimL) + v[pos]  
     else 
       SumarRecursivo:=0  
  End;
 
var 
  pos: integer; 
begin
  pos:= 1;
  Sumar:= SumarRecursivo (v, pos, dimL);
end;


function  ObtenerMaximo (v: vector; dimL: integer): integer;   // punto E
var
  max:integer;
begin
   max:= -1;
   if (diml = 0) then                     // imprimir en order            (primero recorro hasta llegar al primero 
      ObtenerMaximo:=-1                   //    modulo                     y despues mientras vuelve va imprimiendo)
   else begin {diml <> 0}                 //    writeln
	   max:=ObtenerMaximo(v,dimL-1);      
	   if(v[dimL] > max ) then 
	       max:= v[diml];                 // imprimir al revez            (primero imprimo y despues recorro para atras)
	   ObtenerMaximo:=max;                //      writeln
   end;                                   //      modulo
end;         

     
function  BuscarValor (v: vector; dimL, valor: integer): boolean;   // punto F
var
  ok:boolean;
begin
   ok := false;
   if (valor <> v[diml]) and (diml > 0) then begin
		ok := BuscarValor(v,diml-1,valor);
   end
   else begin
		if (diml <> 0) then
			ok := true;
   end;
   BuscarValor := ok;
end; 


procedure ImprimirDigitosRecursivo(num:integer); 
begin
  if (num<>0) then begin                      // si quisiera imprimir al revez, deberia poner el writeln antes que el modulo recursivo
    ImprimirDigitosRecursivo(num div 10);
    writeln(num mod 10);
    writeln('-');
   end;
end;

procedure ImprimirDigitos (v: vector; dimL: integer);   // punto G
begin   
     if (diml > 0) then begin
		ImprimirDigitosRecursivo(v[diml]);
        ImprimirDigitos(v, diml-1);
    end;  
end; 


var 
    dimL, suma, maximo, valor: integer; 
    v: vector;
    encontre: boolean;
Begin 
  CargarVector (v, dimL);   // punto A
  maximo:=0;
  writeln;
  if (dimL = 0) then writeln ('--- Vector sin elementos ---')
                else begin
                       ImprimirVector (v, dimL);   // punto B
                       ImprimirVectorRecursivo (v, dimL);   // punto C
                     end;
  writeln;
  writeln;                   
  suma:= Sumar(v, dimL);   // punto D
  writeln;
  writeln;
  writeln('La suma de los valores del vector es ', suma); 
  writeln;
  writeln;
  maximo:= ObtenerMaximo(v, dimL);   // punto E
  writeln;
  writeln;
  writeln('El maximo del vector es ', maximo); 
  writeln;
  writeln;
  write ('Ingrese un valor a buscar: ');
  read (valor);
  encontre:= BuscarValor(v, dimL, valor);   // punto F
  writeln;
  writeln;
  if (encontre) then writeln('El ', valor, ' esta en el vector')
                else writeln('El ', valor, ' no esta en el vector');
                
  writeln;
  writeln;
  ImprimirDigitos (v, dimL);   // punto G
end.
