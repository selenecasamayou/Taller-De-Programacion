/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author Educación
 */
public class Estacion {
    private String nombre;
    private double latitud;
    private double longitud;
    private Sistema verSistema; // UNION CON SU SISTEMA (MATRIZ)
    
    
    public Estacion (String unNombre, double unaLatitud, double unaLongitud, Sistema unSistema) {
        nombre = unNombre;
        latitud = unaLatitud;
        longitud = unaLongitud;
        verSistema = unSistema;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getLatitud() {
        return latitud;
    }

    public void setLatitud(double latitud) {
        this.latitud = latitud;
    }

    public double getLongitud() {
        return longitud;
    }

    public void setLongitud(double longitud) {
        this.longitud = longitud;
    }

    public Sistema getVerSistema() {
        return verSistema;
    }

    public void setVerSistema(Sistema verSistema) {
        this.verSistema = verSistema;
    }
    
    public String toString () { // PUNTO E.1
        return (this.getNombre() + " (" + this.getLatitud() + " - " + this.getLongitud() + "):" +
                this.getVerSistema());
    }
    
}
