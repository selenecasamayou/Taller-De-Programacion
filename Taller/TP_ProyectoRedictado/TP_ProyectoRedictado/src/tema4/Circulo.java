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
public class Circulo extends Figura{
    private double radio;
    
    
    public Circulo (double unRadio, String unColorRelleno, String unColorLinea) {
        super(unColorRelleno, unColorLinea);
        setRadio(unRadio);
    }

    
    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }
    
    
    public double calcularPerimetro() {
        return (2 * Math.PI * this.getRadio());
    }
    
    public double calcularArea () {
        return ((this.getRadio() * this.getRadio()) * Math.PI);
    }
    
    public String toString () {
        return (super.toString() + " Radio: " + this.getRadio());
    }
    
    
}
