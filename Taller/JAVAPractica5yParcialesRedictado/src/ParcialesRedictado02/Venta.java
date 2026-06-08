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
public class Venta {
    private int dni;
    private int cantLitros;
    private double monto;
    private String medioPago;

    
    public Venta(int dni, int cantLitros, double monto, String medioPago) {
        this.dni = dni;
        this.cantLitros = cantLitros;
        this.monto = monto;
        this.medioPago = medioPago;
    }

    public int getDni() {
        return dni;
    }

    private void setDni(int dni) {
        this.dni = dni;
    }

    public int getCantLitros() {
        return cantLitros;
    }

    private void setCantLitros(int cantLitros) {
        this.cantLitros = cantLitros;
    }

    public double getMonto() {
        return monto;
    }

    private void setMonto(double monto) {
        this.monto = monto;
    }

    public String getMedioPago() {
        return medioPago;
    }

    private void setMedioPago(String medioPago) {
        this.medioPago = medioPago;
    }

    
    @Override
    public String toString() {
        return "Venta{" + "dni=" + dni + ", cantLitros=" + cantLitros + ", monto=" + monto + ", medioPago=" + medioPago + '}';
    }
    
    
    
}
