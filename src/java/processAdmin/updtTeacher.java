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
@WebServlet(name = "updtTeacher", urlPatterns = {"/updtTeacher"})
public class updtTeacher extends HttpServlet {
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
                +"a button{ padding: .5%;font-size:100%;}"
                +"a button:hover{box-shadow: 1px 2px 2px 1px #000;}"
                +"footer{background-color: #000;color: #fff;padding: 1%;text-align: center;}"
                +".btn-box{"
                    +"width: 100%;"
                    +"margin:0%30%;"
                    +"display: flex;\n" 
                    +"align-items: center;\n" 
                    +"align-content: space-between;"
                +"}"
                +".btn-box a{margin:0%4%;} .btn-box a button{ width: 100%;}"
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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet updtTeacher</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updtTeacher at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
        //processRequest(request, response);
        PrintWriter out = response.getWriter();
        int optionID;
        optionID = Integer.parseInt( request.getParameter("OPTION"));
        int codigoDocente,Privilegio,password;
        String nombre,apellidos,correo,usuario;
        codigoDocente = Integer.parseInt(request.getParameter("codigoDocente"));
        nombre = request.getParameter("nombreDocente");
        apellidos = request.getParameter("apellidosDocente");
        correo = request.getParameter("correoDocente");
        usuario=request.getParameter("usuarioDocente");
        password=Integer.parseInt(request.getParameter("passwordDocente"));
        Privilegio = Integer.parseInt(request.getParameter("privilegioDocente"));
        String messgeSucces=""+
                htmlFirst
                + "<h1>Exito al Efectuar el Cambio</h1><br><br><br>"
                + "<div class='btn-box'>"
                + "<a href='http://localhost:8080/CUTONALA/administration/admin.jsp'><button>Regresar Administracion</button></a>"
                + "<br><br>"
                + "<a href='http://localhost:8080/CUTONALA/administration/actions/listaDocente.jsp'><button>Ver lista Docentes</button></a><br>"
                + "</div><br><br><br><br><br>"
                + "<center><img src='imgs/Logo-UDG.png' /></center>"+
                htmlEnd;
        if(optionID>0){
            conexionBD cnUpdt = new conexionBD();
            try{
                cnUpdt.Conectar();
                    conexionBD.prest = conexionBD.conec.prepareStatement("UPDATE maestros SET "
                                                                     +" codigoDocente="+codigoDocente+" ,"
                                                                     +" nombre_ma='"+nombre+"' ,"
                                                                     +" Apellidos='"+apellidos+"' ,"
                                                                     +" correo='"+ correo+"' ,"
                                                                     +" Usuario='"+usuario+"' ,"
                                                                     +" password='"+password+"' ,"
                                                                     +" privilegio="+Privilegio+" "
                                                                   +"WHERE Id_maestro="+optionID+"  ");
                    int resultado = conexionBD.prest.executeUpdate();
                    if(resultado > 0){
                        out.print(messgeSucces);
                    }else{
                        out.print("error");
                    }
            }catch(SQLException exc){
              out.print("<center>"
                        +"<h1>Error SQL al Borrar los Datos</h1><br><br><br>"
                        +"<p>ERROR SQL - ( "+exc+" ) </p>"
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
