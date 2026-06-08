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
public class Fecha {
    private String ciudad;
    private int dia;
    
    
    public Fecha (String unaCiudad, int unDia) {
        ciudad = unaCiudad;
        dia = unDia;
    }

    public String getCiudad() {
        return ciudad;
    }

    private void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public int getDia() {
        return dia;
    }

    private void setDia(int dia) {
        this.dia = dia;
    }
    
    
    
    
}
