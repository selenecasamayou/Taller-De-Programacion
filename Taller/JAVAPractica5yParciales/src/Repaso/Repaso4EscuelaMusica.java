/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Repaso;

/**
 *
 * @author Educación
 */
import PaqueteLectura.GeneradorAleatorio;
public class Repaso4EscuelaMusica {
    
    
    public static void main (String [] args) {
        GeneradorAleatorio.iniciar();
        String nombreDirecc = (GeneradorAleatorio.generarString(8));
        int dni = (GeneradorAleatorio.generarInt(100)); 
        int edad = (GeneradorAleatorio.generarInt(40));
        int antiguedad = (GeneradorAleatorio.generarInt(10) + 1);
        
        Director D = new Director (nombreDirecc, dni, edad, antiguedad);
        
        int unaCantCoristas = 5; 
        String nombre = (GeneradorAleatorio.generarString(10));
        CoroSemicircular CS = new CoroSemicircular (unaCantCoristas, nombre, D);

        nombreDirecc =  (GeneradorAleatorio.generarString(8));
        dni = (GeneradorAleatorio.generarInt(100)); 
        edad = (GeneradorAleatorio.generarInt(40));
        antiguedad = (GeneradorAleatorio.generarInt(10) + 1);
        
        D = new Director (nombreDirecc, dni, edad, antiguedad);
        
        unaCantCoristas = 3; 
        CoroHileras CH = new CoroHileras (unaCantCoristas, nombre, D);
        
        for (int i=0; i<5; i++) {
            String nombreCorista = (GeneradorAleatorio.generarString(8));
            dni = (GeneradorAleatorio.generarInt(100)); 
            edad = (GeneradorAleatorio.generarInt(40));
            int tono = (GeneradorAleatorio.generarInt(3) + 1);
            
            Corista C = new Corista (nombreCorista, dni, edad, tono);
            CS.agregarCorista(C);
        }
        
        for (int i=0; i<3; i++) {
            for (int j=0; j<3; j++) {
                String nombreCorista = (GeneradorAleatorio.generarString(8));
                dni = (GeneradorAleatorio.generarInt(100)); 
                edad = (GeneradorAleatorio.generarInt(40));
                int tono = (GeneradorAleatorio.generarInt(3) + 1);
                
                Corista C = new Corista (nombreCorista, dni, edad, tono);
                CH.agregarCorista(C);
            }
        }
        
        System.out.println(CS.toString());
        System.out.println(CS.formacionCoro());
        System.out.println(CH.toString());
        System.out.println(CH.formacionCoro());
    }
    
}
