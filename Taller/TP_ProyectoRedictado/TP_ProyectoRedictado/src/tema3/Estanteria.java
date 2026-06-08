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
    private int DF;
    private int DL;
    private Libro vector [];
    
    
    public Estanteria () {
        DF = 20;
        DL = 0;
        vector = new Libro [DF]; 
    }
    
    
    public int getCantTotalLibros() {
        return DF;
    }
    
    public int getCantLibrosActual() {
        return DL;
    }
    
    
    public int cantLibros () {  // PUNTO A.I  // solo devolver la DL
        int cant = 0;
        for (int i=0; i<DL; i++) {
            if (vector[i] != null) {  // en este caso no es necesario, pero sirve para practicar
                cant++;
            }
        }
        return cant;
    }
    
    public boolean verEstante () {  // PUNTO A.II
        if (DL == DF) {
            return true;
        }
        else
            return false;
    }
    
    public void agregarLibro (Libro L) {  // PUNTO A.III
        if (DL < DF ) {  // si queda espacio en la estanteria
            vector[DL] = L;
            DL++;
        }
    }
    
    public Libro buscarTitulo (String unTitulo) {  // PUNTO A.IV
        int i = 0;
        while ((i < DL) && (!(vector[i].getTitulo().equals(unTitulo)))) {
            i++;
        }
        if (i < DL) {
            return vector[i];
        }
        else
            return null;
    }
    
}
