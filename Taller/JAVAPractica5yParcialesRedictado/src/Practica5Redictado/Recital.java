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
public abstract class Recital {
    private String nombre;
    private int DF;
    private int DL;
    private String [] vecTemas;
    
    
    public Recital (String unNombre, int cantTemas) {
        nombre = unNombre;
        DF = cantTemas;
        DL = 0;
        vecTemas = new String [cantTemas];
    }

    
    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCantTemas() {
        return DF;
    }

    public int getCantTemasActual() {
        return DL;
    }
    
    
    public void agregarTema  (String tema) {  // PUNTO C.I
        if (DL < DF) {
            vecTemas[DL] = tema;
            DL++;
        }
    }
    
    public String actuar () {  // PUNTO C.I
        String aux = "";
        for (int i=0; i<this.DF; i++) {
            aux += ("y ahora tocaremos… " + vecTemas[i] + " ");
        }
        return aux;
    }
    
    public abstract double calcularCosto();  // PUNTO C.IV
    
    
}
