/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

import PaqueteLectura.GeneradorAleatorio;  // para generar al azar

public class Ej01Tabla2 {

    /**
     * Carga un vector que representa la tabla del 2
     */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int DF = 11;  
        int [] tabla2 = new int[DF]; // indices de 0 a 10
        int i;       
      /*  for (i=0;i<DF;i++) {   // CARGO UN VECTOR CON NUMEROS AL AZAR Y LOS MULTIPLICO POR 2
            tabla2[i] = (GeneradorAleatorio.generarInt(10) + 1);  // cargo con num al azar
            tabla2[i] = 2 * tabla2[i]; // lo multiplico por 2
            // tabla2[i] = (GeneradorAleatorio.generarInt(10) + 1) * 2; ES LO MISMO QUE LAS 2 DE ARRIBA
        }
        for (i=0; i<DF; i++)
            System.out.println(tabla2[i]);
        
        System.out.println("//////////////////////////////////");
        */
        i = (GeneradorAleatorio.generarInt(11) + 1);  // PRACITA 1 PUNTO 1 
        while (i != 11) {  // !=  =  <>
            tabla2[i] = 2 * i;  // guardo el numero en la posicion del numero, num 5 pos 5
            i = (GeneradorAleatorio.generarInt(11) + 1);
        }
        for (i=0; i<DF; i++)
            System.out.println(tabla2[i]);
    }
    
}
   /**/