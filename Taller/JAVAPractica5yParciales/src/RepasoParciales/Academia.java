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
public class Academia {
    private String nombre;
    private Clase [][] matrizClases;
    private int cantDias;
    private int cantHoras;
    
    
    public Academia (String unNombre, int unaCantHoras) {
        nombre = unNombre;
        cantHoras = unaCantHoras;
        cantDias = 5;
        matrizClases = new Clase [cantDias][cantHoras];
        for (int i=0; i < this.cantDias; i++) {  // se que java inicializa la matriz automaticamente, pero como es con acceso directo debe inicializarse
            for (int j=0; j < this.cantHoras; j++) {
                this.matrizClases[i][j] = null; 
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
        return cantDias;
    }

    public int getCantHoras() {
        return cantHoras;
    }
    
    
    public void registrarClase(Clase C, int dia, int hora) {  // PUNTO A
        this.matrizClases[dia-1][hora-1] = C;
    }
    
    public int caltularAlumnosTotalesHora(int hora) {  // PUNTO B
        int cantAlumnos = 0;
        for (int i=0; i < this.cantDias; i++) {
            if (matrizClases[i][hora-1] != null) {
            cantAlumnos += matrizClases[i][hora-1].getCantAlumnos();
            }
        }
        return cantAlumnos;
    }
    
    public double calcularRecaudacionDia(int dia) {  // PUNTO C
        double cantRecaudado = 0;
        for (int j=0; j < this.cantHoras; j++) {
            if (matrizClases[dia-1][j] != null) {
                cantRecaudado += this.matrizClases[dia-1][j].calcularClase();
            }
        }
        return cantRecaudado;
    }
    
    public String toString () {  // PUNTO D
        String aux = ("Academia: " + this.getNombre() + "\n");
        for (int i=0; i < this.cantDias; i++) {
            aux += ("Dia " + (i + 1) + "- \n");
            for (int j=0; j < this.cantHoras; j++) {
                aux += ("Hora " + (j + 1) + ": ");
                if (matrizClases[i][j] != null) {
                    aux += (this.matrizClases[i][j].toString());
                }
                else {
                    aux += ("Sin clase asignada \n");
                }
            }
        }
        return aux;
    }
    
}
