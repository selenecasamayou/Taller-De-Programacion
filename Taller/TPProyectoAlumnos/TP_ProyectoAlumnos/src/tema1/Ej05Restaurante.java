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

public class Ej05Restaurante {
    
    
    public static void main (String [] args) {
        int DF = 5, DC = 4;
        int i, j;
        int calificacion;
        int sumaTotal, canTotal;
        double prom = 0;
        int [] [] matriz;
        matriz = new int [DF] [DC];
        
        for (i=0; i<DF; i++) {
            for (j=0; j<DC; j++) {
                System.out.println("Ingrese calificacion del aspecto: " + j);
                calificacion = (Lector.leerInt());
                matriz [i] [j] = calificacion;
            }
        }

        for (j=0; j<DC; j++) { // PARA RECORRER LA FILA USO EL INDICE DE LA COLUMNA
            canTotal = 0;
            sumaTotal = 0;
            for (i=0; i<DF; i++) {
                sumaTotal = sumaTotal + matriz [0] [j];
                canTotal = canTotal + 1;
            }
            prom = sumaTotal/canTotal;
            System.out.println("El promedio del aspecto " + j + " es: " + prom);
        }
    }
    
    
}
