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
public class Producto {
    private int codigo;
    private String nombre;
    private String marca;
    private int cantUni;
    private double precioXuni;

    
    public Producto(int codigo, String nombre, String marca, int cantUni, double precioXuni) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.marca = marca;
        this.cantUni = cantUni;
        this.precioXuni = precioXuni;
    }

    
    public int getCodigo() {
        return codigo;
    }

    private void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
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

    public double getPrecioXuni() {
        return precioXuni;
    }

    private void setPrecioXuni(double precioXuni) {
        this.precioXuni = precioXuni;
    }

    
    @Override
    public String toString() {
        return "Producto{" + "codigo=" + codigo + ", nombre=" + nombre + ", marca=" + marca + ", cantUni=" + cantUni + ", precioXuni=" + precioXuni + '}';
    }
    
    
    
    
}
