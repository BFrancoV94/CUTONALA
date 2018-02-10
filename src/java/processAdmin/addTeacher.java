
package processAdmin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import processBD.conexionBD;

/**
 *
 * @author bryan
 */
public class addTeacher extends HttpServlet {

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
            out.println("<title>Servlet addTeacher</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addTeacher at " + request.getContextPath() + "</h1>");
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
            HttpSession sesion = request.getSession();
            conexionBD conAdd = new conexionBD();
            PreparedStatement prepStatement;
            String nombreMaestro,apellidos,correo,usuario,password,passConfirm;
            int codigoDocente = Integer.parseInt(request.getParameter("CodeTeach"));
            nombreMaestro = request.getParameter("name");
            apellidos = request.getParameter("lastName");
            correo = request.getParameter("email");
            usuario = request.getParameter("userName");
            password = request.getParameter("password");
            passConfirm = request.getParameter("passConfirm");
            if(passConfirm.equals(password)){
            try{
                //obtengo la conexion
                conAdd.Conectar();
                prepStatement = conexionBD.conec.prepareStatement("INSERT INTO maestros "
                                                                 +"( codigoDocente, nombre_ma , Apellidos, correo , Usuario , password , privilegio , Estado ) "
                                                                 +" VALUES ("
                                                                        +"'"+codigoDocente+"' ,"
                                                                        +"'"+nombreMaestro+"' ,"
                                                                        +"'"+apellidos+"' ,"
                                                                        +"'"+correo+"' ,"
                                                                        +"'"+usuario+"' ,"
                                                                        +"'"+password+"' ,"
                                                                        +"'2' ,"
                                                                        +"'0' ) ");
                int resultado = prepStatement.executeUpdate();
                if (resultado > 0) {
                    out.print("<script> alert('Se ha Guardado un Nuevo Registro');</script>");
                    out.print("<h1 lang='center'>Exito al Guardar un Nuevo Maestro</h1>"
                            + "<center>"
                                + "<a href='http://localhost:8080/CUTONALA/administration/admin.jsp'>Regresar</a>"
                            + "</center>");
                }else{
                    
                }
            }catch(SQLException ex){
                 out.print("Error SQL al guardar Registro "+ex+"Registro Fallido ");
            }finally{ 
                if ( conexionBD.conec != null ){ 
                        try{ 
                            conexionBD.conec.close(); 
                            conexionBD.conec.close(); 
                        }catch( SQLException e ) { 
                            out.print("<h1>"+e.getMessage()+"</h1>"); 
                        } 
		    }
                }
            }else{
                out.print("<h1 align='center'>Las Contraseñas no son Iguales</h1>"
                        + "<center>"
                            + "<a href='http://localhost:8080/CUTONALA/administration/actions/añadirMaestro.jsp'>Volver a Intentar</a>"
                            + "<br><a href='http://localhost:8080/CUTONALA/administration/admin.jsp'>Volver al Menu de Administracion</a>"
                        + "</center>");
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
