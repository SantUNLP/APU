/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ayedp1ej1;

/**
 *
 * @author San Rojas
 */
public class Persona {
    private static int codigo=0;
    private int ultCodigo;
    private String nombre;
    
    public Persona(String unNombre) {
        this.codigo++;
        this.ultCodigo=this.codigo;
        this.nombre = unNombre;
    }
    
    public int obtenerCodigo(){
        return this.ultCodigo;
    }
    
    public static int getCodigo(){
        return Persona.codigo;
    }
    
}

