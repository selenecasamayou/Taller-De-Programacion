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
public class Gira extends Recital{
    private String nombreGira;
    private Fecha [] vecFechas;
    private int DF;  // mi cant de recitales totales = 40
    private int DL;  // mi cant de recitales que voy a dar = 30
    private int numFechaActual;  // mi fecha de recital actual (donde voy a dar el recital hoy) = 5
    
    
    public Gira (String unNombreGira, int cantFechas, String unNombre, int cantTemas) {
        super(unNombre, cantTemas);
        nombreGira = unNombreGira;
        DF = cantFechas;
        vecFechas = new Fecha [cantFechas];
        DL = 0;
        numFechaActual = 0;
    }

    
    public String getNombreGira() {
        return nombreGira;
    }

    private void setNombreGira(String nombreGira) {
        this.nombreGira = nombreGira;
    }

    public int getCantFechas() {
        return DF;
    }

    public int getCantFechasActual() {
        return DL;
    }

    public int getNumFechaActual() {
        return numFechaActual;
    }

    private void setNumFechaActual(int numFechaActual) {
        this.numFechaActual = numFechaActual;
    }
    
    
    public void agregarFecha(Fecha F) {  // PUNTO C.II
        if (DL < DF) {
            vecFechas[DL] = F;
            DL++;
        }
    }
    
    public String actuar() {  // PUNTO C.II
        String aux = "Buenas noches " + vecFechas[this.numFechaActual].getCiudad() + super.actuar();
        this.setNumFechaActual(numFechaActual+1);  // preguntar si esta bien pensado
        return aux;
    }
    
    public double calcularCosto () {
        return (this.DL * 30000);
    }
    
    
}
