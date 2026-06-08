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

public class Ej01Figuras {  
    
    
    public static void main (String [] args) {  //  PUNTO 1.F
        GeneradorAleatorio.iniciar();
        double lado1 = (GeneradorAleatorio.generarDouble(10));
        double lado2 = (GeneradorAleatorio.generarDouble(10));
        double lado3 = (GeneradorAleatorio.generarDouble(10));
        String colorRelleno = (GeneradorAleatorio.generarString(7));
        String colorLinea = (GeneradorAleatorio.generarString(7));
        
        Triangulo T = new Triangulo (lado1, lado2, lado3, colorRelleno, colorLinea);
        
        double radio = (GeneradorAleatorio.generarDouble(20));
        colorRelleno = (GeneradorAleatorio.generarString(7));
        colorLinea = (GeneradorAleatorio.generarString(7));
        
        Circulo C = new Circulo (radio, colorRelleno, colorLinea);
        
        System.out.println(T.toString());
        System.out.println(C.toString());
        T.despintar();
        C.despintar();
        System.out.println(T.toString());
        System.out.println(C.toString());
    }
      
}
