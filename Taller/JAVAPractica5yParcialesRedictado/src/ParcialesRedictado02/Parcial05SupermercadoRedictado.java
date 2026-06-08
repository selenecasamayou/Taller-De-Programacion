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
public class Parcial05SupermercadoRedictado {
    
    
    public static void main (String [] args) {
        GeneradorAleatorio.iniciar();
        
        Supermercado S = new Supermercado("Maxi", "calle 18 entre 45 y 46", 3, 2);
        
        for (int i=0; i<3; i++) {
            for (int j=0; j<2; j++) {
                int codigo = GeneradorAleatorio.generarInt(1000);
                String nombre = GeneradorAleatorio.generarString(6);
                String marca = Lector.leerString();
                int cantUni = GeneradorAleatorio.generarInt(100);
                double precioXuni = GeneradorAleatorio.generarDouble(500) + 100;
                Producto P = new Producto(codigo, nombre, marca, cantUni, precioXuni);
                
                S.registrarProducto(P);
            }
        }
        System.out.println(S.toStirng());
        System.out.println(S.listarProductos("Arcor", 1));
        System.out.println(S.gondolaMax());  // devuelve raro
        
    }
    
    
    
}
