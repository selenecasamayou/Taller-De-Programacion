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
import PaqueteLectura.Lector;
public class EjAdicionalRedictado {
    
    
    public static void main (String [] args) {
        
        Zona Z = new Zona ("Berazategui", "Berazategui", "Buenos Aires");
        UrnaElectoral UE = new UrnaElectoral (5, 203, Z);
        
        Z = new Zona ("Berisso", "La Plata", "Buenos Aires");
        UrnaReferendum UR = new UrnaReferendum  (204, Z);
        
        int DNI = Lector.leerInt();
        while (DNI != 0) {
            int N = Lector.leerInt();
            
            if (UE.validarNumeroDeLista(N)) {
                UE.votarPorLista(N);
            }
            else
                UE.votarEnBlanco();
            
            int M = Lector.leerInt();
            
            if (M > 0) {
                UR.votarAFavor();
            }
            else
                if (M < 0) {
                    UR.votarEnContra();
                }
                else
                    UR.votarEnBlanco();
            
            DNI = Lector.leerInt();
        }
        
        System.out.println(UR.toString());
        System.out.println(UE.toString());
        
    }
    
    
}
