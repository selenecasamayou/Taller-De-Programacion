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
public class Cliente {
    private int dni;
    private String nombre;
    private int telefono;
    private String localidad;
    private boolean contrato;

    
    public Cliente(int dni, String nombre, int telefono, String localidad, boolean contrato) {
        this.dni = dni;
        this.nombre = nombre;
        this.telefono = telefono;
        this.localidad = localidad;
        this.contrato = contrato;
    }
    
    
    public int getDni() {
        return dni;
    }

    private void setDni(int dni) {
        this.dni = dni;
    }

    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getTelefono() {
        return telefono;
    }

    private void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    public String getLocalidad() {
        return localidad;
    }

    private void setLocalidad(String localidad) {
        this.localidad = localidad;
    }
    
    public boolean isContrato() {
        return contrato;
    }

    private void setContrato(boolean contrato) {
        this.contrato = contrato;
    }

    @Override
    public String toString() {
        return "Cliente{" + "dni=" + dni + ", nombre=" + nombre + ", telefono=" + telefono + ", localidad=" + localidad + ", contrato=" + contrato + '}';
    }
    
    
    
}
