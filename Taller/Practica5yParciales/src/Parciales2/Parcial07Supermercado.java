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
import PaqueteLectura.Lector;

public class Parcial07Supermercado {
    
    
    public static void main (String [] args) {
        GeneradorAleatorio.iniciar();
        String nombre = GeneradorAleatorio.generarString(15);
        String direcc = GeneradorAleatorio.generarString(7);
        int cantGondolas = 8; 
        int cantEstantes = 5;
        int cantGondolasActual = 0;
        int cantEstantesActual = 0;
        
        Supermercado S = new Supermercado (nombre, direcc, cantGondolas, cantEstantes);
        
        for (int i=0; i<cantGondolas; i++) {
            cantEstantesActual = 0;
            for (int j=0; j<cantEstantes; j++) {
                
                int codigo = GeneradorAleatorio.generarInt(8);
                String nombreProd = GeneradorAleatorio.generarString(8);
                System.out.println("Ingrese una marca");
                //String marca = Lector.leerString();
                String marca = GeneradorAleatorio.generarString(6);
                int cantUni = GeneradorAleatorio.generarInt(20);
                double precioXUni = GeneradorAleatorio.generarInt(40);
                
                Producto P = new Producto (codigo, nombreProd, marca, cantUni, precioXUni);
                
                S.registrarProducto(P);
                cantEstantesActual++;
            }
            cantGondolasActual++;
        }
        
       // S.buscarProductosXMarca(2, "pepito");
        System.out.println(S.obtenerGondolaMax());
        System.out.println(S.toString());
        
        
    }
}
