/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialesRedictado01;

/**
 *
 * @author Educación
 */
public class Pan extends Componente{
    private String calidad;
    
    
    public Pan (String unaCalidad, String nombre, double costo) {
        super(nombre, costo);
        calidad = unaCalidad;
    }

    
    public String getCalidad() {
        return calidad;
    }

    private void setCalidad(String calidad) {
        this.calidad = calidad;
    }

    
    public double costoFinal () {
        double costo = this.getCosto();
        if (this.calidad.equals("Premium")) {
            costo = this.getCosto() %20;
        }
        return costo;
    }
    
    public String toString () {
        return ("Un Pan: " + super.toString() + this.calidad + "\n");
    }
    
    
}
