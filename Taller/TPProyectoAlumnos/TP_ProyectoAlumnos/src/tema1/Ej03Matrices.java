/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

//Paso 1. importar la funcionalidad para generar datos aleatorios
import PaqueteLectura.GeneradorAleatorio;

public class Ej03Matrices {

    public static void main(String[] args) {  // PRACTICA 1 PUNTO 3
	//Paso 2. iniciar el generador aleatorio  
        GeneradorAleatorio.iniciar();	 
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios
        int F = 5;  // dimensiones de la matriz
        int C = 5;
        int i;    // INDICE DE FILA
        int j;   // INDICE DE COLUMNA
        int suma = 0;
                
        int [] [] matriz;
        matriz = new int [F] [C];
        for (i=0; i<F; i++) {
            for (j=0; j<C; j++)
                matriz [i] [j] = GeneradorAleatorio.generarInt(31);
        }
        //Paso 4. mostrar el contenido de la matriz en consola
        for (i=0; i<F; i++) {
            System.out.println("-------------");
            for (j=0; j<C; j++) 
                System.out.print(matriz[i] [j] + "|");
            System.out.println();
        }
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
        for (j=0; j<C; j++) // PARA RECORRER LA FILA USO EL INDICE DE LA COLUMNA
            suma += matriz [0] [j];  // se suma a si misma y su derecha
        System.out.println("La suma de la fila 1 de la matriz es: " + suma);   
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.
        
        int [] vector;
        vector = new int [5];
        for (int k=0; k<5; k++){
            vector[k] = 0;
        }
        int k = 0;
        for (j=0; j<C; j++) { 
            int sumaElem = 0; 
            for (i=0; i<F; i++){  // PARA CONTAR LOS DATOS DE UNA COLUMNA, ME MUEVO EN LA FILA. OSEA SU OPUESTO
                sumaElem = sumaElem +  matriz [i] [j];
            }
            vector[k] = vector[k] + sumaElem;
            k++;// preguntar por error
        }
        
        for (int q=0; q<5; q++)  // Imprimo vector
            System.out.println("La suma de la columna: " + q + " es: " + vector[q]);
            
        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
        int valor = GeneradorAleatorio.generarInt(31);
        i = 0; j = 0;
        while (i<F && j<C && valor != matriz[i][j]) {
            if (valor == matriz[i][j])
                System.out.println("Las coordenadas son: " + i + j);
            else
                System.out.println("No se encontró el elemento");
            i++;
            j++;
        }
    }        
}
