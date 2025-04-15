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
public class SistemaMensual extends Sistema {
    private String [] meses;
    
    
    public SistemaMensual(int unComienzo, int unFin, Estacion unaEstacion) {
        super(unComienzo, unFin, unaEstacion);
        setMeses(meses);
    }
    
    private void setMeses(String [] unosMeses){
        this.meses = new String [12];
        this.meses[0]="Enero";
        this.meses[1]="Febrero";
        this.meses[2]="Marzo";
        this.meses[3]="Abril";
        this.meses[4]="Mayo";
        this.meses[5]="Junio";
        this.meses[6]="Julio";
        this.meses[7]="Agosto";
        this.meses[8]="Septiembre";
        this.meses[9]="Octubre";
        this.meses[10]="Noviembre";
        this.meses[11]="Diciembre";
    }
    
    public String getMes (int i){
        return this.meses[i];
    }
    
    @Override
    public String getTemperatura(){
    int i,j;
    double prom;
    String temperatura;
    temperatura = this.getEstacion()+"\n";
    for (i=0;i<12;i++){
        prom=0;
        temperatura+=" "+(this.getMes(i))+": ";
        for(j=0;j<this.getConsec();j++){
            prom+=this.getReporte(j,i);
        }
        prom=prom/12;
        temperatura+=prom+"°C\n";
    }
    return temperatura;
}
}
