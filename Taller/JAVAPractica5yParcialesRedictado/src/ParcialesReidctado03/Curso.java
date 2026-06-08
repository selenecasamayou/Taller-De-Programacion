/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ParcialesReidctado03;

/**
 *
 * @author Educación
 */
public abstract class Curso {
    private String nombre;
    private double costo;
    private String fecha;
    private int DF;  // cant alumnos
    private int DL;
    private Alumno [] vector;
    
    
    public Curso (String nombre, double costo, String fecha, int cantAlumnos) {
        this.nombre = nombre;
        this.costo = costo;
        this.fecha = fecha;
        DF = cantAlumnos;
        DL = 0;
        vector = new Alumno [DF];  // sin alumnos cargados
    }

    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getCosto() {
        return costo;
    }

    private void setCosto(double costo) {
        this.costo = costo;
    }

    public String getFecha() {
        return fecha;
    }

    private void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public int getCantAlumnos() {
        return DF;
    }

    public int getCantAlumnosActual() {
        return DL;
    }
    
    
    public int inscribirAlumno (Alumno A) {  // PUNTO 2.A
        int num = 0;  // devuelve 0 si se lleno
        if (DL < DF) {  // ya se que tengo que asumir que hay espacio pero lo hago por las dudas
            this.vector[DL] = A;
            num = (DL+1);  // como el primero esta en la pos 0, se suma uno porque sino no tendria sentido
            DL++;           // porque los vectores en java empiezan en 0, no en 1
        }
        return num;
    }
    
    public Alumno obtenerAlumno (int pos) {  // PUNTO 2.B
        return this.vector[pos];  // asumo que esta en el rango
    }
    
    public void actualizarRendimiento (Alumno A, int nota) {  // PUNTO 2.C
        int i = 0;
        while ((i < DL) && (vector[i] != A)) {
            i++;
        }
        if (i < DL) {  // lo econtre al alumno
            vector[i].actualizarNota(nota);
        }
    }
    
    public Alumno buscarMejorAlumno() {
        Alumno mejorAlum = null;
        int cantTareas = 0;
        for (int i=0; i<DL; i++) {
            if(this.vector[i].getCanTareas() > cantTareas) {
                cantTareas = this.vector[i].getCanTareas();
                mejorAlum = this.vector[i];
            }
        }
        return mejorAlum;
    }
    
    public Alumno buscarMejorPromedio () {
        Alumno mejorAlum = null;
        double promedio, promedioMax = -1;
        for (int i=0; i<DL; i++) {
            promedio = vector[i].calcularPromedio();
            if(promedio > promedioMax) {
                promedioMax = promedio;
                mejorAlum = vector[i];
            }
        }
        return mejorAlum;
    }
    
    public String toString() {  // PUNTO 2.D
        return ("Curso: " + this.nombre + ", costo " + this.costo + ", fecha " + this.fecha + "\n");
    }
    
}
