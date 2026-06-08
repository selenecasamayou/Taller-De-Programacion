/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

/**
 *
 * @author Educación
 */
public class Hotel {
    private int DF;
    private Habitacion vector [];        
            
    
    public Hotel (int NHabitaciones) {
        DF = NHabitaciones;
        vector = new Habitacion [DF];  // hace falta inicializar??
        for (int i=0; i<DF; i++) {
            vector[i] = new Habitacion();
        }
    }
    
    
    public int getCantHabitaciones () {
        return DF;
    }
    
    
    public void agregarCliente(Persona C, int habitacionX) {
        vector[habitacionX-1].ocuár(C);
    }
            
    public void aumentarPrecio(double monto) {
        for (int i=0; i<DF; i++) {
            vector[i].aumentar(monto);  // actualizo precio
        }
    }
    
    public String toString () {
        String aux = "";
        for (int i=0; i<DF; i++) {
            aux += ("Habitacion " + i + " : " + vector[i].toString());
        }
        return aux;
    }
    
}
