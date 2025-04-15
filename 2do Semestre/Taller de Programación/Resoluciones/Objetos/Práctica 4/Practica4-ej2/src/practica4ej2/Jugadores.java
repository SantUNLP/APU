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
public class Jugadores extends Empleado {
    private int partidosjugados;
    private int goles;
    
    public Jugadores (String unNombre, double unSueldo, int unaAntiguedad, int unPartido, int unGol){
        super(unNombre, unSueldo, unaAntiguedad);
        this.setPartidosjugados(unPartido);
        this.setGoles(unGol);
    }

    private int getPartidosjugados() {
        return partidosjugados;
    }

    private void setPartidosjugados(int partidosjugados) {
        this.partidosjugados = partidosjugados;
    }

    private int getGoles() {
        return goles;
    }

    private void setGoles(int goles) {
        this.goles = goles;
    }
    
    public String toString(){
        return super.toString();
    }
    
    /**
     *
     * @return
     */
    @Override
    
    protected double calcularEfectividad(){
        return getGoles()/getPartidosjugados();
    }

    /**
     *
     * @return
     */
    @Override
    protected double calcularSueldoACobrar(){
        double sueldo=this.getSueldobasico();
        sueldo+=(this.getSueldobasico()*this.getAntiguedad()*0.1);
        if (this.getGoles()/this.getPartidosjugados() > 0.5){
            sueldo+=this.getSueldobasico();
        }
        return sueldo;
    }
}
