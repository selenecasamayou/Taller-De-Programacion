/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

/**
 *
 * @author Educación
 */
import PaqueteLectura.GeneradorAleatorio;
public class Ej02VecPersonaRedictado {
    
    public static void main (String [] args) {
        GeneradorAleatorio.iniciar();
        int DF = 15;
        int DL = 0;
        Persona [] vector;
        int cantCumple = 0;
        int dniMin = 9999;
        Persona PMin = null;
        
        String nombre = GeneradorAleatorio.generarString(5);
        int dni = GeneradorAleatorio.generarInt(1000);
        int edad = GeneradorAleatorio.generarInt(100) + 1;
        Persona P = new Persona(nombre, dni, edad);
        
        vector = new Persona [DF];
        
        while (edad != 0 && DL<DF) {
            vector[DL] = P;
            DL++;
            nombre = GeneradorAleatorio.generarString(5);
            dni = GeneradorAleatorio.generarInt(1000);
            edad = GeneradorAleatorio.generarInt(100) + 1;
        }
        
        for (int i=0; i<DL; i++) {
            if (vector[i].getEdad() > 65) {
                cantCumple++;
            }
            if (vector[DL].getDNI() < dniMin) {
                dniMin = vector[DL].getDNI();
                PMin = vector[DL];
            }
        }
        
        System.out.println("La cant de personas con mas de 65 años es: " + cantCumple);
        if (PMin != null) { 
            System.out.println("La persona con DNI minimo es: " + PMin.toString());
        }
    }
    
    
}
