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
public class Alumno2 {
    private int DNI;
    private String nombre;
    private String residencia;

    
    public Alumno2(int DNI, String nombre, String residencia) {
        this.DNI = DNI;
        this.nombre = nombre;
        this.residencia = residencia;
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

    public String getResidencia() {
        return residencia;
    }

    private void setResidencia(String residencia) {
        this.residencia = residencia;
    }

    @Override
    public String toString() {
        return "Alumno2{" + "DNI=" + DNI + ", nombre=" + nombre + ", residencia=" + residencia + '}';
    }
    
    
    
    
    
    
}
