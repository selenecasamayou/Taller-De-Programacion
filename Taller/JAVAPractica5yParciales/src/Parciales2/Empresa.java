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
public class Empresa {
    private String nombreEmpresa;
    private String direcc;
    private double costoXMes;
    private Cliente [] [] matriz;
    private int sectorS;  // fila
    private int bauleraB;  // columna
    private int DS;
    private int DB;
    

    public Empresa(String nombreEmpresa, String direcc, double costoXMes, int cantSectores, int cantBauleras) {
        this.nombreEmpresa = nombreEmpresa;
        this.direcc = direcc;
        this.costoXMes = costoXMes;
        matriz = new Cliente [cantSectores] [cantBauleras];
        sectorS = cantSectores;
        bauleraB = cantBauleras;
        DS = 0;
        DB = 0;
    }

    public String getNombreEmpresa() {
        return nombreEmpresa;
    }

    private void setNombreEmpresa(String nombreEmpresa) {
        this.nombreEmpresa = nombreEmpresa;
    }

    public String getDirecc() {
        return direcc;
    }

    private void setDirecc(String direcc) {
        this.direcc = direcc;
    }

    public double getCostoXMes() {
        return costoXMes;
    }

    private void setCostoXMes(double costoXMes) {
        this.costoXMes = costoXMes;
    }

    public int getCantSectores() {
        return sectorS;
    }

    public int getCantBauleras() {
        return bauleraB;
    }

    public int getCantSectoresActual() {
        return DS;
    }

    public int getCantBaulerasActual() {
        return DB;
    }
    
    
    public void ingresarCliente (Cliente C) {  // PUNTO 2.A
        if (this.DS < this.sectorS && this.DB < this.bauleraB) {
            matriz [DS] [DB] = C;
            if (this.DB == this.bauleraB) {
                DB = 0;  // reseteo columna
                DS++;
            }
            else {
                DB++;
            }
        }   
    }
    
    public String clientesLosHornos (int sectorX) {  // PUNTO 2.B
        String aux = "";
            for (int j=0; j<this.bauleraB; j++) {
                if (matriz [sectorX-1] [j].getLocalidad().equals("Los Hornos")) {
                    aux += matriz [sectorX-1] [j].toString() + ", ";
                }
            }
        return aux;
    }
    
    public int obtenerNumSectorMax () { // PUNTO 2.C
        int sectorMax = 0;
        int cant = 0;
        int cantMax = -1;
        for (int i=0; i<this.DS; i++) {          
            cant += cantCumple (i);  // se fija cuantos cientes del sector cumplen
            if (cant > cantMax) {
                cantMax = cant;
                sectorMax = i;
            } 
            //sectorMax(i, cant);
        }
        return sectorMax;
    }
    
   /* private int sectorMax (int sectorAct, int cantAct) {
        int sectorMax = 0;
        int cantMax = -1;
        if (cantAct > cantMax) {
            cantMax = cantAct;
            sectorMax = sectorAct;
        }
        return sectorMax;
    }*/
    
    private int cantCumple (int i) {
        int cant = 0;
        for (int j=0; j<this.bauleraB; j++) {
            if (matriz[i][j].isContrato()) {
                cant++;
            }
        }
        return cant;
    }
    
    public String toString () {  // PUNTO 2.D
        String aux;
        aux = ("Empresa: " + this.nombreEmpresa + " - " + this.direcc + "; " + this.costoXMes + "\n");
        for (int i=0; i<this.DS; i++) {
            aux += ("Sector " + i + " : \n");
            for (int j=0; j<this.DB; j++) {
                aux += (" Baulera " + j + matriz[i][j].toString() + "\n");
            }
        }
        return aux;
    }
    
}
