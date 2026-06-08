/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Repaso;

/**
 *
 * @author Educación
 */
public class Corista {
    private String nombreCorista;
    private int dni;
    private int edad;
    private int tono;

    
    public Corista(String nombreCorista, int dni, int edad, int tono) {
        this.nombreCorista = nombreCorista;
        this.dni = dni;
        this.edad = edad;
        this.tono = tono;
    }

    
    public String getNombreCorista() {
        return nombreCorista;
    }

    public void setNombreCorista(String nombreCorista) {
        this.nombreCorista = nombreCorista;
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

    public int getTono() {
        return tono;
    }

    public void setTono(int tono) {
        this.tono = tono;
    }

    @Override
    public String toString() {
        return "Corista{" + "nombreCorista=" + nombreCorista + ", dni=" + dni + ", edad=" + edad + ", tono=" + tono + '}';
    }
    
    
}
