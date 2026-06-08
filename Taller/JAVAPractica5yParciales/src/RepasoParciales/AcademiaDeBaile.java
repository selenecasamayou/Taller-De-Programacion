/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package RepasoParciales;

/**
 *
 * @author Educación
 */
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
public class AcademiaDeBaile {
    
    
    public static void main (String [] args) {
        GeneradorAleatorio.iniciar();
        String nombreAcademia = (GeneradorAleatorio.generarString(10));
        int cantHoras = 6;
        Academia A = new Academia (nombreAcademia, cantHoras);
        
        for (int i=0; i < 2; i++) {
            String nombreClase = (GeneradorAleatorio.generarString(9));
            String nivel = (GeneradorAleatorio.generarString(5));
            double costo = (GeneradorAleatorio.generarDouble(500));
            int cantAlumnos = (GeneradorAleatorio.generarInt(8));
            
            String nombreInstructor = (GeneradorAleatorio.generarString(8));
            double sueldo = (GeneradorAleatorio.generarDouble(1000));
            String descripcion = (GeneradorAleatorio.generarString(6));
            
            Instructor I = new Instructor (nombreInstructor, sueldo, descripcion);
            
            Clase C = new Clase (nombreClase, nivel, costo, cantAlumnos, I);
            
            int dia = Lector.leerInt();
            int hora = Lector.leerInt();
            A.registrarClase(C, dia, hora);
        }
        
        System.out.println(A.calcularRecaudacionDia(2));
        System.out.println(A.caltularAlumnosTotalesHora(3));
        System.out.println(A.toString());
    }
}
