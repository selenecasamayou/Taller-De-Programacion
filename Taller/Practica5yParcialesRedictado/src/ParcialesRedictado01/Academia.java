/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialesRedictado01;

/**
 *
 * @author Educación
 */
public class Academia {
    private String nombre;
    private Clase [][] matriz;
    private int DF;  // 5 dias semanales
    private int DC;  // hora
    
    
    public Academia (String unNombre, int cantHoras) {
        nombre = unNombre;
        DF = 5;
        DC = cantHoras;
        matriz = new Clase [DF][DC];
        for (int i=0; i<DF; i++) {  // sin clases inicialmente, al no tener diml se inicializa
            for (int j=0; j<DC; j++) {
                matriz[i][j] = null;
            }
        }
    }

    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCantDias() {
        return DF;
    }

    public int getCantHoras() {
        return DC;
    }
    
    
    public void registrarClase (Clase C, int D, int H) {  // PUNTO 2.A
        this.matriz[D-1][H-1] = C;
    }
    
    public int calcularAlumnosTotalesHora (int horaX) {  // PUNTO 2.B
        int cantAlum = 0;
        for (int i=0; i<DF; i++) {
            if (matriz[i][horaX-1] != null) {
                cantAlum += matriz[i][horaX-1].getCantAlumnos();
            }
        }
        return cantAlum;
    }
    
    public double calcularRecaudacionDia (int dia) {  // PUNTO 2.C
        double cantRecaudacion = 0;
        for (int j=0; j<DC; j++) {
            if (matriz[dia-1][j] != null) {
                cantRecaudacion += matriz[dia-1][j].calcularRecaudacion();
            }
        }
        return cantRecaudacion;
    }
    
    public String toStirng () {  // PUNTO 2.D
        String aux = "Academia: " + this.nombre + "\n";
        for (int i=0; i<DF; i++) {
            aux += "Dia " + (i+1) + "- \n";
            for (int j=0; j<DC; j++) {
                aux += "Hora " + (j+1) + ": ";
                if (matriz[i][j] != null) {
                    aux += matriz[i][j].toStirng() + "\n";
                }
                else
                    aux+= "Sin clase asignada";
            }
        }
        return aux;
    }
    
    
}
