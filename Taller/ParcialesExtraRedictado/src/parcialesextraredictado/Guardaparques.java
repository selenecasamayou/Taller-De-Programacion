/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialesextraredictado;

/**
 *
 * @author Educación
 */
public class Guardaparques {
    private int DNI;
    private String nombre;
    private int experiencia;

    
    public Guardaparques(int DNI, String nombre, int experiencia) {
        this.DNI = DNI;
        this.nombre = nombre;
        this.experiencia = experiencia;
    }

    
    public int getDNI() {
        return DNI;
    }

    private void setDNI(int DNI) {
        this.DNI = DNI;
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
        return "Guardaparques{" + "DNI=" + DNI + ", nombre=" + nombre + ", experiencia=" + experiencia + '}';
    }
    
    
    
    
    
    
}
