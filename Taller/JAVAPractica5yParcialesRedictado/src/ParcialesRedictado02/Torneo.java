/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialesRedictado02;

/**
 *
 * @author Educación
 */
public class Torneo {
    private String nombre;
    private int DF;  // cant fechas
    private int DC;  // cant goleadores
    private Goleador [][] matriz;
    private int [] vector;
    
    
    public Torneo (String nombre, int cantFechas, int cantGoleadores) {
        this.nombre = nombre;
        DF = cantFechas;
        DC = cantGoleadores;
        matriz = new Goleador [DF][DC];
        vector = new int [DC];
        for (int i=0; i<DC; i++) {
            vector[i] = 0;      // 0 goleadores registrados
        }
    }
    

    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCantFechas() {
        return DF;
    }

    public int getCantGoleadores() {
        return DC;
    }
    
    
    public void agregarGoleador (int fecha, Goleador G) {  // PUNTO 2.A
        this.matriz[fecha-1][vector[fecha-1]] = G;  // asumo que esta en el rango
        this.vector[fecha-1]++;
    }
    
    public Goleador obtenerGoleadorMin (int fecha) {  // PUNTO 2.B
        Goleador goleadorMin = null;
        int cantGolesMin = 9999;
        for (int j=0; j<vector[fecha-1]; j++) {
            if (matriz[fecha-1][j].getCantGoles() < cantGolesMin) {
                cantGolesMin = matriz[fecha-1][vector[fecha-1]].getCantGoles();
                goleadorMin = matriz[fecha-1][vector[fecha-1]];
            }
        }
        return goleadorMin;
    }
    
    public int obtenerCantGoleadores() {  // PUNTO 2.C
        int cantGoleadores = 0;
        for (int j=0; j<DC; j++) {  // recorro vector de cant goleadores
            cantGoleadores += vector[j];
        }
        return cantGoleadores;
    }
    
    public String toString () {  // PUNTO 2.D
        String aux = "Torneo 2022: " + this.nombre + "\n";
        for (int i=0; i<DF; i++) {
            aux += "Fecha: " + (i+1) + "| Cant goleadores: " + this.vector[i];
            for (int j=0; j<vector[i]; j++) {
                if (this.matriz[i][j] != null) {
                    aux += "|" + this.matriz[i][j].toString();
                }
            }
            aux += "\n";
        }
        return aux;
    }
    
    
    
}
