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
public class Transformacion {
    private BinaryTree<Integer> arbol;
    
    public Transformacion(BinaryTree<Integer> a){
        this.arbol=a;
    }
    
    private int recorridoTransformar(BinaryTree<Integer> a){
        int aux = a.getData();
        int sumaIzq = 0;
        int sumaDer = 0;
        if (a.hasLeftChild()){
            sumaIzq += recorridoTransformar(a.getLeftChild());
        }
        if (a.hasRightChild()){
            sumaDer += recorridoTransformar(a.getRightChild());
        }
        a.setData(sumaIzq+sumaDer);
        return aux+a.getData();
    }
    
    public BinaryTree<Integer> suma (){
        BinaryTree<Integer> nuevoArbol = new BinaryTree<>();
        if (!this.arbol.isEmpty() && this.arbol != null){
            recorridoTransformar(this.arbol);
            nuevoArbol = this.arbol;
        }
        return nuevoArbol;
    }
}
