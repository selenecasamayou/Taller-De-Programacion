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
public class CursoAvanzado extends Curso{
    private String descripConocimientos;

    public CursoAvanzado(String descripConocimientos, String nombreCurso, double costoInscripcion, String fecha, int cantidadAlumnos) {
        super(nombreCurso, costoInscripcion, fecha, cantidadAlumnos);
        this.descripConocimientos = descripConocimientos;
    }

    
    public String getDescripConocimientos() {
        return descripConocimientos;
    }

    public void setDescripConocimientos(String descripConocimientos) {
        this.descripConocimientos = descripConocimientos;
    }
    
    
    public Alumno2 alumnoMejorDesempeño () {
        double promMax = -1;
        Alumno2 alumMax = null;
        for (int i=0; i<this.getCantActualAlumnos(); i++) {
            Alumno2 alumnoAct = this.obtenerAlumno(i);
            if (alumnoAct.obtenerPromedio() > promMax) {
                promMax = alumnoAct.obtenerPromedio();
                alumMax = alumnoAct;
            }
        }
        return alumMax;
    }
    
}
