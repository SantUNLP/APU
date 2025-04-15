/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica3ej3;

/**
 *
 * @author San Rojas
 */
public class Estante {
    private int dimF;
    private Libro[] estante;
    private int dimL;
    
    public Estante(){ // INSTANCIO EL ESTANTE VACIO
        dimF=20; // <-- Cambiar 20 por N para N libros
        estante = new Libro[dimF];
        dimL=0;
    }
    
    
    public void agregarLibro(Libro lib){ // METODO PARA AGREGAR UN LIBRO
        if (dimL < dimF){
            this.estante[dimL]=lib;
            this.dimL++;
        }
    }
    
    public int getCant(){ // METODO QUE DEVUELVE LA CANTIDAD DE LIBROS EN EL ESTANTE
        return this.dimL;
    }
    
    public boolean estaLleno(){ // METODO QUE DEVUELVE SI ESTA LLENO O NO
        return (dimL == dimF);
    }
    
    public Libro buscar(String unTitulo){
        boolean ok=false;
        Libro aux=null;
        int i=0;
        while (i < dimL && !ok){
            if (this.estante[i].esIgual(unTitulo))
                ok=true;
            else
                i++;
        }
        if (ok){
            aux=estante[i];
            return aux;
        }else{
            return aux;
        }
    }


    
    
}
