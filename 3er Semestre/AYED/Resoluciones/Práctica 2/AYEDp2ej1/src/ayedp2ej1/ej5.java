/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ayedp2ej1;

/**
 *
 * @author San Rojas
 */
public class ej5 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        BinaryTree<Integer> arbol = new BinaryTree<>(10);
        
        arbol.addLeftChild(new BinaryTree<>(10));
        arbol.addRightChild(new BinaryTree<>(15));
        arbol.getLeftChild().addLeftChild(new BinaryTree<>(5));
        arbol.getLeftChild().addRightChild(new BinaryTree<>(10));
        
        ProfundidadDeArbolBinario a = new ProfundidadDeArbolBinario(arbol);
        
        System.out.println(a.sumaElementosProfundidad(2));
        // TODO code application logic here
    }
    
}
