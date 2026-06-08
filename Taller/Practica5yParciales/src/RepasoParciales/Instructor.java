/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package RepasoParciales;

/**
 *
 * @author Educación
 */
public class Instructor {
    private String nombre;
    private double sueldo;
    private String descripcion;

    
    public Instructor(String nombre, double sueldo, String descripcion) {
        this.nombre = nombre;
        this.sueldo = sueldo;
        this.descripcion = descripcion;
    }

    
    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldo() {
        return sueldo;
    }

    private void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    private void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    
    @Override
    public String toString() {
        return "Instructor{" + "nombre=" + nombre + ", sueldo=" + sueldo + ", descripcion=" + descripcion + "} \n";
    }
    
    
}
