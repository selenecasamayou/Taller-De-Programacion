/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialesextraredictado;

/**
 *
 * @author Educación
 */
public class Concurso {
    private int DF;  // cant categorias 
    private int DC;  // cant canciones
    private Cancion [][] matriz;
    private int [] vector;
    
    
    public Concurso (int cantCategorias, int cantCanciones) {  // si dice conociendo se refiere a que ya estan definidas o se reciben?
        DF = cantCategorias;
        DC = cantCanciones;
        matriz = new Cancion [DF][DC];
        vector = new int [DF];
        for (int i=0; i<DF; i++) {
            this.vector[i] = 0;
        }
    }

    
    public int getCantCategorias() {
        return DF;
    }

    public int getCantCanciones() {
        return DC;
    }
    
    
    public void agregrarCancion (Cancion C, int categoria) {  // PUNTO 2.A
        if (this.vector[categoria] < DF) {  // si me pidieran que preguntara si esta lleno o no
            this.matriz[categoria][vector[categoria]] = C;
            this.vector[categoria]++;
        }
    }
    
    public void interpretarCancion (int ident, Estudiante E, double puntaje) {  // PUNTO 2.B
        boolean buscar = true;
        int i = 0, j = 0;
        while ((i < DF) && (buscar)) {
            while ((j < vector[i]) && (buscar)) {
                if (matriz[i][j].getIdentificador() == ident) {
                    matriz[i][j].puntajeMayor(E, puntaje);
                    buscar = false;
                }
                j++;
            }
            i++;
        }
        
    }
    
    public Estudiante conocerGanador (int ident) {  // PUNTO 2.C
        Estudiante ganador = null;
        double puntajeMax = -1;
        for (int i=0; i<DF; i++) {
            for (int j=0; j<vector[i]; j++) {
                if (matriz[i][j].getIdentificador() == ident) {
                    if (matriz[i][j].getPuntaje() > puntajeMax) {
                        puntajeMax = matriz[i][j].getPuntaje();
                        ganador = matriz[i][j].getEstGanador();
                    }
                }
            }
        }
        return ganador;
    }
    
    public Cancion conocerCancion (int categoria) {  // PUNTO 2.D
        Cancion canMax = null;
        double puntajeMax = -1;
        for (int i=0; i<vector[categoria]; i++) {
            if (matriz[categoria][i].getPuntaje() > puntajeMax) {
                puntajeMax = matriz[categoria][i].getPuntaje();
                canMax = matriz[categoria][i];
            }
        }
        return canMax;
    }
    
    
    
}
