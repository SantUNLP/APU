/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ayedp1ej7;

import java.util.*;

/**
 *
 * @author San Rojas
 */
public class EjercicioSucesion {
    private List<Integer> lista;

    public EjercicioSucesion() {
        this.lista = new ArrayList();
    }
    
    public List<Integer> calcularSucesion(int n){
        lista.add(n);
        if(n != 1){
            if ((n % 2) == 0) {
                n = n/2;
            } else {
                n = (3*n)+1;
            }
            calcularSucesion(n);
        } 
        return lista;
    }
    
    public void invertirArrayList(ArrayList<Integer> lista){
        if (!lista.isEmpty()){
            int n= lista.get(0);
            lista.remove(0);
            invertirArrayList(lista);
            lista.add(n);
        }
    }
    
    public int sumarLinkedList(LinkedList<Integer> lista){
        int suma;
        if (!lista.isEmpty()){
            suma = lista.pollFirst() + sumarLinkedList(lista);
        } else {
            suma=0;
        }
        return suma;
    }
    
    public ArrayList<Integer> combinarOrdenado(ArrayList<Integer> lista1, ArrayList<Integer> lista2){
        ArrayList<Integer> listaOrdenada = new ArrayList();
        int tam;
        if ((!lista1.isEmpty()) && (!lista2.isEmpty())){
            tam = lista1.size() + lista2.size();
            for (int i=0; i<tam;i++){
                if ((!lista1.isEmpty()) && (!lista2.isEmpty())) {
                    if (lista1.get(0) < lista2.get(0)){
                        listaOrdenada.add(lista1.get(0));
                        lista1.remove(0);
                        } else {
                            listaOrdenada.add(lista2.get(0));
                            lista2.remove(0);
                        }
                } else {
                    if (!lista1.isEmpty()){
                        listaOrdenada.add(lista1.get(0));
                        lista1.remove(0);
                    } else {
                        if (!lista2.isEmpty()){
                            listaOrdenada.add(lista2.get(0));
                            lista2.remove(0);
                        }
                    }
                }
            }
        }
        return listaOrdenada;
    }
}
