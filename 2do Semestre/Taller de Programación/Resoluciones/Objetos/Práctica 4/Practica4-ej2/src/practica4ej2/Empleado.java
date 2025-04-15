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
public abstract class Empleado {
    private String nombre;
    private double sueldobasico;
    private int antiguedad;
    
    /**
     *
     * @param unNombre
     * @param unSueldo
     * @param unaAntiguedad
     */
    protected Empleado (String unNombre, double unSueldo, int unaAntiguedad){
        setNombre(unNombre);
        setSueldobasico(unSueldo);
        setAntiguedad(unaAntiguedad);
    }

    protected String getNombre() {
        return nombre;
    }

    protected void setNombre(String nombre) {
        this.nombre = nombre;
    }

    protected double getSueldobasico() {
        return sueldobasico;
    }

    protected void setSueldobasico(double sueldobasico) {
        this.sueldobasico = sueldobasico;
    }

    protected int getAntiguedad() {
        return antiguedad;
    }

    protected void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
    
    
    
    protected abstract double calcularEfectividad();
    
    protected abstract double calcularSueldoACobrar();

    @Override
    public String toString() {
        String aux;
        aux = nombre+" "+sueldobasico+" "+this.calcularEfectividad();
        return aux;
    }
}
