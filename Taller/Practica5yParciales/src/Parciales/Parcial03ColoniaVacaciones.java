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

public class Parcial03ColoniaVacaciones {
    
    
    public static void main (String [] args) {
        GeneradorAleatorio.iniciar();
        
        String nombreInstructor = GeneradorAleatorio.generarString(8);
        double sueldoInstructor = GeneradorAleatorio.generarDouble(2000);
        double costoInsc = GeneradorAleatorio.generarDouble(500);
        int chicosInscriptosN = 30;
        
        
        String nombreBañero = GeneradorAleatorio.generarString(8);
        double sueldoBañero = GeneradorAleatorio.generarDouble(1000);
        Nadador N = new Nadador (nombreBañero, sueldoBañero, nombreInstructor, sueldoInstructor, costoInsc, chicosInscriptosN);
        
        double costoAlquiler = GeneradorAleatorio.generarDouble(800);
        nombreInstructor = GeneradorAleatorio.generarString(8);
        sueldoInstructor = GeneradorAleatorio.generarDouble(2000);
        costoInsc = GeneradorAleatorio.generarDouble(500);
        chicosInscriptosN = 30;
        
        Exploradores E = new Exploradores (costoAlquiler, nombreInstructor, sueldoInstructor, costoInsc, chicosInscriptosN);
        
        for (int i=0; i<3; i++){
            String nombre = GeneradorAleatorio.generarString(8);
            int telefono = GeneradorAleatorio.generarInt(20);
            boolean nadar = GeneradorAleatorio.generarBoolean();
        
            Chico C = new Chico (nombre, telefono, nadar);
            
            N.agregarChico(C);
            
            nombre = GeneradorAleatorio.generarString(8);
            telefono = GeneradorAleatorio.generarInt(20);
            nadar = GeneradorAleatorio.generarBoolean();
            
            C = new Chico (nombre, telefono, nadar);
            
            E.agregarChico(C);
        }
        
        System.out.println(N.toString());
        N.esRentable();
        System.out.println(E.toString());
        E.esRentable();
    }
    
}
