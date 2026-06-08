/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4;

/**
 *
 * @author Educación
 */
public class Mensual extends Sistema {
    
    
    public Mensual (int añosConsecutivos, int año, Estacion e) {
        super(añosConsecutivos, año, e);
    }
    
    
    public double calcularProm(int mes) { 
        double sumaTotalTemperaturas = 0;
        for (int i=0; i<this.getCantañosConsecutivos(); i++) {
            sumaTotalTemperaturas += this.obtenerTemperatura(i+this.getPrimerAño(), mes);
        }
        return (sumaTotalTemperaturas / this.getCantañosConsecutivos());
    }
    
    public String toString () {  // PUNTO E
        String aux = super.toString();
        for (int j=0; j<12; j++) {
            aux += ("Mes " + j+1 + " : " + this.calcularProm(j+1)) ;
        }
        return aux;
    }
    
    
    
}
