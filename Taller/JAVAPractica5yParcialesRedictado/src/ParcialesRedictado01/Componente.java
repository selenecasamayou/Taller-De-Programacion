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
public abstract class Componente {
    private String nombre;
    private double costo;

    
    public Componente(String nombre, double costo) {
        this.nombre = nombre;
        this.costo = costo;
    }

    
    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getCosto() {
        return costo;
    }

    private void setCosto(double costo) {
        this.costo = costo;
    }
    
    
    public abstract double costoFinal ();  // PUNTO 2
    
    public String toString () {  // PUNTO 3
        return (this.nombre + " - " + this.costo + " - ");
    }
    
}
