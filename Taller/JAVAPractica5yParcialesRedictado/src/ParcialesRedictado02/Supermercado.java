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
public class Supermercado {
    private String nombre;
    private String direcc;
    private int DFF;  // cant gondolas
    private int DFC; // cant estantes
    private Producto [][] matriz;
    private int DLF;  // cant gondolas
    private int DLC; // cant estantes
    
    
    public Supermercado (String unNombre, String unaDirecc, int cantGondolas, int cantEstantes) {
        nombre = unNombre;
        direcc = unaDirecc;
        DFF = cantGondolas;
        DFC = cantEstantes;
        DLF = 0;
        DLC = 0;
        matriz = new Producto[DFF][DFC];  // sin productos inicialmente
    }

    
    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDirecc() {
        return direcc;
    }

    private void setDirecc(String direcc) {
        this.direcc = direcc;
    }

    public int getCantGondolas() {
        return DFF;
    }

    public int getCantEstantes() {
        return DFC;
    }

    public int getCantGondolasActuales() {
        return DLF;
    }

    public int getCantEstantesActuales() {
        return DLC;
    }
    
    
    public void registrarProducto (Producto P) {  // PUNTO 2.A
        if (this.DLF < this.DFF) {
            matriz[DLF][DLC] = P;
            DLC++;
            if (this.DLC == this.DFC) {
                DLC = 0;
                DLF++;
            }
        }
    }
    
    public String listarProductos (String marca, int gondolaX) {  // PUNTO 2.B
        String aux = "";
        for (int j=0; j<this.DFC; j++) {
            if (this.matriz[gondolaX-1][j].getMarca().equals(marca)) {
                aux += matriz[gondolaX-1][j].toString() + "\n";
            }
        }
        return aux;
    }
    
    private int cantUniXGondola (int gondola, int uniXgond) { 
        for (int j=0; j<DFC; j++) {
                uniXgond += matriz[gondola][j].getCantUni();
        }
        return uniXgond;
    }
    
    public int gondolaMax () {  // PUNTO 2.C
        int gondMax = 0, uniXgond = 0, unidMax = -1;
        for (int i=0; i<DFF; i++) {
            uniXgond = this.cantUniXGondola(i, uniXgond);
            if (uniXgond > unidMax) {
                unidMax = uniXgond;
                gondMax = i;
            }
        }
        return (gondMax+1);  // porque va de 0 a DFF
    }
    
    public String toStirng () {  // PUNTO 2.D
        String aux = ("Supermercado: " + this.nombre + " - " + this.direcc + "\n");
        for (int i=0; i<DFF; i++) {
            aux += "\n Gondola " + (i+1) + ": \n";
            for (int j=0; j<DFC; j++) {
                aux += "Estante " + (j+1) + ": " + matriz[i][j].toString();
            }
        }
        return aux;
    }
    
    
}
