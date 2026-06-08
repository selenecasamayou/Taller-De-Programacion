/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Parciales2;

/**
 *
 * @author Educación
 */
public class Envio {
    private String direccOrigen;
    private String direccDestino;
    private double montoCobrado;
    private double costoEnvio;

    
    public Envio(String direccOrigen, String direccDestino, double montoCobrado, double costoEnvio) {
        this.direccOrigen = direccOrigen;
        this.direccDestino = direccDestino;
        this.montoCobrado = montoCobrado;
        this.costoEnvio = costoEnvio;
    }

    
    public String getDireccOrigen() {
        return direccOrigen;
    }

    public void setDireccOrigen(String direccOrigen) {
        this.direccOrigen = direccOrigen;
    }

    public String getDireccDestino() {
        return direccDestino;
    }

    public void setDireccDestino(String direccDestino) {
        this.direccDestino = direccDestino;
    }

    public double getMontoCobrado() {
        return montoCobrado;
    }

    public void setMontoCobrado(double montoCobrado) {
        this.montoCobrado = montoCobrado;
    }

    public double getCostoEnvio() {
        return costoEnvio;
    }

    public void setCostoEnvio(double costoEnvio) {
        this.costoEnvio = costoEnvio;
    }
    
    
    
    
}
