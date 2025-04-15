/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica3ej3;
import PaqueteLectura.*;
/**
 *
 * @author San Rojas
 */
public class Practica3ej3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Autor aut;
        Libro lib;
        Estante estante = new Estante();
        String nombre,bio,origen;
        System.out.println("LEER NOMBRE");
        nombre=Lector.leerString();
        System.out.println("LEER BIOGRAFIA");
        bio=Lector.leerString();
        System.out.println("LEER ORIGEN");
        origen=Lector.leerString();
        aut = new Autor(nombre,bio,origen);
        lib = new Libro("Mujercitas","EDITORIAL",aut,"ISBN");
        estante.agregarLibro(lib);
        Libro libro2 = estante.buscar("Mujercitas");
        if (libro2 != null)
            System.out.println(libro2.toString());
        else
            System.out.println("NO EXISTE");
        // TODO code application logic here
    }
    
    
    
}
