/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author Educación
 */
public abstract class Empleado {
    private String nombre;
    private double sueldo;
    private int antiguedad;
    
    
    public Empleado (String unNombre, double unSueldo, int unaAntiguedad) {
        nombre = unNombre;
        sueldo = unSueldo;
        antiguedad = unaAntiguedad;
    }

    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
    
    
    public abstract double calcularEfectividad ();  // 1-B
        
    public double calcularSueldoACobrar () {  // 1-C
        return (this.sueldo + (this.sueldo % 10) * this.antiguedad);
    }
    
    public String toString () {  // 1-D
        String aux = "";
        aux = "Nombre: " + this.nombre + " Sueldo: " + this.calcularSueldoACobrar() + " Efectividad: " + this.calcularEfectividad();
        return aux;
    }
    
}
