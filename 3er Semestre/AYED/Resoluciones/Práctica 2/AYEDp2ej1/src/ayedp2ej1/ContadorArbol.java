/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ayedp2ej1;

import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author San Rojas
 */
public class ContadorArbol {
    private BinaryTree<Integer> node;
    
    public ContadorArbol(BinaryTree<Integer> a){
        this.node = a;
    }
    
    private void recorrer(BinaryTree<Integer> a,List<Integer> l){
            
            if (a.hasLeftChild()){
               recorrer(a.getLeftChild(),l);
            }
            if (a.hasRightChild()){
                    recorrer(a.getRightChild(),l);
            }
            if (a.getData() % 2 == 0){
                l.add(a.getData());
            }
    }
    
    public List<Integer> numerosPares(){
        List<Integer> lista = new LinkedList<>();
        if (!this.node.isEmpty()){
            if (this.node.getData() % 2 == 0){
                lista.add(this.node.getData());
            }
            if ((this.node.hasLeftChild()) && (this.node.hasRightChild())){
                recorrer(this.node.getLeftChild(),lista);
                recorrer(this.node.getRightChild(),lista);
            } else {
                if (this.node.hasLeftChild()){
                    recorrer(this.node.getLeftChild(),lista);
                }
                if (this.node.hasRightChild()){
                    recorrer(this.node.getRightChild(),lista);
                }
            }
        }
        return lista;
    }
    
}
