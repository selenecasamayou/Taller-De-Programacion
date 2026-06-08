/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;


public class Persona {
    private String nombre;
    private int DNI;
    private int edad; 
    
    public Persona(String unNombre, int unDNI, int unaEdad){
        nombre = unNombre;
        DNI = unDNI;
        edad = unaEdad; 
    }
    
    public Persona(){
     
    }

    public int getDNI() {  // retorna el dni (int) de la persona
        return DNI;
    }

    public int getEdad() {  // retorna la edad (int) de la persona
        return edad;
    }

    public String getNombre() {  // retorna el nombre (String) de la persona
        return nombre;
    }

    public void setDNI(int unDNI) {  // modifica el DNI de la persona al “int” pasado por parámetro (X)
        DNI = unDNI;
    }

    public void setEdad(int unaEdad) {  // modifica la edad de la persona al “int” pasado por parámetro (X)
        edad = unaEdad;
    }

    public void setNombre(String unNombre) {  // modifica el nombre de la persona al “String” pasado por parámetro (X)
        nombre = unNombre;
    }
    
    public String toString(){
        String aux; 
        aux = "Mi nombre es " + nombre + ", mi DNI es " + DNI + " y tengo " + edad + " años.";
        return aux;
    }
     
    
    
    
}
