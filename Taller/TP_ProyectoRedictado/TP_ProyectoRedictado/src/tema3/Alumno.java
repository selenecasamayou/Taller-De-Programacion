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
import PaqueteLectura.GeneradorAleatorio;
public class Alumno {
    private String nombre;
    private int edad;
    private String instrumento;
    private double puntaje;      
    
    
    
    public Alumno (String unNombre, int unaEdad, String unInstrumento, double unPuntaje) {
        nombre = unNombre;
        edad = unaEdad;
        instrumento = unInstrumento;
        puntaje = unPuntaje;
    }
    
    
    public String getNombre() {
        return nombre;
    }
    
    private void setNombre (String nombre) {
        this.nombre = nombre;
    }
    
    public int getEdad () {
        return edad;
    }
    
    private void setEdad (int edad) {
        this.edad = edad;
    }
    
    public String getInstrumento () {
        return instrumento;
    }
    
    private void setInstrumento (String instrumento) {
        this.instrumento = instrumento;
    }
    
    public double getPuntaje () {
        return puntaje;
    }
    
    public void setPuntaje (double puntaje) {
        this.puntaje = puntaje;
    }

    
    @Override
    public String toString() {
        return "Alumno{" + "nombre=" + nombre + ", edad=" + edad + ", instrumento=" + instrumento + ", puntaje=" + puntaje + '}';
    }
    
    
}
