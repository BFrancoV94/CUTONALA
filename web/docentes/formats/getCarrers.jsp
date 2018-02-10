<%-- 
    Document   : getCarrers
    Created on : 5/02/2018, 02:05:37 PM
    Author     : bryan
--%>
<% String option=""; %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="dtosDocente.jsp" %>
<%
    conexionBD conGetCarrers = new conexionBD();
    int idCarrera;
    if(userTeacher!="" && acceso!=null){
        idCarrera = Integer.parseInt(request.getParameter("passwordNwe"));
        try{
            int querySucc;
            conGetCarrers.Conectar();
            String sqlDetail="SELECT * FROM materias WHERE Id_carrera="+idCarrera+" ";
            conGetCarrers.st=conGetCarrers.conec.createStatement();
            conGetCarrers.rt=conGetCarrers.st.executeQuery(sqlDetail);
            while(conGetCarrers.rt.next()){
            
                option = 
                "<option value='"+conGetCarrers.rt.getInt("Id_materia")+"'"
                 +"data-icon='../assets/imgs/cut.jpg' class='right circle'>"
                        +conGetCarrers.rt.getString("nombre_m")+
                "</option>";
            }
            out.print(option);
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
    }else{
        
    }
%>