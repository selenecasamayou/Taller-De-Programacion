{A. Un módulo que lea información de los finales rendidos por los alumnos de la Facultad de
Informática y los almacene en una estructura de datos. La información que se lee es legajo,
código de materia, fecha y nota. La lectura de los alumnos finaliza con legajo 0. La estructura
generada debe ser eficiente para la búsqueda por número de legajo y para cada alumno deben
guardarse los finales que rindió en una lista.
B. Un módulo que reciba la estructura generada en a. y retorne la cantidad de alumnos con
legajo impar.
C. Un módulo que reciba la estructura generada en a. e informe, para cada alumno, su legajo y
su cantidad de finales aprobados (nota mayor o igual a 4).
D. Un módulo que reciba la estructura generada en a. y un valor real. Este módulo debe
retornar los legajos y promedios de los alumnos cuyo promedio supera el valor ingresado.
}
program alumnos;
type
   finale = record
     codmateria: integer;
     fecha: integer;
     nota: integer;
   end;
   
   lista = ^nodo1;
   nodo1 = record
     dato: finale;
     sig: lista;
   end;
   
   alumno = record
     legajo: integer;
     finales: lista;
   end;
   
   arbol = ^nodo;
   nodo = record
     dato: alumno;
     HI: arbol;
     HD: arbol;
   end;
   
   
   
   procedure LeerFinal(var f:finale);
   begin
     f.codmateria:= random(100);
     f.fecha:= random (30) + 1;
     f.nota:= random(10) + 1;
   end;
   
   
   procedure AgregarAdelante(var l:lista; f:finale);
   var
     aux:lista;
   begin
     new(aux);
     aux^.dato:= f;
     aux^.sig:= l;
     l:= aux;
   end;
   
   
  procedure InsertarElemento(var a:arbol; leg:integer; f:finale);
  begin
    if (a = nil) then begin 
      new(a);
      a^.dato.legajo:= leg;
      a^.dato.finales:= nil;
      a^.HI:= nil;
      a^.HD:= nil;
      AgregarAdelante(a^.dato.finales, f);
    end
    else begin
      if(leg < a^.dato.legajo) then
        InsertarElemento(a^.HI, leg, f)
      else begin
        if(leg > a^.dato.legajo) then  
          InsertarElemento(a^.HD, leg, f)
       else
          AgregarAdelante(a^.dato.finales, f);
      end;
    end;
  end;
   
     
  procedure CargarArbol (var a:arbol);
  var
    al:alumno;
    f:finale;
  begin
    a:= nil;
    writeln('ingrese un legajo:');
    readln(al.legajo);
    while (al.legajo <> 0) do begin
      LeerFinal(f);
      InsertarElemento(a, al.legajo, f);
      readln(al.legajo);
    end;
  end; 
   
   
   procedure ImprimirListaRecursiva(L:lista);
   begin
     if (L <> nil) then begin
       writeln('Codigo de materia: ', L^.dato.codmateria);
       writeln('Fecha: ', L^.dato.fecha);
       writeln('Nota: ', L^.dato.nota);
       ImprimirListaRecursiva(L^.sig);
     end;
   end;
   
   
   procedure ImprimirArbol(a:arbol);
   begin
     if (a <> nil) then begin
       ImprimirArbol(a^.HI);
       writeln('Legajo: ', a^.dato.legajo);
       ImprimirListaRecursiva(a^.dato.finales);
       ImprimirArbol(a^.HD);
     end;
   end;
   
   
   function cumple (leg:integer): boolean;
   begin
     if (leg mod 3 = 0) then
       cumple:= true
     else
       cumple:= false;
   end;
   
   
   
   function CantLegajo (a:arbol): integer;
   begin
     if (a <> nil) then  // caso base
       CantLegajo:= 0
     else begin
       if (cumple(a^.dato.legajo)) then   // si cumple le sumo 1
         CantLegajo:= CantLegajo(a^.HI) + CantLegajo(a^.HD) + 1
       else
         CantLegajo:= CantLegajo(a^.HI) + CantLegajo(a^.HD);  // sino avanzo
     end;    
   end;
   
   
   function RecorrerListaConCondicion(L:lista): integer;
   begin
     if (L <> nil) then begin
       if (L^.dato.nota >= 4) then
         RecorrerListaConCondicion:= RecorrerListaConCondicion(L^.sig) + 1
       else  
         RecorrerListaConCondicion(L^.sig);
     end;
   end;
   
   
   procedure ImprimirArbolC(a:arbol);
   begin
     if (a <> nil) then begin
       ImprimirArbolC(a^.HI);
       writeln('Legajo: ', a^.dato.legajo);
       writeln('Cantidad de finales aprobados: ', RecorrerListaConCondicion(a^.dato.finales));
       ImprimirArbolC(a^.HD);
     end;
   end;
   
   
   procedure RecorrerListaFinales (L:lista; var cantfinales: integer; var sumadenotas: real);
   begin
     if (L <> nil) then begin
       cantfinales:= cantfinales + 1;
       sumadenotas:= sumadenotas + L^.dato.nota;
       RecorrerListaFinales(L^.sig, cantfinales, sumadenotas);
     end;
   end;
   
   
   function ObtenerProm (L:lista): real;   // Calculo un promedio
   var
     cantfinales: integer;
     sumadenotas: real;
   begin
     RecorrerListaFinales(L, cantfinales, sumadenotas);  // calculo la cantidad total y suma total
     ObtenerProm:= (sumadenotas/ cantfinales);
   end;
   
   
   procedure SuperaPromedio(a:arbol; prom:real);   // Calculo promedio maximo
   var
     promedio:real;
   begin
     if (a <> nil) then begin  // caso base
       promedio:= ObtenerProm(a^.dato.finales);
       if (promedio > prom) then
         writeln('El alumno con lejago: ', a^.dato.legajo, ' y promedio: ', promedio, ' supera el dato ingresado');
       SuperaPromedio(a^.HI, prom);
       SuperaPromedio(a^.HD, prom);
     end;
   end;
   
   
var
   a: arbol;
   prom:real;
begin
   randomize;
   CargarArbol(a);   // punto A
 //ImprimirArbol(a);
   writeln('La cantidad de alumnos con legajo impar es: ', CantLegajo(a));  // punto B
   ImprimirArbolC(a);   // punto C    FUNCIONA RARO
   readln(prom);
   SuperaPromedio(a,prom);  // punto D FUNCIONA RARO POR CULPA DEL C
end.
