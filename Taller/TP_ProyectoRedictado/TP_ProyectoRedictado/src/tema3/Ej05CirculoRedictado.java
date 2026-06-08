/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
 *
 * @author Educación
 */
import PaqueteLectura.Lector;
public class Ej05CirculoRedictado {
    
    
    public static void main (String [] args) {
        double radio = Lector.leerDouble();
        String colorRelleno = Lector.leerString();
        String colorLinea = Lector.leerString();
        Circulo C = new Circulo (radio, colorRelleno, colorLinea);
        
        System.out.println(C.calcularPerimetro());
        System.out.println(C.calcularArea());
    }
    
}
