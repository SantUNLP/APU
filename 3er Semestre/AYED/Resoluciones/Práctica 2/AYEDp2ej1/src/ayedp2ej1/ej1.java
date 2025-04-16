/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ayedp2ej1;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author San Rojas
 */
public class ej1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        BinaryTree<Integer> arbol = new BinaryTree<>(10);
        BinaryTree<Integer> arbol2 = new BinaryTree<>();
        
        arbol.addLeftChild(new BinaryTree<>(5));
        arbol.getLeftChild().addRightChild(new BinaryTree<>(2));
        arbol.getLeftChild().addLeftChild(new BinaryTree<>(4));
        arbol.addRightChild(new BinaryTree<>(8));
        arbol.getRightChild().addRightChild(new BinaryTree<>(9));
        arbol.getRightChild().getRightChild().addLeftChild(new BinaryTree<>(20));
        arbol.getRightChild().getRightChild().addRightChild(new BinaryTree<>(10));
        
        arbol.recorrido();
        System.out.println("");
        System.out.println("Cantidad de hojas del árbol: "+arbol.contarHojas());
        
        arbol2 = arbol.espejo();
        
        arbol.entreNiveles(0, 1);
        
        List<Integer> aLista = new ArrayList<>();
        ContadorArbol arbolContador = new ContadorArbol(arbol);
        
        aLista = arbolContador.numerosPares();
        
        for (int n:aLista){
            System.out.print(n+" ");
        }
        // TODO code application logic here
    }
    
}
