/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Repaso;

/**
 *
 * @author Educación
 */
public class Estacionamiento {
    private String nombre;
    private String direcc;
    private int horaApertura;
    private int horaCierre;
    private int pisos;  // filas
    private int plazas;  // columnas
    private int DPi;  
    private int DPa;
    private Auto [] [] matrizAutos; 
    
    // CONSTRUCTOR 1
    public Estacionamiento (String unNombre, String unaDirecc) {
        nombre = unNombre;
        direcc = unaDirecc;
        horaApertura = 8;
        horaCierre = 21;
        pisos = 5;
        plazas = 10;
        this.matrizAutos = new Auto [pisos] [plazas];
        for (int i=0; i<5; i++) {  // inicializo por si lo piden, se que java lo hace automaticamente
            for (int j=0; j<10; j++) {
                matrizAutos [i][j] = null;
            }
        }
    }
    
    // CONSTRUCTOR 2
    public Estacionamiento(String nombre, String direcc, int horaApertura, int horaCierre, int N, int M) {
        this.nombre = nombre;
        this.direcc = direcc;
        this.horaApertura = horaApertura;
        this.horaCierre = horaCierre;
        this.pisos = N;
        this.plazas = M;
        DPi = 0;
        DPa = 0;
        this.matrizAutos = new Auto [pisos] [plazas];  // en caso de ser necesario tbm inicializo en null
    }

    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDirecc() {
        return direcc;
    }

    public void setDirecc(String direcc) {
        this.direcc = direcc;
    }

    public int getHoraApertura() {
        return horaApertura;
    }

    public void setHoraApertura(int horaApertura) {
        this.horaApertura = horaApertura;
    }

    public int getHoraCierre() {
        return horaCierre;
    }

    public void setHoraCierre(int horaCierre) {
        this.horaCierre = horaCierre;
    }

    public int getCantPisos() {
        return pisos;
    }

    public int getCantPlazas() {
        return plazas;
    }

    public int getCantPisosActual() {
        return DPi;
    }

    public int getCantPlazasActual() {
        return DPa;
    }
    
    
    public void agregarAuto (Auto A, int pisoX, int plazaY) {  // PUNTO C.I
        this.matrizAutos[pisoX-1][plazaY-1] = A;
    }
    
    public String buscarPatente (int patente) {  // PUNTO C.II
        boolean encontre = false;
        String aux = "";
        int i= 0, j = 0;
        while ((i < this.getCantPisosActual()) && (encontre)) {
            while ((j < this.getCantPlazasActual()) && (encontre)) {
                if (matrizAutos[i][j].getPatente() == patente) {
                    encontre = true;
                    aux = ("Numero de piso: " + i + "Numero de plaza" + j);
                }
                j++;   
            }
            j = 0;
            i++;
        }
        if (!encontre) {
            aux = ("Auto inexistente");
        }
        return aux;
    }
    
    @Override
    public String toString () {  // PUNTO C.III
        String aux = "";
        for (int i=0; i < this.getCantPisosActual(); i++) {
            aux += ("Piso " + (i+1));
            for (int j=0; j < this.getCantPlazasActual(); j++) {
                aux += ("Plaza " + (j+1) + " :");
                if (this.matrizAutos[i][j] == null) 
                    aux += ("Libre");
                else
                    aux += this.matrizAutos[i][j].toString();
                
            }
            // aca imprimiria para que cambie de renglon pero no me acuerdo como
        }
        return aux;
    }
    
    public int cantAutosY (int plazaY) {  // PUNTO C.IV
        int cantAutos = 0;
        for (int i=0; i < this.getCantPisosActual(); i++) {
            if (this.matrizAutos[i][plazaY] != null) {
                cantAutos++;
            }
        }
        return cantAutos;
    }
    
    
}
