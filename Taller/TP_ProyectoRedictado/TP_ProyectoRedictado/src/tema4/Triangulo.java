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
public class Triangulo extends Figura{
    private int lado1;
    private int lado2;
    private int lado3;
    
    
    public Triangulo (int unLado1, int unLado2, int unLado3, String unColorRelleno, String unColorLinea) {
        super(unColorRelleno, unColorLinea);  // inicializo
        setLado1(unLado1);
        setLado2(unLado2);
        setLado3(unLado3);
    }

    public int getLado1() {
        return lado1;
    }

    public void setLado1(int lado1) {
        this.lado1 = lado1;
    }

    public int getLado2() {
        return lado2;
    }

    public void setLado2(int lado2) {
        this.lado2 = lado2;
    }

    public int getLado3() {
        return lado3;
    }

    public void setLado3(int lado3) {
        this.lado3 = lado3;
    }
    
    
    
    public double calcularPerimetro () {
        return (this.getLado1() * this.getLado2() * this.getLado3());
    }
    
    public double calcularS () {
        return this.calcularPerimetro() / 2;
    }
    
    public double calcularArea () {
        double S = this.calcularS();
        return Math.sqrt(S * (S + this.getLado1()) * (S - this.getLado2()) * (S - this.getLado3()));
    }
    
    public String toString () {
        return (super.toString() + " Lado 1: " + this.getLado1() + " Lado 2: " + this.getLado2() + 
                " Lado 3: " + this.getLado3()); 
    }
    
}
