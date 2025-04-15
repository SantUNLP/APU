/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica4ej3;

/**
 *
 * @author San Rojas
 */
public class Practica4ej3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Persona per = new Persona("Maricielo",99999999,19);
        Trabajador traba = new Trabajador("Santiago",45573215,20,"Informatico");
        System.out.println(per.toString());
        System.out.println(traba.toString());
        // TODO code application logic here
    }
    
}
