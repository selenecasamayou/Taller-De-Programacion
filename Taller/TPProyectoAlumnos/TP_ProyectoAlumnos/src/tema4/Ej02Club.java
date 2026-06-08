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
import PaqueteLectura.GeneradorAleatorio;   //  FUNCIONA :D

public class Ej02Club {
    
    
    public static void main (String [] args) {
        GeneradorAleatorio.iniciar();
        int numPartidos = (GeneradorAleatorio.generarInt(20));
        int numGoles = (GeneradorAleatorio.generarInt(50));
        String nombre = (GeneradorAleatorio.generarString(6));
        double sueldoBasico = (GeneradorAleatorio.generarDouble(1000));
        int antiguedad = (GeneradorAleatorio.generarInt(30));
        
        Jugador J = new Jugador (numPartidos, numGoles, nombre, sueldoBasico, antiguedad);
        
        int cantCampeonatos = (GeneradorAleatorio.generarInt(20));
        nombre = (GeneradorAleatorio.generarString(6));
        sueldoBasico = (GeneradorAleatorio.generarDouble(1000));
        antiguedad = (GeneradorAleatorio.generarInt(30));
        
        Entrenador E = new Entrenador (cantCampeonatos, nombre, sueldoBasico, antiguedad);
        
        System.out.println(J.toString());
        System.out.println(E.toString());
    }
    
}
