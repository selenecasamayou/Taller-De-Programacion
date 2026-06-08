/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialesRedictado02;

/**
 *
 * @author Educación
 */
public class Alumno {
    private String nombre;
    private String apellido;
    private int legajo;
    
    
    public Alumno (String unNombre, String unApellido, int unLegajo) {
        nombre = unNombre;
        apellido = unApellido;
        legajo = unLegajo;
    }

    
    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    private void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public int getLegajo() {
        return legajo;
    }

    private void setLegajo(int legajo) {
        this.legajo = legajo;
    }

    
    @Override
    public String toString() {
        return "Alumno{" + "nombre=" + nombre + ", apellido=" + apellido + ", legajo=" + legajo + '}';
    }
    
    
    
    
}
