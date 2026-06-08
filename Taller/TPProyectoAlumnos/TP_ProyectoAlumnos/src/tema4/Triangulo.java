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
public class Triangulo extends Figura {  // PUNTO 1.B
    private double lado1;
    private double lado2;
    private double lado3;
    
    
    public Triangulo (double unLado1, double unLado2, double unLado3, String unColorRelleno, String unColorLinea) {
        super (unColorRelleno, unColorLinea);
        setLado1(unLado1);
        setLado2(unLado2);
        setLado3(unLado3);
    }
    
    public double getLado1 () {
        return lado1;
    }
    
    public void setLado1 (double unLado1) {
        this.lado1 = unLado1;
    }

    public double getLado2() {
        return lado2;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }
    
    public double getLado3 () {
        return lado3;
    }
    
    public void setLado3 (double unLado3) {
        this.lado3 = unLado3;
    }
    
    
    public double calcularArea () {
        double S = this.calcularS();
        return Math.sqrt(S* (S - this.getLado1()) * (S - this.getLado2()) * (S - this.getLado3()));
    }
    
    private double calcularS () {
        return (this.getLado1() + this.getLado2() + this.getLado3());
    }
    
    public double calcularPerimetro () {
        return (this.getLado1() + this.getLado2() + this.getLado3());
    }
    
    public String toString () {
        String aux = (super.toString() + " Lado 1 " + this.getLado1() + 
                       " Lado 2" + this.getLado2() + " Lado 3" + this.getLado3());
        return aux;
    }
}
