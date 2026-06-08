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
import PaqueteLectura.GeneradorAleatorio;
public class EmpresaGas {
    
    
    public static void main (String [] args) {
        GeneradorAleatorio.iniciar();
        
        String nombre = (GeneradorAleatorio.generarString(8));
        int cantZonas = 5;
        
        Empresa2 E2 = new Empresa2 (nombre, cantZonas);
        
        for (int i=0; i < 3; i++){
            String denominacion = (GeneradorAleatorio.generarString(4));
            int cantMediciones = 4; 
            Zona Z = new Zona (denominacion, cantMediciones);
            for (int j=0; j < 2; j++) {
                int numero = (GeneradorAleatorio.generarInt(10));
                int dni = (GeneradorAleatorio.generarInt(20));
                int cantM3 = (GeneradorAleatorio.generarInt(1000));
                boolean superaPeriodoAnterior = (GeneradorAleatorio.generarBoolean());
                Medicion M = new Medicion (numero, dni, cantM3, superaPeriodoAnterior); 
                
                int numZona = (GeneradorAleatorio.generarInt(4) + 1);
                Z.agregarMedicion(numZona, M);
            }
            E2.agregarZona(Z);
        }
        System.out.println(E2.obtenerZonaMax());
        System.out.println(E2.toString());
    }
}
