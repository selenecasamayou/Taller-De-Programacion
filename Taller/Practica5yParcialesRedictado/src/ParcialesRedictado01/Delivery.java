/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialesRedictado01;

/**
 *
 * @author Educación
 */
public abstract class Delivery {
    private String nombre;
    private String direcc;
    private int cantUsuarios;
    
    
    public Delivery (String unNombre, String unaDirecc) {
        nombre = unNombre;
        direcc = unaDirecc;
        cantUsuarios = 0;
    }

    
    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDirecc() {
        return direcc;
    }

    private void setDirecc(String direcc) {
        this.direcc = direcc;
    }

    public int getCantUsuarios() {
        return cantUsuarios;
    }

    private void setCantUsuarios(int cantUsuarios) {
        this.cantUsuarios = cantUsuarios;
    }
    
    
    public abstract double calclarCotizacionComercial();  // PUNTO C
    
    public String toString () {  // PUNTO D
        return ("App: " + this.nombre + " Direccion Web " + this.direcc + " Cant Usuarios " + this.cantUsuarios 
                + " Cotizacion Comercial: " + this.calclarCotizacionComercial());
    }
    
    
}
