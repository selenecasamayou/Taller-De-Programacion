/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialesRedictado02;

/**
 *
 * @author Educación
 */
public class Examen {
    private int mes;
    private int año;
    private int calificacion;
    private String modalidad;
    private Alumno alum;

    
    public Examen(int mes, int año, int calificacion, String modalidad, Alumno A) {
        this.mes = mes;
        this.año = año;
        this.calificacion = calificacion;
        this.modalidad = modalidad;
        alum = A;
    }

    
    public int getMes() {
        return mes;
    }

    private void setMes(int mes) {
        this.mes = mes;
    }

    public int getAño() {
        return año;
    }

    private void setAño(int año) {
        this.año = año;
    }

    public int getCalificacion() {
        return calificacion;
    }

    private void setCalificacion(int calificacion) {
        this.calificacion = calificacion;
    }

    public String getModalidad() {
        return modalidad;
    }

    private void setModalidad(String modalidad) {
        this.modalidad = modalidad;
    }

    public Alumno getAlum() {
        return alum;
    }

    private void setAlum(Alumno alum) {
        this.alum = alum;
    }
    
    
    public boolean buscarCant(int legajo) {
        if (alum.getLegajo() == legajo) {
            return true;
        }
        return false;
    }
    
    public String toString () {
        return (alum.toString() + " - " + this.mes + "/" + this.año + " calificacion: " + this.calificacion);
    }
    
}
