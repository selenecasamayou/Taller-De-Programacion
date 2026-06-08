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
public class Parcial02AppDeliveryRedictado {
    
    
    public static void main (String [] args) {
        GeneradorAleatorio.iniciar();
        
        Comidas DC = new Comidas("El Polo", "calle 42 entre 78 y 79");
        
        EnviosRapidos EV = new EnviosRapidos (5, "Pedidos Ya", "calle 12 entre 20 y 21");
        
        for (int i=0; i<6; i++) {
            String direccOrigen = GeneradorAleatorio.generarString(10);
            String direccDestino = GeneradorAleatorio.generarString(10);
            double montoCobrado = GeneradorAleatorio.generarDouble(500) + 100;
            double costo = GeneradorAleatorio.generarDouble(200) + 10;
            Envio E = new Envio (direccOrigen, direccDestino, montoCobrado, costo);
            EV.registrarPedidoEnvio(E);
        }
        
        for (int i=0; i<3; i++) {
            double monto = GeneradorAleatorio.generarDouble(500) + 100;
            DC.registrarPedidoComida(monto);
        }
        
        System.out.println(EV.toString());
        System.out.println(DC.toString());
    }
    
    
    
}
