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
public class Nadadores extends Grupo{
    private String nombreBañero;
    private double sueldoBañero;
    
    
    public Nadadores (String unNombreBañero, double sueldo, String nombre, double sueldoInst, double costo, int cantChicos) {
        super (nombre, sueldoInst, costo, cantChicos);
        nombreBañero = unNombreBañero;
        sueldoBañero = sueldo;
    }
    

    public String getNombreBañero() {
        return nombreBañero;
    }

    private void setNombreBañero(String nombreBañero) {
        this.nombreBañero = nombreBañero;
    }

    public double getSueldoBañero() {
        return sueldoBañero;
    }

    private void setSueldoBañero(double sueldoBañero) {
        this.sueldoBañero = sueldoBañero;
    }
    
    
    public boolean agregarChico (Chico C) {
        boolean entro = false;
        if (C.isNadar()) {
            super.agregarChico(C);
            entro = true;
        }
        return entro;
    }
    
    public double gananciaNeta () {
        return (super.gananciaNeta() - this.sueldoBañero); 
    }
    
    
}
