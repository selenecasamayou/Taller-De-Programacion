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
public class Alumno2 {
    private String nombre;
    private int cantTareas;
    private double sumaNotasTareas;

    public Alumno2(String unNombre, int cantTareas, double sumaNotasTareas) {
        nombre = unNombre;
        this.cantTareas = cantTareas;
        this.sumaNotasTareas = sumaNotasTareas;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCantTareas() {
        return cantTareas;
    }

    public void setCantTareas(int cantTareas) {
        this.cantTareas = cantTareas;
    }

    public double getSumaNotasTareas() {
        return sumaNotasTareas;
    }

    public void setSumaNotasTareas(double sumaNotasTareas) {
        this.sumaNotasTareas = sumaNotasTareas;
    }
    
    
    public double obtenerPromedio () {  // para el curso avanzado
        double aux = 0;
        if (this.getCantTareas() > 0) {
            aux += this.getSumaNotasTareas() / this.getCantTareas();
        }
        return aux;
    }
    
    public void actualizarDatos (double notaX) {
        this.cantTareas++;
        this.sumaNotasTareas += notaX;
    }
    
    public String toString () {
        return (" Alumno:  nombre " + this.getNombre() + " cantidad de tareas completadas " + this.getCantTareas()
                + " promedio: " + this.obtenerPromedio());
    }
    
}
