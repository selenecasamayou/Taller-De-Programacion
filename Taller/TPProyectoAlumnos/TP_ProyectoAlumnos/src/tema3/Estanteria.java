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
public class Estanteria {
    private int DF;  // PUNTO C, la DF es N, porque no le defino ningun valor aca
    private Libro [] vector;
    private int DL;

    public Estanteria (int DimF) {
        DF = DimF;
        DL = 0; 
        vector = new Libro[DF];
        for (int i=0; i<DF; i++){  // PARA INICIALIZAR EL VECTOR EN NULL
            vector[i] = null;
        }
    }

    public int getDF() {
        return DF;
    }

    public void setDF(int DF) {
        this.DF = DF;
    }

    public Libro[] getVector() {
        return vector;
    }

    public void setVector(Libro[] vector) {
        this.vector = vector;
    }

    public int getDL() {
        return DL;
    }

    public void setDL(int DL) {
        this.DL = DL;
    }
    
    
    public int cantLibros () {  // PUNTO I
        int cant = 0;
        for (int i=0; i<DL; i++) {
            cant++;
        }
        return cant;
    }
    
    
    public boolean verEstante () {  // PUNTO II
        if (DL == DF) {
            return true;
        }
        else
            return false;
    }
    
    public void agregarLibro (Libro L) {  // PUNTO III
        vector[DL] = L;
        DL++;
    }
    
    
    public Libro buscarTituloLibro (String titulo) {  // PUNTO IV
        int i = 0;
        while (titulo != vector[i].getTitulo() && DL < DF)  {
            i++;
        }
        if (titulo == vector[i].getTitulo()) {
            return vector[i];
        }
        else
            return null;
    }
}
