/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Parciales2;

/**
 *
 * @author Educación
 */
public abstract class Evaluacion {
    private String fecha;
    private String docente;

    
    public Evaluacion(String fecha, String docente) {
        this.fecha = fecha;
        this.docente = docente;
    }

    public String getFecha() {
        return fecha;
    }

    private void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getDocente() {
        return docente;
    }

    private void setDocente(String docente) {
        this.docente = docente;
    }
    
    
    public abstract double obtenerNota ();  // PUNTO 2.B
    
    public boolean isEvalucionAprobada () {  // PUNTO 2.C
        if (this.obtenerNota() > 4) {
            return true;
        }
        else
            return false;
    }
    
    
}
