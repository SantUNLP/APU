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
public class SistemaAnual extends Sistema  {
    
    public SistemaAnual(int unComienzo, int unFin, Estacion unaEstacion) {
        super(unComienzo, unFin, unaEstacion);
    }
    
    @Override
    public String getTemperatura(){
    int i,j;
    double prom;
    String temperatura;
    temperatura = this.getEstacion()+"\n";
    for (i=0;i<this.getConsec();i++){
        prom=0;
        temperatura+="Año "+(this.getAnio()+i)+": ";
        for(j=0;j<12;j++){
            prom+=this.getReporte(i,j);
        }
        prom=prom/this.getConsec();
        temperatura+=prom+"°C\n";
    }
    return temperatura;
}
}