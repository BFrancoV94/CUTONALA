<%-- 
    Document   : dtosDocente
    Created on : 18/12/2017, 02:32:21 PM
    Author     : bryan
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="processBD.conexionBD"%>
<%@page import="process.Querys"%>
<%@page session="true"  %>
<%! 
    //variables globales lista para usarlas en otros archivos
    String Nombre,Apellidos,Email; int idCarrera,CodigoDocente,Privilegio;%>
<%
     //creo mis objetos tipo conexion
    conexionBD conexionDocent = new conexionBD();
    HttpSession sesion = request.getSession();
    String userTeacher = (String)session.getAttribute("userTeacher");
    Integer acceso = (Integer)session.getAttribute("acceso");
    Integer id = (Integer)session.getAttribute("id");
    Querys query = new Querys();
        try{
            conexionDocent.Conectar();
            String sqlDetail="SELECT * FROM maestros WHERE Usuario='"+userTeacher+"' ";
            conexionDocent.st=conexionDocent.conec.createStatement();
            conexionDocent.rt=conexionDocent.st.executeQuery(sqlDetail);
            while(conexionDocent.rt.next()){
                CodigoDocente = conexionDocent.rt.getInt(2);
                Nombre = conexionDocent.rt.getString(3); 
                Apellidos = conexionDocent.rt.getString(4);
                Email = conexionDocent.rt.getString(5);
                idCarrera = conexionDocent.rt.getInt(8);
            } 
                if(Privilegio==1  | Privilegio==3){
                    Privilegio=0;
                }else{}
            
        }catch(SQLException exc){
            out.print(exc.toString());
            out.print("<center>"
                        +"<p>"
                             +"Ha Ocurrido Un Error "+exc.getMessage()+"<br>"
                             +"Redirija en este Link(<a href='inicio.jsp'>Cargar de Nuevo</a>)"
                        +"<p>"
                     +"</center>");
        }finally{ 
            if ( conexionBD.conec != null ){ 
                    try{ 
                        conexionBD.conec.close(); 
                        conexionBD.st.close(); 
                    }catch( SQLException e ) { 
                        System.out.print("<h1>"+e.getMessage()+"</h1>"); 
                    } 
            }
        }
%>
