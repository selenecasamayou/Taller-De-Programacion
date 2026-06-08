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
public class CursoBasico extends Curso{

    public CursoBasico(String nombreCurso, double costoInscripcion, String fecha, int cantidadAlumnos) {
        super(nombreCurso, costoInscripcion, fecha, cantidadAlumnos);
    }
    
    public Alumno2 alumnoMejorDesempeño () {
        int cantMax = -1;
        Alumno2 alumMax = null;
        for (int i=0; i<this.getCantActualAlumnos(); i++) {
            Alumno2 alumnoAct = this.obtenerAlumno(i);
            if (alumnoAct != null && alumnoAct.getCantTareas() > cantMax)
                cantMax = alumnoAct.getCantTareas();
                alumMax = alumnoAct;
        }
        return alumMax;
    }
    
}
