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

public class Ej01LeerPersona {
    
    
    public static void main (String [] args) {
        
        String nom;
        int dni;
        int edad;
        nom = (Lector.leerString());
        dni = (Lector.leerInt());
        edad = (Lector.leerInt());
        
       // Persona p = new Persona ("Juan", 30, 25);
       Persona p = new Persona (nom, dni, edad);
    
       System.out.println(p.toString());
             
    }       
}
