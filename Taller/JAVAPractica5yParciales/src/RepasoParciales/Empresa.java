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
public class Empresa {
    private String nombre;
    private int direcc;
    private double costoXMes;
    private int sectores;  // fila
    private int bauleras;  // columna
    private int DLS;
    private int DLB;
    private Cliente [] [] matrizClientes;
    
    
    public Empresa (int unaDirecc, double costo, int cantSectores, int cantBauleras) {
        nombre = "Pepe";
        direcc = unaDirecc;
        costoXMes = costo;
        sectores = cantSectores;
        bauleras = cantBauleras;
        DLS = 0;
        DLB = 0;
        matrizClientes = new Cliente [cantSectores][cantBauleras];
    }
    

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDirecc() {
        return direcc;
    }

    public void setDirecc(int direcc) {
        this.direcc = direcc;
    }

    public double getCostoXMes() {
        return costoXMes;
    }

    public void setCostoXMes(double costoXMes) {
        this.costoXMes = costoXMes;
    }

    public int getCantSectores() {
        return sectores;
    }

    public int getCantBauleras() {
        return bauleras;
    }

    public int getCantSectoresActual() {
        return DLS;
    }

    public int getCantBaulerasActual() {
        return DLB;
    }
    
    
    public void agregarCliente (Cliente C) {  // PUNTO 2.A
        if ((this.DLS < this.sectores) && (this.DLB < this.bauleras)) {
            matrizClientes[DLS][DLB] = C;
            DLB++;
            if (DLB == this.bauleras) {
                DLB = 0;  // reinicio columna "baulera" 
                DLS++;
            }
        }
    }
    
    public String listarClientes(int sectorX) {  // PUNTO 2.B
        String aux = "";
        for (int i=0; i < this.DLB; i++) {
            if (this.matrizClientes[sectorX-1][i].getLocalidad().equals("Los Hornos")) {
                aux += this.matrizClientes[sectorX][i].toString();
            }
        }
        return aux;
    }
    
    public int sectorMaximo () {  // PUNTO 2.C
        int cantMax= 9999, sectorMax = 0;
        int cant= 0;
        for (int i=0; i < this.DLS-1; i++) {  // hace hasta el sec-1
            for (int j=0; j < this.bauleras; j++) {
                if (matrizClientes[i][j].isSeguroAdicional()) {
                    cant++;
                }
            }
            if (cant > cantMax) {
                cantMax = cant;
                sectorMax = i;
            }
            cant = 0;
        }
        for (int j=0; j < this.DLB; j++) {  // hace el ultimo sector
            if (matrizClientes[this.DLS][j].isSeguroAdicional()) {
                cant++;
            }
        }
        if (cant > cantMax) {
                cantMax = cant;
                sectorMax = this.DLS;
        }
        return sectorMax;
    }   
    
    public String toString () {  // PUNTO 2.D
        String aux = ("Empresa: " + this.getNombre() + " - " + this.getDirecc() + "; " + this.getCostoXMes() + "\n");
        for (int i=0; i < this.DLS; i++) {
            aux += ("Sector " + (i + 1) + " : \n");
            for (int j=0; j < this.DLB; j++) {
                aux += ("Baulera " + (j + 1) + this.matrizClientes[i][j].toString() + "\n");
            }
        }
        return aux;
    }
}
