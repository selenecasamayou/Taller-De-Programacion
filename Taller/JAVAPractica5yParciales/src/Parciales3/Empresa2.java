/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Parciales3;

/**
 *
 * @author Educación
 */
public class Empresa2 {
    private String nombre;
    private Zona [] vecZona;        
    private int cantZonas;  // DF
    private int dlZonas;
    
    
    public Empresa2 (String unNombre, int cantidadZonas) {
        nombre = unNombre;
        cantZonas = cantidadZonas;
        vecZona = new Zona [cantZonas]; 
        dlZonas = 0;
    }

    
    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCantidadZonas() {
        return cantZonas;
    }

    public int getCantidadZonasActual() {
        return dlZonas;
    }
    
    
    public void agregarZona (Zona Z) {  // PUNTO 2.A
        if (dlZonas < this.cantZonas) {
            vecZona [dlZonas] = Z;
            dlZonas++;
        }
    }
    
    
    public int obtenerZonaMax () {  // PUNTO 2.C
        int cantMediciones = 0;
        int zonaMax = 0, cantMedicionesMax = -1;
        for (int i=0; i<this.getCantidadZonasActual(); i++) {
            cantMediciones = vecZona[i].obtenerCantMediciones(i);
            if (cantMediciones > cantMedicionesMax) {
                cantMedicionesMax = cantMediciones;
                zonaMax = i;
            }
        }
        return zonaMax;
    }
    
    public String toString () {  // PUNTO 2.D
        String aux = ("Empresa " + this.nombre + " Cantidad de zonas : \n");
        for (int i=0; i<this.dlZonas; i++) {
            aux += ("Zona:" + (i + 1) + " Denominacion: " + vecZona[i].getDenominacion() + vecZona[i].toString(i));
        }
        return aux;
    }
}
