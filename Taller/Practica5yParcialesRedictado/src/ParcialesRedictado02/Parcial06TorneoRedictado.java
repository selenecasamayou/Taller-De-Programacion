/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialesRedictado02;

/**
 *
 * @author Educación
 */
import PaqueteLectura.GeneradorAleatorio;
public class Parcial06TorneoRedictado {
    
    
    public static void main (String [] args) {
        GeneradorAleatorio.iniciar();
        
        Torneo T = new Torneo ("LEIF", 4, 8);
        
        for (int i=1; i<5; i++) {
            String nombre = GeneradorAleatorio.generarString(6);
            String nombreEquipo = GeneradorAleatorio.generarString(8);
            int cantGoles = GeneradorAleatorio.generarInt(10);
            Goleador G = new Goleador (nombre, nombreEquipo, cantGoles);
            
            int fecha = i;
            T.agregarGoleador(fecha, G);
            
            nombre = GeneradorAleatorio.generarString(6);
            nombreEquipo = GeneradorAleatorio.generarString(8);
            cantGoles = GeneradorAleatorio.generarInt(10);
            G = new Goleador (nombre, nombreEquipo, cantGoles);
            
            T.agregarGoleador(fecha, G);
            
        }
        
        System.out.println(T.toString());
        System.out.println(T.obtenerGoleadorMin(1));
        //System.out.println(T.obtenerCantGoleadores());
    }
    
    
}
