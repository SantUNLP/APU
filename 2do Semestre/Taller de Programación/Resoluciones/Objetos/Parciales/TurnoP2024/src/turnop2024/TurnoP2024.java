/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package turnop2024;

/**
 *
 * @author San Rojas
 */
public class TurnoP2024 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Pan pancito = new Pan("Baguette",20000,"Normal");
        Sandwich sanguche = new Sandwich("FELIX",pancito,5);
        Ingrediente ing1 = new Ingrediente("Jamon",10000,"A");
        Ingrediente ing2 = new Ingrediente("Queso",5000,"B");
        sanguche.agregarIngrediente(ing1);
        sanguche.agregarIngrediente(ing2);
        
        System.out.println(sanguche.toString());
        // TODO code application logic here
    }
    
}
