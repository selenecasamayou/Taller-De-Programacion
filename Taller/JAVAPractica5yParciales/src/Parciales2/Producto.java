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
public class Producto {
    private int codigo;
    private String nombreProd;
    private String marca;
    private int cantUni;
    private double precioXUni;

    
    public Producto(int codigo, String nombreProd, String marca, int cantUni, double precioXUni) {
        this.codigo = codigo;
        this.nombreProd = nombreProd;
        this.marca = marca;
        this.cantUni = cantUni;
        this.precioXUni = precioXUni;
    }

    
    public int getCodigo() {
        return codigo;
    }

    private void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombreProd() {
        return nombreProd;
    }

    private void setNombreProd(String nombreProd) {
        this.nombreProd = nombreProd;
    }

    public String getMarca() {
        return marca;
    }

    private void setMarca(String marca) {
        this.marca = marca;
    }

    public int getCantUni() {
        return cantUni;
    }

    private void setCantUni(int cantUni) {
        this.cantUni = cantUni;
    }

    public double getPrecioXUni() {
        return precioXUni;
    }

    private void setPrecioXUni(double precioXUni) {
        this.precioXUni = precioXUni;
    }

    @Override
    public String toString() {
        return "Producto{" + "Codigo=" + codigo + "- nombre=" + nombreProd + "- marca=" + marca + "- cantidad de unidades exhibidas=" + cantUni + "- precio por unidad=" + precioXUni + '}';
    }
    
    
    
    
}
