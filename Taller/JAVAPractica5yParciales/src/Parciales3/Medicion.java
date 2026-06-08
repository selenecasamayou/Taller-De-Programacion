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
public class Medicion {
    private int numero;
    private int dniCli;
    private int cantM3;
    private boolean superaPeriodoAnterior;

    
    public Medicion(int numero, int dniCli, int cantM3, boolean superaPeriodoAnterior) {
        this.numero = numero;
        this.dniCli = dniCli;
        this.cantM3 = cantM3;
        this.superaPeriodoAnterior = superaPeriodoAnterior;
    }

    public int getNumero() {
        return numero;
    }

    private void setNumero(int numero) {
        this.numero = numero;
    }

    public int getDniCli() {
        return dniCli;
    }

    private void setDniCli(int dniCli) {
        this.dniCli = dniCli;
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
        return "{" + "numero=" + numero + ", dniCli=" + dniCli + ", cantM3=" + cantM3 + ", superaPeriodoAnterior=" + superaPeriodoAnterior + '}';
    }
    
    
    
}
