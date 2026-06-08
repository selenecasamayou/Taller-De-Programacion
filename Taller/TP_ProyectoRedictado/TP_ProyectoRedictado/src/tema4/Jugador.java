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
public class Jugador extends Empleado{
    private int numPartidos;
    private int numGoles;
    
    
    public Jugador (int unNumPartidos, int unNumGoles, String unNombre, double unSueldo, int unAntiguedad) {
        super(unNombre, unSueldo, unAntiguedad);
        setNumPartidos(unNumPartidos);
        setNumGoles(unNumGoles);
    }

    
    public int getNumPartidos() {
        return numPartidos;
    }

    public void setNumPartidos(int numPartidos) {
        this.numPartidos = numPartidos;
    }

    public int getNumGoles() {
        return numGoles;
    }

    public void setNumGoles(int numGoles) {
        this.numGoles = numGoles;
    }
    
    
    public double calcularEfectividad () {  // 1-B
        return (double) this.numGoles / this.numPartidos;
    }
    
    public double calcularSueldoACobrar () {  // 1-C
        double sueldo = super.calcularSueldoACobrar();
        if (this.calcularEfectividad() > 0.5) {
            sueldo+= this.getSueldo();
        }
        return sueldo;
    }
    
}
