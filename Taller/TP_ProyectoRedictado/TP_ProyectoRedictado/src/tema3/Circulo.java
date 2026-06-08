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
public class Circulo {
    private double radio;
    private String colorRelleno;
    private String colorLinea;
    
    
    public Circulo (double unRadio, String unColorRelleno, String unColorLinea) {
        radio = unRadio;
        colorRelleno = unColorRelleno;
        colorLinea = unColorLinea;
    }
    
    
    public double getRadio () {
        return radio;
    }
    
    public void setRadio (double radio) {
        this.radio = radio;
    }

    public String getColorRelleno() {
        return colorRelleno;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }
    
    public String getColorLinea () {
        return colorLinea;
    }
    
    public void setColorLinea (String colorLinea) {
        this.colorLinea = colorLinea;
    }
    
    
    public double calcularPerimetro () {
        return (2 * Math.PI * this.radio);
    }
    
    public double calcularArea () {
        return ((this.radio * this.radio) * Math.PI);
    }
    
}
