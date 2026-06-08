/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica5Redictado;

/**
 *
 * @author Educación
 */
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
public class Ej03ProductorMusicalRedictado {
    
    
    public static void main (String [] args) {
        GeneradorAleatorio.iniciar();
        String motivo = Lector.leerString();
        String nombreCont = GeneradorAleatorio.generarString(6);
        int dia = GeneradorAleatorio.generarInt(30) + 1;
        String nombreRecital = GeneradorAleatorio.generarString(10);
        int cantTemas = 3;
        EventoOcacional EO = new EventoOcacional(motivo, nombreCont, dia, nombreRecital, cantTemas);
        
        String nombreGira = GeneradorAleatorio.generarString(8);
        int cantFechas = 7;
        nombreRecital = GeneradorAleatorio.generarString(10);
        cantTemas = 3;
        Gira G = new Gira(nombreGira, cantFechas, nombreRecital, cantTemas);
        
        for (int i=0; i<3; i++) {
            String nombreTema = GeneradorAleatorio.generarString(4);
            EO.agregarTema(nombreTema);
            
            nombreTema = GeneradorAleatorio.generarString(4);
            G.agregarTema(nombreTema);
            
            String ciudad = GeneradorAleatorio.generarString(3);
            dia = GeneradorAleatorio.generarInt(30) + 1;
            Fecha F = new Fecha(ciudad, dia);
            G.agregarFecha(F);
        }
        
        System.out.println(EO.actuar());
        System.out.println(EO.calcularCosto());
        System.out.println(G.actuar());
        System.out.println(G.calcularCosto());
    }
    
    
    
}
