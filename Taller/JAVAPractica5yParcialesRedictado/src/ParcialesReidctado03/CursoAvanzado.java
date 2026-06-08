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
public class CursoAvanzado extends Curso{
    private String conocimientosPrevios;
    
    
    public CursoAvanzado (String conocPrev, String nombre, double costo, String fecha, int cantAlumnos) {
        super(nombre, costo, fecha, cantAlumnos);
        conocimientosPrevios = conocPrev;
    }

    
    public String getConocimientosPrevios() {
        return conocimientosPrevios;
    }

    private void setConocimientosPrevios(String conocimientosPrevios) {
        this.conocimientosPrevios = conocimientosPrevios;
    }
    
    public String toString () {
        return super.toString() + "Mejor Alumno: " + super.buscarMejorPromedio().toString();
    }
    
}
