/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialesReidctado03;

/**
 *
 * @author Educación
 */
public class ReproductorMusica {
    private int DF;  // cant canciones
    private int DC;  // cant listas
    private Cancion [][] matriz;
    private int numUltCancion;
    private int [] vector;
    
    
    public ReproductorMusica (int cantCanciones, int cantListas) {
        DF = cantCanciones;
        DC = cantListas;
        matriz = new Cancion [DF][DC];
        numUltCancion = 0;  // "DL del vector"
        vector = new int [DC];
        for (int j=0; j<DC; j++) {  // vector de cant de canciones para cada lista
            vector[j] = 0;
        }
    }

    public int getCantCanciones() {
        return DF;
    }

    public int getCantListas() {
        return DC;
    }

    public int getNumUltimaCancion() {
        return numUltCancion;
    }
    
    
    public boolean quedaEspacio (int numLista) {  // PUNTO 2.A
        boolean espacio = false;
        if (this.vector[numLista] < DC) {
            espacio = true;
        }
        return espacio;
    }
    
    public void almacenarCancion (Cancion C, int lista) {  // PUNTO 2.B
        if (this.quedaEspacio(lista)) {
            this.matriz[lista][vector[lista]] = C;
            vector[lista]++;
            this.numUltCancion++;
        }
    }
                                        // C = cant canciones a reproducir
    public String reproducir (int lista, int C) {  // PUNTO 2.C
        String aux = "";
        for (int i=0; i<C; i++) {
            if (i == this.numUltCancion) {  // llegue al final
                this.numUltCancion = 0;
            }
            aux+= matriz[i][vector[i]].toString();
        }
        return aux;
    }
    
    public String reproducir (String interprete) {  // PUNTO 2.D
        String aux = "";
        for (int i=0; i<DC; i++) {
            for (int j=0; j<vector[i]; j++) {
                if (matriz[i][j].getInterprete().equals(interprete)) {
                    aux += matriz[i][j].toString();
                }
            }
        }
        return aux;
    }
    
    public int calcularDuracionTotal () {  // PUNTO 2.E
        int segTotales = 0;
        for (int i=0; i<DC; i++) {
            for (int j=0; j<vector[i]; j++) {
                segTotales += matriz[i][j].getDuracion();
            }
        }
        return segTotales;
    }
    
    
    
}
