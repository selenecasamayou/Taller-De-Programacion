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
import PaqueteLectura.Lector;

public class Parcial02VIajeEscolar {
    
    public static void main (String [] args) {
        GeneradorAleatorio.iniciar();
        
        String patente = "AB123CD";
        int capacidad = 20;
        MiniBus MB1 = new MiniBus (patente, capacidad);
        
        String nombreColegio = GeneradorAleatorio.generarString(10);
        String fecha = Lector.leerString();
        String destino = GeneradorAleatorio.generarString(8);
        
        patente = "AB456CD";
        capacidad = 28;
        MiniBus MB2 = new MiniBus (patente, capacidad);
        
        Viaje V = new Viaje (nombreColegio, fecha, destino, MB1, MB2);
        
        int dni = GeneradorAleatorio.generarInt(20);
        String nombre = GeneradorAleatorio.generarString(8);
        int poliza = GeneradorAleatorio.generarInt(50);
        String obraSocial = GeneradorAleatorio.generarString(5);
        
        Alumno A = new Alumno (dni, nombre, poliza, obraSocial);
        for (int i=0; i<3; i++) {
            V.agregarAlumnoViaje(A);
            
            dni = GeneradorAleatorio.generarInt(20);
            nombre = GeneradorAleatorio.generarString(8);
            poliza = GeneradorAleatorio.generarInt(50);
            obraSocial = GeneradorAleatorio.generarString(5);
            
        }
        dni = GeneradorAleatorio.generarInt(20);
        poliza = GeneradorAleatorio.generarInt(50);
        V.asignarPoliza(dni, poliza);
        obraSocial = GeneradorAleatorio.generarString(5);
        V.obtenerCantObraSocialX(obraSocial);
        System.out.println(V.toString()); 
    }
    
    
}
