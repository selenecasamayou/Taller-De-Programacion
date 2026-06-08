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
public class Goleador {
    private String nombre;
    private String nombreEquipo;
    private int cantGoles;

    
    public Goleador(String nombre, String nombreEquipo, int cantGoles) {
        this.nombre = nombre;
        this.nombreEquipo = nombreEquipo;
        this.cantGoles = cantGoles;
    }

    
    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getNombreEquipo() {
        return nombreEquipo;
    }

    private void setNombreEquipo(String nombreEquipo) {
        this.nombreEquipo = nombreEquipo;
    }

    public int getCantGoles() {
        return cantGoles;
    }

    private void setCantGoles(int cantGoles) {
        this.cantGoles = cantGoles;
    }

    
    @Override
    public String toString() {
        return "Goleador{" + "nombre=" + nombre + ", nombreEquipo=" + nombreEquipo + ", cantGoles=" + cantGoles + '}';
    }
    
    
    
    
    
    
    
}
