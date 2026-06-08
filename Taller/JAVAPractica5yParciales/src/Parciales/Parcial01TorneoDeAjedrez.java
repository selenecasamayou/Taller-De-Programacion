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

public class Parcial01TorneoDeAjedrez {
    
    
    public static void main (String [] args) {
        GeneradorAleatorio.iniciar();
        
        String nombre = GeneradorAleatorio.generarString(8);
        String direcc = GeneradorAleatorio.generarString(10);
        
        TorneoAmateur TA = new TorneoAmateur (nombre, direcc);
        
        int DF = 20;
        nombre = GeneradorAleatorio.generarString(8);
        direcc = GeneradorAleatorio.generarString(10);
        
        TorneoProfesional TP = new TorneoProfesional (DF, nombre, direcc);
        
        String nom = GeneradorAleatorio.generarString(8);
        String fecha = GeneradorAleatorio.generarString(1000);
        double montoRecaudado = GeneradorAleatorio.generarDouble(2000);
        double montoPagado = GeneradorAleatorio.generarDouble(1000);
      
        Torneo T = new Torneo (nom, fecha, montoRecaudado, montoPagado);
        
        TP.registrarTorneoProfesional(T);
        TA.registrarTorneoAmateur(30);
        System.out.println(TP.toString());
    }
}
