/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica5Redictado;

/**
 *
 * @author Educación
 */
public class Corista {
    private String nombre;
    private int DNI;
    private int edad;
    private int tono;

    
    public Corista(String nombre, int DNI, int edad, int tono) {
        this.nombre = nombre;
        this.DNI = DNI;
        this.edad = edad;
        this.tono = tono;
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

    public int getTono() {
        return tono;
    }

    private void setTono(int tono) {
        this.tono = tono;
    }

    @Override
    public String toString() {
        return "Corista: " + "nombre " + nombre + ", DNI " + DNI + " edad " + edad + " tono " + tono + "\n";
    }
    
    
    
    
    
}
