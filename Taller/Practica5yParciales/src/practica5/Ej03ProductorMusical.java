/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica5;

/**
 *
 * @author Educación
 */
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej03ProductorMusical {
    
    
    public static void main (String [] args) {  // PUNTO D
            GeneradorAleatorio.iniciar();
        System.out.println("Insertar motivo del evento");
        String motivo = Lector.leerString();
        String nombreContratante = (GeneradorAleatorio.generarString(8));
        int dia= GeneradorAleatorio.generarInt(20) + 1;
        String NombreBanda = GeneradorAleatorio.generarString(14);
        int CantTemas = 10;
        
        EventoOcacional EO = new EventoOcacional (motivo, nombreContratante, dia, NombreBanda, CantTemas);
        
        String nombre = GeneradorAleatorio.generarString(10);
        int cantFechas = 5;
        NombreBanda = GeneradorAleatorio.generarString(14);
        CantTemas = GeneradorAleatorio.generarInt(10);
        
        for (int j=0; j<3; j++) {
        
        EO.agregarTema("a");
        EO.agregarTema("b");
        EO.agregarTema("c");
        
            String ciudad = GeneradorAleatorio.generarString(12);
            int diaF = GeneradorAleatorio.generarInt(10);
        
            Fecha F = new Fecha (ciudad, diaF);
            
            Gira G = new Gira (nombre, cantFechas, NombreBanda, CantTemas);
            
            G.agregarFecha(F);
        
        System.out.println(EO.calcularCosto());
        System.out.println(EO.actuar());
        System.out.println(G.calcularCosto());
        System.out.println(G.actuar());
        }
    }
    
    
}