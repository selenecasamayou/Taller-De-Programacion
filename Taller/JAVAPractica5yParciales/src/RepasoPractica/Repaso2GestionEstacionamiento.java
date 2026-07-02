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
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
public class Repaso2GestionEstacionamiento {
    
    
    public static void main (String [] args) {
        GeneradorAleatorio.iniciar();
        
        String nombre = (GeneradorAleatorio.generarString(12)); 
        String direcc = (GeneradorAleatorio.generarString(10));
        int horaApertura = (GeneradorAleatorio.generarInt(23));
        int horaCierre = (GeneradorAleatorio.generarInt(23));
        int N = 3;
        int M = 3;
        
        Estacionamiento E = new Estacionamiento(nombre, direcc, horaApertura, horaCierre, N, M);
        
        for (int i=0; i<6; i++) {
            String nombreDueño = (GeneradorAleatorio.generarString(8));
            int patente = (GeneradorAleatorio.generarInt(100));
            Auto A = new Auto(nombreDueño, patente);
            int piso = (GeneradorAleatorio.generarInt(3) + 1);
            int plaza = (GeneradorAleatorio.generarInt(3) + 1);
                    
            E.agregarAuto(A, piso, plaza);
        }
        
        System.out.println(E.toString());
        System.out.println(E.cantAutosY(1));
        int patente = Lector.leerInt();
        System.out.println(E.buscarPatente(patente));
    }
}
