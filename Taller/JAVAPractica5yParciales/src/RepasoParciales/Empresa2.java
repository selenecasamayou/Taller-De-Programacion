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
public class Empresa2 {
    private String nombre;
    private Zona [] vecZonas;
    private int cantZonas;
    private int DL;
    
    
    public Empresa2(String unNombre, int cantZonas) {
        this.nombre = unNombre;
        this.cantZonas = cantZonas;
        DL = 0;
        vecZonas = new Zona [cantZonas];
    }

    
    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCantZonas() {
        return cantZonas;
    }

    public int getCantZonasActual() {
        return DL;
    }
    
    
    public void agregarZona(Zona Z) {  //PUNTO 2.A
        if (this.DL < this.cantZonas) {
            this.vecZonas[DL] = Z;
            DL++;
        }
    }
    
    public int obtenerZonaMax() {  //PUNTO 2.C
        int zonaMax = 0; 
        int cantMediciones, cantMedicionesMax = -1;
        for (int i=0; i < this.DL; i++) {
            cantMediciones= this.vecZonas[i].obtenerMediciones();
            if (cantMediciones > cantMedicionesMax) {
                cantMedicionesMax = cantMediciones;
                zonaMax = i;
            }
        }
        return zonaMax;
    }
    
    public String toString () {  //PUNTO 2.D
        String aux = ("Empresa: " + this.getNombre() + " Cantidad de Zonas:" + "\n");
        for (int i=0; i < this.DL; i++) {
            aux += ("Zona " + (i+1) + ":" + vecZonas[i].toString() + "\n");
        }
        return aux;
    }
    
}
