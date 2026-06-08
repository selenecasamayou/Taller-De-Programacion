/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Parciales2;

/**
 *
 * @author Educación
 */
public class EnviosRapidos extends App{
    private Envio [] vecEnvios;
    private int enviosN;   // DF
    private int cantidadEnviosActual;  // DL
    
    
    public EnviosRapidos (int cantidadEnvios, String nombre, String direcc) {
        super (nombre, direcc);
        enviosN = cantidadEnvios;
        vecEnvios = new Envio [enviosN];
        for (int i=0; i<enviosN; i++) {  // inicializo vector
            this.vecEnvios[i] = null;
        }
        cantidadEnviosActual = 0;
    }

    
    public int getEnviosTotales() {
        return enviosN;
    }

    public int getCantidadEnviosActual() {
        return cantidadEnviosActual;
    }
    
    
    public boolean registrarPedidoEnvio (Envio E) {  // PUNTO 2.A
        boolean aux = false;
        if (this.cantidadEnviosActual<this.enviosN) {
            this.vecEnvios[cantidadEnviosActual] = E;
            cantidadEnviosActual++;
            aux = true;
        }
        return aux;
    }
    
    public double calcularCotizacionComercial () {  
        double aux = 0;
        for (int i=0; i<this.getCantidadEnviosActual(); i++) {
            aux += (400 + (vecEnvios[i].getMontoCobrado() - vecEnvios[i].getCostoEnvio()));
        }
        return aux;
    }
    
}
