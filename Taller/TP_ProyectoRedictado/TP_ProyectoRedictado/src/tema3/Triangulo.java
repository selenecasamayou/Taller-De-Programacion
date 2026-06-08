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
public class Triangulo {
    private double lado1;
    private double lado2;
    private double lado3;
    private String colorRelleno;
    private String colorLinea;
    
    
    public Triangulo (int unLado1, int unLado2, int unLado3, String unColorRelleno, String unColorLinea) {
        lado1 = unLado1;
        lado2 = unLado2;
        lado3 = unLado3;
        colorRelleno = unColorRelleno;
        colorLinea = unColorLinea;
    }

    Triangulo(double lado1, double lado2, double lado3, String colorRelleno, String colorLinea) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    
    public double getLado1 () {
        return lado1;
    }
    
    private void setLado1 (double lado1) {
        this.lado1 = lado1;
    }
    
    public double getLado2 () {
        return lado2;
    }
    
    private void setLado2 (double lado2) {
        this.lado2 = lado2;
    }
    
    public double getLado3 () {
        return lado3;
    }
    
    private void setLado3 (double lado3) {
        this.lado3 = lado3;
    }
    
    public String getColorRelleno () {
        return colorRelleno;
    }
    
    private void setColorRelleno (String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }
    
    public String getColorLinea () {
        return colorLinea;
    }
    
    private void setColorLinea (String colorLinea) {
        this.colorLinea = colorLinea;
    }
    
    
    public double calcularPerimetro () {
        return (this.lado1 + this.lado2 + this.lado3);
    }
    
    public double calcularS () {
        return this.calcularPerimetro() / 2;
    }
    
    public double calcularArea () {
        double S = this.calcularS();
        return Math.sqrt(S * (S - this.getLado1()) * (S - this.getLado2()) * (S - this.getLado3()));
    }
            
}
