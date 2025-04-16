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
 * 
 */
public class DoubleEndedQueue<T> extends Queue<T> {
    public void enqueueFirst(T data){
        this.data.add(0, data);
    }
}
