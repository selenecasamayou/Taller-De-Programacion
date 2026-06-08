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
public abstract class Urna {
    private int numero;
    private int contVotBlancos;
    private Zona info;
    
    
    public Urna (int unNumero, Zona infoZona) {
        numero = unNumero;
        contVotBlancos = 0;
        info = infoZona;
    }

    
    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public int getContVotBlancos() {
        return contVotBlancos;
    }
    
    public Zona getInfo() {
        return info;
    }

    private void setInfo(Zona info) {
        this.info = info;
    }
    
    
    public void votarEnBlanco () {  // D.I
        this.contVotBlancos++;
    }
    
    public abstract int calcularGanador ();  // D.IV
    
    public abstract int calcularTotalVotos ();  // D.V
    
    public String toString () {  // D.VI
        return ("Urna " + this.numero + " " + info.toString() + "\n" + 
                "Total votos " + this.calcularTotalVotos() + " Ganador: " + this.calcularGanador());
    }
    
    
    
}
