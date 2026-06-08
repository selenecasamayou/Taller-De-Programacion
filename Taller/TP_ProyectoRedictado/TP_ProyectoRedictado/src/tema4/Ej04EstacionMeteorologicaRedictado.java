/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author Educación
 */
import PaqueteLectura.GeneradorAleatorio;
public class Ej04EstacionMeteorologicaRedictado {
    
    
    public static void main (String [] args) {
        GeneradorAleatorio.iniciar();
        String nombre = "La Plata";
        double latitud = -34.921;
        double longitud = 57.955;
        
        int añosCons = 3;  // años consecutivos a partir de a DF
        int primerAño = 2021;  // primer año
        
        
        Estacion E = new Estacion(nombre, latitud, longitud);
        Anual sistemaAnual = new Anual(añosCons, primerAño, E);
        
        for (int i=primerAño; i< primerAño+añosCons; i++) { 
            for (int j=1; j<12; j++) {
                double temperatura = GeneradorAleatorio.generarDouble(10000);
                sistemaAnual.registrarTemperatura(i, j, temperatura);
            }
        }
        
        
        nombre = "Mar del Plata";
        latitud = -38.002;
        longitud = -57.556;
        
        añosCons = 4;  // años consecutivos a partir de a DF
        primerAño = 2020;  // primer año
        
        E = new Estacion(nombre, latitud, longitud);
        Mensual sistemaMensual = new Mensual(añosCons, primerAño, E);
        
        
        for (int i=primerAño; i< primerAño + añosCons; i++) { 
            for (int j=1; j<12; j++) {
                double temperatura = GeneradorAleatorio.generarDouble(10000);
                sistemaAnual.registrarTemperatura(i, j, temperatura);
            }
        }
        System.out.println(E.toString());
        System.out.println(sistemaMensual.mesYañoMax());
        
    }
    
    
    
}
