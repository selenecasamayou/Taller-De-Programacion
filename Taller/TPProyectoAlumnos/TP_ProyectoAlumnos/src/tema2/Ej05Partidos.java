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

public class Ej05Partidos {
    
    
    public static void main (String [] args) {
        String local;   
        String visitante = (Lector.leerString());  // condicion de corte
        int golesLocal;
        int golesVisitante;
           
        int DF = 20, DL = 0;
        Partido [] vector;
        vector = new Partido [DF];
        
        int cantGanadosRiver = 0;
        int cantGolesTotalesBoca = 0;
        
        while (DL <= DF && !(visitante.equals("ZZZ"))) {    // CARGA
            local = (Lector.leerString());
            golesLocal = (Lector.leerInt());
            golesVisitante = (Lector.leerInt());
            Partido p = new Partido (local, visitante, golesLocal, golesVisitante);
            vector [DL] = p;  // guardo
            DL++;  // aumento
            visitante = (Lector.leerString());
        }
        
        for (int i=0; i <= DL; i++) {  // PUNTO A, PREGUNTAR SI EL B Y C LOS METO EN EL MISMO FOR QUE EL A, no , se pone por separado;
            System.out.println("Equipo-" + vector[i].getLocal() + vector[i].getGolesLocal() + " VS Equipo-" + vector[i].getVisitante() + vector[i].getGolesVisitante());
        }
        
        for (int i=0; i <= DL; i++) {  // PUNTO B, NO HACE FALTA PREGUNTAR SI ES VISITANTE, y se puede preguntar si en el metodo HayGanador fue "River"
            if (!(vector[i].hayEmpate())) { // si no hay empate
                if (vector[i].getLocal().equals("River") && vector[i].getGanador().equals("River")) {
                    cantGanadosRiver++;  // si cumple, gano como local
            }
                else {
                    if (vector[i].getVisitante().equals("River") && vector[i].getGanador().equals("River")) {
                        cantGanadosRiver++;  // si cumple, gano como visitante
                    }
                }
            }
        }
        
         for (int i=0; i <= DL; i++) {  // PUNTO C
            if (vector[i].getLocal().equals("Boca")) {  // si Boca jugo de local
                cantGolesTotalesBoca = cantGolesTotalesBoca + vector[i].getGolesLocal();  // sumo los goles que hizo
            }
        }
    }
}
