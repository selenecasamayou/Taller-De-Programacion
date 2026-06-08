/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

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

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDNI() {
        return DNI;
    }

    private void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public int getEdad() {
        return edad;
    }

    private void setEdad(int edad) {
        this.edad = edad;
    }

    
    @Override
    public String toString() {
        return " {" + "nombre=" + nombre + ", DNI=" + DNI + ", edad=" + edad + '}';
    }
    
    
}
