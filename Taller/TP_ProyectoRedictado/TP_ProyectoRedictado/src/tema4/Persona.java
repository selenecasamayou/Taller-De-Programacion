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
public class Persona {
    private String nombre;
    private int DNI;
    private int edad;
    
    
    public Persona (String unNombre, int unDNI, int unaEdad) {
        nombre = unNombre;
        DNI = unDNI;
        edad = unaEdad;
    }

    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDNI() {
        return DNI;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }
    
    
    public String toString () {
        return (" Mi nombre es " + this.nombre + ", mi dni es " + this.DNI + " y tengo " + this.edad + " años");
    }
    
}
