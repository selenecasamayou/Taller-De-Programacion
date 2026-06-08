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
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej03Estanteria {
    
    
    public static void main (String [] args) {
        GeneradorAleatorio.iniciar();
        int DF = 20;  // PUNTO C, defini en el constructor que DF no tenga valor, entonces seria "N"
        Estanteria E = new Estanteria (DF);
        
        
        for (int i=0; i<DF; i++) {  // PUNTO B
            String nombre = (GeneradorAleatorio.generarString(6));
            String biografia = (GeneradorAleatorio.generarString(10));
            String origen = (GeneradorAleatorio.generarString(7));
            
            Autor A = new Autor (nombre, biografia, origen);
        
            String titulo = Lector.leerString();
            String editorial = (GeneradorAleatorio.generarString(8));
            int añoEdicion = (GeneradorAleatorio.generarInt(4));
            String ISBN = (GeneradorAleatorio.generarString(8));
            double precio = (GeneradorAleatorio.generarDouble(100));
            
            Libro L = new Libro(titulo, editorial, añoEdicion, A, ISBN, precio);
            
            E.agregarLibro(L);
        }
        
        Libro encontre = E.buscarTituloLibro("Mujercitas");  // PUNTO B
            if (encontre != null) {
                System.out.println("El autor del libro es: " + encontre.getPrimerAutor());
            }
    }
            
}

