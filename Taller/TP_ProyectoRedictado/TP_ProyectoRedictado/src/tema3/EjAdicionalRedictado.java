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
public class EjAdicionalRedictado {
    
    
    public static void main (String [] args) {
        GeneradorAleatorio.iniciar();
        int cantAlumnos = 20;
        Concurso C = new Concurso(cantAlumnos);
        
        for (int i=0; i<5; i++) {
            String nombre = GeneradorAleatorio.generarString(5);
            int edad = GeneradorAleatorio.generarInt(100) + 1;
            String instrumento = GeneradorAleatorio.generarString(6);
            double puntaje = GeneradorAleatorio.generarDouble(10) + 1;
            Alumno A = new Alumno(nombre, edad, instrumento, puntaje);
            
            int genero = Lector.leerInt();
            C.inscribirAlumno(A, genero);
        }
        
       // C.asignarPuntaje(3, A, 9);
        System.out.println(C.obtenerPuntajeMax());
        System.out.println(C.toString());
    }
    
    
    
    
}
