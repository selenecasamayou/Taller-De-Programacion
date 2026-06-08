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
public class Ej01FigurasRedictado {
    
    
    public static void main (String [] args) {
        GeneradorAleatorio.iniciar();
        
        int lado1 = GeneradorAleatorio.generarInt(100);
        int lado2 = GeneradorAleatorio.generarInt(100);
        int lado3 = GeneradorAleatorio.generarInt(100);
        String colorRelleno = GeneradorAleatorio.generarString(6);
        String colorLinea = GeneradorAleatorio.generarString(6);
        
        Triangulo T = new Triangulo (lado1, lado2, lado3, colorRelleno, colorLinea);
        
        double radio = GeneradorAleatorio.generarDouble(50);
        colorRelleno = GeneradorAleatorio.generarString(6);
        colorLinea = GeneradorAleatorio.generarString(6);
        
        Circulo C = new Circulo (radio, colorRelleno, colorLinea);
        
        System.out.println(T.toString());
        System.out.println(C.toString());
        T.despintar();
        C.despintar();
        System.out.println(T.toString());
        System.out.println(C.toString());
    }
    
}
