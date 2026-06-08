/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialesRedictado01;

/**
 *
 * @author Educación
 */
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
public class Parcial01Agenda {
    
    
    public static void main (String [] args) {
        GeneradorAleatorio.iniciar();
        
        Academia A = new Academia ("Blue Bird", 4);
        
        for (int i=0; i<5; i++) {
            String nombre = GeneradorAleatorio.generarString(6);
            double sueldo = GeneradorAleatorio.generarDouble(1000);
            String descripcion = GeneradorAleatorio.generarString(10);
            Instructor I = new Instructor(nombre, sueldo, descripcion);
            
            String nomBaile = GeneradorAleatorio.generarString(7);
            String unNivel = GeneradorAleatorio.generarString(5);
            double unCosto = GeneradorAleatorio.generarDouble(100) + 10;
            int unaCantAlum = GeneradorAleatorio.generarInt(20) + 5;
            Clase C = new Clase (nomBaile, unNivel, unCosto, unaCantAlum, I);
            
            int dia = Lector.leerInt();
            int hora = Lector.leerInt();
            A.registrarClase(C, dia, hora);
        }
        System.out.println(A.calcularAlumnosTotalesHora(3));
        System.out.println(A.calcularRecaudacionDia(1));
        System.out.println(A.toStirng());
    }
    
    
    
}
