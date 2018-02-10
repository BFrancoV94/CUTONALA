/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package process;

import java.sql.SQLException;
import processBD.conexionBD;

/**
 *
 * @author bryan
 */
public class Querys {
    conexionBD con = new conexionBD();
        
        /**
        *@param consulta : Recibe la consulta que desee.
        */
        public void consulta(String consulta){
            try{
                con.Conectar();
                String sqlConsulta=consulta;
                conexionBD.st=conexionBD.conec.createStatement();
                conexionBD.rt=conexionBD.st.executeQuery(sqlConsulta);  
            }catch(SQLException exc){ }
        }
        
        /**
        *@param tabla : Recibe el nombre de la tabla.
        *@param campo1 : Recibe el nombre del campo para la condicion1.
        *@param condicion1 : Recibe el valor para el campo1.
        *@param operador :  Recibe el tipo de operador logico para la condicion deseada.
        *@param campo2 :  Recibe el nombre del campo para la condicion2.
        *@param condicion2 : Recibe el valor para el campo2.
        */
        public void consultaCondicion(String tabla,String campo1, String condicion1,String operador,
                                      String campo2,String condicion2)
        {
            try{
                con.Conectar();
                String consult="SELECT * FROM "+tabla+" WHERE "+campo1+"='"+condicion1+"' "
                                                                   +operador+
                                                            " "+campo2+"="+condicion2+" ";
                String sqlConsulta=consult;
                conexionBD.st=conexionBD.conec.createStatement();
                conexionBD.rt=conexionBD.st.executeQuery(sqlConsulta);  
            }catch(SQLException exc){ }
        }
        
}
