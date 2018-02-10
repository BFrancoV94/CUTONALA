/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package processAdmin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import processBD.conexionBD;

/**
 *
 * @author bryan
 */
@WebServlet(name = "deleteTeacher", urlPatterns = {"/deleteTeacher"})
public class deleteTeacher extends HttpServlet {
    String htmlFirst=
            "<!Doctype html>"
            + "<html lang='es'>"
            + "<head>"
            + "<title>Datos Borrados Exitosamente &#128218;</title>"
            + "<link rel=\"shorcut icon\" href=\"imgs/cut.jpg\">  "
            +"<style type='text/css'>"
                +"*{padding:0;margin:0;}"
                +"body{"
                    +"background-color: #fff;"+
                    "background-repeat: no-repeat;\n" +
                    "background-size: cover;\n" +
                    "background-position: center center;\n" +
                    "background-attachment: fixed;\n" +
                    "opacity: 1;"
                + "}"
                +"h1{"
                    +"background-color: #000;color: #fff;padding: 1%;text-align: center;"
                 +"}"
                +".error-info h2{text-align:center;font-size:180%; margin:5%0%;}"
                +"a button{padding:.5%;font-size:100%;}"
                +"a button:hover{box-shadow: 1px 2px 2px 1px #000;}"
                +"footer{background-color: #000;color: #fff;padding: 1%;text-align: center;}"
            + "</style>"
            + "</head>"
            + "<body>";
    
    
    String htmlEnd=
            "</body>"
            + "</html>";
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     // processRequest(request, response);
     PrintWriter out = response.getWriter();
     int option;
     option = Integer.parseInt( request.getParameter("OPTION"));
     conexionBD conDel = new conexionBD();
     String sqlByCode;
     sqlByCode="DELETE FROM maestros WHERE Id_maestro="+option+" ";
     String messageSucces=
               htmlFirst+
              "<center>"
                    +"<h1>Se ha Eliminado un Registro Exitosamente!</h1><br><br>"
                    +"<a href='http://localhost:8080/CUTONALA/administration/admin.jsp' >"
                            +"<button>Regresar a la administracion</button></a>"
                    +"<br><br><br><br><br><br>"
                    +"<img src='imgs/Logo-UDG.png' ><br>"
             + "</center>"+
             htmlEnd;
     
     if(option>0){
        try{
            conDel.Conectar();
            conexionBD.st = conexionBD.conec.createStatement();
            if(option > 0){
               conexionBD.st.execute(sqlByCode);
               out.print(messageSucces);
            }else{}
        }catch(SQLException ex){
            out.print("<center>"
                        +"<h1>Error SQL al Borrar los Datos</h1><br><br><br>"
                        +"<p>ERROR SQL - ( "+ex+" ) </p>"
                     +"</center>");
        }finally {
           try { conexionBD.conec.close(); }
           catch (SQLException exc){}
        }
     }else{
         response.sendRedirect("http://localhost:8080/CUTONALA/administration/admin.jsp");
     }
    }
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
