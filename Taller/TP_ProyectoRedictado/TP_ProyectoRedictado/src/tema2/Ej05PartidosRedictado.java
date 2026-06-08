/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

/**
 *
 * @author Educación
 */
import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;
public class Ej05PartidosRedictado {
    
    
    public static void main (String [] args) {
        int DF = 20;
        int DL = 0;
        Partido [] vector;
        vector = new Partido [DF];
        int cantPartidosGanados = 0, cantGoles = 0; 
        
        String visitante = Lector.leerString();
        
        while (!(visitante.equals("ZZZ")) && DL<DF) {
            String local = Lector.leerString();
            int golesLocal = GeneradorAleatorio.generarInt(10) + 1;
            int golesVisitante = GeneradorAleatorio.generarInt(10) + 1;
            Partido P = new Partido(local, visitante, golesLocal, golesVisitante);
            vector[DL] = P;
            DL++;
            visitante = Lector.leerString();
        }
        
        for (int i=0; i<DL; i++) {
            System.out.println("Equipo " + vector[i].getLocal() + " goles " + vector[i].getGolesLocal() + " VS Equipo " + vector[i].getVisitante() + " goles " + vector[i].getGolesVisitante());
        }
        
        for (int i=0; i<DL; i++) {
            if (vector[i].getGanador().equals("River")) {
                cantPartidosGanados++;
            }
        }
        System.out.println(cantPartidosGanados);
        
        for (int i=0; i<DL; i++) {
            if (vector[i].getLocal().equals("Boca")) {
                cantGoles+= vector[i].getGolesLocal();
            }
        }
        System.out.println(cantGoles);
        
    }
}
