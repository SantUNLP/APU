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
public class ProgramadorLider extends Programador {
    private int antiguedad;
    private int cantProyectos;
    
    public ProgramadorLider (String unNombre, int unDNI, double unSueldo, int CLPH, String unLenguaje, int unaAntiguedad, int unaCantidadProyectos){
        super(unNombre,unDNI,unSueldo,CLPH,unLenguaje);
        this.antiguedad=unaAntiguedad;
        this.cantProyectos=unaCantidadProyectos;
    }
    
    private int getAntiguedad(){
        return this.antiguedad;
    }
    
    private int getCantProyectos(){
        return this.cantProyectos;
    }
    
    @Override
    public double obtenerSueldoFinal(){
        return super.obtenerSueldoFinal() + ((10000 * this.getAntiguedad()) + (20000 * this.getCantProyectos()));
    }
    
}
