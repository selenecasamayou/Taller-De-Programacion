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
public class Anual extends Sistema {
    
    
    public Anual (int añosConsecutivos, int año, Estacion e) {
        super(añosConsecutivos, año, e);
    }
    
    
    public double calcularProm(int año) {
        double sumaTotalTemperaturas = 0;
        for (int j=0; j<11; j++) {
            sumaTotalTemperaturas += this.obtenerTemperatura(año, j+1);
        }
        return (sumaTotalTemperaturas / 12);
    }
    
    public String toString () {  // PUNTO E
          String aux = super.toString();
        for (int i=0; i<this.getCantañosConsecutivos(); i++) {
            aux += "Año " + this.getPrimerAño()+i + " : " + this.calcularProm(i+this.getPrimerAño());
        }
        return aux;
    }
    
    
}
