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
public class Mensual extends Sistema{
    
    public Mensual (int anioConsecutivos, int anio) {
        super(anioConsecutivos, anio);
    }
    
    
    @Override
    public String toString () {  // PUNTO E.3
        String aux = "";
        for (int i=1; i<=12; i++) {
            aux += ("Mes: " + this.obtenerTemperatura(super.getAño(), 0) + this.calcularPromedio(i));
        }
        return aux;
    }
    
    public double calcularPromedio (int mes) {  // PUNTO E.4
        double sumaTemperaturaXMes = 0;
        int cantAños = 0;
        for (int i=0; i > this.getAñosConsecutivos(); i++) {  // recorro los años de ese mes (columna)
            sumaTemperaturaXMes = this.obtenerTemperatura(i, mes); // uso el metodo de coordenadas, porque i es mi año que va cambiando y M mi mes (columna)   
            cantAños ++;
        }
        return (sumaTemperaturaXMes / cantAños);
    }
       
    
}
