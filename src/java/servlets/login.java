/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

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
@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {
    String htmlFirst=
            "<!Doctype html>"
            + "<html lang='es'>"
            + "<head>"
            + "<title>Error de Datos</title>"
            +"<style type='text/css'>"
                +"*{padding:0;margin:0;}"
                +"body{"
                    +"background-image: url('black-carbon.jpg');\n" +
                    "background-color: #fff;"+
                    "background-repeat: no-repeat;\n" +
                    "background-size: cover;\n" +
                    "background-position: center center;\n" +
                    "background-attachment: fixed;\n" +
                    "opacity: 1;"
                + "}"
                +".error-info h1{"
                    +"background-color: #000;color: #fff;padding: 1%;text-align: center;"
                 +"}"
                +".error-info h2{text-align:center;font-size:180%; margin:5%0%;}"
                +".error-info a button{padding:.5%;font-size:100%;}"
                +".error-info a button:hover{box-shadow: 1px 2px 2px 1px #000;}"
                +"footer{background-color: #000;color: #fff;padding: 1%;text-align: center;}"
            + "</style>"
            + "</head>"
            + "<body>";
    
    
    String htmlEnd=
            "</body>"
            + "</html>";
   
    void ConectOn(int Id){
        int idT = Id;
        PreparedStatement prepStatement;
        conexionBD conOn = new conexionBD();
        try{
            conOn.Conectar();
            prepStatement =
                    conexionBD.conec.prepareStatement
                                    ("UPDATE maestros SET "
                                       +" Estado='1' "
                                    +"WHERE Id_maestro="+idT+" ");
            int resultado = prepStatement.executeUpdate();
        }catch(SQLException except){
            out.print("ERROR SQL al Cambiar estado 'CONECTADO' - Exception "+except);
        }
    }
    
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
            out.println("<title>Servlet login</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet login at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *http://localhost:8080/CUTONALA/login
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
        /*
        Tabla: usuario
                   Campos:
        id (int-11), usuario (varchar-60), password (int-11), Nivel (int-11)
        */
        PrintWriter out = response.getWriter();
        @SuppressWarnings("UnusedAssignment")
        HttpSession sesion = request.getSession();
        @SuppressWarnings("LocalVariableHidesMemberVariable")
        String userCode,typeUser, password;
            typeUser=request.getParameter("categoryUser");
            password = request.getParameter("password");
            password  = encriptMD5(password);
            userCode = request.getParameter("userCode");
        String sql;
        sql="SELECT * FROM maestros WHERE codigoDocente='"+userCode+"' OR Usuario='"+userCode+"' AND password='"+password+"' ";
        try { 
            conexionBD conLog = new conexionBD();
            conLog.Conectar();
            if ( conexionBD.conec != null ){ 
                conexionBD.st = conexionBD.conec.createStatement(); 
                conexionBD.rt = conexionBD.st.executeQuery(sql);
                while(conexionBD.rt.next()){
                    int Id = conexionBD.rt.getInt("Id_maestro");
                    String user = conexionBD.rt.getString("Usuario");
                    String valPassword=conexionBD.rt.getString("password");
                    int nivelAcceso=conexionBD.rt.getInt("privilegio");
                    switch (nivelAcceso) {
                        case 1:
                            if(typeUser.equals("administration")){
                                if(password.equals(""+valPassword+"") && user.equals(user)){
                                    ConectOn(Id);
                                    sesion = request.getSession(true);
                                    sesion.setAttribute("admin", user);
                                    sesion.setAttribute("id", Id);
                                    sesion.setAttribute("acceso",nivelAcceso);
                                    response.sendRedirect("administration/admin.jsp");
                                }else { }
                            }
                            break;
                        case 2:
                            if(typeUser.equals("teacher")){
                                if(password.equals(""+valPassword+"") && user.equals(user)){
                                    ConectOn(Id);
                                    sesion = request.getSession(true);
                                    sesion.setAttribute("userTeacher", user);
                                    sesion.setAttribute("id", Id);
                                    sesion.setAttribute("acceso",nivelAcceso);
                                    response.sendRedirect("http://localhost:8080/CUTONALA/docentes/inicio.jsp");
                                }else{ }
                            }
                            break;
                        default:
                            out.print(
                                    "<script type='text/javascript'>"+
                                            "alert('Informacion Incorrecta');"+
                                            "</script>");
                            out.print("<p>Error al Ingresar<a href='index.html'>Regresar</a></p>");
                            break;
                    }
                }
            }
            if(typeUser.equals("administration")){
                        out.print(
                                   htmlFirst+
                                    "<div class='error-info'>"+
                                       "<h1 >Error en la Contraseña o en el Usuario </h1><br>"
                                        +"<h2>Error al Ingresar Como Administrador, Informacion Incorrecta</h2>"
                                        +"<center>"
                                            +"<a href='index.html'>"
                                                +"<button>Reintentar</button>"
                                            +"</a><br><br><br>"
                                            + "<img src='imgs/Logo-UDG.png' ><br>"
                                        +"</center>"
                                        +"<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>"
                                        +"<center>"
                                            +"<p>"
                                                +"Cualquier Duda con la contraseña o usuario Contacte con otro administrador"
                                            +"</p>"
                                        +"</center>"
                                        +"</div><br><br><br>"
                                        +"<footer>"
                                            +"Centro Universitario de Tonalà - Todos los Derechos Reservados &copy;"
                                        +"</footer>"    
                                    +"</div>"+
                                    htmlEnd
                                );
            }else if(typeUser.equals("teacher")){
                        out.print(
                                    htmlFirst+
                                    "<div class='error-info'>"+
                                       "<h1 >Error en la Contraseña o en el Usuario </h1><br>"
                                        +"<h2>Error al Ingresar Como Profesor, Informacion Incorrecta </h2>"
                                        +"<center>"
                                            +"<a href='index.html'>"
                                                +"<button>Reintentar</button>"
                                            +"</a><br><br><br>"
                                            + "<img src='imgs/Logo-UDG.png' ><br>"
                                        +"</center>"
                                    +"<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>"
                                    +"<center>"
                                       +"<p>"
                                          +"Cualquier Duda con la contraseña o usuario Contacte con el administrador"
                                       +"</p>"
                                    +"</center>"
                                    +"</div><br><br><br>"
                                    
                                    +"<footer>"
                                        +"Centro Universitario de Tonalà - Todos los Derechos Reservados &copy;"
                                    +"</footer>"+
                                    htmlEnd
                                );
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
