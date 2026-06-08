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
public class Alumno {
    private String nombre;
    private int canTareas;
    private int sumaNotas;
    
    
    public Alumno (String nombre, int cantTareas) {
        this.nombre = nombre;
        canTareas = cantTareas;
        sumaNotas = 0;
    }

    
    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCanTareas() {
        return canTareas;
    }

    private void setCanTareas(int canTareas) {
        this.canTareas = canTareas;
    }

    public int getSumaNotas() {
        return sumaNotas;
    }

    private void setSumaNotas(int sumaNotas) {
        this.sumaNotas = sumaNotas;
    }
    
    
    public void actualizarNota(int nota) {  // preguntar si esta bien
        this.canTareas++;
        this.sumaNotas += nota;
    }

    @Override
    public String toString() {
        return "Alumno{" + "nombre=" + nombre + ", canTareas=" + canTareas + ", sumaNotas=" + sumaNotas + '}';
    }
    
    public double calcularPromedio() {
        return (this.sumaNotas / this.canTareas);
    }
    
    
}
