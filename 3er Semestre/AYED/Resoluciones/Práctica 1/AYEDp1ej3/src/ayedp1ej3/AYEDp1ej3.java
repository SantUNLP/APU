/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ayedp1ej3;

/**
 *
 * @author San Rojas
 */
public class AYEDp1ej3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Estudiante[] e = new Estudiante[2];
        Profesor[] p = new Profesor[3];
        e[0] = new Estudiante("Santiago","Rojas","1","sirnyar13@gmail.com","517 e/ 151 y 152");
        e[1] = new Estudiante("Matias","Avila","1","matiasavila@gmail.com","1 y 44");
        for(int i=0;i<2;i++){
            System.out.println(e[i].tusDatos());
        }
        // TODO code application logic here
    }
    
}
