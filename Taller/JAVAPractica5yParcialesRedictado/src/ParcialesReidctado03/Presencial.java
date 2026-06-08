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
public class Presencial extends Turno{  // no es necesaria
    
    public Presencial (String nombreDoc, double sueldoDoc, double costoCuota, int cantAlumnos) {
        super (nombreDoc, sueldoDoc, costoCuota, cantAlumnos);
    }
    
    public void agregarAlumno (Alumno2 A) {
        if (A.getResidencia().equals("La Plata")) {
            super.agregarAlumno(A);
        }
    } 
    
    
}
