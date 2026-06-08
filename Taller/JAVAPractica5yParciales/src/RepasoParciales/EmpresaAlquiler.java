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
public class EmpresaAlquiler {
    
    
    public static void main (String [] args) {
        GeneradorAleatorio.iniciar();
        
        int unaDirecc = (GeneradorAleatorio.generarInt(5)); 
        double costo = (GeneradorAleatorio.generarDouble(3000));
        int cantSectores = (GeneradorAleatorio.generarInt(5)); 
        int cantBauleras = (GeneradorAleatorio.generarInt(3)); 
        
        Empresa E = new Empresa (unaDirecc, costo, cantSectores, cantBauleras);
        
        for (int i=0; i < 3; i++) {
            for (int j=0; j < 3; j++) {
                int dni = (GeneradorAleatorio.generarInt(8)); 
                String nombre = (GeneradorAleatorio.generarString(6));
                int telefono = (GeneradorAleatorio.generarInt(8)); 
                String localidad = (GeneradorAleatorio.generarString(5));
                boolean seguroAdicional = (GeneradorAleatorio.generarBoolean()); 
                
                Cliente C = new Cliente (dni, nombre, telefono, localidad, seguroAdicional);
                E.agregarCliente(C);
            }
        }     
        
        System.out.println(E.listarClientes(2));
        System.out.println(E.sectorMaximo());
        System.out.println(E.toString());
    }
    
    
    
}
