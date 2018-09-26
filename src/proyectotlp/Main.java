/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectotlp;

import java.io.File;


/**
 *
 * @author CESAR-PC
 */
public class Main {
   
     public static void main(String[] args) {
        String path = "C:/Users/CESAR-PC/Documents/NetBeansProjects/ProyectoTLP/src/proyectotlp/Lexer.flex";
        generarLexer(path);
        
        Window w = new Window();
        w.setDefaultCloseOperation(w.EXIT_ON_CLOSE);
        w.setVisible(true);
        
    }
    public static void generarLexer(String path){
        File file=new File(path);
        jflex.Main.generate(file);
    }
    
    
    
}