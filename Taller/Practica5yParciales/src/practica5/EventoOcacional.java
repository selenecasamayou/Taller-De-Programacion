/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica5;

/**
 *
 * @author Educación
 */
public class EventoOcacional extends Recital{
    private String motivo;
    private String nombreContratante;
    private int dia;
    
    
    public EventoOcacional (String unMotivo, String unNombreContratante, int unDia, String unNombreBanda, int unCantTemas) {
        super (unNombreBanda, unCantTemas);
        motivo = unMotivo;
        nombreContratante = unNombreContratante;
        dia = unDia;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getNombreContratante() {
        return nombreContratante;
    }

    public void setNombreContratante(String nombreContratante) {
        this.nombreContratante = nombreContratante;
    }

    public int getDia() {
        return dia;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }
    
    
    @Override
    public String actuar () {  // PUNTO C.III
        String aux = "";
        if (this.motivo.equals("beneficio")) {
            aux = ("Recuerden colaborar con " + this.nombreContratante);
        }
        else
            if (this.motivo.equals("show de TV")) {
                aux = ("Saludos amigos televidentes");
            }
            else
                if (this.motivo.equals("show privado")) {
                    aux = ("Un feliz cumpleaños para..." + this.nombreContratante);
                }
        aux += (super.actuar());
        return aux;
    }
    
    @Override
    public double calcularCosto () {  // PUNTO C.IV
        double cant = 0;
        if (this.motivo.equals("show de TV")) {
            cant = 50000;
        }
        else
            if (this.motivo.equals("show privado")) {
                cant = 150000;
            }
        return cant;
    }
    
}
