/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica4ej4;

/**
 *
 * @author San Rojas
 */
public abstract class Sistema{
    private double [][] reporte;
    private int anios;
    private int consec;
    private Estacion estacion;
    
    public Sistema(int unComienzo, int unFin, Estacion unaEstacion){
        generarSistema(unComienzo,unFin);
        setEstacion(unaEstacion);
    }
    
    private void setEstacion(Estacion unaEstacion){
        this.estacion=unaEstacion;
    }
    
    public void generarSistema(int anio,int anioConsecutivo){
        this.reporte=new double [anioConsecutivo][12];
        this.setAnios(anio);
        this.setConsec(anioConsecutivo);
        for (int i=0; i<anioConsecutivo;i++){
            for (int j=0; j<12; j++){
                setTemperatura(i,j);
            }
        }
    }
    
    private void setConsec(int aCon){
        this.consec=aCon;
    }
    
    public int getConsec(){
        return this.consec;
    }
    
    public double getReporte(int fila,int colum){
        return this.reporte[fila][colum];
    }
    
    public int getAnio(){
        return this.anios;
    }
    
    abstract String getTemperatura();
    
    private void setAnios(int A){
        this.anios=A;
    }
    
    private void setTemperatura(int fila, int colum){
        this.reporte[fila][colum]=1;
    }
    
    public String getEstacion(){
        return this.estacion.representacionEstacion();
    }
}
