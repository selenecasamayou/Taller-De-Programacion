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
public class Parcial09PlataformaCursosRedictado {
    
    
    public static void main (String [] args) {
        CursoBasico CB = new CursoBasico("Reparacion", 300, "12/4/2026", 10);
    
        CursoAvanzado CA = new CursoAvanzado("Lenguaje B2", "Ingles", 1000, "18/9/2024", 7);
    
        Alumno A = new Alumno("Pepe", 3);
        CA.inscribirAlumno(A);
        CA.actualizarRendimiento(A, 6);
        A = new Alumno("Juan", 1);
        CA.inscribirAlumno(A);
        A = new Alumno("Carlos", 8);
        CA.inscribirAlumno(A);
        CA.actualizarRendimiento(A, 4);
        CA.actualizarRendimiento(A, 10);
        
        A = new Alumno("Guilermo", 8);
        CB.inscribirAlumno(A);
        CB.actualizarRendimiento(A, 7);
        A = new Alumno("Samuel", 11);
        CB.inscribirAlumno(A);
        
        System.out.println(CB.toString());
        System.out.println(CA.toString());
    }
    
    
    
}
