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
public class Alumno {
    private int dni;
    private String nombre;
    private int poliza;
    private String obraSocial;
    
    
    public Alumno (int unDni, String unNombre, int unaPoliza, String unaObraSocial) {
        dni = unDni;
        nombre = unNombre;
        poliza = unaPoliza;
        obraSocial = unaObraSocial; 
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getPoliza() {
        return poliza;
    }

    public void setPoliza(int poliza) {
        this.poliza = poliza;
    }

    public String getObraSocial() {
        return obraSocial;
    }

    public void setObraSocial(String obraSocial) {
        this.obraSocial = obraSocial;
    }
    
    
    public String toString () {
        return ("Dni " + this.getDni() + " Nombre " + this.getNombre() + " Poliza " + this.poliza + " obra social" + this.obraSocial);
    }
}
