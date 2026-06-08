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
    private double sueldoBasico;
    private int antiguedad;
    
    
    public Empleado (String unNombre, double unSueldoBasico, int unaAntiguedad) {
        nombre = unNombre;
        sueldoBasico = unSueldoBasico;
        antiguedad = unaAntiguedad;
    }


    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldoBasico() {
        return sueldoBasico;
    }

    public void setSueldoBasico(double sueldoBasico) {
        this.sueldoBasico = sueldoBasico;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
    
    public abstract int calcularEfectividad ();  // PUNTO 1.B
    
    public double calcularSueldoACobrar () { // PUNTO 1.C
        return (this.sueldoBasico + (this.sueldoBasico % 10) * this.antiguedad );
    }
    
    @Override
    public String toString () {  // PUNTO 1.D
        return ("Nombre: " + getNombre() + " Sueldo a cobrar: " + this.calcularSueldoACobrar() + 
                " Efectividad: " + this.calcularEfectividad());
    }
}