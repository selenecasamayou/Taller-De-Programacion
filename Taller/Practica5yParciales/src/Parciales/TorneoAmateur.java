/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Parciales;

/**
 *
 * @author Educación
 */
public class TorneoAmateur extends Sitio{
    private int cantTorneos;
    private int cantClicks;
    
    
    public TorneoAmateur (String unNombre,String unaDirecc) {
        super (unNombre, unaDirecc);
        cantTorneos = 0;
        cantClicks = 0;
    }

    public int getCantTorneos() {
        return cantTorneos;
    }

    public void setCantTorneos(int cantTorneos) {
        this.cantTorneos = cantTorneos;
    }

    public int getCantClicks() {
        return cantClicks;
    }

    public void setCantClicks(int cantClicks) {
        this.cantClicks = cantClicks;
    }
    
    
    public double cotizarSitio () {  // PUNTO 2.B
        return ((10 * this.cantClicks) + (50 * this.getCantUsuarios()));
    }
    
    public void registrarTorneoAmateur (int sumaClicks) {
        this.cantClicks += sumaClicks;
        this.cantTorneos ++;
    }
    
}
