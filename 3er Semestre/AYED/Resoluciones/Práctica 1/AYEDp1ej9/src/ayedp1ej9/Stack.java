/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ayedp1ej9;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author San Rojas
 * @param <T>
 */
public class Stack<T> extends Sequence<T> {
    private List<T> data;
    
    public Stack() {
        data = new ArrayList<T>();
    }
    public void push(T dato) {
        data.add(data.size(), dato);
    }
    public T pop() {
        return data.remove(data.size()-1);
    }
    public T top() {
        return data.get(data.size()-1);
    }
    
    @Override
    public int size() {
        return data.size();
    }
    @Override
    public boolean isEmpty() {
        return data.size()==0;
    }
    @Override
    public String toString() {
        String str = "[";
        for(T d: data)
            str = str + d +", ";
        str = str.substring(0,str.length()-2)+"]";
        return str;
    }
}

