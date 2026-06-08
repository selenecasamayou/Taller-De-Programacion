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
public class Universidad {
    private int DF;  // 2000 - 2025
    private int DC; // cant examenes
    private Examen [][] matriz;
    private int [] vector;
    
    
    public Universidad (int cantExamenes) {
        DF = 26;
        DC = cantExamenes;
        matriz = new Examen [DF][DC];
        vector = new int [DC];
        for(int i=0; i<DC; i++) {  // vec de dim
            vector[i] = 0;
        }
    }

    public int getCantAños() {
        return DF;
    }

    public int getCantExamenes() {
        return DC;
    }
    
    
    public void agregarExamen (int año, Examen E) {  // PUNTO 2.A
        matriz[año][vector[año]] = E;
        this.vector[año]++;
    }
    
    public int examenesRendidos (int legajo, int año) {  // PUNTO 2.B
        int cant = 0;
        for (int j=0; j<vector[año]; j++) {  // seria año - 2000
            if (matriz[año][j].buscarCant(legajo)) {
                cant++;
            }
        }
        return cant;
    }
    
    private int cantExamenesAño (int año, String modalidad) {
        int cantCumple = 0;
        for (int j=0; j<vector[año]; j++) {
            if (matriz[año][j].getModalidad().equals(modalidad)) {
                cantCumple++;
            }
        }
        return cantCumple;
    }
    
    public int añoMasExaenes (String modalidad) {  // PUNTO 2.C
        int añoMax = 0, cantExamenesMax = -1, cantExamenes;
        for (int i=0; i<DF; i++) {
            cantExamenes = this.cantExamenesAño(i, modalidad);
            if (cantExamenes > cantExamenesMax) {
                cantExamenesMax = cantExamenes;
                añoMax = i;
            }
        }
        return añoMax;
    }
    
    public String toString (int calificacion) {
        String aux = "";
        for (int i=0; i<DF; i++) {
            for (int j=0; j<vector[i]; j++) {
                if (matriz[i][j].getCalificacion() >= calificacion) {
                    aux += matriz[i][j].toString() + "\n";
                }
            }
        }
        return aux;
    }
    
    
    
}
