<%-- 
    Document   : processEmail
    Created on : 9/06/2017, 11:29:26 PM
    Author     : bryan
--%>

<%@page import="process.sendEmail"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            sendEmail email = new sendEmail();
            String para = request.getParameter("para");
            String mensaje = request.getParameter("mensaje");
            String asunto = request.getParameter("asunto");
            out.print("<p>"+para+"</p>");
            out.print("<p>"+mensaje+"</p>");
            out.print("<p>"+asunto+"</p>");
                boolean resultado = email.enviarCorreo(para, mensaje, asunto);
                if(resultado == true){
                    out.print("CORREO ELECTRONICO CORRECTAMENTE ENVIADO....."+"\n\n"+"<a href='formEmail.jsp.jsp'>VOLVER AL Enviar Otro</a>");
                    out.print("<h1>"+ resultado +"</h1>");
                }else{
                    out.print("CORREO ELECTRONICO NO ENVIADO....."+"\n\n"+"<a href='formEmail.jsp'>Reintentar</a>"); 
                    out.print("<h1>"+ resultado +"</h1>");
                }            

            
                out.print("<h1>"+ resultado +"</h1>");
        %>
    </body>
</html>
