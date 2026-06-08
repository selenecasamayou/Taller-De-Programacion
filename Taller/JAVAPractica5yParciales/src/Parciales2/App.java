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
public abstract class App {
    private String nombre;
    private String direcc;
    private int cantUsuarios;
    
    
    public App (String unNombre, String unaDirecc) {
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
    
    
    public abstract double calcularCotizacionComercial ();  // PUNTO 2.C
    
    public String toString () {  // PUNTO 2.D
        return ("Nombre: " + this.nombre + " Direccion Web: " + this.direcc + " Cantidad de Usuarios: " 
                + this.cantUsuarios + " Cotizacion Comercial: " + calcularCotizacionComercial());
    }
}
