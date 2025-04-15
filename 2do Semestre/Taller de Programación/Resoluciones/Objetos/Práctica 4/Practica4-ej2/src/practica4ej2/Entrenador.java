/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica4ej2;

/**
 *
 * @author San Rojas
 */
public class Entrenador extends Empleado {
    private int campeonesGanados;
    
    public Entrenador (String unNombre, double unSueldo, int unaAntiguedad, int unCampeon){
        super(unNombre,unSueldo,unaAntiguedad);
        this.setCampeonesGanados(unCampeon); 
    }

    private int getCampeonesGanados() {
        return this.campeonesGanados;
    }

    private void setCampeonesGanados(int campeonesGanados) {
        this.campeonesGanados = campeonesGanados;
    }
    
    public String toString(){
        return super.toString();
    }
    
    @Override
    protected double calcularEfectividad() {
        return (this.getCampeonesGanados()/this.getAntiguedad());
    }

    @Override
    protected double calcularSueldoACobrar() {
        double sueldo=this.getSueldobasico();
        int campeones=this.getCampeonesGanados();
        sueldo+=(this.getSueldobasico()*this.getAntiguedad()*0.1);
        if (campeones >= 1 && campeones <= 4)
            sueldo+=5000;
        else
            if(campeones >= 5 && campeones <= 10)
                sueldo+=30000;
        else
            if(campeones > 10)
                sueldo+=50000;
        return sueldo;
    }  
}
