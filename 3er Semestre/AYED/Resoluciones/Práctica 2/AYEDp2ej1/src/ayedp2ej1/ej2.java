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
public class ej2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        BinaryTree<Integer> arbol = new BinaryTree<>(2);
        BinaryTree<Integer> arbolIzq = new BinaryTree<>(1);
        BinaryTree<Integer> arbolDer = new BinaryTree<>(2);
        
        arbolIzq.addLeftChild(new BinaryTree<>(5));
        arbolIzq.addRightChild(new BinaryTree<>(4));
        arbolDer.addLeftChild(new BinaryTree<>(2));
        arbolDer.addRightChild(new BinaryTree<>(7));
        arbol.addLeftChild(arbolIzq);
        arbol.addRightChild(arbolDer);
        
        RedBinariaLlena redBinaria = new RedBinariaLlena(arbol);
        
        System.out.println("el mayor tiempo de retardo es: "+redBinaria.retardoReenvio());
        // TODO code application logic here
    }
    
}
