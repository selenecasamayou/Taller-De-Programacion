/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialesReidctado03;

/**
 *
 * @author Educación
 */
import PaqueteLectura.GeneradorAleatorio;
public class Parcial11EscuelaInglesRedictado {
    
    
    public static void main (String [] args) {
        GeneradorAleatorio.iniciar();
        
        Online O = new Online("Pepito", 300, 1000, 30);
         
        Presencial P = new Presencial("Jose", 500, 2000, 40);
        
        Curso2 C2 = new Curso2("Ingles", O, P);
        
        for (int i=0; i<10; i++) {
            int DNI = GeneradorAleatorio.generarInt(1000) + 100;
            String nombre = GeneradorAleatorio.generarString(5);
            String residencia = GeneradorAleatorio.generarString(7);
            Alumno2 A2 = new Alumno2(DNI, nombre, residencia);
            O.agregarAlumno(A2);
            
            DNI = GeneradorAleatorio.generarInt(1000) + 100;
            nombre = GeneradorAleatorio.generarString(5);
            A2 = new Alumno2(DNI, nombre, "La Plata");
            P.agregarAlumno(A2);
        }
     
        System.out.println(C2.toString());
        System.out.println(C2.isRentable());
        
    }
    
    
}
