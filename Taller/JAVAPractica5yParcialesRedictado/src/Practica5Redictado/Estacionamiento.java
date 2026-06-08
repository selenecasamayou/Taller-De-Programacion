/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica5Redictado;

/**
 *
 * @author Educación
 */
public class Estacionamiento {
    private String nombre;
    private int direcc;
    private int horaApertura;
    private int horaCierre;
    private int N;  // piso = fila
    private int M;  // plaza = columna
    private Auto [][] matriz;
    
    
    public Estacionamiento (String unNombre, int unaDirecc) {
        nombre = unNombre;
        direcc = unaDirecc;
        horaApertura = 8;
        horaCierre = 21;
        N = 5;
        M = 10;
        matriz = new Auto [N][M];
        for (int i=0; i<N; i++) {
            for (int j=0; j<M; j++) {
                matriz[i][j] = null;  // inicialmente sin autos
            }
        }
    }
    
    public Estacionamiento (String unNombre, int unaDirecc, int horaAper, int horaCie, int Npisos, int Mplazas) {
        nombre = unNombre;
        direcc = unaDirecc;
        horaApertura = horaAper;
        horaCierre = horaCie;
        N = Npisos;
        M = Mplazas;
        matriz = new Auto [N][M];
        for (int i=0; i<N; i++) {
            for (int j=0; j<M; j++) {
                matriz[i][j] = null;  // inicialmente sin autos
            }
        }
    }

    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDirecc() {
        return direcc;
    }

    private void setDirecc(int direcc) {
        this.direcc = direcc;
    }

    public int getHoraApertura() {
        return horaApertura;
    }

    private void setHoraApertura(int horaApertura) {
        this.horaApertura = horaApertura;
    }

    public int getHoraCierre() {
        return horaCierre;
    }

    private void setHoraCierre(int horaCierre) {
        this.horaCierre = horaCierre;
    }

    public int getCantPisos() {
        return N;
    }

    public int getCantPlazas() {
        return M;
    }
    
    
    public void agregarAuto (int piso, int plaza, Auto A) {  // PUNTO C.I
        matriz [piso-1] [plaza-1] = A;
    }
    
    
    public String buscarPatente (String patente) {  // PUNTO C.II
        String encontre = "Auto inexistente";  // asumo que no lo encontre
        int i = 0, j = 0;
        while ((i < this.N) && (!(this.matriz[i][j].getPatente().equals(patente)))) { // podria hacerlo como 2da condicion
            while ((j < this.M) && (!(this.matriz[i][j].getPatente().equals(patente)))) { // encontre = "Auto inexistente"
                j++;
            }
            if (j < this.M) {  // si lo encontre
                encontre = "Piso: " + i + " y plaza " + j;
            }
            else
                i++;  
        }
        return encontre;
    }
    
    public String toString () {  // PUNTO C.III
        String aux = "";
        for (int i=0; i<this.N; i++) {
            for (int j=0; j<this.M; j++) {
                aux += "Piso " + i + " Plaza: " + j;
                if (matriz[i][j] != null) {
                    aux += matriz[i][j].toString();
                }
                else
                    aux += " libre /n ";
            }
        }
        return aux;
    }
    
    public int cantAutos (int plazaY) {  // PUNTO C.IV
        int cant = 0;
        for (int i=0; i<this.N; i++) {
            if (matriz[i][plazaY] != null) {
                cant++;
            }
        }
        return cant;
    }
    
    
}
