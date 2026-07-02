/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Repaso;

/**
 *
 * @author Educación
 */
public class CoroSemicircular extends Coro {
    private Corista [] vecCoristas;
    private int cantCoristas;
    private int DL;
    
    
    public CoroSemicircular (int unaCantCoristas, String nombre, Director direcc) {
        super (nombre, direcc);
        cantCoristas = unaCantCoristas;
        DL = 0;
        vecCoristas = new Corista [cantCoristas];
    }

    
    public int getCantCoristas() {
        return cantCoristas;
    }

    public int getCantCoristasActual() {  // solo para llenar el vector, ya se que se sabe la cant
        return DL;
    }
    
    
    public void agregarCorista (Corista C) {  // PUNTO B.I
        this.vecCoristas[DL] = C;
        DL++;
    }
    
    @Override
    public boolean verCoro () {  // PUNTO B.II
        boolean llena = true;
        int i = 0;
        while ((i < this.DL) && (this.vecCoristas[i] != null)) {
            i++;
        }
        if (this.vecCoristas[i] == null) {
            llena = false;
        }
        return llena;
    }// if (DL = DF) lpm
    
    @Override
    public boolean formacionCoro () {  // PUNTO B.III
        boolean correcto = true;
        int i = 0, anterior = 1000;  // pongo un numero alto para la primera vez
        while ((i <= this.cantCoristas) && (correcto)) {
            if (this.vecCoristas[i].getTono() <= anterior) {
                anterior = this.vecCoristas[i].getTono();
            }
            else
                correcto = false;
            i++;
        }
        return correcto;
    }
    
    @Override
    public String toString () {  // PUNTO B.IV
        String aux = super.toString();
        for (int i=0; i < this.cantCoristas; i++) {
            aux += (this.vecCoristas[i].toString());
        }
        return aux;
    }
    
}
