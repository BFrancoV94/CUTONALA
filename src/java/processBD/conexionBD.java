/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package processBD;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;

/**
 *
 * @author bryan
 */
public class conexionBD {
    public static PreparedStatement prest=null;
    public static CallableStatement cllst=null;
    public static Connection conec=null;
    public static Statement st=null;
    public static ResultSet rt=null;
    public static String usu;
    public static String contra;
    public static String host;
    public static String db;
    public static String driver;
    public void Conectar(){
        try{
            usu="root";
            contra="";
            host="localhost";
            db="cutonala";
            driver="com.mysql.jdbc.Driver";
            String url="jdbc:mysql://"+host+"/"+db;
            Class.forName(driver).newInstance();
            conec=DriverManager.getConnection(url,usu,contra);
        }catch(ClassNotFoundException | IllegalAccessException | InstantiationException | SQLException e){
            JOptionPane.showMessageDialog(null, e.toString());
        }
    }
    
    public void closeBD(){
        if ( conexionBD.conec != null ){ 
                try{ 
                    conexionBD.conec.close(); 
                    conexionBD.st.close(); 
                }catch( SQLException e ) { 
                    System.out.print("<h1>"+e.getMessage()+"</h1>"); 
                } 
        }
    } 
    
    
}
