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
 
    
    
    public Estacion (String unNombre, double unaLatitud, double unaLongitud) {
        nombre = unNombre;
        latitud = unaLatitud;
        longitud = unaLongitud;
        
    }

    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getLatitud() {
        return latitud;
    }

    private void setLatitud(double latitud) {
        this.latitud = latitud;
    }

    public double getLongitud() {
        return longitud;
    }

    private void setLongitud(double longitud) {
        this.longitud = longitud;
    }

    
    public String toString () {
        return ("Nombre: " + this.nombre + " ( " + this.latitud + " - " + this.longitud + " ) \n");
    }
    
}
