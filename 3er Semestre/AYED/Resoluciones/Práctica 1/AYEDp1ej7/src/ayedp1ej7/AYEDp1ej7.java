/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ayedp1ej7;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
/**
 *
 * @author San Rojas
 */
public class AYEDp1ej7 {    
    public static boolean esCapicua(List<Integer> lista){
        int ult = lista.size()-1;
        for(int i=0;i<lista.size()/2;i++){
            if(!lista.get(i).equals(lista.get(ult))) {
                return false;
            } else ult--;
        }
        return true;
    }
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        EjercicioSucesion metodo = new EjercicioSucesion();
        /*
        ArrayList<Estudiante> alEstudiantes = new ArrayList();
        for (int i=0; i<3; i++){
            alEstudiantes.add(new Estudiante("Santiago","Rojas","1","sirnyar13@gmail.com","517 e/ 151 y 152"));
        }
        for(Estudiante n: alEstudiantes){
            System.out.println(n.tusDatos());
        }
        System.out.println("");
        ArrayList<Estudiante> alCopia = new ArrayList();
        alCopia = alEstudiantes;
        for(Estudiante n: alCopia){
            System.out.println(n.tusDatos());
        }
        alEstudiantes.get(0).setNombre("Ricky");
        System.out.println(alEstudiantes.get(0).tusDatos());
        System.out.println(alCopia.get(0).tusDatos());
        // TODO code application logic here
        */
        List<Integer> lista = new ArrayList();
        lista.add(1);
        lista.add(2);
        lista.add(5);
        lista.add(2);
        lista.add(1);
        System.out.println(esCapicua(lista));
        
        List<Integer> listaEnteros = new ArrayList();
        listaEnteros = metodo.calcularSucesion(6);
        for (int n: listaEnteros){
            System.out.print(n+" ");
        }
        System.out.println("");
        ArrayList<Integer> listaEnOrden = new ArrayList();
        listaEnOrden.add(1);
        listaEnOrden.add(2);
        listaEnOrden.add(3);
        for (int n: listaEnOrden){
            System.out.print(n+" ");
        }
        System.out.println("");
        metodo.invertirArrayList(listaEnOrden);
        for (int n: listaEnOrden){
            System.out.print(n+" ");
        }
        System.out.println("");
        LinkedList<Integer> lLista = new LinkedList();
        lLista.add(1);
        lLista.add(2);
        lLista.add(3);
        System.out.println(metodo.sumarLinkedList(lLista));
        
        ArrayList<Integer> listaOrdenada1 = new ArrayList();
        ArrayList<Integer> listaOrdenada2 = new ArrayList();
        ArrayList<Integer> listaCombinada = new ArrayList();
        listaOrdenada1.add(1);
        listaOrdenada1.add(3);
        listaOrdenada1.add(4);
        listaOrdenada1.add(10);
        listaOrdenada1.add(20);
        listaOrdenada2.add(2);
        listaOrdenada2.add(6);
        listaOrdenada2.add(7);
        listaOrdenada2.add(8);
        listaCombinada = metodo.combinarOrdenado(listaOrdenada1, listaOrdenada2);
        for (int n: listaCombinada){
            System.out.print(n+" ");
        }
    }
}
