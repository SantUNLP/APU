/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ayedp1ej8;
import java.util.List;
import java.util.LinkedList;
/**
 *
 * @author San Rojas
 * @param <T>
 */
public class Queue<T> extends Sequence{
    List<T> data;
    public Queue(){
        this.data = new LinkedList<T>();    
    }
    
    public void enqueue(T dato){
        data.add(dato);
                
    }
    
    public T dequeue(){
        return data.remove(0);
    }
    
    public T head(){
        return data.get(0);
    }
    
    @Override
    public int size(){
        return data.size();
    }
    
    
    @Override
    public String toString(){
        String str = "[";
        for(T d: data)
            str = str + d +", ";
        str = str.substring(0, str.length()-2)+"]";
        return str;
    }
    
    @Override
    public boolean isEmpty() {
        return data.size()==0;
    }
}
