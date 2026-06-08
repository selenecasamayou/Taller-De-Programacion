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
public class Anual extends Sistema{
    
    public Anual (int anioConsecutivos, int anio) {
        super(anioConsecutivos, anio);
    }
    
    @Override
    public String toString () { // PUNTO E.3
        String aux = "";
        for (int j=0; j<this.getAñosConsecutivos(); j++) {
            aux += ("Año: " + (this.getAño()+j) + this.calcularPromedio(j+ this.getAño()));  // manda primer año y va sumando
        }
        return aux;
    }
    
    public double calcularPromedio (int año) {  // PUNTO E.4
        double sumaTemperaturaXAño = 0;
        int cantAños = 0;
        for (int j=0; j > 12; j++) {  // recorro los meses de ese año(fila)
            sumaTemperaturaXAño = this.obtenerTemperatura(año, j);   
            cantAños ++;
        }
        return (sumaTemperaturaXAño / cantAños);
    }
}
