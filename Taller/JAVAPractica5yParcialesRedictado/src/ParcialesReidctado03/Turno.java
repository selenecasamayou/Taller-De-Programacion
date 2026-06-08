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
public abstract class Turno {
    private String nombreDoc;
    private double sueldoDoc;
    private double costoCuota;
    private int DF;  // cant alumnos
    private int DL;
    private Alumno2 [] vector;
    
    
    public Turno (String nombreDoc, double sueldoDoc, double costoCuota, int cantAlumnos) {
        this.nombreDoc = nombreDoc;
        this.sueldoDoc = sueldoDoc;
        this.costoCuota = costoCuota;
        DF = cantAlumnos;
        DL = 0;
        vector = new Alumno2 [DF];
    }
    

    public String getNombreDoc() {
        return nombreDoc;
    }

    private void setNombreDoc(String nombreDoc) {
        this.nombreDoc = nombreDoc;
    }

    public double getSueldoDoc() {
        return sueldoDoc;
    }

    private void setSueldoDoc(double sueldoDoc) {
        this.sueldoDoc = sueldoDoc;
    }

    public double getCostoCuota() {
        return costoCuota;
    }

    private void setCostoCuota(double costoCuota) {
        this.costoCuota = costoCuota;
    }

    public int getCantAlumnos() {
        return DF;
    }

    public int getCantAlumnosActual() {
        return DL;
    }
    
    public void agregarAlumno (Alumno2 A) {  // PUNTO 2.A
        if (DL < DF) {
            this.vector[DL] = A;
            DL++;
        }
    }
    
    public double obtenerGanancia() {
        return ((this.costoCuota * this.getCantAlumnosActual()) - this.sueldoDoc);
    }
    
    public String toStting () {
        String aux = "{ Docente: " + this.nombreDoc + " ";
        for (int i=0; i<DL; i++) {
            aux += vector[i].toString();
        }
        return aux + " }";
    }
    
    
    
}
