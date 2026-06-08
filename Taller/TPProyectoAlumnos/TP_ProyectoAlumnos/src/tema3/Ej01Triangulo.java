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

public class Ej01Triangulo {
    
    
    public static void main (String [] args) {
        
        double lado1 = Lector.leerDouble();
        double lado2 = Lector.leerDouble();
        double lado3 = Lector.leerDouble();
        String colorRelleno = Lector.leerString();
        String colorLinea = Lector.leerString();
        
        Triangulo t = new Triangulo (lado1, lado2, lado3, colorRelleno, colorLinea);
        
        System.out.println("El area es: " + t.calcularArea());
        System.out.println("El perimetro es: " + t.calcularPerimetro());
    } 
}
