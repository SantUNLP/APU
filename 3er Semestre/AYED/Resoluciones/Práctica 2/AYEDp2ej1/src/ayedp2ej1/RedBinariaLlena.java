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
public class RedBinariaLlena {
    private BinaryTree<Integer> arbol;
    
    public RedBinariaLlena(BinaryTree<Integer> a){
        this.arbol = a;
    }
    
     
    private void recorrer (BinaryTree<Integer> a, Queue<Integer> c,int t){
        t= t+a.getData();
        if(a.isLeaf()){
            c.enqueue(t);
        }
        if (a.hasLeftChild()){
            recorrer(a.getLeftChild(),c,t);
        }
        if (a.hasRightChild()){
            recorrer(a.getRightChild(),c,t);
        }
    }
    
    public int retardoReenvio(){
        Queue<Integer> cola = new Queue<>();
        int num;
        int max=-1;
        if (!this.arbol.isEmpty()){
            int tiempo=this.arbol.getData();
            if (this.arbol.isLeaf()){
                return tiempo;
            } else {
                recorrer(this.arbol,cola,tiempo);
            }
        }
        while (!cola.isEmpty()){
            num = cola.dequeue();
            if (num >= max){
                max = num; 
            }
        }
        return max;
    }
}
