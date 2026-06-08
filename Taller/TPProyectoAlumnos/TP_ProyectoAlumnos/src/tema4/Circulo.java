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
public class Circulo extends Figura {  // PUNTO 1.C
    private double radio;
    
    public Circulo (double unRadio, String unColorRelleno, String unColorLinea) {
        super(unColorRelleno, unColorLinea);
        setRadio(unRadio);    
    }
    
    public double getRadio () {
        return radio;
    }
    
    public void setRadio (double unRadio) {
        this.radio = unRadio;
    }
    
    public double calcularArea () {
        return this.radio * 2 * Math.PI;
    }
    
    public double calcularPerimetro () {
        return this.radio * 2 * 2;
    }
    
    public String toString () {
        String aux = (super.toString() + " Radio: " + this.getRadio());
        return aux;
    }
    
}
    
