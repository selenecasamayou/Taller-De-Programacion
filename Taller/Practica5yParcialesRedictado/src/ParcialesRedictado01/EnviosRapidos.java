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
public class EnviosRapidos extends Delivery{
    private Envio [] vector;
    private int N;  // DF
    private int DL;
    
    
    public EnviosRapidos (int cantEnvios, String nombre, String direcc) { 
        super(nombre, direcc);
        N = cantEnvios;
        DL = 0;
        vector = new Envio [cantEnvios];
    }
    

    public int getCantEnvios() {
        return N;
    }

    public int getCantEnviosActual() {
        return DL;
    }
    
    
    public boolean registrarPedidoEnvio (Envio E) {  // PUNTO A
        boolean registrar = true;
        if (DL < N) {  
            this.vector[DL] = E;
            DL++;
        }
        else
            registrar = false;
        return registrar;
    }
    
    public double calclarCotizacionComercial() {
        double cantMontoPedidos = (this.N * 400);
        for (int i=0; i<this.DL; i++) {
            cantMontoPedidos += vector[i].calcularRecaudacionEnvio();
        }
        return cantMontoPedidos;
    }
    
}
