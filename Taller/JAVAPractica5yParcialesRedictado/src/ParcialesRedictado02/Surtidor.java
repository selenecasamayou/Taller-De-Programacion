/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialesRedictado02;

/**
 *
 * @author Educación
 */
public class Surtidor {
    private double combustible;
    private double precio;
    private int V;  // cant ventas
    private int DL;
    private Venta [] vector;
    
    
    public Surtidor (double unCombustible, double unPrecio, int cantVentas) {
        combustible = unCombustible;
        precio = unPrecio;
        V = cantVentas;
        DL = 0;
        vector = new Venta [V];
    }

    
    public double getCombustible() {
        return combustible;
    }

    private void setCombustible(double combustible) {
        this.combustible = combustible;
    }

    public double getPrecio() {
        return precio;
    }

    private void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getCantVentas() {
        return V;
    }

    public int getCantVentasActuales() {
        return DL;
    }
                                              // agrego el monto para que no quede en 0
    public void agregarVenta(int Nsurtidor, int dni, int cantLitros, double monto ,String pago) {  // PUNTO 2.B
        if (DL < V) {
            Venta Ve = new Venta (dni, cantLitros, monto, pago);
            this.vector[Nsurtidor-1] = Ve;
            DL++;
        }
    }
    
    public int montoTotalEfectivo () {
        int efectivo = 0;
        for (int j=0; j<DL; j++) {
            if (vector[j].getMedioPago().equals("efectivo")) {
                efectivo += vector[j].getMonto();
            }
        }
        return efectivo;
    }
    
    public String toString () {
        String aux = "Combustible: " + this.combustible + ", precio x litro: " + this.precio + "; ";
        for (int j=0; j<DL; j++) {
            aux += this.vector[j].toString();
        }
        return aux;
    }
    
    
}
