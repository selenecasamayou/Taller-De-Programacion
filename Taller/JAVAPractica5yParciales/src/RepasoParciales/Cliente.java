/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package RepasoParciales;

/**
 *
 * @author Educación
 */
public class Cliente {
    private int dni;
    private String nombre;
    private int telefono;
    private String localidad;
    private boolean seguroAdicional;

    
    public Cliente(int dni, String nombre, int telefono, String localidad, boolean seguroAdicional) {
        this.dni = dni;
        this.nombre = nombre;
        this.telefono = telefono;
        this.localidad = localidad;
        this.seguroAdicional = seguroAdicional;
    }

    
    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
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

    public String getLocalidad() {
        return localidad;
    }

    public void setLocalidad(String localidad) {
        this.localidad = localidad;
    }

    public boolean isSeguroAdicional() {
        return seguroAdicional;
    }

    public void setSeguroAdicional(boolean seguroAdicional) {
        this.seguroAdicional = seguroAdicional;
    }

    @Override
    public String toString() {
        String aux = ("Cliente{" + "dni=" + dni + ", nombre=" + nombre + ", telefono=" + telefono + ", localidad=" + localidad + ", seguroAdicional=");
        if (this.isSeguroAdicional()) {
            aux += ("asegurado}");
        }
        else
            aux += ("sin seguro}");
        return aux;
    }
    
    
    
    
    
}
