/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ayedp1ej8;

/**
 *
 * @author San Rojas
 * @param <T>
 */
public class CircularQueue<T> extends Queue<T>{
    public T shift(){
        T dato = dequeue();
        enqueue(dato);
        return dato;
    }
}
