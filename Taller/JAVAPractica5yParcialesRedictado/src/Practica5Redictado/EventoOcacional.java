/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica5Redictado;

/**
 *
 * @author Educación
 */
public class EventoOcacional extends Recital{
    private String motivo;
    private String nombreContratante;
    private int dia;
    
    
    public EventoOcacional (String unMotivo, String unNombreCont, int unDia, String nombre, int cantTemas) {
        super(nombre, cantTemas);
        motivo = unMotivo;
        nombreContratante = unNombreCont;
        dia = unDia;
    }

    
    public String getMotivo() {
        return motivo;
    }

    private void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getNombreContratante() {
        return nombreContratante;
    }

    private void setNombreContratante(String nombreContratante) {
        this.nombreContratante = nombreContratante;
    }

    public int getDia() {
        return dia;
    }

    private void setDia(int dia) {
        this.dia = dia;
    }
    
    
    public String actuar () {  // PUNTO C.III
        String aux = "";
        if (this.motivo.equals("show de beneficencia")) {
            aux += "Recuerden colaborar con… " + this.nombreContratante + "\n";
        }
        else
            if (this.motivo.equals("show de TV")) {
                aux += "Saludos amigos televidentes \n";
            }
            else
                aux += "Un feliz cumpleaños para… " + this.nombreContratante + "\n";
        return aux += super.actuar();
    }
    
    public double calcularCosto () {
        double costo = 0;  // si es evento de beneficiencia
        if (this.motivo.equals("show de TV")) {
            costo = 50000;
        }
        else
            if (this.motivo.equals("privado")) {
                costo = 150000;
            }
        return costo;
    }
    
    
    
}
