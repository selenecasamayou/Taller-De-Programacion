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

public class Ej05RestauranteRedictado {
    
    
    public static void main (String [] args) {
        int DF = 5;  // clientes
        int DC = 4;  // puntaje
        int calificacion;
        int [] [] matriz;
        matriz = new int [DF] [DC];
        int sumaTotal, canTotal;
        double promedio;
        
        for (int i=0; i<DF; i++) {
            for (int j=0; j<DC; j++) {
                matriz [i] [j] = 0;
            }
        }
        for (int i=0; i<DF; i++) {
            for (int j=0; j<DC; j++) {
                calificacion = (Lector.leerInt());
                matriz [i] [j] = calificacion;
            }
        }
        
        for (int j=0; j<DC; j++) {
            sumaTotal= 0;
            canTotal = 0;
            for (int i=0; i<DF; i++) {
                canTotal += 1;
                sumaTotal += matriz [1] [j];
            }
            promedio = sumaTotal/canTotal;
            System.out.println("Promedio: " + promedio);
        }
        
    }
    
    
}
