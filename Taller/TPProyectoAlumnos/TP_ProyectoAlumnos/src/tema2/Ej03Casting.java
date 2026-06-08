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

public class Ej03Casting {
    
    public static void main (String [] args) {
        String nom;
        int dni, edad;
        nom = (Lector.leerString());
        //dni = (Lector.leerInt()); No aca
        //edad = (Lector.leerInt());
        
        int DF = 5, DC = 8;
        int DimLF = 0, DimLC = 0;
        Persona [] [] matriz;
        matriz = new Persona [DF] [DC];
        
        while (!(nom.equals("ZZZ")) && DimLF < DF) {   // PUNTO A
            DimLC = 0; // reseteo la columna, va aca para saber hasta donde se cargo la ultima columna
            while (!(nom.equals("ZZZ")) && DimLC < DC) {
                dni = (Lector.leerInt());
                edad = (Lector.leerInt());
                Persona p = new Persona (nom, dni, edad); // lo guardo, uso constructor
                matriz [DimLF] [DimLC] = p;  // lo guardo
                DimLC++; // aumento
                nom = (Lector.leerString());   // leo uno nuevo
            }
            DimLF++;
        }
        
        for (int i=0; i<DimLF-1; i++) {  // PUNTO B, -1 porque si la dL de la columna no esta completa, se recorren las filas completas y esa se hace aparte
            for (int j=0; j<DC; j++) {  // recorro todas las columnas
                System.out.println("El nombre de la persona es: " + matriz[i][j].getNombre());
            }
        }
        
        for (int j=0; j<DimLC; j++)  // recorro aparte y se pone en i la fimension logica de la fila por la que no recorri
            System.out.println("El nombre de la persona es: " + matriz[DimLF-1][j].getNombre());
    }
    
}
