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
import PaqueteLectura.GeneradorAleatorio;
public class Habitacion {
    private double costo;
    private boolean ocupada;
    private Persona cliente;
    
    
    public Habitacion () {
        costo = GeneradorAleatorio.generarDouble(8000-2000) + 2000;
        ocupada = false;
        cliente = null;
    }
    
    
    public double getCosto () {
        return costo;
    }
    
    private void setCosto (double costo) {
        this.costo = costo;
    }
    
    public boolean getOcupada () {
        return ocupada;
    }

    public void setOcupada(boolean ocupada) {   // para avisar que se ocupo la habitacion
        this.ocupada = ocupada;
    }
    
    public Persona getCliente() {
        return cliente;
    }

    public void setCliente(Persona cliente) {
        this.cliente = cliente;
    }
    
    
    public void ocuár (Persona C) {
        this.cliente = C;
        this.setOcupada(true);
    }
    
    public void aumentar(double monto) {
        this.costo+= monto;
    }
    
    
    public String toString () {
        String aux = this.costo + "";
        if (this.ocupada = true) {
            aux += (this.ocupada + " cliente: " + this.cliente.toString());
        }
        else
            aux += this.ocupada;
        return aux;
    }
    
}
