/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
 *
 * @author Educación
 */
import PaqueteLectura.GeneradorAleatorio;

public class Ej04Hotel {
    
    
    public static void main (String [] args) {
        GeneradorAleatorio.iniciar();
        int N = (GeneradorAleatorio.generarInt(10) + 1);  // DF
        Hotel H = new Hotel (N);
        
        for (int i=0; i<10; i++) {
            String nombre = (GeneradorAleatorio.generarString(7));
            int dni = (GeneradorAleatorio.generarInt(4));
            int edad = (GeneradorAleatorio.generarInt(100));
            
            Cliente C = new Cliente (nombre, dni, edad);
          
            int Hab = (GeneradorAleatorio.generarInt(N) + 1);
            
            H.agregarCliente(C, Hab);
        }
        
            System.out.println(H.toString());
            double monto = (12);
            H.aumentarHabitacion(monto);
            System.out.println(H.toString());
        
        
    }
}
