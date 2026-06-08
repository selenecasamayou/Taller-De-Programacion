/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialesReidctado03;

/**
 *
 * @author Educación
 */
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
public class Parcial10BibliotecasRedictado {
    
    
    public static void main (String [] args) {
        GeneradorAleatorio.iniciar();
        
        Bibliotecario Bi = new Bibliotecario (24657823, "Pepe", 15);
        Biblioteca B = new Biblioteca ("Jorge Luis Borges", Bi, 70, 15);
        
        Bi = new Bibliotecario (19762477, "Jorge", 45);
        BibliotecaInfantil BI = new BibliotecaInfantil(100, "Mafalda", "Sopa de Letras", Bi, 43, 10);
        
        for (int i=0; i<3; i++) {
            String titulo = GeneradorAleatorio.generarString(8);
            int edadRecom = GeneradorAleatorio.generarInt(18) + 3;
            int cantTotalEj = GeneradorAleatorio.generarInt(20);
            int cantEjDisp = GeneradorAleatorio.generarInt(10) + 3;
            int cantPrest = GeneradorAleatorio.generarInt(50) + 5;
            Libro L = new Libro (titulo, edadRecom, cantTotalEj, cantEjDisp, cantPrest);
            B.agregarLibro(L);
            
            titulo = GeneradorAleatorio.generarString(8);
            edadRecom = GeneradorAleatorio.generarInt(18) + 3;
            cantTotalEj = GeneradorAleatorio.generarInt(20);
            cantEjDisp = GeneradorAleatorio.generarInt(10) + 3;
            cantPrest = GeneradorAleatorio.generarInt(50) + 5;
            L = new Libro (titulo, edadRecom, cantTotalEj, cantEjDisp, cantPrest);
            BI.agregarLibro(L);
        }
        
        System.out.println(B.toString());
        String titulo = Lector.leerString();
        B.prestarLibro(titulo);
        System.out.println(B.obtenerCoeficienteR());
        
        System.out.println(BI.toString());
        titulo = Lector.leerString();
        BI.prestarLibro(titulo);
        System.out.println(BI.obtenerCoeficienteR());
    }
    
    
    
}
