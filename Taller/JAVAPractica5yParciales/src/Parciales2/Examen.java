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
public class Examen extends Evaluacion{
    private int notaTeoria;
    private int notaPractica;

    
    public Examen(int notaTeoria, int notaPractica, String fecha, String docente) {
        super(fecha, docente);
        this.notaTeoria = notaTeoria;
        this.notaPractica = notaPractica;
    }

    
    public int getNotaTeoria() {
        return notaTeoria;
    }

    private void setNotaTeoria(int notaTeoria) {
        this.notaTeoria = notaTeoria;
    }

    public int getNotaPractica() {
        return notaPractica;
    }

    private void setNotaPractica(int notaPractica) {
        this.notaPractica = notaPractica;
    }
    
    
    public double obtenerNota () {
        return ((this.notaTeoria * 0.4) + (this.notaPractica * 0.6));
    }
    
    
}
