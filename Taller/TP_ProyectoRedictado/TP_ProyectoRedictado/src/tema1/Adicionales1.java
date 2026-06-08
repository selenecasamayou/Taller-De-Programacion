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
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
public class Adicionales1 {
    
    
    public static void main (String [] args) {
        GeneradorAleatorio.iniciar();
        int DF = 5;   // piso
        int DC = 10;  // plaza
        String [] [] matriz;
        matriz = new String [DF] [DC];
        String patente;
        int numPiso, numPlaza;
        int pisoMax, canTotal;
        int cantMax = -1;
        
        for (int i=0; i<DF; i++) {   // inicializo
            for (int j=0; j<DC; j++) {
                matriz[i][j] = "Desocupada";
            }
        }
        
        patente = GeneradorAleatorio.generarString(7);
        while (!patente.equals("0") ) {    // PUNTO A
            numPiso = Lector.leerInt(); //1..5
            numPlaza = Lector.leerInt(); //1..10
            matriz[numPiso-1][numPlaza-1] = "Ocupada";
            
            patente = GeneradorAleatorio.generarString(7);
        }
        
        for (int i=0; i<DF; i++) {
            canTotal = 0;
            for (int j=0; j<DC; j++) {
                if (matriz[i][j].equals("Ocupada") ) {
                    canTotal ++;
                }
            }
            if (canTotal > cantMax) {
                cantMax = canTotal;
                pisoMax = i;
            }
        }
        
    } 
    
}
