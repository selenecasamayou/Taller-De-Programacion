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
public abstract class Sitio {
    private String nombre;
    private String direcc;
    private int cantUsuarios;
    
    
    public Sitio (String unNombre, String unaDirecc) {
        nombre = unNombre;
        direcc = unaDirecc;
        cantUsuarios = 0;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDirecc() {
        return direcc;
    }

    public void setDirecc(String direcc) {
        this.direcc = direcc;
    }

    public int getCantUsuarios() {
        return cantUsuarios;
    }

    public void setCantUsuarios(int cantusuarios) {
        this.cantUsuarios = cantusuarios;
    }
    
    
    public abstract double cotizarSitio();
    
    public String toString () {
        return ("Nombre: " + this.nombre + "; " + "Direccion: " + this.direcc + "; " + this.cantUsuarios + "; " + cotizarSitio());
    }
    
}
