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
import PaqueteLectura.Lector;

public class Ej04Casting2 {
    
    
    public static void main (String [] args) {
        String nom;
        int dni, edad;
        nom = (Lector.leerString());   
        
        int DFTotal = 40, DC = 8;
        int DF = 5;
        Persona [] [] matriz;
        matriz = new Persona [DF] [DC];
        
        int dia;
        int entrevistados = 0;
        int [] vector;
        vector = new int [5];
        
        for (int i=0; i<5; i++) {  // inicializo el vector de dimensiones logicas de cada dia (fila)
            vector[i] = 0;
        }
        
        while (!(nom.equals("ZZZ")) && entrevistados < DFTotal) {   // PUNTO A
                dia = (Lector.leerInt());
                if (vector[dia-1]<8) {
                    dni = (Lector.leerInt());
                    edad = (Lector.leerInt());
                    Persona p = new Persona (nom, dni, edad); // lo guardo, uso constructor
                    matriz [dia-1] [vector[dia-1]] = p;  // lo guardo
                    vector[dia-1]++; // aumento dimL
                    entrevistados++;
                }
                else
                    System.out.println("El dia " + dia + " esta ocupado");
                nom = (Lector.leerString());   // leo uno nuevo
            
            
        }
       
        
        for (int i=0; i<5; i++) {  // PUNTO B, uso 5 porque recorro cada dia
            for (int j=0; j<vector[i]; j++) {  // y con la posicion del vector (su dimL) recorro hasta ese numero
                System.out.println("El nombre de la persona es: " + matriz[i][j].getNombre());
            }
            System.out.println(vector[i]);
        }
    
    
}
}
