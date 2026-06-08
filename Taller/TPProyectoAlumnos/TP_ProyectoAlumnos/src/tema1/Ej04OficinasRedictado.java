/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

/**
 *
 * @author Educación
 */
import PaqueteLectura.Lector;

public class Ej04OficinasRedictado {
    
    
    public static void main (String [] args) { 
        int DF = 8;   //  piso 
        int DC = 4;   //  oficina
        int [] [] matriz;
        int numPiso, numOficina;
        matriz = new int [DF] [DC];
        
        for (int i=0; i<DF; i++) {   // inicializo matriz
            for (int j=0; j<DC; j++) {
                matriz [i] [j] = 0;
            }
        }
        
        numPiso = (Lector.leerInt());
        
        while (numPiso != 9) {
            numOficina = (Lector.leerInt());
            if (numOficina <5) {
                matriz [numPiso-1] [numOficina-1] += 1;
                numPiso = (Lector.leerInt());
            }
            else
                System.out.println("num invalido");
        }
        for (int i=0; i<DF; i++) {
            for (int j=0; j<DC; j++) {
                System.out.println("Piso: " + i + " Oficina: " + j + " Cant Personas: " + matriz[i][j]);
            }
        }
        
        
    }
    
    
}
