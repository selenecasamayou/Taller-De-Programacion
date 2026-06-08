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
public class Ej03EstanteriasRedictado {
    
    
    public static void main (String [] args) {
        GeneradorAleatorio.iniciar();
        Estanteria E = new Estanteria(); // su DF es 20 o N
    
        for (int i=0; i<3; i++) {
            String titulo = Lector.leerString();
            String editorial = Lector.leerString();
            int añoEdicion = GeneradorAleatorio.generarInt(2000);
            
            String nombreAutor =  GeneradorAleatorio.generarString(6);
            String biografia = GeneradorAleatorio.generarString(4);
            String origen = GeneradorAleatorio.generarString(8);
            
            Autor A = new Autor (nombreAutor, biografia, origen);
            
            String ISBN = GeneradorAleatorio.generarString(4);
            double precio = GeneradorAleatorio.generarDouble(1000);
            
            Libro L = new Libro (titulo, editorial, añoEdicion, A, ISBN, precio);
            
            E.agregarLibro(L);
        }
        
        System.out.println(E.buscarTitulo("Mujercitas"));  // se rompe cuando no se encuentra
    }
    
}
