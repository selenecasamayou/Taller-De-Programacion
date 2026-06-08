/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Parciales2;

/**
 *
 * @author Educación
 */
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Parcial08Alumnos {
    
    
    public static void main (String [] args) {
        GeneradorAleatorio.iniciar();
        
        String nombre = GeneradorAleatorio.generarString(8);
        int legajo = GeneradorAleatorio.generarInt(20);
        
        String fecha = GeneradorAleatorio.generarString(8);
        String docente = GeneradorAleatorio.generarString(9);
        int notaTeoria = GeneradorAleatorio.generarInt(100);
        int notaPractica = GeneradorAleatorio.generarInt(100);
        
        Examen Ex = new Examen (notaTeoria, notaPractica, fecha, docente);
        
        Alumno A = new Alumno (nombre, legajo, Ex);
        
        for (int i=0; i<5; i++) {
            int notaPresentacion = GeneradorAleatorio.generarInt(100);
            int notaContenido = GeneradorAleatorio.generarInt(100);
            int notaOriginalidad = GeneradorAleatorio.generarInt(100);
            fecha = GeneradorAleatorio.generarString(8);
            docente = GeneradorAleatorio.generarString(9);
        
            Entrega E = new Entrega (notaPresentacion, notaContenido, notaOriginalidad, fecha, docente);
            
            System.out.println("Ingresar una posicion para guardar la entrega");  
            A.registrarEntrega(Lector.leerInt(), E);
        }

        System.out.println(A.isAlumnoAprobado());
        
    }
    
}
