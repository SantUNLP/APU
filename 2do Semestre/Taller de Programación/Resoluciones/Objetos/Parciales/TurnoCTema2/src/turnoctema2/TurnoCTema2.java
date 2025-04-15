/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package turnoctema2;

/**
 *
 * @author San Rojas
 */
public class TurnoCTema2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Funcion obra = new Funcion ("Don quijote","07/10/2024",18,4,5);
        for (int i=0;i<4;i++){
            for (int j=0;j<5;j++){
                obra.ocuparButaca(i, j);
            }
        }
        obra.desocuparButacas(0);
        System.out.println(obra.representacionFuncion());
    }
}
