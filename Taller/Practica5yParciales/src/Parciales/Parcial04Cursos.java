/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Parciales;

/**
 *
 * @author Educación
 */
import PaqueteLectura.GeneradorAleatorio;

public class Parcial04Cursos {
    
    public static void main (String [] args) {
        GeneradorAleatorio.iniciar();
        
        String nombreCurso = GeneradorAleatorio.generarString(12);
        double costoInscripcion = GeneradorAleatorio.generarDouble(300);
        String fecha = GeneradorAleatorio.generarString(8);
        int cantidadAlumnos = 20;
    
        CursoBasico CB = new CursoBasico (nombreCurso, costoInscripcion, fecha, cantidadAlumnos);
    
        String descripConocimientos = GeneradorAleatorio.generarString(15);
        nombreCurso = GeneradorAleatorio.generarString(12);
        costoInscripcion = GeneradorAleatorio.generarDouble(300);
        fecha = GeneradorAleatorio.generarString(8);
        cantidadAlumnos = 20;
    
        CursoAvanzado CA = new CursoAvanzado (descripConocimientos, nombreCurso, costoInscripcion, fecha, cantidadAlumnos);
        
        for (int i=0; i<3; i++) {
            String nombre = GeneradorAleatorio.generarString(8);
            int cantTareas = GeneradorAleatorio.generarInt(20);
            double sumaNotasTareas = GeneradorAleatorio.generarDouble(100);
    
            Alumno2 A = new Alumno2 (nombre, cantTareas, sumaNotasTareas);
            CB.agregarAlumno(A);
            
            nombre = GeneradorAleatorio.generarString(8);
            cantTareas = GeneradorAleatorio.generarInt(20);
            sumaNotasTareas = GeneradorAleatorio.generarDouble(100);
            
            A = new Alumno2 (nombre, cantTareas, sumaNotasTareas);
            CA.agregarAlumno(A);
        }
        
        CB.actualizarRendimiento("juan", 10);
        CA.actualizarRendimiento("jose", 5);
        System.out.println(CA.toString());
    }
    
}
