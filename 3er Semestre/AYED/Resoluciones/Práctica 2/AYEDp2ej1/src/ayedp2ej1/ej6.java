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
public class ej6 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        BinaryTree<Integer> arbol = new BinaryTree<>(10);
        
        arbol.addLeftChild(new BinaryTree<>(5));
        arbol.addRightChild(new BinaryTree<>(15));
        arbol.getLeftChild().addLeftChild(new BinaryTree<>(2));
        arbol.getLeftChild().addRightChild(new BinaryTree<>(3));
        arbol.getLeftChild().getLeftChild().addLeftChild(new BinaryTree<>(20));
        
        Transformacion arbolT = new Transformacion(arbol);
        BinaryTree<Integer> arbolTransformado = new BinaryTree<>();
        
        arbolTransformado = arbolT.suma();
        arbolTransformado.recorrido();
        // TODO code application logic here
    }
    
}
