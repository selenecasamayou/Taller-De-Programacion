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
import PaqueteLectura.Lector;
public class EJ04Castingg2Redictado {
    
    
    public static void main (String [] args) {
        GeneradorAleatorio.iniciar();
        int DF = 5;  // dia
        int DC = 8;  // turno
        Persona [][] matriz;
        matriz = new Persona [DF][DC];
        
        int [] vector;
        vector = new int [DC];
        
        String nombre = GeneradorAleatorio.generarString(3);
        int dni, edad, dia, entrevistados = 0;
        
        for (int i=0; i<DC; i++) {  // inicializo vector contador
            vector[i] = 0;
        }
        
        while (!(nombre.equals("ZZZ")) && entrevistados < 40) {  // PUNTO A
            dia = Lector.leerInt();
            if (vector[dia-1] < DC) {
                dni = GeneradorAleatorio.generarInt(100);
                edad = GeneradorAleatorio.generarInt(100) + 1;
                Persona P = new Persona (nombre, dni, edad);
                matriz [dia-1][vector[dia-1]] = P;
                vector[dia]++;
                entrevistados++;
            }
            else
                System.out.println("El dia: " + dia + " esta ocupado");
            nombre = Lector.leerString();
        }
        
        for (int i=0; i<DF; i++) {
            for (int j=0; j<vector[i]; j++) {
                System.out.println("Cant de entrevistados: " + vector[i]);
                System.out.println(matriz[i][j].getNombre());
            }
        }
        
    }
    
}
