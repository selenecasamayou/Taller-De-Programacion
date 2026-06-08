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
public class Zona {
    private String denominacion;
    private Medicion [] vecMediciones;
    private int maximoMediciones;
            

    public Zona(String denominacion, int cantidadMediciones) {
        this.denominacion = denominacion;
        this.maximoMediciones = cantidadMediciones;
        vecMediciones = new Medicion [maximoMediciones];
        for (int i=0; i<this.maximoMediciones; i++) {  // inicializo vector
            vecMediciones[i] = null;
        }
    }

    public String getDenominacion() {
        return denominacion;
    }

    private void setDenominacion(String denominacion) {
        this.denominacion = denominacion;
    }

    public int getCantidadMediciones() {
        return maximoMediciones;
    }
    
    
    public void agregarMedicion (int posZona, Medicion M) {  // PUNTO 2.B
        vecMediciones [posZona-1] = M;
    }
    
    public int obtenerCantMediciones(int j) {
        int cantM = 0;
        for (j=0; j<this.maximoMediciones; j++) {
            if (vecMediciones[j] != null && vecMediciones[j].isSuperaPeriodoAnterior()) {
                cantM++;
            }
        }
        return cantM;
    }
    
    public String toString (int j) {
        String aux = "";
        for (j=0; j<this.getCantidadMediciones(); j++) {
            aux += ("Mediciones: " + vecMediciones[j].toString());
        }
        return aux;
    }
    
}
