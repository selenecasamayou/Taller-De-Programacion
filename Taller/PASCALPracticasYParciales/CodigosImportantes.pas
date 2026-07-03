
     MINIMOS Y MAXIMOS

procedure ObtenerMinimo (a:arbol; var min:integer; var nombremin:cadena15; var edadmin:rangoEdad);   // es un procedimiento porque o se devuelven dos cosas o porque quiere informar un minimo que no es el criterio de orden
                                                                                                        osea busca una edad minimo y esta ordenado por codigo
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
  
  
  function ObtenerMinimo (a: arbol): integer;  // es una function porque esta buscando el codigo de producto y esta ordenado por codigo de producto
                                               // osea esta buscando un minimo que es el criterio de orden
  begin
    if (a = nil) then 
       ObtenerMinimo:= 9999
    else 
       if (a^.HI = nil) then 
           ObtenerMinimo:= a^.dato.codigo
       else 
           ObtenerMinimo:= ObtenerMinimo (a^.HI)
  end;
  
  
  function BuscarMinimoRecursivo(l: lista): integer;  // PUNTO D
	var
		min: integer;
	begin
		if (l <> nil) then begin
			min:= BuscarMinimoRecursivo(l^.sig);  // comparo con mi nodo siguiente
			if (l^.dato < min) then 
				BuscarMinimoRecursivo:= l^.dato  // preguntar para que me expliquen porque no entendi bien
			else
				BuscarMinimoRecursivo:= min;
		end
		else
			BuscarMinimoRecursivo:= 9999;  // si no tengo nodo siguiente, este toma el valor 9999
	end;
  
  
  function ObtenerMaximo (a:arbol; var max:integer): integer;  // esta dentro de un procedimiento donde a max se le da el valor -1 y se informa el resultado
  begin
    if (a <> nil) then
      CantVendidaMax:= CantVendidaMax(a^.HI, max)
    else
      if (a^.dato.cantvendidastotal > max) then begin
        max:= a^.dato.cantvendidastotal;
        CantVendidaMax:= a^.dato.cod;
      end;
    CantVendidaMax:= CantVendidaMax(a^.HI, max);   
  end;
  
  
  procedure ObtenerMaximoRecursivo(a2: arbol2; var codmax, cantmax: integer);
	begin
		if (a2 <> nil) then begin
			ObtenerMaximoRecursivo(a2^.HI, codmax, cantmax);
			if (a2^.dato.cant > cantmax) then begin
				cantmax:= a2^.dato.cant;
				codmax:= a2^.dato.cod;
			end;
			ObtenerMaximoRecursivo(a2^.HD, codmax, cantmax);
		end;	
	end;
  
  
  procedure ObtenerNodoMaximo (a3: arbol3; var max2, codnodomax: integer);  // Accede a cada nodo del arbol y llama a una funcion para contar
  var                                                                       //  la cantidad de nodos que tiene esa lista, a3^.dato.LV.dato
    cantmax: integer;
  begin
    if (a3 <> nil) then begin
      cantmax:= ContarCantVentas(a3^.dato.LV);   // cantidad de ventas de toda la lista 
      if (cantmax > max2) then begin
        max2:= cantmax;
        codnodomax:= a3^.dato.cod;
      end;
      ObtenerNodoMaximo(a3^.HI, max2, codnodomax);
      ObtenerNodoMaximo(a3^.HD, max2, codnodomax);
    end;
  end;
  
  
  
  
		MAXIMO / MINIMO ACCEDIENDO DIRECTAMENTE AL ULTIMO NODO
	
	
	
  function ObtenerMinimo(a: arbol): integer;  // PUNTO C , recorre solo por el HI, por el criterio de orden
	begin
		if (a = nil) then
			ObtenerMinimo:= 9999
		else
			if (a^.HI = nil) then // llegue al ultimo (minimo)
				ObtenerMinimo:= a^.dato.cod
			else
				ObtenerMinimo:= ObtenerMinimo(a^.HI); // sino avanzo
	end;
	
	
  procedure ObtenerPaqueteMaximoRecursivo(a: arbol; var paqueteMax: paquete);  // PUNTO B
	begin
		if (a <> nil) then  //if (a^.dato.peso > pesoMax) then begin
			if (a^.HD = nil) then // significa que llegue al final
				//pesoMax:= a^.dato.peso;
				paqueteMax:= a^.dato
			else
				ObtenerPaqueteMaximoRecursivo(a^.HD, paqueteMax)
	end;
  
	
	procedure ObtenerCodMaximo(a: arbol; var regMax: reg);
	begin
		if (a <> nil) then begin
			if (a^.HD = nil) then begin   // llegue al ultimo
				regMax.codMax:= a^.dato.cod;
				regMax.stockMax:= a^.dato.stock;
			end
			else
				ObtenerCodMaximo(a^.HD, regMax);
		end
		else begin
			regMax.codMax:= 0;
			regMax.stockMax:= 0;
		end;
	end;
	
		
  
 
       BUSQUEDAS
  
  
  
  
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
  
  
  
function CalcularVentas (a1:arbol1; fecha:integer): integer;   // reciba el árbol generado en i. y una fecha y retorne la cantidad total de productos vendidos en la fecha recibida.
  begin
     if (a1 = nil) then   // caso base
        CalcularVentas:= 0
     else begin
        if(a1^.dato.fecha = fecha) then begin
           cant:= a1^.dato.cantuni;
           CalcularVentas:= CalcularVentas(a1^.HI, fecha) + CalcularVentas(a1^.HD, fecha) + a1^.dato.cantuni;;
        end
        else
           CalcularVentas:= CalcularVentas(a1^.HI, fecha) + CalcularVentas(a1^.HD, fecha);
     CalcularVentas:= cant;
     end;
  end;  
  
  
  function BuscarPatente (a1:arbol1; patente:integer): integer;   // busqueda acotada
   begin
     if (a1 = nil) then
       BuscarPatente:= 0
     else begin
       if (a1^.dato.patente = patente) then
         BuscarPatente:= a1^.dato.modelo
       else
         if (a1^.dato.patente > patente) then
           BuscarPatente(a1^.HI, patente)
         else
           BuscarPatente(a1^.HD, patente);
      end;
   end;
	
		
		
		 BUSQUEDAS RECURSIVAS VECTORES
		 
		 
		 
	procedure ObtenerMaximoRecursivo(v: vector; var cantAplazosMax, codMax: integer; diml: integer);  // PUNTO C
	begin
		if (diml <> 100) then begin       // como va de 101 a 135, si llega a 100 termino
			if (v[diml] > cantAplazosMax) then begin
				cantAplazosMax:= v[diml];
				codMax:= diml;
			end;
			ObtenerMaximoRecursivo(v, cantAplazosMax, codMax, diml-1);
		end;	
	end;	 
	
	
	function BuscarCategoria(v: vector; unaCantEntregas: integer; diml: integer): boolean;  // PUNTO C
	begin
		if (diml = 0) then
			BuscarCategoria:= false
		else
			if (v[diml] = unaCantEntregas) then
				BuscarCategoria:= true
			else
				BuscarCategoria:= BuscarCategoria(v, unaCantEntregas, diml-1)
	end;	
	
  
      ORDENAR VECTORES
    
  
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
  
  
  
     BUSQUEDA EN VECTORES
  
  

  Procedure BusquedaDicotomicaRecursiva (v: vector; ini, fin, dato:integer; var pos: integer);
   var
	medio:integer;
   begin
     medio:= ((fin + ini) div 2);
     if (fin < ini) then
       pos:= -1
     else
       if (v[medio] = dato) then
		pos:= medio
       else
         if (v[medio] > dato) then
           BusquedaDicotomicaRecursiva(v,ini, medio-1, dato, pos)
         else
           BusquedaDicotomicaRecursiva(v,medio+1, fin, dato, pos);
   end;
         
     CUANDO TENES UN REGISTRO SOLO PARA LERR Y ALMACENAS EN OTRO LA INFO
         
   procedure LeerVenta (var v:venta);
  begin
    readln(v.codigoventa);
    if (v.codigoventa <> -1) then begin
       v.codigoproducto:= random(100) + 1;
      // writeln(v.codigoproducto);
       v.cantvendidas:= random(15) + 1;
       v.precioxuni:= random(1000) + 1;
    end;
  end;
  
  
  procedure InsertarElemento (var a:arbol; var p:producto;  v:venta);
  begin
    if (a = nil) then begin  // caso base
      new(a);
      p.cod:= v.codigoproducto;     // PRIMERO CARGA REGISTRO
      p.cantvendidastotal:= v.cantvendidas;    // es la misma porque es el primero
      p.montotal:= v.precioxuni * v.cantvendidas;    //  en la primera carga se ponen los mismos datos que en el registro, son como la base
      a^.dato:= p;
      a^.HI:= nil;
      a^.HD:= nil;
    end
    else
      if (a^.dato.cod = v.codigoproducto) then begin
        a^.dato.cantvendidastotal:= a^.dato.cantvendidastotal + v.cantvendidas;  // le voy sumando las ventas con ese codigo al producto
        a^.dato.montotal:=  a^.dato.montotal + (v.precioxuni * v.cantvendidas);
      end
      else begin
        if (v.codigoproducto < a^.dato.cod) then 
          InsertarElemento(a^.HI, p, v)
        else
          InsertarElemento(a^.HD, p, v);
      end;
  end;
  
//------------------------------------------------------------------------------------------------//
  
         OTRA MANERA
  
  procedure LeerVenta(var v: venta);
	begin
		readln(v.codVenta);
		if (v.codVenta <> -1) then begin
			v.codProd:= random(100);
			v.cant:= random(1000);
			v.precio:= random(500);
		end;
	end; 
	
	
	procedure CargarProducto(var p:producto; var v: venta);
	begin
		LeerVenta(v);
		p.cod:= v.codProd;
		p.cantVendida:= v.cant;
		p.montoTotal:= v.cant * v.precio;
	end;
  
  procedure InsertarElemento(var a: arbol; p: producto);
	begin
		if (a = nil) then begin
			new(a);
			a^.dato:= p;
			a^.HI:= nil;
			a^.HD:= nil;
		end
		else begin
			if (p.cod = a^.dato.cod) then begin  // si es el mismo producto, se actualizan sus campos
				a^.dato.cantVendida:= a^.dato.cantVendida + 1; // sino + v.cant
				a^.dato.montoTotal:= a^.dato.montoTotal + p.montoTotal; // (v.cant * v.precio) 
			end
			else
				if (p.cod < a^.dato.cod) then
					InsertarElemento(a^.HI, p)
				else
					InsertarElemento(a^.HD, p)
		end;			
	end;  
  
  procedure CargarArbol(var a: arbol);  // PUNTO A
	var
		p: producto;
		v: venta;
	begin
		a:= nil;
		writeln('Ingrese un codigo de venta');
		CargarProducto(p, v);
		while (v.codVenta <> -1) do begin
			InsertarElemento(a, p);
			CargarProducto(p, v);
		end;
	end;
  
  
	   BUSQUEDA ENTRE 2 COTAS
         
         
  function ObtenerMontoTotal (a:arbol; cotainf, cotasup: integer): real;
  begin
    if (a = nil) then
      ObtenerMontoTotal:= 0   // caso base
    else begin
      if (a^.dato.cod > cotainf) then begin
        if (a^.dato.cod < cotasup) then
          ObtenerMontoTotal:= ObtenerMontoTotal(a^.HI, cotainf, cotasup) + ObtenerMontoTotal(a^.HD, cotainf, cotasup) + a^.dato.montotal
        else
          ObtenerMontoTotal:= ObtenerMontoTotal(a^.HI, cotainf, cotasup);
      end
      else
        ObtenerMontoTotal:= ObtenerMontoTotal(a^.HD, cotainf, cotasup);
    end;
  end;       
         
  
  procedure ObtenerLista (a: arbol; var l: lista; cotaInf, cotaSup: real);
	begin
		if (a <> nil) then	begin
			if (a^.dato.peso > cotaInf) then
				if (a^.dato.peso < cotaSup) then begin
					ObtenerLista(a^.HI, l, cotaInf, cotaSup);
					AgregarAdelante(l, a^.dato);
					ObtenerLista(a^.HD, l, cotaInf, cotaSup);
				end	
				else
					ObtenerLista(a^.HI, l, cotaInf, cotaSup)
			else
				ObtenerLista(a^.HD, l, cotaInf, cotaSup);
		end;
	end;
         
  
  procedure ObtenerMontoTotalEntreDosCodigos(a:arbol);
  var
    cotainf, cotasup: integer;
    montotal: real;
  begin
    writeln('ingrese el rango');
    readln(cotainf);
    readln(cotasup);
    montotal:= ObtenerMontoTotal(a, cotainf, cotasup);
    writeln('El monto entre el codigo ', cotainf, ' y el codigo ', cotasup, ' es: ', montotal:2:2);
  end;       

	
	       LEER CON VAR DE VECTOR	
		
	
	procedure LeerAtencion(var at: atencion);
	var
		v: array[1..6] of char = ('A', 'B', 'C', 'D', 'E', 'F');
	begin
		readln(at.dni);
		if (at.dni <> 0) then begin
			at.matricula:= random(1000);
			at.dia:= random(30) + 1;
			at.diagnostico:= v[random(6) + 1];
		end;
	end;
	
	
	
