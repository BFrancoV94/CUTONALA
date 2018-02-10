/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package process;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import processBD.conexionBD;

/**
 *
 * @author bryan
 */
@WebServlet(name = "changePassword", urlPatterns = {"/changePassword"})
public class changePassword extends HttpServlet {

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
            out.println("<title>Servlet changePassword</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet changePassword at " + request.getContextPath() + "</h1>");
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
        HttpSession sesion = request.getSession();
        PrintWriter out = response.getWriter();
        String password, passwordConfirm;
        password = request.getParameter("passwordNwe");
        passwordConfirm = request.getParameter("confPassw");
        
        if (passwordConfirm.equals(password)) { 
            password = encriptMD5(password);
            Integer id = (Integer)sesion.getAttribute("id");
                try { 
                PreparedStatement prepStatement;
                conexionBD conLog = new conexionBD();
                conLog.Conectar();
                    if (conexionBD.conec != null ){
                        prepStatement =
                                conexionBD.conec.prepareStatement
                                                ("UPDATE maestros SET "
                                                   +" password='"+password+"' "
                                                +"WHERE Id_maestro="+id+" ");
                        int resultado = prepStatement.executeUpdate();
                        if(resultado > 0){
                            out.print("<h4>Contrase&ntilde;a cambiada exitosamente! <span class='material-icons white-text green circle'>check</span> </h4>");
                        }else{
                            out.print("<h4>Error al cambiar la contrase&ntilde;a <span class='material-icons white-text red circle'>close</span></h4>");
                        }
                    }
                }catch (SQLException ex){
                         out.print("Error en - "+ex);
                }catch(NumberFormatException ex){
                    out.print("<h2>Imposible , Ingrese solo numero, intente de nuevo</h2>");
                }finally{ 
                    if ( conexionBD.conec != null ){ 
                            try{ 
                                conexionBD.conec.close(); 
                                conexionBD.st.close(); 
                            }catch( SQLException e ) { 
                                out.print("<h1>"+e.getMessage()+"</h1>"); 
                            } 
                    }
                }
        }else{
            out.print("<h4>Las contrase&ntilde;as no coinciden <span class='material-icons white-text red circle'>close</span> </h4>");
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
    
    /**
    *@param password  : Recibe la contraseña a encriptar para comparar con la base de datos.
    * @return 
    */
    public String encriptMD5(String password){
        try{
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            StringBuilder sb = new StringBuilder();
            byte []arrMd = md5.digest(password.getBytes());
            for (int i = 0; i < arrMd.length; i++) {
                sb.append(Integer.toHexString((arrMd[i] & 0xFF) | 0x100).substring(1, 3));
            }
            return sb.toString();
        }catch(NoSuchAlgorithmException e){
            out.print("Error: "+e);
        }
        return null;
    }
}
