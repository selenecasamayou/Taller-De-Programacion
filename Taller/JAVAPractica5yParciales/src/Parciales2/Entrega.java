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
public class Entrega extends Evaluacion{
    private int notaPresentacion;
    private int notaContenido;
    private int notaOriginalidad;
    
    
    public Entrega (int unaNotaPresentacion, int unaNotaContenido, int unaNotaOriginalidad, String fecha, String docente) {
        super (fecha, docente);
        notaPresentacion = unaNotaPresentacion;
        notaContenido = unaNotaContenido;
        notaOriginalidad = unaNotaOriginalidad;
    }

    
    public int getNotaPresentacion() {
        return notaPresentacion;
    }

    private void setNotaPresentacion(int notaPresentacion) {
        this.notaPresentacion = notaPresentacion;
    }

    public int getNotaContenido() {
        return notaContenido;
    }

    private void setNotaContenido(int notaContenido) {
        this.notaContenido = notaContenido;
    }

    public int getNotaOriginalidad() {
        return notaOriginalidad;
    }

    private void setNotaOriginalidad(int notaOriginalidad) {
        this.notaOriginalidad = notaOriginalidad;
    }
    
    
    public double obtenerNota () {
        return ((this.notaContenido + this.notaOriginalidad + this.notaPresentacion) / 3);
    }
    
    
}
