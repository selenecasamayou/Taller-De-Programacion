/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package RepasoParciales;

/**
 *
 * @author Educación
 */
public class Clase {
    private String nombreClase;
    private String nivel;
    private double costo;
    private int cantAlumnos;
    private Instructor instr;

    
    public Clase(String nombreClase, String nivel, double costo, int cantAlumnos, Instructor instr) {
        this.nombreClase = nombreClase;
        this.nivel = nivel;
        this.costo = costo;
        this.cantAlumnos = cantAlumnos;
        this.instr = instr;
    }

    public String getNombreClase() {
        return nombreClase;
    }

    private void setNombreClase(String nombreClase) {
        this.nombreClase = nombreClase;
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

    public Instructor getInstr() {
        return instr;
    }

    private void setInstr(Instructor instr) {
        this.instr = instr;
    }
    
    
    public double calcularClase() {
        double costo = 0;
        costo = ((this.getCantAlumnos() * this.getCosto()) + instr.getSueldo());
        return costo;
    }

    @Override
    public String toString() {
        return "Clase " + nombreClase + ", " + nivel + ", " + costo + ", " + cantAlumnos  + ", "+ instr.toString()  ;
    }
    
    
}
