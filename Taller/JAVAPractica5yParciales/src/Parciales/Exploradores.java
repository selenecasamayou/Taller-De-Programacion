/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Parciales;

/**
 *
 * @author Educación
 */
public class Exploradores extends Grupo {
    private double costoAlquiler;
    private Chico [] vecChicos;
    private int DL;

    public Exploradores(double costoAlquiler, String unNombre, double unSueldoInstructor, double unCostoInsc, int chicosInscriptos) {
        super(unNombre, unSueldoInstructor, unCostoInsc, chicosInscriptos);
        this.costoAlquiler = costoAlquiler;
        vecChicos = new Chico [chicosInscriptos];
        DL = 0;
    }

    public double getCostoAlquiler() {
        return costoAlquiler;
    }

    public void setCostoAlquiler(double costoAlquiler) {
        this.costoAlquiler = costoAlquiler;
    }
    
    public double obtenerGananciaNeta () {
        return super.obtenerGananciaNeta() - this.costoAlquiler;
    }
    
}
