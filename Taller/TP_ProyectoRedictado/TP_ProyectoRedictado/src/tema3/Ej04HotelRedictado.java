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
import PaqueteLectura.Lector;
public class Ej04HotelRedictado {
    
    
    public static void main (String [] args) {
        GeneradorAleatorio.iniciar();
        int cantHabitaciones = 4; 
        Hotel H = new Hotel (cantHabitaciones);
        
        for (int i=0; i<4; i++) {
            String nombre = GeneradorAleatorio.generarString(5);
            int DNI = GeneradorAleatorio.generarInt(1000);
            int edad = GeneradorAleatorio.generarInt(100) + 1;
            Persona P = new Persona(nombre, DNI, edad);
            
            int Hab = Lector.leerInt();
            
            H.agregarCliente(P, Hab);
        }
        
        System.out.println(H.toString());
        double precioNuevo = Lector.leerDouble();
        H.aumentarPrecio(precioNuevo);
        System.out.println(H.toString());
    }
    
    
}
