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
public abstract class Sistema {
    private int N; // años consecutivos a partir de a DF
    private int A; // primer año
    private double [] [] matriz;  // de temperatura
    
    public Sistema (int anioConsecutivos, int anio) {
        N = anioConsecutivos;
        A = anio;
        this.matriz = new double [N][12]; 
        for (int i=0; i<N; i++) {   // PUNTO A
            for (int j=0; j<12; j++) 
                matriz [i] [j] = 9999;
        }
    }

    public int getAñosConsecutivos() {
        return N;
    }

    public int getAño() {
        return A;
    }


    public void registrarTemperatura (int mes, int año, double temperatura) {  // PUNTO B
        // año recibido - primer año
        matriz [año-A] [mes-1] = temperatura; 
    }
    
    public double obtenerTemperatura (int año, int mes) {  // PUNTO C
        return matriz [año-A] [mes-1];  // retorna la temperatura de esas coordenadas 
    }
    
    public String maximos () {  // PUNTO D
        return ("El mes con mas temperatura es: " + this.obtenerMesMaximo() +
                " el año con mas temperatura es: " + this.obtenerAñoMax());
    }
    
    public int obtenerMesMaximo () {
        double max = -1;
        int mesMax = 0;
        for (int i=0; i<N; i++) {
            if (matriz [i] [0] > max) { // no me queda claro
                max = matriz [i] [0];
                mesMax = i;
            }
        }
        return mesMax;
    }
    
    public int obtenerAñoMax () {
        double max = -1;
        int añoMax = 0;
        for (int j=0; j<12; j++) {
            if (matriz [0] [j] > max) {
                max = matriz [0] [j];
                añoMax = j;
            }            
        }
        return añoMax;
    } 
    
    public abstract double calcularPromedio (int dato);
    
    public String toString () {  // PUNTO E.2  ???
        return (".");
    }
}
