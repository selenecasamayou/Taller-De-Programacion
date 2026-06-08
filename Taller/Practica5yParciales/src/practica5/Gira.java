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
public class Gira extends Recital {
    private String nombre;
    private Fecha [] vecFecha;
    private int cantFechas;  // DF
    private int DL;
    private int numFecha; // puntero actual "DL"
    
    
    public Gira (String unNombre, int unCantFechas, String unNombreBanda, int unCantTemas) {
        super (unNombreBanda, unCantTemas);
        nombre = unNombre;
        cantFechas = unCantFechas;
        vecFecha = new Fecha [cantFechas];
        DL = 0;
        numFecha = 0;
    }
    

    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCantFechas() {
        return cantFechas;
    }

    public int getNumFecha() {
        return numFecha;
    }

    private void setNumFecha(int numFecha) {
        this.numFecha = numFecha;
    }
    
    
    public void agregarFecha (Fecha F) {  // PUNTO C.II
        if (DL<cantFechas) {
            this.vecFecha[DL] = F; 
        DL++;
        }
    }
    
    public String actuar () {  // PUNTO C.II
        String aux;
        aux = ("Buenas noches " + this.vecFecha[this.numFecha].getCiudad() + super.actuar());
        this.setNumFecha(numFecha+1);
        return aux;
    }
    
    public double calcularCosto () {  // PUNTO C.IV
        double cantTotal = 0;
        for (int i=0; i<this.cantFechas; i++) {
            cantTotal += 30000;
        }
        return cantTotal;
    }
    
}
