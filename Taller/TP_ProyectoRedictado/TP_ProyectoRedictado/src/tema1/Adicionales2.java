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
import PaqueteLectura.GeneradorAleatorio;

public class Adicionales2 {
    
   
    
    
    public static void main (String [] args) {
        GeneradorAleatorio.iniciar();
        int DF = 5;
        int DC = 10;
        String matriz [] [];
        matriz = new String [DF] [DC];
        String titulo;
        int peso;
        int vecDL [];
        vecDL = new int [10];
        int e;
        
        for (int i=0; i<10; i++) {
            vecDL [i] = 0;
        }
        
        peso = Lector.leerInt();
        while (peso != 0) {
            titulo = GeneradorAleatorio.generarString(3);
            e = peso/300;
            if (vecDL[e] != 10) {
                matriz [e] [vecDL[e]] = titulo;
                vecDL[e]++;
            }
            peso = Lector.leerInt();
        }
        
        for (int i=0; i<DF; i++) {
            for (int j=0; i<vecDL[i]; j++) {
                System.out.println("Titulo: " + matriz[i][j]);
            }
        }
        
        
    }
    
}
