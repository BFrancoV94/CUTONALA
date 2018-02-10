<%-- 
    Document   : formEmail
    Created on : 9/06/2017, 01:46:30 AM
    Author     : bryan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%
    HttpSession sesion = request.getSession();
    String admin = (String)session.getAttribute("admin");
    String userTeacher = (String)session.getAttribute("userTeacher");
    Integer acceso = (Integer)session.getAttribute("acceso");
    Integer Id = (Integer)session.getAttribute("id");
    String user;
    if(admin!="" && acceso!=null || userTeacher!="" && acceso!=null){
        
%>
    <!DOCTYPE html>
    <html lang="es">
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Eviar Correo</title>
            <link rel="stylesheet" href="../../css/form-email.css"/>
        </head>
        <body>
            
            <div class="box-form">
                <h1><b>Ingresa tu Correo</b></h1>
                <form action="bodyEmail.jsp" method="post" >
                    <br><br><br>
                    <label id="lbelTitleCorreo">Correo Electronicó</label>
                    <label><img  src="../../imgs/gmail-icon.png" id="img-gmail" /></label>
                    <label><img src="../../imgs/hotmail-icon.png" id="img-hotmail"/></label>
                    <label><img src="../../imgs/outlook-icon.png" id="img-outlook" /></label>
                    <br>
                    <input type="txt" name="correo" title="Ingresa tu Correo" required=""/>
                    <select name="typeHost" >
                        <option value="@gmail.com" > @gmail.com</option>
                        <option value="@hotmail.com" > @hotmail.com</option>
                        <option value="@outlook.com" > @outlook.com</option>
                    </select>
                    <br>
                    <label>Contraseña</label><br>
                    <input type="password" name="password" title="Ingresa tu Contraseña" required=""/> 
                    <br>
                    <input type="submit" name="prepEmail" title="Continuar" value="Continuar"/>
                </form>
            </div>
            
        </body>
    </html>
<% } %>