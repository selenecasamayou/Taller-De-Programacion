{2.- El administrador de un edificio de oficinas cuenta, en papel, con la información del pago de
las expensas de dichas oficinas.
Implementar un programa que invoque a módulos para cada uno de los siguientes puntos:
A) Genere un vector, sin orden, con a lo sumo las 300 oficinas que administra. De cada oficina
se ingresa el código de identificación, DNI del propietario y valor de la expensa. La lectura
finaliza cuando se ingresa el código de identificación -1, el cual no se procesa.
B) Ordene el vector, aplicando el método de inserción, por código de identificación de la
oficina.
C) Ordene el vector aplicando el método de selección, por código de identificación de la oficina
}

program oficinas;
const
   df=300;
type
  oficina = record
    cod:integer;
    dni:integer;
    valorexp:integer;
  end;
  
  vector = array [1..df] of oficina;
  
  
  procedure LeerOficina ( var o:oficina);
  begin
    readln(o.cod);
    if (o.cod <> -1) then begin
      o.dni:=random(10000);
      o.valorexp:=random(1000);
    end;
  end;

  procedure GenerarVector (var v:vector; var dl:integer);
  var
    o:oficina;
  begin
    dl:=0;
    LeerOficina(o);
    while (dl<df) and (o.cod <> -1) do begin
      dl:= dl + 1;
      v[dl]:= o;
      LeerOficina(o);
    end;
  end;


  procedure OrdenINSERCION (var v:vector; dl:integer);
  var
    i, j:integer;
    actual:oficina;
  begin
    for i:= 2 to dl do begin    // desde recorrido 2
       actual:= v[i];
       j:= i-1;
       while (j > 0) and (v[j].cod > actual.cod) do begin
         v[j+1]:= v[j];      // hago corrimiento
         j:= j-1;
       end;
       v[j+1]:= actual;      // ubico el elemento
    end;
  end;
  

  procedure OrdenSELECCION (var v:vector; dl:integer);
  var
    i, j, pos:integer;
    dato:oficina;
  begin
    for i:= 1 to dl-1 do begin
      pos:= i;   // lo copio
      for j:= i+1 to dl do begin
         if (v[j].cod < v[pos].cod) then  // si el dato es menor
            pos:= j;             // guardo posicion del minimo   
      end; 
      dato:= v[pos];       //  guardo el minimo
      v[pos]:= v[i];       //  cambio el minimo por el original
      v[i]:= dato;         //  pongo el minimo en orden con un auxiliar
    end;  
  end;

  procedure ImprimirVector(v:vector; dl:integer);
  var
    i:integer;
  begin
    for i:= 1 to dl do 
      writeln(v[i].cod);
      writeln(v[i].dni);
      writeln(v[i].valorexp);
  end;

var
   v:vector;
   dl:integer;

begin
   GenerarVector(v,dl);    // punto A
   OrdenINSERCION(v,dl);   // punto B
   OrdenSELECCION(v,dl);   // punto C
   ImprimirVector(v,dl);
end.
