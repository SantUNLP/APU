/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package turnok2024;

/**
 *
 * @author San Rojas
 */
public class TurnoK2024 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
            
        ProgramadorLider lider = new ProgramadorLider("Santiago",45573215,2000000,200,"PHP",2,10);
        Programador programador = new Programador ("Juancito",21544232,10000,250,"Python");
        Empresa FluxIT = new Empresa("FluxIT",lider,10);
        FluxIT.agregarProgramador(programador);
        System.out.println(FluxIT.toString()); 
        FluxIT.aumentarSueldo(10000);
        System.out.println(FluxIT.toString());
        // TODO code application logic here
    }
    
}
