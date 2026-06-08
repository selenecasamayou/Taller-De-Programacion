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
public class Alumno {
    private String nombre;
    private int legajo;
    private Examen Ex;
    private Entrega [] vecEntregas;
    private int cantEntregas;
    
    
    public Alumno (String unNombre, int unLegajo, Examen unExamen) {
        nombre = unNombre;
        legajo = unLegajo;
        Ex = unExamen;
        cantEntregas = 9;
        vecEntregas = new Entrega [cantEntregas];
        for (int i=0; i<cantEntregas; i++) {  // inicializo el vector 
            vecEntregas [i] = null;
        }
    }
    
    
    public void registrarEntrega (int I, Entrega E) {  // PUNTO 2.A
        vecEntregas [I-1] = E;
    }
    
    public boolean isAlumnoAprobado () {  // PUNTO 2.D
        int cantAprobados = 0;
        for (int i=0; i<this.cantEntregas; i++) {
            if ((vecEntregas[i] != null) && (vecEntregas[i].obtenerNota() > 4)) {
                cantAprobados++;
            }
        }
        if (cantAprobados > 3 && Ex.obtenerNota() > 4) {
            return true;
        }
        else
            return false;
    }
    
    
}
