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
public class Parcial04Sandwich {
    
    
    public static void main (String [] args) {
        
        Pan P = new Pan("Premium", "Arabe", 100);
        
        Sanbuchito S = new Sanbuchito("El Destructor", P, 3);
        
        Ingrediente I = new Ingrediente("A", "Carne", 150);
        S.agregarIngrediente(I);
        I = new Ingrediente("B", "Queso", 55);
        S.agregarIngrediente(I);
        I = new Ingrediente("A", "Tomate", 20);
        S.agregarIngrediente(I);
        
        System.out.println(S.toString());
    }
    
    
    
    
}
