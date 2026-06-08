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
    private int dni;
    private int edad;
    
    
    public Persona (String unNombre, int unDni, int unaEdad) {
        nombre = unNombre;
        dni = unDni;
        edad = unaEdad;
    }
    
    public String getNombre () {
        return nombre;
    }
    
    public void setNombre (String unNombre) {
        nombre = unNombre;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int unDni) {
        this.dni = unDni;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int unaEdad) {
        this.edad = unaEdad;
    }
    
    @Override
    public String toString () {
        return ("Mi nombre es " + this.getNombre() + ", mi DNI es " + this.getDni() + " y tengo " + this.getEdad() + " años");
    }
    
    
    
    
    
    
    
    
}
