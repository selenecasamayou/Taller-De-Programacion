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

public class Ej03Garita {
    
    
    public static void main (String [] args) {
        GeneradorAleatorio.iniciar();
        String nombre = (GeneradorAleatorio.generarString(7));
        int dni = (GeneradorAleatorio.generarInt(20));
        int edad = (GeneradorAleatorio.generarInt(70));
        
        Persona P = new Persona (nombre, dni, edad);
        
        String tarea= (GeneradorAleatorio.generarString(6)); 
        
        Trabajador T = new Trabajador (tarea, nombre, dni, edad);
        
        System.out.println(P.toString());
        System.out.println(T.toString());
    }
}
