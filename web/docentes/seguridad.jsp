<%-- 
    Document   : seguridad
    Created on : 1/02/2018, 04:41:05 PM
    Author     : bryan
--%>
<%@include file="formats/dtosDocente.jsp" %>
<%@page session="true" %>
<% if(userTeacher!="" && acceso!=null){ %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="Authors" content="Eduardo Vargas - Bryan Franco ">
        <meta name="viewport" content="width=device-width, initial-scale=1">
            <title>Seguridad Docente</title>
        <link rel="shortcut icon" href="../assets/imgs/cut.jpg" >
        <link rel="stylesheet" href="../assets/css/securityStyles.css">
        <link href="../assets/css/library/fontsIcons.css" rel="stylesheet">
        <link rel="stylesheet" href="../assets/css/library/materialize.min.css">
    </head>
    <body>
         <!-- Menu -->

<nav class="teal lighten-2 z-depth-2">
  <div class="nav-wrapper">
    <a href="#!" class="brand-logo">
        <img src="../assets/imgs/cut.jpg" class="responsive-img circle" style="width: 10%;padding:0%;" >
    <% out.print(Nombre); %>
    </a>
    <a href="#" data-activates="mobile-collap" class="button-collapse">
      <i class="material-icons">menu</i>
    </a>
    <ul class="right hide-on-med-and-down">
      
      <li>
        <a href="sass.html">Añadir Alumno
          <i class="material-icons right">person_add</i>
        </a>
      </li>
      <li>
          <a href="registroMaterias.jsp">
          Añadir materia
          <i class="material-icons right">add_circle</i>  
        </a>
      </li>
      <li>
        <a href="#" data-activates="mobile-collap" class="mobile-col">
      <i class="material-icons">dashboard</i>
    </a>
      </li>
      <!-- Dropdown Trigger -->
      <li>
        <a class="dropdown-button" href="#!" data-activates="dropdown4">
          Menu
          <i class="material-icons right">menu</i>
        </a>
      </li>
    </ul>
    <ul id="mobile-collap" class="side-nav teal darken-4">
      <li>
        <div class="user-view">
          <div class="background">
            <img src="../assets/imgs/blue-back.jpg" class="responsive-img">
          </div>
          <a href="#!user"><img class="circle" src="../assets/imgs/cut.jpg"></a>
          <a href="#!perfil">
              <span class="white-text name" style="font-size: 80%;"><% out.print(Nombre+" "+Apellidos); %></span>
          </a>
          <a href="maestros/perfil.html">
              <span class="white-text email"><%=Email%></span>
          </a>
        </div>
      </li>  
      <li>
        <a href="sass.html" class="white-text">
        <i class="material-icons left">person_add</i>
        Añadir Alumno
        </a>
      </li>
      <li>
        <a href="registroMaterias.jsp" class="white-text">
         <i class="material-icons left">add_circle</i>
         Añadir Materia
        </a>
      </li>
      <li>
        <a href="../formats/logout.jsp" class="white-text">
        <i class="material-icons left">close</i>
        salir</a>
      </li>
    </ul>
  </div>
</nav>
<!-- Dropdown Structure -->
<ul id="dropdown4" class="dropdown-content teal lighten-2 white-text">
  <li class="teal darken-2"><a href="#!" class="white-text">Alumnos</a></li>
  <li class="divider"></li>
  <li class="teal darken-2"><a href="#!" class="white-text">Clases</a></li>
   <li class="divider"></li>
   <li class="teal darken-2"><a href="inicio.jsp" class="white-text">Inicio</a></li>
  <li class="divider"></li>
  <li class="teal darken-2"><a href="../formats/logout.jsp" class="white-text">Salir</a></li>
</ul>
<!-- fin menu -->



<div class="card-panel z-depth-0 transparent">
    <div class="row">
        <div class="col s12 m12 l9 xl9">
            <div id="sectChngePass" class="card-panel z-depth-4">
            <h4 class="center">Ingresa nueva Contraseña</h4>
            <div class="row">
              <form class="col s12" id="formChngePsw" method="POST" action="">
                <div class="row">
                  <div class="input-field col s12 m6 l12 xl6">
                    <input id="passwordNwe" type="password" name="passwordNwe" 
                           class="blue-back-text validate" required="">
                    <label for="passwordNwe" class="black-text">Contraseña Nueva</label>
                  </div>
                  <div class="input-field col s12 m6 l12 xl6">
                    <input id="confPassw" type="password" name="confPassw" 
                           class="black-text validate" required="">
                    <label for="confPassw" class="black-text">Confirmar contraseña</label>
                  </div>
                </div>
                <div class="row">
                  <div class="col s6 m6 l6 xl6">
                      <input id="chngePassw" type="submit" class="btn" value="cambiar">
                  </div>
                    
                  <div class="col s6 m6 l6 xl6">
                      <input type="reset" class="btn red darken-4" value="cancelar">
                  </div>
                </div>
              </form>
                <div id="resultChngePssw"></div>
            </div>
            </div>
            
            <div id="sectCdesClass" class="card-panel z-depth-4">
                <h4 class="center">Codigos de clase <span class="material-icons">security</span></h4>
                <div class="divider z-depth-4"></div><br>
                
            </div>
        
        </div>
		<div class="col s12 m12 l3 xl3 transparent">
                    
			<a href="#security" class="col s6 m6 l12 xl12 teal darken-2 hoverable center white-text tooltipped passw"
                           data-position="top" data-delay="50" data-tooltip="Cambiar contraseñas">
			 	<div>Contraseña <span class="material-icons">security</span></div>
			 </a>
			 
			 <a href="#security" class="col s6 m6 l12 xl12 teal hoverable darken-2 center white-text tooltipped cdesClss"
                            data-position="top" data-delay="50" data-tooltip="Codigos de clase">
			 	<div>Codigos <span class="material-icons">security</span></div>
			 </a>
                </div>
    </div>
</div>














   

    <script src="../assets/js/library/jquery-3.2.1.min.js"></script>
    <script src="../assets/js/library/materialize.js"></script>
    <script src="../assets/js/library/materialize.min.js"></script>
    <script src="../assets/js/toChangePass.js"></script>

    <script type="text/javascript">
      $( document ).ready(function(){
        $(".mobile-col").sideNav();
        $(".button-collapse").sideNav();
         $('.dropdown-button').dropdown({
            inDuration: 500,
            outDuration: 225,
            constrainWidth: true, // Does not change width of dropdown to that of the activator
            hover: true, // Activate on hover
            gutter: 0, // Spacing from edge
            belowOrigin: false, // Displays dropdown below the button
            alignment: 'left', // Displays dropdown with edge aligned to the left of button
            stopPropagation: true // Stops event propagation
          }
        );
      });
    </script>
    <footer class="page-footer teal darken-4">
          <div class="container">
            <div class="row">
              <div class="col l6 s12">
                <h5 class="white-text">Centro Universitario de Tonalá</h5>
                <p class="grey-text text-lighten-4">
                  Universidad de Guadalajara
                </p>
              </div>
              <div class="col l4 offset-l2 s12">
                <h5 class="white-text">Enlaces <i class="material-icons right">link</i> </h5>
                <ul>
                  <li><a class="grey-text text-lighten-3" href="#!">Perfil</a></li>
                  <li><a class="grey-text text-lighten-3" href="#!">Bandeja</a></li>
                  <li><a class="grey-text text-lighten-3" href="#!">Materias</a></li>
                  <li><a class="grey-text text-lighten-3" href="#!">Alumnos</a></li>
                </ul>
              </div>
            </div>
          </div>
          <div class="footer-copyright">
            <div class="container">
            © 2017  CUTONALÁ - UDG
            <a class="grey-text text-lighten-4 right" href="#!">
               <i class="material-icons right">developer_board</i>
               Manual de usuario</a>
            </div>
          </div>
          
        </footer>
    </body>
</html>
<%
    conexionDocent.closeBD();
%>
<% }else{
        response.sendRedirect("../formats/logout.jsp");
    }
%>