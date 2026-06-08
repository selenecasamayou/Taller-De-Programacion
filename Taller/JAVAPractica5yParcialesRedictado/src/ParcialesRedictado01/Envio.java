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
public class Envio {
    private String direcOrigen;
    private String direcDestino;
    private double montoCobrado;
    private double costo;
    
    
    public Envio (String direcOr, String direcDes, double montoCob, double unCosto) {
        direcOrigen = direcOr;
        direcDestino = direcDes;
        montoCobrado = montoCob;
        costo = unCosto;
    }

    
    public String getDirecOrigen() {
        return direcOrigen;
    }

    private void setDirecOrigen(String direcOrigen) {
        this.direcOrigen = direcOrigen;
    }

    public String getDirecDestino() {
        return direcDestino;
    }

    private void setDirecDestino(String direcDestino) {
        this.direcDestino = direcDestino;
    }

    public double getMontoCobrado() {
        return montoCobrado;
    }

    private void setMontoCobrado(double montoCobrado) {
        this.montoCobrado = montoCobrado;
    }

    public double getCosto() {
        return costo;
    }

    private void setCosto(double costo) {
        this.costo = costo;
    }
    
    
    public double calcularRecaudacionEnvio() {
        return (this.montoCobrado - this.costo);
    }
    
}
