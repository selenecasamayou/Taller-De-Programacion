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
public class EventoOcacional extends Recital {
    private String motivo;
    private String nombreCont;
    private int dia;
    
    
    public EventoOcacional (String unMotivo, String unNombreCont, int unDia, String unNombre, int unaCantTemas) {
        super(unNombre, unaCantTemas);
        motivo = unMotivo;
        nombreCont = unNombreCont;
        dia = unDia;
    }

    
    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public String getNombreCont() {
        return nombreCont;
    }

    public void setNombreCont(String nombreCont) {
        this.nombreCont = nombreCont;
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
        if (this.motivo.equals("a beneficio")){ // seria mejor que que cada motivo seria una clsae
            aux = ("Recuerden colaborar con..." + this.nombreCont);
        }
        else 
            if (this.motivo.equals("show de TV")) {
                aux = ("Saludos amigos televidentes");
            }
            else
                aux = ("Un feliz cumpleaños para... " + this.motivo);
        
        return aux += (super.actuar());
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
