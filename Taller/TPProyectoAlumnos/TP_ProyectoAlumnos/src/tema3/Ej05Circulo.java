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

public class Ej05Circulo {
    
    
    public static void main (String [] args) {
        
        double radio = Lector.leerDouble();
        String colorRelleno = Lector.leerString();
        String colorLinea = Lector.leerString();
        
        Circulo c = new Circulo (radio, colorRelleno, colorLinea);  // INSTANCIARRRRRR 
        
        System.out.println("El area es: " + c.calcularArea() + " y el perimetro es: " + c.calcularPerimetro());
    }
    
}
