/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialesRedictado01;

/**
 *
 * @author Educación
 */
public class Clase {
    private String nombreBaile;
    private String nivel;
    private double costo;  // x Inscripto
    private int cantAlumnos;
    private Instructor inst;
    
    
    public Clase (String nomBaile, String unNivel, double unCosto, int unaCantAlum, Instructor I) {
        nombreBaile = nomBaile;
        nivel = unNivel;
        costo = unCosto;
        cantAlumnos = unaCantAlum;
        inst = I;
    }

    
    public String getNombreBaile() {
        return nombreBaile;
    }

    private void setNombreBaile(String nombreBaile) {
        this.nombreBaile = nombreBaile;
    }

    public String getNivel() {
        return nivel;
    }

    private void setNivel(String nivel) {
        this.nivel = nivel;
    }

    public double getCosto() {
        return costo;
    }

    private void setCosto(double costo) {
        this.costo = costo;
    }

    public int getCantAlumnos() {
        return cantAlumnos;
    }

    private void setCantAlumnos(int cantAlumnos) {
        this.cantAlumnos = cantAlumnos;
    }

    public Instructor getInst() {
        return inst;
    }

    private void setInst(Instructor inst) {
        this.inst = inst;
    }
    
    
    public double calcularRecaudacion () {
        return (this.cantAlumnos * this.costo) - inst.getSueldo();
    }
    
    public String toStirng () {
        return ("Baile: " + this.nombreBaile + ", nivel " + this.nivel + ", cant alumnos " + this.cantAlumnos 
                + ", costo " + this.costo + inst.toString());
    }
    
    
}
