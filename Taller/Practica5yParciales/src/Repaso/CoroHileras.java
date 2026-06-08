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
public class CoroHileras extends Coro {
    private Corista [][] matrizCoristas;
    private int cantCoristas;
    private int DLF;
    private int DLC;
    
    
    public CoroHileras (int unaCantCoristas, String nombre, Director direcc) {
        super (nombre, direcc);
        cantCoristas = unaCantCoristas;
        DLF = 0;
        DLC = 0;
        matrizCoristas = new Corista [cantCoristas] [cantCoristas];  // matriz cuadrada
    }

    public int getCantCoristas() {
        return cantCoristas;
    }

    public int getCantFilas() {  //es simplemente para cargar, se que se sabe la cantidad desde el inicio
        return DLF;
    }

    public int getCantColumnas() {
        return DLC;
    }
    
    
    public void agregarCorista (Corista C) {  // PUNTO B.I
        if (this.DLF < this.cantCoristas && this.DLC < this.cantCoristas) {
            matrizCoristas [DLF] [DLC] = C;
            DLC++;
            if (this.DLC == this.cantCoristas) {
                DLC = 0;  // reseteo columna
                DLF++;
            }
        }   
    }
    
    @Override
    public boolean verCoro () {  // PUNTO B.II
        boolean llena = true, ok = true;
        int i= 0, j;
        while ((i < this.DLF) && (ok)) {
            j = 0; 
            while ((j < this.DLC) && (ok)) {
                if (this.matrizCoristas[i][j] != null) {
                    j++;
                }
                else
                    ok = false;
            }
            i++;
        }
        return llena;
    }// if (DLF == cant && DLC == cant)
    
    @Override
    public boolean formacionCoro () {  // PUNTO B.III
        boolean correcto = true;
        int i = 0, j = 0, anterior = 1000;  // pongo un numero alto para la primera vez
        while ((i < this.cantCoristas) && (correcto)) {
            j = 0;
            if (this.matrizCoristas[i][j].getTono() <= anterior) {
                    anterior = this.matrizCoristas[i][j].getTono();
                }
                else
                    correcto = false;
            while ((j < this.cantCoristas) && (correcto)) {
                if (this.matrizCoristas[i][j].getTono() != anterior) {  // se fija con el 1 de la fila
                    correcto = false;
                }
                j++;
            }
            i++;
        }
        return correcto;
    }
    
    @Override
    public String toString () {  // PUNTO B.IV
        String aux = super.toString();
        //String aux2="";
        for (int i=0; i<this.cantCoristas; i++) {
            for (int j=0; j<this.cantCoristas; j++) {
                if (this.matrizCoristas[i][j] != null) {
                    aux += (this.matrizCoristas[i][j].toString() + "\n");
                //System.out.println(aux2);
                }
            }
        }
        return aux;
    }
    
    
}
