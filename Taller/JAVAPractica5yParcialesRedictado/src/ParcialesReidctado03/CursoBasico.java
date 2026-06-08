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
public class CursoBasico extends Curso{
    
    
    public CursoBasico (String nombre, double costo, String fecha, int cantAlumnos) {
        super(nombre, costo, fecha, cantAlumnos);
    }
    
    
    public String toString () {
        return super.toString() + "Mejor alumno: " + super.buscarMejorAlumno().toString();
    }
    
    
}
