/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialesRedictado02;

/**
 *
 * @author Educación
 */
public class Estacion {
    private String direcc;
    private int DF;  // cant surtidores
    private int DL;
    private Surtidor [] vector;
    
    
    public Estacion (String unaDirecc) {
        direcc = unaDirecc;
        DF = 6;
        DL = 0;
        vector = new Surtidor [DF];
    }

    
    public String getDirecc() {
        return direcc;
    }

    private void setDirecc(String direcc) {
        this.direcc = direcc;
    }

    public int getCantSurtidores() {
        return DF;
    }

    public int getCantSurtidoresActual() {
        return DL;
    }
    
    
    public void agregarSurtidor(Surtidor S) {  // PUNTO 2.A
        if (DL < DF) {
            this.vector[DL] = S;
            DL++;
        }
    }
    
    public int surtidorConMayorMonto() {  // PUNTO 2.C
        int surtidorMax = 0, cantMontoEfectivo, montoMax = -1;
        for (int i=0; i<DL; i++) {
            cantMontoEfectivo = vector[i].montoTotalEfectivo();
            if (cantMontoEfectivo > montoMax) {
                montoMax = cantMontoEfectivo;
                surtidorMax = (i+1);  // porque va desde 0
            }
        }
        return surtidorMax;
    }
    
    public String toString () {  // PUNTO 2.D
        String aux = "Estacion de Servicio: " + this.direcc + ", cant surtidores: " + this.DL + "\n";
        for (int i=0; i<DL; i++) {
            aux += "Surtidor: " + (i+1) + ": " + this.vector[i].toString();
        }
        return aux;
    }
    
}
