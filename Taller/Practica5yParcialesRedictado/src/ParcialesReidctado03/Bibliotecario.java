/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialesReidctado03;

/**
 *
 * @author Educación
 */
public class Bibliotecario {
    private int DNI;
    private String nombre;
    private int experiencia;

    
    public Bibliotecario(int DNI, String nombre, int experiencia) {
        this.DNI = DNI;
        this.nombre = nombre;
        this.experiencia = experiencia;
    }

    
    public int getDNI() {  // no me interesa el dni del bibliotecario porque no lo voy a cambiar
        return DNI;
    }

    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getExperiencia() {
        return experiencia;
    }

    private void setExperiencia(int experiencia) {
        this.experiencia = experiencia;
    }

    
    @Override
    public String toString() {
        return "Bibliotecario:" + nombre + " - DNI: " + DNI + " - años de experiencia: " + experiencia + "\n";
    }
    
    
    
}
