/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica4ej2;
import PaqueteLectura.*;
/**
 *
 * @author San Rojas
 */
public class Practica4ej2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Entrenador ent = new Entrenador ("san",5000,5,5);
        Jugadores jug = new Jugadores ("san",2000,5,5,10);
        System.out.println(jug.toString());
        System.out.println(ent.toString());
    }
}
