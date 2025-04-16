/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ayedp2ej7;

/**
 *
 * @author San Rojas
 */
public class AYEDp2ej7 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        BinaryTree<Integer> arbol = new BinaryTree<>(2);
        
        arbol.addLeftChild(new BinaryTree<Integer>(7));
        arbol.getLeftChild().addRightChild(new BinaryTree<Integer>(6));
        arbol.addRightChild(new BinaryTree<Integer>(-5));
        
        arbol.getRightChild().addLeftChild(new BinaryTree<Integer>(19));
        arbol.getRightChild().getLeftChild().addRightChild(new BinaryTree<Integer>(4));
        arbol.getRightChild().getLeftChild().getRightChild().addLeftChild(new BinaryTree<Integer>(18));
        
        arbol.getLeftChild().getRightChild().addLeftChild(new BinaryTree<Integer>(55));
        arbol.getLeftChild().getRightChild().addRightChild(new BinaryTree<Integer>(11));
        
        arbol.getLeftChild().addLeftChild(new BinaryTree<Integer>(23));
        arbol.getLeftChild().getLeftChild().addLeftChild(new BinaryTree<Integer>(-3));
        
        ParcialArboles pArbol = new ParcialArboles(arbol);
        System.out.println(pArbol.isLeftTree(7));
        
        BinaryTree<Integer> arbol1 = new BinaryTree<>(65);
        arbol1.addLeftChild(new BinaryTree<>(37));
        arbol1.getLeftChild().addRightChild(new BinaryTree<>(47));
        arbol1.addRightChild(new BinaryTree<>(81));
        arbol1.getRightChild().addRightChild(new BinaryTree<>(93));
        
        BinaryTree<Integer> arbol2 = new BinaryTree<>(65);
        
        arbol2.addLeftChild(new BinaryTree<>(37));
        arbol2.getLeftChild().addRightChild(new BinaryTree<>(47));
        arbol2.addRightChild(new BinaryTree<>(81));
        arbol2.getRightChild().addRightChild(new BinaryTree<>(93));
        arbol2.getRightChild().addLeftChild(new BinaryTree<>(76));
        arbol2.getRightChild().getRightChild().addRightChild(new BinaryTree<>(94));
        arbol2.getRightChild().getRightChild().addLeftChild(new BinaryTree<>(85));
        
        arbol2.getLeftChild().addLeftChild(new BinaryTree<>(22));
        arbol2.getLeftChild().getLeftChild().addLeftChild(new BinaryTree<>(11));
        arbol2.getLeftChild().getLeftChild().addRightChild(new BinaryTree<>(29));
        
        System.out.println(pArbol.esPrefijo(arbol1,arbol2));
        
        BinaryTree<Integer> arbol3 = new BinaryTree<>(20);
        arbol3.addLeftChild(new BinaryTree<>(5));
        arbol3.addRightChild(new BinaryTree<>(30));
        arbol3.getLeftChild().addLeftChild(new BinaryTree<>(-5));
        arbol3.getLeftChild().addRightChild(new BinaryTree<>(10));
        arbol3.getLeftChild().getRightChild().addRightChild(new BinaryTree<>(1));
        arbol3.getRightChild().addLeftChild(new BinaryTree<>(50));
        arbol3.getRightChild().addRightChild(new BinaryTree<>(-9));
        arbol3.getRightChild().getLeftChild().addRightChild(new BinaryTree<>(4));
        arbol3.getRightChild().getLeftChild().getRightChild().addRightChild(new BinaryTree<>(6));
        
        BinaryTree<DobleNum> arbolSumAndDif = new BinaryTree<>();
        
        arbolSumAndDif = pArbol.sumAndDif(arbol3);
        
        // TODO code application logic here
    }
    
}
