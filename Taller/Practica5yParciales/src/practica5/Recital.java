/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica5;

/**
 *
 * @author Educación
 */
public abstract class Recital {
    private String nombreBanda;
    private int cantTemas;  // DF
    private int DL;
    private String [] vecTemas;
    
    
    public Recital (String unNombreBanda, int unCantTemas) {
        nombreBanda = unNombreBanda;
        cantTemas = unCantTemas;  // DF
        DL = 0;
        this.vecTemas = new String [cantTemas];
    }
    

    public String getNombreBanda() {
        return nombreBanda;
    }

    public void setNombreBanda(String nombreBanda) {
        this.nombreBanda = nombreBanda;
    }

    public int getCantTemas() {
        return cantTemas;
    }
    
    
    public void agregarTema (String nombreTema) {  // PUNTO C.I
        if (DL<cantTemas) {
            this.vecTemas[DL] = nombreTema;
        DL++;
        }
    }
    
    public String actuar () {  // PUNTO C.I
        String aux = "";
        for (int i=0; i<DL; i++) {
            aux += ("y ahora tocaremos " + this.vecTemas[i]);
        }
        return aux;
    }
    
    public abstract double calcularCosto ();
    
}
