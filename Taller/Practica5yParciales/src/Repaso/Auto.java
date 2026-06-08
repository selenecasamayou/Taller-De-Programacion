/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Repaso;

/**
 *
 * @author Educación
 */
public class Auto {
    private String nombreDueño;
    private int patente;

    
    public Auto(String nombreDueño, int patente) {
        this.nombreDueño = nombreDueño;
        this.patente = patente;
    }

    
    public String getNombreDueño() {
        return nombreDueño;
    }

    public void setNombreDueño(String nombreDueño) {
        this.nombreDueño = nombreDueño;
    }

    public int getPatente() {
        return patente;
    }

    public void setPatente(int patente) {
        this.patente = patente;
    }

    @Override
    public String toString() {
        return "Auto{" + "nombreDue\u00f1o=" + nombreDueño + ", patente=" + patente + '}';
    }
    
    
}
