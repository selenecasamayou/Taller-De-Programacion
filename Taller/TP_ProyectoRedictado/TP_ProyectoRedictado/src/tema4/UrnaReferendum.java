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
public class UrnaReferendum extends Urna{
    private int votosFavor;
    private int votosContra;
    
    
    public UrnaReferendum (int unNumero, Zona infoZona) {
        super (unNumero, infoZona);
        votosFavor = 0;
        votosContra = 0;
    }
    

    public int getVotosFavor() {
        return votosFavor;
    }

    public int getVotosContra() {
        return votosContra;
    }
    
    public void votarAFavor () {  // D.III
        this.votosFavor++;
    }
    
    public void votarEnContra () {
        this.votosContra++;
    }
    
    public int calcularGanador () {
        int ganador = 0;
        if (this.votosFavor > this.votosContra) {
            ganador = 1;
        }
        else
            if (this.votosFavor < this.votosContra) {
                ganador = -1;
            }
        return ganador;
    }
    
    public int calcularTotalVotos () {
        return (this.getContVotBlancos() + this.votosFavor + this.votosContra);
    }
    
    //public String toString () {
    //    return (super.toString() + "Total votos: " + this.calcularTotalVotos() + ", Ganador: " + this.calcularGanador());
    //}
    
    
}
