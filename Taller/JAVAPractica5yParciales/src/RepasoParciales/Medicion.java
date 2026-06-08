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
public class Medicion {
    private int numuero;
    private int dni;
    private int cantM3;
    private boolean superaPeriodoAnterior;

    
    public Medicion(int numuero, int dni, int cantM3, boolean superaPeriodoAnterior) {
        this.numuero = numuero;
        this.dni = dni;
        this.cantM3 = cantM3;
        this.superaPeriodoAnterior = superaPeriodoAnterior;
    }

    
    public int getNumuero() {
        return numuero;
    }

    private void setNumuero(int numuero) {
        this.numuero = numuero;
    }

    public int getDni() {
        return dni;
    }

    private void setDni(int dni) {
        this.dni = dni;
    }

    public int getCantM3() {
        return cantM3;
    }

    private void setCantM3(int cantM3) {
        this.cantM3 = cantM3;
    }

    public boolean isSuperaPeriodoAnterior() {
        return superaPeriodoAnterior;
    }

    private void setSuperaPeriodoAnterior(boolean superaPeriodoAnterior) {
        this.superaPeriodoAnterior = superaPeriodoAnterior;
    }

    @Override
    public String toString() {
        return "Medicion{" + "numuero=" + numuero + ", dni=" + dni + ", cantM3=" + cantM3 + ", superaPeriodoAnterior=" + superaPeriodoAnterior + '}';
    }
    
    
}
