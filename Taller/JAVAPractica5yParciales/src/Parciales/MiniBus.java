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
public class MiniBus {
    private String patente;
    private int capacidadN;
    private Alumno [] vecAlu;
    private int DL;
    
    
    public MiniBus (String unaPatente, int unaCapacidad) {
        patente = unaPatente;
        capacidadN = unaCapacidad;
        vecAlu = new Alumno [capacidadN]; 
        DL = 0;
    }

    public String getPatente() {
        return patente;
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }

    public int getCapacidadMaxima() {
        return capacidadN;
    }

    public int getCapacidadActual() {
        return DL;
    }
    
    
    public void agregarAlumnoMinibus (Alumno Alu) {
        this.vecAlu[DL] = Alu;
        DL++;
    }
    
    public Alumno buscarAlumno (int unDni) {
        Alumno aux = null;
        int i=0;
        while (i < this.DL && this.vecAlu[i].getDni() != unDni) {
            i++;
        }
        if (this.vecAlu[i].getDni() == unDni) {
            aux = this.vecAlu[i];
        }
        return aux;
    }
     
    public int buscarConObraSocial (String unaObraSocialX) {
        int cantCumple = 0;
        for (int i=0; i<this.DL; i++) {
            if (this.vecAlu[i].getObraSocial().equals(unaObraSocialX)) {
                cantCumple ++;
            }
        }
        return cantCumple;
    }
    
    public String toString () {
        String aux = ("Minibus 1: " + this.patente + " Cop: " + this.capacidadN );
        for (int i=0; i<this.DL; i++) {
            aux += this.vecAlu[i].toString();
        }
        return aux;
    }
}
