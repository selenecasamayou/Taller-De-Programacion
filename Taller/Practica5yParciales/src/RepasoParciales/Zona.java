/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package RepasoParciales;

/**
 *
 * @author Educación
 */
public class Zona {
    private String denominacion;
    private Medicion [] vecMediciones;
    private int cantMediciones; 
           
    
    public Zona(String denominacion, int cantMediciones) {
        this.denominacion = denominacion;
        this.cantMediciones = cantMediciones;       
        vecMediciones = new Medicion [cantMediciones];
    }

    
    public String getDenominacion() {
        return denominacion;
    }

    private void setDenominacion(String denominacion) {
        this.denominacion = denominacion;
    }

    public int getCantMediciones() {
        return cantMediciones;
    }

   
   public void agregarMedicion(int numZona, Medicion M) {  // PUNTO 2.B
       this.vecMediciones[numZona-1] = M;
   }
   
   public int obtenerMediciones() {
       int cantMedicionesCumple = 0;
       for (int i=0; i < this.cantMediciones; i++) {
           if ((vecMediciones[i] != null) && (vecMediciones[i].isSuperaPeriodoAnterior())) {
               cantMedicionesCumple++;
           }
       }
       return cantMedicionesCumple;
   }
   
   public String toString () {
       String aux = "";
       for (int j=0; j < this.cantMediciones; j++) {
           if (vecMediciones[j] != null) {
               aux += (this.getDenominacion() + "; " + this.vecMediciones[j].toString());
           }
       }
       return aux;
   }
   
}
