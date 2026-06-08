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

public class Ej04Oficinas {
    
    
    public static void main(String[] args) {
        int DF = 8;
        int DC = 4;
        int i, j;
        int [] [] matriz;
        int numPiso, numOficina;  // piso = fila, oficina = columna
        matriz = new int [8][4];
        
        for (i=0; i < DF; i++) {
            for (j=0; j<DC; j++)
                matriz [i][j] = 0;
        }
        
        numPiso = (Lector.leerInt());
        while (/*numPiso < DF &&*/ numPiso != 9) { // despues preguntar por numpiso y numoficina, pregunto si es menor
                numOficina = (Lector.leerInt());
                matriz [numPiso - 1] [numOficina - 1] = matriz [numPiso - 1] [numOficina - 1] + 1;  //  GUARDA + 1 EN DONDE ENTRA LA PERSONA
                numPiso = (Lector.leerInt());
        }
        
        for (i=0; i <= DF; i++) {
            for (j=0; j<=DC; j++)
                System.out.println("En el piso: " + i + " Oficina: " + j + " Concurrieron " + matriz[i][j] + " Personas");
        }
    }       
}            
       

