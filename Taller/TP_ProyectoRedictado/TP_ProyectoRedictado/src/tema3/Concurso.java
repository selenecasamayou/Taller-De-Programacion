/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
 *
 * @author Educación
 */
public class Concurso {
    private int generos;  // filas
    private int NAlumnos;  // columnas
    private Alumno matriz [][];
    private int vector [];
    
    
    public Concurso (int cantAlumnos) {
        generos = 5;
        NAlumnos = cantAlumnos;
        matriz = new Alumno [generos][NAlumnos];
        vector = new int [generos];
        for (int i=0; i<generos; i++) {
            vector[i] = 0;
        }
    }

    
    public int getGeneros() {
        return generos;
    }

    public int getNAlumnos() {
        return NAlumnos;
    }
    
    
    public void inscribirAlumno (Alumno A, int genero) {  // PUNTO 2-A
        matriz[genero-1][vector[genero-1]] = A;
        vector[genero-1]++;
    }
    
    public void asignarPuntaje (int G, Alumno N, double P) {  // PUNTO 2-B
        int i = 0;
        while (i < vector[G] && matriz[G][vector[G]] != N) {
            i++;
        }
        if (i < vector[G]) {  // si lo encontre
            matriz[G][vector[G]].setPuntaje(P);
        }
    }
    
    public Alumno obtenerPuntajeMax() {  // PUNTO 2-C
        double puntajeMax = -1;
        Alumno aluMax = null;
        for (int i=0; i<generos; i++) {
            for (int j=0; j<vector[i]; j++) {
                if (matriz[i][j].getPuntaje() > puntajeMax) {
                    puntajeMax = matriz[i][j].getPuntaje();
                    aluMax = matriz[i][j];
                }
            }
        }
        return aluMax;
    }
    
    public String toString () {   // PUNTO 2-D
        String aux = "";
        for (int i=0; i<generos; i++) {
            aux+= "Genero " + i + " - " + "Total inscriptos " +vector[i] ;
            for (int j=0; j<vector[i]; j++) {
                aux+= " - " + matriz[i][j].toString();
            }
        }
        return aux;
    }
    
}