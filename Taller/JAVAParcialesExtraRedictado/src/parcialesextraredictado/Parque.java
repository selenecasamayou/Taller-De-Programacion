/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialesextraredictado;

/**
 *
 * @author Educación
 */
public class Parque {
    private String nombre;
    private String provincia;
    private int DF;  // cant especies
    private int DL;
    private Especie [] vector;
    
    
    public Parque (String nombre, String provincia, int cantEspecies) {
        this.nombre = nombre;
        this.provincia = provincia;
        DF = cantEspecies;
        DL = 0;
        vector = new Especie [DF];
    }

    
    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getProvincia() {
        return provincia;
    }

    private void setProvincia(String provincia) {
        this.provincia = provincia;
    }

    public int getCantEspecies() {
        return DF;
    }

    public int getCantEspeciesActual() {
        return DL;
    }
    
    
    public void agregarEspecie (Especie E) {  // PUNTO 2.A
        if (DL < DF) {
            this.vector[DL] = E;
            DL++;
        }
    }
    
    public int obtenerNivelProteccion() {  // PUNTO 2.B
        int proteccion = 2, cantCondicion = 0, canTotal = 0;
        double promedio;
        for (int i=0; i<DL; i++) {
            if (this.vector[i].isProtegida()) {
                cantCondicion++;
            }
            canTotal++;
        }
        promedio = (cantCondicion * 100) / canTotal;
        if (promedio < 25) {
            proteccion = 1;
        }
        return proteccion;
    }
    
    public void incrementarEjemplares (String nombre, int cant) {  // PUNTO 2.C
        boolean buscar = false;
        int i = 0;
        while ((i < DL) && (buscar)) {
            if (this.vector[i].getNombre().equals(nombre)) {
                this.vector[i].incrementar(cant);
                buscar = false;
            }
        }
    }
    
    public String toString () {  // PUNTO 2.D
        String aux = "Parque: " + this.nombre + " - Provincia: " + this.provincia;
        for (int i=0; i<DL; i++) {
            aux += this.vector[i].toString();
        }
        return aux;
    }
    
    
    
}
