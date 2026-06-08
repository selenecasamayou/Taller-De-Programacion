/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialesRedictado02;

/**
 *
 * @author Educación
 */
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
public class Parcial08EstacionDeServicioRedictado {
    
    
    public static void main (String [] args) {
        GeneradorAleatorio.iniciar();
        
        Estacion E = new Estacion("calle 15 entre 89 y 90");
        Surtidor S = new Surtidor(3400, 5000, 1);
        
        for (int i=0; i<2; i++) {
            double combustible = GeneradorAleatorio.generarDouble(5000);
            double precio = GeneradorAleatorio.generarDouble(10000)+ 1000;
            int cantVentas = GeneradorAleatorio.generarInt(3) + 1;
            S = new Surtidor(combustible, precio, cantVentas);
            E.agregarSurtidor(S);
        }
        
        for (int j=0; j<5; j++) {
            int Nsurtidor = Lector.leerInt();
            int dni = GeneradorAleatorio.generarInt(200);
            int cantLitros = GeneradorAleatorio.generarInt(500);
            double monto = GeneradorAleatorio.generarDouble(5000) + 1000;
            String pago = Lector.leerString();
            S.agregarVenta(Nsurtidor, dni, cantLitros, monto, pago);
        }
        System.out.println(E.toString());
        System.out.println(E.surtidorConMayorMonto());
        //S.agregarVenta(1, 300, 2000, 3000, "Efectivo");
        
    }
    
    
    
    
}
