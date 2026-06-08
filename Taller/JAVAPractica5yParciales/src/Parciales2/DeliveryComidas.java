/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Parciales2;

/**
 *
 * @author Educación
 */
public class DeliveryComidas extends App{
    private int cantPedidos;
    private double monto;
    private int cantRestaurantes;
    
    
    public DeliveryComidas (String nombre, String direcc) {
        super (nombre, direcc);
        cantPedidos = 0;
        monto = 0;
        cantRestaurantes = 0;
    }

    public int getCantPedidos() {
        return cantPedidos;
    }

    public void setCantPedidos(int cantPedidos) {
        this.cantPedidos = cantPedidos;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public int getCantRestaurantes() {
        return cantRestaurantes;
    }

    public void setCantRestaurantes(int cantRestaurantes) {
        this.cantRestaurantes = cantRestaurantes;
    }
    
    
    public void registrarPedidoComida (double m) {  // PUNTO 2.B
        this.monto += m;
        this.cantPedidos++;
    }
    
    
    public double calcularCotizacionComercial () {
        return ((500 * this.cantRestaurantes) + ((50 * this.getCantUsuarios()) + this.monto));
    }
    
}
