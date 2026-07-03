{4.- Realizar un programa que lea números y que utilice un módulo recursivo que escriba el
equivalente en binario de un número decimal. El programa termina cuando el usuario ingresa
el número 0 (cero).
Ayuda: Analizando las posibilidades encontramos que: Binario (N) es N si el valor es menor a 2.
¿Cómo obtenemos los dígitos que componen al número? ¿Cómo achicamos el número para la
próxima llamada recursiva? Ejemplo: si se ingresa 23, el programa debe mostrar: 10111.
}

program binario;

   
   procedure DecimalBinario (var num, binario:integer);      // deberia ir dividiendo el numero por 2 e imprimiendo sus digitos (0 o 1)
   begin                                                 // podria tener una variabl
     if (num <> 0) then begin  
  //   num:= num div 2;
       if ((num div  2) = 1) then
         binario:= binario + 1
	   else
	     binario:= binario + 0;
	   num:= num div 2;
       DecimalBinario(num,binario);
     end;
   end;
   
   
var
   num, binario:integer;
begin
   writeln('ingrese un num');
   readln(num);
   while (num <> 0) do 
      binario:= 0;
      DecimalBinario(num,binario);
      writeln(num);
      readln(num);      
end.
