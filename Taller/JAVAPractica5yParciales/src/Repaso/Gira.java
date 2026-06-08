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
public class Gira extends Recital{
    private String nombreGira;
    private int cantFechas;  // DF
    private int DL; 
    private int numFecha; // puntero actual "DL"
    private Fecha [] vecFechas;
    
    
    public Gira (String unNombreGira, int unaCantFechas, String unNombre, int unaCantLista) {
        super (unNombre, unaCantLista);
        nombreGira = unNombreGira;
        cantFechas = unaCantFechas;
        DL = 0;
        numFecha = 0;
        vecFechas = new Fecha [cantFechas];
    }

    public String getNombreGira() {
        return nombreGira;
    }

    public void setNombreGira(String nombreGira) {
        this.nombreGira = nombreGira;
    }

    public int getCantFechas() {
        return cantFechas;
    }

    public int getCantFechasActual() {
        return DL;
    }

    public int getNumFecha() {
        return numFecha;
    }

    public void setNumFecha(int numFecha) {
        this.numFecha = numFecha;
    }
    
    
    public void agregarFecha (Fecha F) {  // PUNTO C.II
        if (DL < this.cantFechas) {
            this.vecFechas[DL] = F;
        }
        DL++;
    }
    
    public String actuar () {  // PUNTO C.II
        String aux = "";
        aux = ("BuenasNoches" + this.vecFechas[this.numFecha].getCiudad() + super.actuar());
        this.setNumFecha(numFecha+1);  // avanza a la siguiente fecha
        return aux;
    }
    
    public double calcularCosto () {  // PUNTO IV
        double cant = (DL * 30000);
        return cant;
    }
}
