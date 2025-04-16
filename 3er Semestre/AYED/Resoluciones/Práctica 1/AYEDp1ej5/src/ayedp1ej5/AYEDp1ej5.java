/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ayedp1ej5;

/**
 *
 * @author San Rojas
 */
public class AYEDp1ej5 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int[] vE = new int[5];
        for (int i=0;i<5;i++){
            vE[i] = i+1*3;
        }
        System.out.println(metodos.retornarMaxMinProm(vE));
        System.out.println(metodos.retornarMaxMinProm(2));
        metodos.retornarMaxMinProm();
        // TODO code application logic here
    }
    
}
