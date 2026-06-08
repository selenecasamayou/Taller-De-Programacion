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
    private Cliente cliente;
    
    
    public Habitacion (double unCosto) {  // PUNTO II
        costo = unCosto;
        cliente = null;
    } 

    public Habitacion (boolean unaDisponibilidad, Cliente unCliente) {  // PUNTO II
        costo = (GeneradorAleatorio.generarDouble(2000-8000));
        cliente = unCliente;
    } 

    public double getCosto() {  // PUNTO I
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }


    public Cliente getCliente() {
        return cliente;
    }
    
    public boolean isDisponible() { // compara si esta vacia la habitacion
        return this.cliente == null;
    }
    
    public void ocupar(Cliente cliente) {
        this.cliente = cliente;
    }
    

    @Override
    public String toString() {
        String aux = "Habitacion{" + "costo=" + costo;
        if(!this.isDisponible())  // Si esta disponible imprime el cliente que esta ahi
            aux += "Ocupada " + cliente.toString() + "}";
        else 
            aux += "Libre}";
        return aux;
    }
    
    public void aumentar (double monto) {
        this.costo += monto;
    }
}
