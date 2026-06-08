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
public class Director {
    private String nombreDirecc;
    private int dni;
    private int edad;
    private int antiguedad;

    
    public Director(String nombreDirecc, int dni, int edad, int antiguedad) {
        this.nombreDirecc = nombreDirecc;
        this.dni = dni;
        this.edad = edad;
        this.antiguedad = antiguedad;
    }

    
    public String getNombreDirecc() {
        return nombreDirecc;
    }

    public void setNombreDirecc(String nombreDirecc) {
        this.nombreDirecc = nombreDirecc;
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

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }

    @Override
    public String toString() {
        return "Director{" + "nombreDirecc=" + nombreDirecc + ", dni=" + dni + ", edad=" + edad + ", antiguedad=" + antiguedad + '}';
    }
    
    
}
