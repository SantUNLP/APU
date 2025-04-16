/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ayedp1ej9;
import java.util.ArrayList;
/**
 *
 * @author San Rojas
 */
public class TestBalanceo {
    public static boolean estaBalanceado(String cadena){
        char c;
        Stack<Character> pila = new Stack<Character>();
        
        for (int i=0;i<cadena.length();i++){
            c = cadena.charAt(i);
            if ((c == '(') || (c == '[') || (c == '{')){
                pila.push(c); 
            } else if (pila.isEmpty()) {
                return false;
            } else {
                pila.pop();
            }
        }    
        return pila.isEmpty();
    }
}
