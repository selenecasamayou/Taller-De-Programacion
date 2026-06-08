/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialesRedictado01;

/**
 *
 * @author Educación
 */
public class Comidas extends Delivery{
    private int cantPedidos;
    private double monto;
    private int cantRestaurantes;
    
    
    public Comidas (String nombre, String direcc) {
        super(nombre, direcc);
        cantPedidos = 0;
        monto = 0;
        cantRestaurantes = 0;
    }

    
    public int getCantPedidos() {
        return cantPedidos;
    }

    private void setCantPedidos(int cantPedidos) {
        this.cantPedidos = cantPedidos;
    }

    public double getMonto() {
        return monto;
    }

    private void setMonto(double monto) {
        this.monto = monto;
    }

    public int getCantRestaurantes() {
        return cantRestaurantes;
    }

    private void setCantRestaurantes(int cantRestaurantes) {
        this.cantRestaurantes = cantRestaurantes;
    }
    
    
    public void registrarPedidoComida (double monto) {  // PUNTO B , preguntar si esta bien
        this.monto += monto;
        this.cantPedidos++;
    }
    
    public double calclarCotizacionComercial() {  // preguntar si la cant usuarios = cant pedidos
        return ((this.cantRestaurantes * 500) + (this.getCantUsuarios() * 50) + this.monto);
    }
    
    
}
