/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Parciales;

/**
 *
 * @author Educación
 */
public class Torneo {
    private String nom;
    private String fecha;
    private double montoRecaudado;
    private double montoPagado;
    
    
    public Torneo (String unNom, String unaFecha, double unMontoRecaudado, double unMontoPagado) {
        nom = unNom;
        fecha = unaFecha;
        montoRecaudado = unMontoRecaudado;
        montoPagado = unMontoPagado;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public double getMontoRecaudado() {
        return montoRecaudado;
    }

    public void setMontoRecaudado(double montoRecaudado) {
        this.montoRecaudado = montoRecaudado;
    }

    public double getMontoPagado() {
        return montoPagado;
    }

    public void setMontoPagado(double montoPagado) {
        this.montoPagado = montoPagado;
    }
    
    
    
    
}
