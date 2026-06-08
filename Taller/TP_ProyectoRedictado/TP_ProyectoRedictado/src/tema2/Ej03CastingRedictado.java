/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

/**
 *
 * @author Educación
 */
import PaqueteLectura.GeneradorAleatorio;
public class Ej03CastingRedictado {
    
    
    public static void main (String [] args) {
        GeneradorAleatorio.iniciar();
        int DF = 5;
        int DC = 8;
        int DLF = 0, DLC = 0;
        Persona [] [] matriz;
        matriz = new Persona [DF] [DC];
        
        String nombre = GeneradorAleatorio.generarString(5);
        int dni, edad;
        
        while (!(nombre.equals("ZZZ")) && DLF < DF) {   // PUNTO A
            DLC = 0;
            while (!(nombre.equals("ZZZ")) && DLC < DC) {
                dni = GeneradorAleatorio.generarInt(1000);
                edad = GeneradorAleatorio.generarInt(100) + 1;
                Persona P = new Persona (nombre, dni, edad);
                matriz [DLF][DLC] = P;
                DLC++;
                nombre = GeneradorAleatorio.generarString(5);
            } 
            //if (DLC == DC) {
              //  DLF++;
            DLF++;
        }
        
        for (int i=0; i<DLF-2; i++) {   // recorro todas las filas que esten completas
            for (int j=0; j<DC; j++) {  // le resto 2 porque como siempre sumo hay una de mas
                System.out.println("El nombre de la persona es: " + matriz[i][j].getNombre());
            }
        }
        //System.out.println(DLF);
        for (int j=0; j<DLC; j++) {  // le resto 1 porque se carga hasta 5, pero el vector va de 0 a 4
            System.out.println(j);
            System.out.println("El nombre de la persona es: " + matriz[DLF-1][j].getNombre());
        }
    }
    
    
}
