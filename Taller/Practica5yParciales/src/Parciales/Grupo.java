/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Parciales;

/**
 *
 * @author Educación
 */
public abstract class Grupo {
    private String nombre;
    private double sueldoInstructor;
    private double costoInsc;
    private int inscriptosN;
    private Chico [] vecChicos;
    private int DL;
    
    
    public Grupo (String unNombre, double unSueldoInstructor, double unCostoInsc, int unaInscriptosN) {
        nombre = unNombre;
        sueldoInstructor = unSueldoInstructor;
        costoInsc = unCostoInsc;
        inscriptosN = unaInscriptosN;
        vecChicos = new Chico [inscriptosN];  // java implicitamente inicializa las estructuras en null  COPIAR
        DL = 0;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldoInstructor() {
        return sueldoInstructor;
    }

    public void setSueldoInstructor(double sueldoInstructor) {
        this.sueldoInstructor = sueldoInstructor;
    }

    public double getCostoInsc() {
        return costoInsc;
    }

    public void setCostoInsc(double costoInsc) {
        this.costoInsc = costoInsc;
    }

    public int getChicosInscriptos() {
        return inscriptosN;
    }

    public int getInscripciones() {
        return DL;
    }
    
    
    
    public boolean agregarChico (Chico C) {  // PUNTO 2.A
        this.vecChicos[DL] = C;
        DL++;
        return true;
    }
    
    public double obtenerGananciaNeta () {  // PUNTO 2.B
        double cant = 0;
        for (int i=0; i<this.DL; i++) {
            cant += this.costoInsc;
        }
        cant -= this.sueldoInstructor;
        return cant;
    }
    
    public String toString () {  // PUNTO 2.C
        String aux = ("Nombre del Instructor " + this.getNombre() + " Cantidad de chicos inscriptos " 
                + this.getInscripciones());
        for (int i=0; i<this.DL; i++) {
            aux += (" " + this.vecChicos[i].toString());
        }
        return aux += (" La ganancia neta del grupo es: " + this.obtenerGananciaNeta());
    }
    
    public boolean esRentable () {  // PUNTO 2.D
        boolean aux = false;
        if (this.obtenerGananciaNeta() > 5000000) {
            aux = true;
        }
        return aux;
    }
}
