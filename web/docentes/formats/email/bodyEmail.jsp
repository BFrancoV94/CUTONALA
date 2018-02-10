<%-- 
    Document   : bodyEmail
    Created on : 9/06/2017, 02:53:46 AM
    Author     : bryan
--%>



<%@page import="process.sendEmail"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mensaje</title>
        <link rel="stylesheet" href="../css/form-email.css"/>
    </head>
    <body>
        
        <%
            sendEmail email = new sendEmail();
            String correo = request.getParameter("correo");
            String host = request.getParameter("typeHost");
            String clave = request.getParameter("password");
            String mail = correo+host;
            
            if(host.equals("@gmail.com")){
                email.setHost("smtp.gmail.com");
            }else if (host.equals("@hotmail.com") || host.equals("@outlook.com") ){
                email.setHost("smtp-mail.outlook.com");
            }else{}
            email.setCorreoE(mail);
            email.setPassword(clave);
           
         
            String c,p,m;
            c = email.getCorreoE();
            p = email.getPassword();
            m = email.getHost();
            //out.print("correo ("+c+") - password ("+p+") - type ("+m+")");
            
            //out.print("correo: "+de+host+" - pass: "+clave);
        %>
        <div class="box-SendEmail">
            <h1>Enviar Mensaje</h1>
            <form action="processEmail.jsp" method="post">
                <label> DE : <% out.print(""+mail+"");%></label><br>
                <label> Para </label><input type="email" name="para" required=""> 
                <br>
                <label>Asunto: </label> <input type="text" name="asunto" placeholder="Asunto" required="">
                <br>
                <textarea name="mensaje" cols="40" rows="10"></textarea><br>
                <input type="submit" name="sendMessage" value="Enviar" title="Enviar Mensaje">
            </form>
        </div>
        
    </body>
</html>
