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
public class Hileras extends Coro{
    private Corista [][] matriz;
    private int DLF;
    private int DLC;
    
    
    public Hileras (String unNombre, Director direc, int cantCoristas) {
        super(unNombre , direc , cantCoristas);
        matriz = new Corista [cantCoristas][cantCoristas];
        DLF = 0;
        DLC = 0;
    }

    
    public int getcantCoristasActualFilas() {
        return DLF;
    }

    public int getgetcantCoristasActualColumnas() {
        return DLC;
    }
    
    
    public void agregarCorista (Corista C) {  // PUNTO A.I
        if (DLF < this.getCantCoristas()) {
                matriz[DLF][DLC] = C;
                DLC++;
                if (DLC == this.getCantCoristas()) {
                    DLF++;
                    DLC = 0;
                }
        }
    }
    
    public boolean verCoristas() {  // prreguntar si DLF = DF (cantCoristas)
        if (this.DLF == this.getCantCoristas()) {
            return true;
        }
        return false;
    }
    
    public boolean cumple(int fila) {
        boolean ordenado = true;
        int j = 0, tono = matriz[fila][j].getTono();
        while ((j < this.DLC) && (ordenado)) {
            if (matriz[fila][j].getTono() == tono)   
             j++;
            else
            ordenado = false;
        }
        return ordenado;
    }
    
    public boolean tonoMax () {
        int tonoMax = 1000, fila = 0;
        boolean ordenado = true;
        while ((fila < this.DLF) && (ordenado)) {
            if (matriz[fila][0].getTono() < tonoMax) { // uso la misma var porque se actualiza al 
                tonoMax = matriz[fila][0].getTono();
                fila++;
            }
            else
                ordenado = false;
        }
        return ordenado;
    }
    
        
    public boolean coroOrdenado () {
        boolean ordenado = true;
        int tonoPrimerMiembro;
        int i = 0, j;
        while ((i < this.DLF) && (ordenado)) {  // asumiendo que tanto la DLF y la DLC estan completas
            if(!(this.cumple(i))) {
                ordenado = false;
            }
            else i++;
        }
        
        if (ordenado) {
            if (!(this.tonoMax())) {
                ordenado = false;
            }
        }
        return ordenado;
    }
    
    public String toString () {
        String aux = super.toString();
        int hasta;
        for (int i=0; i<this.DLF; i++) {
            if (i == this.DLF) {
                hasta = this.DLC-1;
            }
            else
                hasta = this.getCantCoristas()-1;  // dim fisica de columa
            aux += "hilera " + i + "\n";
            for (int j=0; j <= hasta; j++) {
                matriz[i][j].toString();
            }
        }
        return aux;
    }
    
    public String toString1() { // copiar mejora
        String aux = "";
        for (int i=0; i<this.DLF-1; i++) {  // todas menos la ultima = todas las cargadads al maximo
            System.out.println(3);
            aux += "hilera " + i + "\n";
            System.out.println(3);
            for (int j=0; j<this.getCantCoristas(); j++) {  // como estan al maximo no uso la diml de columna
                System.out.println(3);
                aux += matriz[i][j].toString();
            }
        }
        aux += "hilera " + DLF + "\n";
        for (int j=0; j<this.DLC; j++) {
            aux += matriz[DLF][j].getNombre();
        }
        return aux;
    }
    
    
}
