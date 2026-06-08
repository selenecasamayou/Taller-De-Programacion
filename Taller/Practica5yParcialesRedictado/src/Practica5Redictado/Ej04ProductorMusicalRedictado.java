/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica5Redictado;

/**
 *
 * @author Educación
 */
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
public class Ej04ProductorMusicalRedictado {
    
    
    public static void main (String [] args) {
        GeneradorAleatorio.iniciar();
        
        String nombre = GeneradorAleatorio.generarString(5);
        int DNI = GeneradorAleatorio.generarInt(1000);
        int edad = GeneradorAleatorio.generarInt(100) + 1;
        int antiguedad = GeneradorAleatorio.generarInt(40);
        Director D = new Director (nombre, DNI, edad, antiguedad);
        String nombreCoro = GeneradorAleatorio.generarString(7);
        int cantCoristas = 3;
        
        Semicircular SC = new Semicircular (nombreCoro, D, cantCoristas);
        
        D = new Director ("Pepe", 555, 52, 20);
        nombreCoro = GeneradorAleatorio.generarString(7);
        Hileras H = new Hileras (nombreCoro, D, cantCoristas);
        for (int i=0; i<3; i++) {
                nombre = GeneradorAleatorio.generarString(5);
                DNI = GeneradorAleatorio.generarInt(1000);
                edad = GeneradorAleatorio.generarInt(100) + 1;
                int tono = GeneradorAleatorio.generarInt(5) + 1;
                //int tono = Lector.leerInt();
                Corista C = new Corista (nombre, DNI, edad, tono);
                SC.agregarCorista(C);  // agrega al vector 3 coristas
                
            for (int j=0; j<3; j++) {
                nombre = GeneradorAleatorio.generarString(5);
                DNI = GeneradorAleatorio.generarInt(1000);
                edad = GeneradorAleatorio.generarInt(100) + 1;
                //tono = GeneradorAleatorio.generarInt(5) + 1;
                tono = Lector.leerInt();
                C = new Corista (nombre, DNI, edad, tono);
                H.agregarCorista(C);  // agrega a la matriz 9 coristas
            }
        }
        
        System.out.println(SC.toString());
        System.out.println(SC.verCoristas()); //se rompe
        System.out.println(SC.coroOrdenado());
        System.out.println(H.toString());  //anda raro??
        System.out.println(H.verCoristas());
        System.out.println(H.coroOrdenado());  // anda raro??
    }
    
    
    
}
