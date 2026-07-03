{El administrador de un edificio de oficinas tiene la información del pago de las expensas
de dichas oficinas. Implementar un programa con:
a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que
administra. Se deben cargar, para cada oficina, el código de identificación, DNI del
propietario y valor de la expensa. La lectura finaliza cuando llega el código de
identificación 0.
b) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por
código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos
vistos en la cursada.
c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
generado en b) y un código de identificación de oficina. En caso de encontrarlo, debe
retornar la posición del vector donde se encuentra y en caso contrario debe retornar 0.
Luego el programa debe informar el DNI del propietario o un cartel indicando que no
se encontró la oficina.
d) Un módulo recursivo que retorne el monto total acumulado de las expensas
}
program edificio;
const
   df = 300;
type
   oficina = record
     cod: integer;
     dni: integer;
     valorexpensa: real;
   end;
   
   vector = array [1..df] of oficina;
   
{   arbol = ^nodo
      dat
      hi
      hd
   end;
   
   vectorarbol = array [1..8] of arbol;   // para aceder v[i]^.dato.registro    v[i] = a   , hacer parcial del hospital
  }
  
  procedure LeerOficina (var o:oficina);
  begin
  //writeln('ingrese un codigo:');    preguntar si me bajarian puntos por poner lineas de mas para aclarar el ingreso de datos
    readln(o.cod);
    if (o.cod <> 0) then begin
      o.dni:= random(1000) + 1;
      o.valorexpensa:= random(10000) + 1;
    end;
  end;
   

  procedure CargarVector (var v:vector; dl:integer);
  var
    o:oficina;
  begin
    dl:= 0;
    LeerOficina(o);
    while (dl < df) and (o.cod <> 0) do begin
      dl:= dl + 1;
      v[dl]:= o;
      LeerOficina(o);
    end;
  end;


  procedure ImprimirVector(v:vector; dl:integer);  // no es necesario que sea recursivo si no me lo piden
  var
    i:integer;
  begin
    for i:= 1 to dl do begin
      writeln('El codigo es: ', v[dl].cod);
      writeln('El dni es: ', v[dl].dni);
      writeln('El valor de la espensa es: ', v[dl].valorexpensa);
    end;
  end;


  procedure OrdenSeleccion (var v:vector; dl:integer);
  var
    i, j, pos: integer;
    dato: oficina;
  begin
    for i:= 1 to dl -1 do begin
      pos:= i;
      for j:= i + 1 to dl do begin
        if (v[j].cod < v[pos].cod) then   // si el dato es menor, guardo la posicion del minimo
          pos:= j;
      end;
      dato:= v[pos];      //  guardo min
      v[pos]:= v[i];      //  cambio min por original
      v[i]:= dato;        //  pongo el min en orden 
    end;
  end;


  procedure BusquedaDicotomicaRecursiva(v:vector; dl, codigo, ini, fin: integer; var pos, dni:integer);
  var
    medio: integer;
  begin
    medio:= ((fin + ini) div 2);
    if (fin < ini) then
       pos:= -1
     else
        if (codigo = v[medio].cod) then begin
          pos:= medio;
          dni:= v[medio].dni;
        end
        else
           if (codigo < medio) then  // ini:= medio + 1
              BusquedaDicotomicaRecursiva(v, dl, codigo, medio+1, fin, pos, dni)
           else                      // fin:= medio - 1
              BusquedaDicotomicaRecursiva(v, dl, codigo, ini, medio-1, pos, dni);
  end;
  

  procedure BusquedaDicotomica (v:vector; dl, codigo:integer);  //Luego el programa debe informar el DNI del propietario o un cartel indicando que no se encontró la oficina.
  var
    ini, fin, pos, dni: integer;
  begin
    ini:= 1;
    fin:= dl;
    BusquedaDicotomicaRecursiva(v, dl, codigo, ini, fin, pos, dni);
    if (pos = 0) then 
      writeln('No se encontro la oficina')
    else
      writeln('El dni del propietario es: ', dni);
  end;


  function MontoTotalExpensas (v:vector; dl:integer): real;
  begin
     if (dl = 0) then 
       MontoTotalExpensas:= 0
     else
       MontoTotalExpensas:= MontoTotalExpensas(v,dl-1) + v[dl].valorexpensa;
  end;


var
   v:vector;
   dl, codigo:integer;
begin
   randomize;
   dl:=0;
   CargarVector(v, dl);   // punto A
   ImprimirVector(v, dl);      // NO IMPRIME NADA
   OrdenSeleccion(v, dl);   // punto B 
   readln(codigo);
   BusquedaDicotomica(v, dl, codigo);   // punto C  
   writeln('El monto total de las expensas es: ', MontoTotalExpensas(v,dl):2:2);   // punto D
end.
