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
public class ParcialArboles {
    private BinaryTree<Integer> arbol;
    
    public ParcialArboles(BinaryTree<Integer> arbol){
        this.arbol = arbol;
    }
    
    private BinaryTree<Integer> encontrarNodo(BinaryTree<Integer> a, int n, BinaryTree<Integer> aux){
        if (a.getData() == n){
            return a;
        } else {
            if (a.hasLeftChild()){
                aux = encontrarNodo(a.getLeftChild(),n,aux);
            }
            if (a.hasRightChild()){
                aux = encontrarNodo(a.getRightChild(),n,aux);
            }
        }
        return aux;
    }
    
    private int tieneMasHijos(BinaryTree<Integer> a){
        int cant = 0;
        if (a.hasLeftChild() && a.hasRightChild())
            return cant += tieneMasHijos(a.getLeftChild()) + tieneMasHijos(a.getRightChild());
        else{
            if (a.hasLeftChild()) cant += 1 + tieneMasHijos(a.getLeftChild());
            if (a.hasRightChild()) cant += 1 + tieneMasHijos(a.getRightChild());
        }
        return cant;
    }
    
    public boolean isLeftTree(int num){
        int cantIzq, cantDer;
        BinaryTree<Integer> nodoEncontrado = new BinaryTree<>();
        BinaryTree<Integer> aux = new BinaryTree<>();
        if (!this.arbol.isEmpty()){
            nodoEncontrado = encontrarNodo(this.arbol,num,aux);
            if (nodoEncontrado.isEmpty()){
                System.out.println("No existe el número ingresado");
            } else {
                cantIzq = 0;
                cantDer = 0;
                if (nodoEncontrado.hasRightChild()){
                    cantDer = tieneMasHijos(nodoEncontrado.getRightChild());
                    
                } else {
                    cantDer = -1;
                }
                if (nodoEncontrado.hasLeftChild()){
                    cantIzq = tieneMasHijos(nodoEncontrado.getLeftChild());
                    
                } else {
                    cantIzq = -1;
                }
                if (cantIzq > cantDer) return true;
            }
        }
        return false;
    }
    
    private boolean sonIguales(int dato1, int dato2){
        return dato1 == dato2;
    }
    
    private boolean recorrer(BinaryTree<Integer> a1, BinaryTree<Integer> a2){
        if (sonIguales(a1.getData(),a2.getData())){
            if (a1.hasLeftChild() && a1.hasRightChild() && a2.hasLeftChild() && a2.hasRightChild()){
                return true && recorrer(a1.getLeftChild(),a2.getLeftChild()) && recorrer(a1.getRightChild(),a2.getRightChild());
            } else {
                if (a1.isLeaf()){
                    return true;
                }
                if (a1.hasLeftChild() && a2.hasLeftChild()) return true && recorrer(a1.getLeftChild(),a2.getLeftChild());   
                if (a1.hasRightChild() && a2.hasRightChild()) return true && recorrer(a1.getRightChild(),a2.getRightChild());
            }
        }
        return false;
    }
    
    public boolean esPrefijo (BinaryTree<Integer> a1, BinaryTree<Integer> a2){
        if (!a1.isEmpty() && !a2.isEmpty()){
            return recorrer(a1,a2);
        }
        return false;
    }
    
    private BinaryTree<DobleNum> obtenerArbolSumAndDif(BinaryTree<Integer> a1, BinaryTree<DobleNum> a2, int suma, int resta){
        
        if (a1.hasLeftChild()){
            suma = a2.getData().getSuma() + a1.getLeftChild().getData();
            resta = a1.getLeftChild().getData() - a1.getData();
            DobleNum dato = new DobleNum(suma,resta);
            a2.addLeftChild(new BinaryTree<>(dato));
            obtenerArbolSumAndDif(a1.getLeftChild(),a2.getLeftChild(),suma,a1.getData());
        }
        if (a1.hasRightChild()){
            suma = a2.getData().getSuma() + a1.getRightChild().getData();
            resta = a1.getRightChild().getData() - a1.getData();
            DobleNum dato = new DobleNum(suma,resta);   
            a2.addRightChild(new BinaryTree<>(dato));
            obtenerArbolSumAndDif(a1.getRightChild(),a2.getRightChild(),suma,a1.getData());    
        }
        return a2;
    }
    
    private void recorridoSumAndDif(BinaryTree<DobleNum> a){
        System.out.println(a.getData().obtenerDatos());
        if (a.hasLeftChild()){
            recorridoSumAndDif(a.getLeftChild());
        }
        if (a.hasRightChild()){
            recorridoSumAndDif(a.getRightChild());
        }
    }
    
    public BinaryTree<DobleNum> sumAndDif(BinaryTree<Integer> a){
        if (!a.isEmpty()){
            DobleNum dato = new DobleNum(a.getData(),a.getData());
            BinaryTree<DobleNum> aSaD = new BinaryTree<>(dato);
            aSaD = obtenerArbolSumAndDif(a,aSaD,0,0);
            recorridoSumAndDif(aSaD);
        }
        return null;
    }
}
