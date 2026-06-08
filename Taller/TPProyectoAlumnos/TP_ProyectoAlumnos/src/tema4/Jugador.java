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
public class Jugador extends Empleado {
    private int numPartidos;
    private int numGoles;
    
    
    public Jugador (int unNumPartidos, int unNumGoles, String unNombre, double unSueldoBasico, int unaAntiguedad) {
        super (unNombre, unSueldoBasico, unaAntiguedad);
        setNumPartidos(unNumPartidos);
        setNumGoles(unNumGoles);
    }

    public int getNumPartidos() {
        return numPartidos;
    }

    public void setNumPartidos (int unNumPartidos) {
        this.numPartidos = unNumPartidos;
    }
    
    public int getNumGoles() {
        return numGoles;
    }

    public void setNumGoles(int numGoles) {
        this.numGoles = numGoles;
    }
    
    
    public double calcularSueldoACobrar () {  // PUNTO 1.C
        double sueldo = super.calcularSueldoACobrar();
        if (this.calcularEfectividad() > 0.5)
            sueldo += this.getSueldoBasico();
        return sueldo;    
    }
   
    public int calcularEfectividad () {  // PUNTO 1.B
        return (this.numGoles / this.numPartidos); // PROMEDIO = SUMATOTAL / CANTOTAL
    }
    

}

