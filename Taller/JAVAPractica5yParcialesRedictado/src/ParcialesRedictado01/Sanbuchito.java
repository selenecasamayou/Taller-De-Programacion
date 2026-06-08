/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialesRedictado01;

/**
 *
 * @author Educación
 */
public class Sanbuchito {
    private String nombre;
    private Pan pan;
    private int cantIngredientes;
    private int DL;
    private Ingrediente [] vector;
    
    
    public Sanbuchito (String unNombre, Pan p, int cantIngr) {
        nombre = unNombre;
        pan = p;
        cantIngredientes = cantIngr;
        DL = 0;
        vector = new Ingrediente [cantIngredientes];
    }

    
    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Pan getPan() {
        return pan;
    }

    private void setPan(Pan pan) {
        this.pan = pan;
    }

    public int getCantIngredientes() {
        return cantIngredientes;
    }

    public int getCantIngredientesActual() {
        return DL;
    }
    
    
    public void agregarIngrediente (Ingrediente I) {  // PUNTO 1
        if (DL < this.cantIngredientes) {
            this.vector[DL] = I;
            DL++;
        }
    }
    
    public String toString () {  // PUNTO 4
        String aux = ("Sanbuchito: " + this.nombre + ", " + pan.toString()) + " Cant ingredientes: " + this.DL + " ";
        double costoTotal = pan.costoFinal();
        for (int i=0; i<DL; i++) {
            aux += this.vector[i].toString();
            costoTotal += this.vector[i].costoFinal();
        }
        return aux += " Costo Final: " + costoTotal;
    }
    
    
}
