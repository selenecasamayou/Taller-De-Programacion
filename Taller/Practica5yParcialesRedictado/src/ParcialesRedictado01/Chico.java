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
public class Chico {
    private String nombre;
    private int telefono;
    private boolean nadar;

    
    public Chico(String nombre, int telefono, boolean nadar) {
        this.nombre = nombre;
        this.telefono = telefono;
        this.nadar = nadar;
    }

    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    public boolean isNadar() {
        return nadar;
    }

    public void setNadar(boolean nadar) {
        this.nadar = nadar;
    }
    
    
    @Override
    public String toString() {
        return "Chico{" + "nombre=" + nombre + ", telefono=" + telefono + ", nadar=" + nadar + '}';
    }
    
    
    
}
