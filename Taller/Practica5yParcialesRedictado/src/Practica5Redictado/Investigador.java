/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica5Redictado;

/**
 *
 * @author Educación
 */
public class Investigador {
    private String nombre;
    private int categoria;
    private String especialidad;
    private int DF;
    private int DL;
    private Subsidio [] vecSub;
    
    
    public Investigador (String unNombre, int unaCategoria, String unaEspecialidad) {
        nombre = unNombre;
        categoria = unaCategoria;
        especialidad = unaEspecialidad;
        DF = 5;
        DL = 0;
        vecSub = new Subsidio [DF];
    }

    
    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCategoria() {
        return categoria;
    }

    private void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    private void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public int getCantSubsidios() {
        return DF;
    }

    public int getCantSubsidiosActual() {
        return DL;
    }
    
    
    public void agregarSubsidio (Subsidio S) {  // PUNTO 2.B
        if (DL < DF) {
            this.vecSub[DL] = S;
            DL++;
        }
    }
    
    public double montoInvestigador () {
        double montoInv = 0;
        for (int j=0; j<DL; j++) {
            montoInv += this.vecSub[j].getMonto();
        }
        return montoInv;
    }
    
    public void otorgarSubsidios() {
        for (int i=0; i<DL; i++) {  // preguntar si hace falta preguntar si esta otorgado o no (teniendo en cuenta 
            this.vecSub[i].setOtorgado(true);                            // que todos estan no otorgados al inicio)
        }
    }

    @Override
    public String toString() {
        return "Investigador " + nombre + ", categoria: " + categoria + ", especialidad: " + especialidad + " monto subsidios: " + this.montoInvestigador();
    }
    
    
    
    
}
