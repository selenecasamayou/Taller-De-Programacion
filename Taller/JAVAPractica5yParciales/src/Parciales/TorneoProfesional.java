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
public class TorneoProfesional extends Sitio{
    private Torneo [] vecTorneos;
    private int N;  // DF
    private int DL;
    
    
    public TorneoProfesional (int unN, String unNombre, String unaDirecc) {
        super (unNombre, unaDirecc);
        N = unN;
        vecTorneos = new Torneo [N];
        DL = 0;
    }

    public int getCantidadTorneos() {
        return N;
    }

    public int getCantidadTorneosJugados() {
        return DL;
    }
    
    
    
    public boolean registrarTorneoProfesional (Torneo T) {  // PUNTO 2.A
        boolean aux;
        if (DL < N) {
            vecTorneos[DL] = T;
            DL++;
            aux = true;
        }
        else
            aux = false;
        return aux;
    }
    
    
    public double cotizarSitio () {  // PUNTO 2.B
        double aux = 0;
        for (int i=0; i<DL; i++) {
            aux += 1000 + (this.vecTorneos[i].getMontoRecaudado() - this.vecTorneos[i].getMontoPagado());
        }
        return aux;
    }
    
}
