/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

/**
 *
 * @author Educación
 */
import PaqueteLectura.Lector;
public class Ej01Redictado {
    
    public static void main (String [] args) {
        String nombre = Lector.leerString();
        int dni = Lector.leerInt();
        int edad = Lector.leerInt();        
            
        Persona P = new Persona (nombre, dni, edad);
        System.out.println(P.toString());
    }
    
}
