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
public class UrnaElectoral extends Urna{
    private int cantListas;
    private int [] vecListas;
    
    
    public UrnaElectoral (int unaCantListas, int unNumero, Zona infoZona) {
        super(unNumero, infoZona);
        cantListas = unaCantListas;
        vecListas = new int [cantListas];
        for (int i=0; i<this.cantListas; i++) {  // inicializo vec contador
            vecListas[i] = 0;
        }
    }

    
    public int getCantListas() {
        return cantListas;
    }
    
    
    public boolean validarNumeroDeLista (int unNum) {  // PUNTO D.II
        boolean encontre = false;
        if ((unNum-1 >= 0) && (unNum-1 < this.cantListas)){
            encontre = true; 
        }
        return encontre;
    }
    
    public void votarPorLista (int numValido) {
        this.vecListas[numValido-1]++;
    }
    
    public int devolverVotosPorLista (int numValido) {
        return this.vecListas[numValido];
    }
    
    public int calcularGanador () {
        int ganador = 0, votosMax = -1;
        for (int i=0; i<this.getCantListas(); i++) {
            if (this.vecListas[i] > votosMax) {
                votosMax = this.vecListas[i];
                ganador = i;
            }
        }
        return ganador;
    }
    
    public int calcularTotalVotos () {
        int cantVotos = 0;
        for (int i=0; i<this.getCantListas(); i++) {
            cantVotos += this.vecListas[i];
        }
        return cantVotos;
    }
    
    
    
    
}
