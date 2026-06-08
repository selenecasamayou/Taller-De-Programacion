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
public abstract class Curso {
    private String nombreCurso;
    private double costoInscripcion;
    private String fecha;
    private Alumno2 [] vecAlu;
    private int cantAluM;
    private int DL;

    
    public Curso(String nombreCurso, double costoInscripcion, String fecha, int cantidadAlumnos) {
        this.nombreCurso = nombreCurso;
        this.costoInscripcion = costoInscripcion;
        this.fecha = fecha;
        cantAluM = cantidadAlumnos;
        vecAlu = new Alumno2 [cantidadAlumnos];
        DL = 0;
    }

    public String getNombreCurso() {
        return nombreCurso;
    }

    public void setNombreCurso(String nombreCurso) {
        this.nombreCurso = nombreCurso;
    }
    
    public double getCostoInscripcion() {
        return costoInscripcion;
    }

    public void setCostoInscripcion(double costoInscripcion) {
        this.costoInscripcion = costoInscripcion;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getCantAluMnos() {
        return cantAluM;
    }

    public int getCantActualAlumnos() {
        return DL;
    }
    
    
    public int agregarAlumno (Alumno2 A) {  // PUNTO 2.A
        if (this.DL < this.cantAluM) {
            this.vecAlu[this.getCantActualAlumnos()] = A;
        DL++;
        }
        return DL;
    }
    
    public Alumno2 obtenerAlumno (int posA) {  // PUNTO 2.B
        return this.vecAlu[posA];
    }
     
    public void actualizarRendimiento (String nom, int notaX) {  // PUNTO 2.C
        int i = 0;
        while (i<this.getCantActualAlumnos() && this.vecAlu[i].getNombre() != nom) {
            i++;
        }
        if (this.vecAlu[i].getNombre().equals(nom)) {
            vecAlu[i].actualizarDatos(notaX);
        }
    }
    
    public abstract Alumno2 alumnoMejorDesempeño ();
    
    public String toString () {
        return ("Nombre " + this.getNombreCurso() + " costo insc " + this.getCostoInscripcion() + " fecha " 
                + this.getFecha() + alumnoMejorDesempeño().toString());
    }
    
    
}
