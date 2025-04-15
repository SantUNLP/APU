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
public class Funcion {
    private String titulo;
    private String fecha;
    private int hora;
    private Butaca[][] sala;
    private int filas;
    private int butacas;
    
    public Funcion (String unTitulo, String unaFecha, int unaHora, int N, int M){
        this.titulo=unTitulo;
        this.fecha=unaFecha;
        this.hora=unaHora;
        this.filas=N;
        this.butacas=M;
        this.sala = new Butaca[this.filas][this.butacas];
        inicializarButacas();
    }
    
    private void inicializarButacas(){
        for (int i=0; i<this.filas;i++){
            for (int j=0; j<this.butacas;j++){
                this.sala[i][j]=new Butaca(i,j);
            }
        }
    }
    
    public double ocuparButaca(int B, int F){
        return this.sala[B][F].ocupar(B,F);
    }
    
    public void desocuparButacas(int fila){
        for (int i=0; i<this.butacas;i++){
            this.sala[fila][i].setEstado();
        }
        System.out.println("SE DESOCUPARON LAS BUTACAS DE LA FILA "+fila);
    }
    
    public String representacionButacas(int B){
        String rep="";
        for (int i=0;i<this.filas;i++){
            rep+=this.sala[i][B].representacion();
        }
        return rep;
    }
    
    private String representacionCompleta(){
        String rep="";
        for (int i=0;i<this.filas;i++){
            rep+="\n";
            for(int j=0;j<this.butacas;j++){
                rep+=this.sala[i][j].representacion();
            }
        }
        return rep;
    }
    
    public String representacionFuncion(){
        String aux="";
        aux="Titulo: "+this.titulo+" Fecha: "+this.fecha+" Hora: "+this.hora+"\n"+this.representacionCompleta();
        return aux;
    }
}
