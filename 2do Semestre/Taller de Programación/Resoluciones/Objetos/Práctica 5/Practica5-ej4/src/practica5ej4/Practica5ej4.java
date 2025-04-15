/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica5ej4;

/**
 *
 * @author San Rojas
 */
public class Practica5ej4 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Director dir = new Director ("Santiago",45573215,20,5);
        Coristas cor = new Coristas ("SAN",45573215,20,200);
        Coristas cor2 = new Coristas ("SAN",45573215,20,100);
        Coristas cor3 = new Coristas ("SAN",45573215,20,200);
        Coristas cor4 = new Coristas ("SAN",45573215,20,150);
        CoroPorHileras corovector = new CoroPorHileras("EL MEJOR CORO",dir,2,2);
        corovector.agregarCorista(cor);
        corovector.agregarCorista(cor2);
        corovector.agregarCorista(cor3);
        corovector.agregarCorista(cor4);
        
        
        System.out.println(corovector.bienFormado());
        // TODO code application logic here
    }
    
}
