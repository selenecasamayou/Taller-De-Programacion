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
public class Parcial07Universidad {
    
    
    public static void main (String [] args) {
        
        Universidad U = new Universidad (200);
        Alumno A = new Alumno ("Joquin", "Ruiz Diaz", 1111);
        Examen E = new Examen(5, 2001, 9, "trabajo", A);
        U.agregarExamen(2, E);
        A = new Alumno ("Juan Carlos", "Casamayou", 5555);
        E = new Examen(2, 2010, 7, "escrito", A);
        U.agregarExamen(6, E);
        A = new Alumno ("Carla", "Martinez", 4444);
        E = new Examen(6, 2006, 2, "trabajo", A);
        U.agregarExamen(2, E);
        A = new Alumno ("Lola", "Lopez", 9999);
        E = new Examen(8, 2016, 4, "oral", A);
        U.agregarExamen(10, E);
        
        System.out.println(U.toString(2));
        System.out.println(U.añoMasExaenes("escrito"));
        System.out.println(U.examenesRendidos(1111, 2));
        
    }
    
    
    
}
