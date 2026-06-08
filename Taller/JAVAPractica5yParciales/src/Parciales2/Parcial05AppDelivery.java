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

public class Parcial05AppDelivery {
    
    
    public static void main (String [] args) {
        GeneradorAleatorio.iniciar();
        
        String nombre = GeneradorAleatorio.generarString(8);
        String direcc = GeneradorAleatorio.generarString(4);
        
        DeliveryComidas DC = new DeliveryComidas (nombre, direcc);
        
        int cantidadEnvios = 10;
        nombre = GeneradorAleatorio.generarString(8);
        direcc = GeneradorAleatorio.generarString(4);
        
        EnviosRapidos ER = new EnviosRapidos (cantidadEnvios, nombre, direcc);
        
        for (int i=0; i<3; i++) {
            String direccOrigen = GeneradorAleatorio.generarString(5);
            String direccDestino = GeneradorAleatorio.generarString(5);;
            double montoCobrado = GeneradorAleatorio.generarDouble(300);
            double costoEnvio = GeneradorAleatorio.generarDouble(50);
        
            Envio E = new Envio (direccOrigen, direccDestino, montoCobrado, costoEnvio);
            
            ER.registrarPedidoEnvio(E);
        }
        
        DC.registrarPedidoComida(30.4);
        
        System.out.println(DC.toString());
        System.out.println(ER.toString());
    }
}
