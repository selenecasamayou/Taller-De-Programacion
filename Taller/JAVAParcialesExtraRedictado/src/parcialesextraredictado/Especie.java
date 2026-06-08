/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialesextraredictado;

/**
 *
 * @author Educación
 */
public class Especie {
    private String nombre;
    private int cantEj;
    private boolean protegida;

    
    public Especie(String nombre, int cantEj, boolean protegida) {
        this.nombre = nombre;
        this.cantEj = cantEj;
        this.protegida = protegida;
    }

    
    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCantEj() {
        return cantEj;
    }

    private void setCantEj(int cantEj) {
        this.cantEj = cantEj;
    }

    public boolean isProtegida() {
        return protegida;
    }

    private void setProtegida(boolean protegida) {
        this.protegida = protegida;
    }
    
    public void incrementar (int cant) {
        this.cantEj += cant;
    }

    
    @Override
    public String toString() {
        return "Especie{" + "nombre=" + nombre + ", cantEj=" + cantEj + ", protegida=" + protegida + "} \n";
    }
    
    
    
    
    
}
