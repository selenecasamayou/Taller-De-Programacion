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
public class Ej02ClubRedictado {
    
    
    public static void main (String [] args) {
        GeneradorAleatorio.iniciar();
        String nombre = GeneradorAleatorio.generarString(5);
        double sueldo = GeneradorAleatorio.generarDouble(3000);
        int antiguedad = GeneradorAleatorio.generarInt(30)+1;
        int cantPartidos = GeneradorAleatorio.generarInt(15)+1;
        int cantGoles = GeneradorAleatorio.generarInt(5);
        
        Jugador J = new Jugador (cantPartidos, cantGoles, nombre, sueldo, antiguedad);
        
        nombre = GeneradorAleatorio.generarString(5);
        sueldo = GeneradorAleatorio.generarDouble(3000);
        antiguedad = GeneradorAleatorio.generarInt(30);
        int cantCampeonatos = GeneradorAleatorio.generarInt(20) + 1;
        
        Entrenador E = new Entrenador (cantCampeonatos, nombre, sueldo, antiguedad);
        
        
        System.out.println(J.toString());
        System.out.println(E.toString());
    }
    
    
}
