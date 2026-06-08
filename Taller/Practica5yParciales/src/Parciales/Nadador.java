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
public class Nadador extends Grupo{
    private String nombreBañero;
    private double sueldoBañero;
  

    public Nadador(String nombreBañero, double sueldoBañero, String unNombre, double unSueldoInstructor, double unCostoIncs, int chicosInscriptos) {
        super(unNombre,unSueldoInstructor, unCostoIncs, chicosInscriptos);
        this.nombreBañero = nombreBañero;
        this.sueldoBañero = sueldoBañero;
    }

    
    public String getNombreBañero() {
        return nombreBañero;
    }

    public void setNombreBañero(String nombreBañero) {
        this.nombreBañero = nombreBañero;
    }

    public double getSueldoBañero() {
        return sueldoBañero;
    }

    public void setSueldoBañero(double sueldoBañero) {
        this.sueldoBañero = sueldoBañero;
    }
    
    
    public boolean agregarChico(Chico C) {
        boolean aux = false;
        if (C.isNadar()) {
            super.agregarChico(C);  // polimorfismo
            aux = true;
        }
        return aux;
    }
    
    public double obtenerGananciaNeta () {
        return super.obtenerGananciaNeta() - this.sueldoBañero;
    }
}
