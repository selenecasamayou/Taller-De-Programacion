/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Parciales3;

/**
 *
 * @author Educación
 */
public class Programador {
    private String nombre;
    private int dni;
    private double sueldoBasico;
    private int lineasXHora;
    private String lenguaje;

    
    public Programador(String nombre, int dni, double sueldoBasico, int lineasXHora, String lenguaje) {
        this.nombre = nombre;
        this.dni = dni;
        this.sueldoBasico = sueldoBasico;
        this.lineasXHora = lineasXHora;
        this.lenguaje = lenguaje;
    }

    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDni() {
        return dni;
    }

    private void setDni(int dni) {
        this.dni = dni;
    }

    public double getSueldoBasico() {
        return sueldoBasico;
    }

    public void setSueldoBasico(double sueldoBasico) {
        this.sueldoBasico = sueldoBasico;
    }

    public int getLineasXHora() {
        return lineasXHora;
    }

    private void setLineasXHora(int lineasXHora) {
        this.lineasXHora = lineasXHora;
    }

    public String getLenguaje() {
        return lenguaje;
    }

    private void setLenguaje(String lenguaje) {
        this.lenguaje = lenguaje;
    }
    
    
    public double sueldoFinal () {  // PUNTO 2.B
        double aux = this.sueldoBasico;
        if (this.lineasXHora > 200) {
            aux += 50000;
        }
        return aux;
    }
    
    public void aumentarSueldoProgramador (double monto) {
        this.sueldoBasico += monto;
    }
    
    public String toString () {
        return ("nombre, " + this.nombre + " DNI, " + this.dni + " lenguaje de preferencia, " 
                + this.lenguaje + " sueldo final " + this.sueldoFinal());
    }
}
