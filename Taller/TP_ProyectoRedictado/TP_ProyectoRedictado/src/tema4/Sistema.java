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
    private int Naños;  // años consecutivos a partir de a DF
    private int A;  // primer año
    private double [][] matriz;
    private Estacion est;
    
    public Sistema (int añosConsecutivos, int año, Estacion e) {
        Naños = añosConsecutivos;
        A = año;
        est = e;
        matriz = new double [Naños][12];
        for (int i=0; i<Naños; i++) {   // PUNTO A
            for (int j=0; j<12; j++) {
                matriz[i][j]= 9999;
            }
        }
    }
    

    public int getCantañosConsecutivos() {
        return Naños;
    }

    public int getPrimerAño() {
        return A;
    }
    
    
    public void registrarTemperatura (int año, int mes, double temperatura) {  // PUNTO B
        matriz [año-this.A] [mes-1] = temperatura;
    }
    
    
    public double obtenerTemperatura (int año, int mes) {  // PUNTO C
        return matriz [año-this.A] [mes-1];
    }
    
    public String mesYañoMax () {  // PUNTO D
        String aux = "";
        double temperaturaMax = -1;
        for (int i=0; i<this.Naños; i++) {
            for (int j=0; j<12; j++) {
                if (matriz[i][j] > temperaturaMax) {
                    temperaturaMax = matriz[i][j];
                    aux = "Mes max: " + (j+1) + " Año max: " + (this.A+i);
                }
            }
        }
        return aux;
    }
    
    
    public String toString () {  // PUNTO E
        return est.toString();
    }
    
    public abstract double calcularProm(int dato);  // mes o año
    
    
}
