/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Repaso;

/**
 *
 * @author Educación
 */
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Repaso3ProductorMusical {
    
    
    public void main (String [] args) {
        GeneradorAleatorio.iniciar();
        String nombreBanda = (GeneradorAleatorio.generarString(12));
        int cantTemas = (GeneradorAleatorio.generarInt(8)+ 1);
        String motivo = Lector.leerString();
        String nombreContratante = (GeneradorAleatorio.generarString(8));
        int dia = (GeneradorAleatorio.generarInt(30)+ 1);
        EventoOcacional EO = new EventoOcacional (motivo, nombreContratante, dia, nombreBanda, cantTemas); 
        
        String nombreGira = (GeneradorAleatorio.generarString(8));
        int cantFechas = (GeneradorAleatorio.generarInt(4) + 1);
        
        Gira G = new Gira (nombreGira, cantFechas, nombreBanda, cantTemas);
        
        
        for (int i=0; i<3; i++) {
            String ciudad = (GeneradorAleatorio.generarString(5));
            int diaF = (GeneradorAleatorio.generarInt(30)+ 1);
            Fecha F = new Fecha (ciudad, diaF);
            G.agregarFecha(F);
        }
        System.out.println(EO.actuar());
        System.out.println(G.actuar());
        System.out.println(EO.calcularCosto());
        System.out.println(G.calcularCosto());
    } 
}
