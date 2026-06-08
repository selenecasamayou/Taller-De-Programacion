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
public class Supermercado {
    private String nombre;
    private String direcc;
    private Producto [] [] matriz;
    private int G;
    private int E;
    private int dimLG;
    private int dimLE;
    
    
    public Supermercado (String unNombre, String unaDirecc, int cantGondolas, int cantEstantes) {
        nombre = unNombre;
        direcc = unaDirecc;
        G = cantGondolas;
        E = cantEstantes;
        matriz = new Producto [G] [E];
        dimLG = 0;
        dimLE = 0;
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
        return G;
    }

    public int getCantEstantes() {
        return E;
    }

    public int getCantGondolasActual() {
        return dimLG;
    }

    public int getCantEstantesActual() {
        return dimLE;
    }
    
    
    public void registrarProducto (Producto P) {  // PUNTO 2.A
        if (this.dimLG < this.G && this.dimLE < this.E) {
            matriz [dimLG][dimLE] = P;
            dimLE++;
            if (this.dimLE == this.E ) {  // si mi estante se lleno
                this.dimLE = 0;
                dimLG++;
            }
        } 
    }
    
    public String buscarProductosXMarca (int gondolaX, String marca) {  // PUNTO 2.B
        String aux = "";
        for (int j=0; j<this.dimLE; j++) { 
            if (matriz [gondolaX-1][j].getMarca().equals(marca)) {
                aux += (matriz[gondolaX-1][j].toString() + " ");
            }
        }
        return aux;
    }
    
    public int obtenerGondolaMax () {  // PUNTO 2.C
        int cantUniXGondola = 0;
        int gondolaMax = -1, cantUniMax = -1;
        for (int i=0; i<this.dimLG-1; i++) {  // RECORRO LAS FILAS COMPLETAS
            for (int j=0; j<this.E; j++) {
                cantUniXGondola += matriz[i][j].getCantUni();  // obtengo todas las unidades del estante
            }
            if (cantUniXGondola > cantUniMax) {  // me fijo el maximo
                cantUniMax = cantUniXGondola;
                gondolaMax = i + 1;  // lo incremento porque si el usuario quiere saber cual es la gondola e ingresa el valor 1, esta seria la gondola 0, entonces le sumo 1 para que aparezca bien
            }
            cantUniXGondola = 0;  // reseteo para la siguiente gondola
        }
        for (int j=0; j<this.dimLE; j++) {  // RECORRO LA FILA INCOMPLETA
            cantUniXGondola += matriz[this.dimLG-1][j].getCantUni();
            if (cantUniXGondola > cantUniMax) {  // me fijo el maximo
                cantUniMax = cantUniXGondola;
                gondolaMax = (this.dimLG-1) + 1;  // lo incremento porque si el usuario quiere saber cual es la gondola e ingresa el valor 1, esta seria la gondola 0, entonces le sumo 1 para que aparezca bien
            }
        }
        return gondolaMax; 
    }
    
    public String toString () {  // PUNTO 2.D
        String aux = ("Supermercado: " + this.getNombre() + "; " + this.getDirecc());
        for (int i=0; i<this.dimLG-1; i++) {
            aux += ("Gondola " + (i + 1));  // para que aparezca que la gondola 0 es la "1"
            for (int j=0; j<this.E; j++) {
                aux += ("Estante " + (j+1) + ": " + matriz[i][j].toString());  // lo mismo con el estante
            }
        }    
        for (int j=0; j<this.dimLE; j++) {
            aux += ("Estante " + (j+1) + ": " + matriz[this.dimLG-1][j].toString());
        }
        return aux;
    }
    
}
