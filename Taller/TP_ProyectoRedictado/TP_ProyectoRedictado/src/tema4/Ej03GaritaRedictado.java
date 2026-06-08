/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author Educación
 */
import PaqueteLectura.GeneradorAleatorio;
public class Ej03GaritaRedictado {
    
    
    public static void main (String [] args) {
        GeneradorAleatorio.iniciar();
        
        String nombre = GeneradorAleatorio.generarString(6);
        int DNI = GeneradorAleatorio.generarInt(1000);
        int edad = GeneradorAleatorio.generarInt(100) + 1;
        
        Persona P = new Persona(nombre, DNI, edad);
        
        nombre = GeneradorAleatorio.generarString(6);
        DNI = GeneradorAleatorio.generarInt(1000);
        edad = GeneradorAleatorio.generarInt(100) + 1;
        String tarea = GeneradorAleatorio.generarString(8);
        
        Trabajador T = new Trabajador(tarea, nombre, DNI, edad);
        
        System.out.println(P.toString());
        System.out.println(T.toString());
    }
    
    
}
