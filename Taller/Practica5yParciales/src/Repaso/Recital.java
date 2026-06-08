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
public abstract class Recital {
    private String nombre;
    private int canTemas;
    private int DL;
    private String [] vecTemas;
    

    public Recital(String nombre, int canTemas) {
        this.nombre = nombre;
        this.canTemas = canTemas;
        DL = 0;
        vecTemas = new String [canTemas];
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCanTemas() {
        return canTemas;
    }

    public int getcanTemasActual() {
        return DL;
    }
    
    
    public void agregarTema (String nombreTema) { // PUNTO C.I
        if (DL < this.canTemas) {
            this.vecTemas[DL] = nombreTema;
        }
        DL++;
    }
    
    public String actuar () {  // PUNTO C.I
        String aux = "";
        for (int i=0; i<DL; i++){
            aux += ("Y ahora tocaremos... " + this.vecTemas[i]);
        }
        return aux;
    }
    
    public abstract double calcularCosto ();
}
