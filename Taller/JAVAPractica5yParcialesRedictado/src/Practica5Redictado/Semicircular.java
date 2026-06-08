/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica5Redictado;

/**
 *
 * @author Educación
 */
public class Semicircular extends Coro{
    private Corista [] vector;
    private int DL;
    
    
    public Semicircular (String unNombre, Director direc, int cantCoristas) {
        super(unNombre , direc , cantCoristas);
        vector = new Corista [cantCoristas];
        DL = 0;
    }

    
    public int getCantCoristasActual() {
        return DL;
    }
    
    
    public void agregarCorista (Corista C) {  // PUNTO A.I
        if (DL < this.getCantCoristas()) {
            vector[DL] = C;
            DL++;
        }
    }    
    
    public boolean verCoristas () {  // prreguntar si DL = DF
        boolean lleno = true;
        int i = 0;
        while ((i < DL) && (lleno)) {
            if (vector[DL] != null) {
                i++;
            }
            else
                lleno = false;
        }
        return lleno;
    }
    
    public boolean coroOrdenado () {
        boolean ordenado = true;
        int i = 0, tono = 1000;
        while ((i < DL) && (ordenado)) {
            if ((vector[i].getTono() < tono)) {
                tono = vector[i].getTono();
            }
            else
                ordenado = false;
            i++;
        }
        return ordenado;
    }
    
    public String toString () {
        String aux = super.toString();
        for (int i=0; i < this.DL; i++) {
            aux += vector[i].toString();
        }
        return aux;
    }
    
}
