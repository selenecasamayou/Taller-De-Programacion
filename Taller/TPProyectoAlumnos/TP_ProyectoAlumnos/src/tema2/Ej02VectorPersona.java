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

public class Ej02VectorPersona {

    
    public static void main (String [] args ){
        GeneradorAleatorio.iniciar();
        int DimF = 15;
        int DimL;
        String nom;
        int dni;
        int edad;
        int cantEdad = 0;
        int dniMin = 9999;
        Persona pMin;
        nom = (GeneradorAleatorio.generarString(5));
        dni = (GeneradorAleatorio.generarInt(10));
        edad = (GeneradorAleatorio.generarInt(100));
        Persona p = new Persona (nom, dni, edad);
        
        Persona [] vector;
        vector = new Persona [DimF];
        DimL = 0;
        while (edad != 0 && DimL < DimF) {
            p.setNombre(nom);  // Guardo los primeros valores que lei al principio
            p.setDNI(dni);
            p.setEdad(edad);
            vector[DimL] = p;  // Guardo en el vector
            nom = (GeneradorAleatorio.generarString(5)); // Leo uno nuevo
            dni = (GeneradorAleatorio.generarInt(10)); 
            edad = (GeneradorAleatorio.generarInt(100));
            DimL++;
        }
        
        for (int i=0; i < DimL; i++) {
            System.out.println(p.toString());
            if (vector[i].getEdad() > 65)  // para obtener la edad de esa posicion
                cantEdad = cantEdad + 1;
            if (vector[i].getDNI() < dniMin) {
                dniMin = vector[i].getDNI();
                pMin = p;
            } 
        }
            
        System.out.println("La cantidad de personas con edad mayor a 65 son: " + cantEdad);    
        //System.out.println("La persona con menor dni es: " + pMin.toString());    
    }
    
}
