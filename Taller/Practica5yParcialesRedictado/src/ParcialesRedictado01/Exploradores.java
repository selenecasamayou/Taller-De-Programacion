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
public class Exploradores extends Grupo{
    private double alquilerCarpa;
    
    
    public Exploradores (double alquilerCarpa, String nombre, double sueldoInst, double costo, int cantChicos) {
        super(nombre, sueldoInst, costo, cantChicos);
        this.alquilerCarpa = alquilerCarpa;
    }

    
    public double getAlquilerCarpa() {
        return alquilerCarpa;
    }

    private void setAlquilerCarpa(double alquilerCarpa) {
        this.alquilerCarpa = alquilerCarpa;
    }
    
    
   public double gananciaNeta () {
       return (super.gananciaNeta() - this.alquilerCarpa);
   }
    
    
}
