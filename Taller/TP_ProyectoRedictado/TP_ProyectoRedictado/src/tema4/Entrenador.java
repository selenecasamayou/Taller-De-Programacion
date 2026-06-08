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
public class Entrenador extends Empleado{
    private int cantCampeonatos;
    
    
    public Entrenador (int unaCantCampeonatos, String unNombre, double unSueldo, int unaAntiguedad) {
        super(unNombre, unSueldo, unaAntiguedad);
        setCantCampeonatos(unaCantCampeonatos);
    }

    
    public int getCantCampeonatos() {
        return cantCampeonatos;
    }

    public void setCantCampeonatos(int cantCampeonatos) {
        this.cantCampeonatos = cantCampeonatos;
    }
    
    
    public double calcularEfectividad () {  // 1-B
        return (double) this.cantCampeonatos / this.getAntiguedad();
    }
    
    public double calcularSueldoACobrar () {  // 1-C
        double sueldo = super.calcularSueldoACobrar();
        if ((this.cantCampeonatos >= 1) && (this.cantCampeonatos <= 4)) {
            sueldo += 5000;
        }
        else
            if ((this.cantCampeonatos >= 5) && (this.cantCampeonatos <= 10)) {
                sueldo+= 30000;
            }
            else
                if (this.cantCampeonatos > 10) {
                    sueldo+= 50000;
                }
        return sueldo;
    }
    
}
