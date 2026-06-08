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
public class Cliente {
    private String nombre;
    private int dni;
    private int edad;
    
    
    public Cliente (String unNombre, int unDni, int unaEdad) {  // PUNTO II
        nombre = unNombre;
        dni = unDni;
        edad = unaEdad;
    }

    public String getNombre() {  // PUNTO I
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    @Override
    public String toString() {
            return "Cliente{" + "nombre=" + nombre + ", dni=" + dni + ", edad=" + edad + '}';
    }
    
    
    
}
