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
public class ProfundidadDeArbolBinario {
    private BinaryTree<Integer> arbol;
    
    public ProfundidadDeArbolBinario(BinaryTree<Integer> a){
        this.setArbol(a);
    }
    
    private void setArbol (BinaryTree<Integer> a){
        this.arbol = a;
    }
    
    private int recorridoProfundo(BinaryTree<Integer> a,int n, int p){
        int suma=0;
        if (n == p){
            suma=a.getData();
        } else {
            if (a.hasLeftChild()){
                suma += recorridoProfundo(a.getLeftChild(),n+1,p);
            }
            if (a.hasRightChild()){
                suma += recorridoProfundo(a.getRightChild(),n+1,p);
            }
        }
        return suma;
    }
    
    public int sumaElementosProfundidad(int p){
        int suma=0;
        if(!this.arbol.isEmpty() && this.arbol != null){
                suma = recorridoProfundo(this.arbol,0,p);
        }
        return suma;
    }
}
